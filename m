Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ECAC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7ANb8OPjIVJHlipscVgoMQ4zuRZUD8dC1mUN1Ymtt0=; b=dsu6rMOh5lin+HGEQYK37Ph523
	l1u3AcYiWY8oEfohvvz+PLqaB90/s0Ym4we63rZdAAGbUMOwAKpp5TdTSfh42Yhh0cgaAEsqkmNIt
	o+s5Anwrv4ibOuUWPNcph6uL5Hy+PwrqgBj+w9Edep5rVflxAoHeFbxUwXBjwmW+Q6iMHbi/YP1w9
	D83Wlx7GKLSLSZBdEAhUkE2hZSVe7I/HHc+vUjokCgVi+vsvEBYOeK8csktBWMJy6IJ2hex3mm+hx
	op7PTgfITLV9ccdtjyMOXGnY9ff11Nz+/EmxO9DYyZD9SyZuGozgkEvfcyD/uiqHwWF7hCcBHoFAc
	ZKu4jr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGH-00000009BdS-3Dmf;
	Tue, 08 Sep 2026 13:53:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGC-00000009Bb0-1106
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=M7ANb8OPjIVJHlipscVgoMQ4zuRZUD8dC1mUN1Ymtt0=; b=f42yP7NFLaS5KwNEbkEwNzW7YF
	oj2+8HzyPea8V9I8aHxLdapz2Sm155gbumtCsZMcki9hdrfzjMSHjsugLyG43JAkcgFljpUKZ7Hdr
	2JHUo9Jz7I9zrGRmq2p1a7cydlAwr8VbuuteWw5nWj51Q3ZWScoe+3joCk/AAsIlq1clGGqSnVFhe
	2wF9JkpJLzmiyo5uMYjRlX2gCSV/Be/JDvYIfD7tbdP8PpCu/xSXxJr2gbZY3NQBunvZuHBfq9tu+
	7SMgiFYdd83CDR1rVRiCb6g8bQCyURflXMAR5nE6hDBdlXwVXYG0QdnfJCjDxVPWx2ZLd4y5aAWEd
	B1eZekkw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wG7-0000000HUeK-3wab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:15 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ANb8OPjIVJHlipscVgoMQ4zuRZUD8dC1mUN1Ymtt0=;
	b=IaaGJijRZ8HWvwmpTNPvJ3RXY1lWbsNbeAtzeoO8UMBcsiq9UgpTUTiY8TFvAOBVDxIo2t
	WKT39/lsq7ZC1nuCxCr5y9XXTzqvxoh1HrzhIee8CO7yeg8SOkahuyU2mexDuVbdbZOjx0
	JRbUS8KAlUDzGnC4XtpS9dIGdHkGx5hBw+F0ya867cn4+9G4dc75WLVcptSrwYwTuGZa6d
	EPQpl1VyW5atvEhQA7mPN3BJKHteNbVAFNfu6VmfbRRrSpv35mQ1TIndmuRVKyKqtOgEFX
	MA23by46eTRgXkcCxEBaEqRt8cgeWU1nvxI2HmYiqYTfGg2z+1LffiFqlPiq/A==
Date: Tue, 08 Sep 2026 15:51:49 +0200
Subject: [PATCH 2/9] ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-2-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=+pyws9R7YxcGiBu21aWCHnox53fIOKOKZJHrE50fyaA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsJO48J8PvrX9Khu7D9scj4rewfM8XORf3sLZf47au
 3g4P33fUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJFzPxkZVr102L7s9Y8yr4ml
 1c+TLNd2XFHpjzh/4MaHXE/TWweL5jH8d67T+PE2Zlovf0VUk9NmfYXzAaceHDmlH5UZ8bdxsoQ
 eEwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145312_247617_9B6D7AD4 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Describe the GPIOs and their purpose using labels.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index a71669bef7d4..65c5f4450c36 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -132,6 +132,22 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "", "ADC_REF", "AIN1",
+			  "", "", "ENET2_MDIO", "ENET2_MDC",
+			  "AIN2", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "SD1_CD",
+			  "", "", "", "",
+			  "CAN_ADR0", "CAN_ADR1", "CAN_ADR2", "CAN_ADR3",
+			  "", "", "LED_H14";
+};
+
+&gpio5 {
+	gpio-line-names = "DIN2", "DOUT2", "LED_H16",
+			  "LED_H15", "DIN1", "DOUT1";
+};
+
 &i2c1 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";

-- 
2.55.0


