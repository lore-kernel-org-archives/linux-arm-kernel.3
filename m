Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F93CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=; b=WT2O0QJDyTZY1asO+Ci3nENOf1
	olk02vpNByVbAHEIZl9MX9lXPpXX6qVmeCUfWxRtFa41R1Td4L7Z6h+UKKgX5mvkfbrZeTYS3N0kw
	9IH760Pxzfffph2vJshtEvTInD1Y1wyhUxc03qUxJVZu7G5xNxQUkoqNgx0kd8C7ztgLFXaytv6o/
	T3VdnwcVW4BJoxL1wEga7IyJ5UZu1YTQMz6qsDiMBp/yRTpcXYc+F83LHfN8c8IBNbKOCEVF3/+v2
	uhqFEpvpWPtSBnJyyDI7qCfrlEInUEb6HtAk11dA9JA5yoHb76sswt3Pb+QJ+LUVoWoaUGfPfKpbe
	3IDK+8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaK-00000006Mx8-0jGr;
	Fri, 08 May 2026 11:41:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaE-00000006MtP-1yR3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:41:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486K6oX1174056
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=; b=lB5PNY7oCQAKy0lO
	Q+O6f+8nEa5+kaiQQfBlZ1Z6gkG+Y5dPmebt3L9SXKdRDWEEePucckJlsyoN0B+Q
	L0JfndWQgxT2tagMAJjzkiK84oVFaHrUOXCjaAQQe+i7uTlzFBLLxoSQit6tr+TS
	IUiM3l2c+JuwCPqYErZqsbGx9/IOmGO9ZjUWT3KLJjVyUl7TexEHNkkAK6fYT/E+
	E0aviw/2hb7svAEix25btL8y6i3mRtmXNA8PDtl2/SKygfzGuijtfrIgajfici4R
	JWph8TsFS53fmcHtYv+aAKqYCjx9mDyUqfvZwnRRjwlVP2jclRfX5hKXN7pi1sVn
	rlwqwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132haq0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eaaf673eb4so185221185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240489; x=1778845289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=;
        b=VmlPwl8VpGbr7n3bdfRhSymE3kIFYtkRKk9aT6FbRKYh5loJZrKNNcs4qHwss3imEL
         TVxBi3cwCmL7v6pvGNnaXtM8NJy4CUCWF9gi21LYTNrDOktkGdWBbTG1ZzDtFoEOJO3y
         Ea6PJhm1e0OzvHArEJcBbHNLKpNkg5+mjEQGef6hiyzRI0vhphcgO1oLH6zqFbRmUo9e
         cCT1lh7FLakx915YrkCvoe/DTcnx4YP/VQcjJe6pgdOSGC5gPIWtg4cGwIbQZCtOUpJq
         RTtlbg6IJcTuryOfW6X2j92qnsaYMVlaEFTGqFtAIWJRSivUOuVcZ7qV3DkzjjhBvy7a
         9UIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240489; x=1778845289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=;
        b=KeP8YPqOuT220lMd2HiCuEtILAxE895dxDeYnoBIr+aIWIgi8UHLh+OW0/I0QfXBWW
         F1Mrml0mVBLVzEHLt/dv0siaC9zmVqQ4OrNeAxkgq6C0t3Es1ZUY1rHNVt679zr+31CB
         BlGrSZlh5G/mn9YvrUPvkILKGLK3VAQrveEL1H/iVeEPLu6/1aJ0mCOaXufFYdKpsFkB
         3j2yggU5WlBPWTdjv94+ONFUk1zoEOkxIRVUlsBVEXVM2igKdmAmJkydW4AIAhuduTpw
         /3ZSBdi0L3uf+tRJM75wEf0+ii9SFzXkS5izxPVdrdpHFLwT7psBtsDmqp33HmLanCG4
         VZ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Q6ydwk7z7F2x0Kst/VCXYOKE+hp7s9JgQ2TAWfr3sR7H1Vytw9D/k6Vgx6QgqQifO5YH6SW9WxZS1BhZ/aHyB@lists.infradead.org
X-Gm-Message-State: AOJu0YyNRQ+LhFUfYBdMsae2SwjeMrEagznIwtKqRQq9LUJPCBcWxmI3
	RjxVXEaIRlLOpTWZaLgnApfFskqrqFdJAmfnwxLHUO59DuYJKLOOw8VRBBtmUsGKJ+2Z6rS/+M6
	g+5rMgz769tva8QRuP/jzE8uiDtSSu8KzsM1QvN2rPmtdW2oMr592xeFfn/MCgxDgwv/r+pJuiw
	c4dA==
X-Gm-Gg: AeBDieumud4UrZcxYotkeHAfob/9p9eF/QJ+Z+c4wGnrE3bNjNBcuU7MNsZaTDTKxEv
	00EyiFHLTHJcQVp2u0lzHpaRXHbqDYOOqXp6tY9F1XooBNwn7DfHMtkNdbwU4rdFqhtNrpqEUyf
	oBaeUFkepCRX/+qpL6Q7T1LYpUBjmeB8eZJrI4W+6CZn6bhphWsL7ZQeZ7ywazuIohaKC3M5eK7
	V1FgLObFd17vBw2wgF6WmJSIVyMdY/GGsqiEvUKZBja9RG3FZn8drTRAYOQea7qk2TOtQkieQlT
	x0gm65AwRBesKLuS1E+VnEpSEVd7+qV/dRlhTFSDzArwAa97CMLBFkzuMFDG+Jc97eu/cGdBAoQ
	cPsztXn3InRoOXyUlhMsWxkYpIyC4xyGdu0gQmKwYRU3uFI+MQ5a4vkNMuh0ks1bUOiON42qOEC
	IUS1yQGrKbl7MH
X-Received: by 2002:a05:620a:2586:b0:8cd:9665:9eff with SMTP id af79cd13be357-904d4b58e5dmr1727694485a.21.1778240488739;
        Fri, 08 May 2026 04:41:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8cd:9665:9eff with SMTP id af79cd13be357-904d4b58e5dmr1727687285a.21.1778240488181;
        Fri, 08 May 2026 04:41:28 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:27 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:00 +0800
Subject: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=6089;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=A99zg/2bpxRpuNCcBtMFYja3yXbXdYAWdmH7vko/GIk=;
 b=fdWcVDUqxkTe0eKXZKIV7iTnh/6zEp9yBCVxKbdDx2md3UYa1G0rOPABhgoh2f2pPH1STjwDL
 5x3JMmXhf1iAfV3mkR0w6VI3dPtzxguLlKK6oMESm4v69C3ZJDIYssF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX4I87/i2u3Tyj
 HT5ZFBJDSTGCVu4skgB/wRqvk9ZVYuNtoQsNAwBXE35CI1F62wsprSXvDZT2PsmKM3Za2dAg1YA
 mf+zJX3Lk8LkBAzaoK6c8C1FkMDCOFt7+0TZmmpTLggCu9SJQJ3ogX11f/J8XCzDtaE91PfrwSC
 utc7ZDFdDaVx8fBn3UhwWtJHWoj4Wzhv8TF1sNIW9sZ/6nle3vZoQAvobe/5dMdWrIlcxZ9viVi
 gm7zpFg47dX7Ay5cVof73WMpUW+wOARoMLyzEzXrnZdQ7Pa1lO4KMqMJsQ043uqUQfNtov9HPEk
 QgEV7P4gLAZNwPKJw/3jJT+XALaVBubd+xCVr616rWPcFZyPzFBv0BmmrBsi2ls5cTQVQNnrH9E
 4o3+Torl1Yy0DPJkO8Jgi3On8Lc5Ixsu/XVRzu/Rs3bKULLxd/zrtpNY3t5NXnNrSyECktI0tgk
 jNcMkGl/QqKFQ0hNqZw==
X-Proofpoint-ORIG-GUID: DYK8cgjOxx3YF2HczKFOvgKKhUN5VMWY
X-Proofpoint-GUID: DYK8cgjOxx3YF2HczKFOvgKKhUN5VMWY
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcbe9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oZ4ORCjJA6TcenDLY10A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044130_635496_F1190BEC 
X-CRM114-Status: GOOD (  13.01  )
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

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

4 x CSIPHY
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 183 ++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 74d6e4300506645a63e09490883eabf749829e58..086c94217eee64756b734f436f1f0b49d49dc582 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5629,6 +5629,189 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb7000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x2000>,
+			      <0 0x0ace6000 0 0x2000>,
+			      <0 0x0ace8000 0 0x2000>,
+			      <0 0x0acec000 0 0x2000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x820 0x60>,
+				 <&apps_smmu 0x840 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x18a0 0x0>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
2.34.1


