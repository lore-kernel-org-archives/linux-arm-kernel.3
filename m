Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654BCC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=; b=E5+PyoEkaT43Hk5erX9W1lUovk
	SdoDaGfHBCkBTTEzVRJtNTgYbTHmWcSlCzng1C6oblNLJa1EtNzA+AMVRoX8xiKI/uXu9p61kmbfW
	j0ElmyCcnHO5P2OBa2IQk8M2Wam3RBBMnzmHEea7oMQ8l3q6VINs2/BokYnlWLgcljmypoOXbPYis
	Sazf7vkRvBUNtsXkxeegvMY6E+MJuEp4ZgqQQJ+ESuK777SuZaLq98QXnMQNR7RCNRPtq3Z7eCeoc
	g4F5CwXX4VbJ7AMnogSpEqu/ObbzLrwHK872ODtxUlUkB2fUaPra6AX1upPcVUGXDkNmXOl2ghVEn
	38pzQR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoL0-00000001keP-47yq;
	Fri, 02 May 2025 11:13:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoBd-00000001ihr-1UP9;
	Fri, 02 May 2025 11:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746183810; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wuk9VY6+HZcfXuRN67EKlUwM3sJq2okMWDRnwBuDoNSJM1hs4LWAjTwcfPjecsuZl0bNEVm9yvRkMLXdC0HRC6ASybcUQOLCaGIr0UZfzXdfvK3RJ/GZdq0eFlkwVqce8gKE75uDZT1HcgH8jFy/WN6x6/gK3nJhGuoggR7fy48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183810; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=; 
	b=Lqkqd2o80YHYSQv8kXOWLuPfX7fonkMpFKE4U+t4dhHen4jYbXLvh3isP7We+vG+qMK3fThd8j156Q521Y6TuiNHm8coJ2CQvfJifVZTIe/knWebZhRNtxhTUd8vImBnO2aHH3jrLL3z7Tk/u3nazV7XMsLgK9PS4dNtlQjGulk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183810;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=;
	b=b2Ijr5M8fYEB1+Ufw1d+lgXzLkzQFssdAb2gNvPiYyYw2mPV2gL5mL0GJS1XCBfk
	4tYaniJSDIF0R4J1Kst3rnA7OwiPMDpwDc3fTo2FcTPeztLwDgFrFRlxY2W3dyxwwlN
	RPZ45TOy1lK18uLonoRxMqc2QWvTzOTqUL+YC37A=
Received: by mx.zohomail.com with SMTPS id 1746183809886671.6040478081637;
	Fri, 2 May 2025 04:03:29 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:07 +0200
Subject: [PATCH v3 01/10] dt-bindings: clock: rk3576: add IOC gated clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-1-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
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
X-CRM114-CacheID: sfid-20250502_040409_456528_38D3D9B3 
X-CRM114-Status: GOOD (  11.49  )
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


