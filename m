Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E05C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TChm7zMrIm1e2zF/qvsCr3qRkxhMbyISPQm5ZZUS90=; b=Bm8xEAFcjydsWWAS532J+MEdzi
	cmWDXGBdYGCDg7dlb9coTcPAxeewTM9kPfcipx5keBsTQUodnTfw1bws+3DHtVYX6kCT6n9yVxcXI
	DBxYODzhN7EQImiSf1EDN77vn4FRlKd4hZKxBmbA83OdpMFZYjQXazLBIgbYMLRk6VPO1DYG250Qw
	NyIK/9CvTMRfjpm992LCKeQAAYCEUzZPUdx9fk23tIFZSG2csVT7PAo9u0Faml0ZvvVBmb6yG66u+
	fL/LGm4sQnDnwLeZgWVUrAX0uDAoPOeJnHSVJd6k1GLfroVAxem5P4mUOw2OjA+MZG8NbqAlui5qW
	/RprdxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGS-00000005ZDt-2QFe;
	Thu, 02 Jul 2026 21:48:08 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGQ-00000005Z9w-1B2p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:48:07 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-664cdeab266so3280209d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028885; x=1783633685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TChm7zMrIm1e2zF/qvsCr3qRkxhMbyISPQm5ZZUS90=;
        b=dkW8+3CCRT8VN7BDsoVvRzCBw1YAHhSXcTmU8IpiHvL8flx/3acUJNNPt93UtHV/k+
         nwHyepUtbcvSBJZi5q56cU+xrYQdzNHRrMuiMUXrymKruL4PsRI4/PP6LIqCpKrQam2x
         krc10kIgahfr+wDvxIGEE1FP7HhRIU0zyL/J51GoIYHTvZQi/qiBlGoTLP9yo35GxRJj
         JzFzn1rnJZDYqh1e3nJT5YmKNZTIQOOmQVJu8JfOamjjqANVl0wCgvbwHgQ4fyOz+eau
         9Mlhw2vpungUjfBamGkrbZMWqDcsPg7oX8TQz7vtDe0FZI5c/zoPeZsd81fix2kJu0M1
         CBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028885; x=1783633685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/TChm7zMrIm1e2zF/qvsCr3qRkxhMbyISPQm5ZZUS90=;
        b=rFw0VFQCvARhnMmw6Lz5jclgZUJZIMNsA6taOPrLSOqHW8Q1hBUuGU9fxsjW/WyAbU
         4cEMLHF7Upmv9u0tCAfqjA3PTlXPyXA1X9BmG5YVxH2aiqmtuQ728neLJzuDaooRrKmg
         W6lA1LDWFosky7OICmreG/yq5eouTwhkWp5hrJ0UAVkDMtiUhd7LTlkTzfiI+W7sepIs
         c8jjAQZ36r1od+SE/4lKZwbJfHmSYxDtREqxUx6FNkX0yKPQex4xhNPngZZ3Zc+davCU
         Oqckvjl3dbEqJ5sb8VEEObup0gO/XxWavZkHHjKbB2k2qcCJeB2Nr8pdvMB36oFrGrvx
         4sCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7/nZxywMKMeDEAKH7uQeW2xBrwyXrQM7u+dstONunO3XpgRYN6wBTW239QbVpkIYB9RWcKor4Q4OAGiy3vBQa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx41BwfZrrPT6OgK9TUzMrO4aLY5Utr8XLCllK3Oly+iu4iVlYL
	lVlCR3vDKGV4Na+in0+DAxiA16DG582JdidkJQPDAH845CRymZonmLUp
X-Gm-Gg: AfdE7cn2ZLXz1PpCJ8EeZCBCBKB7ZDOx4cgB55FzLXxDmmWRvYQ4JQMfgJeLS8aX+Xq
	yXm1bBHt5Gws3WR35HC8NSFXkm/Wt7osAFFQSEkwX3OVetwgSljo6Jq/GzbI74boHY6ejWM8sEt
	lLJD1TWw0rUqgUCK24A+QLLHhHtOAZjcmAm1/u7BZygT4MmZ5i+Rshho3LNZJSi/3NKBh1PMyLw
	IiusThInnJE+vJU/+0TYVDL/oqHqxMMuAvFYcoJz563wbKmUnyfVG2VLrmY8we5D79ERetcmRnV
	v7eXjfz+9w8PSIFIMABIItX6w6+TmaaZU7DpYmMWlp0G1mAOR+ASBk0MYnqOR+FjHytFUfuTbRq
	6ULCbhkyTpImd0emM2Q++v4ojeZUBSDuTb1T/g9bCUL6UeCyPCFN57Btf07OcgUE4SgveOf7G68
	52usFASSeExsH9ayKT0Hqb4RZ4HfSb/u4cXY3f9xhZjfe5zQY=
X-Received: by 2002:a53:ac96:0:b0:665:a0c:654a with SMTP id 956f58d0204a3-66521a0c7cdmr9753722d50.27.1783028884812;
        Thu, 02 Jul 2026 14:48:04 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:04 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: a523: add IR receiver node
Date: Thu,  2 Jul 2026 17:47:49 -0400
Message-ID: <20260702214750.3428694-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_144806_347095_D0A03E7C 
X-CRM114-Status: GOOD (  12.09  )
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

The A523 has a CIR receiver in the RTC power domain, clocked from the
R-CCU, with its RX signal available on PL11.

Clock the module directly from the 24 MHz host oscillator; the driver
selects a /256 sample divider on this SoC, giving a sample period
close to the legacy 8 MHz / 64 configuration of older SoCs.

Keep the node disabled by default; boards with an IR receiver can
enable it.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..5e46c4b1ee61 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -927,6 +927,25 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			clock-frequency = <24000000>;
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_ir_rx_pin>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0


