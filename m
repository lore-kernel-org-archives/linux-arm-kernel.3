Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA33EEE265
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYXd4rBWr+VoCYfFMCg1Y6PRgql/J88JwBUm3GoZ7zI=; b=BB57gi/FsdmVQ9Yg2SqltBzMDy
	KEmlG0UBYDP8V+Xehm6E/RNDpCf37XH8Rl0bgtbRWCCBdjiDqdkg8vWkkm/ACz+3/giuoim41Eem+
	M17LtWj4ynrmmYJyEEmGmch/2thu6VDlOBUQ7ntg2i9Dm5k1JJ6INR/MBfXKG4eIwdWv/c/BL62HF
	L3KrO1zHGq111SMRKEiXLK2RuFx/H6FF5KVazVOWnVYq0WprtZrcP/gIYwXPmYCrcjBVIR7t2JNE4
	VGb8UFsoLR7wRI41bJ4hOArM3voi/ihlQRPTDf7v5OE2SYQEvdC7aA5otnG6iVnvkEN8Ra9gu7myZ
	zORuj/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTH-00000007UPb-2hdm;
	Thu, 01 Jan 2026 20:40:35 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTA-00000007UJj-3UxI;
	Thu, 01 Jan 2026 20:40:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dhzGy41xKz9spn;
	Thu,  1 Jan 2026 21:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYXd4rBWr+VoCYfFMCg1Y6PRgql/J88JwBUm3GoZ7zI=;
	b=FKOGXWtupwxuhKtRe/MtXbRZA5BbFZxFq2HSVaHZ3Wp2ztJGttxgXTvPCh70vvZq492r4N
	X+kk0zBsLW/bHDWQ1wywOb3/U6QEfHStBs7z3KRuOrnM5kxwZ/2zWuC8BidKuOF0ssIYyP
	UlrYueP5Y2bU3atZs4dqnt03sJ9mxELhXwt6A42DZdfAeN6nJeVBvHo+ugfJScVvLjtGUm
	XSStS566q+bXTk5FbDU9m/jQ4o5F9oScdxoaJO+MTdrnVXTFcverBvPum/KAlhubNPrVGq
	aB7/NilCPzZmRtOZKNCeSFinTZyfU1nPUeNpmhL8Blz3kxSH8DcHWoP3gcqq/g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYXd4rBWr+VoCYfFMCg1Y6PRgql/J88JwBUm3GoZ7zI=;
	b=VDkKx4gENKUbqCbWa21GR/2zaee5W78QUD2Zg9PP0/wl0JMWJvvG25FXPuxe4WL6yeGtfT
	6qjikiu+LiooM1BFAgxZi2cfLQ2QvwSkDDzx5ivwpiAlgc9Ai5bRHADdumBy4Rl06ofV8P
	/OboL9RX5+cIj90K007K2WvViqbkFjNbtMd3sDAXC9aopwHEHwA7F6y5I22mMeKS5GQS8/
	OSSCTX2zAeV5nqKETQrV1IbDodIRo8QBMtZaXpr1VnlzVVOo/Rcgnh4amxs1aZ2IaqXkyV
	6UYQc4Dfzr751MUUqsQvMHK2US+te7EYwjGEDV1CT1bTCq9f1g8h7mmjzxGVqw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: renesas: r8a77990: Describe PCIe root port
Date: Thu,  1 Jan 2026 21:35:55 +0100
Message-ID: <20260101203938.159161-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4xj4hfx1t18ohj6cenieuw95kagphsmk
X-MBO-RS-ID: f8316f89ca3287b92c3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124029_134370_BE9517AD 
X-CRM114-Status: GOOD (  10.93  )
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

Add node which describes the root port in the PCIe controller DT node.
This can be used together with the pwrctrl driver to control clock and
power supply to a PCIe slot.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 9b4569782d61d..1e650a4bd81aa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1941,6 +1941,16 @@ pciec0: pcie@fe000000 {
 			iommu-map = <0 &ipmmu_hc 0 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec0_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		vspb0: vsp@fe960000 {
-- 
2.51.0


