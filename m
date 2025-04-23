Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFA1C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIYSdEWdYjNWg1JOdzl1CekCVHSxAkDwX11n6K87S48=; b=ngdEnAKS+lAsLmP2+4xLbvPc8Y
	lQ0cPeoY8b3RRnmXTjfyw4FQP28gXc9wIu+5TEHPaIJl+UieMnwpmm5Ga1fn+sehfKvIrws9i+6c6
	ClduUXG+RJ0jZMXqIC+1gzmJ9WxkoEVY7F90y6hLvuYwqEvTIx+37dMAiQy4yxHoagkUIgQeaRFxe
	MbcVCupJEOCez7BGEQ3Av9KLCOORTi0nVXuIuOnFOWuEen8bO35g6bPFRp/YcC5ICQz3sSmlJGpB9
	rG4auUalwXOiU559zXBvalmenThg0NCBqXRdRUM32hBS52NJXhrQ6n8aoMMb7oFNAIA60KCL0EKrc
	XjWeS7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqO-0000000BlJN-3J1e;
	Wed, 23 Apr 2025 19:33:16 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fcO-0000000BiUZ-2t94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:18:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-227b828de00so2370415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435928; x=1746040728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIYSdEWdYjNWg1JOdzl1CekCVHSxAkDwX11n6K87S48=;
        b=lqgUea3kytbEhjNV/HSfPPJpcF3YQqP77o56kRfHcgfJ7QiOmTz3StddOwrqOb3cu4
         v8NSn7k1wMQge+8AXPKA/26BNCXBxJTZ6RYykkBqO8DMQyxxFUPbp5sy0vIH/xAX2VtR
         cE+GfbkSaMkcYwPwKqIrOQpR52X+YBzRF0iyd/BXaickB/h4JnKF6NmXZl+MzQggFYS2
         w5nEJLB583Ku260mOluMv4Fv1qmzAJG0W1m8pYlnZIn0JgCm1K6ya8Y+GC+U5u7sgLi8
         ypOhnImJYILnhMRxo3tkhLS46a9Xs884JiZbva/wljFRuj9QRwzkVhDDgGyxn629447b
         2XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435928; x=1746040728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIYSdEWdYjNWg1JOdzl1CekCVHSxAkDwX11n6K87S48=;
        b=DioOmUysuxfulFiIJS+I0ebKuUPrZzExxtWvziS1MpABGK+40v2atqcMQSqM75hMfT
         l1gbYkV5MfThBrQ1t91cz6OS6Ri9LSMhs2l0Te84nYzy5TaxuRxpCi/M927se0YPbPqy
         5cY9y0m6W10c7mP6x+/0CqH/l3PSp2nNf7wKVwnka3CywfNNklVTKN/oi2YRprrMUoGS
         XnOoP701x8gcMIKyfErQOXxsybT4JhqfG0/Rd0v/UQlMKhveGRfnoSykdIFBxqk7UBLm
         Uuta8w4SscBjeNOVinoRqVZrt86LJDcMpgIo9rVl58wCS+pfasx8SukZuFBnQgIqhV4H
         yREg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2GsWLST9RZBo2m03gKg6TsryGp3KrvDUz2/X/+/IoHyuwnYGgOq6XZzrcYQ95PYwq8hawpb7rM4CtER4SUP+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3xwFaL3q+C2Fdi3/b3lVvAM+fQ09mqXZT0lEiRu2QPf9d+XNY
	458bZyYCeaxS7nYSNEgAFP1TZltznUzOU0MlFBIvKz2/LKUj1hLNaTVpIZ9gFnA=
X-Gm-Gg: ASbGncvaz9eq8Wnc7ldibGpMILKRzOb3KcKrnh8kaYulFU5xSll8uT9HdXCmE5t1y22
	Jc5IEZkN9bKNKaSFiCyYleGKaAHrP7lVQlWjjfcxzdCUaHxVbpXcH9Y/DpOj7lSZ9Yh0SZnYW4W
	jqpIyCk6nhpYXBkRjTvmSVSXiTw+ZO+7KnwSgBbjQLbwf9CBoTq/J0jxkCNPhkRFBnQL4ASfBw+
	/+mImiYSTxbmAJ7dINnT1jnZrg4YGS3M7KFgR/qiWBCpULEUpVwLaFOdgjfTdvmYw6tXG9mMe6O
	15H7MxcSIy0t0K3xElvlXS0CDs7nRVskjrvKtauseubmxr+v71IA
X-Google-Smtp-Source: AGHT+IHISSI6sxpKSal72ZsfL0ROGtb7EMezHqIHuGuTTYCadSEw2oEO51PUIm+sClTFJHFj5M10pA==
X-Received: by 2002:a17:903:3c4e:b0:224:584:6f07 with SMTP id d9443c01a7336-22db1b31039mr6838215ad.37.1745435927558;
        Wed, 23 Apr 2025 12:18:47 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:47 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 23:18:33 +0400
Subject: [PATCH 3/3] ARM: dts: vt8500: add DT nodes for the system config
 ID register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-wmt-soc-driver-v1-3-bd8bf32521c2@gmail.com>
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
In-Reply-To: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=3343;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=6W57QYzLUsii+2lgI/rDLUsSuP1BumMw2PCPR8oLvN4=;
 b=Ll1xSdAGEInXI8OF1yoMnE81rYGd2G/d3jEJXoTAF3+ka/+yccvvibfADDjw5UNi74/48YtIO
 KkJT2+QYWfgATNn+ZaZmwM/vHU7J55mRU0bnOw4ATQz8mugEZmxwvTL
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_121848_739112_EB1E155A 
X-CRM114-Status: GOOD (  10.95  )
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

Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
MMIO address 0xd8120000. Add respective device tree nodes to let
the system code access it at runtime for the selection of appropriate
hardware quirks where needed.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index f23cb5ee11ae63222276c8ac178c52a6a3872c0c..1f81f0cbdb7e2c2378b62e40afd3675303bf8cc1 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -55,6 +55,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index d9e1280372c55c5080d242014c2392eaf4335d11..adc239a9999995c077dda0e2ef3a76066264bb8c 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -66,6 +66,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 35d12d77efc0f91e3735b98b8ec1f25a62c9c22e..2139d183a92b18583884f9329ad286e9da98c066 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -62,6 +62,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index b292f85d4e69b43d6eeb4525113265722a7b90af..5b2d3697418dbe668fa3b8586b0c98f2efa6bfb7 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -68,6 +68,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c61717ebb4f1f3523733241c4df11f741ad4ae14..2c4922933875c9c31ea7c979aa8cbcc3d9a934a5 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -65,6 +65,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;

-- 
2.49.0


