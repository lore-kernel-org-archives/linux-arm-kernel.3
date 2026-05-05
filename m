Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC655FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=; b=KfG0G1mhKCgU500yUmcyr2L+xO
	ijOrtzklNhC9JOWe+1+5WTvX7grfrF6VRUtABrTN3pKqYHOEkV1vP+Vp9wl2cQP/eFtul39XEq90D
	DiQcbp7azdul0sRXRhAXv6zRIA61CWROizGlDgnhBYof4Q57FBkqJhP9CLXSe39KqQoWh2fF64/Cp
	qSb62CFUDXMPrj/l55vMBTOLe0BAp7IH2acQEBithOr26Pv/BhXlhOQy4SX9oYGaP8Wkg/dFsQwi3
	QjExYqXiMEPfYl/UE0XGVlt+k4+L5hJYiYXuuqYbYZPMLLBJ8jH4mfhXOVBBkxioA4J4Vx5LzZ2kv
	hB5r3GKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEqS-0000000GAzN-0ssL;
	Tue, 05 May 2026 12:25:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEqP-0000000GAwv-3KQt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:25:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456pP3D331251
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 12:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=; b=elXwbKASq3qWKy3v
	e4Npmt6BrwzXXhMyMhh8mMOfkCkGaa2hCjj9DdHm4ZHNhyPS/5nNEZphaOsBeAMP
	hya9Due/LQzDgnRGwcT5kieWSAqSpbCj/xWXVlr0c7NbhYkgvZ27AVLgAyqTrLAY
	bJ5EMqtI/thEr3G/LluNuy7EGovejlgM50GPfuzpMeOlCX8mtfCupYjbFLPRi1JK
	XmdIAAY+kFnEKTGkMbduOMFMw3DPfahp4ME50z27QQ85SXsmBGIeEMnFYnYReP+2
	vl1kl2hjRBn16/FflTPzhJFkVaVVyBIuPvMvZ/syTEJCJZxdKBFMxLac/pgK5WTy
	eFqcNg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1cdmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 12:25:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353f5242c1so442858b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983945; x=1778588745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=;
        b=hiPxQKyAjdMbRIOLiql6YVmuyjxXUbTsl6L4D/XAR96JjryhPqK5TT+16SlN2C4Y9I
         aTP01OEi4rMoGjYQUo9TedmvdsFgi5fN1oOG4pBikOdEbjEE9ipG1e3YGTKnqG62iyfV
         qWPgtWP7yxKfOLXKgtyyNXdmf0rVEivdMnXhird6/0bLDPRb3BoBd7Xj6/m/W0VO67EI
         w81w9NfmnfrAQyTP2IJ+KP4o+Tx+OssUf4QW+078J7nUZ78rfWzGqFPRTauTd+bqR+BN
         64iWIlIbZ1wQ90SExCcwXSEAfozPfIr14x7W1Ks1umQaPOGPuGYvVeGJdSndfIUWRyI+
         MwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983945; x=1778588745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=;
        b=sXO0B1rBHilE7ANqQuuXYSSs7J8sTCXkUyNeQ5/q5qqdIWUQs9+7DTmW/LN8s+zOYR
         ngrXgz6xqqLrhPIedt5Duj0rgpkKCn2v7l5yoo/T7Lp3Ji8veCGryO/sQ3R3w03VGbQu
         RV8Kh/zMin458aR/M5jWFc9uXkD2FR6nK6NKg1186t9l2YtuII9Znr+fZ9WoN2Xtaz7N
         8Bqli89j5QSb0+RJ5d63Hru5kcU0BEu7WhwEKzsRmA02Qt9zXWvtjZNu6134KKMvQJ4Y
         5EkQ6pFqvMq9CnF3DQxgc0CNQg3JtrTH3UBLnFx4TDoECQey7aQ7YF+wHnlBlLArMY1M
         jJ6w==
X-Forwarded-Encrypted: i=1; AFNElJ9ZuCPx+C9ERq3YUccj7jKNhBEd4yzhqVcxqb6ZVCynQ2Or6NNwjp7Omcvamx5uiqIm1D20WY9BdO7eLlR9gAbi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwx1JomsNsvMV0T2Qq3Ue4jPFerFBEp+tHdB1i0brSPoQj90rP
	Jwhi1inuHgriAPu1+BacQoKUNQc0FQAg3DbL3rnxkc9Pule5pNREjEOPM8gIn20pKTgDnX+vQHo
	+9UWl59YHJzUggEcBEHx8tTn2OL05aSjl50ej2YikEmPPbF/4ld80X/Sg3r3fe5vg89ynNKC2XZ
	gFqA==
X-Gm-Gg: AeBDietq42mmKVMnfpE6YGgidJEcet9VQqbIGSYYE2e0LJm1ev6NxvW+/dtyE0jZyip
	ZpnwPhmoHBsqqdpvCL2hT3lU/xyyb+kV/T1sq2N4FmtpDE/2czdIcMs6iFa52oRFCNFtVZusA5p
	Gb4rgMoxGC+DQDLljRIydKupQuwQShqa2ZPDMWK6Bg3Ufuscpj18aS2fLpMujtvhtXQlZ0BDa1R
	ntIPkOctlKCKC5jcBPwHE02/aDoNlgdLRXBgCJK3aZ3ousvjQ9/aMWGkiSKzV9N8NnxYJWYRAS2
	/+KphA4aya/zTN6s1XOiqp0fB12O//rWdad/Ph6h83Ht369qqvhKPjTWZo/Z2SmzhD9/rmzIzRf
	Bx49VIs/v7I8F04rEtR5Sp7e6NxKMJMUzS3RYcWk526ZeLY+ZxZ7HjxZ6pHIKhZU=
X-Received: by 2002:a05:6a20:6f87:b0:39f:6343:c6e6 with SMTP id adf61e73a8af0-3a7f1d53191mr7943165637.7.1777983944529;
        Tue, 05 May 2026 05:25:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f87:b0:39f:6343:c6e6 with SMTP id adf61e73a8af0-3a7f1d53191mr7943130637.7.1777983943895;
        Tue, 05 May 2026 05:25:43 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:43 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:52 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2471;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=YOcZgnUU7aNUADZbewVlvFKcPy4NxigrSCC0vnQKVC0=;
 b=IHRZKVkkhxU9y02nDwnaD6SzrjQm04m+20HXWuq2/N4sWJObINqXltUQZ1/qyBP+tvKxUc5iD
 JMepAm3K+K8CN73vjyA6Efr0HTg9ztmpukLEzg04lLRt4vmu3gpMBMM
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: uFhbQuN7WU7bjt76eIC2S5kSoZhE0v1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX80GheYTH/Mgn
 97uCvmewKBdPb2chEAspH70pU7hJEzCOyBZfxHLNfDjkAYT83qqPnphJ7FxC30GrS3uZEsrwOXz
 zSrJn/YhjDj2vaLRqnUTNfJna17WChMIFy0hPww39N8uuLWl+wAgDasRhoZyCtoLKjsi98LXL+k
 zUuG7F89dC/83TS4yiUnzWJzVklFitIkak3+5za/AsYuooEOrTavaTkCg2MyiJ7EY6qChiWdvg/
 D4K3NZ6GR9w/ULXKxlJ8g6PkKewCZ7Z7vWfnZhiPtQMGan+jkV3R9OUYWvIeT32LYiZ+LXl/GS4
 CxCtUDhzCL+rocWKZ+gjRoItJ70bumA3XUNVvSViXtbhKpglAxFy+ZtEvF39xK4LwR3ZdYxfREM
 mH1z7LtPULBqFRi7F7OXNugnKnXpMP5zzfKrb45JRbuT//J4HMIolga/Y276rBHbb/uFYSv7CyA
 bCNNpqrlMhX9TE4XsBQ==
X-Proofpoint-GUID: uFhbQuN7WU7bjt76eIC2S5kSoZhE0v1s
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9e1c9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JAhf3ahiasQHMHGiI4QA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052545_842161_A8B44986 
X-CRM114-Status: GOOD (  14.77  )
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

Add AEST RAS error source nodes for the Monaco SoC.

The DT describes a processor error source covering all CPU cores and a
shared L3 cache error source for the cluster. These nodes model the
hardware error reporting blocks and associated interrupts as required
by the Arm AEST specification.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..8e43ceed7d84 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/arm/aest.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
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


