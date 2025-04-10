Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD0DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=; b=h+bf9TtX76Kg2VmHaUvM2Yosdg
	FWiZVqTR3U2MZ4HUijXHFbFt/h5343TVPJASKi8jd70+5N11n0l1Vum2scv3ix8h2SqMu9quZfoLb
	LLO7F+DxFJrQt31AiE9zz/DOhW3Q+sqs6YqMtb/FMuOibk+zAwkUC7OH5G9jCwqnRufPx2nWJafQN
	geUaCoAGMcJEPNNkf1hS1A51hfR9C6MRwJvqHO/LsW7yar+5f9Ur/Bymf83z8MOTT7rxRpcpLi3ku
	WrTCfzq8vrk/3XLqpQjI4HPPo81iAND4ELjGpYJqFCUkSBg085/qJs7JPa9wUM8w/awXefCiazqpd
	/4ZN9Iwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xsV-0000000BhF0-39v6;
	Thu, 10 Apr 2025 19:47:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xla-0000000Bftm-3wZg;
	Thu, 10 Apr 2025 19:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744314019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OkgUZthNmo+Egj+G4jV+vRnTkJVpQrzM7EQuTN1iJevpz4U9m01yCyR3J5BXRPu+8ctAHbFIOp+zmYTL4KYlm3B1Xun2b38dfbzVy8GFoRnW23dSD0F+zBPlRcLtGFtZtmQ89nK1Cp6vST1dfFbMeJBYz7OQS7xEDGQDXelTE2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=; 
	b=ETYj1Ye60BkzNxmjgTFouDZUcqBw/xHDAiXeplw9owDAWp9vnQfIRPVwMuqJWOkE+lTgb3DhhZA7WLffaDIOaBY5vQpk1PFQ3ZLmc2SNMm9CvbxTV2sbiBuqNYtcfgsP34s7ylZ4FtQUv36gdW3Vxh+wEswElwHg/UGIQ2JokIQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314019;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=;
	b=L7leXApDPBM54bdU1QBrM6mExrCnOG4mLjLvfIx1D6OS2nRdCT+xv5Zg8JqCAdVf
	c0D3xOg8nLnuSGDjjxUHOOfws1EM096tx+ky/if3dL9DpW2c+ZJZ0DIxBo/0wRyrk7J
	vC4IVJH6V+39ZeR/NoK9yqKUFluOiHTI2vsKeQ3A=
Received: by mx.zohomail.com with SMTPS id 1744314017941145.1745690911024;
	Thu, 10 Apr 2025 12:40:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:39:53 +0200
Subject: [PATCH v2 01/11] dt-bindings: clock: rk3576: add IOC gated clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-1-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_124051_045353_69E5E13D 
X-CRM114-Status: GOOD (  11.13  )
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

Certain clocks on the RK3576 are additionally essentially "gated" behind
some bit toggles in the IOC GRF range. Downstream ungates these by
adding a separate clock driver that maps over the GRF range and leaks
their implementation of this into the DT.

Instead, define some new clock IDs for these, so that consumers of these
types of clocks can properly articulate which clock they're using, so
that we can then add them to the clock driver for SoCs that need them.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3576-cru.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
index f576e61bec7041455e10ac18c92f3b33ec0760e3..ded5ce42e62a7f4bc8058fd71b5e9e1d4580f49c 100644
--- a/include/dt-bindings/clock/rockchip,rk3576-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -594,4 +594,14 @@
 #define SCMI_ARMCLK_B			11
 #define SCMI_CLK_GPU			456
 
+/* IOC-controlled output clocks */
+#define CLK_SAI0_MCLKOUT_TO_IO		571
+#define CLK_SAI1_MCLKOUT_TO_IO		572
+#define CLK_SAI2_MCLKOUT_TO_IO		573
+#define CLK_SAI3_MCLKOUT_TO_IO		574
+#define CLK_SAI4_MCLKOUT_TO_IO		575
+#define CLK_SAI4_MCLKOUT_TO_IO		575
+#define CLK_FSPI0_TO_IO			576
+#define CLK_FSPI1_TO_IO			577
+
 #endif

-- 
2.49.0


