Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D279D39413
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjwHf/y9TmPHoA5PmDsnJWIwaDDDm6wVm3D9G4XLFnQ=; b=PY7h3HXMrXu2BF0KaJbLxPBxZs
	h57f+MVYPLya1wTT7vmylmMfH6dZ0dJB08gNaKxStHn5Fjx6OtcnNLmIfgzffwY+joO8cR4GcVOxb
	I34w6kTde1nVePKievgQWpLfCjUD7KcCGjwpn6u9rJrZtlPJOJnl2CRsXqTPhfv+vUdchTiBv9kzf
	XF5Fszecagp/WbPb9BNzC0D6gGdoNHNWmfubEdai0NiowGzdiRwLb2rRrug4544pLEIWilPf7iAMK
	ISoHt9d2Aoo+qA7zj+nyj2YVPlp65nrnjqIFSjIgVebd7wA8RZ0L1BSzFU6F6ghlQhSYJDfCDGlTx
	lJqTI7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjY-0000000HSkx-2PIr;
	Thu, 02 Apr 2026 10:57:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjV-0000000HSfX-1mMB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OjwHf/y9TmPHoA5PmDsnJWIwaDDDm6wVm3D9G4XLFnQ=; b=ZodZYgvoZhYkh9fu6hxcLS/0rH
	+Ve4cC1x5fL2Lt95SIc/e4zdpBE+uaWlEDvgQ8uHaXvYiC2mb0Dgy8qWuYW5+5IAWXKVr5j2lPaJu
	xaTCJY7Zc9APEVwOS2jv8bKm1XGUchazEzqIWAWeLPc5zIw3wJme2Nz879bFi2N9kJaChSHm5G6eR
	M2Nfo0rhDCwrCy+yfzqRdIxsczhTrZl1HAC/624CqKsuyhJbAeq4nmlVbfSGQ+2q+mNl14PrcwjCr
	RAvhcXO/CHcvM3EdSKk703m2rcw6TxLpppulR7bg3e/8n46S3sKfk29l+nmZMCgBOTGyJIghjCY9B
	Nl80PUhg==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjQ-0000000CADm-2oVk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OjwHf/y9TmPHoA5PmDsnJWIwaDDDm6wVm3D9G4XLFnQ=; b=aafphOAjR85bdn7ZYAHE+UM1Te
	T82a5jNN+f/j2eEbCQpQvmPuJBXMVVHWcGu0k3y8dewYnoeC5EJvFIuOku4gdV5Xpjuc16Kl+iKO2
	i+3BitC2Q4yCJPs4JMRE/vbWyXEiAFjhcWkfonrKo0dQw6boYmIkNg6B7UUYZDMCUdjA7vHec0lVp
	eVIXJdK4HEFQCB4nQj0rrYmVJdpF+0UDKhwg6hAkwLxXl5VbYJM2dKQxlC5b2h8fsJwdLWVNPVWim
	DUfowmbt24WEeMGGoilm1TyiyJ1QhN74L2il9CHDOOA4f8ipfgUZvhcKMYlTZszwa8W6G7DVgvcEe
	+2SAis1Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-4955;
	Thu, 02 Apr 2026 12:56:14 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 5/5] arm64: dts: freescale: imx93-phyboard-segin: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:13 +0200
Message-ID: <20260402105613.1303871-5-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402105613.1303871-1-florijan.plohl@norik.com>
References: <20260402105613.1303871-1-florijan.plohl@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_115701_061587_EF9A80AD 
X-CRM114-Status: UNSURE (   4.71  )
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

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyBOARD-Segin-i.MX93.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../dts/freescale/imx93-phyboard-segin.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index a982606de1ee..4e4356397ba0 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -145,6 +145,24 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED", "I2C1_SCL", "I2C1_SDA";
+};
+
+&gpio3 {
+	gpio-line-names = "SD1_nCD", "", "", "", "",
+			  "", "", "SD1_nRESET";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "CAN_EN", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "RTC_nINT", "PMIC_IRQ_B";
+};
+
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
-- 
2.43.0


