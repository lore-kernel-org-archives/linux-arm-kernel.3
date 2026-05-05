Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17400CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m74OQYKUXFFOiQNF59JcHanEYm/tE0exDQOuRLJjFs=; b=T9FDX4JslIH/GCBDrqxqasfuWK
	qQ8DT0UKIgWUTQ3Tl2pK222HSXaXXH1JgYIf8ycpFoS3MrTggtxVU06CrNITEzZ9HM4GMb25I6+iJ
	SaEvF6+nVXUDsvm06tg/jTm71bg5QACnktZudlUVcEGywx3kTj3iLTu0TbDwaT7OVOj98zXRZdEUu
	/BrGIdjP/d8X8vBkuxn9AwcnXIHRk7wnfZPdbx7PswnYnRpqyvxaUEFeD387AUldKjy/ZfcPE8uic
	xjy/C2T9TbdKKrSbj9T2UAHnyd63lU7XQt/xU1a7jQgI38S5ggUZQ/LiX+shbvA7b/4L2XgNKgWM0
	WbpYU58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hd-0000000F25S-2Qlh;
	Tue, 05 May 2026 03:44:09 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6ha-0000000F20W-1T7J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:44:08 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8ks02mJ8z9tQt;
	Tue,  5 May 2026 05:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m74OQYKUXFFOiQNF59JcHanEYm/tE0exDQOuRLJjFs=;
	b=oLSL65UvwJ+yvDI2HcguKPfgzmI87OVDfzEA8jQOuoB4goW8mokJenNVxR9kaLPv4r/ojS
	Zta0Fy03u7VT73PyNco+XiXgHaVerZ9IXV/XQphhR6bhyIh3Iw80lclbeEHX9JwNcEX0+O
	zNQUzZtTSYPEbwLdBqCU6XcO5TsAE5eRBysgKx/bPZCMF6ZWrEmSiQuqVk54Hfv16d7CAZ
	8B3RrqH8HsVzYkyx/VYseBG60xzyI2V5fUIL3Hx/sAhlsrOSeY5JRcVrOBK1QwsOxHiECF
	kjy9nFQdnO++xEQj8dkOc5P6mf/L1q0Quj8cbe3kXkICIWB+Cn2GirT4q5jOHw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m74OQYKUXFFOiQNF59JcHanEYm/tE0exDQOuRLJjFs=;
	b=kZ+0ehCmohar/6f72/mQ4nTuQMCL6RXwOYS+F5zZVLeOqCn6B/kEaiZMb+32sux4xZ/pr1
	FDMMYNT59euH6vpzVlFLRLfieptRSwiN7aPLWsIdK8Jv0X7opJ7KQChcxArQxlExCe7Fqo
	cKOrJlCA7S7GFZDHoSk9d3d45Qolbv1N6IdNbtJK0LR0ToIohRj735Uu9zSrGUg/PHrVqT
	YNBmJTz3eJw8h3piH6DM1+/KRkRda3SNG32kPMbqaN/TdccLCx6K3+SSh1Pi7wsTLdY+pj
	NR8b/KBPB2yoBgHNt/N/lMxusbRaiZu9z6PJscd7fb77khCNQ4T+BwaLKe6j4Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:52 +0200
Message-ID: <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9b29a8112ffd5352392
X-MBO-RS-META: 4a5qc889kq1kq3ho7iq6urqypgq6wmzu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204406_540903_099647EE 
X-CRM114-Status: GOOD (  10.67  )
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

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 792a4aa8f4a9d..274493720b14e 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -213,6 +213,8 @@ avb0_phy: ethernet-phy@0 {
 			reg = <0>;
 			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
 		};
 	};
 };
-- 
2.53.0


