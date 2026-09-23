Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E92C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=; b=a9vpyTaCarxgRDcZEd0B1fDT1I
	tkoHmJHKvmQtNtC9HqQvnVNe1M1QcU5gfgHaCRaM1jZykP5W7FUn3fbCfgfl3ZISKCocd3WlOiuts
	TNTO8xKTUg64rD8VCMWrr5TklQZ9YVfGFOXcLIyqEGEdGVTcvE3seMGo3/s9EUFXpJE9rkF0DAwSs
	eB0tYDQeEhkJ9XxIaaVY3LfiJaU9520KXsKWV+yA0Zt5yp1gTxXA+KfAEWm4EpS2NmRoGxAfA7LGU
	e5Olk5A0Ftp2aflL015KmY8cxh0Ll/1hWnYCtHVEps5aNhkN6+Jbc8UozbAyOeU5eqQ1UXui1neGw
	+kQS91zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3L-000000078kK-3ovK;
	Wed, 23 Sep 2026 04:57:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3I-000000078jg-3eTU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:57:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ijXR2116314
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=; b=nKChpZ11djQ5vCPs
	9kfJuPao5qE+xpQq7lxInnnSkwIl821UKTs2+cAuWdvCw0TZ60RpL79IzSApnpBh
	v2G6PPjdyzG1jftbHTD0ihqbw9gmCfguyJvV05xQh1/Q5wP9Hwfgv5m8DH/Rl95V
	JOxXcqZN7LmK/y/SJz2v/AsFl0Tuz0yC0Ouwf7VBapCHWKVsWVh2k6zsuCmkoYrG
	qq2YEa2oRDm2lQn2NgjE1ykZ0dVHoiYply0kGTDzixGj6YLe/jNQTAkAHWWUnyJZ
	21cPOW+7SVyFKZUbI0/2JUxxxmmIsj7tGfhL7vxLs8Wpov1OofCID8JCrpbaOA1s
	ltaasw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qs1mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:57:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso772536eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139470; x=1790744270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=;
        b=OkXs8L5qMI2GqoO1yNm2QHq9vGJtd7jmOgrve6i+Ig1ajZnfbmhFFbIZCxuS9zZQY/
         sG6xzEfWNESuH5FDfMBtSTAmFYtgQl4eilMm+/UvlSgybTMUXHfGX0A4bF5EIUa8vxLK
         irHNXAFwWBMl/SaYuTvexH80qFiTt47QU4E4d5K+6xNRsbJt7i8/YwJ2EIidEizxg9tl
         WRwmXWuiH2eTSmCGSBLiwCqOmJqyzsMfPP57jNS372AFo22WZdgpIgDBPXE8oXqVegtU
         LFSkUYERA0FRMOP0AS1JXdBNXdWMeq3vYWkQEhmYFO7ub3VRgFsbAcVRmmFxG4kutyLn
         ioeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139470; x=1790744270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=;
        b=z2FpnCVD4hZEHatDaxUMZAbAbsVPAD98V7Q09mSGSw5FVY+hGANem5Ih74e5Lc1mKB
         RK/cvobrb38kMFAXhZ5mArbarPO8zF8Iy1/0c325A5ThpQXMq+mpv+sSaGMwtd8Kbzzn
         S8KhdsKdcdY8K4m5Pa8T4NHlw9f6jmPpdqs+AegwWxUJWWNPa2o0/NG3kKsm5uA9awwK
         1N4dHfGsiPNGi7k7eZO6WKOYuHkcEyUKPpAt1nbplZ/QrDG+l9tFpgxxpcA3Uwhxujmw
         vECzW6fcw6Q6792FcgUgTI/m3t76U6FUaRqBdMIgnSu8ZR7ZHyF0sp8cMj69fRUtSEK7
         wMWw==
X-Forwarded-Encrypted: i=1; AKwUvBziH40JDoUP6N00aoGVTABlyewyAS+TiyKjiIN3Ct48on6DIX68fBtuva88C123sUZsvzdf13jibCOmPdQYDq9Q@lists.infradead.org
X-Gm-Message-State: AFuF++nJRMhzeaef9h6cMJ7ZZMPm0XTl0yOA5GC27KEwvB5/1/30wRLl
	TPIbJt9A8rpFKrjZkXGC5NdHLJFwGsZaaLpVCXo2StywK40qrmjJJwfPQAb/r2B7rWAlt/uixPa
	hS1uIZW8qnanncRq9m5RIPQlwYjo7mHEMyj75kwyvTA1Wxb541MNM/pgm62NnlA8wMFiaPBunYL
	94zw==
X-Gm-Gg: AYBFou2NSBcV0zDCjfMp09uOWFAgDu80dmFF5BwD4a7dPj873dojadD/u71aSvD2Buf
	W68dsxRo66+prlH3uQ9d8SHXUwKVR4jZ2vZbQteBEI6yqonCbAPik87kBYaC5xv39GQi330Hmms
	PSaOMWolWvK9x5bZGCncOSf3K9/3vBHV4fOsibUCjDrDdU6j+tL1fpCqfBxSCe3CeJ+77JCacLi
	QkFmmX0cMhc+M5Ytrrsij+QFb2bhn//ivjQW021CeBTUEVwo0qX+0ROcOaiwZWGOkxYaZCo8kt/
	5qGRCqufSH4DraaMcPgpPcqFYKR66ZjLJRTmHvp0Dd5Mlgw8HMiTdV/Q2Pd05l5zpL6QMjzunOw
	X/VGGiwmHwp2EibqoR2khUk19e8Sspw==
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1164958eec.19.1790139470214;
        Tue, 22 Sep 2026 21:57:50 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1164928eec.19.1790139469640;
        Tue, 22 Sep 2026 21:57:49 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:49 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:28 +0530
Subject: [PATCH v9 1/5] arm64: dts: qcom: shikra: Add CAMSS node for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-1-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=4132;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=7YcT+Mp4N9oUEJJb1R4A4tqL2v4DNSxfSMin5F8lmwc=;
 b=wI17llcRZ6hPMzQxO9isLCj/ZIjozRDvqEMslZcpq/PnsYIBKC8Z09mL6WHI+o5U2d2RpD3gv
 f7ChzzZJ5/vAuJny62EAqok1ig/I7UQnY6xJgJAd4DQ99hJwJxWuLtM
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab35c4f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Aep19VGDvhHTtQhRaYcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: q0XN_truT3fRHKtlp_3uujCcu1gThf1Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXxS9clMSGyUga
 ZYIvX1IqtUdpZ2cc6VGsye9DmSoMEuhm+WdNvll5Ax1E6YXuelhAayLfUzMg9yu9UYZiQnbBZbV
 1knYm7kqyPyF/jUfh4NbsDjKUdOE3sk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX+auEHiNHllBK
 l+Mtv7LgKEu5CpQ1C+lHuhdTOEUbnk6HOgS5tf+nHhs5WkTQ4rzVRGfAiUryjTPQaOnafa42wYe
 Mfax3fwCKLwKgeMvtUOVPwi76FnKcU7fAnR+jkF9vhBMUwFMGQa6WQA7JpeKrV5QQGSmuYHyC95
 HauVSMvwY2M1Cy7CmD+J6q12YDbqelPxlsHgqZgI/l3pfhHk24YUfTdQ+05Lg5hiTaYxQgbgDCz
 W25h7C2Kv+Po63/ArL2KW+cSEEUxBvhb+i5xa8MB0z9pvT30mgXCheEUYafOG14YNofovakXdrr
 yFZSWXTfoSiShBmef60lQCJX5od4ukrTeaSLZOiHHXb4yHOnTvBAe4GMdCMtef2QKTAanq6OErT
 CKShmxlkAuGFVO3q5u4h6bsdVlWFQ9xr0W2qyOymnjwzt62XMRHKmCIHbAFmoiNQh8O0XS+NaHx
 Nk8ER8PKzh7pvXVbK1g==
X-Proofpoint-ORIG-GUID: q0XN_truT3fRHKtlp_3uujCcu1gThf1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_215753_141777_A188D1AC 
X-CRM114-Status: GOOD (  13.66  )
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

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66452c6ee1b10f3ef12c20e201b5ce..469023a22818962abb394f3ac02752f816efc839 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1977,6 +1977,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				camss_csiphy0_port: port@0 {
+					reg = <0>;
+				};
+
+				camss_csiphy1_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1


