Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8394CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=; b=pgl8JVb3YjMo4sh0b22Z2RUFZ0
	mmyC7Vv1d2zC98Sf997V8SYMf4+0vVF4pLGwel3g7EMMKhp+6F4RZUboB7b9qg8pO8ufPmspAqXjB
	GnokQFyOKrwSmDc/RRwf9uSiLB8/B7wNWxlY0r09hUBtM+CrZS4bSrqmaIZWdJm4nRQj5H3hfYW7r
	j2opXSdTLui2xasRePuKh2BjGwB3GPu/Px9EAJnPYj8/EUjB5ZBTQh9+PDE4mcASV/3pimyl2YnBG
	F0WxWcD43/e2atZTpHymPrUVPQRTq08HxQIv+vzrDQ0lbWLZuABgan/fMlZ5rBkER1YsW8r/w+DS7
	AIcaBcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEqL-0000000GAsy-1vke;
	Tue, 05 May 2026 12:25:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEqJ-0000000GArT-07HQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:25:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CEAam2187756
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 12:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=; b=allamCO0vI7TADws
	VkmsVg/dDPUk5xTLfNNwGzjUMCPs99tz4e3s53RYkw7dTDwYAMhyNUD7wtfbrLkO
	+iyUD8p5NH9a6mLXqj8ibDCujaUSEvlLeX9CR5E+mfMLAXeCHSiL0WlA4hdCZhpW
	UkuJyayOxkbCeIZYNlpQKqkPA3WLBrJMNrjndH30ISHwuaTY8gmpT3GJF7225Zsr
	GyoCeZUTW5fLDtXNB9t3yk3P3aGYoqoxD//HckYLNbGzhwpje4SE7n8I7Tr+Iu99
	8YbvSCt2oIEXPgPMhYzhwMzM5gdkICUGILNHEMf2Dbkngce4wLrRBiv5tNyooZko
	M3a+LQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce00x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 12:25:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3652861f61dso935801a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983938; x=1778588738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=FSKC0BiwYDrRFoGzGfPFwvJsluY/uHV0pO1V5BZOTL8c0VllLi4Fi8ZOSgtPWTlWNp
         H6jYcji2qd48k9zvTHE0CB00WZNIM1cD8X8iESjecjJTR22emGfzBCNdf4/ZYEaT2wVA
         hUW4a4CAqyS7RKucGdMSgidIMGrQ5+ygMuJoxL9LPfC6zDTaWmoCwbcGd2/iNC2zlDa5
         WCxxHDV83UjPxT1CFzU9Oit+0a2F0AjEA6JDSmadckcl0eGepg6ozA5kw8kR7yWA8Ci7
         AkOnqp6DF9LYogtsrjGR/xo0FtF/i1nd5CU4XQ6Fr12/TA5RFdHNCBrSFCqY6C8XT64c
         /bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983938; x=1778588738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=K8j4qwjJC7HGuZoMBHnqBQVUmQ061BIZcwKrbig9ZLDUswswqjqehaS5R8CcvNnfLQ
         QDyksQnvBTY8S65+9phZwCTahLKvEd+47XKIlBJLeMD3xTBPKLOUAoM5nOI79eUju5XC
         sscQarYxw12eCAq/Pp7797JJI9wJSLkn6PFtZPDyFq2Q6b1KcboK5s2B8diKZtTfY6ul
         uPWArE8UZQdlOc4rbpl/6PuwJ/T0eSSkMSpEh74XfEBBN6YYaQr4KZjIieMGd2k4JeNt
         rQSODFH2oxUDSojo9EZfb3SkmnrFm9mkQ0RuzsWINptsF3vmyRSkUCUOqHCctVaLsCZ9
         4Wow==
X-Forwarded-Encrypted: i=1; AFNElJ8F22Jt/c3U4VAUqknaxC3Vd9bcmstV/FfMuaqIV1ReqJrKSzrNO4N3TlbGQXzy305BsUN9jhkXaKKmmbhDnnRV@lists.infradead.org
X-Gm-Message-State: AOJu0YzyegJ1Wlqdj88WmQhLtRHJBgKDmxm0pKFG1s0gC2ToN+7zTXOe
	jvtpq+zav5LxWeRanZ5DS4bUgUJHxn2OcVL5K6XRL9Ma6ClZ/FHB9c+At38Zz4twQAhuVGTub9c
	YyezDgAVEWFN0yYMH9fFEyatpJb7wjteswGWQ9FHv800BmVRmcwDHx/WkbLabMqnn5HQ4FZG5Ar
	x/RA==
X-Gm-Gg: AeBDietj1WdsRpFf5zHc5WpHtm7CfG+Zt7UND8JcPlstqreYDqfnK9761oAVbEC3T+X
	wtzMzSWXOGYyUfxbyY7wpw0JewYKkzA+2cGZ05Hhcl/dkPcwa58qU//pbY+kQ7QJBmZib1oGSO+
	foURGRt+SIGrg+jQoUm3h2VBYjjUl5wi1cduAq9+OjpGKu8vSWgb/02N8Ua6x/IsBNnOUgMaYpU
	odGcAE6LVXF8esImMif4cvq7gHFhcApE5duRUrs+JYkHv2UxcPIFS3ZgATgPzWeTASbA/P9DDH2
	LER21AQjpHpcrseqB+HG/KEcirosf6kEGr1gWzw1fA66Yxaq3LU8bJATCSpzaQy8jStJ15jWhvN
	VoDbsffr+5zcNEZ6CQTHg6SXlacrFFpAQihL6pCRBQc7dkDsWR6pfjn/vzdF4xpA=
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148874a91.1.1777983937603;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148832a91.1.1777983937065;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:36 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:51 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: lemans: add AEST error nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-7-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2483;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=NLhQZWVqdvbCGj18sMVaKtq4ki84eZ97ltTwhZ8fSS8=;
 b=AxeiR1PoOYSoH7YgiXOYSRmTYri6J2MZYpG/MV/d06jya9y2h7Kbv5MveGf0exaihAYq4bCo8
 76Uu1Oj72luDypcGDUDV8xei29hbuhNCmXFO8hpt2yop7HOiOOdTRqC
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfXzQottavPGfZv
 gLVtC5nxqLRx0TgjGJlTRo7JOP5fQzp0lO4rUBLXjnCc8N0x4vY4OiNGg5eTdwk3VYxdujND+F+
 d0R5QHUunT9cJZguCvLiyErBteDoND+440TjZOeQlcWV0/WILG5rFyfjlD6CgANDwkYC5gJd39d
 I7TY/bhvH1e653MCdT4E++aplmNBLS3tReUAGLDf6Ir8RbA6KKqegw9EKVWLmFe9+81FWcdsGJG
 1Sg/4D6HV0s8YAfPy/w8AmrzTVTM01NHduUxIXqjssYlNnSXVOXeVp2ag0/Vxj4ITMt0nMX9dH+
 YdiXR9Trdj9IVFV5gZsHfUE08Kec0GfdpLuJsKI9nEwomTaVQ9Y91ZVkGt2nU6e4mfaNyF0w9hS
 2r47Rb1TonzAFXaZW6f7CTrl7MWm0qNHFwVYDcsfiY/ndr2fFHF0aMyiypsDzmNp6oRibViPltC
 +UAK2TCb9qE2rrwW8Ag==
X-Proofpoint-GUID: TvJJEDeQfCcxbfoDFT2PgCID9By66uua
X-Proofpoint-ORIG-GUID: TvJJEDeQfCcxbfoDFT2PgCID9By66uua
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69f9e1c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FY89ualHrA3BDT43sc0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052539_082202_AE1525D9 
X-CRM114-Status: GOOD (  15.28  )
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

Add AEST RAS error source nodes for the Lemans SoC.

The DT describes a processor error source covering all CPU cores and a
shared L3 cache error source for the cluster. These nodes model the
hardware error reporting blocks and associated interrupts as required
by the Arm AEST specification.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..199ea1f9a8d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4,6 +4,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/arm/aest.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
@@ -29,6 +30,46 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aest {
+		compatible = "arm,aest";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aest-processor-0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <1>;
+			arm,record-impl = /bits/ 64 <0x0>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_GLOBAL>;
+			interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster1 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+	};
+
 	clocks {
 		xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";

-- 
2.34.1


