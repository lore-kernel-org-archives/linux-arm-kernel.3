Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0906CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNzDwuLi57xshjL/neWiu2RuuYKEMPl9QJTsvFxHCEg=; b=w0Sz4JYQZU1V5j0hUG60swTZUH
	x5al5PrQ+yvPkzC7O9w3fj4Q2Fk1UYvqorYBRjwEiyIhkbjVXOdB5fVqo23iRMBp5Bw4Pa0j8Z1cS
	3gYnMRjj/hfBgwkTPtFYKLK24N4fZg+HKsmSgx4+YUj4ROpchbiz/Cj6839yQin68A0NshpElvso8
	yMSwlZmrE8C/6yIRN7kkOx0aWDnZ9Im7pfJPNxtRGfcmqigwNXGiZCpIYG6647OxpiDZXPr3kNtYr
	YA58kiiHG5T+IZ7PAZ6srbYI6+xSA7HAUtLwOm6JKUcRWbn7qtR9SyLRXsdMkLjwZSukw3mJPmZHQ
	/zqBRaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXTp-0000000AnNQ-1jE2;
	Fri, 02 Oct 2026 07:14:53 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXTj-0000000AnKv-0X2B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MNzDwuLi57xshjL/neWiu2RuuYKEMPl9QJTsvFxHCEg=; b=UKqQXx99EEYgsShGpnFPdXae/8
	2fR+SMN5tTGWrcCUJA+moinM/H1A1lmBHjCS6jRbtqcHUL9B/lY88B/BCvPtyDS2/eaEGErSnUSGH
	jY3VFuKNtPHCTTyHQLPxkK5Dszahj1bkSiiuDWj53YPDktFSHMX0QQzN+TRaaOOpg4Seq6l6fXcwp
	LqjIL9P5dYtP4RJEBYwC0yH52BJ9FZBCa4EgkSa/qWQR1DQ2Xbo076CkUQ5H8MGrG1duM6bgZrkrh
	1oQEvWaM2U3sNbjZ3wqrfUlvdC4eNsVHbzJe4wNuLwCbxBs/3lcEJU3HNEYpI7bxjkJ7/GD0qnBcj
	wTCkY6zw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50874 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCXTg-00000002ntQ-0e4H;
	Fri, 02 Oct 2026 09:14:44 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 2/2] ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing
Date: Fri,  2 Oct 2026 09:14:41 +0200
Message-Id: <20261002071441.2499132-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002071441.2499132-1-primoz.fiser@norik.com>
References: <20261002071441.2499132-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_001447_657112_3F44776E 
X-CRM114-Status: UNSURE (   7.19  )
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

The pin muxing of the UART3 CTS and RTS pins on the phyBOARD-Mira is
wrong. They are swapped. Pad EIM_EB3 has to be muxed as RTS and pad
EIM_D23 as CTS.

Fixes: 800d595151bb ("ARM: dts: imx6: Add initial support for phyBOARD-Mira")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v3:
- add Fixes tag

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a7d6af162731..8b2b4ed76328 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -374,8 +374,8 @@ MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
 
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
-			MX6QDL_PAD_EIM_EB3__UART3_CTS_B		0x1b0b1
-			MX6QDL_PAD_EIM_D23__UART3_RTS_B		0x1b0b1
+			MX6QDL_PAD_EIM_EB3__UART3_RTS_B		0x1b0b1
+			MX6QDL_PAD_EIM_D23__UART3_CTS_B		0x1b0b1
 			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
 			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
 		>;
-- 
2.34.1


