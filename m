Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABECC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 06:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FSTEhJv+CfjAKBzpaF6LPhOdHHfcTt2IPKPs7dwEK0I=; b=QNpcpaAIJDFe/O2Z7uJ+8Z/Yw+
	+ol64ku3wpgd+cOqtS/va95+VxOhtwTkLBGP0k1MGCWuUmFe6jNCOPq08ynxvLrVquoxNxvsc7K7v
	bnlr8pTx3lYCDyW1pomnjtld9XUsocQ39m+TKBSOQ7geOsFedR+os020M+tgXF8nFeIa3oEAr7ufq
	fq0XnHHZQGMIAYKWAahkqs8ZeF31lnCysIZrkWaukcfr74/HECGCL1sJyT8ppibxsVqU8iEZl8BYQ
	7TGul28MpGyyF5zpXW5gYBc8/g5FNa7jUykxP2+nJsjaaCWeY/PqzE/M8l4b0PmMc/X69e3edJOOd
	IA6554VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmhM-00000009EM9-26Pp;
	Wed, 18 Jun 2025 06:55:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmf8-00000009E4B-3TsD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 06:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B4B143911;
	Wed, 18 Jun 2025 06:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D2EC4CEED;
	Wed, 18 Jun 2025 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750229566;
	bh=prDfa/5Zbm9GA9G4tD7ZSeyJ1W+Dn9Epp1t6A1MMNwo=;
	h=From:To:Cc:Subject:Date:From;
	b=RsJipWcl/kmAXaotjhAwkqCBWa3T3L278I5zdgKs353dwP6Pw1KBECYhtGKFoGoyo
	 kjYOjf4CO3+uh9PD6LnwOkrCHFpIa934p57BAYaoRHZmhaecX6gY4yo+QTLlUGX60S
	 78+5Y0prt7mFWQuheeCvMFq5pzbhFGiTozTnlF0FSCNnIi4JEtVhJx2mx/ouhXc+aY
	 ADgg1pM42jEaoixslcLQSk/627KR9slA79+QE61RUHPasGNDOqgT3BQzo/5i4wNnSh
	 87Gvz5FMhVvl5/LKo02uiNfy9TIstoZzFlIucs59Bz5YzZFqao5Sa8JTcoN2vdii+0
	 HDAnNtmPGyhtg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan Brattlof <bb@ti.com>,
	Dhruva Gole <d-gole@ti.com>,
	Andrew Davis <afd@ti.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62p-j722s: fix pinctrl-single size
Date: Wed, 18 Jun 2025 08:52:39 +0200
Message-Id: <20250618065239.1904953-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_235246_890790_373CE6D1 
X-CRM114-Status: GOOD (  10.83  )
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

Pinmux registers ends at 0x000f42ac (including). Thus, the size argument
of the pinctrl-single node has to be 0x2b0. Fix it.

This will fix the following error:
pinctrl-single f4000.pinctrl: mux offset out of range: 0x2ac (0x2ac)

Fixes: 29075cc09f43 ("arm64: dts: ti: Introduce AM62P5 family of SoCs")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 17471501df24..17c0949ac1d7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -264,7 +264,7 @@ secure_proxy_sa3: mailbox@43600000 {
 
 	main_pmx0: pinctrl@f4000 {
 		compatible = "pinctrl-single";
-		reg = <0x00 0xf4000 0x00 0x2ac>;
+		reg = <0x00 0xf4000 0x00 0x2b0>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
-- 
2.39.5


