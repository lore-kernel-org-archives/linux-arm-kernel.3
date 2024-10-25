Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9866D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2GjkUl3p/O3LyFYgokUMRNrG9yDODmMulXK3H2wmqc=; b=vD7cuH1VTyRgSQjktUgu08i2gU
	qga8ZQJ+8VpWCZal+KT2PZyOkJeO/JJSAGdeH2dDyuECQ2d6pw45R4tf2lR/GhzBC55I/peKufINr
	nra2t4EAD+sbeA/9nvs/m+dncGtfup0OgG3UvYTuV+6YhXTro1xHNEAOd7fb1plPep9fyNTRivpYH
	BQUO7PGzF1JgVV3w9FfJfUk7ZnqQ42X31nvJU2lg31TW7yB4UaYJ4TUH3llIGNiKbxZF/QU2u77Lw
	osYvqkHP5ciGAsuWNo9lCLB5CtorK6STi2mUUF/XIJaXxIp0v8UgmUbEQ5CkfMZSVYxqxh8DG+R1t
	8XcCkhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O56-00000004aYt-1jgZ;
	Fri, 25 Oct 2024 17:26:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv1-00000004Xp5-2KZs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x2GjkUl3p/O3LyFYgokUMRNrG9yDODmMulXK3H2wmqc=; b=Q94qUTmBdDN/z2iR+JSN75KNZ/
	6cXj928r6+Q5iheCUWnVwlvS29RKEsjl2iYOFUzxYlk3o1e232kRviK9nQe9MOGsrWoO5dRiKpLEy
	+JlY0BCz/xAYghy0x6k9VYKpe8SZKJf3utHonQkiH7v+pvqB0Kb+CDjfmHIbnXexpxuMesN5LNxFd
	pCcbRS0PQUte+lk1zARgOdCtn+GkEZ0uI/ITUgYbbU84fQehrnrjBoqM24Q4cG8FjEOmRaKr4QZU6
	chjYA33ukli1M1+SU7Aj0Zv++oxS/ewdRzZhIhISEKjt0FtHSyeH/78xe5/F0KyiXxfZnYzIhMR23
	/5TGHgJA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nuw-00000008zcp-0azq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so29131775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876563; x=1730481363; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2GjkUl3p/O3LyFYgokUMRNrG9yDODmMulXK3H2wmqc=;
        b=m9cRmYK8HOsG4Qe8lIwsmXRtULIeyD1C5mF4U+wohuyAPa92GV8bA5I8xiHn+/IZf6
         fkcZyxONEC06wEkjnzo9zgtdf4fNiOAXV2EY4Adpz7LcQoy34NvV0ZHq0J2Re541/ycg
         ecyK3l2Wv3Dn00V6NsQRX8qIhNNFqLoPiKnax4nepLHv1pL7CU2yRihIRPEWu67eXJPA
         FKa1Tx6YMAvzuaUnY7jvj7zGwZSFPjDNXx2PDliJM7BsqPP/R6+ZRVORLJ81yhezWSZD
         H8tdpdyO2T3Ervhqo5p+wyiXZIAKrnMl3ff2OTFW+1BlPIYeTJ0Aehw02MO7Hj/1rfwO
         vMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876563; x=1730481363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2GjkUl3p/O3LyFYgokUMRNrG9yDODmMulXK3H2wmqc=;
        b=tXJW7Mh2HX6/GuDx2vA3g9PZz45yzo5NemDidtZxFV5iHWrK873Cke3VYunqxI+FMD
         PlUUjxJy/Ry2KAm0hJOrOMSVEqM/FO5IANmhM7ns9pWE35pycQ4uKFMjZqnGMj+HYcdS
         hWVtDXXpWUx8CUe/Dmh/3CzbmAHzm4pPSQKg71/xSoSYB3+gXVYuF7AXq/wRh54kicKl
         vZBWdWuU3TpEyMrSC3zDWLuC1oks7loYep6s++saaN7MBSPw/NZGD0n8XNqyZpT0Rnsi
         VxtYswDRVjR4OBKfOm7AlCM/qrqSEuCjZYR3qSXZptMSV6sxUMA2/Fo9Q6GM/7sXLdlh
         F+ow==
X-Forwarded-Encrypted: i=1; AJvYcCWSIsGJNXkiwE7hmeDrxG+TVQ5b/8vcUXIVkVM8Vmn4147x0JGj6ekj3c/b1UiqQD5gwoB5t5ILK5XHg8UqVKpw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2lnBARMgXgNgl0Vv3i+vwhaeP7JuLz0l+0QkhwYuEJpgthwLl
	XaIBiPM1pXMwAkamUpcy/HG6uStmlNua0hrhI61bUh3rUEipv47zg123yM+Wpo0=
X-Google-Smtp-Source: AGHT+IHS33FJ99QvsSnwlHEO0RVmS3g3mQFRGvOhUZla0C49szl9I45Vo/iib3shrh2XvYSiEjJZJQ==
X-Received: by 2002:a05:600c:314a:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-431841eb704mr109059015e9.7.1729876562817;
        Fri, 25 Oct 2024 10:16:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:02 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:33 +0100
Subject: [PATCH v2 02/36] drm/vc4: Fix reading of frame count on GEN5 / Pi4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-2-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_181606_504718_DD7D0612 
X-CRM114-Status: GOOD (  12.62  )
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

The frame count values moved within registers DISPSTAT1 and
DISPSTAT2 with GEN5, so update the accessor function to
accommodate that.

Fixes: b51cd7ad143d ("drm/vc4: hvs: Fix frame count register readout")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hvs.c  | 45 +++++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_regs.h |  6 ++++++
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 1edf6e3fa7e6..f8edb0791091 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -272,19 +272,42 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 	if (!drm_dev_enter(drm, &idx))
 		return 0;
 
-	switch (fifo) {
-	case 0:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
-				      SCALER_DISPSTAT1_FRCNT0);
-		break;
-	case 1:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
-				      SCALER_DISPSTAT1_FRCNT1);
+	switch (vc4->gen) {
+	case VC4_GEN_5:
+		switch (fifo) {
+		case 0:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER5_DISPSTAT1_FRCNT0);
+			break;
+		case 1:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER5_DISPSTAT1_FRCNT1);
+			break;
+		case 2:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
+					      SCALER5_DISPSTAT2_FRCNT2);
+			break;
+		}
 		break;
-	case 2:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
-				      SCALER_DISPSTAT2_FRCNT2);
+	case VC4_GEN_4:
+		switch (fifo) {
+		case 0:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER_DISPSTAT1_FRCNT0);
+			break;
+		case 1:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER_DISPSTAT1_FRCNT1);
+			break;
+		case 2:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
+					      SCALER_DISPSTAT2_FRCNT2);
+			break;
+		}
 		break;
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		return 0;
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index c55dec383929..341a75cf92e5 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -418,6 +418,10 @@
 # define SCALER_DISPSTAT1_FRCNT0_SHIFT		18
 # define SCALER_DISPSTAT1_FRCNT1_MASK		VC4_MASK(17, 12)
 # define SCALER_DISPSTAT1_FRCNT1_SHIFT		12
+# define SCALER5_DISPSTAT1_FRCNT0_MASK		VC4_MASK(25, 20)
+# define SCALER5_DISPSTAT1_FRCNT0_SHIFT		20
+# define SCALER5_DISPSTAT1_FRCNT1_MASK		VC4_MASK(19, 14)
+# define SCALER5_DISPSTAT1_FRCNT1_SHIFT		14
 
 #define SCALER_DISPSTATX(x)			(SCALER_DISPSTAT0 +        \
 						 (x) * (SCALER_DISPSTAT1 - \
@@ -436,6 +440,8 @@
 #define SCALER_DISPSTAT2                        0x00000068
 # define SCALER_DISPSTAT2_FRCNT2_MASK		VC4_MASK(17, 12)
 # define SCALER_DISPSTAT2_FRCNT2_SHIFT		12
+# define SCALER5_DISPSTAT2_FRCNT2_MASK		VC4_MASK(19, 14)
+# define SCALER5_DISPSTAT2_FRCNT2_SHIFT		14
 
 #define SCALER_DISPBASE2                        0x0000006c
 #define SCALER_DISPALPHA2                       0x00000070

-- 
2.34.1


