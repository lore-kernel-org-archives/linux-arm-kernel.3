Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2606FD3ABF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FezSaBLf7wCo5DY/lU0PUbH+WokJ3F83+Nys5IdDnP0=; b=WK/glyxqDtmjYDVYZZLrV9K5hs
	u2qBKCDj3KNODJQVHCw5xSEGcuzHNEdhixiXxigDH/mffoiqnw5jlSetOq1n9n6640IumNDAIWAcO
	Lv9ZJ9XlLZa/CoQSyMha2MYblU0w5sU/xdzV5QrXP3bSf6RzY+LTF3EI8xa35kryN0dkb70YyOtow
	pGLOw7O7Xb0g/VMImrzMFX8bqyOnx+O37xNjhbshy4UX+uk5qSkyCTZsbfRU1DgooRPt5FchN2koD
	9TMLIQvnjjCedvgodM4Lonz7LeD6TFD/8/AoaxFREnHBgvDaQuxTNXwkKZUv2XatjQSgESnwnmoSB
	UNoQZXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRneQ-0000000AkQd-3Jx3;
	Sat, 06 Dec 2025 08:28:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRneN-0000000AkPa-2vbr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 08:28:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47778b23f64so18128805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765009697; x=1765614497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FezSaBLf7wCo5DY/lU0PUbH+WokJ3F83+Nys5IdDnP0=;
        b=U/WDd1F/0igxgNvWP1GIXlnXItirkT0iLYnfX96cfsLjhWvTskTQME/dXS1EcdFn74
         r1DiXtwz6eGVh3HvwRXIelReCpOXjJRmrAcceAdXrLvbCSeUG4gdE4lsbo/9+4KlqCQw
         B6l5JSgTv2nIXqIE/LTX3Q8p20jgGX21oc7qGrZNi0/xevpAr3UaY6jT2Md+bWRyyEEo
         cJISeZmpGJ7R/Eek1aXGfRLGRaqCKkMl3dCNg8IzQkehY1M5OPmuFcNOatgWwSqeolGE
         KGysF5XGkUTs/qlVQP9Nr0AjpyMidZCUykbl8YrPTE24X4/0roIh21fVoJ1801UrMLnY
         3vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765009697; x=1765614497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FezSaBLf7wCo5DY/lU0PUbH+WokJ3F83+Nys5IdDnP0=;
        b=gjZyTSEZw3sGuxLxSFmxiArOqLULtuA9XexXxxZP6VEWD6uwRp/WoMgvGtZYrKbIvi
         dQKwi+ppEEgCrVlUv/2Wu4SEEvgpnz/o6CBI6MiHX3a7tlXtF7v7qsI26F7Nn8TARj6t
         FwUa3gkEI4Eqzdc2vPpo31EBOC+OLEuQYUmzol68C6WwnuHUDuwTuyak/FNk57Ge/dEJ
         jfaRvcFlziOYEuL5LvnR0gtaJvLrTyOkGSb45z39QnxpXcBZHdJv6L9aQH8gAABmMwmy
         Z7cu18uDDS/kTT7pMQL4/39kJ5nZtoJjhcwq8L4MQWLJclFRibfUVySP2l9E0is7Sg/4
         aKbw==
X-Forwarded-Encrypted: i=1; AJvYcCVuaEDEhcJQRr+uoX44TZN5dztOlClvdcEiWsaXKXZngjbwUxOmBeB6Y5lVJ/GOnm95JfYNvXXbvTzU5JzLfuIA@lists.infradead.org
X-Gm-Message-State: AOJu0YxzWeLMhgANRxRjmI/9xkps3F+QaNbHnsQtRvIoSy03BfqcXo+T
	r44o/34mJOW7DqhM9++Y7ck2/7ggsrXURV/MrQdacHgUksGYnlYskQKy
X-Gm-Gg: ASbGncvmrwHxy3ThsiuOYWM6n9mEi/PRDMWSaLyv9x5uV1FH4l59WIQudBWL0HyAzG6
	Fm3h/+VXbPrRh9xt9F45X8Zit5MokocCwTVPusZLAPy2gIPzFaxtFgJvD9tbfoX9LZJVxOjOhum
	Q7PMTNRSp/9mFt64Mr/xjLrWpr4sgJpDF3boXGMfNisGDXyWIJVC6MFHeTGJhKD3Fta8uca0FzZ
	qpbGD2wzV1Sxu1NIFnr3/boqZbFIrHORoiliFokOyf99/Mf7dVXz64yR7PUmG4Qsxh8PB1aJqGe
	ZK/r0M5hV4qizJH1B0p6k/qxse4oNPwUKR+r+jpetRytJr6Uf5QNJcqB5UWgPqUEFwFU7GLSibN
	2hu42dTuqMU6tJMhyoh5U1/pFz3JDh51WJkR1241+HOjPQUCLpU2HPxHXN0uzReT5cNGLGXbFMn
	J+RwhkDg/w9dMnJ/0=
X-Google-Smtp-Source: AGHT+IEkUrPBcFh97XMz8GJKKpFnTbZn0ROoOhlMrdyTdBPLjuhn+cNwEGqKaQDpj9DV4jFElIFQvw==
X-Received: by 2002:a05:600c:1f8d:b0:477:af74:ed64 with SMTP id 5b1f17b1804b1-47939e3d0a6mr13423475e9.27.1765009697222;
        Sat, 06 Dec 2025 00:28:17 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:16 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH DO-NOT-MERGE 1/4] media: rkvdec: minor fixes for current DETLEV patches
Date: Sat,  6 Dec 2025 08:28:06 +0000
Message-Id: <20251206082809.2040679-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206082809.2040679-1-christianshewitt@gmail.com>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_002819_773104_AEEB3E08 
X-CRM114-Status: GOOD (  14.87  )
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

RK3588 TRM Part 1 para 5.5.9 shows RKVDEC_SWREG12_SENCODARY_EN as
the register name so the 'secondary' typo looks maybe intentional,
but using correct spellings improves code readability.

RK3588 TRM Part 1 para 5.4.3 shows RKVDEC_1080P_PIXELS should use
1920x1088 (to be 4px aligned) not 1920x1080.

Also correct some H264 references in the H265 driver.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h    | 4 ++--
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
index 11b545e9ee7e..7cc6cbb8e549 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
@@ -24,7 +24,7 @@
 
 #define MAX_SLICE_NUMBER	0x3fff
 
-#define RKVDEC_1080P_PIXELS		(1920 * 1080)
+#define RKVDEC_1080P_PIXELS		(1920 * 1088)
 #define RKVDEC_4K_PIXELS		(4096 * 2304)
 #define RKVDEC_8K_PIXELS		(7680 * 4320)
 #define RKVDEC_TIMEOUT_1080p		(0xefffff)
@@ -90,7 +90,7 @@ struct rkvdec_vdpu381_regs_common {
 		u32 reserved4			: 7;
 	} reg011;
 
-	struct rkvdec_vdpu381_sencodary_en {
+	struct rkvdec_vdpu381_secondary_en {
 		u32 wr_ddr_align_en		: 1;
 		u32 colmv_compress_en		: 1;
 		u32 fbc_e			: 1;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index dd7481a4353d..b4fc0d423c16 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -275,11 +275,11 @@ static void set_pps_ref_pic_poc(struct rkvdec_hevc_sps_pps *hw_ps, u32 poc, int
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_hevc_run *run)
 {
-	struct rkvdec_hevc_ctx *h264_ctx = ctx->priv;
+	struct rkvdec_hevc_ctx *h265_ctx = ctx->priv;
 	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
 	const struct v4l2_ctrl_hevc_decode_params *dec_params = run->decode_params;
-	struct rkvdec_hevc_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
+	struct rkvdec_hevc_priv_tbl *priv_tbl = h265_ctx->priv_tbl.cpu;
 	struct rkvdec_hevc_sps_pps *hw_ps;
 	bool tiles_enabled;
 	s32 max_cu_width;
@@ -479,7 +479,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	memset(regs, 0, sizeof(*regs));
 
-	/* Set H264 mode */
+	/* Set HEVC mode */
 	regs->common.reg008_dec_mode = VDPU383_MODE_HEVC;
 
 	/* Set input stream length */
-- 
2.34.1


