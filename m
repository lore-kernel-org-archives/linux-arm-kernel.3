Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E149CCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=; b=Q91786PA9yYChOutXAPHWOsVKt
	IqNGPnncbFu+mgmODlFGS5oD4jHlzXWLccyzFwtalNXX75a7UomP6Mr7y6NFH7KnS/mtqyV4SPX5D
	n8Y9JX6OTETa9SXeHVNk68vvMwm/3vsxL3vIjO/rGX7QlU0eYTrbhNd7DvGUEwyfRIXQxzMagnjiI
	DoXMcZGDD2npdtJh9lnuRPQr6P4OKcf9tos8k0eKiUIIjPrONMScDjSi2vEw0oa++EYEF3ZzeeyrS
	N903lsBkNDM+z6SPHGJ0BJbQDDvLSbyeKYWLG9o/q3B6oETc2I3GM1CwzfY0T3ojvcmOT1CgjxryC
	cVL6vIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwYZ-00000006Zme-0Nxc;
	Wed, 30 Sep 2026 15:49:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwYI-00000006Zan-1oUB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=; b=eoocSn/bYRJtHk9WaTOCQbbX+K
	1YKYFAgZ1jUfxRuLPANiWK08/qN84KswVPNecj8XYrthJVCb6vTDs7d6m35CQHKqAcITJshnwB0DM
	xFLtk/yZE0Ak6cNmFhE+a5sa/rTy2dMmuz6Dr6ggIaaamdFnIezTFZuLJGpJTwKnfM7XqzNIkTP1V
	Ny/9uNBvdRecDwe0RnwTlLa+3CliZAFmUPi9BBuYMqF0o6RRy/MBFiJd6xrGMLswDoUKb3FpyCM7H
	BTlnHyFZlx6ZAnmtgMVKLTjH1FMWBYYKUm3/nFoVh/AYHXSvHV4LFJJf04Wu8Kfl4rPPH3iqV93zo
	wFJRmsUw==;
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwYF-000000041YI-2zl6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:49:01 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so2912121a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783337; x=1791388137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=eEwRkkh+g/46dPPeXP5w7rAEyUixbG1cJn9Uo595fvANpRp5LPEPAVtC/QBOUCBPVT
         EfUKV3pm7L/xhNsiAkawRc/67TVnBg2gaOx4WNtlG8uUF5cs/pp2Abw/gEMQBmgzfDIn
         s3mKThRlFcwXhfBwTjH59t/EyYcXk/Q0I99Cw/ywMxQIRWu8jxnSlBZTvOIKeYSIXNjX
         m3a6XHp99OjFA/SFd++u4wrzSxbf8pySVozMcbdFc4naiZKGH9Cam9s+VGu2NP0aeJlV
         DR9SlXv7ughwQ2cFsvUMjBXNgXp+iA5ENnkhj2Ojr/SBXARC6XwvWek9A5Apny2PtNcY
         o49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783337; x=1791388137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=N6GSfr9Xn+P34PhCP8slAHhHKuVpsGV2c7faciXPCIkeM0AVwxmntnH6BOmJpif+Mi
         hpUBzA/S2mau7yfAjIlQN1VsDmtRTgueC9D8w63ub7YdXz+aFeiP4Zebev42BBh1uPJf
         NowN5ROSIv8bTO2Tfhv7kJstWT9akB+ukGx7xoEqkx+1PAsLPeN0izsRRf3zktBTrMRA
         k69taFhMhtOxb24XFNqXFfX2HjOFf5/gerb5tjIU9ClLQmish+dxTNZS4k1jnpLmKUQM
         4DU/5oFUNeyo9+Z36aniHN8P0NWnYR7wLNtAKnS1/QhHowZEg0vVvfZPqdBzzNgVUFUa
         VaRw==
X-Forwarded-Encrypted: i=1; AKwUvByqCpSYNWdEgICORhWreUbyGkBFQr1fIHERoScFCSoTaufbummOV7J5olgyTcfed8wfxIXQ/IWQ38of1M6rFxXP@lists.infradead.org
X-Gm-Message-State: AFq9FYLZ/L2bnJ8ih1GFNJtc5CaeWCBX4dH+8+XC2MFpGoxS/XggNgtX
	dNKJGOgrsmx9x6+HvhataaMhVCpV37sO39jJe59UhDkVLG6agwE2D3g2w/qek4t1Wruaj62N+AH
	VyzWfeecZ
X-Gm-Gg: AYBFou0soEvuN4QWxVaXT1GkmBpxXbZmROMJCuJqzOow/x80W4MSeON2GYqpZKsgGQ1
	V0Zh1fyL73ApNJmrN5CJltsX1dfKQWEw7HhIPNcOnLMCow+BsTHehwN7He1ptg5YA3Sx/aJt67I
	uX31+5+hAgTeij1JbfBr5Mjy3zq+QBhmn4yxxDYxeo/7eknYWtu0Pmv5yQoFNld+Zsa5zmEG4zq
	4bKf+O8kpAAfkp16CBHWyPM2LRvlmhdDhGLGhMbuZQMxkj6l4TWDwI6Vmsa0CAmw2VIwAtwBEOC
	0s4cDXiDXmuDAn2zb8Lx6UvHZEhyR6+peTvEKsWUNignYh+PDZfmC2I/PaeovhHuSr8efkBJJfW
	tIeb2fMr9uEZHmtR3dj6f7AlHC0T776ttxGtKJXAKY5KnXVwpuORmayV21zX5EIendNyZGgXMaj
	qvqiKliF/hWcP+Nu56X+6+9QR4ezIrfB5wovtXNNlxg6GSjXHtEliTToozYepQ6Chgh6PZa1Vng
	towgFJW
X-Received: by 2002:a17:90b:35c3:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a4d154522bmr1584586a91.32.1790783337518;
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: allwinner: d1s-t113: Add the CSIC node
Date: Wed, 30 Sep 2026 22:48:35 +0700
Message-Id: <20260930154835.402684-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_164859_868728_B151E8FA 
X-CRM114-Status: GOOD (  12.52  )
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

Add the CSIC node to the dtsi shared by the D1, D1s and T113, with the
pin groups of its parallel input. MCLK has its own group, for the sensor
node.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 13b1e57166..dd4c873457 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -70,6 +70,20 @@ clk_pg11_pin: clk-pg11-pin {
 				function = "clk";
 			};
 
+			/omit-if-no-ref/
+			csi0_8bit_pins: csi0-8bit-pins {
+				pins = "PE0", "PE1", "PE2", "PE4", "PE5",
+				       "PE6", "PE7", "PE8", "PE9", "PE10",
+				       "PE11";
+				function = "ncsi0";
+			};
+
+			/omit-if-no-ref/
+			csi0_mclk_pin: csi0-mclk-pin {
+				pins = "PE3";
+				function = "ncsi0";
+			};
+
 			/omit-if-no-ref/
 			dsi_4lane_pins: dsi-4lane-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
@@ -997,6 +1011,23 @@ tcon_tv0_out_tcon_top_hdmi: endpoint {
 			};
 		};
 
+		csi: csi@5800000 {
+			compatible = "allwinner,sun20i-d1-csi";
+			reg = <0x5800000 0x400000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(95) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(96) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(100) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(106) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_TOP>,
+				 <&ccu CLK_MBUS_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&csi0_8bit_pins>;
+			status = "disabled";
+		};
+
 		ppu: power-controller@7001000 {
 			compatible = "allwinner,sun20i-d1-ppu";
 			reg = <0x7001000 0x1000>;
-- 
2.34.1


