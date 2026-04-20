Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB08F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9j6tP3Etxqo20VEpvRVw0E7sixMpncDmd0IlGjpXiw=; b=WfdPuKTZZxF9iO7FVAHGnn0hOA
	3VwS7CCXiZw18BcFBeX+7NxWZQd+Q6kqXk0E5Sb4dwo6SM2wZaqvVf236UDRzZrNAi95zkv56avd6
	+DPudIEqATcutlv8inmuUtNl1n0N313Lbb0eX9kFuuYrkuDJ2BwyUOQzHSYI2t9JL6b1Cz4W7GTSq
	IeHSDpAEFbs6cn/8SSqgUrWQcWF4+KmaTXLlyzDlIp8g0HrQJNmNwTEPriq+iRSFiA0c1o67/zi8s
	uC7fFQOhEbbcQyVetkSA1ziZSTZ1+sPf6rZGn1FZREG2favM1f0NO48EWjQCkilOPoMHejjDu1tCk
	NKvhZ2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoVs-00000006z6T-17wZ;
	Mon, 20 Apr 2026 13:18:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoVp-00000006z3I-0oDt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:18:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8E3E64E42A74;
	Mon, 20 Apr 2026 13:18:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 625245FFA5;
	Mon, 20 Apr 2026 13:18:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B7E1104608BD;
	Mon, 20 Apr 2026 15:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776691079; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=g9j6tP3Etxqo20VEpvRVw0E7sixMpncDmd0IlGjpXiw=;
	b=kf3pTJz0oJlkKKMIO7TrPhrZohq6pH43EGiLiA7ikenpiiMCzq4izeYWyPoSe9rng5vyWc
	PMBVlEs97WeOGSj8mnHo9SiWnDactZVpSh8g1Mfj6iLB0de17zK+91JbLi5CMOqZ757KeL
	HaA0sTVgfGoM8pE54CoFNBVDDkfZMoUYGUxP1Otr2uKS0pcmAaZ6iVaJhJ81NMsdzIDRNq
	tvuikcigXv7ZvZw023NezItWqB+gZXphlT6zW2x/YMbM/mwBH8kQPQlU5eXIabecYvyWO3
	3tWUsV8I4ppcIP752X50pMi7f1wh9QN4LxPCtz7F7V00uPVnXsCW+vyYsrW+pw==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s: use ti,j7200-padconf compatible
Date: Mon, 20 Apr 2026 15:17:35 +0200
Message-ID: <20260420131735.3833993-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_061805_678404_DDDFCDCB 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Abhash Kumar Jha <a-kumar2@ti.com>

The pinctrl contexts for j722s should be saved and restored during
suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.

Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
suspend-to-ram.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..757eb6abcd72 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -242,6 +242,7 @@ &phy_gmii_sel {
 };
 
 &main_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
 
 	main_mcan0_pins_default: main-mcan0-default-pins {
 		pinctrl-single,pins = <
@@ -418,6 +419,7 @@ &main_uart5 {
 };
 
 &mcu_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
 
 	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
 		pinctrl-single,pins = <
-- 
2.47.3


