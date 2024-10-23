Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A8CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR3ccJeL4HxyxPZlSDJvOHeahmWhAae+eo+r1fakok4=; b=fx/Ux6HQYLK0GlMdt2B0MDZI8B
	FAQdjp1ZzuHQ5DEfVE9bSm91vYA6Ukl/fKtmk0/Ovn3dJ9I0RljzNAHWscFVZTq/DOvZ7MetVpy+b
	tmTgMueQN8EoZoPRlWshd/4x3PEfq8tFic0ck4LNF+e/2vQcDYPjELwu27ZAa8SCHEyorxZBeJspp
	fW0pJp/O7mBUxYDJ3wf4np+Rfpg1tB1GgHmdSdNdnaBZWqiue5VYnujsxYph/dA5Tw2Jly+8VBIk1
	jyiYX2fpZjuZ3I4RYirSIRbOTuGCwostSRFNj2xrE2chpGnEMrDWycwGz27dVLrIJJWHq46YKhP2Z
	pVud+JEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gC0-0000000FYod-2qYp;
	Wed, 23 Oct 2024 18:34:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ7-0000000FDT3-2uKG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aR3ccJeL4HxyxPZlSDJvOHeahmWhAae+eo+r1fakok4=; b=aTFaFD4Ru3T6b3HQBzmHLYduZa
	NU12hSI6DI9FdbPPN+BJ02Tcl9I/4yY76yugpE2irw5htbBYJIYGWUWNZsct8BwctzU38V3JEAdUB
	os8nr7roYMX8tLAHMp2NU3JmZpDmcVeyaK7s/Jmg8TlEaJ8M1zhiPFu5ySwTkjKeU7jONdO6EtovR
	rvFcdOMNtuZRW2eDGMGf63i0MSGZ3mmGR6X607lP2ku4hMGi+lGIhHiEGE5rf00vWEnmTgWl5apNj
	E9ihTWBst3YkWigB0WeA49wjCgeqGA0q52cI9bEC9VpWx44d1qNy3p1BmqJB2r5GpEGf5DkpSGN6d
	wbA+TtSQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ3-00000008THK-1wF4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso71508265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702228; x=1730307028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aR3ccJeL4HxyxPZlSDJvOHeahmWhAae+eo+r1fakok4=;
        b=LatIWJJOECzktK0Nq5M0ljv4vKxNoD3ZINI8pcp5s2KgNHUrhHBX2W5bdvyD5J9jfn
         zsEkFreV4FqduJx5TRumql7uTfasNHbE5YgykbVoEq8TIIJZhlnS6g6U9P2OLDT6E8C+
         xHJmvs16Vq66AS9BnYliOHmKg5DLnrvA/tWaUvQel/TKFQVczqzrO0yB7pSI1t6OAC5F
         ZYnHkjMHVcK/D42SJpnKaGvIvw9CPjxh+ikOf29n9lObgLCY/ut2pQ0ES0t+20zkRQFP
         Nxn0YRQAm1ZcgRz2jeeXBWw4F5ujKQ54d5d1ZvGFQBU0t/jdP+NsBJ1InMB4Flv2eSHm
         N1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702228; x=1730307028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aR3ccJeL4HxyxPZlSDJvOHeahmWhAae+eo+r1fakok4=;
        b=h7hXQkPl/frgKQ7xHFxZ3TV85mI6Oka+e2h57TMx+k9/mcjapxS0mIaBXyMy7bRt5v
         gT4/uoBPP72ijBtIkl6pgmXHUnT7qkS7binmxkwc/bYWWm0/UMDv5WTQ+YGNs/QcnEEf
         Tg5g8ytZR4aJyeC4tfjYLt8vsKprOfBvwKNZVVNcjBBWC1K0ztDw2ePPaY2Qf8aLGTm0
         IVqNIb95d2lb/cpmtHA+F7zU3XUbq7VbUBvMfW24ARAyVG/JE1D7n83eFztgLZSny+0x
         bhqJCqJUy9E8PQCvgDvbWLf156KqKRHu7Bcm53jHUFPMNpLuwdDQ8EOf1G2Ifu8QCIKJ
         4YpA==
X-Forwarded-Encrypted: i=1; AJvYcCWXLVTGd/bX5TSjpcy3Yxd6V/s+TLNlsNWIF4WmgeO34ANYgM/9nN4V1Ux9r2UhXUqo3B5qfY9K0akRz9+PgVCc@lists.infradead.org
X-Gm-Message-State: AOJu0YyhTG3gpKFr3yn/pWpWz0rnA/vJOu2Rk2F2Lqxys6aalTNuS4ob
	kwYEt/9QPkuWXuoj7xPiJCcFkWYbyJQ+IcrRlhDcb6WHSpGYRnm3d22aKzVkYbE=
X-Google-Smtp-Source: AGHT+IEOy2zNXTO+qZ1pnkj3ZxfwjmFB8Lyi/Hjl1VbMlKymDIO9YzNaeAU/T3UkTjjwbJe440glJA==
X-Received: by 2002:a05:600c:55d5:b0:431:46fe:4cc1 with SMTP id 5b1f17b1804b1-431841440c2mr30585085e9.10.1729702228114;
        Wed, 23 Oct 2024 09:50:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:27 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:17 +0100
Subject: [PATCH 20/37] drm/vc4: txp: Add a new TXP encoder type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-20-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_175029_753203_1FEB574D 
X-CRM114-Status: GOOD (  13.60  )
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

From: Maxime Ripard <mripard@kernel.org>

Starting with BCM2712, we'll have a two TXP. Let's follow the HDMI
example and add two encoder types for TXP: TXP0 and TXP1.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c           |   4 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 106 ++++++++++++-------------
 drivers/gpu/drm/vc4/vc4_drv.h                  |   3 +-
 drivers/gpu/drm/vc4/vc4_kms.c                  |   2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                  |   2 +-
 5 files changed, 59 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 372482fcd6c7..e276a957b01c 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -52,7 +52,7 @@ struct vc4_mock_desc {
 static const struct vc4_mock_desc vc4_mock =
 	VC4_MOCK_DESC(
 		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
-				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
+				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP0,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
 		VC4_MOCK_PIXELVALVE_DESC(&bcm2835_pv0_data,
@@ -78,7 +78,7 @@ static const struct vc4_mock_desc vc4_mock =
 static const struct vc4_mock_desc vc5_mock =
 	VC4_MOCK_DESC(
 		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
-				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
+				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP0,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
 		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv0_data,
diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 61622e951031..40a05869a50e 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -90,7 +90,7 @@ static const struct encoder_constraint vc4_encoder_constraints[] = {
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI0, 0),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI0, 1),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_VEC, 1),
-	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP, 2),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP0, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI1, 2),
 };
 
@@ -98,7 +98,7 @@ static const struct encoder_constraint vc5_encoder_constraints[] = {
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DPI, 0),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI0, 0),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_VEC, 1),
-	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP, 0, 2),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP0, 0, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI1, 0, 1, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI0, 0, 1, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI1, 0, 1, 2),
@@ -207,7 +207,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("1 output: DSI1",
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("1 output: TXP",
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: DSI0, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0),
@@ -219,7 +219,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: DSI0, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: DPI, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0),
@@ -231,19 +231,19 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: DPI, TXP",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: HDMI0, DSI1",
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: HDMI0, TXP",
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: VEC, DSI1",
 			   VC4_ENCODER_TYPE_VEC,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: VEC, TXP",
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, HDMI0, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0,
@@ -251,7 +251,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, HDMI0, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
@@ -259,7 +259,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, VEC, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DPI, HDMI0, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0,
@@ -267,7 +267,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DPI, HDMI0, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DPI, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
@@ -275,7 +275,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DPI, VEC, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 };
 
 KUNIT_ARRAY_PARAM(vc4_test_pv_muxing,
@@ -287,7 +287,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_DSI0),
 	VC4_PV_MUXING_TEST("TXP/DSI1 Conflict",
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("HDMI0/VEC Conflict",
 			   VC4_ENCODER_TYPE_HDMI0,
@@ -296,22 +296,22 @@ static const struct pv_muxing_param vc4_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("More than 3 outputs: DPI, HDMI0, DSI1, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 };
 
 KUNIT_ARRAY_PARAM(vc4_test_pv_muxing_invalid,
@@ -342,7 +342,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("2 outputs: DPI, TXP",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: DPI, VEC",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC),
@@ -360,7 +360,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("2 outputs: DSI0, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: DSI0, VEC",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC),
@@ -372,7 +372,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("2 outputs: DSI1, TXP",
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
@@ -384,7 +384,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("2 outputs: HDMI0, TXP",
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
@@ -393,14 +393,14 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("2 outputs: HDMI1, TXP",
 			   VC4_ENCODER_TYPE_HDMI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: TXP, VEC",
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
@@ -415,15 +415,15 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
@@ -440,7 +440,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
@@ -455,15 +455,15 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
@@ -490,17 +490,17 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
@@ -519,17 +519,17 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, DSI1, HDMI0, HDMI1",
@@ -540,19 +540,19 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, HDMI0, HDMI1",
@@ -563,24 +563,24 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
@@ -599,17 +599,17 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, DSI1, HDMI0, HDMI1",
@@ -620,19 +620,19 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, HDMI0, HDMI1",
@@ -643,27 +643,27 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: VEC, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 70b7a771ff47..de2107e593c2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -489,7 +489,8 @@ enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_DSI1,
 	VC4_ENCODER_TYPE_SMI,
 	VC4_ENCODER_TYPE_DPI,
-	VC4_ENCODER_TYPE_TXP,
+	VC4_ENCODER_TYPE_TXP0,
+	VC4_ENCODER_TYPE_TXP1,
 };
 
 struct vc4_encoder {
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index a5cd9da5d6a6..28346729c2dd 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -350,7 +350,7 @@ static void vc6_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 			mux = 0;
 			break;
 
-		case VC4_ENCODER_TYPE_TXP:
+		case VC4_ENCODER_TYPE_TXP1:
 			mux = 2;
 			break;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ecd2fc5edf45..2979d141f3bb 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -515,7 +515,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
-	.encoder_type = VC4_ENCODER_TYPE_TXP,
+	.encoder_type = VC4_ENCODER_TYPE_TXP0,
 	.has_byte_enable = true,
 };
 

-- 
2.34.1


