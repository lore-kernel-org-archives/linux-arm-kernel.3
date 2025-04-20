Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4879C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6B760vwD3lkBSm3PWk3A57ArcHkVyL13m2W1khg+TY=; b=RUmgQKGXWIg6F+QCaJoRP/WnRz
	QCUWKhH4Xc2Lo0/btjXyOt8+NceMXydFBfABM9zgTsDTaCCD2E3FIqcXjcN1o/D8+kglroILPAeWZ
	3CJE0yfDVaK247KCqVc7eOo0nWZMcR40q0tTJr0CfyDzbICnSShCXrhP0kRxV4dRlxTncb4qHpHhP
	4LMeyVKxPjtPW6ci5z0OE0LgCy7wGfEl4Oala1gMJd9ZdX9+xvNknEcsJYk1ehH/w9HrD4KN6W7Ox
	eTfiFnclI6rJdM936XcUXloT1F/QPEpFtTaTDhEoePwOdc3FMHQo/4VgwNctqdlGFzu3XJTj4f5/A
	UyDT545A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Xvn-00000002nbN-3QQU;
	Sun, 20 Apr 2025 16:54:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XqF-00000002n2Q-0K2x;
	Sun, 20 Apr 2025 16:48:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so469344566b.1;
        Sun, 20 Apr 2025 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167705; x=1745772505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6B760vwD3lkBSm3PWk3A57ArcHkVyL13m2W1khg+TY=;
        b=YbsDM8SuSaE3O+t8PQ6t3jfO0PvcL+E65W22OfS7Z6+7+UNNoZoCJSIqLshEq6FVjB
         Tp1qUhchC5u3BbiUHgB9Ur0Ydj6FEW0j9QLn6DZhJrFVkKgnAx05yQ4beOaQwTGEVOW4
         bYlo8STkKGOXMwS6BM98B5rqSTmuwYuOF/Oi+RRc2VG2NTbWmLfVcOAOMO0mWrqNePEM
         KMu1TVuh6wP+ubahJqf/jOSvTWIUx54Ou3kYj2MPWWthqo0UhHeqqdT08X2IKFuo5ypO
         8eYVInYv4Z0TdrymAhsA6EiyToWk2lDXrm9IDGhvy7MQ93wVSv2fRX284L+DFZTB7gt3
         ACpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167705; x=1745772505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6B760vwD3lkBSm3PWk3A57ArcHkVyL13m2W1khg+TY=;
        b=tNxPF7VI4oQxZnLbVaneAyFPLdzRh6hrRf13QIXsEFupcaE4MsCXfmhvV0MMYuiLjb
         YJp15mPS4Chobf40ZBbt1MhoGGENhpULBfw/VsN7Vowx+UvAvNbRtvMMK+PF/lZgG+4a
         YalfT9ky4dY5MqPOVtu9ZYRubOnH1q8Ge2GmlU3766WRb8+82Yppp7slLm+HkZk0i4pu
         mhLmxSA6gNcteCrrrnCk7Lfsnhb5kQAiRfq1B9wepEBfr6uq+kCTQ0omEENLfmqSd1aL
         PUZzCv3x+fVFpuvEqaNFsHMbzRZlxW52k8Ma8Hc4KA30fxH2RGYjaPvfExax8ybLGmzQ
         dOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxWFnvPIZe7MdMOCQ9W6z27POqLXphHiX3fvFJnkNliK8SgbaWdSuVr3IbNECr3TFq+UcgxIBFbMEYpIUqJoJZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzKNBS/lCkDQLJ5Owh/covpSQyE25zcSAiwL2ydWAeoka61Kc/H
	hYf0DBlIru9+oaOMr7ZMHt1QfMWQT2e1RtUUnJoKw5Nlsb7BflwhIH+pGg==
X-Gm-Gg: ASbGncuFta3sAGJnwsEGQ6isIVlyEnfS1O0kP8zO65ukVF8wD9CEZfrbgJg8W0y6Wrw
	BC5lQxJkjn588sYFsB0k//xWQkAf7b7tvpH+bG4TVqbd/HHq00Dma1EsBMf48p6wkqjQ8IiLdB5
	h8GCCDMkGrizBKkqAtllNFGB0+QO0ZFrBpqj9x5XYf0pY8mNoQVWNxZV0vApYP2ckO2XyKDV10i
	9Qhvfs0lFuCeDF8Jliu8lGEPBA1+K8uxifXwiqAGJ+4MbJVbbVjxAUc8LZx8PoXQCxvE3jTIhy4
	9wpUkLcUdgllxCYrBENDXMk1Mo2McMx/nXvn9k11Ncht8DUTwB2uQaMg4BhpAEhqtRlkV38EylB
	uRCFWAqhnxKDmX4WgSQ/qSssgUgdwA8LJmfIjLYbwaxhUvPDHA4SMcEBssdTD7QFVgA==
X-Google-Smtp-Source: AGHT+IH/eLbPz2QxTBGbuutkzwofZVG2md1CrF1k2JxxXi3HLjmA0IuJvyPtAWBqRGuXvGc9OuzF1w==
X-Received: by 2002:a17:906:6a0b:b0:ac3:3d10:6f with SMTP id a640c23a62f3a-acb74ad845cmr846203266b.8.1745167705255;
        Sun, 20 Apr 2025 09:48:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/4] ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:47:59 +0200
Message-ID: <20250420164801.330505-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_094827_118713_7116C2AD 
X-CRM114-Status: GOOD (  12.85  )
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

Device-tree expects absent clocks to be specified as <0> (instead of
using <>). This fixes using the FCLK4/FCLK3 clocks as they are now
seen at their correct index (while before they were recognized, but at
the correct index - resulting in the hardware using a different clock
than what the kernel sees).

Fixes: dbf921861985 ("ARM: dts: amlogic: meson8b: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index faf09f77c605..2d77b9876bf4 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -406,7 +406,7 @@ pwm_ef: pwm@86c0 {
 		compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
 		reg = <0x86c0 0x10>;
 		clocks = <&xtal>,
-			 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+			 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 			 <&clkc CLKID_FCLK_DIV4>,
 			 <&clkc CLKID_FCLK_DIV3>;
 		#pwm-cells = <3>;
@@ -680,7 +680,7 @@ timer@600 {
 &pwm_ab {
 	compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -688,7 +688,7 @@ &pwm_ab {
 &pwm_cd {
 	compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
-- 
2.49.0


