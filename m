Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0A7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=nC0qOhxCnk6CirW2BGGhki8Jc/
	mJS76Wy+EuSvTB43GG0rS/uvIxcTtVE+XMUCCD1Z42x8jOy4o9Ng5lnC/77Hq+XztxeIesmdHE51t
	06+UeN02iNh1dypV25rMOLKaBqUTus66GTy7AbJxK5cG3yAKrRRRM3bvf7sreEMDOG8FIrlLpeLPC
	FdAGV9A/JTX08kkr9hzK7eZj44n6EWH0+rlpMF6LxKQY6PhKt0+N7AmLz+c1lRhTFJEHBqHa8T6pD
	8z8jdlmy1DwOtgA0S2BySMvxpQXXbpEXQIVNOA3jaq1YNHY9XshHi9GFmrBbaOjJnjW8Mo+Vmhc0r
	29cbzSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGT-00000006uoV-39LF;
	Thu, 22 Jan 2026 10:50:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGS-00000006un3-0nKI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:50:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M72Pxb817321
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=pXCFtWKStN+tJu7A
	slfXABaU/YsMvnGguwvei3HFptmC3STtQRjRQuArIpsmd71xtHvBIupXnvrDEhk/
	HMhyW10V9h3wfCpcQqgx0R2S35qM1i9UTiZlWSFIM596axDZown207KKE39Ouz5s
	znemym+CjIADeKUXiCvJk94/7uhiHaD2dtpcpG0x+ELAfeAm9Lwu1GxZIpBSOogR
	7HhOmno+IEyqC2UrMmKZ1KdhmYxhD8SAPbVANDLhebjdJxnGXgI64wJROYIHW+6B
	suXkBJNTTIg0ed7gt1AgUIb1d52GYWxS+H7VGBkwgOvoreIYeksJxBqaNH2T+LNc
	WXtJ/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu65v270y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:50:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50147745917so31410801cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079009; x=1769683809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=c9AKDuyx6VInrbEADJ1ekqhmwrPbhzkNTN4kz4wB639nxr2vjwTTP4kkD6bENKijiT
         ToSHirrwmTp55D1XSY7RMbNEiBdWlbkuf7OdKsAVL6BX5EwPJ6nolqauLLMw0DmabJat
         tOGTJGEzzD9SG60i2xedfK3K7FdL2roHti00dfZTVZuiu0YUzruzfGj3LVPeTp/jVS6O
         Lmd3T+37/F8QtGSp4z5B1Pdx7IqvZTgahSGE4RTVbHhHZOAzFKZx2+vD/Emf7OMSxzdk
         OzAt8GNqsZAkxiQEnnxTAteCBA4qQzBaRPi+eUEgX2PwDkc/dy8tb+RoxxnQPkNHnspx
         5KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079009; x=1769683809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=U3f0liBwBate2iw2YGsu9Om/coaJJoxVt42ctgGlsgTQrY3ZmYKZPy11Xn+jqRWlWh
         mU3glEVpvGErd43B6d1HPeD/n3LUP2v5RtHUHOS/x4VBU/Q5VbkFxl1FkmA5DC4M+fpU
         BsjegDubjz4yNOIZ0wg2U5I+HmzC0doSkEoq+EI6HAKnGv7p2Lnb1bHo492lsisBmbGt
         YkOgwnEtc8kl4F1EvwonwYNwnGjBcwBptyjbNpwZre4MPmEh864swV4wBN5X3cSf0jha
         Vkp9ixfWyWdHy+Ar4d4NX1b3G1JUJpEkW4Ewr14LPHUssuIfTbS0Wm0VzDzXcGv0Exbm
         lEFA==
X-Forwarded-Encrypted: i=1; AJvYcCWq5HAOAkCZVnQpMEaLNvfxSkD5yYZd1JrdrHTQ6TtJSXtjGOJeyUXQBF+/wT4YsvrLODAU9s5HBVJ03U/IW7HA@lists.infradead.org
X-Gm-Message-State: AOJu0YwIyHzDH3krMxPJZ0MB+u9cMla4UR7ZivBfvn5XArFAAKCf3AHy
	7WgL7VrNgTJBdUYSA58y5p5XdfBfC0Jri43VOVk/BVcYvVBjZjlICX1THiXwUiQhx+/a4EibIio
	8Qo5G0CH0pmrWvV9jaSpBqhA/hNVQFB9ikK3vZJN3h9UMViT/Ihr33hCDb7W5WBwTLZgKaECIme
	tVZw==
X-Gm-Gg: AZuq6aLKwvzWaP3Wt3KA6kEIagj7je5k7hFRV7cj/lmo8ncE7R7cg96nqD9jsUyCRRm
	6cow5VIXBLstNP7mjwVzX9DsTRpVZ2ePrebPs/EVwXiFvO18zmlWTBTurOrXKJLWIplAR/mYK0e
	dQG6trkDne0VJYbnjdEDShlT+Cxeh8xR1VToEM/Z6Io7ZdOlQ4bAjDq7ahHT4eNghN4sto8MlPb
	2RJbkfasEciB7XBLv1cI4QZ34vZmrkwz0dWUerkLlBYxXVSi6uIiPKjjlzw1xgHZnzzlL9H7NNx
	qgaxn+KHMaTxfpxCQ92dK1Y/NldDLP73HNW6cVzUYGBP+R8c3nFRC5LjoYIltPXSeCbqmh4rgnl
	MHbqJW4rWAL97RnZBBtN41vNtTSwYYOY0pcw8WU/7WTw6K3NNhiAZHLd7Sg/bPlMr3xo2/A6lKW
	7L
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886801cf.22.1769079009363;
        Thu, 22 Jan 2026 02:50:09 -0800 (PST)
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886531cf.22.1769079008952;
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:55 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-4-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
 b=8b2oOOOPX2SdYaNULjliR8pcPHELaBMrn0YzW4Aoq5mhdvzr1KSJ9jHs5y541HZm1Mu/hUPLU
 0xawCuOjhDaDEslehWSigU9NBuW0C/AQjJkIfSeruRcugbj2FeHIBZz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: UZpvXXr3LoHRw0lnDVW2gUOsz9oLFOd-
X-Proofpoint-ORIG-GUID: UZpvXXr3LoHRw0lnDVW2gUOsz9oLFOd-
X-Authority-Analysis: v=2.4 cv=J8qnLQnS c=1 sm=1 tr=0 ts=697200e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3OCBTYWx0ZWRfX4GTwkcXWobno
 ZOTAphbQYKNzEsXfzXIDq/Ci9MrpMScFrbxVbJXmUwrpNiAuDpO+OyFIuC7LcylwCfQCQNRv1t8
 7Q0JpCN+2QDtMMb1hW5Ub0gbu4fmxLGMENs5aPoXTHGRoIJz6r1ECnYBJVzUBvsqaGKr1P7N0PY
 /Cl9B1HANTE8VOKP7R/70R8DEq3CGSQ/Dy+cwYSxRxU4HE2L1InHiTMF1Z4Cn/kRdkrfMHOEbqO
 HTvoUe/bAX2haUEgfE7WnTDta4LvUcDEi5xKD9Elp69vRro06xFyza4UEGEThYU378sUWOH8gcU
 rnLeDriwAZZWDiKIr5EkH71SmURlzm2MfA8uBfD1DawObjF0D6haKVuGbL3D3coA+57yFl6Ee3E
 Tuwe+1ZBYzEPDCjOWS9+rgMVrvpaKT33TjcrKWjobsO1iFYzYJ4QyzLgP/Jm58dys1YLdPVYPJ1
 9+gr4GW293Cw/Aj+SFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_025012_237589_2B454385 
X-CRM114-Status: GOOD (  12.27  )
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

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6d28096e50546855bd762e479b66ed6214ec5d65..33897994d0ca8a193acfbc94a932551a09c712ce 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


