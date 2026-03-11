Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5943112584F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQgim6yWE8jugbPfqHPbGso8EiolNoLvAlJ40f1fpWA=; b=Fqnqb6ZI5nKPOL2yNYRW0BUk6v
	/m/8jpYDjJWHVub9H4q3E+vFWoT5dnggF4mbPiqrhKePWDSYxg0tFlOLtlkGJe5QV0Zq/8XcA2WaG
	AIZT947I8M9FmbPZlgW0NJ0o9lrimVKp51VFPF5meojoXbL/oRXjq7Flf2gd/nMmXCbLitZzWburA
	jLVd4Nfc5MXceQl3Ikol0kpJ34BcGNuXOdK8VYr3rjg59DmwYDQPOjrht25T6w0MOmBezfcAnoqgN
	dkYaKfdU1xwHAv+8goHsJ7rzly0N2lXBeHmC2XytvCFeF9qcFGefu17Ik4Q2P/KCe6CVV0iknml2E
	EOlNnFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6w-0000000BsTW-1xF8;
	Wed, 11 Mar 2026 16:08:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6t-0000000BsQq-2tff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BF57oC614148
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQgim6yWE8jugbPfqHPbGso8EiolNoLvAlJ40f1fpWA=; b=mYimLgVqXOEVzRp1
	Uh794COu/nq31BACV0bOx8xETj3CsWBaVldFPnJ1ISCZFgiMnEGVE+A/GTIj/Cod
	EGx9r4kbl7WJG7ga+/rt/vpEop/j5ALYYUtCvzEPz0ASAmHPa34IGv7nlAzRBh0Y
	qkrbkeR1mct+/6aPk8oKy6vslBTSZigA3+etVIShpvUT3x6O1XYSOBeON/8Xwosh
	Vx3W4kaiyjaJ+45k2J5CUt6kl1e1gR6yDslVaxFUmS7y3GUeRJ20YCNyyXa9X58p
	5AEUIA41C6xvSNHa03ZvXbHpgOgsVBR+b2KgtoWk/6aLzgkujRdmh4lBEKGzPxp5
	XluyDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf2rc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0013d87bso511726d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245314; x=1773850114; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQgim6yWE8jugbPfqHPbGso8EiolNoLvAlJ40f1fpWA=;
        b=gUWwqqKv1fJVFb6rbJdIM3tY5InEBDlmIP4M1DdaqASaHhgcRdE/Uq1pZh8p2SDfsv
         rWfdSPU6vmu1p2CoxHMeboIX9qtxzwNKXQ0Ieqyh0zBnxqdgTM4gVBBpZDrcGyJ+mrvl
         yPn/9BtkLCHN/KMBrxsQGTTNIgrxMzCc2M3GJomhRGk+XwB1rbVQNfiXLS9e2udw/KL9
         KTbOXYcQP3j4WgcC0XkDfUjZfoVfBH6FaypUyWsRxdrBLgRxbwy4cCtMDJMaIK7X4zW3
         qXt0Cu+IVXf21JkHssEcOGEC3S5XrZOxjNFmuu4n2FvpQJ8swl2c4rpN+OxP3lNkXfbC
         Ygig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245314; x=1773850114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQgim6yWE8jugbPfqHPbGso8EiolNoLvAlJ40f1fpWA=;
        b=rocy7yKmK0B/gCRzcnTZqFI8UuoVutg9AcNLTz0vyb475qQxEiQycOg7bAIccOd5g1
         uWyWAfCsocpp99dfXpmRRm4qGQmaAIfLLIx03BxV608stcD0oioRyD5jj/bARyumFxsh
         eZyNIVmRoWPNJOEB6sDR4XJGrlWq/NKWHtroxsHLOFVJ/rf+h8QIB1HWLLt57aZVspy9
         B7hodoq+yr2f5rcE/asqw2hJ1YrlQEWCbdIS6khM5VINaRjDZ7Wr1ZusgvxHwMrVFDwx
         y7dHYiUNKcuUv+4OxJmeT5y4qZt+kteFTyesVAcTY9fkaVDEzmrDPuzEvm1ctz/YVHie
         +9qA==
X-Forwarded-Encrypted: i=1; AJvYcCWDNerKldRPaGsFfrc09qGMvDp7uXYDLmq99+Ck1jeKUnvAoMNqPEw3LkID3/nOy9LaiChE8XrsFBvTiW1OCxj4@lists.infradead.org
X-Gm-Message-State: AOJu0YxCS8hHcKFYJZt5lZ97HLcFrUuTsf1tFS1sdL4akJp0sYKGQJCy
	2lxO4qnsfeabovbLQ4j8LVzKTk6XDYou6PeEN8r9tAowuaiSK/yMdmlZQLJq99xaBQUfA4FcWdT
	i3zXeAffSGaTgoDRpHRmOorZzlq1DyN8qq+Qxt0qtKh+G/yeVHcNjrS9+Jls/4Dd4gJ5eqOXv55
	L0ww==
X-Gm-Gg: ATEYQzx6TvflrEhfTLf4M2DrF+r8nQrOd9px3qCtzDFvSFmZFmYBKBcvNJBjdFgfY2i
	zAY08WdsrZPiz5bcEF6nJg6y8YNQRlnERfaSPOsy+l3En0beqgBRiFQDeU/6FLWCIHmrx9rz/5S
	fRsQQOSn6/OmORImz80kD/LsbNpqxODmrnU+PdGUPE3feU9LS1mFomAbWzBmwC2tXw8Dkshl51V
	owJmZLS3va7Fw+Q9ql1NsIYi3lblEMmuJioX+pRQq7SrPmZaACbhxNOb3VJj6IBBhd6Q+u1RVrV
	q0qURb2Cv0mAaI6c9QQng57ADgrFxkLZ1exwb+LCJ0SG0ll1ZTvLbXlzlrA9D/9oaMcv010h/82
	z0Ap4iIytzp3aILXAMEtmabrue7HF+7wx/GugoI84Ubw1
X-Received: by 2002:a05:620a:31a5:b0:8c7:1b17:e8fb with SMTP id af79cd13be357-8cda1a87c40mr428197785a.49.1773245314119;
        Wed, 11 Mar 2026 09:08:34 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8c7:1b17:e8fb with SMTP id af79cd13be357-8cda1a87c40mr428192185a.49.1773245313590;
        Wed, 11 Mar 2026 09:08:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:03 +0100
Subject: [PATCH 07/12] arm64: dts: imx8: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLlqblad1f75c+77Eu7RwhDSX693PHnfY+OiiRU36k0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNkkCgi79yXjssmbqsDOBlmEM+iM+233kd5Y
 yIQ48IBXkSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTZAAKCRDBN2bmhouD
 1223D/0cBbQUE36jrFXET4DyV4UuMhIvtbdvtBvRPdhBwLlIkYLK7kteE4OCh0euFw6whFzu+67
 1vHW2F0uurogdT/HUtE9n6dt3NO7ll9oibFkdwpmxUE/7Nde/rARs4dyhHAUh8mTzQIQ2KQFO0x
 W3MlUay41GR35UpbIxAqhlPUhisFz70ohnI+FgIrhArYdsb4PO/lOKJfle9aea5P4flarhuWZ5W
 dVACrEfesRfQxbGyROForjNVRcMkh7+S/ZiygkrF+IlXnhQ11OD1Ip9rSzsRGyvROP0dM0fbKqM
 WdOxCNb3c/F3UKDuUstP6KiFdWGZmcMMSYtKqwCcossfD77++ijC8jtmeeOH5MLuliZtpWR5qyq
 CMIlXEM/PeqAwklTU+wiBZhPdlU41rHPXHvaU9oIU93jfS6z/5WjRFVJ6pG6joFSE+0TgQqMgtu
 d48pMsXm5DEnNFzaM6Gw1uqc1/FvLI4U6TpW87VLggBW9harxueKWyoMhV4FbdOnyWBiHFK6Yn4
 HDfq7PoB0pS0mUwJ7N/JNfT8Ymrobhao2BR3KS2Qx6yKAaf+DkT61OXQgEjVw2etkezHENus17q
 s1BZt7lDUxa2TC1GDefFEXpJmUrCd0v5bKdowiZ1RSHmugajogP8hcKCh63MY3YnEP8X8inAqLz
 5I6lbpO2aB7F5vA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Ic6n6jwqn14GIKNlQn2leY2vUK-BrOyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfXxUd9mpzmuAE4
 aFDWaqtI4GXL4+Dm1Z/pgdBIvDNUibVWgE0RPlahG00qzumFtCC5md+4Bi/B2CYsDpsK3KSlljs
 j6SV5MrgL8wkd3DfR1E/Y4X3JGhlP75v6PtW0L9NnSBwbQQep5M+OoJ0zF6x5VSB6EaTt2Vq/+I
 OwFT2sHi560Bu1Sc/s/YRW8L7gCFSRg1K3GGeLw2jkEwd7wTT033yvHRkbPGHjL/9bCxefIB2wc
 jalQp/5o8ibbV8EhTwZhJ7UUsh6y3d8+8S2a2rF5qkhtc8DzNwtoAWgD+Egz4xURmhFplA9HjLa
 kY4RxsdoJm+xBTO9MBlavKOEIBdC/GRFJhbGuvtDQiR9rz2xaiaumCRjHDD7TmXxRKTL038UxIk
 7+2grZj7tXyEyAJlixsCq9XvLZH9+iv6t1ApBFlR9zLk5/sserSRDrqdGEjFZx7ZAmU8VjhuZWC
 Qdb2jh4b0YTN+FUm+eA==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b19383 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=J5n0A9H0bXRu_Ym2jYcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Ic6n6jwqn14GIKNlQn2leY2vUK-BrOyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090835_736821_335D73DB 
X-CRM114-Status: GOOD (  14.52  )
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

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts       | 4 ++--
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6fc82b5eb58c..6d8a57ff56c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -806,7 +806,7 @@ &pciea {
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_switch>;
 };
 
@@ -816,7 +816,7 @@ &pcieb {
 	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
 	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5c68d33e19f2..bdd1dbc6b322 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -651,7 +651,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
 	status = "okay";
@@ -662,7 +662,7 @@ &pcie0_ep {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index bfc918f18d01..677a05b38391 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -407,7 +407,7 @@ &pcieb {
 	phy-names = "pcie-phy";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcieb>;
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 };
 
 &sai1 {

-- 
2.51.0


