Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAA6D1CA09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 23:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3SU0Hz8yQJ8VxaLNaO1Vtp9LHZMmrfztXZDJGoyiC6I=; b=FwvyLqf88nX4J6oabEH5CEI/pL
	PK9mxQLfWUOKlG9BvGcHmSxKS4gpUzoUmcG6hhTB9yGCRZl+l9m+XrDQDk4gJyIN1BNpKlDnIrpQF
	Mvww2Xkj8/p2JvWhGMZxi0mhmHfmZ2PKJUMi3P08w113Y/S1HVaWnb82fnVR2Uhjr9JAgsuCMG2N9
	NLaxIRhGikfbF3hEVyE8JY4xpjuQ5pecJ4/glaKqlIZT9BapKJGte1LA4jFBEcUdCu28ZHvzDCLXS
	CnH1hMNSVpPU5mmqMWsbczgF0ZaIZ0m7Z4Sle6LT/cHgq3Fc6CJCmsM+BaFWxTWW7KxkvFl+iYD6U
	KSlyFWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t86CM-0000000FM9v-1GEC;
	Mon, 04 Nov 2024 23:09:26 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t86Ad-0000000FM0n-3vP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 23:07:42 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0BB31A0242;
	Tue,  5 Nov 2024 00:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=3SU0Hz8yQJ8VxaLNaO1Vtp9LHZMmrfztXZDJGoyiC6I=; b=
	Y3R5bwbZOPC2SEzr6D/jllq7kjMiy3HgqL6P6XhLIeB9U5xTL7jINNxg5kaThBrp
	56M+YM2KpwYFu9EeuA8RUtrQ9u+bSeLdHkYAQERnBjqyemjdHAHis9r5hREQG6Bb
	c4YUAtyEtie5dvfTO1VO4dXn8LOTW1SGOiw5Eb10Fq6WiXHPwNZ2VutOe00Y8Q6o
	h4uq5Fjk6rK9+qZucw+YsS/Dpeh8gW/EdfSa1P/sF4A3PSC1IUVcBAe/EJ9Rd0pq
	5QJ1Go4U2eqJdEbft45z8T/LaE7NC3290tpkLd0OzM0dL/qFshLnJiHgADmaabzN
	IJ8znJDu1Sk6MRfdCJd+9x36jIRPShHtIguAV5FD/PuLJfXv5yQP0nNs9dDSiwh/
	0o/YqIHpOcpc9Yv0R+gj/bggArjRdcR0tbAL/SY+IXbH4Nm/gdlNd47XSyMCpKLe
	n09q46T5letUknQ4bU6mLa5jJkz4INBp9e14vy9oyPaEo34wZF5gSVJsginRfrKZ
	W2hvzHz2ekQNb0cxaLnd/BpDh3vkGw47t2f9vxu29BYJFCyBwTT3y8HX23huy/Dg
	2Q9PBvLtKIBnpYfaU+YYAqwliQP0RdjfCBXeP8t3t22sAJCDb/74lHEpKWFm+4CO
	gn4GBcHuN+E5kTewkKUoRVWlmAl4/uW5Up3L9zC7SNg=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Andre Przywara <andre.przywara@arm.com>, Florian Fainelli
	<f.fainelli@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>, Alexandre TORGUE
	<alexandre.torgue@st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Tony
 Lindgren" <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "Kunihiko
 Hayashi" <hayashi.kunihiko@socionext.com>
Subject: [PATCH] ARM: dts: allwinner: Remove accidental suniv duplicates
Date: Tue, 5 Nov 2024 00:06:27 +0100
Message-ID: <20241104230628.3736186-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730761655;VERSION=7979;MC=3740397895;ID=239242;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667D63
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_150740_456737_751A853B 
X-CRM114-Status: UNSURE (   9.03  )
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

Allwinner suniv boards' DT files were accidentally duplicated
in the Makefile when they were moved to the new directory
structure. Remove these duplicates for code cleanness.

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/allwinner/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index cd0d044882cf..2ea5df3d9894 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -268,7 +268,3 @@ dtb-$(CONFIG_MACH_SUNIV) += \
 	suniv-f1c100s-licheepi-nano.dtb \
 	suniv-f1c200s-lctech-pi.dtb \
 	suniv-f1c200s-popstick-v1.1.dtb
-dtb-$(CONFIG_MACH_SUNIV) += \
-	suniv-f1c100s-licheepi-nano.dtb \
-	suniv-f1c200s-lctech-pi.dtb \
-	suniv-f1c200s-popstick-v1.1.dtb
-- 
2.34.1



