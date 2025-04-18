Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Itm00J1uaD0MfR8SRxtol0/+CWNZ2SWKT/We+OoqJm4=; b=fKh3fJP3OBb2Kyo2mTjdusMxQn
	Hlf+uRxn+zSunA2hZ7DZqVs/qpoRUSjyOwAu7iAYMx9NVYuAkMctpjxS5s9Pn7M/aDXZrifix7WTU
	9PeLGb0BbHoYScX6i1CjFIuVijrnmzcg44xlzzHURXIX06+tlyVd2cW/fpwLKdVLQZVMjJVqKpoVm
	lQ/+MEC3QXQoGDfAgBq0lk/2cmP8l4cYK8rudv8mdzdvfOsUMcjpRenGpda3xk8HVFU0uBYZhJOXx
	R1VsdzyKSyUiYX0hkjOiFgQEToM2KJ0+lxpQw9wAVlLcaVfHOyM5GHdxHCL466ejbJIFUbwpeMApl
	KYuFF3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fSk-0000000FIgz-08BD;
	Fri, 18 Apr 2025 06:44:34 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFo-0000000FGen-1uVT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Itm00J1uaD0MfR8SRxtol0/+CWNZ2SWKT/We+OoqJm4=; b=LQ73NpTaqBVef0LspueNCcEg4o
	TeXvKaVTIJ4CHBN3We+wJy33eiUQ3a5yV2hftqGeiWGUJRwJVYmTg+twNqY1F3XyHDHRcmx/dmvyp
	6xQcqDA5HOTF58c+t++wR4urUsFwFXpuFPz9EBHLjBqYx/0goFH0jczjmKRRmdvI3oiV0pRtH6cNW
	EdfkZ0yiIOR60h2W4Zr6Ef2n14L/LCySABVLm+l1mIBmqHLPeuG52iexNkH1NILxoPPQFtTalClVW
	P0gah+1FUtBqXqwCx89jNs+KBcHcIeVTFWtoFi5D/LT9YllOj8ODRKgMEInAsua1NWtvJuFZ3Fn5z
	UmU3WM1w==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFn-00AbM0-1F;
	Fri, 18 Apr 2025 08:31:11 +0200
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
Subject: [PATCH v3 05/15] arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
Date: Fri, 18 Apr 2025 08:30:54 +0200
Message-Id: <20250418063104.2202085-6-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250417_233112_648175_596C9CD3 
X-CRM114-Status: UNSURE (   5.77  )
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

The phyCORE-i.MX93 SoM comes in two variants, one with VDD_IO set to
3.3V and the other variant to 1.8V. The 3.3V variant can only support
DDR52 mode, while 1.8V variant is capable of HS400ES eMMC mode. The
information about VDD_IO option is encoded in the SoM's EEPROM. EEPROM
is read in the bootloader and bootloader clears the "no-1-8-v" flag in
case of 1.8V SoM variant is detected. Thus add property 'no-1-8-v' by
default to usdhc1 (eMMC) node and let bootloader handle the flag. In
case EEPROM is erased or read-out fails, flag "no-1-8-v" also ensures
fall-back compatibility with both SoM variants.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v3:
- no changes

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 663530a7e2bb..22dbcc89e311 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -172,6 +172,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	no-1-8-v;
 	status = "okay";
 };
 
-- 
2.34.1


