Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCA5D44C46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FgHtcrH77BKHMo+hrJIHCEwhZDwnKTd3fFI4HSQ6PQ=; b=vlBHXwlXpGyqihe4+SQ60PW/IJ
	Uy9K8WChVuiqn4hLBQgnHvamfgzEvdKMCc37cjE4xdtCWYXyJ6+EJT3bedguq+31w5dweL7cR80sJ
	UhdzVge+5UM46i2Y2iDfqrPrV/10GR65rO5StkN//sEjMR5kvFxbQjh7vrj4IX7cTwp8F+5o4Qr6p
	muAi7/U5A5YDgNAyzKj0LJeE8zdn6ki5okL5KmbfE24EoRinFO1Fvl1q5PhmssFOgcIVphXUp9DhB
	GMrtstEM1C0d633hXup7KRLtumlLLTvCLy8391FZD1VSWY/NnRMff0v+/4mH0vvzhvw13a4xvSW95
	7LqlFIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNBZ-0000000COY3-3xwO;
	Thu, 15 Jan 2026 13:14:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNBW-0000000COWY-0XJm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A58601AF;
	Thu, 15 Jan 2026 13:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9968C19422;
	Thu, 15 Jan 2026 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768482885;
	bh=mLTcptWXyr1/Db9RrQ1ia4qI5zICdIrZwyP7oNHoRcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jo9TPi4WqX+41PKyn1MoEr2r5hTEPkfbNbg6GxFK7MIZUW5ODvKazfrPdp+B7fbNn
	 lesPiZrdPd2uaeke9RKMoGThCSEyTUUA4HYaGmr9u1KXh7Mr8ADJ/k2tvy/9RjfJjY
	 YcWjPyaXF1RNwKM+pk5H1olRHJY1r2A4MFxTLaHpK6cZsgmV4iS+KSXrdwd5am22yc
	 sv4Wg34gS1pdrgGAoBGNSvW4DZwZe1UghAwH/SSGHrmay84LbxFOZbmQFEh5evFiSK
	 QEqcX5ssmyB99jP4bVxXJvA0tBtvPNazaaEFOY4FteSAmTyRJxHI044EOhRpgeKX3y
	 zZ/MFio5IeFDg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Udit Kumar <u-kumar1@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 2/2] arm64: dts: ti: sa67: fix SD card regulator
Date: Thu, 15 Jan 2026 14:14:19 +0100
Message-ID: <20260115131431.1521102-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115131431.1521102-1-mwalle@kernel.org>
References: <20260115131431.1521102-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The property "enable-active-high" was missing, as the default is
active-low. Add it.

Fixes: 1c3c4df06f9d ("arm64: dts: ti: Add support for Kontron SMARC-sAM67")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index db59ec4e4106..ffc95bb32551 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -173,6 +173,7 @@ vcc_3p3_sd_vio_s0: regulator-6 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_3p3_s0>;
 		regulator-boot-on;
+		enable-active-high;
 		enable-gpios = <&main_gpio0 7 GPIO_ACTIVE_HIGH>;
 		gpios = <&main_gpio0 8 GPIO_ACTIVE_HIGH>;
 		states = <3300000 0x0>,
-- 
2.47.3


