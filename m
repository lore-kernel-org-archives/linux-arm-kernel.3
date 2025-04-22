Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2CEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcC6sO/CO6NiYaevDv7ur1bv7w/Mg7MMOwZOt9Qajsc=; b=vUVU0QJQ/rYomCvaKwnWnX5Pfu
	ysUKVm837POR3XeXlvI5s+ACNi29E+xHnNW0abfZ5TZP7Hlh2PYQokNWN8Q+vuVemCd3ZUQtP6c07
	wBJf/OcPDLoGQfcqqR3Fx+6FwuJFez11Rds55yCf9U7cDsf16bd73Th95A8ha+hNsSW89uZpIgsAM
	eQueKbZvd2jhy8NWyg5ymRhc/wZa3a35zAy97ZfZpkb3wV0bRvEmccenUucym7h4TAHsDyIBONbbl
	WXxwgw1BWQw8t52m2aazjecfGG4GppvL9MqpinJWb+lhsHgH3WOHtgcrgHSAuZb0V8zf3HxZ7ARap
	82U9T5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Byn-00000006z2X-2iIJ;
	Tue, 22 Apr 2025 11:39:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJL-00000006qlp-2WLH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rcC6sO/CO6NiYaevDv7ur1bv7w/Mg7MMOwZOt9Qajsc=; b=jXuIpiS3qMSyrgRdaT6s//E3+z
	YJnHafJsKICHKKoV/9ERExoV4Mo1QbN7HRY/zVlDvgHtqSX92wP6rdcEoTz5dsqdEVONI9HOMwVwS
	vaTsgnsDT6NX9YFCEipOHktOABBrqyUZj8ggrqex9dzfnvCdbKjto9KciU0dp2ItM4HwpLmoVC2b2
	+NVwlMmacy3pfpCPjVa2/pNJsZKLoQSArJ4sghLUIaBhO2VM8xmfDpy5JWuH7hEXPJk1mR9UKRekp
	Fbr5Bm2QWsMrQ3Pn5XFJh1fBe4CBCOpZxJHT5ya6ZGFov6DoY5gRBDwY5yYsy6aUYfIFPH37Hai1E
	e4ypixoQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJG-0000000BBMh-3cDf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rcC6sO/CO6NiYaevDv7ur1bv7w/Mg7MMOwZOt9Qajsc=; b=OI81sUHGM/1BwyYkAPJxbCK46v
	//e/uMtr6QsC4WGnwQJjmjs2uDNjTcNRDXkrmPojEKdlEO+3jvViivfaCbWz+BVqOU9lH5UAzA6Yd
	gaxVWA77lT+h7O1I0GSmTBvyJERCQj6cmdydCiyAZAiNpRrZQZSASLI8Ng5/yaRS1BMX0eE+J7WbC
	Pz9PZ2pLWSvoKik5rBCDYHg6bcMcOzZ7VjzJkJKIYaxQ/89g/cHe0m/Vz6nca5HPrX+5vRtiGrjs+
	Q1ZATpozvftYxLxnMgr9vX3zFUmb/VkQWaa5qhgzKDKfGX6a9/QW0ahvA2Y+fMNQewROPoh9po4U+
	TH0XFmVg==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BIz-008kyr-2N;
	Tue, 22 Apr 2025 12:56:45 +0200
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
Subject: [PATCH v4 02/15] arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
Date: Tue, 22 Apr 2025 12:56:31 +0200
Message-Id: <20250422105644.2725168-3-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250422_115703_392392_3611C844 
X-CRM114-Status: UNSURE (   6.97  )
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
Changes in v4:
- no changes

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


