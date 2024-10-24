Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A812CD0E415
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTdkJ5P6J2KL4Qt0vXA0RPNETkbTyLxenzCZPLKwNyw=; b=PlFWc0oClel1WMClTMp+73Ndys
	njP4S9QpkYA30xm6wwUdPwZtXFBXKFdnPy2BGDMSfgP4/QAl6IL9XzBRkYNxxHzpH2yE7pG0O6FIJ
	7rv0vFUOXcc7yA0H8R6dUb2xJy5YD2/Ly9WC+uDrHyqBvHZ0CXkjGNq3FqkSeyfU+7s0LSZq9dmpB
	/rJjMTgUjW+ZEcMHwpkbL2I5Of9f670MeU94ayFve7PhSB4nwKU8trgpBkgskFKpO/YqNQcUqOQXM
	WKI8oWkH91Wrt71+GQHoFnrl+2nvM+M6Iqs+Ge0JfBbtYiby8SZIgt9+5827d9daUo40JdTmMamig
	0YWOUO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44RK-00000001jKb-3iRh;
	Thu, 24 Oct 2024 20:28:14 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IJ-00000001iBW-3sDT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801125; x=1730405925; i=wahrenst@gmx.net;
	bh=KTdkJ5P6J2KL4Qt0vXA0RPNETkbTyLxenzCZPLKwNyw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FWZYMB4i6pII+5Cu3Z5TKjNhZw3OeczRSY9NS1oKV+6nCpO5qBxWkFSMzQy3ryjy
	 sTBPl6mymi8N8pfcjQTGHeixmz1FlytcthQTMKfUKj6lj84V+VBjLmBq3UgalJkva
	 JEaQFMRjgNbNbdMEaPmK+wAshzpYPXvTCn17cGjSsKzmWYik3rbrkKHlLo1ybXYgw
	 nmpXqDpNELx0KrelSEq2Bs+U+6YillRq8IJ0viD5X7COpWmtluzO7vibsakKMu5Bg
	 Ozx3pTFWgU0KSPGK/Rcz7+ZbUURtla0EhwLwSQm4nJlNpYgFvArJgR7y1qypvMbPj
	 CC9yErUmZ94S0rAR6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1taMqF1UCo-00fMm2; Thu, 24
 Oct 2024 22:18:45 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/9] dmaengine: bcm2835-dma: add suspend/resume pm support
Date: Thu, 24 Oct 2024 22:18:30 +0200
Message-Id: <20241024201837.79927-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uurm7aNTi5uMv/4ThSbmO9f2OZgP0MZnWhjwfJlbBd5reY0RN+4
 IAVrERajL/SXD91WlaaM5YamNsh/dSKucmU55D5SaAEEQkoqZBY/JHgqNxRpe0I5XTRShXL
 3u/VkDO3dMzYYk6cWKJTvkzd/3tQ0Ng04QCY6SWoGEJClobXZpUdzZj1vDLuxu1P9YxyRx2
 DKKtsV1iGb8R5B/hQ1oVQ==
UI-OutboundReport: notjunk:1;M01:P0:+I6/p0Kc/ug=;MnMyC57laSsmSHRtvqZJ29mp/Nb
 ePBEqIpKuQ7RKFK7KACh+NKHeayIpTFmIwoSOdWHe1XRErBmYkSoLGDQhOKUpPUTsWVcFue/i
 rUMTicPtvX9cqyD1KQ4eJvQvH+nWcurtOmNmBXo+bi0dofmvddlAj5McAgWtBvMG6GYIFIrN9
 oE16Y/uJh2Hd/R/euG0xJDULNTZbEw6tgfXATdhS3kFFfnSNUfV4EWSyfW73EmSIF6hrN2Hk5
 B6gS5N/IdG7wtL26mujzFnpR0JNUP+xJ/bCsn3e7pHmNOgrGvsZ5FHx/uxVu6hoJ8/LLOsp5j
 X+dXXB6VOjJHgV8mQD2mmBETQaZkP/A3mECb8xigYDHAL85umvvilsWxnTpQs2NnS/8PKYT73
 0S8ZqdPMEymxnWMvafKsHgo4IIj9k9pCTXc7kg0U8jtrowurSIYRfvqmvwEKjXAVFqD04rQbr
 gfwFAg3nzhPJqQEmiypB8qeicZn4Fn1nGB6b3OByUjjwQJahLl+n4qPrB+H0dTnj1lw5pvP0f
 g+HpQXexssH1UuWRKnCBu2LY8DUUjarhkvk34n9DmeqFB3hLOm0VwBw6b0rSLCnkgcbEgh3my
 l8rtV8v9UH6OZMRY3/p2p/6fD4jBiWfNovx09+EJx5dbyFPaDmTlL0e2VnLWbWhJVmLq4yGwo
 abyowlcPDncsKoUBF/ywor+7bT9STzwNIpIAC8BLXDpYwUCNWiSG5k6O1K5XdwOpwMRWObVyi
 j3obmgQUA3H0m1j5dleEczNfwxENYHJo8t1h3CMl/C6Zq2F8/ZEAicuhUFBP8n3BEBQWB/B8P
 qcoHpZmtzh6PglEjii4PGTrQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131856_413350_2021BB46 
X-CRM114-Status: GOOD (  12.16  )
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

bcm2835-dma provides the service to others, so it should
suspend late and resume early.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index e1b92b4d7b05..647dda9f3376 100644
=2D-- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -875,6 +875,35 @@ static struct dma_chan *bcm2835_dma_xlate(struct of_p=
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
+		if (readl(chan_base + BCM2835_DMA_ADDR)) {
+			dev_warn(dev, "Suspend is prevented by chan %d\n",
+				 c->ch);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static int bcm2835_dma_resume_early(struct device *dev)
+{
+	return 0;
+}
+
+static const struct dev_pm_ops bcm2835_dma_pm_ops =3D {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late,
+				     bcm2835_dma_resume_early)
+};
+
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	struct bcm2835_dmadev *od;
@@ -1033,6 +1062,7 @@ static struct platform_driver bcm2835_dma_driver =3D=
 {
 	.driver =3D {
 		.name =3D "bcm2835-dma",
 		.of_match_table =3D of_match_ptr(bcm2835_dma_of_match),
+		.pm =3D pm_ptr(&bcm2835_dma_pm_ops),
 	},
 };

=2D-
2.34.1


