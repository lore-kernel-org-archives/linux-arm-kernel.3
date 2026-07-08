Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4883FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=; b=gPmrnAl/3bbQIQ4l2q1N91Rgiy
	el1/kj53BOm6eTMP69Sax0dv20NP8ODwmwB4gnW4SfvV+pr74hKFiEkFoXX/GS+YdLE7dai3khjko
	Tj3gVehFgggHKzQTDqfgpgaoP4sh6ONyq++MpoqQva4ew1VMBncekV76s/IfyGxzaYmKagO8P85If
	di51mZEOSrKeW2eH6sBRCQzRBJlGj7GrXoSGnAKcXDd98Ythjhls5jdphWAQPGptB5FvmeJcl8f/E
	oSkDyK0yfhyDalgeaeQrnFWHiwh4wkPCqCq7VEGawQ3200IuQ8Na87n/oEXljSnKWSrum5TOzHgM+
	1nva/0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVT-000000001ss-2445;
	Wed, 08 Jul 2026 16:52:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVO-000000001qt-3Qg9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:52:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso648562f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783529533; x=1784134333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=;
        b=bw21odBVcKGG4ZYNdu1duIF21L2wOZ6GK7w10IoicibvIIFXmo7iJkM4yOs6VQWlj0
         e39xRr/AFZd5KsmY6xZ5kYarGV6PLzMs8JgbGzyMI4KDsvdcxxn8tJxjneSEx3FJbVJi
         N2ZbBM6ArHqpBLlslshXHPxQou4H5wiRYjoFIPUt65b4tHsicGVbzngyoK6I/QhNPUuQ
         n2QE1Xci6dexceMtYRW1p2+hPU11Uq21jpjdvcb+i1p1bkoECMpyvSgd0p3k/77HgBJd
         uwmOoUeSk8oGlncNIFSe/bAPK39h+cx5oXBesgC5CHD1xtFhoFOsUIIl0WLZwXVEA6KP
         Qdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529533; x=1784134333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=;
        b=jNfuZmuTF7v+YlfajdmAp1eR4kkN+mOzikIQ0Ym7ywYa43OIyWgtVkyjtxOdyChG64
         4aggH50a9nKVVCJZ2FtP8NURTBVLFJ3T9i8EtGExpIeYL1+iUnlna8Qp8go0XfKbVr6y
         4yRswbkd6DcHFfk3/J+8HEy6Lj+A/VTsd35xJCC3LVKpPWRHYcCVac+mNnobHnUtV2Pm
         al2az65XAP31jhfugDZK30IBfgeds7txfKPIhn6z8r6JpYz321oEAPlZSQe/FIA+u7LP
         ulFX4kSqOqe6fo0TytAldXQM52fDzl6IZVgIJ7moaVrFs2nOZbsp1/j9U/HWsxZ2RdnK
         qFyw==
X-Forwarded-Encrypted: i=1; AHgh+RotAZ55aDSZRTktcsqX60vErdKhliSVroJr9RI2VAq4uFo6y4aydLqtjs1M/S8zoMs8EmbGCiEqgrYFeoYBWHAh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+JGY5jX2pv1oOcXkIr3mpAsZC/WU9u/bKXeVT8KxOzdUpomcw
	4UNgg7EzE7gxA6oKy5+nqGZQ0zczHSaMubSfSOJx4g0w5poaUhNpBvj/WoegFG/fRIg=
X-Gm-Gg: AfdE7cnV/D53dkVzP9ooNVg9UPgAd1XBGPwU0TrAugcuNQO4fDnpmSR+K7syznQf0sh
	O11+4344DTszbLOiiQhDzhw+ywGWk1Q31u2QwfVxvyAXJ7LUQfWHMGwArlHBQk41GR899sLSgk6
	sZKtStYLGFrv9Jp5puRExiaTMQgl1H7uZf4V3uCdSlPKCLuRmfTTf1sTuQWxbjpa2KOSocty0gz
	PtoNcExPmPBcIM6Bf/v6dvds7I/cBDalutIjRXuzrPRyv4JiKd25vfuTgvz605VXdtkCFcKJ2m2
	LTwtBdoyLADxfr0hxQU8kEy+wVhDrcUA0CKEMDKx9MJVxwu69leMLuE58LP0lNm2HqE5opNtE77
	IAnRD8RCOnGFjZWZ0ZoO8N90Robwv1B5ZfddMEF6J4jZy62TV7gi+Y+3LTgA+06nIyH9jahrcPX
	ThQ55CzuxYpzuQKCrj27OL1AidiIVmBB5FiovJNyVy4uJylwWERM7YUdrkmi2gxi3LCNLzBXuIk
	2sttOFi8EIl3joPw5KswsrSkst3J2HMlhPwPffft+w=
X-Received: by 2002:a5d:5848:0:b0:478:1a24:912d with SMTP id ffacd0b85a97d-47df07a2e71mr4183000f8f.57.1783529532914;
        Wed, 08 Jul 2026 09:52:12 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm42902679f8f.33.2026.07.08.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:12 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/4] spi: atmel-quadspi: use init callback for gclk variants
Date: Wed,  8 Jul 2026 18:51:09 +0200
Message-ID: <20260708165201.624271-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708165201.624271-1-robert.marko@sartura.hr>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_095214_869779_2A9CC17F 
X-CRM114-Status: GOOD (  12.49  )
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


