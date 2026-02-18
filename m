Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ED6E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+Tm8R4GAdM0m4OtqwBsV1ejjLiRRji4g58Lasi7wdg=; b=tVvCk5PpvmyGGahvk9sbFVx8kJ
	nNCqnFVyaIA3FObrrbkEqtPEXCizTwrZ3685ZafK0bKE1yfuZgBwtD1DLiDjNKfuaxuXnlOUv23ZR
	nPgC9I1BZy3oz0lcbwNbC+u7W9VN9cik/OEw2sEQZOUewoQ5ZvfoAp5dPefWS4q0tULghEd1KbvmS
	NL9zHMBz7TL8G+TIwUc8YmHyXUAx9a9gyTZEq1H3jeexFWm7SOx5LUr/QpCKRIkFJDA3fk9ZX2hDx
	Ub25HV5ygajAL42LN8UwQSm/A8BdjUnwwFOO8C06TCHMSjAFBYn0OH7PlKBh4ZRplVwFhXH+9jvyb
	kHpzbt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi1A-00000009v11-2Ozr;
	Wed, 18 Feb 2026 13:55:04 +0000
Received: from mx-relay68-hz1.antispameurope.com ([94.100.133.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi12-00000009ux4-2ZdP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:55:00 +0000
ARC-Authentication-Results: i=1; mx-gate68-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=q+Tm8R4GAdM0m4OtqwBsV1ejjLiRRji4g58Lasi7wdg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422886;
 b=CEMs4+WCx6tTkFN+qGRHINrl4jUeCtkUG88mljkOnNpSXhh9tm03IKDJTppi2/tDk9dS6RPE
 Z1Z4qqD5NrzJYYciMgGRXkw+cnFE4D2NdvQvlFrcCb4fzNFtzMr9GYaxid6rawrHAmJa7PAIkqU
 hPF6rwX7L1Ezw1Ql8UVDfLqdpj3aSp1NM47Ii5Fv4iaWjuEoxFwbl2qqUrg1J2jMxEIr9PnthBK
 ATaNx94Wfb4O5o88GodI6Qi1Lek9x6Ib3moXR9kQVVzUIrkzYocrl2BicFpqyQL5j/AgcxBOeHY
 QTJLR6NZc4kLwZqG8FniXuZwzz1MBYpfCf562PYcitUYA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422886;
 b=SgorlKXBfuhZmPksF+TpW21MxZ0DyvUh7QPN9s3TNlmwUJpOKxA4zhrR2SHzO4Z3pEIoniRT
 X5U8N32TOV5kGydNEeTOSqmOQDlIUm6YcPJ0sSJv9RCqFZ4TNJ/sZnxPugSEcKBKxO5Bxu2nXS6
 HtAQmt5+A0bB1qu/Vq55yipxcu0ZuytmFllMPWP+IICKO+tdupyjx0QKKCm3HHR/2QzvDTi3aWG
 FhJmhq6uw/YYV/PYWlkgazllDYfdhdo0QlGbCoUNCeb1LGMA8WOquf75+j22j8QPNUSfybiMnhP
 HI4djdqdTV8TbYvdw+wJMRIpbyiM4VWdlSCPOSJpU+6Lw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay68-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:54:46 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9E361220BD7;
	Wed, 18 Feb 2026 14:54:28 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: imx7-mba7: disable boot_cfg pins after boot
Date: Wed, 18 Feb 2026 14:54:14 +0100
Message-ID: <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay68-hz1.antispameurope.com with 4fGJ0P1wlLz32CNC
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ce6b24e2a0fcff62cc441489d1e1fb3f
X-cloud-security: scantime:2.173
DKIM-Signature: a=rsa-sha256;
 bh=q+Tm8R4GAdM0m4OtqwBsV1ejjLiRRji4g58Lasi7wdg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422886; v=1;
 b=iHEjZuO+vjC/YGAncYkGbY5BItr+K5h9kXB5Ac1tZspcP/fuA/RG+03SmY1pfCHjtn2CtxJa
 4DOup7y79tPo5h3vkXnAXwXxdq3VULXx9t5kVB8Q1nLCvqaxWchBU7jja4NAZXyOcKqkz2dIvLq
 QuD2JJLlfGTT4KfR+gopWaYNRNlbTmbn6DHilasehHeAk+5SiOqEdVgLXemdlv0VjLaLSbqIKnH
 tbEgAbLeQBVD4FyhPBjDKufjfv3+2NhHTgYOeenrIRYhHC5dT9ZcC52B04EWdlNVierp7u2b1Ge
 fM6KmAkLX0mEnUtx093Y3KYuORq7OFKYf77Um4OaIpynQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_055456_785335_1D4BCE39 
X-CRM114-Status: GOOD (  10.98  )
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

The BOOT_CFG pins are located on the LCD bus on our starterkit.
Disable them after boot to separate those signals.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 03f2f2cbdfbc..4192adb27223 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -287,6 +287,15 @@ &flexcan2 {
 	status = "okay";
 };
 
+&gpio4 {
+	/* Deassert BOOT_EN after boot to separate BOOT_CFG circuits from LCD signals */
+	boot-en-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+};
+
 &i2c1 {
 	lm75: temperature-sensor@49 {
 		compatible = "national,lm75a";
-- 
2.43.0


