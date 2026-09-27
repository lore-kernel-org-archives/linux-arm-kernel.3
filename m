Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BFCC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 00:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIkNGJES0hm9OJqnA5eP6Pl3OVYCfTyaqkdgFUAgvWM=; b=yeYW/HXRNigb4uOkDYGSkol6XD
	agOZcErpdcfwLBYl5bexSD2oelyGugbgeQxxQQN332nkji2hidrec2zZ6QfGT0fEo8HuN3Q60C9rc
	fSrFQ81fbg29mLC0lz+rSdivhTxUGaT2eqsKdSCMbVthrsCB++xgd+HEl4IKRVWYOG5X6oEfgwfOu
	voxISeJXPErnpMIkJDYRj5r4IjKlR00PPRwlAveeqgjW2SBsES/wC9gO9Lo+f9K4gt5xCCD31DcLn
	B/OkjoHuiI+lAhrFScb+LTdmdkF/lerJTaOd8d0UYBmL+zphuBQ+OGiehCTEpItjuJIZ0K4JkXfCn
	+rPxaiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdt-0000000FsuS-3R7B;
	Sun, 27 Sep 2026 00:21:21 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcdd-0000000Fsne-06Bc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 00:21:06 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-81b36a8d5b5so258647a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468464; x=1791073264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIkNGJES0hm9OJqnA5eP6Pl3OVYCfTyaqkdgFUAgvWM=;
        b=iWY4yAajrVyHVJzLPX9M9gP3YXnTCrFJ4k+I9F4eGlVYkAjTB6UogMcnPjxJVx6LCn
         kceA7OaUonltj9pnaXg/YzBcWRZCxzFNvpC6plvlC8TqTTkbat7FcN1Rq25e4Os+K1AY
         r7mkC1hmgt/F4Ax+qhJoB4whbZuweOAo2uSSo/dgwuruV5fzicAnGCfbEVmnqlLZ4/8y
         mA/gJfZmLohAKPERJXG8d8LyqdFWOvv5WaCzi7VHCvf7YJhUCQAgMEWCyoBDobeSx5Mg
         Y9Gk2zJO3ZP4/8MqHN9/rixBbfykBgNcxdBx2ZVSW4HxaTp6H88tyNYc3fpCX3uWMZ54
         EG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468464; x=1791073264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TIkNGJES0hm9OJqnA5eP6Pl3OVYCfTyaqkdgFUAgvWM=;
        b=XYj1A07W0RpPl99EJp3PO3XEsYJlJmWnalKTBkFMzNtcqsvh1jH/llKPdn1fS8t3PU
         YsAHkhH9j79g1NJFjAqLVDcBnztNLmdBSpIFR6fAOMA6+3CIuzzljpbOtxQdqT7dhYID
         +rmopqkzWqMoKbRlNM2Z06oXfaFevqd5v7cuuIrbG0UPttt4G0GNPJoroX/5lBK6LRT6
         //ie9wCW6H0zTeYoOJ/JWD46En9OhWz7QckLevghW5OmPmHmd4pQLRR7vRLGtcwdSipa
         ljiDCqgvKDB1RuQRqmFymeJPxHEjkDI4IeeDsopxAdxv+TF8Wq3iOm7vrSF7DwkLGdKw
         3qgA==
X-Forwarded-Encrypted: i=1; AKwUvBz6WL+MKKVIv922zoFrikNY1WWJZMFh4t0UarrkuiLilll6L1F6UqSwYKMHk5POsVqpmEw8QeIAMdra64VcKNpR@lists.infradead.org
X-Gm-Message-State: AFuF++nEQ4jICos1MqUgIXtiTMVq4TiXWBfJtjwClTRXvBy1OxQ6GFIZ
	lbbF9zxfjRjGcDdEvSmsJFZPSpoydzCpC1TD/3ZaslKaI7uc0/yxkHIU
X-Gm-Gg: AYBFou3nf02TClMJAqdmn5AESYQA7JNT9z1kT9CBmbaIPTXG/VHgWauOT07BZGoAg6B
	Yzdc1pCH1XZpHSLSynOZqA2zmwZOTkAWUyfan2jUzmWtEXKcJjszcwbEaF4KdZZ59Npwg//YkiO
	LuL4csKvuibsLE5TNUnyLVQ5EqLATELRSUmYCXLZgCl7OYCfozJSMZGBL8RWJpelaQj4Hh9wbm5
	loZjpT1P9GaXgVRUy6g6Hx87F1HdwIsLlvOiilBBFGs61m/fTEE/b4QxDoLTIMb5j7onZXCxtGH
	Zw4of/qYMdB/FHTsCm5qyvnSkuwaJt+rWAKpqmdiM7dTs2rf4Nn++ZOjPn676dPFr/f2KJH7FRF
	fnlUNton+DONPXeXTzM8g4CohiNuTPKZi/zcS9Wf5GhBs2um2bieOozm71jqNM3ybYRWOocWLY1
	STbU/HgPNCarw483gNqhHvUYYnS8b3NaFn5Gs6fo6yX4l/cJmo7L5SN+poK2Rk0XoYnPF7rKyvw
	2laNttlRFMOPvabKUEesw==
X-Received: by 2002:a05:6820:61d:b0:6be:137b:3f98 with SMTP id 006d021491bc7-6d5b869c1f6mr6321898eaf.22.1790468464256;
        Sat, 26 Sep 2026 17:21:04 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:21:03 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 7/7] arm64: dts: allwinner: add a523 msgbox and remoteproc nodes
Date: Sat, 26 Sep 2026 19:20:16 -0500
Message-ID: <20260927002021.797069-8-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_172105_076017_76FA2F73 
X-CRM114-Status: GOOD (  10.25  )
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

Add the hardware mailbox (CPUX_MSGBOX) node and the XuanTie E907 RISC-V
remoteproc node for Allwinner A523/A527/T527 SoCs.

Connect the remoteproc node to the MCU CCU clocks (bus, core, sram,
msgbox) and resets (cfg, core, sram, msgbox) and mailbox channels 8 & 9
for bidirectional host-coprocessor IPC.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..b4699c4df5e9 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,23 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>;
+			resets = <&ccu RST_BUS_MSGBOX>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1161,27 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "r_sram", "r_sram1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "bus", "core", "sram", "msgbox";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "cfg", "core", "sram", "msgbox";
+			mboxes = <&msgbox 8>, <&msgbox 9>;
+			mbox-names = "rx", "tx";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


