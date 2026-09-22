Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11E4C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=; b=lgtwu2cFfHyD6g+0tNuMkDFrLG
	eSUxZS4hU8NBNUr3G23Viwy4tlyFrw9iM8KehlgHBHxnhGC1MEPkVD/xaofIBbyppwHkpdEOXjUdr
	Ri8VRjDOE0fzv7hxPe9WeDQOFax9syEnrqs/p8GgF6puNoUocGt6yBjog9i24BKtMv+v4m2xNtSEh
	lhIKUcim9kuejhMG9VpdLdTQwZB5C1r0y/8OH3wUUC/RxemGBQOTugjmhidtAqGI5Mbi7bA0T2IPP
	MYcyOVLDeIe1OM7nOMAOHkC4bsUVqGQftxden9VMW/QSCQf84rotr5rD631Ztpzr1WcZ4XZVmBb+o
	oF1/Z4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTx-000000046iB-1m2H;
	Tue, 22 Sep 2026 03:47:49 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTq-000000046fm-1IGs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:47:43 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 00721157ae682-895fd505832so27761577b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048861; x=1790653661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=XP4HMXrhzx9l04w278XqXk/qR63n4y3Or1+/Rzc27KnHTSiBD3LPqzodogp3fRo3gg
         8gR1AThxoMj+rij0opmz+TlSIP04sX1EblAXsFrrktFu0WlmH4eU1ZNaK5w64k8u3j//
         J7+ByBxi9BwM8wz5Gzn6LrxB6SYkVuyOv2z9xYXeXxuu9x6gOPKFJm9QnBNZoEcwrMXX
         lFJkHeiTbOujNvm4bD8zsBADvKh0Yk8/Caa5ZtBhJsHjd3lQlSSCQ85+fjQlNXY3lr1T
         2wu3LQpHOTWJNbtR6kG1uhWcaCH8nKmpaJzw+j3J7si/IrkB6X+2RbBOZ/nDtEjj5zpY
         pfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048861; x=1790653661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=hKv6W3KT/1Hsr4teys5EZBeedEawTnRBU86Y6oj/ce6+8b3Ai9K0kuk3EozbEZy6Yo
         JlkAZE6ip2GKZK4xB35alhvh09SeEy5j0+uFBFPMmxKTeyQzVP1eM/MqBC0yt2I6gwql
         ZxGTRnahxJem6S/fOumYpZygBDhr0TeBPgH7tU2XU4IsvIDo9mvwCvTejNGZz1aVg8Ws
         PRtr2DDfkLCnMKVHINY6EYsrCKhOSZ7eKQyofNWO+PwNCtBxZV1rQ65lLXp+DTqTQ59K
         EcYt5Kz1yo4m+ZttS/8mPqXQ06SL5P/R+ekTeCeP5mpATo9SmQXaTSfEoHnBM7KSPIhE
         KfPA==
X-Forwarded-Encrypted: i=1; AKwUvByBG/8/asbaQ9xSBh03Swsu5UKmq2E18+QwJpzMddG3+/Kr66QbsIE9VyuAM8Hx5FUkgGmFGQRugoVFIQnKWpHg@lists.infradead.org
X-Gm-Message-State: AFuF++lEJ2HEgX5EYDB8w2dWDIuUtGSZ38n/KSaUV0eJLYJekJUDaUly
	O6ljkH2TTiA8imXQpMkSqB9NX3Go/mlFl9ZWnL6HdtgfwwdanD0wh9BB
X-Gm-Gg: AYBFou1RcWiSYJa2B6SmLVqv/8ZrG403jVmOi5W3Pmb6XiFFzMQfFH9x+v0uziW56HH
	Xzd44XvjypLXrwQmNQtxCUjY50iCE9qUeXBpkpH9QKJ5ktGCmVLd3IHSsRF1TIJ/p4oKe++Tuqn
	y0u+rZxoBHS+dso0BV/SD8gfeKW3FSM5l7JFqIwBmnBwlDUzGSdzYNzYo8yqf+rrAggWUw7Aj/Q
	2L+nEWQtYIrlm9beJsXQgQpDURhKni1gDVtK5kYDNhL0otK48Q3NcrfWx1iYzT5inIasC88qnd6
	H30QNUUq2hYJADSfo59e/tcpzJzWHmNg0hnotSc+78IrQLzHuXXOwfdp4yCenmWUPCMwnQtLV5i
	/zRF9X/qb9eRIWMEzjlegQxSgMK2moFPhkMDQSxWneaPhIyHqlIpao6tWK1+VXmn5p706GBAhuO
	UWJyrUx2Il4q7C4+pC7H/qsGcLbUjrw+Upqd/M06BEyiZx08q/toUrr6EA1w+W8F7Ehg==
X-Received: by 2002:a05:690c:e3cf:b0:88a:4770:c2e9 with SMTP id 00721157ae682-897308f88c2mr50874537b3.14.1790048861342;
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] arm64: dts: allwinner: add a523 msgbox and remoteproc nodes
Date: Mon, 21 Sep 2026 22:47:11 -0500
Message-ID: <20260922034711.190253-8-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_204742_356211_0D981870 
X-CRM114-Status: GOOD (  11.32  )
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

Add the hardware mailbox (CPUX_MSGBOX) node and the XuanTie RISC-V
remoteproc node for Allwinner A523/A527 SoCs. Connect the remoteproc
node to the MCU CCU clocks (bus, core) and resets (cfg, core) to
support remote processor lifecycle management and RPMsg IPC.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..7c5c39c56858 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -1144,5 +1144,44 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
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
+			#mbox-cells = <1>;
+		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc",
+				     "allwinner,sun55i-a527-rproc";
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
2.53.0


