Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853A0D3B7F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lEkVLzppht425ev0cm54WY5kvUL/Y39nOpsptm+9Ao=; b=wPpkngJdAuvnSooww+ngu0ZujG
	jHWzKolTg71dKPAxhKCOjtLn8K+hNAe40KEdX+37hivY0ZP24UaKwvynf3B7SUDbu0Rv8khKxHwYP
	KaI/WdOXeLgl68BRq1XtQOEJM9YkVzfAMuRWifJfC927vHZ68lflUF7HRDZWqauGGnawVE9FzDt9i
	V15oYDn5Ue/+2Y1GcVrH4qQW7GOIqK2ewYdmqPiNjoL/IY9fHgXq6Rt0Bzt+lbZfMckKaEngpNQfz
	o3AjwMGCXhDC4aQuBS/gNjFbdpISmjEmx6jvbQyinFMuLIq73Mky6xwakuD9t96ejGsi9ZzKLQdRE
	PO3FKOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUMa-00000007Mqe-0ZTf;
	Mon, 25 Nov 2024 08:22:32 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUIq-00000007M3G-2nqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8lEkVLzppht425ev0cm54WY5kvUL/Y39nOpsptm+9Ao=; b=DA0YIWZdrFTMRJKivwK+y4vlDi
	f3NStfIfYkEeE+DBnP+weK5f1ouJZH/bZXad7M7rTNHFcXm6IW0t/uL/xpCKEcXhrRJEyG5X9HMKd
	HLIJqnjxBPoCZWadlIAEQrUUaZxTrxN9eedCsw54cbWYYtWizKmph0WhLW7G4dVLuwNdIA2AD8uG7
	jkvt0fWJVwbwq9Glv+7Zof9h+2MakNgNgn67qPZtWMazX3sKDNIjaxRg1Xae6FeBWOWnqJ/P2NG8w
	Sq64wZlNaDGLAovoCOXmcsx+vNWEBVABikNYUIp+wBTUetzR/7jsho3Ru/ANsel4CC+sTHHoesA0L
	K7O/l0KQ==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIn-00Eq70-0P;
	Mon, 25 Nov 2024 09:18:36 +0100
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
Subject: [PATCH 01/15] arm64: dts: imx8mm-phycore-som: Keep LDO3 on in suspend
Date: Mon, 25 Nov 2024 09:18:00 +0100
Message-Id: <20241125081814.397352-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241125_001841_172962_722CC458 
X-CRM114-Status: UNSURE (   6.67  )
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


