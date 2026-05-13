Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C620CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=; b=CwjplG0Qy6J1MNrJAUhnrFE1cS
	c8oBbuue5ZkhLIBSHCuKPI54QxT4ercJc/rCxDdkftaibWuPF6UW1HYGh4EYBKhNOHSrFA2cD8nkA
	zxQgZm87//5D4Z63P/RDlM9LawFtok5vbsI4rM7GuuDJD105Xsne2BoP1tNMoPqaBpQVgsy55Zk0i
	pq+XjV5TJKD/TOWuneOPe+o78faqK0D0slsOjfhxHxipXW4nn6A7vsv4JoHXji6+fxkUYM2fmN66H
	resZcOW6P+ROj+5z7wKCKWfTMvZ9zgH5ZfnBHOYBeyzva6CtV6wVA0/G0cuk17VL5FlXXXU6y2Zhb
	2mlsP6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBVr-000000034YD-43SR;
	Wed, 13 May 2026 15:28:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBVn-000000034UO-2z4D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:28:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVjRw1393025
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=; b=NugxWcVnbPC0SIzn
	jD5buxOhkIkG+XVwRsLyXqay5wcrGanDz85Q6clFz0r82jB+Wphm9XU9CbqvUJ8R
	ejeqQKBmbdZ2hmq1qu+X4yMjce0bsYYG/rq7BCPftggA47GnmyYtefj33/gdOb7B
	stbxsiagNbESjC9tq2udMGWmZEKqtuxwXwewIkzd1kEl3CqqIHLkHJ4uRzZa9xax
	nDU1miCehQv66Zmts+T1YdaaJp3N5CkveTe55KjyvGa6buhpDp+KyQFl4pNfdm3l
	TFzHkdgr6bZTyMx4HavY7fwqWmaSRwOwJ7JffNAClPfUjqOUewkTWJRTMps4ksRs
	sYeBuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262c2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:28:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so4914050a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686119; x=1779290919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=fc/9Q/xWNyx1yS2hVSfp+27QbipKHwNSWx7/E+we7Xo+JaZMiQLSnFZH23KkOSe8Gp
         4Kf+5Xm3jLYqx/9TP879LXmVoRZpvLtM+K3qGe6dLt6GR4uxdipa2GhmU02Ce3v23NFD
         rq/Px17N91BEcNlWXuF8s3roOEVd35E8AQM4n/kXV6m8HPDMekdyfKUjmyMMZnPwC0gm
         qT+ngafb7J6uNng9bzj/Pc0R8eYbkIM5LrCjWIaGqwaSfjeEd50czXvfQmrDFyGkSp96
         t2bqpyAGVgtMW6UVY3AfFhHG661irrtk7rUkB1V0xlcoQKJfL7EVys0SbLUFnXnsOmQs
         r/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686119; x=1779290919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=AgM84S7q+cPVQYCmNaO0c9nOWMsqCpvbuqOdOCuYFRkNN0pwUBufqW4ZlkTYRbvEPt
         a1M6XzaqFBZC8GWMk6/g7M7o64kwn8LU6DAQvvcmJNtekY70VInOPxjEZUWX7HviJJaU
         RD5h2Hovz2fKaXpHM5oiihoAJKpcE/ij7wdWzNLQAX7Oh+QqH5MKEypu4jBIYrrlQVWe
         os44iOIjmkqIAefevwck9zB4QJaOv+ilv4sbUNs6JWlfHzgWER/WmFyinKgpbLV6GRYN
         /zJqtzHaAgJVf5WBphnDi5YmmCmpSL7rsaSPPU2AZQibpVLza5Q6IKj/VT5zYzKS2GbA
         CC0g==
X-Forwarded-Encrypted: i=1; AFNElJ+Yg58CaIGbgfe7XzEDjqKC7q2aVPIT92OmyKEqFYCe+sUxTDZFdsJ4U3GHF2Uq6I75B1ipnwD7g/jy+sA3pgfO@lists.infradead.org
X-Gm-Message-State: AOJu0YyLwpVpJsetINwHF8Of0yTwirYT1M/d1WcKnubWkxJbRXBqsTq2
	yQZL+O+EF/01h1skyt4p4itB3sqk1GzDbAJcHZRmhBqxnyrBhayDqNPqvy59pISCFFmoG1FTP9g
	2UL3sIoIbjYEXEg4O2gTbmWtrtI5IAiwhImphd1KTrihx1xTJOYPIzYEH7J8cfqS2hRNAnRmynm
	rWpw==
X-Gm-Gg: Acq92OHRGMa4SR8k4PEtoVt+y0PClVJmHzKi4U6UJfKmI7Uf3njl8JGSx2ckvMvznLY
	LWbVPGTZdlNu6a4Au1OCkYpDDZpdF13L/dSVCIFCv8jEPJfYI9Miw2TjNZvnX/V1tZ1jpmvmeEm
	kBfCODQDEa4szZvWla6zx/jb+LRUIhMC9CIebE9U4WCnsqB79TevTRxl7oYHC+m2krb6oLmFcnE
	6cbpMstV/TOnSko6Bal5uUbRleH/tOLWVH3bD7PHwxjamW3OYDmNVuHjcaTpR2ll25F9S/5qLh8
	jM8NNKTA/f7TKmZ+bOgGGLGOZSxrKolGNFl0mGKjOn5Tz3nzlU5OarFE/U4t6EoDJU1McOZJWRB
	FcR1uq1VwAWHQojKDpg5Sj1kIgMn1cEctj8KAe+oDAEQ93g==
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80738265ad.15.1778686118572;
        Wed, 13 May 2026 08:28:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80737665ad.15.1778686117892;
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:42 +0530
Subject: [PATCH v4 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-7-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a0498a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXx15dK4qZ8D0u
 EU2oYiVtMArcbbS2YSNAEsAZRdnYnQvRx7JVqXxLdbPx+3kOqH0v9Y/fEvZtald84TwUyVqGo/G
 BXDJlVTIXmVCQzdSqrV+wobBAdeavde9w/lFFtoHuc9f10FpmmCxW2dZv4R6F7GBE8srmmsmke3
 JKqPZezH5CpwLzPnC5F/Z4pp4R4/Gj+ESpp/ARbVd7XtWsP5CI6dlH2Onmjhxv7dmY3J+crU0gE
 iftKcruMJsh4vHCaYX6jWUkrblJ1f2IcvzUxFBKBPHWBJ/hYTShylu18fjMA4zL9OJSltFQm6o3
 dYpWgXewQRbsrOJSAYnMKfXhJJ6jollYGi3eJ4RlH1Xd8Uk5EASRyBMq4lpf3KplHOqnHJXPerk
 K6s41wAmasqoou9+c/usXqwf1Uy9Totg6wlE3XoPKKJ/BIwmdYTpBFszQy4LlxUBqzKGFLn8Jba
 GcjEvcDpAgD6fq8O7vQ==
X-Proofpoint-ORIG-GUID: 7vOZKwdd9eZEFnWvveEYc1v0TAU3SMF_
X-Proofpoint-GUID: 7vOZKwdd9eZEFnWvveEYc1v0TAU3SMF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_082839_761386_92B4A622 
X-CRM114-Status: GOOD (  13.77  )
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

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..1a47eb2a865717dde3fa0ff82665eecc8ffb87e2 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +878,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1


