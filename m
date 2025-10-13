Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D2BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUtG4fYV8VOSGqWxFEwkf8RZ2UUyckF4MGl1rId8mkE=; b=xXwhr8YbiuGPeKnNG+iPNw8vAh
	/yOTtdTFlL8rvKSQRRCfs0Nhy77D5c2AJiUlD2tvqoNHbvTaZfwm7KIAiX6BFeqX1Z8wDTUTSPcol
	nG6Xt80qk9/87nbP/jjgal38WwhnbjBZfeYrtqWspCSo5fkmQWrejFmBu3/wJ3bFaRD58PAC+9DGY
	c+ndRlJvoDTWwpw+jlssFnNBhLmkxl6R4QJpKJAkQacJrNVnhssDdyI0on4yWFhjMs8nMRvXjcnff
	KPSn4DByzWTi3W1EKjru4Z6oTZOyqNYLYnbPEMGzjHI6IH0V3cAT3fHpVj02Mt4C4yc+Zt3n1X6L4
	BX6FTPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8O0n-0000000EGY7-3ghc;
	Mon, 13 Oct 2025 19:15:13 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8O0l-0000000EGXZ-1ybp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 19:15:12 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4clmv40tFTz9v66;
	Mon, 13 Oct 2025 21:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lUtG4fYV8VOSGqWxFEwkf8RZ2UUyckF4MGl1rId8mkE=;
	b=BfjCAX4Z97POtyHHN0ws7NpKpAj3ydeg+FDr1G+do4tsnoGU96s8oASvF5Ex3kxIAWqSnE
	+8VlDFfMLma1cGQonNTu1n9jRDxGavF1YSX8UZrbKaWPgM1grrSU6UOEeU+G9AcqdMVpC7
	6xR1DsNvBQsKEOLtJT4/0nty4v7TYU+C0X7HqoU6ekpaDTneXferLTPHfjgHfq4Nc+1qZK
	2CSk1qEydtK0EEuswgvKrK8h/ffnxB+JV5LFiFUWJJ+HfMeWYOHLYWAr33ruqNGPD+TT9f
	O6Gw+/nKnv1N5XF2GwYoqca4WT+J84e/wFyqiJ8mCn1vfFEina6ldrH1mgXaMA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=d2jpN+HF;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lUtG4fYV8VOSGqWxFEwkf8RZ2UUyckF4MGl1rId8mkE=;
	b=d2jpN+HFFt1TcgyPFzjcLxHZewQqkPEBvQCtbPq3tuisJLc1VNZ4J1IwD57MLOuh9TVcZt
	LtK2U1W5FjtiDJli6ZrHwIbK8jSQe05oIB0eONyTDpyH4vhph7GBAQoKDu7+jGYbwbuM93
	efBfNdVQLJM6CDZat/famKSmGRHcbubvmk5yewVUgD4lzm4CQBeadn+Y6myk3M3/59k3PU
	CMmljowIegQU0IwCUmzrjYtcR9R4Ya1s0WsAykXh6HgY3CPST5lZb1FwPwAjrv0tgLGfLB
	WcD2R2v3qKKjCM7NLbzaI/HpViECdNuvXggzmabYA/6ux4tipAu6aPE9pR8G/Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
Subject: [PATCH 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Date: Mon, 13 Oct 2025 21:01:19 +0200
Message-ID: <20251013190210.142436-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5442c9876c26aeb1ea8
X-MBO-RS-META: 35wuxxwzwhqixksgcga4gmtrfh6d5yib
X-Rspamd-Queue-Id: 4clmv40tFTz9v66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_121511_647678_140D94BE 
X-CRM114-Status: UNSURE (   8.55  )
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
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 1637b534fc68b..77ed99e8d7b9e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2445,6 +2445,18 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77961-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			power-domains = <&sysc R8A7796_PD_3DG_B>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77961",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


