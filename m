Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03C9C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+fH+M7M0QPKx2zeAS0ZDdKGKMrlScq5PHQ29ysgs4g=; b=OAg12RDJqvK5dZusdUsCePm56L
	WANecUZhqHcv1X2Vi/fstJyQpZL5MrZORAcPTxv52BbZfuNPBQGgIZYqhzV0li/AlbbVrxG8MAGkh
	HlKcv5ZfBJVpMomd0ALY52utoztHFmRdA0cWtSu2O388vM6oVIx+j9WHHuvjDjzh+sNr+uZhT5Fmq
	sZ8NEZbbgCh1Cc12KJmjddv7ZzdvHzRzelLlnAa5PmPOMKcIIb0H7lvumdYDfi6QPCCmC1eC6SSy+
	9J5QfekgYsybX6/397dSuGBo5s91sUhh/Wq4CnbpKrNCMDKOzU2ubjMQ18bkOszELWgMggp5/77Vq
	fFNAE9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5s4-00000000rBA-09qt;
	Thu, 20 Feb 2025 12:41:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5ZV-00000000lZ9-45TS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2210d92292eso22453985ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054149; x=1740658949; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+fH+M7M0QPKx2zeAS0ZDdKGKMrlScq5PHQ29ysgs4g=;
        b=CctW1eiUyCz+kz8FZCcbzL4gdVw4OPe6dynBwh0llE/SBO+vWMbU3Sjt7oXwu3MnrC
         uM7G4uojmzq8bFTBHZfTowD1C7xI1fG6KAJTfi89uIhotduCgDT63v6IdhC69tnRwSqZ
         hJXWr8eewpRQntp+dI5UAC0eUrWLsNV/YX4L1/hOSczGzdG534kQ3dE5ohNIqkstqrJM
         V/1O0XrdfJJVqQbz0sgsCM9KygkgYO6ESSIa0w9fFtmCZ+CueyPaShzTbfHgi1vCzpvX
         hbfasQnY+imox7o3HsPWuXankKkQVV8KUKHrUl+N4RPv+MS5JbCkuXmpfRRVnt+aUs+g
         TC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054149; x=1740658949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+fH+M7M0QPKx2zeAS0ZDdKGKMrlScq5PHQ29ysgs4g=;
        b=HEtcB+FInAlK4rrXyduuapQrsZyhVfKiGJKteIJtkMupxmyIIHVbDn3qq/K2J1g74e
         1G6um+h/gcT41nJ7/n4r3xlqvnhel+yuBUBMSWoIPtA2jV2K7o2m2URvRoGGTpAic0Uk
         /AH9oU+NKcHm8qclSOVrQzseuCJd3U8bxDwCE2wN1yZAeIkvNVoUhwZArndM1D+XtKjS
         0CS7BU/GnWybmFHZoysDjzgdd9351qyfF+st4L6xpsDt5K6vGUIlmWvNaXo5/IE85Xc6
         SBIrvf/bbYZeHKRHavGTpqnX4vyqKhsQR7scr9Vwb55kYNwFQiegpjKrG19Hk4sP8SJY
         wRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDFVZpsGUifQTRbWjy52kC3RPqmYku/Jwg8a6njl2B88N1tYTAWTECh+Sxadfx9dppe4evBtLh2c0j/iWO28jB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy7trmSNmm9bPMhBgsmoDBUr8OmH8MuiMlrnmYIS0jZijEN8TE
	8w7czvmDKnidkb+gTdHwfCoKSVJqwMLjqipzF1y2dkaitSuC7E72
X-Gm-Gg: ASbGncv7fkhb7Ld1akxc4wGx3fvThA5/yW+raI47Ob3NEXmWEjjChTRH7sJAYMpmwjP
	nZG+vHwWRzdclADuDFl7rSIYBhw1gfR0NWNyBGOCmF/rCzmc2Yv48HZYdCGfnbmyLjTgJM44xS9
	8beG+2pLoksJCpaVAC4ZTuw9yHaJtXW4RrIFEheHMckK7eYs5cUHxUgekI6Wo4djepfaaT0Qi6v
	r7WTa8JEmZbVNeYCmV5SeO9JACaUmewYYTYEB544DaT01Cjvik4wA0Ul+jew5nmGjCUGABcpPpq
	I2o+DMjOT79xMKePCA==
X-Google-Smtp-Source: AGHT+IF2PoDb3Kk94qSCiGVpPAbMGoiZGlMtDUf/oiV3gQAi27yF+wvBuQ9G/yPKmlllaTDzw98zZw==
X-Received: by 2002:a05:6a00:3a0a:b0:732:1840:8382 with SMTP id d2e1a72fcca58-7329dcb4d5bmr12388136b3a.0.1740054148987;
        Thu, 20 Feb 2025 04:22:28 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:28 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:42 +0800
Subject: [PATCH 1/9] arm64: dts: apple: s5l8960x: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-1-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=v1V3E5WkHVmqS/D472EV2ffRCymQYBLBb580WG2bKlo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+88E85lGcMv8Rj8CoWvDh/DXWVEM+KTtJu
 lJUXhUbSkWJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JDxRD/4wYsk1/SWK2Ze/Ilh8czAZLIhE+GPx1uP9bjI6owuI8/GWARs6kAN5HV7P2kIug9O3TlK
 SGNQfpNtxf67htonZKRdu4kErrjtaCV5FoaGMA3x/cEtmjnDgykcmFBFvQHtbslefA58hO7ecHA
 TQLAb/Sk+O0V0IByofqAXToAuNED/5DOMi9TuNHGa9kEuRMpMkPb1X9YcDgkf7il832Ptc636ub
 lILaGQ4isJoWthOXCNIQa9wkbFvzKucQbZQegUEyMWp4xn73KbVIgpo1+ZyIZB7zkNbdTcedI2X
 otIBsmJalY7NaswnfVyKMSH0F+wpGjQgfZWKhZqsgmkSB5MXu5IsTA3hBVcEAw3QGfzf9wPQWf7
 h8MPZdmspfFdTT/ppimuWvjYfClFIpKq75rR3AnJD50wbi+BNRmMeqBXf2rKu28VW1bfLkijt+G
 PD74iwbKDli6QID3VebOC7qtKLIJ28RsJCWHi7TF5STxA9BMlhWxoJkwMvYiuTN/0zS88pDS5EH
 t8Z8dUEQPtPrpTWurpq3cuMGVceCUXIiDPM78PF8r7u7zAyUdBMDsC0kNos8D/psYlNAPWEAUBj
 4OPEPuP0XjX57aRUr6GGC2VZs6pRg7EexeAPvDtwKph2iP+Fex6DTQBOJn5K5AzDfpbK90HsRfj
 QwNU1bmoLp2Nsqw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042230_017544_347CAA10 
X-CRM114-Status: GOOD (  10.07  )
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

Add information about CPU caches in Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..e58a3a280abf72c0a390cbefb4fdf89942d77512 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -37,6 +37,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -47,6 +50,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
 		};
 	};
 

-- 
2.48.1


