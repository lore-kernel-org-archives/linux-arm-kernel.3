Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18008C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Zafjo+ztTbvBc+RhG0NNSdmfh9nfZ0UyW3dSK9brjw=; b=3wKa+mwgFwbOOwOTyhUKZrKtcG
	TeQs6nXX9v/zm2pQDHhhRLkdvP7n3wI+i2kOM69DCh8AfPCFsF9bhbLP6BSdU/i6F1qSP0RuSF6SV
	r84DHMddZc52zBwT/VmsbrTAfM4uk3xyXkGjkQ9OOfitgEpH7VqPIwRGLXfwl8iPEagltLOuar9A6
	Xk6oQWQGVvSs0QWEEkppDnVzU9Ya0P+N9SOeGvvSPJT6tIqoN71gj/pJxDqqnYhlDUnVa90grQOOM
	nLqWSDFwCm/Dar+MA5InEqWQutpjw327ClO8gPPy91/i0+ZKs92baxR04Ttukn86jmvIzYjjOTNv8
	qAg+43tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kzo-000000082Xi-1YTc;
	Wed, 23 Sep 2026 11:18:40 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KzK-0000000827P-2eQc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5Zafjo+ztTbvBc+RhG0NNSdmfh9nfZ0UyW3dSK9brjw=; b=SEdAfE5sjTs3l5jRqPWHrjP57e
	AqxYekaGt2M6KfUc9/wi00VHZbE3gpzFCAyDOmOhzhjDxQ2tq4+wesiLgg7Fotr2wtqKM7RFp3JZX
	C3x3pJvv7tY76w3ZkcNXubCepdfLeDW+eZybDzwDplZO3YYgv9omKme/Ftmt/MW9BJUdNot2mIved
	aumvKgY9uPO2te0L+jCtJxUI7acoAD08iypVqF42r1u33bNCk2ho57vDYx8msNb7ZedLuaZdr5A5D
	lAltmysyZ1CW4mkDFDoQ7ysGVNFqHyyYGL1FYjnSYy5JSrrTGIiv/4QPmqRSwVG/r2XhkvnLrT9YU
	kk7NacJQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:43182 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9Kyf-0000000A1qw-05sF;
	Wed, 23 Sep 2026 13:17:27 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH 4/4] ARM: dts: imx6: phycore-som: set watchdog timeout mode to shutdown
Date: Wed, 23 Sep 2026 13:17:19 +0200
Message-Id: <20260923111719.2032012-5-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923111719.2032012-1-primoz.fiser@norik.com>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20260923_041810_852630_72C4F981 
X-CRM114-Status: UNSURE (   5.82  )
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

From: Andrej Picej <andrej.picej@norik.com>

Enable system restart when the watchdog timeout occurs.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 85e278eb2016..ddbfecd591f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -115,6 +115,7 @@ da9062_onkey: onkey {
 		watchdog {
 			compatible = "dlg,da9062-watchdog";
 			dlg,use-sw-pm;
+			dlg,wdt-sd = <1>;
 		};
 
 		thermal {
-- 
2.34.1


