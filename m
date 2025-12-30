Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75859EE4990
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ngjw1jF8erWpjz+6ULQxjjXMMO7FjUsBIVdPNE+8b7w=; b=2Dt2dsWnsga6dO05GN5JjJz4J3
	jN6tsC2tSVFzyeva+L2V7eXSjGx0O0zExyuLVQX79fQRbgyj/hbLW8+1GQFD1BtLE7q97wCiZy5bM
	iLudO5ir+oHaqpQDF0+XDg81oLGYF7GqAtccWqwXMlPsyOd5ICLAx1Qeg46nnwUS5iAqKtru7GPa5
	UizkhIMX96Nk2lPnfPGf6/rC91Zb7PMAScSlswXNdqI+IV1oCD+T670zZ1uocxXI4npv3QDxFTk9r
	J1yOMqs+P02Pvn58FiPOVLnmPami+OJwHTWfBeUufp5EHaKAkRlCZ+BTwTzuWxXHyrLoiYgQa78no
	6Cqs/zBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefH-00000005BeR-0ipf;
	Tue, 30 Dec 2025 18:41:51 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefB-00000005Bc4-1AQA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:41:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A029710CE13;
	Tue, 30 Dec 2025 19:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767120103; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ngjw1jF8erWpjz+6ULQxjjXMMO7FjUsBIVdPNE+8b7w=;
	b=WSA19Vs6TrY67l2nJXHUmG3KWKYAQPv0UmXYR0BIoldSYxSUALHLVhxjQHXhogNvH42u2+
	5sBxqUtJGmVdQ6UGX/oPkcgQ2ZmucOiqbgafWuFvoRTGZg7+XnYfSc335bFD2BXnzcCPqq
	va1e9RC18TeUVXOYFXdACJ//yC4vghEEhxroJ944zzmT/+X8lRlCy0/xGH1JC+1RAZe03K
	/PZzCTXSzBqlZb1rvB1i2h4Bb3hrR7IW57HpVAU8pIkRfbN8z5biWuFCljM4HbFgn/+Jv8
	hapz14F0wrn+rGy66kt5TeOPD0Rzj+djVcMVeJYiBpyljhUjAt4JckMdazUqsg==
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
Subject: [PATCH v3 3/4] arm64: dts: imx8mn: Add SNVS LPGPR
Date: Tue, 30 Dec 2025 19:41:00 +0100
Message-ID: <20251230184121.52635-3-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230184121.52635-1-marex@nabladev.com>
References: <20251230184121.52635-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_104145_454544_B35D2452 
X-CRM114-Status: GOOD (  10.04  )
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
V3: No change
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


