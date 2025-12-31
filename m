Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056ACEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nO95DWiLuK/HLrODAyEClEtcgPmdBbgclZ4JIKObwA=; b=lSD8CeL0s8d6o1/dLjaQcW8NoA
	XN+57g3yZv2uslBH1DbJfzlyl9pj1khB1aMieYKcPHUKDhuEVgVWGEalrYPMsHv4UqgRL7ND2HjB/
	/6rkO6s3YbQI4uRHOQGvznz6E0DWYdfskbBbbMtBWzumXxj2tb8jzKcViC08bh0JD3gJ51cqaZD22
	8I/S03hY+ZC1At6t1jzSHEWsZUOL/Tu1VjTNDb4to4RmHHOcqklAHNykBAaNiSGwpTL8jpZMc+wsy
	i6UqxBP/15mQsaArKGPvB3f59EFV8BdsIT6Vf8gux3ehEYFRsj7pGanrdeVd3dKxV7mH61gg7wdsQ
	YAr6+a0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamNG-00000005bUF-2wsn;
	Wed, 31 Dec 2025 02:55:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN7-00000005bPN-1Hac
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:55:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29f1bc40b35so181690035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767149736; x=1767754536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nO95DWiLuK/HLrODAyEClEtcgPmdBbgclZ4JIKObwA=;
        b=U42um5OaEzl58UbOrHPl6mTlOj+ka+f2Omn3Ly2RO3bww27aXmXAYBzJmaqi2hKVHx
         98ORApdK3xZwzAvkow2Zf+DJ35tBEWnjCftIZ+l/76bjMUhqXDqp4ajmU3+zfT27Acji
         DIh624phBz4wBYEKDAWyKaH/o/GwrzTqQaA6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149736; x=1767754536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8nO95DWiLuK/HLrODAyEClEtcgPmdBbgclZ4JIKObwA=;
        b=D9Fz4pPYd+ntW5hp6amn/WUAabCSUrVQ3KPldQSNIek7rlguHtxvJPgTRW6HSIVYMK
         FN7pwmsF451cQidL2qqrnIUlt5k/Q99nEx6e0z1v+9mXyYuk6FfihwiTF4Je/M5d+EN5
         ai3js3IeoSbRtphUB9bmDIITiXI8FdBVLvxaBEE7OJQwCZR0aOwqyuTY0xzhl/cQRQK6
         t8bGrNcUi1Q/Ck8/1FTRBX7FqeLzDwXRnN2DaFCmh7l1K0lDIJoYawPYNz+/8eo3SRCL
         NeaOYLrcCT7KlX0PbMTze+pDttbRhJQvJjMKtV0e+TtSg5i2Ldn7wtSdL9Rkt+iU2Of9
         7pEA==
X-Forwarded-Encrypted: i=1; AJvYcCWmGAAxH9yFlBtZ4VoCbRKA4luXrhVlPk5tonlVV3hkdL35Py2uIgL2FLX10dkg8k/FvgcDIx2uWTwcnEqjoIg0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vaIsdxPo0Lh8lSiI+PBEv31X2Q57zDupEoHUgXoHOU4TdJhp
	ZRoJxiZXuaDxJ5qO+tQOLBEF/Ch20QWtV0QRqigC17e18Pv2dqlIq9LWeLGlOgQSGe8=
X-Gm-Gg: AY/fxX5SFMgf9CF60ydUpeRh3weRhBwmxeR4IIWm6j30aDxSFfstLTVyQeJUVky9HEt
	hg13QaRt/Cnk+LHMDYsvukqkzGaPKzimA4cT4jyLZ0r7M03FgQ99lXs7mOqT3ADXOLpWkw1S1/Q
	qiyg6ZSUu4gfg7jLPQAqh89alOTo+ot9ZQL9WsDyvrfAuvAYJvPDAUM76YDkQyMtaZnt8lTp0N7
	jU+0KWCk0IcTF7QARuoLizq7BibX7LYqXSQeJzQMBXUVarRw+OTLzEtA5LV7+E3kVZIkdgx/IXf
	pjntvutf3vQ0hdwp+O3PA/dEmsRPlNxcn1L5v+lUFuVbZdxCjC/uuoFK/vUVVC1L9eAwggzW2DF
	PkcPcasRS9eS5jgcIZRIta1Q+jvkiywzqMwx+N/kUsx2igsMicE8LQMU+S4raF/7d2GMNV34xop
	P0kIarAXwgmdANBcTt0UB7eCuPLAXsUeQxRQ8r9VXuokCDAaPsNivx
X-Google-Smtp-Source: AGHT+IFs4DDdGoJSiyVbnLhxaEB44PpmmFvpZ2pWdTgqYBNiarv5JfqMMBMRBsjIs5SYY2rb91tgIw==
X-Received: by 2002:a17:903:11c7:b0:2a0:a0cc:9997 with SMTP id d9443c01a7336-2a2f2a3e022mr359025575ad.50.1767149736471;
        Tue, 30 Dec 2025 18:55:36 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm307762945ad.76.2025.12.30.18.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:55:36 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/5] arm: dts: mstar: infinity: Correct opp table name
Date: Wed, 31 Dec 2025 11:55:00 +0900
Message-ID: <20251231025502.1139168-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231025502.1139168-1-daniel@0x0f.com>
References: <20251231025502.1139168-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185538_147979_4AD6F2E9 
X-CRM114-Status: GOOD (  12.87  )
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

The dt validation stuff expects the name of the opp table
to match a regexp and it currently doesn't.

Update the name to match the regexp.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi
index 441a917b88ba..b7d15a3288ad 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi
@@ -9,7 +9,7 @@
 #include <dt-bindings/gpio/msc313-gpio.h>
 
 / {
-	cpu0_opp_table: opp_table0 {
+	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-- 
2.51.0


