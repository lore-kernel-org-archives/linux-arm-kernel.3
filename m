Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B054C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n70hMaVM81GWtWy9Jg8bRUqLHy2sJDCIfQna4QNFyZs=; b=q5banw9gFEC2AgxbxECC+DQNAA
	G/Merva6QkO8DJTeIY9w0oZbdmKaiSYNTrYWKqM13aSxEnNJVh/6P8nEzIl+QBJFsIWk+Cqkok6X0
	n1U19iE6o4qXS2z9xuYrpSO6JrajzFF2a+pCitLQjDlNAQjtMKjFIeiO7u2MKV97aupZ1/6taxn++
	8PTqyK40ZRwtKpE6fSOICmbBaJTCQ2Ph8x7PSSUvudq6eNAPR2rR3uy8rbg0pmtjsfi/6bGYWyezT
	d4oGT4bUPrrkIKZl8idMlgVrh0XQBoIFMCQN+kcBt7NLulo6x/1p/S1N/OqBFQ5fyVGsQec51CbYX
	KBeM3Yfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ffe-0000000FNQs-2o0n;
	Fri, 18 Apr 2025 06:57:54 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFu-0000000FGhP-0jiX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=n70hMaVM81GWtWy9Jg8bRUqLHy2sJDCIfQna4QNFyZs=; b=De3HQ4fVD+BdcJKXYED+thgzAH
	vHkgNzXxCaNbxiO496oSi25Q+R8yVTVqEzHLgsNPCkag+dQNoajYn99O+DSDu5BZVpN/X5WRwaW3e
	5i4KO0EoCe2eYTBFRSeaDJWJdEnofU8HYK45zvOr8Ml+/6xG46pgeMxiN/ifdbVuU3oJbYzqLN4WT
	LrTWAB+C9WgEpsrQRSycFogF3JxkIAGKYxf6I1vmfb3UXPLAD2b6W+NfA73ZDETDkhvFzKnt/dXtq
	1GlIkhaqdpVB5ty/OPjxR7jxRZRTAjMvnUjf87c4mzGleGpmrHs7ceEtUsho8rL1D0TffPi1SUm1e
	svAPXB8w==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFt-00AbM0-0J;
	Fri, 18 Apr 2025 08:31:16 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 12/15] arm64: dts: freescale: imx93-phyboard-segin: Add USB support
Date: Fri, 18 Apr 2025 08:31:01 +0200
Message-Id: <20250418063104.2202085-13-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_233118_371654_81F0CD54 
X-CRM114-Status: UNSURE (   6.91  )
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

Add support for both USB controllers. Set first controller in OTG mode
(USB micro-AB connector X8) and the second one in host mode (USB type A
connector X7) by default.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index be9c0a436734..e4f959f665b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -80,6 +80,19 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* USB  */
+&usbotg1 {
+	disable-over-current;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
 /* SD-Card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.34.1


