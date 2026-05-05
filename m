Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AE1CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMdwdP3nboo7mFF0k9YbSTM89N9Bulr+AME+RvbTqlk=; b=vCnSJ+lItI3H7LDLz6Z4AA9Vge
	BYqz47w9FWgEtCcAhP7WEFNikdXS9ql9EeOTqTibI7jTNjr0VLBFdH+jDyHnD/xV9WZ6GOqRPUzrs
	lLQZKxwdX9sGUoOfqH5tJ7YlYx5Bgy5lOKaDxBNx288S0d3IMd9G0jL1zddnfLRchhaV4SFBpRRr/
	nLCaqgMBtNH+F3hbFP9cEzeGqbdtT5km09Fr6Cr0MtMgJvjdJjA7aH87K9T9b5jJDOfsXBN2/XFqe
	Mr0bBIqyJAaKNiQc1e1kGzYhCoSSIz2dVxiFJA61Q31nr3B6BfQ7wqW1JvdUTqxkZVVSxN0JaEDic
	2JpBywUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hX-0000000F200-3xir;
	Tue, 05 May 2026 03:44:03 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hV-0000000F1w5-2X9L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:44:02 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8krv3KMMz9ttZ;
	Tue,  5 May 2026 05:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMdwdP3nboo7mFF0k9YbSTM89N9Bulr+AME+RvbTqlk=;
	b=W8fMOZlvvnFLmdOTFoerWHo+qYh6YIHHUB74Opt9MLUiXOM61Aq04df3jOeU6r1jvGzv0i
	HHriuYK0VkQ9if3pWU9ftbq9UJeKbgjP5VWuR0st7dwtZ/5EqY7i3UwJRcJz1F22LN2amV
	I4dZCHI9Ufo6EGffafv0uuhEByBchkY2nJuteJxCPL7WdLC2PnewETsYsNaQWRb1wtEYOv
	C4xBNf4AzIhVFBDYFG2NdvV6HEsqxGCPgJpt10AfU7UNs8obiZwUyrpst0ijAtYaiX0cWo
	RrpMnVmt1UNLS/mxPdXG6r/A5dmGHdCIBaTZFRvzxOExmBhDJ93OAI1Nr41FxQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMdwdP3nboo7mFF0k9YbSTM89N9Bulr+AME+RvbTqlk=;
	b=fODKMjiJIhc/2ccEDt9yXAj9xpCNNQlh66WFGI/0txL7eQB/1eXjt893aiu7KrFm35aDh6
	/aCejIpF+xWF/0PrcZQ71PUnH+zY2HqHxz7K1CeDMvpERrp01NF/JS8Zybhp9dzRoYD7dm
	PWVMYoFQtSrGBWMXu+JwKFV3Oue1wmu6fCAeaqo8s7nSwRIHLj7+qreZ1v7hyco4KKklBv
	mtJga3DEasLNKTFHBkTEIT87cdVXORiK5wMEtd11HafoaGVWvORdts9Z7joSk8cjJapnnN
	C/YdpOZbai8K8sUSKWn/7NPUdbo0ymdREqWUtBkNcEMaXNFhKme1wj307x0PnQ==
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
Subject: [PATCH 09/11] arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:50 +0200
Message-ID: <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hfa34mzfhzuh7xwfkbyihw65n8iw6je1
X-MBO-RS-ID: 3592287a5530274bebd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204401_786210_A020AEAF 
X-CRM114-Status: GOOD (  10.85  )
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
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 6bd580737f25d..ea5dcee73658a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -33,6 +33,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio4 16 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


