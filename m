Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47FEC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMVr0ws5CkQAGwUnCKlS4uzwI98zmvZR9krDCNF3JCI=; b=r650GvfILeZL0iMzsgJqh3lhEf
	sqODnpV9v8++Ls51WUMCJAjWlvpygiS9J4IJzq3BshsEEtz9Z+WqQ4G4j/WhogmTzO3EgI22DxlIy
	T9SV+e2350rvaflbQNE0iu0Kp4ipfHNEraJnCTzqqjhOGhB2oqLqfiXhOGv68rWsTfKc/hVZnMfJh
	VtOqi6XEFfLeVEYR4pGMht4HEkOJzgde3VBGNuQRS2F2WgmPIVLKENpLmwQNpZTmX/vX1XsQ2qNWN
	e0KgagMi6/l1vXkuCE2LMKMcpKmaF47QpttaRYEuBTb1/wQV4+ckquR5aE2MzS8rhOfS3D6dBihBV
	E1C4kRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdF-00000003HNj-2dlR;
	Thu, 31 Jul 2025 09:31:25 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPPV-00000003Ftc-2SSd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753953433; x=1785489433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iMVr0ws5CkQAGwUnCKlS4uzwI98zmvZR9krDCNF3JCI=;
  b=DL1t99STDHE4fsqFNMdEBrH+g7uIzPVz+IiBlkZJaYUrE5mgHXOBZXvA
   iCY0CiplRbyE1Ec2EJDDZVhRjYobeDi/v7CyIemsI6DS1RNC8NKtBWsIM
   PVA3ZdLZBCGabaWwoNiTklI8DelYIJzuPvnqmqaDn4L2D9K2kZMviLs07
   6oYZUKu6/TUMCwgPM2uNolLfhVWiXQa4BRDsXd6Myx23HYYM0W5KjFnNH
   VTfAr6kz1QM9PDuez0Jcy18rMoMPhzaYIg810h1qqXPt3y9Fsxkz/sQmX
   E6gzShrzw5ShZkLwBph7De3mAwa165ueck+z+C/pveCFVu2d/ZQ/MV2eX
   Q==;
X-CSE-ConnectionGUID: KES0HHvgRUi/R//cAtr2VA==
X-CSE-MsgGUID: Rj7oXHOHRAmM44IczhCTFg==
X-IronPort-AV: E=Sophos;i="6.16,353,1744063200"; 
   d="scan'208";a="45516522"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jul 2025 11:17:12 +0200
X-CheckPoint: {688B3498-1B-4FC15ADB-CD71293B}
X-MAIL-CPID: 88682096A4402C254D972D6D13907F90_0
X-Control-Analysis: str=0001.0A00210D.688B344E.0008,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0573D163C63;
	Thu, 31 Jul 2025 11:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753953428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMVr0ws5CkQAGwUnCKlS4uzwI98zmvZR9krDCNF3JCI=;
	b=NXzFN34LjoFcpC1RkpbQlkGvR+epBpgqgdVT0WrflWTYbGcPhNeWX0Abtbww9wF/gyk/Kg
	GHpgoTrollxGszJ5AZDVKXU/UbZnlMlbCvKW0YmF/TR3IXRFTBQtxXNeHnp9QZrVI8WR5Q
	R+7RENT7WDGBLQTGnnoRRvc3jBE6cDTwn32nFD8TXXo1vzJrnsO/ThyOn8W+VdCE8ywDtA
	LYZkFQgilYrXqEVEckHL5TrwgemyU4VRob2YdfqKVFvF9beHd5Kiqnzp9eTTN1CsCpXxHk
	EhMEJwGL6f7yss4Y97hH9i6AulCLUT7qB1bJ8aLeM8ZcLGuZLdqCyBvjnzpWHA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mp-tqma8mpql: remove virtual 3.3V regulator
Date: Thu, 31 Jul 2025 11:16:53 +0200
Message-ID: <20250731091655.2453107-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
References: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_021713_948227_01F20CD6 
X-CRM114-Status: GOOD (  10.02  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

BUCK4 rail supplies the 3.3V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql.dtsi      | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index b48d5da147273..9716f24f7c6ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -16,15 +16,6 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
-	/* identical to buck4_reg, but should never change */
-	reg_vcc3v3: regulator-vcc3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VCC3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
 	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		compatible = "regulator-gpio";
 		pinctrl-names = "default";
@@ -187,14 +178,14 @@ at24c02: eeprom@53 {
 		read-only;
 		reg = <0x53>;
 		pagesize = <16>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 
 	m24c64: eeprom@57 {
 		compatible = "atmel,24c64";
 		reg = <0x57>;
 		pagesize = <32>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 };
 
@@ -211,7 +202,7 @@ &usdhc3 {
 	non-removable;
 	no-sd;
 	no-sdio;
-	vmmc-supply = <&reg_vcc3v3>;
+	vmmc-supply = <&buck4_reg>;
 	vqmmc-supply = <&buck5_reg>;
 	status = "okay";
 };
-- 
2.43.0


