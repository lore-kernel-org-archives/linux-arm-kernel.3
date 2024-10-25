Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114BCD0C5FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTdkJ5P6J2KL4Qt0vXA0RPNETkbTyLxenzCZPLKwNyw=; b=XZFSOrhnzdvIqAxrn31hr0rMmX
	nhELDjTCPHXCl92IMd7RVT/QWASjb0yNmZA+AQAbp/1J60/xvCFwjupJS4XQPCjfvYLhfXtuKJQJ2
	uJn7jiZVxNuv+11KF0D5g8w07kcvEmFWdsXyU4EF+y8IHXW19co2Ox5T4x6CamDd6hnbdd20Qj5Tc
	a/7hMeqSfYbSYIhSF6LsOQottdk74GmpgK5DLH7FbEuhu8AaVdfvQ4M3kYIFaU6IZYhQ5TWh3Fc3F
	S4lSYMslqhoa+tblvT0H/i9Jx+AaFOhvux1oANkEFxr9JVCEmbd1pllR5h1F70ArBKWqZi6Z5v737
	Qhuyh4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hjc-00000003Nq7-1sv5;
	Fri, 25 Oct 2024 10:40:00 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HgR-00000003NPY-0pBh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729852592; x=1730457392; i=wahrenst@gmx.net;
	bh=KTdkJ5P6J2KL4Qt0vXA0RPNETkbTyLxenzCZPLKwNyw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sTuq01QskJq2zdiAiIljyIGlG2h1rEWoc/ghG7FS2b1oNWb1biDLhZyfQLPCtDhz
	 4DfqY2404X1N8hd7jUSizN+ACfzYPc8jwUuneL0b2lV3RFoC6roUKh035M4I0h27Q
	 qi589UXd/Xwmn0Xmv+YpbB1mW7H7IZJVNyuQb/YCN7amnUmFbWDEfJHHl6tOzAYxS
	 hdAx4lXb6B8jH33Rklu5QdNGh0ZNB6Mjv53WFEhXVzgU4Tj5m7BoSF8yvKSpO2/zf
	 7gGh35/Lcp9Ej09sJUm/9xHjuHf/Wj9IBU7G4/j8czTXI7uqHWrtb2Du5PeyNDL4R
	 FACT4hUAsvQgW76N7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbBu-1tvhHN3fXy-011DvW; Fri, 25
 Oct 2024 12:36:31 +0200
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
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V5 2/9] dmaengine: bcm2835-dma: add suspend/resume pm support
Date: Fri, 25 Oct 2024 12:36:14 +0200
Message-Id: <20241025103621.4780-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025103621.4780-1-wahrenst@gmx.net>
References: <20241025103621.4780-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9ySflbT0hiT4UVGNuvyyRzkwct+mz5PnD601aE9k6dVwc3IIdMJ
 9lvj5fWE+a2G9m7siGoDQyifgvrh3Q6BnxgJVGRvEGIKotsSDjiI4VIxSKZkLEiMBJika6y
 q27k5rxf6BbGefsUmf5Pa3EOTRGST2FFI91IynMUbxtgnob6y6X57jSW3SB5zMJGY1HHy/+
 lmOPdRwD4PhntEGUfAN/w==
UI-OutboundReport: notjunk:1;M01:P0:omwtgH910K0=;h9ZuJ0bANMewdfvjfbq8oysc/QH
 kZaXBTyFt7ejXXdTw9ffWKtJQ2L7lbl/boxn7T+kcmsNYd65+yWejg1lT1yC7FJuUqhQY0kSd
 6Ub/Vh2rMAVIQp/ECA87TiM+sZ5j7/pZO5k3+tRgHVv1n7FozbhUft4ZZIVV74tNvLFH8hAf6
 hBpW3FPi+pVmEtS5R2+qo0WqNKhie94/PHHsIKzbZMRNm0Y6C55COM+XWHOOGnBEZle3+YZjv
 jVNoG6F9XrnEIrdJ9ZwPIylXin0Bxyd/Z+dt3er2m7OQLy3qb9LFxwyUjGjAGMvrw3fLQAQJa
 yrkxlkkGaaFjfzGHobMvL23XkbeuXpIu6UG4AS/pUirLc1Y7qX9IXNtogAGVrpDrXAz882xSR
 n75gDVmw+D0+MFnbeN90gg1LdxfWJyvzYUultUZvoHzWmZCc37/usUm4mjzAdwaTq4xds+gWG
 aQf1LJbG5CEfBFkH6KXdlNVDPvnn7ZlQWF+2rspN4iE1LL6bTrlLf3ZYGSblNvKyP1peMBZmc
 2kjm8cUJog8BXgYR1jWNXEaOQHHvgxdlu3FnBpTCWVh0q5/Cfwfqfdm8UwXGFG+awOeYYPCQC
 +mGYjTVrb9asXnkIHUmqKV5RGWYkM8vr0FoMTkXAnon5kv9X6Uo92BSJCeZ/1ObY8+kKew5hD
 FoDvYF4UP8DJZ5H3rgDUCmOG5C2IOryK8XYSVoZk4Qjfj9sz7p6LFDzVHrJMWyJZ3GLJmpDma
 NEr0vMb0YkeAFo1q3vxJRlrysD9oHmlfI6zu8NF/SX24O4wyDj2uYT2VPWZNLuyzDZvJ+BCpS
 jI4PJXdRQv42b8HQAJNc/XZg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_033643_577433_59C04F8A 
X-CRM114-Status: GOOD (  12.27  )
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


