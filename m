Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00265EA7197
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 19:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlkbA/p29nZ5RMxQfG/SqbkLGXx2vuQDTDqohpkxhuc=; b=tChkN9tGVKPjhjksSpnsQJVY9W
	zjWNEuA62Dj4QIrw1qoJoGgkx+cJf11XaB+tRU9mgwtA2gD6FL/HaeLdTyE+6NCXNwfHWEXl5naFu
	ZzPG5+la70X0zRGE7vrTlZXdJyRN6ykI1o18quQf4I+8RnhH9znKmYiiWKj71WvYBhsicQDtmLG7Y
	fkRfpzCOcxexIKo0uiK3DeJ0LUWlqxCyN/kds80h/G/WpzwIdcwLAHCVee/CQ+SX98u88lAd9IhCB
	B+6+FOwUkBQSafjTavzAbri/chkNe6BxGZdrArMnyhyMaDAzOCTqd+9Q318vMD19jO/H578svASWn
	Wpglf18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXyB-000000062RH-1wpt;
	Sun, 19 Apr 2026 19:38:15 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXy8-000000062Os-2zwE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 19:38:14 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fzJnG6DpXz9t1S;
	Sun, 19 Apr 2026 21:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlkbA/p29nZ5RMxQfG/SqbkLGXx2vuQDTDqohpkxhuc=;
	b=KQ9fDMwn87mZrtCH2owLwwFRE4/DRT44Sg8Cwc3XgeuKRho69ajCNv7nfyE5dCcmyvKbjX
	c8FTdPguIAiz2EtSd8f3wVVEWirpzalch+8cqiuL0W/phglJnQ38i00Na0E4uleXn4oWx1
	dVE1aA6cWmNuLb7gD0hZ+vPLNHfZB+XaROFU4yo6icJydGlyvbspw4lymbE7YNQG1pEyTk
	0zDFF9fyN+Dnqo276SJR5/br3vLOJ6bnvNusQfgfmGvZ2vMFbWYaKKNW6HEZO58AU0KVyZ
	q1vtQ9NXW2fzmSzHZSZ/D9AENI+MrXf77z7OhRvMpZg47rtiTcxJnOOs3/ue8w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DrFzN0Ub;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlkbA/p29nZ5RMxQfG/SqbkLGXx2vuQDTDqohpkxhuc=;
	b=DrFzN0UbDIbvZbZ/s1JoNU4vr7regCxqrCxZMy0qTsZ0ifCBQa2sZ7Q43kTBk60C40eM+G
	81WO/ya6y7uEfPweeHYI41vpW3ONPE7SjYnptfbNiNktI1XzVi9cUC+C7xUjBnOun6lAEH
	shX2+J0T0Q/FwbJFI/z6mnbDqD5URkksiKfWT3+1s+olaNRYu6ytIRuZsYtStQJSSUr47/
	HdAa7iDTjNTY+oAP0oqLq8romWH+zQ4SCSrZd9GPqZnICikbV6makDRGXEcJLgMHJUolCr
	m7HoCmHGVBLd/+5RXbrLFKZctYhgC/lbeFhVjkkgbx2sFATCKv1MkB7KfZxuUQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
Date: Sun, 19 Apr 2026 21:35:37 +0200
Message-ID: <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 58c89db21b2313176f4
X-MBO-RS-META: ogkhnyf5obinb8orhfmce4uwkrwsfqd9
X-Rspamd-Queue-Id: 4fzJnG6DpXz9t1S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_123812_929680_0AD6CA55 
X-CRM114-Status: GOOD (  13.09  )
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

From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>

Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
variant of the R8A77965 (M3-N) with reduced set of peripherals.

Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779md.dtsi | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779md.dtsi b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
new file mode 100644
index 0000000000000..7e0f5fe4cd439
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car M3Le (R8A779MD) SoC
+ *
+ * Copyright (C) 2025-2026 Renesas Electronics Corp.
+ */
+
+#include "r8a77965.dtsi"
+
+/ {
+	compatible = "renesas,r8a779md", "renesas,r8a77965";
+};
+
+/delete-node/ &csi20;
+/delete-node/ &drif00;
+/delete-node/ &drif01;
+/delete-node/ &drif10;
+/delete-node/ &drif11;
+/delete-node/ &drif20;
+/delete-node/ &drif21;
+/delete-node/ &drif30;
+/delete-node/ &drif31;
+/delete-node/ &hdmi0;
+/delete-node/ &mlp;
+/delete-node/ &pciec1;
+/delete-node/ &sata;
+/delete-node/ &sdhi3;
+/delete-node/ &usb3_peri0;
+/delete-node/ &usb3_phy0;
+/delete-node/ &vin0csi20;
+/delete-node/ &vin1csi20;
+/delete-node/ &vin2csi20;
+/delete-node/ &vin3csi20;
+/delete-node/ &vin4csi20;
+/delete-node/ &vin5csi20;
+/delete-node/ &vin6csi20;
+/delete-node/ &vin7csi20;
+/delete-node/ &xhci0;
+
+&du {
+	compatible = "renesas,du-r8a779md";
+	renesas,cmms = <&cmm0>, <&cmm3>;
+	renesas,vsps = <&vspd0 0>, <&vspd1 0>;
+
+	ports {
+		/delete-node/ port@1;
+	};
+};
-- 
2.53.0


