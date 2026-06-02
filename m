Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05DDCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m1KVnd1R5IOEaVntsRV6w5ohh6MM9xtfcSuVzw7+bPI=; b=jh+/hjfbn2Ji+/NMb9qIdXL49h
	W3RQvDFJNTeJ344ZEyRuutIDvN0sQOkHUhGV0SO/gdj15f9C9p73x9AYT7Y1xOMNfXyhzbb5fxiBf
	n71GfrncBFTQj4GlxPjQ7JxRgsHS/h+F89yP/46AvcklbNg16uCMKRVjgR1T2Mxp4/Vs5FSEV6YzW
	h8pFn6ae5TCqgqhP+/YW2372SdCp74MJMyoa/S05e+ZT3qTyc8COD/BNVhtLYJRTF7ncZHLdqYQA4
	FcbpcowXs/f7Rqt5m6zqflk0FxZusXuMdqJNqDPwBT8PHahAmuEkPOtiGk79/3CV6JGxMeYlWdvt5
	F1A7LX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOx8-0000000D3ec-23ly;
	Tue, 02 Jun 2026 13:14:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOx5-0000000D3dc-2xJD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:14:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf3781ca51so32225555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780406078; x=1781010878; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1KVnd1R5IOEaVntsRV6w5ohh6MM9xtfcSuVzw7+bPI=;
        b=i+bH7W72Qu/oL2WKpdXmUzZ/odKkfLe/LJLllA9CP+1rBqCo5IpD3CzrCArFEfDavU
         XtAutiX9maO1HlqaNFs9JtxrG6vrpSybfS8UrJtARGvE2MoLyj6+epH3w+vCUqpfS6u5
         yacvSoL2zYbKItohe2Yq2OeihEz555fH5W5aSOrwdiGPH02Fbz1lX2ldIoOvqZuZFCI6
         7a8jt5L05MDd/6qnWiLsY/6H1QJBQA9++2SBi4FmCTjIz5QjMhncClP5PC2ZwcKddUc+
         OeXqXUJG4/qWTiZ1fvgFjPTRaF63CcqSeirpSKBFB0k314QUnBtaKaY+TpPORqskzpKa
         ozCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780406078; x=1781010878;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1KVnd1R5IOEaVntsRV6w5ohh6MM9xtfcSuVzw7+bPI=;
        b=rw9M23fX0NAEH/SPk8pPfBKFf6f+Qn4r5WKrLn4DQ1OQCuRo1qfNWRPWGnPalIFOkM
         vmoLJzbTmeCN6/fY9g/raTJwhu4ymvyYa4kJ6dfr0gb8VSyua+goZVA1BOn5eUYmedA3
         JhNmFsXkweiNCfyNbTzrsB2BhbKmp73oujiAM/hwnaI6qJu5g805T93L2E/WXWelVpH8
         y+qHBfE5yGIZ8vW9VOjdCGNTjEVRZk0ErHJJ01Y+zwizaoCG/g9Zk+QfzNtd1dbp9HqN
         fsk86JTaV15tPiCf8KGZqfA1ICgIOw5e/OnaeI+w3G8Ju4fuiHbjM1f3/fXw9OM/SUBP
         dAIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4KTgX3SwY04fYRG36+PGLBpTKRu6xuHKw8+NIW0riZ1xtfxOyxTILV4DnNb4FNtS2a1O1Cf+OO1jVnuqhtNjN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2/3+vPxbyRa6kTTwpP679fIYyjBF0oubR7IrjMiDsiBrKcR9d
	4JyXfLzgHHawLqaS7HPeWrNSZA3CxBRdialaqDpTP97NQ/Jvs8wZHsx7
X-Gm-Gg: Acq92OGA/529nMPuA3DYVP63ks80P1DOrdybF0bEQk3ynxtilTgccGdJ0FfcrvE1cq4
	qivN4aNlznPVHM3Gx7bqzGrES7DjVdQ0rgtv71IIubbLjbZW04T3k19DhrnKJSVXO9S5fNst64E
	UbXZjOBzqfg10wYBvJ1rovyoYjB24F4Vlt6Xv9csI+FFjPZpbf5tBMlI07GKAM91YpJmnH8nrGr
	5INamYxE+eOA0L5KwIBK+3wvd5VaW8gk3RFNYOiNvhdSeeeD00E7T/dnAW/p0zXfl2ShLkAnl5W
	YsHu7Ahkqo8Tu0/Gy1vYCJxyVUCYSBtg04iy/5LTxQ6vJHMO7JJqEPPyIOmVHpP0Z1hopqxNR3w
	mnbo27BaTDbIdYC4A0AdUXRv3S7TfJS5oLnQkNzMlmVL4/RuAoOa4pZcaFG3V/G7WG2W7OljffD
	JQBrxJT9JYdLxFpz4UTN0aQz5katUZZMZcPktpAuO8grfF4ufgDINUvkS8LoUu1g1VY+LS6r92U
	bigU6t/gN0kQrKavQh9SxisSHtVH1ZsxDEdkZs=
X-Received: by 2002:a17:903:1a0c:b0:2c0:f807:56b6 with SMTP id d9443c01a7336-2c0f80758b4mr76638985ad.4.1780406078215;
        Tue, 02 Jun 2026 06:14:38 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e7024sm136568705ad.6.2026.06.02.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:14:37 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 02 Jun 2026 21:14:33 +0800
Subject: [PATCH] phy: fsl-imx8mq-usb: fix vbus regulator leak on error
 paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-imx9mq-v1-1-e58b912923d2@gmail.com>
X-B4-Tracking: v=1; b=H4sIADjXHmoC/yXM0QpAMBTG8VfRubY6m6zmVeSCOTjKsCEl7264/
 NX/+y4I5JkCFMkFng4OPLsImSZgh9r1JLiNBoVKo0YleDrNtIoMpTYqM01uEGK8eOr4/I7K6nf
 Ym5Hs9q7hvh+Sh+HCagAAAA==
X-Change-ID: 20260602-imx9mq-30169239b590
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406073; l=1702;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=2P56B+ZQr3CMN8Q55LeqttmN2FV6MnYrkE4+rKOUiPI=;
 b=g2pyz/lE7GuPW7EbYIxceMDMUv9+CWTXEQIMXX8ydyaRLCAB+gzEIohDQmvjmmkIS1HKFwuY2
 a5WVBm2mQgXA0UAuruhmAeMLBxclchAkYoPqxRyWet4Ts00kbW5mkVa
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_061439_768986_F552244C 
X-CRM114-Status: GOOD (  12.59  )
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

In imx8mq_phy_power_on(), if clk_prepare_enable() fails after
regulator_enable() has succeeded, the vbus regulator is left
enabled. The same issue exists for the alt_clk error path.

Fix both by converting to the standard goto-based cleanup
pattern, ensuring the regulator is disabled when any
subsequent step fails.

Fixes: 3b64ea4768e7 ("phy: fsl-imx8mq-usb: support alternate reference clock")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b05d80e849a1..e45e4f16057e 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -627,13 +627,11 @@ static int imx8mq_phy_power_on(struct phy *phy)
 
 	ret = clk_prepare_enable(imx_phy->clk);
 	if (ret)
-		return ret;
+		goto disable_vbus;
 
 	ret = clk_prepare_enable(imx_phy->alt_clk);
-	if (ret) {
-		clk_disable_unprepare(imx_phy->clk);
-		return ret;
-	}
+	if (ret)
+		goto disable_clk;
 
 	/* Disable rx term override */
 	value = readl(imx_phy->base + PHY_CTRL6);
@@ -641,6 +639,13 @@ static int imx8mq_phy_power_on(struct phy *phy)
 	writel(value, imx_phy->base + PHY_CTRL6);
 
 	return 0;
+
+disable_clk:
+	clk_disable_unprepare(imx_phy->clk);
+disable_vbus:
+	regulator_disable(imx_phy->vbus);
+
+	return ret;
 }
 
 static int imx8mq_phy_power_off(struct phy *phy)

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-imx9mq-30169239b590

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


