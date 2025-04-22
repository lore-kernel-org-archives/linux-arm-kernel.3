Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E7CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z39k5StkgZpWKfAv/m3DaB8YF2wfPhSFpVTQwdDrqm8=; b=K2ETr2iZdcaSr1ZPVx1LMM/yB7
	aRBIRcmvfP1TM01puIXdkwUqo81CBNVlaDjqTghs+N39Hlg20oaoPJlFsI1RD0t+WRCFwHonIC1uQ
	QIJ4fwqVJnK0h1KD3CLsizpZWsmiElW1fAYygqgeH0r5yoxiivNuJ0mcECaa5COqmv6M8VAYiTNkh
	jy4+zCVguNaGBRHGShFZnXHljESm+pxhBBpiyto+xSaoOTCFwj79alU5NhmyC4eCboLC87ZhYgePO
	NH0Cx+tm9nW4FMkd9xeJ0izhS9XD/58GiwVzgPXr1c4zLiFaeg9i1mBw1tFqTSh5VIKEqjE/e0+on
	YDVYV7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CDX-000000071c5-20gV;
	Tue, 22 Apr 2025 11:55:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJN-00000006qme-1SAd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=z39k5StkgZpWKfAv/m3DaB8YF2wfPhSFpVTQwdDrqm8=; b=S1iPZdwJrb+6N/Yty/kdpGldWg
	FVsTDjtCV5HscsKNtdLgbl6LiGJ8jEkO06R85DCkqAoqmp9qXfhpmJVRVmRYPSJsLW7g3bFsvtC39
	WW0QnU2yB6sCO0a8JJH6QbrtiqvcLjd/t1Vw18j72u6RdLpEgLbTYhNKLrTeTzJcWWtsfMCBs1/J8
	mC516sVlM78wVm/1/VyF+8noDimoCc3047rg/qmGHmVKm9wQSj7hgODSJifdGXhFrtCjQx5o4bvRf
	tZSfX50yCTxlBYUuy1loXgvOgQbdO/QTtXA09qGXRUXmbHDLfdg/s2XVUwTob7OdbXH1UCM8BKZX6
	yXPCwIeQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJJ-0000000BBNv-2D2t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=z39k5StkgZpWKfAv/m3DaB8YF2wfPhSFpVTQwdDrqm8=; b=Vmdp5mRId5yujxF6BM86RGPbgw
	u90WLug++aVeKKJk+it3ja08xhzqOWe4F1INPygr2gd5Np+d1rzFjfqlvEOJRyoLrAsYZPoVmli4K
	rYUFNOEF3XJpaX57Y/0KgEoxMPExCn5p2Mxq2D+Qem9t0YKZXuFiGGWZqbAHPbaAaS92YRVe4dIps
	finwZj4bpTaj+hTVtlBTbO2EJQKYlV0qRxg0sho/2OQksjJeqCmhBvvBpWWkfEb2FZCPKHfmdU/z7
	4Op8nYZ1VHIf7xb5/NrWC5NLMfPJ7KYJoYk1BsrFJPIEWzSEt27LoEQGaaZeozRJavjpNbgpk3DRS
	o8gK03Fg==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJI-008kyr-1I;
	Tue, 22 Apr 2025 12:57:04 +0200
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
Subject: [PATCH v4 15/15] arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically
Date: Tue, 22 Apr 2025 12:56:44 +0200
Message-Id: <20250422105644.2725168-16-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250422_115706_140323_2A05A1EB 
X-CRM114-Status: UNSURE (   5.67  )
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

Move pinctrl_uart1 to keep nodes in alphabetical order. No functional
changes.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 .../boot/dts/freescale/imx93-phyboard-segin.dts    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index c62cc06fad4b..0c55b749c834 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -228,13 +228,6 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
 		>;
 	};
 
-	pinctrl_uart1: uart1grp {
-		fsl,pins = <
-			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
-			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
-		>;
-	};
-
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
@@ -257,6 +250,13 @@ MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1


