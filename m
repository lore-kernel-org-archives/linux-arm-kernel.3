Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23D4CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6XubT8oFBQXKbvZ/ist0Q0eQYWorneOJ/4SaUe8dPM=; b=lcjKLjJgLynSBtCHpnL+pMm8Na
	B1JjivZYzzBds3+TA0Ca0/wU8NTmNuaFsQCD8mPwHKTU+ZtwsJ5tmrGodDpfl8OCjj/tBDVd/w7VA
	YrWAYYmW5VqKxZ15bqLwCO4Uwl2+dqjpSRE9onrTVUUGtFIIDxCYBGZ+S59Gdp3l/o4zzyUt58oB2
	sVthfUk87qV/O/fs8Jul7BoyEMcuEXR4JLH6THqKZLtLZMOLJ86uhiQ4xooYu3rkDyTbMpoCs90Ms
	H5592MX13BDwINPOdS9meoA5AUOGYlG/OYKMYIeXCjjHyFMn9sfE/p2Gxs09JGEZ56AVM5u9tSzAI
	D2QHRQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBsV-000000086Ac-3uBM;
	Thu, 01 Oct 2026 08:10:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBsU-000000086A5-32zJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k6XubT8oFBQXKbvZ/ist0Q0eQYWorneOJ/4SaUe8dPM=; b=FKt82PfegajXlZBFFl4Iki151z
	XT4luvXs9/oX0DT3i6SSwjqyQdHLKdLZguDzFMBcYDF3AP7VdFfslwLxC4NYJfUiS8PpRYHsu+JB8
	MPxsz8ptwGXou43TK2B2gduyP7Q0WeyPDGJArRHeEsJyXbVWSKTJ7ydXN0XWbpvVQ8MhhOC1b/3et
	oJu9QMjHOYhXL3mPzhYsZGPBaR0vkegX0j+CQhQO/54lIz0R6Ah+40E4euOJ7DoRPBE4JM7FN9VZ9
	FZXUG0IEOsf0Dc4wd6J5BJYXp67nQxMDsBGZFTvCgORQGy6o7dW5M++2TWXbalzC4gKv/uH6MDtbF
	riiacuRQ==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCBsR-00000004iIp-1Ft3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:10:53 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:34824 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCBrn-00000001der-0UkL;
	Thu, 01 Oct 2026 10:10:07 +0200
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
Subject: [PATCH v2 2/2] ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing
Date: Thu,  1 Oct 2026 10:10:05 +0200
Message-Id: <20261001081005.2209755-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20261001_091051_628965_DAC91718 
X-CRM114-Status: UNSURE (   8.01  )
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

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- new patch

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


