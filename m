Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A5D10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j60eV0RDWpIwo/6h35ZqVsbEzvZp+/wceYsBxRYHttU=; b=1PCYIALJjxN9jikH/Rm5rtVdo1
	7tRiCcAnQVnrZepJymfN7hJDCPXpCtL3drKEmuffoBA4vJZ3U83OGrYxnFUD8EDAkCC3No6/MjK0M
	v5E6bwu9lteVf1p/XRKJmGGKKuDwEfomLr0BAD5r26kGeoqj9owZtdIrrOyFhj2EjujgtCOeHggRI
	DjTWTDN4KGpgmZoHi66tqGFJ90sZqfIY5wC5GLKc0rTalTh/YZuJpBUQgCxk6D+3LlUmvpBL3j462
	I1OywB3cdsA4L43Mh6RSXLJ8ZTVtB3l2DAg6ioKibhKP5uJLttqPTmZgeOiYEHKpyTjLCTUJURbsL
	WeDW8Ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0n6-00000005HF0-1Ow7;
	Mon, 02 Dec 2024 07:24:20 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0k9-00000005GOQ-2FMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=j60eV0RDWpIwo/6h35ZqVsbEzvZp+/wceYsBxRYHttU=; b=RZzZt9vQzISA7TfQ/XdmsgdjDa
	1vIlqm69BOBIsCDduCMBaO3+YeaDvk5B9zxGi4wwvrFk8jLZbI7ldPNtfO2Q0TKaM51SlMmyVwTzE
	7Y6L7IeAONjH3eC3OdUpn8jBWgZ9AIgHPRHhZR8zIp12GmeNp4hQvI9FD6EuOR9huHgXJtE9bGC6u
	3sHOF3Hksx4xQY+T+kn4znl0WIxe5e0iwTa+QkQdYVPH7MAIAAxVfk/HBXtapr3L1LyUZjQ4kEvfH
	ApwJAN2iLxq3bvgnJ2xB49EgEVmo6jBAavB0MXC84X/kHVmCfGXpO5bfqfQ1Axur22zugYAJxyPlF
	vHohSiuQ==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0k4-007Bva-2g;
	Mon, 02 Dec 2024 08:21:12 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 01/15] arm64: dts: imx8mm-phycore-som: Keep LDO3 on in suspend
Date: Mon,  2 Dec 2024 08:20:38 +0100
Message-Id: <20241202072052.2195283-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202072052.2195283-1-andrej.picej@norik.com>
References: <20241202072052.2195283-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_232118_039487_BEBA0DC4 
X-CRM114-Status: UNSURE (   7.04  )
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

From: Teresa Remmet <t.remmet@phytec.de>

LDO3 is also used as switch for enabling VDD_3V3_S and need to
be kept on during suspend. Disabling this can lead to an unwanted
reset during resume.

Set LDO3 to 2,5V as the voltage should be fix.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v2:
 - no change
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 6069678244f3..7761acc5c510 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -161,11 +161,13 @@ reg_vcc_enet: ldo3 {
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-max-microvolt = <2500000>;
-				regulator-min-microvolt = <1500000>;
+				regulator-min-microvolt = <2500000>;
 				regulator-name = "VCC_ENET_2V5 (LDO3)";
 
 				regulator-state-mem {
-					regulator-off-in-suspend;
+					regulator-on-in-suspend;
+					regulator-suspend-max-microvolt = <2500000>;
+					regulator-suspend-min-microvolt = <2500000>;
 				};
 			};
 
-- 
2.34.1


