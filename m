Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73139C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=; b=CqJQ3QDt7aPdC71i4HIP9/q45B
	UTsHGWW9oRbe9mQFFftvQbbaNEMNbnXynUDqyZTlCvAo/vmcuAt6wzSIab0CkFMVx/W/L+Di3+LA6
	Uj52voUDZBluZq/1bVeuxhkVC0GFrbU834YL/1QlrhM4LsO1TumvwzunLU/udGqkUV7Mv/c9Swao9
	3llQ3jZrpB1kLyGLPDR4lJDMW1JSH3avchemQKkwgmZQYIgUx/7ijM6ATY68JB+M2x3kRXZ6XO1BJ
	TyEHr0QqEPWsIntXiZRAPthavqu8SWynAZxfy7Ic5lIChEKv2iWSthVeCJQBRZxU4GWAZJKvJHWYI
	J/mu0lYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnp-000000028W6-32t1;
	Thu, 09 Jul 2026 11:20:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnn-000000028Tx-1HXE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493c733f15aso7874215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596021; x=1784200821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=;
        b=qZCHzpE/b84pscakW5cywBLpP4+gaOgKqwSBmndcey0FlhgvusWdgLk9OdrI+vyLAJ
         uXtmYsFNdaibcp59gQGdzYnCDZIgyls23PMr/eg0meLhD1rFoT2VccynTOM9vE/QLCX9
         rCrZVp1NbS3ggHm9yRfVI7dHXwwFIuo3n6R92bxlfsKv1Wzk1dVisJP2fH1B3hBu5xWE
         TMMUSEzVKq9L9iRk1mNfRUMLbkHPgeJ1AwA7RxPOu2KiFNomOgoaqc64FFIT2PiB7eoA
         Sb2vdCAJrv7nliAM1ZGNOek5FkJkUACr+qoydohanAZs4J89VKclRE3djKGKug6glYfD
         gcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596021; x=1784200821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=;
        b=AS48a4/XMnxI8KWa3YinRe+7BjVjifs2xgCwPDSdcaMUql7gzOV9OIxMnb7/PUk4/a
         PWN5tTN+nAmn8cBiGMrDbFF6vpOrnhVDOuIIepw+Bqts/ya5nWNQJj5NpXtb533RuVjf
         i1EkUU3POQj6mk0fbMhypYRkDp85klP1wyOY/2kP0jPw/sZxGmSHK8cCw15OKR3lOmtj
         ++T6ECLuvFykwkApE90zJlCIbDs1OeEKPMzDpT4i+PuhQ0r4pcuac4e9Rw6vnnOKKMj2
         5msZJZMB5vgT82nqR8h0K7j9d7jum72QnfBLM2fXuQ3vBMw2+iXF8PPFJZKm+EUZvWUt
         btbg==
X-Forwarded-Encrypted: i=1; AHgh+RolKfaiRgeleKTNaI7s9g43H6BdDbUD/LHAcL2JP9QAn8RdQtHil1s1ZjphMyTnqWGXV8qbIIcoEtg51sLjJYBZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoh1uSjAF5P/PcOqDU4P2OuDp/qnJzoeF7SCc+DC9yqTn348ow
	ekPF6Qd8UYJFg74byB5qfeMUoKVJaHEbF9xBwBTEXikpnTPzYBORNRq5XlXr09GKFNE=
X-Gm-Gg: AfdE7cnQbsayHVfJAeZKl1T2XUR2uVAd2bijAY21nU9dSX/vViOSsZf/R4MU2Sx9mL7
	lpGr9LC/RcfNBBDFV0ama7XckrGMBi2duBMW5HCW5L0JilSQDVFxPx8zj9eA6lRLRoHkSrknxMf
	PV/LYJ+FWHjX0GCwVcQg+aFrnT3oYoF6QJzK6Jc9fjgQKvBax1wV8xptB4BMHd5Iopusd1NgZyU
	ufyf8wmlRT9vRsiS7PvllGxdD5vKMtPpjHy7in4aNwx18cGQbwbmSe9mdsCCHdPDx5DJDjJwaTZ
	5SCD5a3hYyVE3W3Ixk4e6CLiwa1C/+0k0mQ4crvawQIClrDySZf5Q0WqGY3ysm8IKvjHP13qBul
	0udy79m/yLxtjsXBIOFEcQ/qZU4uIY+901sEVoFiYD+/3YztfhrulgnrPBU3WGRFmHqIoeVVEGg
	K04QredKVshSK+9w+GIh4+J2PrnKnBRQ+Z5LH0BTmby1+qlA7BH8FukxJ0nZcchjmCbMITdR+qC
	q8Pdr8bq/KN3o1tO6R08hH44MBSPNo6KBAP6gEM/CGrz9PfgXHttw==
X-Received: by 2002:a05:600c:8b6a:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493e88760f3mr51787825e9.34.1783596021331;
        Thu, 09 Jul 2026 04:20:21 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:20 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 3/5] spi: atmel-quadspi: use init callback for gclk variants
Date: Thu,  9 Jul 2026 13:19:09 +0200
Message-ID: <20260709112006.390742-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042023_356162_64DFC6A4 
X-CRM114-Status: GOOD (  12.03  )
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

Assign the existing SAMA7G5 initialization routine to every generic
clock variant and dispatch initialization exclusively through the
capability callback.

This keeps hardware capabilities separate from initialization selection
and lets variants override the sequence explicitly.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/atmel-quadspi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 62ea84d234d0..d1aec14e3978 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1159,10 +1159,7 @@ static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 	/* The controller can communicate with a single peripheral device (target). */
 	aq->target_max_speed_hz = spi->max_speed_hz;
 
-	if (aq->caps->init)
-		return aq->caps->init(aq);
-
-	return atmel_qspi_sama7g5_init(aq);
+	return aq->caps->init(aq);
 }
 
 static int atmel_qspi_setup(struct spi_device *spi)
@@ -1576,11 +1573,8 @@ static int __maybe_unused atmel_qspi_resume(struct device *dev)
 		return ret;
 	}
 
-	if (aq->caps->init)
-		return aq->caps->init(aq);
-
 	if (aq->caps->has_gclk)
-		return atmel_qspi_sama7g5_init(aq);
+		return aq->caps->init(aq);
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret < 0)
@@ -1638,6 +1632,7 @@ static const struct atmel_qspi_caps atmel_sam9x60_qspi_caps = {
 
 static const struct atmel_qspi_caps atmel_sam9x7_ospi_caps = {
 	.max_speed_hz = SAM9X7_QSPI_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.octal = true,
 	.has_dma = true,
@@ -1648,6 +1643,7 @@ static const struct atmel_qspi_caps atmel_sam9x7_ospi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7d65_ospi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI0_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.octal = true,
 	.has_dma = true,
@@ -1658,6 +1654,7 @@ static const struct atmel_qspi_caps atmel_sama7d65_ospi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7d65_qspi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI1_SDR_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.has_dma = true,
 	.has_2xgclk = true,
@@ -1666,6 +1663,7 @@ static const struct atmel_qspi_caps atmel_sama7d65_qspi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7g5_ospi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI0_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.octal = true,
 	.has_dma = true,
@@ -1675,6 +1673,7 @@ static const struct atmel_qspi_caps atmel_sama7g5_ospi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7g5_qspi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI1_SDR_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.has_dma = true,
 	.has_dllon = true,
-- 
2.55.0


