Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02532C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eg2J22pv0EeOUfxPi9LM1hfuqMseecX+7PDPMI1icGM=; b=R5C4wfFgXfGaN7P5/Gb+Tv25po
	uLs99U4M6wLewD277ulYhrusyNRvn8zhY8iha1MkWCpcefE6ZX/gy9vndjHs2y1UQsy+osoyzDbFK
	Zn7UqCXLIhzB7dLguPfX3r/i/57+rLcthh5o2MjSIN9hz4GgvpZjuaWvjGOh/mxL9nmTcEGAUrxAM
	S8laZr4FM+MmFuQyvy695zkfVOtRY4bxCZp8Cf+i9Xc3RLuViIQKdMNAQHlMdCoCslkcnE0JrYCfM
	QPztXowBC/OWuCuDmxigec5Kp/TqqKURiBMgCTWN7tFXIjPP8ZOnNwqtSTqPO2lJEIZsd8YZkrz84
	1dw58i0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcnb-0000000C4cY-2Pfi;
	Tue, 14 Jul 2026 13:03:47 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcnY-0000000C4az-1PaK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:03:46 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gzzyL4By7zMlG1;
	Tue, 14 Jul 2026 15:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eg2J22pv0EeOUfxPi9LM1hfuqMseecX+7PDPMI1icGM=;
	b=MZxc/I/q6RkWmunmFE2cVidS53qzIS32iszUHWGuSBi7TaGlGanbU88UqzGj0qTjxAuKlM
	kB6DuFJHZiou3G/erRT1JO5BzrMjbPnr7ycCeSvfUB0h/GrINSki1VX8ZCLmPBpgUj9ssF
	rEPoV36YtsEBSbQAQQqYLcueql45gjTKtBv80Y6+ijJuCFDns0RzT97YdF2VTMiYvG2xC9
	MKWax2hbU+V18+sAtAUF0nY6GxVNSDymxVrJzK/qWtllEcM132A0OYa1E4aO0T+2F1fkWy
	kDJvK7IXmjsc9DvyC9+JyoLnmZaTryDn1N8ncsz+yCEmfLid6paA1rql2qw6jQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eg2J22pv0EeOUfxPi9LM1hfuqMseecX+7PDPMI1icGM=;
	b=FGCVV2uOKO9+4IEYjxdVIDOqbyVsUbTb0wdkS2RYrz73606aw2tvTmdSRvQuanYemn78Sb
	SGsA2X4NimVcabcS85+LjKq8nUgtL+u+4AQ5vUkO0EtjITy6hft2BUyT4d2XVxWOE3FAgB
	lwMOIq0MwpkW76wbTDUvNU2J4+8nihgGeShKKB/40tJ4DgC+GmCo23jzcSGsYERD7OXFT9
	wY8Pb9C6we5IQPRwE8EHS8mknKJS06yJGTYgCAr0OFi39CdNbU8krf0n8KlNgKops+W+UW
	ISeNDRjEnhKHW3TG6UEOJ4tn2hvbnvTQmm58+zH051Gc4cYR1JuKq5g2pJBoSw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm: dts: renesas: gr-peach: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:01 +0200
Message-ID: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 07c814e049ccf7dfdf7
X-MBO-RS-META: uzejgmi3ro9qn95mmhsacqxn1fyed6im
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060344_528078_D00EA954 
X-CRM114-Status: UNSURE (   9.97  )
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

The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
long should the system wait after deassertion of the PHY reset and
before start of communication with the PHY via MDIO. Opt for 300 us
which should cover every timing option, including the 16 us delay
required for MDIO to switch to 25 MHz listed in Note: in Chapter
3.8.5 RESETS.

The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
supply voltages to reset high is at minimum 10 ms. Set DT property
reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
spell out how long the reset has to be asserted, but this at least
covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf

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
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index 23ddec2176857..2477db9e5aaca 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -128,8 +128,10 @@ phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.c0f0",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 
 		reset-gpios = <&port4 2 GPIO_ACTIVE_LOW>;
 		reset-delay-us = <5>;
+		reset-assert-us = <25000>;
+		reset-deassert-us = <300>;
 	};
 };
-- 
2.53.0


