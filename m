Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CB2E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KqH4XcRMfI2Bxx9Jc3KBc08//bchRqV/s0pS86fK7WM=; b=1m3/23mZ1E6Y88rX73Q216oR12
	I43l1xCB78g448dd2oGcuoNGMUQpiPa0KSVBHx8b8u5PeaqAmaLJCI+oOONG+por6/wWml0mkDAvM
	5ARryTzcYiEFKOtxeg3BPEmJFPO/kNV00Jk19wdUFxhUK6j7Jtu1KPxo/O6JqDqKPDZM6EkGZ8lxP
	QDaAzwGr7pMdY3isXyM1avreRhBoe4FYn8KVJneXLn62j+AcgTUs3C1FJvBgP9KfNc4o4k3OQ3/1i
	m/EQI8x01/dBUtHtLz2zXA8qiGNhq/clFEk2sMHHQXJeMmIKMP7S2uBUwxuypRmWE3LSp8UO9A4CP
	frRhftpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsgQ-0000000DFpR-1DHO;
	Wed, 04 Dec 2024 16:57:02 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsfP-0000000DFgP-2HMb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733331352; x=1733936152; i=wahrenst@gmx.net;
	bh=KqH4XcRMfI2Bxx9Jc3KBc08//bchRqV/s0pS86fK7WM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aA81DUedeBBDb8OShGbLV5xaQPknl1oAzAV69nHEnVYaA1LGSc0UQwAgxAmM/xMn
	 8niKmK/7gpd/gsfdAcUdc7H6mKdzCrq9oc6Bmoz3/+mkMbL8wf/bpK/OIXG2p0R+4
	 YnVoCu9afAjW2yLUq4sNdQFz015QzEWykKyxHjVO4ZcW+d06eCw2LGQ4SZ3GUs1oy
	 /mX7XFJFIBWW6oVDjyDEQmMiVs/HABS0sv0IVEbxSKAdlTBZlgMtI58I585QiZbQ9
	 ft4QdG/PfsqVAhYkvS1YSfc6zHB1obkBn8DuqBPMli2A0lVy99H1JGd5PURYEdAT5
	 4KUyKSYEnFrVjoZ98g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysVs-1tWa1i18Rm-00zghB; Wed, 04
 Dec 2024 17:55:52 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V7] dmaengine: bcm2835-dma: Prevent suspend if DMA channel is busy
Date: Wed,  4 Dec 2024 17:55:46 +0100
Message-Id: <20241204165546.77941-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jVWNY/JhiIagB6hjAtbxJIHHEk6O3uQVXeHtp7cWYzSiDsAxT33
 RNPFSkkItR+7vXzulSTBOUz4Wocw+owg5DHNPmAGKZv5obIzHKbXQcytAqeT6ICFqI9GkYZ
 mRKAXiV6ZD4sAksel1ryFlkSC+u0cWR7XCoQWmKugiu1+6XoeZicVPE1m649hyekwtVTyjl
 slCkAHUG6+/gRm058S0gg==
UI-OutboundReport: notjunk:1;M01:P0:xUThG0gzqyo=;wHv46hJ47n/3uQzskiTPT6xF/v3
 kImqhn8R9Jl+lyExokOjxGFOm0wegV6ld/mk11STMq/zuRXNgETEGHZsJ/Z9C8CRrXA+YzoFv
 3+hQvY6vTJOAloKm/pQwPdJTka6AOcIgZt7SNIoiKHrBv4X1wNtWgWskkNO/YlxZtX+P/QjAG
 0PI/l9duF5FTKgo9E9Jk7VIhMVryPIgZKw1xzeNyaG8Z1owUO8DK4Au3cYRr8xWiOJE9xx5SG
 PITgoylLwf4eqyKu/phnG11VsO8lc0XL0vobNJ3lbNdHe+oS2JAkGR7Qu5/oMn3lrVxH6VaX2
 luZC2fsh13Df3uDg3epTieEAuAf+YfGkUIm0svaS/IWT6OoGPSaYwD5PKj1/iY2/dLOU0YOlT
 +zUHYTHw57n8nu6FZuwX7ffCtMLi8xXr5vj/xtkHnNUJh7zkiAVyc7bd/OIuatVtfoLAnsWCd
 MvLkulkY2OCRsPg6Cz1t54sf0+4Kk8Hy5gLtNeNhY3j4ATFDno3ki++wTN3ohQxOurfTjq0Gf
 tBeWV92hId/J4D5KE0Hr9a3zR+e30dDOY2AhcEBpC4ppdvm5rgCdtEaDB8AwX6Ug4a/qLJE8N
 CFuwga9wQarv3qluD6q98GG4BJPXyJnU4F2RpeIWO78PaSaKZ/3fFSg6oGyvtefom5eUN3QsT
 lX9QeVHSDAtNv5cYEfHOMHq8MHQniVN0zFiFIH7hx9BefUvyyVHCzrz6EWi738Fru4wOV/OBG
 83YYQ+6khxDaFf5F8H3AlRTB3y8+VQYVghcEUtB0aoTiF3xUHV7XYijq+le7Kh5jiz/hWjsBP
 l+KT5yWBEJ/7nQjVHR27mGYw7nNawwUUXQ9wGLPijqn5OTwHRcvuHoNpQuODSR58ghAPWPsI6
 w2xgzu1R69O5ef9o3eRwyWMpFHhhSq6C7xZ8bsPJik6SWUHAeGrkfed4iCz7amfEi6GsNUmnF
 D8hPGmiz6YiCESnV/2FMR9rGHYvw8sZQuc86eAaHAhlrVOAwINoiZe/8X0WDvTGoz+cLFmKRG
 mJQ33wd3mAnAwHD5smANi4qyG35duHwZ80LuBjZ1MZOZByv8JfW1qp7JSB2COg6j2CeaDwKb2
 xVi6mgcBZiDQ4XDBHGkClIqiuhqifV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_085559_863748_8FDDB6A9 
X-CRM114-Status: GOOD (  13.48  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

bcm2835-dma provides the service to others, so it should suspend
late and resume early. Suspend should be prevented in case a DMA
channel is still busy.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/dma/bcm2835-dma.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

Changes in V7:
- improve patch title and changelog
- add explaining comment and drop warning in suspend
- drop empty resume callback

Changes in V6:
- split out of series because there is no dependency

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 7ba52dee40a9..20b10c15c696 100644
=2D-- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -875,6 +875,27 @@ static struct dma_chan *bcm2835_dma_xlate(struct of_p=
handle_args *spec,
 	return chan;
 }

+static int bcm2835_dma_suspend_late(struct device *dev)
+{
+	struct bcm2835_dmadev *od =3D dev_get_drvdata(dev);
+	struct bcm2835_chan *c, *next;
+
+	list_for_each_entry_safe(c, next, &od->ddev.channels,
+				 vc.chan.device_node) {
+		void __iomem *chan_base =3D c->chan_base;
+
+		/* Check if DMA channel is busy */
+		if (readl(chan_base + BCM2835_DMA_ADDR))
+			return -EBUSY;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops bcm2835_dma_pm_ops =3D {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
+};
+
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	struct bcm2835_dmadev *od;
@@ -1033,6 +1054,7 @@ static struct platform_driver bcm2835_dma_driver =3D=
 {
 	.driver =3D {
 		.name =3D "bcm2835-dma",
 		.of_match_table =3D of_match_ptr(bcm2835_dma_of_match),
+		.pm =3D pm_ptr(&bcm2835_dma_pm_ops),
 	},
 };

=2D-
2.34.1


