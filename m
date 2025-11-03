Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FC7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1UGhyuVKrdCv+eXNOryeajBu7PyQpDfmqjFM3c0rY8=; b=gwtdRcr5Amt9KIg04pBVaR2gOv
	HK9fRx8Ak64uszr3oLIKuCSpqwgyHD3dRITWNzK1q1pqtzxt0IJf/ogjz4Bg8c+T+IiDRs0mk8kOJ
	QbYnqivkHhU5C4EKSCuQRhCtV07c23kILA2j6ESkopLEe5TBj5vXJI/TUD6v9O/siTZoqVLnyisaB
	uskOq3l8uNsMLKHwaItUWsnoK72ME0aU4mktaCdP9s/VstPUXgRbKsq9loi5kqRC6uYhwy16LaEPK
	Fm+YGaUpHfeZYhCR5rkr69FCKp8G90aF6gD882sSqYVlkC+cdrtY911mD5T5VGtfyJfX9W1Hz5yQ0
	Jl19piSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0qt-0000000AaE3-0rds;
	Mon, 03 Nov 2025 20:08:31 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0qq-0000000AaCm-0CSS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 20:08:29 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0jMG1mQ1z9tnv;
	Mon,  3 Nov 2025 21:08:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1UGhyuVKrdCv+eXNOryeajBu7PyQpDfmqjFM3c0rY8=;
	b=ocSImfajas+yqNhMn0ZrHsbnseS6yG/WfhoB2ZbBgDbUpUiRqVWzDjUpBEWQHhQEv+fQXu
	OOGqcg7dtAg5Zm0OlyTJhdueI/rU6TgDt88DrqYM5MD5tne8EroNGDL7vWFClApAZYnxpP
	ppDWZtdchzsHnuZMpgKVkzmOF8WLg4iYTo9QoHKWnn7G7JVjGvGfNl9TqlGYFlbrdPl5vz
	F5geJ8GRzE+fGLKhwxqqQ2vvFx05369RLGEeQmUtF6kFmuA9MzbH3D5/Uahhtf890XctK+
	oDncXQHPXL4dNtjRzSSwW44+NF+XALiI5XEg6kIkojexLYYn6waHZfQ06ahBwg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZIG2rQkx;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1UGhyuVKrdCv+eXNOryeajBu7PyQpDfmqjFM3c0rY8=;
	b=ZIG2rQkx7zbkb5oC0psPkP97/4jCfqo7iw7n5rjZnnOsNWchnHNZE0yb7nk8liu1W56ji5
	CNlZRu0G2c1Y0BAZYUxQ2yh66kEzvcIlRFvQWVYxkpxH6mW0OpkwGOco545g3tGlEjzmKh
	UIfSzp2Vxjw4+0a8yke2PzaKi/9xX13KzU3gWzUDfGz+ZNJd+Bs1QzPn6N2V2WrBbedxpo
	35fG33mPxoQhMbQmKVffj7A1DTyYufW7rBjjZatGo4oYb+q5Vn58psqRsPts+S5Z5i0JfE
	SVtKNeHLsIGi5htO5w8TYbomEpoPopUXqJm8PzhPYgH9I90/ajR7TdDUaKlcvg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
Date: Mon,  3 Nov 2025 21:07:36 +0100
Message-ID: <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ed9673057399781eee0
X-MBO-RS-META: tmak9nw4q9m9tsmcjdznujh7n18zs63g
X-Rspamd-Queue-Id: 4d0jMG1mQ1z9tnv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_120828_224477_3054D605 
X-CRM114-Status: GOOD (  10.05  )
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

Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0868b136883c..4e730144e5fd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2450,6 +2450,23 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77965-gpu",
+				     "img,img-ge7800",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77965_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77965_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77965_PD_3DG_A>,
+					<&sysc R8A77965_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+			status = "disabled";
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77965",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


