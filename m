Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC30C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/U1++qILmdjDGu2VoE0QuooJEhyO9cjDOeKDSGdanck=; b=iXqAnQqNsZdDbGTXbvF+G9vXWh
	X6UXRXgJr/rhoxFvM2gmmTFBysus3/UhKnbtca0ku5KsUWVsgkUmaJkBLmQ7AWavLktmrvRKAyN0C
	2spAtj0+2mdV5KABYkeEa9LXgP54QuxRpoY/L33wYKSP0sxFGe5kwVL+vgbw00V/YVnyWdANeWgD3
	qtOljfqwVLnuEGk/NxT+h7BpbehXTIePNhMfyeU1nQjyJhyZERJW2zF0ua5s7UVX8RcK3c4QP3/zn
	g9+zVKnicdkbJWKYce7H6ZmRAHpyUqIVJW0o9TzggQko3iPRJEXdFldzbCPBmwLnPvpreRoc9sZFk
	OvfXp38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcol-0000000C57M-3RFW;
	Tue, 14 Jul 2026 13:04:59 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcog-0000000C51Z-2qWE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:04:56 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gzzzm534JzMlMl;
	Tue, 14 Jul 2026 15:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/U1++qILmdjDGu2VoE0QuooJEhyO9cjDOeKDSGdanck=;
	b=r9kD5GezFOYL1R79TxG29b2uU9yAWpxiSSZdqtgViDbwzEgJFdaNm5OIwOoKhvStmacU/r
	OKC3jmN9Ku1DghIuS/i4FiU3jqTiQcY2UBavPRve2PZGXtrbc3MJNCEdkt84lD+YAkyl1s
	jR9HgUPi5zC2Cl6EgEo+SOTL8qeSQHV/6B2HcUX/F5PPJ7xkt+myGdzOkPJb2lNxIA+Bry
	AWy/o0DoQeeQmTUEfccoRTs6MwWLRLvF1KeBsGbIbHYalGkUoawm4UahfBTJsUOObnf3hR
	MIRv3GInS4K9FuYatSqWx2Pqm8q/Uk+zDvg49R30axI/vkwykcI9MXcTTX7xBQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/U1++qILmdjDGu2VoE0QuooJEhyO9cjDOeKDSGdanck=;
	b=H0mUMqv89K/sJsOGFEI1DIfnr13w9ZPdalLkLXLEJ6jHtCElAye/orMeyc21YLxQeoNLyh
	U0u5bf7oWARqYZABg286y6sL/BUFdUxiQ0FChaUDzfi1doNzW7JwKX0rbbKTG++pmwCZmN
	ZUbcAFQ9l/BamvwpjUF89GQKJswZyE7vSSEZ2JXZHowhRs/vsM/lBTR8MSrDCAm30hjYVL
	h81kf+WAATYirWelG12j+CWZ2hZW6nVjehmw7n6ZXrZAaB4650Ma9NtN5FmhRHki1dT+S/
	WfLQBn4Sps/BKwAo8ami12tl0egRUlJ4WvxLfZwyMAwLDetQm1ycQ4IdTSWTXA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/9] arm: dts: renesas: silk: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:00 +0200
Message-ID: <20260714130429.11214-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: y76quwxow3syp3fuejx1amprw8hdjee6
X-MBO-RS-ID: 06bff2b101b36be0c48
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060454_877884_D14810BC 
X-CRM114-Status: GOOD (  10.77  )
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

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
the system wait after deassertion of the PHY reset and before start
of communication with the PHY via MDIO. Opt for the same value as
used for KSZ9031RNX, which is 300 us.

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
reset high is at minimum 10 ms. Set the DT property reset-assert-us
to 10ms because the KSZ8041RNL RM does not explicitly spell out how
long the reset has to be asserted, but this at least covers the worst
case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7794-silk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index af474b1d9676d..72829ce052408 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -414,12 +414,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "i2c-hdmi";
-- 
2.53.0


