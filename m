Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62006D0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TppAUiDXkUFwSrv2A2knMxXHQkH96XkM3sjE1E2labc=; b=nGKh7LKd/OOrnQKE/aVNWlCjxx
	+kvD3GtdvdBXTW3QNSrQUXhmWKliyXtGP5/MoiZox/XTwjpmZHjHLl6TEnSYGcqs07YBjpo/6PYw8
	TL36lVBOpPWvJechLs5sbjW22mSIbPEQRWcbTbgxHAHH3fuNSl/74gQjUZUugcnG5aHOoACFBSbtf
	TfIMqoDLwdeg1zyOK/kP42DokFrLymT5Zwjedm/JPChg39mtZTvMZqfsEWpc0JCMtu/M1nSiIuGCw
	xy/uTAqWE1t5WLAq7PXuTrX/18sXRlKkxTC5Oz82owcTvtzW4r8+JWlNEdTeo809RsqH3esy5ynPH
	7dyVAB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hi2-00000003Ngq-2UC8;
	Fri, 25 Oct 2024 10:38:22 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HgR-00000003NPZ-0p4U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729852593; x=1730457393; i=wahrenst@gmx.net;
	bh=TppAUiDXkUFwSrv2A2knMxXHQkH96XkM3sjE1E2labc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tbVyV4xmtEPMhA3DvUpg0Jw/N1a4F2X2KKzCpHgsSj0xDUxTLDBFMKCSfoFwlIy2
	 vDtGZgSHpvDtOK2dL6OcZ2ICIUzLZeS+ljjRJxsTp/AqOLKTqNE/FuiPB6mwlSd8X
	 HCGBwNca9R2fvYbyEyZz2OSkz/thjqc9bkz5kZ2FabEcJi3OiQ73vgLOZRIkRvb0j
	 njph056umZyVHkLBcYHnalBxHNPvnKKsOtqhNla1xaT308YMVXCQGJQiYtcyBtyLM
	 NHqJcaC6UqMoWjYsvgNwd9KWRgtpG143MovBAzOMrNOTzAkWv0Q+cBP3NsW4sWrf7
	 hy13a76cRP4mUQ1UOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXyJ-1tOFGY0ryZ-00POCJ; Fri, 25
 Oct 2024 12:36:33 +0200
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
Subject: [PATCH V5 4/9] mmc: bcm2835: Introduce proper clock handling
Date: Fri, 25 Oct 2024 12:36:16 +0200
Message-Id: <20241025103621.4780-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025103621.4780-1-wahrenst@gmx.net>
References: <20241025103621.4780-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+Di2pOcsa3c3E/0JQDbVqLTw7ySipdBClQ9F/jLlbeQzzRxZ232
 yDWxEVys72iA6MJRo1mUc7mW//tb7EZO5x8R8vS4QVuCdF0xUENqvAZX4ThVdfxDA3kMxg9
 FgzpKa9DTwgbt9nE3gAkaOXKsz/MQTt48lCSrId6nhTj+44oURFGsMXI8iN3zDfQMu/LewP
 k6bEWQhIR5AMhkuISMu9w==
UI-OutboundReport: notjunk:1;M01:P0:DeStJdH3WkU=;dl+pokVxqHve1DeFpO1IWkIos7B
 NL9bIHQWsfHyBrcFpODuMX0BfcrTLC7ylSEQegr93PrtNRzhiY+MwDnff6soAJEJP5FpBad+L
 pRil+1xmSn80iEi64hXM2iCFi65CBDZItjTqanf5RnArzPLSveAWnecA81mJUmh6fHaIuLojr
 +8SA8vURLGQdQP124dyYLb9QtMkGctEm5YIPtNrHqfWKAqS4EbbIYwZseS2QCb8NFH0rQ7+sH
 M/kJ/ndEZ3qiaXS3TKkvn8jCO/1Sn+4+eBLr7Ajr1BOAaO2xpsLdCIC7gH3wPWwPAYzXwnyPT
 Ov7v/THpazrlFXYtaXkX07A5acBWslOtgsnxjuxtl4hxvhy+s5TESFBj8qEp7cHdlf3EyHSqV
 FATAFz576Yx9HSFppvyiXxeakkKG8VY3D0F4eLUOFq5R3gFMKPLU5DwSbhMubgK+uui+26Wwr
 VQvQ5QIgALtjOeP36fbaA88gXg9Ih1jasBRmTQKDK8oS3bOdN6+yCKW8ohe3Gwy3r3XAft9bm
 F0goiucGyEl2zhm8LRQ1Tn0FFMvPJ/umMvzXd9Mz3c5X5TilrxG0rHvxBU8HUIIbRTmHkVtZr
 2nkh9jLlZfzbRLer9knyKe2VEkJXO67GIXWOlvcD63JusVA2TdWLSsqIqvUstRkdQGAuPdH4x
 AGThr7nrm1d2DmyZmLW77dpB24ODzdUWze3TNtSh8SDEI5IqBdDxqK9HWnL24sYOEV9Ehlmu7
 g9hU9CblYCC15244Tmksr3wK3f2NFBP4MmlFNXwK4zBn2HJu4BSTZngZBaCor9wJYgS6So2jo
 RpN6WurQEWJSd0Ob16hmls8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_033643_580393_C96CB438 
X-CRM114-Status: GOOD (  16.88  )
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

The custom sdhost controller on BCM2835 is feed by the critical VPU clock.
In preparation for PM suspend/resume support, add a proper clock handling
to the driver like in the other clock consumers (e.g. I2C).

Move the clock handling behind mmc_of_parse(), because it could return
with -EPROBE_DEFER and we want to minimize potential clock operation durin=
g
boot phase.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mmc/host/bcm2835.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 3d3eda5a337c..107666b7c1c8 100644
=2D-- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -148,6 +148,7 @@ struct bcm2835_host {
 	void __iomem		*ioaddr;
 	u32			phys_addr;

+	struct clk		*clk;
 	struct platform_device	*pdev;

 	unsigned int		clock;		/* Current clock speed */
@@ -1345,7 +1346,6 @@ static int bcm2835_add_host(struct bcm2835_host *hos=
t)
 static int bcm2835_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
-	struct clk *clk;
 	struct bcm2835_host *host;
 	struct mmc_host *mmc;
 	const __be32 *regaddr_p;
@@ -1393,15 +1393,6 @@ static int bcm2835_probe(struct platform_device *pd=
ev)
 		/* Ignore errors to fall back to PIO mode */
 	}

-
-	clk =3D devm_clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		ret =3D dev_err_probe(dev, PTR_ERR(clk), "could not get clk\n");
-		goto err;
-	}
-
-	host->max_clk =3D clk_get_rate(clk);
-
 	host->irq =3D platform_get_irq(pdev, 0);
 	if (host->irq < 0) {
 		ret =3D host->irq;
@@ -1412,16 +1403,30 @@ static int bcm2835_probe(struct platform_device *p=
dev)
 	if (ret)
 		goto err;

-	ret =3D bcm2835_add_host(host);
+	host->clk =3D devm_clk_get(dev, NULL);
+	if (IS_ERR(host->clk)) {
+		ret =3D dev_err_probe(dev, PTR_ERR(host->clk), "could not get clk\n");
+		goto err;
+	}
+
+	ret =3D clk_prepare_enable(host->clk);
 	if (ret)
 		goto err;

+	host->max_clk =3D clk_get_rate(host->clk);
+
+	ret =3D bcm2835_add_host(host);
+	if (ret)
+		goto err_clk;
+
 	platform_set_drvdata(pdev, host);

 	dev_dbg(dev, "%s -> OK\n", __func__);

 	return 0;

+err_clk:
+	clk_disable_unprepare(host->clk);
 err:
 	dev_dbg(dev, "%s -> err %d\n", __func__, ret);
 	if (host->dma_chan_rxtx)
@@ -1445,6 +1450,8 @@ static void bcm2835_remove(struct platform_device *p=
dev)
 	cancel_work_sync(&host->dma_work);
 	cancel_delayed_work_sync(&host->timeout_work);

+	clk_disable_unprepare(host->clk);
+
 	if (host->dma_chan_rxtx)
 		dma_release_channel(host->dma_chan_rxtx);

=2D-
2.34.1


