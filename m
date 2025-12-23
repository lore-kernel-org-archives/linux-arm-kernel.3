Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5DEE6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fe/7BwVxywJSaIl6KaqmfdtPVzgRz9T9FMrtbw6gnzg=; b=THCyGdknsQUUBru2t06pxKoDPn
	ISkuxQrFPBJRbtIzXF+PH7Skw9EaM+amHSF4nWMHYFH+uxYYS6JGEgYuB5iYluc3+z7K5Fx37WEP7
	VfRolclSipa3BDHGGLhBPaSlATktIv0QneGGgje0zUV2Xr1DKX0cPcRweEh/qUI5A9H2+R6Qkq+8c
	EszMTeUc0a74MS4iDAHdiTr383d7szRs340TjYYfGYhweohQCSEwhl5I79/1GR9j2PIUCt5ZZZpi0
	t5WwwKliMbuojRqRqmG1WRy7qfhxqDO9qK2qF5ZIoaZNZ6s8Qr13SaRsO42ZdDIF9W5fmPft58q70
	aa8ntU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4HX-0000000Fgvt-0ldh;
	Tue, 23 Dec 2025 15:26:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4HR-0000000FgsU-24Lf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:26:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCgmQ11901861
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fe/7BwVxywJ
	SaIl6KaqmfdtPVzgRz9T9FMrtbw6gnzg=; b=SF3Iw9CpNuwlyLE8CRTXTlQlcka
	r7FitOED88XeZUXFUuh++XvKRYRti/PbVXhACYQiBMPMCp5occQmSi/2CC+kxJeZ
	TSmyGrusrQVQCJogD+vCvW14UYRBFZ3lRoBZtbokOhe5IvcJvD6i494sHXJtahsP
	BihqtZQE6UmX34zS1dyBEF8wVZo5mR3w25ekBkARncvG63sHPUfmKXo6wqddzBO8
	Q/gjjyD62FXMPYn4SdUhlG7xEEvEidSU/zcb7dMnDaVdrM2F+HyOxbncJJYRye0R
	PkXEimzzfHuqY9xN3B9CVvbMte0l7EQESqvEIuUaQgX/Uqghv1J5r052a0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8kfya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:26:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so178379561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503592; x=1767108392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fe/7BwVxywJSaIl6KaqmfdtPVzgRz9T9FMrtbw6gnzg=;
        b=TlkJKz8RjGAxdRUgydy6K4oVrYgs5czZ+0vHYHawU0gfsPkM4jAQb4AkjuoWcHwydT
         o/131N9QAHJweNPyO64I20SoAo/r5IP4ZCIb2bMs4KGCqI+SI7uN7fdde5CHeNA5IVRj
         pBWCEltG23N+rEVAMbMvAqf/Cd6dMI3zZBQHgoeSbb+jCk0aBGuaSwzHjBHHS46Us9WO
         qlTbeRXwHjbaXrvtEvVaDZQJfLZFs76LxzPFAS+oy/kv0TQYu0pybuMlhym5cg58wydy
         xkpO2+8EauE+IGooNlSK3RPXy/8TEaOTFB1qJIhl75DH0zEcNe9EcO3zvfSVsZTUd0jY
         JccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503592; x=1767108392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fe/7BwVxywJSaIl6KaqmfdtPVzgRz9T9FMrtbw6gnzg=;
        b=qJw+mFj6lQwxP0KnhT3aeVNICX9DB74MsTen47kdcQqhq9KK5j/xzEGfwing6FqUFx
         4blg30Fhj3eyfCGKLNvWoO15y31Uk7OgRJFneUf3V8ZTmo9BhpusW4wCKXnj7o3vlCp6
         KFq3av6a+zp2uXgTZyGoN78doVx2nB9pBoC8iUp+L69yK92YREPHasVoMNLVfpKaj4+z
         C3zK5YtNZLzdm/Rgv0kFEFPZatpjc6AgHEpKWyRe6ZWRIJKKGofisubwj+756W8y/qeJ
         tJ7eHEeLRERu49fCcFs4x3202UlUPdoeYF4tHtpPX6jomEzpP6ftyzx16amzHAcgiPyy
         td+g==
X-Forwarded-Encrypted: i=1; AJvYcCV5cTOyKXXEmxVGs5OIzoSaowPkPFQvHZvELx9Uf/34tXqTJc88Q1SAXh0+PRLL7WjxME4Bcx1ja/11UGkPt4qi@lists.infradead.org
X-Gm-Message-State: AOJu0YwM3DU/2hBoRhW2LY9pq9UOl419oKfQxcNIMMmhLxCrkwqMsIOj
	V0zc9kPk//YU3TJAaVCciaZeje7jlUqaLnDok9RrvSUZY2KY5Oh850WZPbJFxYoQ85l+tj/TOE1
	clywTM3jNVUuAUAGhQh5YDQC2HMN+BoIgLusJAtejrMtbNfhHr2sUPO4VORg88XjEkZD9xb+FTD
	qjcg==
X-Gm-Gg: AY/fxX73Ny0oE4pa+SBB1NVdNju3YI/8FdVxjp4+3NGBflgV4xJol9NpX4mbFXXg9Wj
	ebuxoR++cRG8f65U82HBDilob7NegRn20tEC92zCE/3sBC2TQL4Vp6VwnESWZvQ0czF7oiPdtD7
	KQVZMIqRG/+aHzNCoKlh2e9Yv2uJDEThRoExNc94LYpWaIVZNlHQJW2BOESG8VBLzzvERD/bbvZ
	Nry05PDotyMOKdN0PM8H434hKZnbgVnqXif4XUj8mTBMkD3+Z9fhfg5ZHMCnO6ADgmZ35m+dmDK
	bvuAgCqa41SokxWReBnbYTuYIjqqhRJ8DenMFaQ0VljuiSATMgVs/gENwc6cKABI7wRX9OaPEFx
	RhYBqxQDA2aIuiAVWrsip1yGDta9851OLgm8oYttdDInrUstEfHkfQk/pD3DMnYe9nIU=
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr222709221cf.65.1766503591899;
        Tue, 23 Dec 2025 07:26:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSiYBQgxmIXmFWgF50OKz3n3aCKf8Q8fGIx4+FxfvnJo22vVmH6AX3Yw49a91CCGZ5hT2RdA==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr222708821cf.65.1766503591499;
        Tue, 23 Dec 2025 07:26:31 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1454905266b.60.2025.12.23.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:26:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: freescale: Minor whitespace cleanup
Date: Tue, 23 Dec 2025 16:26:26 +0100
Message-ID: <20251223152624.155845-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=s6dmgXshYqBcqge/Gl9ktu77tPn7QoWsqWGoZ+fnNM0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrShE5eMgUcd1C17LkbPFjWDDQK4yQF2fNFL6
 yy6q1oM3NmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0oQAKCRDBN2bmhouD
 1wI2D/9qzhez4f9b4TZHsMgxaDFa372/H8+VYVy1VBio5wG54gOYRmItc9LVsbsRDbXYr4WcPRE
 xP35O+PjdCHfio1+vnV6G+GQzTuTn1ZCg0+BiFKlWG1iDewvYElrEvMSqeUgzDmWxf0qWCr4ZkN
 AM9IFt0DmFNaBkGKGxmdg7DyD8yylNImlACehry85WKpSXK1W7pxaIH2D60L/WSMFDukcT4+818
 qLsMJePqsLUhnsDD717eqqSAtyur2Hu+JRWV8bMqcIBrA99nNncWNAZtkZz6wscH6RwRZMOlexe
 WktQ7NP+FxrON1OCKpg8fZjkF99gkiZ/om3c5BcfrerSWClzoSIbS3bAyMPlzksDNCTSD2iIiFl
 99YZCCaHkS+T228sRYT9PGsmUiu2QvcYHNgr95DMPciMLGx1qEuPbA+CQtXubOWhyW8aABPwdGC
 pAFTVKIp+JH7ne9i3ZYXA2NTyVQn17ogRtZoV/oq/1PBSH5cbfHPo1NrBTHwxfx4+1ZWgEigU8n
 d8tP/ahYfv23ERczntP/W3CeUmKlK519ouv8dOtLLe/Tz7XFvf7yIjR1DyYXkGEzukBpvX3Thtw
 B2kzvspp5OLd/kGL/r8X0fASiRWJjmeqjte7IsQ0RorQ72m9Ec50lIVx7wwg0FeteIoBL0WsYPh xWQ+ZmbnnrF3w9w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX9lIAWIN1lJpl
 +gXIpXtF6pJfUxihwTlBAnvNtOnol2MCKvPLtyyuJCJ3Q6WNSR9gkBjUkxYHSAQAXY4F926z8mD
 QOZyRxjr0v54hME8yaqgUPoHrhJZR82WIw8li+2adw5SkYebjUcSnscvBOjuECV5ShYDbEISlgV
 3H3OkjlJWqygv9y1XPiqzehq/UzNEtS4SLKSxQMSHxxY55uFI/u1bFutbrmXb1dWyUMsZxW9nmm
 3t/TM/gMiXIAuvlu+zbz+GsEa5qaerLzexp4dFVKhTYokfovgO59dOY45BdmSt8kWqyCzk1GAxq
 Q6XEFwxr6uj5+h7d0pt1iD2SuwOBD9Ze8Sn6c2zS7cpIvDr1GUG9BaN6XGb1sKrelNtg2LSCPkU
 l5CcpjBHxarmoenzmU4xGDRmUZEZ9Z1FtdYWpWt6bYlRmlO6+2ndfLgJKm1pzixV4mNDHc22qKW
 A227g5Qvyluzq5H9kew==
X-Proofpoint-GUID: NgSW4eJj317x_Ok-GohPwDY_1EKiyMcb
X-Proofpoint-ORIG-GUID: NgSW4eJj317x_Ok-GohPwDY_1EKiyMcb
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694ab4a8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XxgNNySyAjg5KShGdy4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072633_651210_22AE8CB9 
X-CRM114-Status: GOOD (  15.84  )
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

The DTS code coding style expects exactly one space around '=' and
before '{' characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts           | 2 +-
 .../dts/freescale/imx8mp-hummingboard-pulse-common.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi            | 6 +++---
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi            | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
index 138f21e257aa..242fa930bd2f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
@@ -117,7 +117,7 @@ &aud2htx {
 };
 
 &easrc {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14..fa7cb9759d01 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -141,7 +141,7 @@ mpcie-reset-hog {
 };
 
 &i2c3 {
-	carrier_eeprom: eeprom@57{
+	carrier_eeprom: eeprom@57 {
 		compatible = "st,24c02", "atmel,24c02";
 		reg = <0x57>;
 		pagesize = <16>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
index 4e6629f940bf..3cdb0bc0ab72 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
@@ -198,7 +198,7 @@ buck2: BUCK2 {
 				nxp,dvs-standby-voltage = <850000>;
 			};
 
-			buck4: BUCK4{
+			buck4: BUCK4 {
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -206,7 +206,7 @@ buck4: BUCK4{
 				regulator-always-on;
 			};
 
-			buck5: BUCK5{
+			buck5: BUCK5 {
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -264,7 +264,7 @@ ldo5: LDO5 {
 		};
 	};
 
-	som_eeprom: eeprom@50{
+	som_eeprom: eeprom@50 {
 		compatible = "st,24c01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <16>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 2dc8b18ae91e..24063bf8183d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -131,7 +131,7 @@ buck2: BUCK2 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			buck4: BUCK4{
+			buck4: BUCK4 {
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -139,7 +139,7 @@ buck4: BUCK4{
 				regulator-always-on;
 			};
 
-			buck5: BUCK5{
+			buck5: BUCK5 {
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
-- 
2.51.0


