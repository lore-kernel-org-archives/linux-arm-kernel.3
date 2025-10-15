Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D163CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WALWGBujqpuz8lR80FyOJBIEDnbfCjtWd9uM0KYO5Yw=; b=UagL5EUD0JpVslzsbFJ4z19FNH
	GBlrMhNuhLKxPwecegyEWrDhpwAfhnOuesIjr6EHTmrIArEMkjLViYlOGGWJMLmD+68WLi/ar+KuS
	ugrilsuItkom6/MSA2g+dPf1pRYw6aiDRw133LozzYymVdjNGp7rZfi09qnVJrvAgEij/oIlULtxG
	9FTnV1XWBmzMArdkKdh6jcMm5+D/xMBtqdGzpC0sbAWMyMfiEV+itP5tgZC7Y0VUy5nlf6z0VPXRx
	DQkc85ZZYB4Jn0PYt3Lb3nProinTwWG88FVESMZpYdX6c1txQ8kPO+HZFwr+BIFQPZx+MZNsFT7Jv
	cV+Zi0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93cT-000000027wP-17Ho;
	Wed, 15 Oct 2025 15:40:53 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93cQ-000000027rJ-2tak
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:40:51 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmwK12bwPz9tgG;
	Wed, 15 Oct 2025 17:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760542837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WALWGBujqpuz8lR80FyOJBIEDnbfCjtWd9uM0KYO5Yw=;
	b=ts5+XU4E9uoeHP5aS64D51GHt/43rxLYhmiO+ceTFAlILlRkBOW4nuwRPhS/QoDBsMaYaU
	KCPIayrqg7nsW4oZQ3S9IwE8p6SPMTeujQ53CjnBgInPF8bGhU18qcM+ONY4/fSACDfUIC
	lyL2BBOcApE3N6w+6rrmWUEpuBOLXSx2EMk1pj8YC62TU9FyeLXpfAd7DlAQe92R1qwpZz
	X1QZWMvhZq6ufUFICtCqXXkrmGFmqZEEmw1Ots7KGfwz7atEJspdd7Oa6pgngD4RLsMMLh
	57lt4tIyRcWKeA7UoMItrjtW2bKKVWuxMW0RIj63wpCSCES1kmXIyIYBkKNKcQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760542835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WALWGBujqpuz8lR80FyOJBIEDnbfCjtWd9uM0KYO5Yw=;
	b=Ox3W2JtanoRnnGjuRU71a1yZIYIdVPzwidldeUfyJ8Rh7BK1YGGrheGYY5oeSM6oDNZgzb
	bKsUn0gaex8TUY18GUGxZzMGPp5oNStT8JzPJKvff3p2YuFpnnso5FT+QdLPNFpEcUNl8m
	9CYL84WwKmJA+5rOq2keXj1PfIAm0jW8P4wt/aBNRNtx+3bCfe/wgyrU9r8GwjK/c4AU4K
	8LBEvA/Kax3eUKobLyaNjylwj0E3tJbzAofHE5Mzh0GkeSgN36I5dlwhmibhG/zLAWkfI6
	K5+pC3s652vYmuAtLZVngCxQ7JdGKXJhJF1YBE1fx1zlilWdFXCgFBnmu/Y9KQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Date: Wed, 15 Oct 2025 17:38:58 +0200
Message-ID: <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e2ada218b4f0bf9902c
X-MBO-RS-META: xes7cftrux7je99qpochttto5be99b3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084050_885833_0AAF6C31 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77961 M3-W+ SoC.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add RB from Niklas
    - Fix up power-domains = <&sysc R8A77961_PD_3DG_B>; for 77961
    - Fill in all three clock and two power domains
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 12435ad9adc04..aa7f5de61e787 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2455,6 +2455,22 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77961-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77961_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77961_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77961_PD_3DG_A>,
+					<&sysc R8A77961_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77961",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


