Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D2DC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=; b=R+f18yW04B8Ds37XqqJtnp85qT
	3bln567j02HK9NFAoI5aXWK8E5XUdad/6RqrksdBB63LqkuxHGC9UtIO+A6AnFdipsyHDgww+/SFC
	9ZDkhHOY37BLvQLuTj0Rc13BmUG3LNx4ShVlONs8bfv3FKrQzvsrPTlPfzH4acPC9e1XzTcWlUAPe
	vszvi7RBYvY/ep5tqorVpxmk247L6mXfFRxixA0FYehWA9X2wxbFrvnZ5vCAYU0oFxZm8B0QbV8vi
	ws5YsydQgZANCpKTsCArq5uE4ICciFs79+3RRMK7wVHfUzStu42vkeW7TTVH7zytm3sUQ/R98Vi4F
	dghX/gSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8g-000000063QE-3ONl;
	Mon, 07 Sep 2026 06:47:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8c-000000063Ob-2v38
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:47:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1734513f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763648; x=1789368448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=Kk2LuTYKeUXtaaGvypFkNx/wbkcQbioXFx4FXurnOiCWSgHQadHw2tBthXXTVrxKRh
         MrIcbZEaVCQlZxwacpsf5CPGOr12a/r6RC0HiTIghtGf/Se1I14aXEPhjeBd8vCxdrs+
         p0ocUN+x3VFOFvpdHzwpiCds1CaLIeaAfwI9ix6owcJykx7u3ORFDf5FWEdd4OXQD5dZ
         6cXLwe+vieYqkAx7p3vtQIJJmdec6LmXg3ZSMxY9MyreXodTJsk08Sl49Hs+mWZmSuQx
         Mash510JQavdLLdrsRXxih4UdKcGvaqKjuUouOCedvKCqA/6ecMDZ1LdDFn0NKTmoReJ
         qjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763648; x=1789368448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=aH5LG/PxdgAsVcTrJjNZanNw1CvyZEmYGMRLA5YqvTxN7KGp28u96cs2XcgVj+M7y7
         4AWGECr3If2YobALxLVxPLTW7cXQ/qj3uJxZ42tEFcOOU08LZ407jm0Pdw3Zl0p6ze2F
         ompVmHk+VV3vKDGLv3NsSolbjrF62uNiDOBw22c8HKVte0smoviyDZqgY47i4hFbMNBh
         vVu9qXP/Mx52m+Xi11hT5477jz85ZIWOgL6TrPAbzxA9sJkbiU9HjJK/Hd2Owmh4f7F+
         tUp0KjEvq1SEMFnqn/z61uevjoSLiRNbe0vNZ5N6GatQeojYdYItRA6hsNcczzmXVBxa
         I4pg==
X-Forwarded-Encrypted: i=1; AKwUvBwFVNTVclizFdFiR4O/4PaFDGKclJDfh++KbXeW+tUGcV3j+x9VcFlC93GWVzicGqiGEOApUdy5WdTBp+h0gvBr@lists.infradead.org
X-Gm-Message-State: AFuF++myDaf+E4McZkUPXZVWgHzyPBRbYI2pKIjvzYidXgIEupwTmbOK
	0RJ3EE/Ng35ZaGsmnEzCj46jGWIXtgWYHvIRVvDf0Pg7Tl7h4e6JyOsH
X-Gm-Gg: AYBFou04HqEICjHmqv7c1wt3ZoFA5Y3B3AWh5SWUAB6QE/Fi/dZk9UUSZD7092unBgA
	NWcX3v0upUedQQxS7dozNz/MqBJ88lKQRlZOJ1d9PNPfLG+e1b7cvNtssTFifwAXLEycG6X5BWl
	MXj+E56pe7gxFdQg8PjuQzGl3KO7dkzu2uixXMe7FVkgsjWLBK+8OqmSuVK7t8FMwy+mqfn+qHs
	81CawUYSpaDxYuaAvxeU0ry60O7gw1aCwY1Xp/nSy3MeE68KjtoVhEgAPSg657KSbiezxEbTdZQ
	loGQvmO4MpddObw2WFrw1CnZK5UZuw7stiv0s+XPtxB81QjALwE69MpHhYj9bqVjEB+DA/wWnME
	PSfvc69jLx0YBqeLyPBHoTnb1Ij/H2yYFaRTZwQYCIxG0xLqvZkLyN32fA9SOmvPiWQy++q7Z73
	w/u170T7VeaNeR7XC/kAXO9Oj22UL12c71tsB0B440m8ZaLfOaoTNMPRMPx/bGQmJF+lhfXQ4HF
	BLgfKqptfmT5pPuX8tTABH0lnZEyiO6OyuvAh7w0oe1DHx9IzDJqse4mdAI/7eF9jC9vhMsIfCZ
	pjKOX2sxVNjvG/EYeXljvQ46XdJLryzveGw6YljAUiKuf3Yy
X-Received: by 2002:a05:600c:4e45:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49cf81dc3ecmr232937625e9.1.1788763648275;
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:27 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:20 +0200
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add
 ENETC port 2 in SGMII mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-1-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_234730_754807_6983602A 
X-CRM114-Status: GOOD (  10.59  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

---
v2: no changes
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0


