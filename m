Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5AECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jrCNPXnnoQqaDELgsJKRlngS3CXoF51zhyKLy22jlso=; b=iuDSY7CiB3Oo6cLlx0gqCsailU
	CK6uEjZtRxHJmIHHQ7Lalv8K13Qi4xKzLgX1sWOKl9yyDiob2LaUuW1pOeIH6251hDskVJgUvQiKF
	08PN/r8riPS/rHAyyIjCZyhHLMS+t/FM0RH8EmzFN7K9GRHFGkJFm0UgBvrb1eUsAoU5XHmYs532b
	QfbAMObKnR+b4zb/3Fry33wxnwCl+1TDqLl+QM0lIDHEuR5vTSFJsNVK2upkG5i8/AL6ivKdIJOeK
	vdDprogx/HGmgpKszBkzatN8TuXpB807XKzGIZ8OkJmI9pJiQCUBG00UDLmDFl+dxOSG5iUBNSDad
	NJFHtxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxtB-000000034ur-3sU2;
	Fri, 15 Aug 2025 17:06:50 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwC9-00000002pCy-23Rv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:18:18 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DD709A1132;
	Fri, 15 Aug 2025 17:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=jrCNPXnnoQqaDELgsJKRlngS3CXoF51zhyKLy22jlso=; b=
	OezYG2/sIP7w9L+In2xEeaa2K6AJTOxkn4yPlvp24uvV9zxi7MtMTK2cCXvFdB9k
	1h55oG4p3YusmV56LzmctAMoUJQrDP9/aPABMm3f/yiPfYau2AN50/JLlf0RmN93
	wpTdwU5dOXm6HjKh9m5PH+PuyhWHVl/7LUq3fNge4g56Ifgv6ABa3u4yjQEjs5q1
	5qTH3Naf6IxkyeROi0FETPGam41LR9pTVJdWZc+rZEuujVUuX23E/AJpzw7BD/LS
	3SETKquD2JBFq5ABIlIWhQUlauy03skoxSrzMy5ejEZICsoYy1xqxh3O1kvfT7ci
	/KPc8CvgKRpT9sNJOjmTo2HIeU/X8HDAPwaAIEKePsISzks0fc9uGi9Eh+Fo/FeZ
	+RiR16v14zkAw1IMj/0kJ/LpT/Ao8N3VaqEKNRjDAAwJhBxN42uTM5/UydQ/vqpa
	mlcFs6380dGr4ycgJ1GgygPr4Gos0UVazCM96l/n8auUdXF0oxz+qjEM2F5K8oWz
	RT4tVYz6HJtchEErTdcyE1NORYiycnHfHRoU8GzBUPl5gWvNxoJkSPdjGK/t6cUV
	0DGOEGEYetpDEcuOlgi6F9KgF134OhlV/K6DTobyc5pUql12GVh7nVh9opDH3WVB
	OPb8Vw8L+iBjTZRyInPTsR+o2iB6xyj8pBvnGgdHGHw=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Fri, 15 Aug 2025 17:17:37 +0200
Subject: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAJBPn2gC/x3MQQ6CMBBA0auQWTuxJQLiVYiLtgx0Ei1kphoM4
 e5Wl2/x/w5KwqRwq3YQerPykgrsqYIQXZoJeSyG2tSNudoG/QXz1r4eOGZc4wdFM3ZuCrY3ru1
 NB6VchSbe/tfhXuydEnpxKcTfaxGeOZ2fTjMJHMcXVJ/IwYUAAAA=
X-Change-ID: 20250815-b4-tx6ul-dt-phy-rst-7afc190a6907
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Csaba Buday" <buday.csaba@prolan.hu>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.14.2
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1755271085;VERSION=7996;MC=709096725;ID=1149888;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E617063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_081817_689018_995031DE 
X-CRM114-Status: UNSURE (   8.37  )
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

The Ethernet PHY's reset GPIO should be specified in the node of the PHY
itself, instead of the MAC (`fec`). The latter is deprecated, and was an
i.MX-specific extension, incompatible with the new reset controller
subsystem.

Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index f053358bc9317f8447d65013a18670cb470106b2..0a5e90704ea481b0716d6ff6bc6d2110914d4f31 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -246,7 +246,6 @@ &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet1 &pinctrl_enet1_mdio &pinctrl_etnphy0_rst>;
 	phy-mode = "rmii";
-	phy-reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
 	phy-supply = <&reg_3v3_etn>;
 	phy-handle = <&etnphy0>;
 	status = "okay";
@@ -262,6 +261,13 @@ etnphy0: ethernet-phy@0 {
 			pinctrl-0 = <&pinctrl_etnphy0_int>;
 			interrupt-parent = <&gpio5>;
 			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+			/* Reset SHOULD be a PHY property */
+			reset-names = "phy";
+			reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <100>;
+			reset-deassert-us = <25000>;
+			/* Energy detect sometimes causes link failures */
+			smsc,disable-energy-detect;
 			status = "okay";
 		};
 

---
base-commit: 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
change-id: 20250815-b4-tx6ul-dt-phy-rst-7afc190a6907

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



