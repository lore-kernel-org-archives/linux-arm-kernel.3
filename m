Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB151C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZM1mvqa4ajyuKSIc1N4rndazopwUD8UEQrno8FzsF40=; b=fmlkyNquf+l0cqGn0ZneBDYjj2
	FJqDn15EG8S2SYy7v5paO2gnZgQnJLYm3kce8E6H03nhqXYp0w57x5Eh83ZNOa2+jFgwP2GnD3fl8
	KTlYKkVio4WrrsVNS0t6H9q6K5uP2EV8MnHXgSJpFrOTS+shSEWboiStb9XORUAXQJ0b9PZgdy2XX
	LB11mFa9D/bzpWCEF/xWhYlc2vm25Sbth87zBmHUYcZVKFQ+rLsxXutYfGwif7qtfRMFBC4L4/tye
	LPn7NilqwuSCzdrqX8+reW/CjyRomcLhOqNqZ9rkh5bGHwcVCIkDaBid8rej8fWAkNYHXBM98q1BN
	POI3L2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fNF-0000000FI2e-1P4N;
	Fri, 18 Apr 2025 06:38:53 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFn-0000000FGeU-0j4t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZM1mvqa4ajyuKSIc1N4rndazopwUD8UEQrno8FzsF40=; b=pVxd4hlWwMroo6yUHzN9Zi6ZX4
	NuzkRgqs6AQ8KL4J/vOgPYu1xjPwdN73nKySzyCDf1FhQY9jDM4l4iMPNytxxZ71pjOU/dGE7NxDw
	3fjnNUIbGrm5fJOUlTsMQnJ6DuwMBFn10ZW0+m38+GxFcOy6rsGfSxrHA01mWg3JpM94W3Lj7SZDX
	A+pwZ0UbacnKjii48CjXgl9/QKG65Md0qfbucAcHgxqDat3PZ5e9zEhoa8DpzNzL6kzIaiS1WaEcE
	9baEXK7Gv1qRfPlSHk4WK+jO9aw51SEVnsGzZTicpMTOdZHqZdJvall2onY+z0Html5vZUsXw0Dss
	xbgh+rdA==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFi-00AbM0-0D;
	Fri, 18 Apr 2025 08:31:05 +0200
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
Subject: [PATCH v3 02/15] arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
Date: Fri, 18 Apr 2025 08:30:51 +0200
Message-Id: <20250418063104.2202085-3-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250417_233111_665348_0C56AD13 
X-CRM114-Status: UNSURE (   6.71  )
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

Add support for the EEPROM chip available on I2C3 bus (address 0x50),
used for the PHYTEC SOM detection.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 507a71f9294b..0528e293c03d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -154,6 +154,14 @@ ldo5: LDO5 {
 			};
 		};
 	};
+
+	/* EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&buck4>;
+	};
 };
 
 /* eMMC */
-- 
2.34.1


