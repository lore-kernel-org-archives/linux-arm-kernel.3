Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D9CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 19:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgEGPlNUK43rhNDXnUBKVU3d22Z0I72vU1ZHl0FA+5M=; b=mQRZH9pg2oXXD14+7U7+z96O6U
	nly20wTflNn70dRXtJ//yaIYyTXoBzBEqoLPuUiRS+EafhxpKqAnoD0UWMrO2d92Lpy4nnb73Lwcz
	458FWzEMwZ/ppTVSsVlRaXzI/LzMlVmYui1zvr3XCPEkzy1XfYyP8SzprLF0A8z2JIgC0aVM0+81L
	tIwc3ZHnjVd6IYB3g9wgvNTWWyoMx5YChWl0azarNyp1w13hGgrCB0gI+nVksS7EnF49d69hAgefB
	2T8MQIaxovQ7jy83EGzrk4JnMhGL4HC70XhrvYf+HwpAGL2LIMo9dAgitBntBXaofXpWSSoJwNl29
	vRttDq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Nog-0000000EEW0-1bhQ;
	Mon, 13 Oct 2025 19:02:42 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Nod-0000000EEUp-1dkN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 19:02:40 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4clmtz3sgXz9v10;
	Mon, 13 Oct 2025 21:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgEGPlNUK43rhNDXnUBKVU3d22Z0I72vU1ZHl0FA+5M=;
	b=NEU6NP0VJ9Uar8v/MJPQNoOOq9sDmy69JNJOHp54Bz9j337NYDY1p6UYICf7Zs52rROYxK
	TT3obK2au2EDzWVl/PbyqPi15kU4sDN8DrWlen6o98qkFUhPChs4YWaWZ0C6P/W3Z0F+4e
	ax692jpLk7DxslQY5lQyYbkhaWaC1WqEIKNuh25Qy/d/44XCV7rfOZz2QUNv4jjqcZlYlo
	BXZ/aFSFMTAH3FHk8q1WTDVDSs7CoAbB4NGLL7svApHvNcPrTtFchyfQTadPMybg7h36Fe
	ADOkcixHfRgE8kF/POquVEukjfxbJ1C+lxIbpg3WPlQYFT+cVBgjDZ9n4ujSLg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="h/YTL95m";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgEGPlNUK43rhNDXnUBKVU3d22Z0I72vU1ZHl0FA+5M=;
	b=h/YTL95mjqwfTRKo/7x3jZWSAxBUUgW5yAvJUbyE+Sf1551P+mzDlADqtkPnIKKZMSjUpA
	Kkv8FWIH6UFHPFS59z08Hx/S4ar1Fngn+Y2NXQsKT+xD/mfPmhPS28Lo1RF0rWprgwuThs
	4RF6X9q2vYAy/6m7V3FseKhgcJkUZJE14I6dUNoZ82NxGjhqXCur4rLKQCBRsSEpqJgU75
	kY+z2AeH8/oON5BC8TSH9UgzEbB2hf2NiZ1Mx8YnfF6NAUxtMDueHRWNiDqU3DqJMjSGIB
	Fti0WkrSXFfhA+jcstSUTaC4UN2liBpx2lh3gST/bxgKN8AR5/7Fn2RZ8Bb+3A==
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
Subject: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Date: Mon, 13 Oct 2025 21:01:18 +0200
Message-ID: <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0b0558fdda1c0b00138
X-MBO-RS-META: 5rj5rxchy4bzmxkt8mwszpzp5iyyk97c
X-Rspamd-Queue-Id: 4clmtz3sgXz9v10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_120239_569638_620FFAA3 
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
present in Renesas R-Car R8A77960 M3-W SoC.

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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 6d039019905de..4f7b2e838c026 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77960-gpu",
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
 			compatible = "renesas,pcie-r8a7796",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


