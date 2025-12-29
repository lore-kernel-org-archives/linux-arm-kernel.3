Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF43E92FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 19:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFiGSY8cOxIDdZFxqeVoqn31I86jZ/x1KTQLSNLEbPY=; b=lkEgPPJ6v43xZi2NMfaFPfzFFP
	PBNc+HPWF+vw61nhOQth5IbLWWoCVMmVUZzNJq6GxILH7Ybc6N14TpvXVNOgaV0/McOnfPchxzqrR
	vBzm2svP0naQP1F6dNZwyQpG8saDlCEBV0fwlQZNUm67pCh4Fd2jt+ovtXKXVD9b9VolDVr6HmaqE
	BskSDo4zLC5weTjvDxue3jBRlS6UDw++Yeq500gX8qwqnpRZCP3qWLSg/GekVgcEvvAQYLybqyOhm
	7DsgXRIbTOP6zkK6uVemeV6JsovMQDbNuzbuCLdmPHx9Qx23gsZTQ00XhiYoSDMy1psoLiFAnGLa+
	QCq8PkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJ43-000000040xC-1KzA;
	Mon, 29 Dec 2025 19:37:59 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJ3x-000000040vC-0Ngc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 19:37:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20AAA10CC98;
	Mon, 29 Dec 2025 20:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767037065; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MFiGSY8cOxIDdZFxqeVoqn31I86jZ/x1KTQLSNLEbPY=;
	b=XdfwlXzeuT8nz4u8Boq8RURMO32eTFkpJJeYHgb0bALgh2aUHxD+2QwaSc18PwYiEtSs+k
	VBoQ2c6uL2KeP7RQi5IdPNzrDny3TvQpwD8G3heoo+CWbU2RfgDO5uiUgx/I1WhLCWIhuh
	WAmWT9ChcyB8CjykkZoMkMnmAlb0n/X89ytZv30V47Pqhfv/HWaSCGYeTDtItCfolIKiYQ
	Nlwn/jdBSINDeahQVqMet4FXFN9gD1jOQPcH3unw0CCjJsKsJD94uRqJrfHYcgtqaUfmg2
	gCMXI13aR04/7D7+mDI8aWyV0PgkCaAhuhMDe2FXYSbakyK8Z6hOFLYva8XnBg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: imx8mn: Add SNVS LPGPR
Date: Mon, 29 Dec 2025 20:36:42 +0100
Message-ID: <20251229193706.73564-3-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251229193706.73564-1-marex@nabladev.com>
References: <20251229193706.73564-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_113753_336531_0EA33F7A 
X-CRM114-Status: GOOD (  10.21  )
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

Add SNVS LPGPR bindings to MX8M Nano, the LPGPR is used to store
boot counter.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: New patch
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index b98b3d0ddf25a..3199bc0966b03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -628,6 +628,11 @@ snvs_pwrkey: snvs-powerkey {
 					wakeup-source;
 					status = "disabled";
 				};
+
+				snvs_lpgpr: snvs-lpgpr {
+					compatible = "fsl,imx8mn-snvs-lpgpr",
+						     "fsl,imx7d-snvs-lpgpr";
+				};
 			};
 
 			clk: clock-controller@30380000 {
-- 
2.51.0


