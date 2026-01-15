Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4882DD4115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=; b=ZPke33MlYSeEaTxpXgGUe3lRCW
	8rqMFKJfUieHFZWIWLgJ8RdoosLJF59AFiMK+qPojs/y9oWMwHZn9aZuHB2ce3AafywNWrkmNYnCF
	7NBceMmhNh2HwnUx/kNZGjoIOcPSy0ZyXLAfO9wAhGsOiMgkQ6jmdvc5qN2LgVnA78hhkQlNoWU9Z
	15b9HsDpmLXJv0KA5S0QIaBayuZsVR7pbXloJIeFpCuhekV99Uj2BAQk2W7Bj5RdXBeLmY/he0zj5
	AOpOdk/kO8u9Jp5YC3CO7sYSzYiBxabD6ObAt7gZn0qCTHUNS1+d4GKJ6nzXf/KQoSX2BNcyWdOh/
	1QT47TJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKLs-0000000C89a-3WiD;
	Thu, 15 Jan 2026 10:13:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKLq-0000000C87p-1VUl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:13:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fm253419438
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=; b=ZRXT1g5i3GFxBgsv
	lmVUXC4n5/7A45oqdNVT5qmPytsbsxWtfRoySx82clfSDKTGcn5hyUUT231mEzqq
	rENDLcbF/u/k6vj7HtxZkCpbYt8R/Df7GAuPLPWAKO18EcY6Jbbnl79HESxbKRxy
	DfXNUXPTzoNeLjkJH312ewe+9o/sb6Z+C5CduIDpB4GRXrGyzOYEdKEP2z+8VR7M
	3Jna9doTASM1hFA9Fj5nO29eqevppbZ+tH3IfQZk8Vro1Nf27Jy65qbWNPLsntKo
	UMFw6dN7y2C7gnHUKOSY9KIdpoCkYPwSuT4Tt+82eL6Fv459/RYR4nYxOMRHkMaX
	OqdoVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj8a2wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88051c72070so16783836d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768471993; x=1769076793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=;
        b=Txh4YGI1iDOkpuAMT2Met5j0yxceAwExc4TThMPgbFDBOAFl8VwJ6vmF0rxu7V/gHQ
         PielR+UXvo/pzJBL0nP0lxSR4Kd0TsPIODsjGBdckSVHt8Wy7TFf0kq+PNZf9oCow0Ug
         wcTWDyvbimCgXiLS4rBSVPxculK0/TtsJpXzFDQJIENQ7CfyFFF0B8caUb7utIue3kuU
         rWehYUnqYPecsX6LFNx26nYoLwaWxPBdGyXa+kb3O70Q5Hq/S9jWsgiqgSGCYAKU5TXI
         Spj2r7jtbYZTYuMCuLZl/vyYIZI+nj7gHP/WKIh9uBk9WEgA1PQWuxnD3K6CHJTcWcSC
         a9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471993; x=1769076793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=;
        b=eU+4dUwqoaU3Z5zTm1sJGD0VZP+Wub22eDiYyHcSNxyFQ/0f4B/Wh4DvJ2C+u8yqQm
         rKVTGSIseV7lC4k32Z49EY7rCxdENaoZ9KTlFs+1LV/MBdZE4CZpREo3J1ohfEntsgAx
         28E/pAW4rnQZNn5INItyHKcUXs2YL0pn8Z+eprDyyAYhJ/2tCp0kPaPUrodnZ3ccjUI6
         hw7sFgcXMXrQOh2ZEt2FpI6S8zoOnw3XUaRXSl05/0KH7Lf13qjImMF+eXt4YPpr4UYo
         Tz6DxX0CK4bxKp8gzDAOmUpD0VVNOXeUotBATneIt58m/PVdzv6CC9iYdS+CWSo776fY
         qBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbP0jgDE+Hehi4BRe45XO//gl+EuJoD9nER8myrO0a1b6QPUyTMX7620Gg2I9MiFXCUldpHpAKebTo9N/6tZsP@lists.infradead.org
X-Gm-Message-State: AOJu0YxeJBubraTm+p7CKcblptdBJBsHZgXPYEBnim3XKC0+e8/ml7I3
	Yxeusq6xUpwVDzlrtz3auDi9xEMiLrZ72UX2ii3ZEwc/67utB3eNonRDFpO5zz0dTqWy4oARkFD
	I1BM6mRQLs4np9NmsGxrd90kgeea6N2WcxhvKD0s4XlBQc6bHX+MbFWIQPpEKx7KM5IifycpZC4
	+FJg==
X-Gm-Gg: AY/fxX7VfxofFoKlnGp1vZFzldwhxZoYjAXh/UzKlViQytiewsG9vzkmH2azTorogMG
	dfGTH730tI9v4VyhhtwdVUQlzvv75IYR5JvYm6RkrydEuY3nF2L+ZIOVCY8E+LHH4F0SzM+LEiI
	4sjNj0Ek0liLyLwxmJqpzvwp9R/dfRZXgv+rJRel1YJhxbNKhcNNPFCwj3EeVnNAocaq4wkwWum
	2+V93EMUaRrN/aqAHcytXwPiewz9ilS8qe1E61Mm0Q5CnzcmM/M5Banh+MSJ36umxyAYGEmWiTI
	YWQLQo5b/cHalAqL3SXGACv+uQOxWngfTvCN7j51N+8kANAwUxl8n6XdFFnF/4S7b57nnI0/etl
	2pMXH7rw9qdxG/6pYAy4NXeM/b/2IJChxlqYq8A+7WHEOxYyeLDlPSIII9XT9VMwPiYZ7rc3E04
	Lx
X-Received: by 2002:a05:6214:629:b0:890:808f:c262 with SMTP id 6a1803df08f44-8927437eeacmr80975086d6.29.1768471992556;
        Thu, 15 Jan 2026 02:13:12 -0800 (PST)
X-Received: by 2002:a05:6214:629:b0:890:808f:c262 with SMTP id 6a1803df08f44-8927437eeacmr80974536d6.29.1768471991993;
        Thu, 15 Jan 2026 02:13:11 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:11 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:37 +0800
Subject: [PATCH v3 1/5] arm64: dts: qcom: talos: Add camss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-1-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=5Ona5M9uA1G6MtS0rXSl9JaevxMMrhBygC6kd44fLE8=;
 b=KsWUpHDPa0GAvVQQny03nZ0vabHvwBJyTZexH6E68O2XuyrrMRWAUYZGCWmR6RjeovSYLHzIJ
 fYkcSBnEdGaDu6D9gxPKNcq3J1GRtYD0HwyCld0MxD+oY+/VSZyR9rm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: TEKMb8KTbRIblMw6a5CLmluClgdAdrGu
X-Proofpoint-ORIG-GUID: TEKMb8KTbRIblMw6a5CLmluClgdAdrGu
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968bdb9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfXzBnO8VyTzkSQ
 bm7aWayJCVqQdQ6rTNgBr1BwrAK/YpL7fEJt36VgnbKgtvwaQyS47kjdU6wcGbniURwCD8X+r/E
 LT0Kr64ICP/k0O9Yhp32CdB/UQiSWB9kM2eQpENqAYDCWR78UCejor7mh8QmR/EwyqlZ7GNKbSG
 KjxCr4Gc8SlgU38nXDpW3m7QIx6u9k+4jzdc02/o9Eexy0MC6GRIEEjXLJjLtiZP59uVHh1Ckn3
 BOoOejEIS69AKL0UMQVxgyR7GYhO6kLrwdtqI99ELKVC6OHBuxCA3rKXLc5Z3u7xGbeQziVElAN
 6E4sbnV55/f0UJC8X3dEIiq3KFGc/eACeTwmBeohpLTDSQuia2psI/SjqcihzOhRtV6f1Q9uKtm
 utw8cSEg+B7ytGjEneZ1rMzUFSCHcqZOkMP4AaslWAZ12980Ol1RBpGTnN+lS8SsKyqUi9DToph
 i6zQ61zxuhm6/VDrXBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021314_411149_586469F9 
X-CRM114-Status: GOOD (  11.73  )
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

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6b9f2521d718eb5c9683393a2e5b67928631d96f..fe59975d56d6e65163dc7fcce8e08c50fadc3786 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3790,6 +3790,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,qcs615-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


