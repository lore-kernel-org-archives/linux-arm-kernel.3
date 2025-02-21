Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2087C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=; b=HTUOMlOJT8XjfSbMgQHajyMbch
	eKrQlGazRpN+3ryXKLLL7l6HjX2h1B5s7m9iiqq7YGC8wbvc+YBaZMKspKXq5cTI/y/BqlF/wKTGT
	II5q5xwd+cV2hYepc6hV3Dz+y6DjodMecAiZrOJ2LSVSi6hVwPmwgAYva4A6a5PXNtLqqVdyZvl5D
	77JKKmt9EMjADzhNeaDJN7cey1yMGijnXJWzkztOnwQWXtcsE/iCXginTQ11APCx5ubaAWwzO29Ng
	EtakkYkPx/Mby0/ZZlY/BwbtpnHuJBnJFve48f4gcOcoHXKRF8qXf48zGo022mXk6+73jySTaJK6u
	Pxo5EOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYWn-00000006ctN-3NLq;
	Fri, 21 Feb 2025 19:17:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYPj-00000006bWz-35rP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:10:20 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-abbc38adeb1so429591066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165018; x=1740769818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=hn8jmhrIGnfEItehAYdcLbiRBz1Yn/7fTHlRHzux2688N1+V+j7nL0IpIXhm3iP76F
         b0808+gWazkEnsI6T18nBxJ00ef4wGyOMsztoYngZlAnOzxHSz10kb/vyMcFeL3DC4w0
         csbXCo076lSnDaT63VivcgI2pCPTUmIFIEu+e342VegL2VrkSM4cvWMV2aak83Xj2USS
         bFQ4IaOTGHvqt+YYOwsaxxPQ1givNm+TIfHl1CRn5hr/Yp7PKW2G39MybcDRIzzyhLTo
         0uY1GSdU39mWnZBTMbcbMoTxsxvcL3tZbgN6WrGD9xg+sUC/kNkTalgYd7B3j4RFQCZC
         96zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165018; x=1740769818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=aSi623rUmxJnTEhal6Y6e1Z0RgYQcrqxqIa9cYANT4O0H1RDMLmNrLP0V95jqqYti1
         dsexwgpy1rd/UxPF8jV+2wjPTagK/66SrldaK+Uvzdb05SHqYLJ4tPWAtmoy9lFqULDe
         mUB7vE2Evd9jc+nMTUIegHNWr5AR9nyrV6Bfn82qNIOW6cq9RITmLpd/ENOOrpBNEfbZ
         5eJ/G57cqwq/W44l+kA0CIrQWKRH5HKwylJsFXwOAYM5JMEf2kqExpwROcWQyB4j1Gak
         TncgP0fok5CViHedO65bv9DFK+B09teh2b3BzfHFHgeoiLldadQUO0R2600C6fAyyRkt
         DAIw==
X-Forwarded-Encrypted: i=1; AJvYcCUAjGnBB6KM2aqEYz3ZoHLERf3a0p/noG4GZmNuJehqjHEh9Z73llxT4Y9dDF0cNfzgaGsdXNhPZ9MYkKwkls2V@lists.infradead.org
X-Gm-Message-State: AOJu0YwT4Lu966/I6C9F2CtIUZbtapngdWcZqDMP7eMhyH/HWwKmwzE1
	/jyuBgXeTHe8iMuR58KHO/lGZM7jXeV1WEiEfTFTl2dWRIUNnc9X
X-Gm-Gg: ASbGncuNfKWsBVwoW7FZ6/7NR95oVStLN+cab859nkTIweXQE2zKs6OsItL9eV7kT5E
	5WV8F5CkK4qO3kA65Wbbo0D0DZm8BhzL1gB6XoQRD1abxwYbu+wlbM+K2Ipf3JgfihXwuTmCfqz
	WNTPbS6U/sCc4UxYDOAqy03ws62qsHHIWP5ut5/ZSdSr03mpUfkhI7UA00TFQL8fPGOLV4iSwqT
	OeEOvA9wv0tcMIbYNTNQzKoR95Yg5BRAmQr0wGhAacSxZzQp94m3KGxLdHBuMahFbCl8b2fE7hL
	ZuX2eGOJEGV2yXkHwF4I2oiQp7WBMULZDGj65dSctJyflmp3otU9nfhIjXU=
X-Google-Smtp-Source: AGHT+IGynN4ZF370Lzvi3ueh0CqKqONEKwybpfbsK9fvcCWm2za00Rn41+jeaxCDTpgJmAnwoZijwA==
X-Received: by 2002:a17:907:7f9f:b0:ab7:c94f:af87 with SMTP id a640c23a62f3a-abc09a4b598mr518223166b.16.1740165017795;
        Fri, 21 Feb 2025 11:10:17 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:17 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
Date: Fri, 21 Feb 2025 14:09:29 -0500
Message-Id: <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111019_775343_DC6126C9 
X-CRM114-Status: GOOD (  12.43  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
applications running on the DSP expect the core to run at this frequency
anyways. This change also affects the AUDIOMIX NoC.

Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 86c3055789ba..54147bce3b83 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
 						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
 						assigned-clock-rates = <400000000>,
-								       <600000000>;
+								       <800000000>;
 					};
 
 					pgc_gpu2d: power-domain@6 {
-- 
2.34.1


