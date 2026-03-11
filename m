Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8012112584E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lICmcRczp7taqbCRzngMqOPWmAjXGILM5iRx7llg7dA=; b=OYYnxb5/DDmhAO+MZ4hPOcxcbb
	yvNoL6lSLdFYsjNldc01wHRtpc0d3zYmK5wp2tBdzfx2GLWP+XRTflzF/+BfNOrI/rRslbW1IVJGh
	/47p8jNHBIGY6JlLkmPPDlamU9t3P57igit7CSy+W8Bgmfk0Wm6Qcyr1hkZCTFtm9hTXU8qRzwUW8
	WfTmbPFN0bRqjE14EReU2ImuQSYu9PVSfABc+swISOxaGWLZr5hb7HB9DVU52/Vp2RG338RnW5EdR
	UtQzWBk3RpGCA2yYfrnrluMmqIvEDaQHPMcltz9qBz1ubd5PPN12RGuL3m1ESRRV0qU8GvQzEY8Pb
	o2iU1uuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6s-0000000BsQF-3UZk;
	Wed, 11 Mar 2026 16:08:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6p-0000000BsNP-1Br1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBeBEH2676286
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lICmcRczp7taqbCRzngMqOPWmAjXGILM5iRx7llg7dA=; b=Of30gtODIzQXCai3
	cHhcVRdvElDj7B4VL9w0q0gJHqvePhcP1ULP30unzFzgy6QxiMa+uQlQLGSssYLX
	OrYL0jhW994HYmjNdzpm3ZQZ8xfxG0WVtjQOB3Kgn8oFd9GaycWZnJbW3sDopFvJ
	roMX2V2Ubn2eWB3qqNhNU+KgT1aNmGScLv/DIYDeriBnWCzi/CcCZjoSl6h8Yemi
	7fKyDUCXP2mKtuv8eMOI915sQcDec1HwPxS9xIuZwxPzmMByAbtSZNwTFNr9J3Y1
	nVqThZrkAzNP4abnGLVMVuFS0sA+U1PdB9JjL00+FrjNLRJY3XTM621qJF3d9loF
	VQTSqA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd25sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94d6c5433a0so151483449241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245310; x=1773850110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lICmcRczp7taqbCRzngMqOPWmAjXGILM5iRx7llg7dA=;
        b=Rzdp2GiRuNuzLidD3D1vct0m3rNlIud+4Tho1clwbA+d5/Hx4aDxUoKpOv7ihqeXRI
         H2uYKZ3xHfYcjyKqq0WTE+77/FuKt1xDocgM2YFAhSq0pwB5ueeFwOd/Vdz1oISrj2nZ
         iOx8+D2nCQtFvvdC0ttdWcq+/BHgYvchEpIV8B0VLPkA5t2dEfJ4msmN73AhxLu5qsHe
         PIZBUWLQRK3WZ1B4wcB7cpuzYMhJrQUjWTVrie2YYsxpMn/18aps8TbW8zujhFDJDGFU
         kD3k/wrsU3oQTFU7x6CU0IdPOF/5kGJauivbcdFDHMZhZtHPZvgHPMAe24N3yy8TdENX
         4jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245310; x=1773850110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lICmcRczp7taqbCRzngMqOPWmAjXGILM5iRx7llg7dA=;
        b=LiDTPpxBrMTeff2gj9AQRAyHVgqRLEGzsn8fbYbYuEAOzmsnY7wSoN9ptYGTuZhjNL
         mASLJZISOwjW7UeUC7EMp4m4VRHEuDIOULzLEY6ruXOKTNLmafmOCETFhLJJeW4TWvc+
         ME2xo5UrdGMi7v1Opg4adS72+xlnhQbo9fZPfRv/4QHiC4F97IwpPkNpgt9VpYuqbZvk
         aSffZ5Sw+CspGcBD770D+ANjYs7UKmzQiQl2p7cGzSHKwMHjvpGh7kd7f9WoaU2p0G8M
         wttE/Ky+XjiooZ05wK0ePcLVHuExfKCRjOI116J31e89D2f3bSNUAdECtCmKLQNbJgXS
         OCPA==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZrGYFJ60N0POgAJIpvEsf08x1UwMG33G6oPEwxNJNma1jijmcwKPADvFMJCZqHrJMa7pHjshbtPIgbaWSe0a@lists.infradead.org
X-Gm-Message-State: AOJu0YxrbUawOxw5hv/iVPtX/I61sXDO9MY9tM9qV0IqxmE5oho1aWR1
	ojsxoPQkgPXbbzFDMH781azUGHzF0arhFokohk0j1o6FQ7DiQKAFZka+AKG5t6YHSt1aWIPcOl0
	588zhJaQmBX0TeNRbwm7y2XnR3BQg/urDwLnbZwRwbBBnx6ctc4Nr3urtkI5DcY5xV2eAIfsWlR
	ASDA==
X-Gm-Gg: ATEYQzxJQajo0lpF/FIT3XhJJrjgmucwtMhMPu37vwVf1NKdP43jhiaR3aiTH6/8Q5l
	QIgZMnFXjMiLVBbURapqtd85AhoNFUIWz7fE985cNrrsrUZTFwxPDU8A+GjnVzCa641Ugl/Pgkn
	Y636pMzy9K+G+BzsN95rCqTujcVQvNpNWGGx7gZ/cqtYXCFz3Y1CKBSmokunTj48UHOFHQJ/EmY
	xHVVgP6alGiZRaqEMo5JtFoeZsZZVyp3vQXiTlXjyLDmS2TJRT1uilwbfCzwDXZpjZg76xfI84o
	wvbKSYPtLkMlx1ryt7VeZsJxlH6BLJYFinOiThygd1qix77BL4gB6AqU5JfSHBBBFS0cyzLUuIV
	aQC8DoQnemL7V4fBUwemvey70YHludksqUlBomtJO+Mp3
X-Received: by 2002:a05:6102:cc6:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-601def32261mr1232107137.19.1773245309788;
        Wed, 11 Mar 2026 09:08:29 -0700 (PDT)
X-Received: by 2002:a05:6102:cc6:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-601def32261mr1232095137.19.1773245309350;
        Wed, 11 Mar 2026 09:08:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:01 +0100
Subject: [PATCH 05/12] ARM: dts: imx6xp: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-5-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OOkLDhK3JsTYE1V/32ZvYJef0A3NvUMo5Dy1LiBK+q8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGmxk2PIVXuRC130iHSJs1+ZsAOV5nFu/np6qPXSB6xFzMWcj
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpsZNjAAoJEME3ZuaGi4PXYPoP/2WY
 f1UHu6fqZtqhj/8R+2xjVUdLFhZGTG3kTBK8piqz/Sc9VgyLqaS8VtmzYizmNRXEBQSXjKI0Mlk
 1veVqdAbR2fSegGbQOd/7LmktLkg2IP/mGff9tyU/ZuM56WmoTt5RkMtYF2sSJ0uewAcFi3Kq1Y
 0Ya8y0pWqrIxaQsHJDIX2kZlaF++nVd1MlII/VEIiqcRSCJ1hneSfo7zuARbh60AsNbn64aLHJK
 V42TSePkcXBU4DhBLYHhV0vozubGARPtJuzIJSMpKa4r9+O05Blo534xglMGFjdbpccldV8oIIW
 gdJj7+4SXjaDg2sZVA+i6ClsjTsvQ5+0Lz5cXrxHNPeqfYCLg+M/RAIeeroTZJxT+H6pspe7syb
 2pqzvBdq7HhwVMxRo3cmThzFsuM2Dcg0cDy9+zr8RyyZUeXkaQPnE+Bzkkp8GAfuQujyYA9pFeC
 l7Scopjn9TIQ5bXtcPLElJ/0H+e9d2HxbBQGmYi6mlmFHl8+Tc9qaPh+99sSatMjlrnKotid0ch
 ZYJ3JaMcz+FrO2JguE7WDaitlOsu2GRosEA306IQbB1KF5fRYjmTxxrMSBPmlojaHVXP9vljuRF
 FaUbzL9BCah6I9Dx1TO9d1cR6vG81pjJ8Of8WZSATWXAY3YEQlh/g3Rhfn5kKMpdhjBUshgmPwg
 q7SZZ
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX/NRubuFhBnwG
 mU6pAtzYSK287/Jrsf9gP29w0Cq7Qo3jo8Og95xtkC8qoGvHdLZ7WKFNdAbwC69WnedQrPbcO7/
 INU1poNCsZ5VFRrWzpbxk/nZruk58vo8IdA01etXlEwqDhOmtEy1mTdc4NGqRWcQhrMd9JH3ElR
 KgFscoazo+YwlgYZ8qvmj2grm6MMs/9kr6T1txwb0GCJ9P8dXtMAXqrzyTyLDdOwM3BkOAUPgGw
 FhvjnchJytzg7qJIehFri7gJ8oPU/PvLjQOCwqhCqJJWG0iYRZatO6Z3lp6W4MgXxi/Tl311usL
 cf7StfeOYgb6c1wuJifEuRAqdrY5dX3Pe3Lrh2VsKQYrdwEw0h7Rtgte9yBe+2mluvwvn/YZCnt
 kDT4KCbV/dP4LjP19iVIAvBOg0/yHLovj85BPkAv+bHxBEEMuzhuIm8Ij8f93qgfMPeKAqFn6HH
 saI4wpbx9frhMthI0Lg==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b1937e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8h7fRtSIOQ1pb8j5ki0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: ACkKrDno1AuRNg74BH7q0757vPUklJ1G
X-Proofpoint-ORIG-GUID: ACkKrDno1AuRNg74BH7q0757vPUklJ1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090831_341738_0BDCFFB5 
X-CRM114-Status: GOOD (  15.29  )
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
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
index 1c1515a854c8..6dd382cffa3d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
@@ -224,7 +224,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 10 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..11e8efcc1fce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,7 +282,7 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
index 2ffbe2df4776..6dd626f15a9e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
@@ -499,7 +499,7 @@ MX6SX_PAD_SD4_DATA7__USDHC4_DATA7	0x170f9
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 	status = "okay";
 };

-- 
2.51.0


