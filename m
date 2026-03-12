Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D985106ACE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=; b=rucrNrb69lSyrIDPXyIq+S/zHk
	D0ASRu+ROvA9AXBOYjnwa/1M1Rpgx0TYAtrIm46iHf1j5FB1jvW9clZzpVYxfYu29AnU+MuT4JCeE
	EmKd23PlnijZ9msOOHZ5pdfY6UvV+9U6RbgYnnMFQAAKH2tk2e1jj65W90oBNyNlQz/ZIagMEdais
	Opid17SPKIqjofAQYvZS3BoAUnEDdVnF8uG8zlFQegMxSOPF3DIjtY9E9FJALo9PAgaSEj5I61niO
	mE466t+Wym+gU6FL/mc8L2eZnXOBkhVGte668AmN+VoZ0aNjrZweRg+uBN1kb7fLGf4C9PYD/wusP
	vCmToyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYP-0000000F3MM-1n0b;
	Thu, 12 Mar 2026 19:18:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYK-0000000F3DP-1l58
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=; b=gvTX5eDqOO8/X+JQs9VVGIZpwS
	ZZAgU/gbOxlRBaqIAhIQSWJ5QJwB4LP0dRcyklsmJ4GL2zCpnBjPRGlaECziSZoje72QaFHpiRdVN
	Ck8/k9viwHhdPm4/+YOA8v6BQ/gz0rPGPHGSVhH1QAYUWw0zDCq5C/f1dLnxTvG8zPtkj/fydQs3i
	p1Df6mgWWfpl18jvkeM9pM+aKS+uFGaK8H7DTWIsP2V7zw5Kg/Hd97m4rd58aVtmP2w4T8rIfTXEz
	g1sCEX2aLfMA3jGX8V4jO5ubw5hxXNZ1Tl5G8ngq/6QNitu+na3SiaYS/tnu27zmsr15csJMuAQeV
	77P3Bs0A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYE-00000001qzO-2WbO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA0vhs1922465
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=; b=YS17obd6VrQm7rxW
	ijFUX6Pnwun4h7HgLMzk9LYLme4keBsX6kN3NTCUcp6YQN7YeJeULT5foWNpOowc
	Ae1BlxxuvfICMvRaXyVhFzahe5SUiC+c4oI1i83vPgIxjBuBMB6uegmYP1a+8coH
	WsxgszjwoLPRegzzeBXXjTqm094yoP8KOCDSC7F3DKosUOPFjS00DVjgR0kxAD1p
	m/2oKOD466jutLPTM6m9sRqBSA7MyoYw7Ad4QVwW52dnUqusBR8v1NjN8MTpHgJf
	O63QcRzACgggZZq6lsIod5TcMDpNYL9mVrt2+tYgSFzmVs6O1rvUBzMgSNCpxFC6
	q0vG+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wuas0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1294555285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343108; x=1773947908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=;
        b=jiY+JuGXsuPxp+cKQZqc16TWkNultzUN0axFHnMJ4j+ewK4ui6EdLiy3ElrPT8dpjT
         sKGKp42ZynywOQRQfALXjFzW7bslFB4iRuvp93hMhiK1+AqvwtCo9qOClM41Dh8bKqun
         7i5RN7a46xhBjDT+dthH91tF+OKfaNEYXFZZXgMmZQ1r+uScD4OTGMDYIIJe0D6Qe6yn
         p85lxG17Xn+GL6+QkdEzEwNZUgU0vaJOkHLNLLBTVal+XRgXTeeNhtQEVDBPjQldo4T4
         Wb/U2uWzFuiMCyTVlu0fNCzT8HfPpLByy+zX/0rbAJUtdVKias+GEvixoIlNOU6qZwan
         UiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343108; x=1773947908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=;
        b=cxeqt5Hzf00sEKHsCDeuT9BUWgrIUxQ2Y/1KD84PwmyNRHXuq+BjcAMSB9aoV/o4De
         G6L29EGkB8d9IE3V5XUlZkz4Wocl2TncDK2Cw/2AYH/WBSd+ZNYgMXKMXBheXxwRWMxf
         W6SRnOhH2R4wJBuqPNx11lof3VWwjJwO5InYEZ4ONGh6jXnyEysDvO0S7QGBhLLRbHF5
         7Q98S7CxuGwQgyjakDQbqR4MX0p8zJ/LBtYCbdExhSdyiPmilJmoBnJBB7raMRS12TMi
         H8E4UO08QzbEVs36OuL4rMh42j/RXQyPrggUwxNq7SdNlhuQ5Lkweambrl5akLynHSlq
         e1zg==
X-Forwarded-Encrypted: i=1; AJvYcCVlpPpGeoktXm0cjCqC26eMtUGYgxCpF50Wf6Wyb2YhXYIXY5oBGcLLRFkPy1L3QCgsZWEuBtZVTbdZGjuGwT9Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/B2vb75MUo/Dg0swK4S2WTmJVAnCrOW5Shr3EOrNX+9+6rVSc
	9iQyT7SQUH0REnsAbhkCDsrKcYhbYm44lFUUp4MGR8PzenjJPM0VRzWxnaDTGsHr1zASY2VScV+
	3oVuCTjXJCaNKOSiQbBMutgzrp+rcuSF61EfFNngWaMTAAokc+84pKYEbbDjQlUpkvqCZCH1LFR
	1eqA==
X-Gm-Gg: ATEYQzyYU+ar7lbvHjzKsCfu0yqoBLRYcTkVqTBHOEIDdfjETZHB7cQ2WoiWbd9w4T+
	3ZwMWDibqqCUiNPVMsoMEKUStfBml8PZx1e/8CZ38ThXe6iOmK91bgp3TpkfCJ2zCId3VZvgBDE
	ToBQ0tHzIoJKNOm15wshZ9zMR6SE034J47QD3mBqSpSgZmSe1G0U9MjUz+BW0jQ7q+NxJVeCpNO
	zLHIeRdmgpuQ9UqFX94swq7IU1q2LhvfXkhfi7G5N1V9eCC9tIf7XZ7NoA71My30ISQG2Lxzzm1
	lpLkBDslbWefNld55qgCAtFomlBzZ4aIv6WBV6ELx5eL8/sTQnbZQSwvn/od+l7p++/43K7weBA
	/MtKgwrBytmzh7C0dCQE0bpcd6pKDvV8XeA8HBtsxlYBO
X-Received: by 2002:a05:620a:2943:b0:8cd:99de:6b61 with SMTP id af79cd13be357-8cdb5bfdb69mr127768085a.80.1773343107947;
        Thu, 12 Mar 2026 12:18:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2943:b0:8cd:99de:6b61 with SMTP id af79cd13be357-8cdb5bfdb69mr127762785a.80.1773343107527;
        Thu, 12 Mar 2026 12:18:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:55 +0100
Subject: [PATCH v2 08/12] arm64: dts: imx8mq: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-8-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
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
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4367;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ketqLeJvphOERTzcwSuzGEPndeI0EjSYQVG8iMUwDuk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFnXSgcn3d011T7YS07Ob2bLGT6L/wEitz+h
 //phXY1q7uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZwAKCRDBN2bmhouD
 11gmD/43J8iGdLsLnSAVQKjH1u5zpsQ/oIeg2wpSCHGwactwtUTBJH7dSoIxfufErPykpi7Yb8R
 LH+Y0pUjbxQst2H6TdTHNMsKQn0eRnbTMEzHLg3OzHHG4HtPiqeE4iCtE8s4/Aq5bc0mFQaq6BO
 z1p34Hh50P6+SRoFMQ2fgVkR92cDpSXZJwMuWxBEjvj1l0nDkR7/UeYVcxdus711FdVDdpLJHHA
 X43cuWrogOLL8DT5QVcRSiQo6GcnoKB02/X2D4R2SlyQhABpirgkjgFV9CgTqyaq1sOqk9DQxI2
 fWBwuG5AQsg8oQ52NXXdizlsmF9K50cNibIQVpMfPPGAHdbRDrtbWDjm4798cH8Gny5NqZK+vXU
 3bS2+mJr7LXgLxZUN0LaHNMDrb/wlAij8T6zzNDt6lcbazscyTVfb9O3IuwxYceC175NZb1CZBS
 ZMcpjiKQ/D+zVvVoMj2wHe26reJzVzeFG9qBO8YtdZRnvVF92dSocmhmQ1d3nFc477EqMdhNOIc
 js1Cf5pcSxnbfATEXMuVJndiyp54cO3X0PJjK/dg5tsWQRw9E+3Y+YONzCwHryR9oe+gxPU1fCy
 d/gvALrUZA4EBtdhicl8oiViy/IfepFNtBvbv47eI5LgwqfP1mHLg+kUkqVi5mAOMnM3O1eTPVk
 VNQlLzs5PwixteA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b31184 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=nTlmypLvTDh5NzCj0PYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: XBTUQDXNd8P4ItocLJ1f60OTWEdxGfNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX9fw4m36DFTjl
 ndxAEjgNOUqAvKr4Gs846rkv9rJZ/jpuwuHE6qgoaHS0pu1WK+tc8tkSKIdTCYZ9/FAmrSzj3RD
 aiOhsPw9loX/YPLIBbVq2gixtVX0vFunhNpHNLDQMf8sz85lZrQuc7Bx/Iv31BiLJXXxQ4yGugo
 f2C27QLn4x61U8hsm2fHAVEPIsvyQqioUtbHgCSveoo9E8P6EXOb4PqKwahfggaZYkFucucwATD
 2H70D2VVn8d4FJAcvpnPqZejyLtayi1c7c06xQRq3eYw4alEeWclN+4T77ABIYYgE50ag8o47jW
 ZGV9MJvRrufQBHZDiOCQKHycVLv0bcDg5UZk+W+JC24a06M69byKwwth8VgHo5qcMMkfFICXiXr
 T//w8njNHMi6kgKtQ+WOCAnFfiOhgRPb/PhfgjVYBYxGp2IvYwYwgBbSLu6VyimafkkrmTYPOyz
 LQAxvxmNU/wOjOLUzOw==
X-Proofpoint-ORIG-GUID: XBTUQDXNd8P4ItocLJ1f60OTWEdxGfNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191831_081024_6DF5C1DC 
X-CRM114-Status: GOOD (  14.76  )
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

Freescale i.MX8 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi         | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..54826420740c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -369,7 +369,7 @@ mipi_dsi_out: endpoint {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 28 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
@@ -392,7 +392,7 @@ &pcie0_ep {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
index d8cf1f27c3ec..2296ff065467 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
@@ -243,7 +243,7 @@ &i2c3 {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..09f2fb1ad57b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -195,7 +195,7 @@ mipi_dsi_out: endpoint {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie1_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index 0165f3a25985..aa54182def4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -93,7 +93,7 @@ &led2 {
 
 /* PCIe slot on X36 */
 &pcie0 {
-	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcieclk 3>,
 		 <&pcieclk 2>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
index c7bbba45f368..f3d0ebe98d5e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
@@ -547,7 +547,7 @@ &usb_dwc3_1 {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 	         <&pcie0_refclk>,
 	         <&clk IMX8MQ_CLK_PCIE1_PHY>,
@@ -559,7 +559,7 @@ &pcie0 {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 	         <&pcie1_refclk>,
 	         <&clk IMX8MQ_CLK_PCIE2_PHY>,

-- 
2.51.0


