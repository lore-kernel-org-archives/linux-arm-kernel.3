Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB93C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BWR8dmRaEKQHkFK66ev0gVEIwNsNYFwR9W/SfWvzP8=; b=rHEcaMFYer4v1smnqN/AkW9ZOu
	yf9zhSMA23He+f7+EnbEbIPby/O47RQexnpISHvYQmv7we+ATwYMlgDlF0jwh3I3+owqaQsa85xtk
	mRdrrIWax4HPsb/eEKmLM+htt+i5m8waJSHSTWT7dZD7+IQTjyrR7KBQuWn9oukGMDSJopPiPN52/
	C7XvlvM7RkXJCbRa6flkX/8cazoeAxx3vPGAlA5WAXALwKx6t6rpYImwvdAhxTWy1kN2RJYrLM+GP
	qB2hEEe2E8alImwf7sRBAzmSxE6d1ywRYNT97+yknmcYLmubdUkRF0nFmwgTosDNqbPTz0RxKTtX2
	vGUrJxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx58-00000000KPd-3V70;
	Mon, 03 Aug 2026 18:08:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx55-00000000KN3-2b27
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:08:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47fe377a217so731945f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780486; x=1786385286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6BWR8dmRaEKQHkFK66ev0gVEIwNsNYFwR9W/SfWvzP8=;
        b=CGXkINfUT4QoMNdvW1ej5/AA1KHonuOVjsu9GAuiNvm9WnCduOr6B7K6tXibdEZW3p
         14jb8hRX4K1KFQ1rWhLRkEok+F7nVF7r/i7xsAxw6MnrlHJUjDG1AH01pfeqi3lZSqDK
         Ndw9qjX/wcs/yi+K+vuWSl8esagdOtbSppqtsJ+Aw68GizA4vle2yS0d7OgCPAYGdDJf
         QUxrYptlHfqy8lGrBh4s2NWVp87ARLVYBRSPT4P95iH8goCWjh2H084dDPRejRZky/tZ
         Sc00LDJ2+Hw1ZnQt06D97lD9SKbBjDOpQaY8tj0seZneKEckjhxdJvHSLcfhqD40o5J7
         Qx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780486; x=1786385286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BWR8dmRaEKQHkFK66ev0gVEIwNsNYFwR9W/SfWvzP8=;
        b=r1yYi6x22S83V4bGDUDcVVgMzgLB0t/GRC6uG5PDlCuNb9vc0v+l+9gUevbg6LO3LA
         rhYVDHu28b7ynHhSho+O0AUMn+so8aOq4SPc7wu1wjPfnkZuCq0ikyfLbzycqSid5rOT
         lWcNXvUNgbIHkJrTEdx3kB1wa0o1LrVgMOmyGT8/GUpm2Q8D7jy5h970ZLQvTdu9fbXs
         58iGvN6KK4esavm9d7d3ykuJtWU0GKe9xIT0PPC0VGRcxwV88z7JEdrxl8jv9dAVVaMH
         3P1h8kZcZUsovJrFSHo/ngZl+N5CivwqY20fVyOq4chiREcvW0/djSMul7Y6cC8njG18
         cy4A==
X-Forwarded-Encrypted: i=1; AHgh+RqJA6Ncyvie2gLQEpsQxec/bIWP5inLpZUxBh0r13NEsSwqpFM9n9zNCqnnBTeHRr/vKh3t73l0vLYRu5me0yW9@lists.infradead.org
X-Gm-Message-State: AOJu0YwgErD4jlO7At507f++I0yPHK8MeV7uinv2TGa7U+BO/vaAmZ7Y
	XKwiGyimypQDflI8yVcJljJRV5ls+VhoHS6RFzf/cNrpA/YrdQTxdpSO
X-Gm-Gg: AR+sD12AXH/mCprpxAqBu6xgZ0iAt/3qGNQdEuzVweA0XiycPsSTauC8u/kQNIwA8OZ
	pg8YOKC/Dj0zb2eW36udIsmdVP9jEV6aZLaPLdfk5KL2tH41jf6jeA5WYWlLvBHAk2QJdF/5k64
	iNRsqWcs72ovt8EndLq7WMpJU1jXj+De8LcQvf3q6z209GhOEEytKnfTLjfuWd0CCjAZA7WfdHu
	ZIctq7DNnGc6YR+eIdYNjFfWaa7S6FW/Q062sqD1RXnLOno0NdyIGb2MFSM0OQ9LFzNgHnq6Byo
	8mj/H9xYTJFbmmFd3kvX9KfTpaEMABXJJkIQOngeDb41J7BDeBD90EYMaqfAyet5RGXAuSEJ4AK
	rFWdQcHBivIkAt/YNhsHjvuhUAs4Ms6u4YLGvBytewJoBU1oA5UObTsFCXt5P1fw4FEAYMeergq
	uabTaErTU7JaRNfrwbZPlHgEC5TlKNR6aLHpHWI1jUby+w11b+1h5E6pM9nKTljdOA3b5kStfiw
	kHbKSrdTBkF8U4p7ahTBt2D
X-Received: by 2002:a5d:59c8:0:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-47fd72c78ebmr26973780f8f.24.1785780485932;
        Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: add GPU OPP table
Date: Mon,  3 Aug 2026 20:07:55 +0200
Message-ID: <20260803180755.288793-4-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110807_673762_F8E2B1BD 
X-CRM114-Status: GOOD (  13.01  )
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

Add the Mali-G57 operating points from the vendor BSP universal table
(150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU instead
of running at the boot clock.

The table describes the SoC rather than any particular board, so it
lives in the .dtsi and is referenced from the GPU node there; every
A523/T527 board in tree already provides mali-supply.

The BSP universal table specifies 900 mV for all of these operating
points, so that is the target and minimum voltage.  The maximum is set
to 920 mV to also cover boards whose GPU rail is a fixed 920 mV supply
(the Orange Pi 4A drives it from AXP717 DCDC2, fixed at 920 mV), where
the voltage transitions are then no-ops.

The higher speed-bin points of the BSP (648-792 MHz) are not included:
they are gated by a SID efuse bin and need pll-gpu as a live parent.

Depends on the sun55i-a523 GPU clock divider fix: the OPP rates are only
produced correctly with the cycle-masking divider model.  Validated on
hardware with the Mali cycle counter: 149/199/300/399/597 MHz measured
under load, thermal-emulation throttling included.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..a3164b5dd609 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -85,6 +85,35 @@ osc24M: osc24M-clk {
 		clock-output-names = "osc24M";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -121,6 +150,7 @@ gpu: gpu@1800000 {
 			interrupt-names = "job", "mmu", "gpu";
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
+			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&pck600 PD_GPU>;
 			resets = <&ccu RST_BUS_GPU>;
 			status = "disabled";
-- 
2.47.3


