Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197D5112584F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNQFmnJFRgG+YdNb9/+Q8Of8vcXnleS1G05qCl47NCA=; b=MT4FZoSCsZpK9pA+JADB2/XveQ
	jj/mn/mnSnbqJ3Qtoyzk+XaiOsiwnScTTP6OwPdbhkbBDG5myA6JUJ8FPiSFl531Dz6V0ybuRiIQs
	DPGneQ6Bu6uNSVfzcnzge5L6c4kQBHsry4uh2RdvOJQcPXIc47HFWeJQ5GK/NMhc8c5mv0Ms2wdB6
	obfESDOAWk2vu44SvPX9mE1r8m22QQEcAC7BW9UVmcxxDolnc9ek6iyvm5DoftzdCcdmfIqOtGWZE
	grp2mREKZLB/qMbhQtWtE++EV62D7QtjHmA8evuDGlx4nhTodaoGYclFg5eEXh//37Ur7kIEmSe74
	l0X5x8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M7D-0000000Bslr-0eMa;
	Wed, 11 Mar 2026 16:08:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M78-0000000Bsgd-0HEB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvBtj2622124
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNQFmnJFRgG+YdNb9/+Q8Of8vcXnleS1G05qCl47NCA=; b=hZ8zG5ceXl/VVh1G
	CPUNXJlBhqcIt7J+7T01WUK9O5eMatmYIZxdkWzdt0ZLnaHf5J221JkVS5FbWb9v
	PmbKzQA5/6aXpFXxaKQMlN7c61Pg0hMocaWo8QPM3gwtZYcreVnEdoDKSSp9fP7B
	5eZMGRjY1hAgCE3KxK0cwV7wJn/Scb5iv6v6GA2Cfs6eaBzdMjF3suT7XId4BlZW
	91UeK6cdL0O8thgwfSvJ6K3Sm2z4eb4prtJNuw0tSlU+EJn6n/uKi5n9aVIjiAV5
	JWFfnkmHT9XqDkIwwEew+xZQm1YcuPmSq6MOwSRAvA03s595nwgTwzOlLw/V6WpN
	ckaGtw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h157t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899ef673d82so188666d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245326; x=1773850126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNQFmnJFRgG+YdNb9/+Q8Of8vcXnleS1G05qCl47NCA=;
        b=bKuCNpYr/GWhoOuETfbLDW9oKB3KzXexsCPyjIQ5eMCqz7TQyLPb3RbdGcAtOIhXMn
         Sd3cM7aR2EdDyavhDKRIPVeq5Az7JQEq2ip+DSe4fPtcPNwwnv1EvkPxeRawDskhE9DV
         oPl0mUoK446KjcTcqujzIypezgToVyaI2U8WsmbNWH56UzM4Vx05yhaMZFpsj06D32iE
         vCpkrg18xo/YfjFiJjYbsWwz/CH97IhKcWG0D8W7Tl3jqbtgjIMHzA6lrQhLSARyMThX
         g5SOohItO44GQ6iObaZErvQ+CnNe2aDj9EDEhnzX+8pK7//qKwVhnujAQ7JIl0A3rC/i
         RDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245326; x=1773850126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNQFmnJFRgG+YdNb9/+Q8Of8vcXnleS1G05qCl47NCA=;
        b=UvsUQWkmUYh+Y8q+4h3tGGtW3sy/S11delXh2gsss807Ak42kc/innJidRBWlONl9i
         BDIfmxXWniqyqMYy5AQ/to+cXM2VurR/N7V4BTiJ0ygHkfrk5GXnM7LmzWSvPXrQ2Hr6
         J44seDkiWdzeSjGFAnXvwmEX0sEMZDyuJhufchHtHMOFHFp6JWtHEb6putfPNhANCJ6o
         0oe5w953sRwIDSf80Ws86J9hOW5UGXpyXhRccwwxf08XtQ4WkR6FupXUOLUwRcHrhgQ3
         F4ekMUqVErp4P2xz+I1+zGFDuvMwT76a979lm/7VtDnkeeuO8t8g/Zpud0yuSGaKgtCM
         YGGA==
X-Forwarded-Encrypted: i=1; AJvYcCU1RL7XNMSO5Ib7QnlkcvGbCiPA2rupcaRBkhsjUJo1Q6KJu2qI3UBtltoHbpBEe0tBtNv9oYeq3Xb7fYVO8udM@lists.infradead.org
X-Gm-Message-State: AOJu0YzUilG+2EfsMKOmSpKYfdVoMayFDm66M2jnNb1vYoQ34VIy7oSr
	Ozx06lnAhaGBkXdANTQnaDDmFYy+WSzCn6f+YYB3vbVZs3867tyd72LdSChVYTmyytjjtYZvTMJ
	5WKkPl41+2D4VHR7isy0l6a5R5CTI5EtrWskkhi84L27H3pVFTfi72CGY1AGZZXlekvnre2AcLh
	H/NQ==
X-Gm-Gg: ATEYQzw6zzVckJk6NpFjCcXDPKCfYaCBqpmScAcIt5hVla+/lPWPDLvrO3eapjhQLWc
	qoJq7yj4qXr7BFHs/zSRGc5X8dXJini67cACH1dVpBiuEUKf5+1zKH377JcWB5Z5km+yP6cvgSO
	ib2yGpekI35TK74BmscbQAqPXxB8Xyn2e4YJkldp94zWCrCo5N15llw3rp5v8JgAInJj9XuKK8D
	vz5bC00QgQ2b47qYLt34ZrFNrd5IMfWpif61isEPOdYWNLw+vm78T81AiJoNhKOlPl35P3rK3o0
	M4XhwRzMEeFzqr4emtSIC6DlzQD5eq8zq3cYic1RihYA/Yb9jE3edsFKZjppekdkHqc1QOpBGfZ
	2WVQzhLitSm63sNRT4u1gs9PGUBZub5K58BWbgdXF1BT+
X-Received: by 2002:a05:620a:6cc5:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cda1a7ceb0mr372428685a.72.1773245325599;
        Wed, 11 Mar 2026 09:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cda1a7ceb0mr372420485a.72.1773245324790;
        Wed, 11 Mar 2026 09:08:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:08 +0100
Subject: [PATCH 12/12] arm64: dts: imx95: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-12-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6vE0pftOAilYpmSPT9TJLYPIm07vk2MdgJnwhU6W/RE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNptbaqelLdHazTMlTA+tfAvDcbeiYdkVhlp
 PL0hIgCCH6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTaQAKCRDBN2bmhouD
 15B4D/4/yILQphVlInojP5P99PiGVOzSDHrGO4wXjrY0vQFr3DDNLAvMlZbUpqA2urIVhFA2oOR
 8WJjQND30mywAvxXsBEqVaGwPoYECIJAUY//BRxrT+HnppN/P4NxBL1Xe1EaCMCn+mJF9oI2ra2
 WFYOrwY99EIjoVB6gjlQLhWAAIDyGYBmA7commxD/ei/0AVrGUfPGtGHrPCfJHz7JVMwZ9nfaXt
 D3QO7QiJMss+zTLPpqo2fqe94NyxtYx2vWBELs6aUHPuY5Kqov6YoB0Fzyonl5ak1J9CPnNBdmE
 2iBy52gAmAmCw8IzF/6nA18nrMEOQSfRGAzpusX/XwLHHnrwbKzpfUcWM89F7R7ApX+q0+BVqpf
 6VvgpkmgkbiNnWKEtlPt2mEU4xosd06o7PWc6fTBqmm8ExBKHqb9LAfmNkTtLOmu3P/6HhHAjcZ
 rFs9lrhLvO9nLWPovrZz8RtXiPuKyOgTesUg9uALtKjx5MtDtXjGOCl3pSt+HDfdOWOOFqRSwuT
 qlLKRlbn6bnolVEhmWxCzmm0zQrXN+R7WGFa3ubnEv7EU7/rPafRyFzXmuEpY0mTEBHQvhpzG9k
 XvPybV+47lv1qODyvogFVgMl2f4bnArvoFyKErSNJBSeuF6LEUyhzLdKNaXKgDUDTv3moQF2b45
 onkIvvVH8Oj/sbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: K2DzgP962uVqUZyKwuYPnzqSymjfBqOw
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b19391 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jGA75YajJU-kK98SflYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: K2DzgP962uVqUZyKwuYPnzqSymjfBqOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX3YliBkLJOwpt
 B2hphRT6mquqSRKIlAyku6oHZNQi9Q7YNl7mVoBs8AQbBK2DnICALVra2chz2hF5dHcxr7jtwYF
 D4I/CC+tXpwRp5C0LfLGloqJFa3p1TKaj7sKgY3SaiztBwALIhHsY9nfDKHSyAUlchVesZoZ15r
 2W86Kj/rfYxvgNLIGOJ50pdTMD6OsUUGwemco0hB8nd1dam6LYdppvGrMMf97kkIS9+6Z0vTaYg
 uhocTmi/q4s5eG7NJX26pzZ7tJZP9yewdDt72xxQyGZfzk6k7U9W6SvSq3TZA3NDqP7Rzx47B6M
 vaU19gmfKUynACud80oLUTK5jcQqn/80zdizYTbm/1OOJLhmmq2xSFAdSw4eFrT97I042vnzIkF
 Sks8N76IqtVnFpHQuDukovH3na7QHKPzab1tJ6haGnGIjACQGSVfgCunGQPe0+zolU0GcEcBrNu
 ccbJLP2TX+4K84JHfIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090850_162140_B3E904F6 
X-CRM114-Status: GOOD (  15.62  )
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
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts       | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts   | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index d4184fb8b28c..d0f2d3beb72b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -554,7 +554,7 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
 	supports-clkreq;
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..7a615b1f6199 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -549,7 +549,7 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	supports-clkreq;
 	vpcie-supply = <&reg_m2_mkey_pwr>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..4439658681f0 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -540,7 +540,7 @@ &netc_timer {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
@@ -557,7 +557,7 @@ &pcie0_ep {
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_slot_pwr>;
 	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
index 2b0ff232f680..1f2240bd21f8 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
@@ -305,7 +305,7 @@ ethphy0: ethernet-phy@1 {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 17 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	status = "okay";
 };
@@ -313,7 +313,7 @@ &pcie0 {
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
index 26c2df9b1b60..99ce38df4538 100644
--- a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
@@ -243,13 +243,13 @@ ethphy2: ethernet-phy@8 {
 };
 
 &pcie0 {
-	reset-gpio = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
 
 &pcie1 {
-	reset-gpio = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };

-- 
2.51.0


