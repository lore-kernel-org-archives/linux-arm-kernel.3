Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFEEFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvxusKnQ+RxbDoINErdXsrXujJmge6ENoCKAoCTHUKw=; b=F9xQw10y4CBi0vlKZjICD10Qlc
	uahKhd6SwM0iZCduB37DZ/P4twmXgHY6fnqI74UHDSGZ56K1vrZN5Cx9B9IURTFBxs8/IZnNAwfyL
	CZr0zaHjioM88izatITPE0hfR/AsFVCS+viV1hBF063wfAYsKF6dts4TM/4XLAGwwzZyOn0SWFJDk
	2ZGjVNpdORsm/NLfACmjyXb3BkcmEdTV/Q5CPF03be0k+qYSYCVhnm+1Z3NNEcGfK6Dio6zY5gUsr
	CDhMfM3rkRhKv7IrjDF88+cx/yXg9Z80GTngTu7iVRI/Fa0Z6yjZjqskT2U/VdadDou3NHwTQLcj/
	GsecGbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYw-0000000DVKx-1VZg;
	Mon, 04 May 2026 14:46:22 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYt-0000000DVHl-21QH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:46:20 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8PbY5l5hz9tDq;
	Mon,  4 May 2026 16:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvxusKnQ+RxbDoINErdXsrXujJmge6ENoCKAoCTHUKw=;
	b=JunxcpI8W165YVzuTFR7sT8Sjz8VMXHvVT4EBuFvGMa7nZgcVJjeb1Np6GcAJPoeIU7KQ5
	9U2sfD28d0eA+rQqITil3RvDEAqRLs0XN/Jn6wtqVjP2A3S9NUs+TTcPmsqJB/tGZ1ky06
	kktZgLmmMMIYhi6ELRx2yvkKByzJYINlgvvprioqstO/X2HOTo8FMUhNgq8ApFoij6WTM0
	ZOmnFThoUl05uqySLBKkTQwVoaF08tmWpOmbtlo6j3cjl0USrckQIwtk+wfSIG304hHKtF
	jBDwkL0KPzi3vAdQs7JzCrHlRDxhDElSWlS3spLWfxi/ujs5qXSKs+6dqAzCNw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gpgY908g;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvxusKnQ+RxbDoINErdXsrXujJmge6ENoCKAoCTHUKw=;
	b=gpgY908guuyVN9y2BQ2UGiK57I7P7bK4NghF0SEwfLZmSvCifFjUHmxhSet9njreZblXdR
	Yi/8Jyok6CDiwCVgg1us+GYswRqLpbaf/Rxn5u3YrnDBx4x6GYp3z05i2bZlHA32BvDQXl
	1aYeituXffzpqkFuoUtrNSlyEZAZVF0jzy9OPxOj776gZcL0YwdA6n91SFgOgQXUfgLOjs
	Gj8Ky1S6WNvFgwqaWlylLgKnX13i/rwocbEk+sxQi7mcWYh04U2Hd62kADNOvoLahgkOtp
	EdU/CFxrexFEBaTnDfzKwxozQhd9iHk+KqRIz4/6usEgSPaEyC8cZ8Q5xmqJ7g==
To: linux-arm-kernel@lists.infradead.org
Cc: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
Date: Mon,  4 May 2026 16:43:28 +0200
Message-ID: <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 74ac9964edfaab90fd9
X-MBO-RS-META: s1ctykzbmfi1ieuh3muaxegkhdah6es3
X-Rspamd-Queue-Id: 4g8PbY5l5hz9tDq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074619_678970_B0618AF6 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Drop DU until it can be tested
    - Reinstate sdhi3, switch SDHI to dedicated M3Le compatible strings
    - Add no-mmc DT property to SDHI3/MMC1, because MMC1 is not supported
    - Disable ohci1, ehci1, usb2_phy1
---
 arch/arm64/boot/dts/renesas/r8a779md.dtsi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779md.dtsi b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
new file mode 100644
index 0000000000000..f30654141341a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
@@ -0,0 +1,59 @@
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
+/delete-node/ &du;
+/delete-node/ &ehci1;
+/delete-node/ &hdmi0;
+/delete-node/ &lvds0;
+/delete-node/ &mlp;
+/delete-node/ &ohci1;
+/delete-node/ &pciec1;
+/delete-node/ &sata;
+/delete-node/ &usb2_phy1;
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
+&sdhi0 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+};
+
+&sdhi1 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+};
+
+&sdhi2 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+};
+
+&sdhi3 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+	no-mmc;
+};
-- 
2.53.0


