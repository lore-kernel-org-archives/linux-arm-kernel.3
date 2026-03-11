Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E92F1125850
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCDmbAZx5fR0Oyd/mH7xT0WBu69Jhfu7+1RKrHRONVo=; b=dFxFs7RX/pSRFuz3BSPnmMht9T
	SpU+fwJ+M6V2Ugjdv3HImlEkLOGgRVXm6p9BObBLmV7u4VuA2haEkAPDveH3+vPFfQ00s+Mj3vd9g
	e84IUs+j6CHZT7Dn6uIRcHTDC08N3QvCpOTNzf7QZyOTfHXrrmteXF6vxwaiNr9l0tWDBlAw5Z9VF
	1jBeta008bss9PVLljvTkArFmPsqH6W6qzo5LWza5eUZF6t+BmEbunvezk/W/gO3ubIdhyuGIyNBc
	2u9sUOQRu4BI2siRlkUswZLm6uYblVtptR6mCp2EXKNVrzv5u6xY9TPztM28GXe+p+vAEedAGHKYv
	VAcV0Hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6i-0000000BsJn-3Vui;
	Wed, 11 Mar 2026 16:08:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6f-0000000BsJ4-4BwF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvBtc2622124
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCDmbAZx5fR0Oyd/mH7xT0WBu69Jhfu7+1RKrHRONVo=; b=ktwEc8LPImY8+HAV
	xng+4HQkaBvKlgA5ZhhjHcv6pXlox6laU6yRfFCtGWC+bR06dW+cNf4NjwZQFN52
	Gi9poDbJYJQ/Gqn07r83C2XkoodZ8zD1S93lk9VbhX6TBIgVc61wf7vhnMTyaC13
	Yk832f1AQ4zp48upEdySMhsdJX9XQl47a0P2bVHNcBHrP+RUAA8aCuJP4YbJn/8U
	+6++f0hRuhJUl/uP0T1jrGedUCSrP5n1i9uZ1TrqIFDqgmK5FzDSgqqtLIOb05SY
	wXHHxfFgoFs57AlnIluuNrwp+MXMfNkLGayBOoq+qIphPXn30eI13ExnCKA15Jdn
	8LY6Tg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h155j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffb9a0bf22so114736137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245300; x=1773850100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCDmbAZx5fR0Oyd/mH7xT0WBu69Jhfu7+1RKrHRONVo=;
        b=JVF6opamiKNFPOD1//S/Tleifjoe2i9oyF4zygillK9BJBVoKXjQLT6/3I27bC4ipm
         ANFmYHE4R+rTYx37GAJPUIGIWXyoGo3s8nDGqIMqmYJ3js1abPQVTfNZjzBdd98ZEIC6
         606Kw5UP5RM1s8DhoHlDio0MazJJ3xFtsAUawD97QbLNfM2F0hxgOUaIEbQesVXD752z
         ByR1NXo8l2Cq/MwcBVDikvccwR2+2x2dRN0+S8yndmfvDXXcenCdv3EeaxL3LtaCJySc
         rGXN0S7PXPP0RBdGvbUBQzdW0YBQ/sX0HVavLVR/4XW31VHeTfluyFfG7qsComT09Fxt
         yQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245300; x=1773850100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yCDmbAZx5fR0Oyd/mH7xT0WBu69Jhfu7+1RKrHRONVo=;
        b=mieHIPF59KZT7lqAyOhu3BJTwE0loDJEB7ohJuKPrI0aYA49De6ZJNCdELeUAq3LcU
         jrRHE5F3wVMCFsv6mfyqfrR++8Aw+TJbWGmD/9GjaWRJmJn1QcVjAlb1nd0r+xMXlR/X
         Va/vnJqMcTnC0WaGO/weih5p0zZMgOtpcQ+38Y6AQyXc4xLVPm12yrUfnntYHD/p60l1
         0s1zbtbT7z9ye3LepSxqtipZb4361Lif7eETGqEff8nPpA9K/aV8Vzfe82ZyfBKtRrY8
         Pric+Y1H6/xbXDiIkbQZl182oPnKldpZLb0/ZgnSrEGdg/aBa1ZuqdT6kPrqrTR6PixJ
         5/8w==
X-Forwarded-Encrypted: i=1; AJvYcCUuhRtRs0XOTpFyHyy6STVrdiycUNfa6DBNCs1SRVZI0C5AcTGdvXG2wpdPIJM56AJX6HWKqwj5zzwoxsRR3ZrD@lists.infradead.org
X-Gm-Message-State: AOJu0YwhWbsEqjMtyqMNSm+NYIgWSPLJcEijAWrQbGeY1wrTrDuZDkwn
	W0ls4z6bpYAI2KDVDGdUT4S6uEGXxX9vKduxY5K2oZ3RCkmYCybLWLYrJnOUsP1p0V6X2hiUFUY
	4MJYj1IKn2vA4nUE7U62+psMUHIrW/ZYxXfvQRENgG8s+K7TN2OD0XUnfJ1DjYVARWxI0b/ggQq
	op+Q==
X-Gm-Gg: ATEYQzytoCMXrrwauEfwhUNBn3bsvo1krp8qB7piruP/977Yve+U9YOu6I9HJKOYCHw
	smHGEAf76L29BD5/eW0xMGRImessT59LuzY6c8YJ8J1wvdGYA4KCoADRmS+Gs7195pV1TtySEoH
	5NHaWm3+mh99yZljX9tutR5COHoGNv1N19sWmgXTbIUIgs7hW/B8Q6oX+9XFC91I1heCrHiSWb7
	0DEuxbDt1BteRZR1bzEgpAQdnqB44b7xjRshbE3soLpcedChTf1kfXA50M8UKh5O4hZ6PTctt7E
	bMJJT5KwL3dj2Eboaa8N1bi9G4yfcicfXG5RbAfBk2FeaAj3U9bvCp/YCv86yd1qfMxR8I/Kpwn
	Q+gnO428lujRGOiEU15EWgrA7xrHvnaSSugKLlgrV/1wg
X-Received: by 2002:a05:6102:c0a:b0:600:39ed:f113 with SMTP id ada2fe7eead31-601df056388mr1247471137.40.1773245300441;
        Wed, 11 Mar 2026 09:08:20 -0700 (PDT)
X-Received: by 2002:a05:6102:c0a:b0:600:39ed:f113 with SMTP id ada2fe7eead31-601df056388mr1247451137.40.1773245300001;
        Wed, 11 Mar 2026 09:08:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:07:58 +0100
Subject: [PATCH 02/12] ARM: dts: imx6q: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-2-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5737;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JwRzNt4B6EnGT7UaefAGI7rGsOlsfOONVNQNtf8/iIY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNgXbB0rc0LAl1KHwoXaPRCd9wa59WNWaNHo
 QouztkHfiSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYAAKCRDBN2bmhouD
 18n8D/4lnfhN0WnY9brTWfS7Qsf92DAXRokN0KBw3Wm1t/rPCiNgG/F+a1mb1WLopZZwORD2Pz9
 D9rBQ9fqNATVwP3H8PM9GGpt/aC29+q36p4rjiK1FBy3CqWejFAy/drest8yHocr9q5BmZzQkkz
 VXppN3lycPEpyG1QT4DBIR6QET8KL8+kHEpi/1LjhWPirSrZZbUnWAiB0c+ltR1ZjvZD538wFGo
 J6n8EZhoM2W2m7fTkz64AJYZkJTavIIPusTEHLfNt3UzFOMNP1ert4aeJkBL7k04OQnRSS6LKeX
 mKW+/t5sxX6oQeRb68VrtYcGNwhHRAw+KJJiwrQNAAlbtD8/j9nmVvyf3VJ5bxwL+0B18BC4x2t
 oM/of7qpT371mvTZYEMWgd8NxvIy5v3o4+AFcsdtrK8qYDqZ/UvnJ57bwDzjkiqoC6U1NVKh+xR
 DdNPekiKxCm07kJgQmT+BfutuIK4y5TMy1rOUt8i/n/vdWw6Jc9tPhqSlBYl2zmxULXv2pX7NLf
 40I8MwifTnUwcotDQUxH2g512FVShd2QkL5IJMyS5vJwPRnRA4ith3XMXtfcwqnNKc+Ko3fsaJ8
 n1/j7s+Wh4byOl+a11ccRciK28uJ0dgVwTTGhtw+gjTmHC+7lDYqHyvVfj98q6ChQ+8fpQVDwVW
 0PA5EEYkyCbx3nQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: VPac-pa1H3e1aB7fUJjFJ7L-zfsUJxdS
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b19375 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ABxXHdBjjovioIR3KOcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: VPac-pa1H3e1aB7fUJjFJ7L-zfsUJxdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX/ZFnwzh2j0Yv
 d8WiA9Tenx125sR+nmXSPNCrxLF7busf7EyaAGdbgxInQzCSmRY+sxHkoE6X6KuoOUsdAi9UGSR
 Ufgbf2Xhzu05xq+G60O5f/w1bjO5wChVKJSYCo5XnomESDXfyZGxnJ72Wh+PjoYsnD9C/7sXbfT
 RvQ8eBXLfoD9qvrsUFbHdkSVteFrjAxHjwAcol15m1yg/ZTM5u/klpou8gvSkM15ITYhAm8qZuc
 g7Bv+fi4pqAJIlVm51SN7b3FbmhIzrR6B33EJIqokaQRemCXCZN38IIZsDHvg5x563REt4yCVUd
 loD7OjLknXq/dDrJ5VKQJorvtj2XxwaKGyA704mvoI1X3i8Tu25m1ljjnOnj0iB+m9mi1/ykBho
 pfaNJISat2pFj21YCx8GmASkWqlvQHwmx6pbml4fGcrUZ1WDFqYrOxrGVIao/nS8QdDaDydIsz9
 MXRz4oqYpEuOz/5tvfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090822_052674_0860BA09 
X-CRM114-Status: GOOD (  14.84  )
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
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi             | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts           | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
index b6c45ad3f430..a1b1348e1070 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
@@ -55,7 +55,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a4501620..8eff41bb32b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -146,7 +146,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be435277..64285501e086 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -93,7 +93,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
index 02d66523668d..7de8cf7804d1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
@@ -344,7 +344,7 @@ rtc@32 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	fsl,tx-swing-full = <103>;
 	fsl,tx-swing-low = <103>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
index 13245af8f74d..ff6c16b9a1dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -468,7 +468,7 @@ MX6QDL_PAD_SD1_DAT3__SD1_DATA3	0x17071
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 26 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_power_on_gpio>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
index cbe580dec182..5a3783d8f15c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
@@ -425,7 +425,7 @@ MX6QDL_PAD_SD4_DAT7__SD4_DATA7		0x17059
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 8 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
index bf8fde9cb38d..e9a4b9f8015a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
@@ -330,7 +330,7 @@ &ldb {
 };
 
 &pcie {
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index 24fc3ff1c70c..0cd0443b9df5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -459,7 +459,7 @@ lvds-channel@0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_novena>;
-	reset-gpio = <&gpio3 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts b/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
index 3bd0e2c9e57a..fbd1dc6f6414 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
@@ -174,7 +174,7 @@ rtc: rtc@68 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0


