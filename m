Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA78C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 00:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RGLSHOixg+9K49QmcrmGAtJTwJQ8BvkUSf74DteswI=; b=wUBiAJppO0fQoym72G/isP3F9A
	yt6wLxg5VY1ctJf6aL20zWSt10DzpWeIzp33VFGT2sS4ixvMma/M3l22pv5lmGID0XLAO6ZpvYPv1
	eOm57G10LjcoavUlIPkpLntZuq4vYaswfpiCHaTnqE7WQyovlwrtZ2SrgJ3GWx2WwLJ6COuQZEupP
	PT/1xF5vBh/7NQKYti8xItcuCwEk/I55LxrqYaVL26JMSEk8ftoeJQpslmJXN0oK6bOMQeRReid2a
	5CYWFR7PjfsD9pfC1BxlS0VYH0Eaobv/9AlXmPeK6q4SXpaxBh+kNMk2EqyQZbspODDiM5Br06iBG
	WctivKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dtP-00000003UnQ-1sEj;
	Sat, 05 Sep 2026 00:04:23 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dtM-00000003Umq-2An6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 00:04:21 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-90cd96389efso21329846d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566659; x=1789171459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RGLSHOixg+9K49QmcrmGAtJTwJQ8BvkUSf74DteswI=;
        b=My9TIUJISPqXKWCulAHnPl878B3v0/wQt1hL9nmhcgPFxqQYl3uNJjNAlAGB3XTJZk
         Y+iBpXPHOZkkcrojM3Dzv9TUdC6f+QNqR8WEmAhGjY6oieFd2+k06Ehd+p63xe3TVGEt
         BsFeAm+QCKsvUAnD1WhdAMzCiioBJSaqxMCKCYEKTYOge4oJqGMlQHexx5n+8pQMW2Q+
         2qRX26KqYOgxwcY/qyJnt417ly+IzVxCkDlwYI1Aw+lDkGMEb5F/GTt1QztvHir5eKrM
         rPxnoBg/44deGb5egDyWUL0PgIUuAI/frR9Op8eIzJqLN7D4OBI9swZBK0cD/WchMb0u
         16IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566659; x=1789171459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RGLSHOixg+9K49QmcrmGAtJTwJQ8BvkUSf74DteswI=;
        b=DWwMIWoeLo0ItivABle//xUPxNv3CgCsAWuePGIdPfXhXUWaINeBH5SBvWGM6tLYJX
         +jtLTB+dLRzLudG7P80A9PgzmFnjQxQ2FhtoUTGGMg5tQPaN4vSPsPEkkNxi9i4lLQkK
         EseEAUt04caE/fOnN64j59e9EKP4ABmlDHFlS4baCSrtSpzaEZ4o0C1sOy6ZzsPgtSLo
         wE0MSPWbCio9WweNfEY4rj87EkReSrw8uTLUCSImqXKCRFCNeooy9SOQhZ2IDko0qIrk
         HSd8O70OTlTuPmrxSdjPZG7HgmT08CWu9Sh5VC5JXLwkTESE7u7imDDKNkg4ZpZrnbel
         R4GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhS2LuT03tD8Z++W745Jjgq3lcdTAZh9UYStPNbufp9GfIbYtFvmMISYB89BYYTbZAcq/pRM01kYDRmSoRTRPM@lists.infradead.org
X-Gm-Message-State: AFuF++k7MopmOp+2WCDMBs7nPmxGAzYjLooP9yg6JAGBiGZcIl/1a4e/
	es6pbUA0qQ7weG2uCXe9XfXAJ9+Q0FX8W5lpgXD1stig/gZwJweBTbZ9
X-Gm-Gg: AYBFou312Fe6PfL1Tbnu3V8AkoOmUkn1QALegEWnLf+TKb9222sQPk7Fk6eA40gyESG
	24ctTlo8nVzl0uiBFb4L/8oeMtDul0UZuX7uzSFxrsVh0OwikyM7byKz1rniD+eQZP3TQEMQTgd
	nII5gTOPINzVmnkcCkGL9OThCI7dX3bGCVrBvex2/b2fZ8pJ7/nYP/Qnhecfq+e8NBrKHI8XiqC
	lc3r9dfQ10JTWILPsERoEpenmdcszJg3g1IVQQIEh9pRPfy+1el15Yfykm2aC+KYs6jW4tY9IF3
	KspbdWB3bS/nxPJMbDMnNCMF34PS8vDHwXervk/iQS/cyiiTnG5Kpm1XJUfBpPTQvaK0HC2c6vU
	QOvVI+gd8B3Qta+BCkH6e+rzLDmsMA9Ml8eCEvlS9zDC/SAVPTnFEJu/KZ5a+4C6S0lD2Ph2Rid
	iZ2SunDs3ZJ24qNeACLztPdjbAd5LFGQA6byBbWFsGS26dCIanhkpiBwvbXspp+qb8FKedl8U3g
	oAbGTJC5n61oYiU/ldoMWO1rbPqaDglQ6guBW9FFnkVyOvY5qwRdlavwtbcODAWQ552lFPcik5B
	nyxsbGo8uZZtdXjkqPKOtVdB3pkBBMvGdVgzTA==
X-Received: by 2002:a05:6214:5990:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-9103ef729camr138630826d6.8.1788566659120;
        Fri, 04 Sep 2026 17:04:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664be1sm32861156d6.18.2026.09.04.17.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:04:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Fri,  4 Sep 2026 17:04:15 -0700
Message-ID: <20260905000415.153682-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_170420_563907_97DCF8B9 
X-CRM114-Status: GOOD (  15.09  )
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

The PCA9655s on the ClearFog and Helios4 boards are
register-compatible with the pca9555, and the gpio-pca953x driver has
matched "onnn,pca9655" in its OF match table since
commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655").  OF matching is tried before the legacy I2C ID-table
matching that the old comment alluded to, so the restriction no longer
applies.  List the real part and drop the stale comment.

The I2C client is now named "pca9655" instead of "pca9555", but the
expander is otherwise identical.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
index 6321425eb9c6..34f63b6fbc74 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
@@ -92,12 +92,7 @@ &i2c0 {
 	 * 15-SFP_MOD_DEF0
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655", "nxp,pca9555";
-		 * but you can't do this because of the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index c1c1b16392ef..562fa2e34da1 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -195,14 +195,7 @@ &i2c0 {
 	 *  6-USB3 power
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655",
-		 *	 "nxp,pca9555";
-		 * but you can't do this because of
-		 * the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
-- 
2.55.0


