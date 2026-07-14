Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261ABC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5xIy+UobY8kn64Cj0Rt85cgHqjnMr/iAxyOpbQ7/bU=; b=Q2arwy6znSouhdiRwdK1M4IO1V
	bHZGOaDEbq9YiwpX05BM0ikansPDgcatewx/3llEVgJUBzcoUFRL4coIeUENQrbHYlO3+n6c1b+0N
	or8nHfrX0wnFk6+XTKKpZARxtuq+/3AWmSR0BGeOe5i1NFmTF1jyIwdPU6iISXeK6M2vDpAFGkOzm
	/tzW29KKLJrpqIOMhMUjWcHVZPbh7+rJ/l5wW498AJzYu2PO4Mcbmd+9QcMwEHCipKlfBeeAvHqPt
	puskhY/ErOB/ZEaI+2AKO8Z4F0/uQyEF68sL4KFJsnEKhEsPmvLqA+Vx/x/DFN9lY6woHGzhxKkDa
	/63qSuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcol-0000000C56b-2Qi2;
	Tue, 14 Jul 2026 13:04:59 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcob-0000000C4xu-2ORe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:04:51 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzzzg70t4zKngg;
	Tue, 14 Jul 2026 15:04:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5xIy+UobY8kn64Cj0Rt85cgHqjnMr/iAxyOpbQ7/bU=;
	b=XlR/BbM12oAJ51+B5LygAVZ1WxfQ+070n3qAMStIkVEYRAuRyOLbDar2qFyjrPa/RIb7NA
	NulbSfJq5DEOqfI/OOEpnSPKyM+E88O7Pbrg+oqyEl8aDrl6ETGyCNMxLQhvBL2zriqTge
	kM180ajgFCPAraSYFc2yIoNnPRj406sU5+K392Z7QJ8oFTm1Lfkw++h6KHK9OebbEoCdPA
	/DHJvzUCVQZx9wHJHTV/j+mCgRWNCVmPCVdxNKSXriEsOzFYiDF2CMxbjHrjZGRJOIyysW
	sOFzTKahB/WMA45NgxL5BXz6YFccquuFCuoYr2g1Kipo6HIaRaM1t8wgWixTlQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5xIy+UobY8kn64Cj0Rt85cgHqjnMr/iAxyOpbQ7/bU=;
	b=lAljvMS3k8Plonf4EvP6z76L2vwzrMgW4MKt/MBr7lVjF40aS6jMQiOpnGsVvAS3NNnOcQ
	Jk7W6rb9xCPz3hkLnnSU0rMRxuzUXJ08koLooqZSvodGz4Njes1JUegiY+1mPuyMi2GBpg
	PUgqNA50YOnxh9rBP3XAOtSbOcaRNUZxSXP5iA9dnhWfdoKW+mA7MTqBcY7v2jHQOiWRku
	jRr2Ku1rtIBe+z1w5MSMRR0TpyPhfFxRHj6qqdnLv+vX2RajYlzp9Ml7dAh85asfBh+82a
	mrBvJnmNpup8fITjedKjGSVdSHdcm528GjSs5pdRGVEh06jlgG1RRMESNNfLvw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/9] arm: dts: renesas: gose: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:58 +0200
Message-ID: <20260714130429.11214-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bw5h6jyndw4wjb1otjm4qg4y6w589haa
X-MBO-RS-ID: 46693ac3cb3f56f7200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060449_819617_013F3BAA 
X-CRM114-Status: GOOD (  10.82  )
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
 arch/arm/boot/dts/renesas/r8a7793-gose.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 69d9c674bb032..9687c1eebfd4d 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -618,12 +618,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0


