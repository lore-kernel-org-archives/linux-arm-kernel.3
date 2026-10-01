Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D741CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 02:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=; b=D6p61wVQZGD3weVAax2zINsWJK
	GvlYRs4qCyBGDD2VejSy1mSj1EwV8SL2q4zo0mq7B1lhkFk73DeKAJXtplch05Ak8BFgpWv+7XroM
	d0lMasdR0YPhGMVjjHklP+yNUFHCRFbbtHpgPHZDueA1gbYjA0cVyZ5A7Aft0qKMxuPrHEvZvfd6y
	8f1Go3Y/JU3TJR+ff0KeReJfT3AVj/0nS3CjD2BNyAT390qNlKAo1XqnXJiGL11LIEVOqmzdJTliH
	GddGpjii01c+fcYCVqs0+Wrr/yWuSPGDXeqvMdTFI58XKMyhk39YvOtuXheJI4AQmxA+2j7x0eQjY
	y7O1WDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6Td-00000007bXv-0ki9;
	Thu, 01 Oct 2026 02:24:53 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6TZ-00000007bWJ-18eW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 02:24:50 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so2155397a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821488; x=1791426288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=Es+l76ghyScxxEaVu9o7Sr6QGISC6Bfb0bo65Ak8iLOuExpM3Sn3nRkFfmOwuXXZGu
         5FHh7ObpAQMP+z/mDfW2MWDZPZPWc298V8i1R/F8B0l1o6K9Kw/k/ijDt9zqNUbynu50
         3HD2SdodBCredrmV0ucPawGn4JPi+DBsVxoJ/oAtFJQYZ54gl9tsQpAPh/gUrTi7s+SL
         w2jBbUxPcG2Vm1td2RKEp/b9odr9yfdHiwHZINgnSOj0Rj+FOw3lOKULRrPwOzF2QTrj
         OVRQjdk1eygmeoEQ1oEgCW7/0MoBDgvmhzbNJ6dW3NOaaSvcY4jjJCn+gqCckBzaPhRB
         yrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821488; x=1791426288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=jgEKKMpyJFvWTbM6XnMe464SoMC/72vM8sKNXlLL3r5fOgWF5csCMrNZuSRIRUGBIc
         lGrfnPGJ9GA5lep5bzvlnmA0bSi+3B34C0KGy29q0gevOkCz94Iq4g0vQxjcQt+U5Ni6
         NLFSZ1lWVX+Nv8ZPjlR5odzJUH44uzLYzVSKYcRX21i6CVkOOJkdhv+5hbrDkkuVCSq1
         K1XVIab2iLvhFx9WE2BwboN5JMaUQ8/iZhEnufOTnWAMH0SuwKtnPDBg3gJi40i5rJTw
         q36HRsYDMY5BBrtUNnYz1OZy43J2kCJY8/CpOwHp8NTwB3lP9NpJ/pZ72/c3HkwydnO5
         Ubtw==
X-Forwarded-Encrypted: i=1; AKwUvBz3wOGS/nY/nz5sac7vXnxcP6xm5Y8AHfEAsVkHGzYCLOKm4jQRee9noHKowvMVKlqRQSmpesd3gp00bBm1uSMp@lists.infradead.org
X-Gm-Message-State: AFq9FYIFKd5m1RmMvugyYtaeR7wh1Qh4GUjB1SMR0cdJmqdZWDiB7WlO
	DPZoyc+kb2tNnB+w5EHBYITYGkaASIvRfFAdlXNnzA8TI5UGCUT82oap
X-Gm-Gg: AYBFou2xaA+dyMeF4wg81QaNI0Jf6klDh6/HF7Vw/19dxi+AHPj5cLt2sj47vsP73Yn
	3UsTJvWC+N0AOvz0t1FNBlaw3gZJrThbHr0r01R3uGt0I1pJvm4cYSusjZSswKzeRshsk+b9L3z
	quHQl73zwojg6dPHBkHUj+CigmSSgVHtH+uctSQ57JO1lx0lvoZvCWbglzQ2g2cZovVJRai+Opb
	fRO+0U4ZFNUUcDJnnqdgpjH3Aufxqeo/4BrPaMe3dN9GiCek6p0L6QmhDqyQnw/os5hXCyza7rF
	N6cTyGeDgL3Sj4a7Wz/ySDRkaA2xjco9MO0oIp5gEQnGp3mQOjc7ypc03aUh/1MKswB7KPuXAVR
	T/yG73JuQSOlZV1hsZLh8ZwR2gUGt2cg5hE18HJWLhiHesaAydwopqG3dw/SYNJVKJq7pukZ2Fa
	464GnqYnKDnWZFwbTN8ZcC11AK2J10ABxXKUzMoCtMOao2I38lUHVWc6MCIQ3eYJaHj0h7YmBd
X-Received: by 2002:a17:90b:3c4c:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3a4f2afacd2mr752019a91.2.1790821488332;
        Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:47 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Thu,  1 Oct 2026 10:24:14 +0800
Message-ID: <20261001022415.913959-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_192449_313879_2A4698AF 
X-CRM114-Status: GOOD (  10.28  )
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

Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
that used on some A523 boards.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..0ec5d19f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PH2", "PH3";
+				function = "i2c1";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.55.0


