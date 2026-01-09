Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C171D26D99
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m33Rm+W7EUcDVwwaex8la9APYRPnILeyUJ1nGHvn+90=; b=kmI2qc6amQHXwTNVv+WBLUb57l
	aa572tO3CGAgXqqM0c+AoAudR5NSmP7xhCLJl4Ur62kTv3kui6+SDjrSUbGo1Idi4hYTSdd27UiRp
	/8AMNdB2NLv8OtLCo6m8JAnOI3AfHW2vLcBClT9j1r8ZE6NkOJfIy6Mop2U9ZUQDybjBx2INWm6YZ
	/tf5Im+786wjuvYHlHd/aeXM3hiTKwgAihTbMwaK6eFXVQofhN8OsxQ1dOi6OdJDkU8lyVNlfs9gm
	7Ctp3y5N5x0i7zkB5pjVUnCeW3m0c9gd3CSIwQknBUaitQ/qB8IzWxRfVtq/k8ntZLrFO0H1Tg2Pm
	UENoBadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJPg-0000000319V-3cxj;
	Fri, 09 Jan 2026 20:48:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJPd-0000000318i-2Vow
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 20:48:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so7342706a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 12:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767991727; x=1768596527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m33Rm+W7EUcDVwwaex8la9APYRPnILeyUJ1nGHvn+90=;
        b=Ov7MdNKhdmVfkmvVpYDvPiI+Vip1kRqSHCyMPHIh1NWtGG4m+OeYb892XbAJanKEMQ
         bQEwIJgKSZTahmJHOp/FVJtij34/YVhrxM9YT6B9OmnWwUDI4Virowlch6PvEVeacfIG
         /gU254Jzx8mK94vVDW0eC8cIbyonSFZX5hzFIABwSAE8hkMz62hfTXVrsy7DgQCsCeSX
         0z4VmLacn2O0zGDpCiSUxYLEhKV25RETJ1flTpIpI4d7f9rvLlBvyzZUEz7meEqH31kv
         u2IDuhe/MY27sVUrjpSZIxtijPTRfxaeps4qTsWnDsSdhXS38KZSuvo9xV6eUwtXhcYT
         wyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767991727; x=1768596527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m33Rm+W7EUcDVwwaex8la9APYRPnILeyUJ1nGHvn+90=;
        b=A7CFFmLWVbztV2ufVj8yZ9BQegrpF2OuKjGDASTJvW5LO7x8+DZy790FJs0xuvcpPs
         xRR+UvZPTlanXtoBw1Yv9ozGanRfFL1KBxj1vpDcpRAh+pULz8rezm+yopf35x1/ZfPt
         fj5NAroLzpc4aBDVLON4/m1c8sJIKBtQxSjzJWpuuHr5tKphKmZmdumFLJQhBzXPpE43
         6VjduV1l+/cLtb+ixyVMotgIudYhNraraUfB03ENdC3YfhZYx/fuBtjdbKjXzMHx0CP6
         1eX2mZv3qhdY2BeQwDsOWLXOdOFN+toBGismjbf2aB8IheE7tTDdZ/DamJFmJgzFXlTr
         CBZg==
X-Gm-Message-State: AOJu0YxTnwLdoOObuAyFL35qN6HFwXXTIp/uu7uscO5I/ZUwMJ/tOqo2
	nDfiwKM1xK1dINOa8f/7C0qyGrljbpZoVYTxY01Lbz69kTWVPA1gtNlP
X-Gm-Gg: AY/fxX5x205FaB2lXAXmGmRRpYGg5u2JD4v4qSOsAJjbxwC9viDVml4kTg8u8hVRNMt
	+QsAHFTJQ5Bc9xE4iv/lbMMtt/zqkxyJeqA3gZRSjrzSS7Ra75IVr6Zvgnf25hqSMv20vAO5DpJ
	2OlSZleOytr2QD3SgwsL/o5pVfpSbCoyKQ+3/wlChRXf4F/H2F/SFhNJEWTBkQoWJJWdMn98L+x
	ONdT1akAHD378XbUeP11JpjnuTjmIUINOZpfw+bwf3RW+oiGpfp2IHqY8QSCN5TBOQwlU30+x1E
	iF6YFUvqwXrv6yoUifpmbdUhVMt54xDAnXL8laIB1ghHO/u8NdnrqLykkPUjsg81LLWaKXOUpJG
	dRHst/rHkjxANN2rFdESRX7jNk6kCOVrSjxwNVGEc9GxugUgnvUvVmqmLeFfX3acOzZaNhZy4+w
	zRnOEtsRWvvNAi2b/TwQvf7F8kQUARd3Sta93v56MFvag4lGOE+6sacxJEhMYPYCMEO1Mzp6F/t
	vCvORxoovqVNuefiIUTWiLYCPykU3TsJ0mjjO1McA==
X-Google-Smtp-Source: AGHT+IHVp6kIr8A8otcgLkJtMD+81CVDnmKr5LMWoPZ7CM1ROsZdycthXnmcAbU60w/RHVPQQ9OjJA==
X-Received: by 2002:a17:907:da9:b0:b83:a6ce:f60c with SMTP id a640c23a62f3a-b8444c3fcf6mr1050745966b.3.1767991726595;
        Fri, 09 Jan 2026 12:48:46 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-afbb-db00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:afbb:db00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm1263505666b.44.2026.01.09.12.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 12:48:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/meson: add support for higher bandwidth HDMI DTDs
Date: Fri,  9 Jan 2026 21:48:36 +0100
Message-ID: <20260109204836.790096-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_124849_655516_F6274D36 
X-CRM114-Status: GOOD (  17.02  )
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

There's a report from a user with a DELL U3415W monitor and a Khadas
VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
  DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
               Hfront   80 Hsync  32 Hback   48 Hpol P
               Vfront   28 Vsync  10 Vback    3 Vpol N

Those high clock rates are currently not supported by the meson_vclk
code as it limits the PLL OD (output divider) to a minimum of 2. The
formula to calculate the clock internally is (ignoring fractional
dividers):
  319.750MHz * 10 * od = 24MHz * m

With od = 2 this results in m = 266, which is outside the supported
range of the PLL on G12A SoCs (the driver limits m to 106..247).
Using od = 2 results in m = 133, which is supported.

Allow the driver to pick OD = 1 to gain support for modes such as
3440x1440@60Hz.

Link: https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for-dell-monitor/26271/12
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index dfe0c28a0f05..c0be0b7655bf 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -700,8 +700,8 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 				       unsigned int *frac,
 				       unsigned int *od)
 {
-	/* Cycle from /16 to /2 */
-	for (*od = 16 ; *od > 1 ; *od >>= 1) {
+	/* Cycle from /16 to /1 */
+	for (*od = 16 ; *od > 0 ; *od >>= 1) {
 		*m = meson_hdmi_pll_get_m(priv, freq * *od);
 		if (!*m)
 			continue;
@@ -750,7 +750,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
 		od3 = 1;
 		if (od < 4) {
-			od1 = 2;
+			od1 = od;
 			od2 = 1;
 		} else {
 			od2 = od / 4;
-- 
2.52.0


