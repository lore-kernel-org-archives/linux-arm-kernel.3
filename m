Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04500CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=sxdwRfYc4X4/c0xiTuxtf1Ifmh
	kEtr+T3veoHj6UVq5DKJDUSjhVWz0fg4fMGKhprgh0Iz/0amG92JCRERT540bwQKhqfJsOWcFlkzj
	cfHevaKQT/UU1lfO9ozWKiSzsNUk8MmTerdls8wDy+O5ZO+EQ0Pi2OWYzcMkSW6oiA42Mu0xESUPK
	Mck130GOKtSknkRujFGYcs48iOfKKecV9SWFN91TSX4HoCRlv5QpmYuwi+5b+H4uBj3JFH95FrxRU
	wH8MJld2VFYN8K32AwlKtLjYKy8+HEtAg+4hCY7XdKYU7kq/npoXdCVs0UnXZW40xN5DwOUziBYaW
	pczEnfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloH9-0000000AkyF-32sd;
	Tue, 12 Aug 2025 12:38:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkWM-0000000AGUw-0mTJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:38:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4an1B019037
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=IN8uN/DtQg/dumPK03u2KI7sh2W
	MDnlx8MgYFxExuf6GYBInpzJaU2cNtvwytNgVdcwgrE2QMrm3m2AeLm66R8g9YyE
	ANAwosSIErq20mnpnYjKB0uGBI8sPtIxEw8lh6Vxfj+c3Ile7sGrAFHPkOjukhqn
	IeOMhcNWPVKGuDil8jqGmKd9xtdcz4IzVP0Mb89ImdGnK4L1C2jPoZ2JVHRio3xG
	daxFPfFxfzKbC/jQ3GmsfiHpUZ5kxLIBwNEcl3PkJM/zmhrknBPAUYcq8KgPubwl
	5xS/Q7HxYv32s4EDFH+IlC5OddYsIBAaHCP05lJW+K/zbUL77e+vfTJLqcw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduydy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2403e4c82dbso42371215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987892; x=1755592692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=CEfvu1yZOi634niaXLHeQYM7BRdFAMn89cofqFyZ3SL/1I9ppGyZj7F2XMxYXPHJT5
         oJuD1GgLWZra86lAZmar4ajnf6mQp4aqygDxeYtwchEiU+epPfL0ffk4JTPEmU4sIPaq
         wSe7d4Kn/AoUWd7yW6+ApYmN6c8iG07h68NCpryQ1DlaiwfXCQN2cdd+nVr+y7VBTDpF
         Fa/2C+aG+LYuk24cjt0NzI1M71whEYcWBvOs4hc60aSLb+JMNCPL80dzvMOhmGrY/YAm
         mDMypjKVkjdc/hMZnervbc8siNnF+kdPwALrf2B3eQz8tpyV2t8QkaJo5rRsNEGGgaii
         jJWA==
X-Forwarded-Encrypted: i=1; AJvYcCUL3S4LUr3bjs1A77IJflus+GRZxYmSBq1QFc4MMxDIdRVqZoDZNwGsnYP9oRddPlh1IjfP+78iinuaK/7Owbgk@lists.infradead.org
X-Gm-Message-State: AOJu0YzLy5fU6nZlMi0xw6/Z3Cw3CmSccWL0LCefTtkPas8u5wAJHDVt
	VUofJi4+2C/SKuSIHLSrokqVW4aPdP9t9UC5mQyOpv4l+dfwh6Pv2Yh4zrnj6RpUtQDxZV6kA0c
	Qhhdq+sOUfmyAr3+h2lXiPPHPMAoA+gIvlgCHUGsS4SNlaBUYXti4COtFMsg2TWn9rxNlyunSNM
	l02A==
X-Gm-Gg: ASbGncvWx0o38+Zoe9JoStzy6GFNeBd+k3vRAfZjjdI8V8ig1kVUuXGqC1VnJta6yr2
	oHx1qvurGqOh8AR/JGxwvumoPib2aricAsQao8vIuV/0m9YIkZM/CAR6BvNQNsw3gU+KE86cnG+
	7HeqF4kmESk9dyc1Tq5Shku6w8OF1AjzdJyCAqaHDRqEq/alLEAi6W0rO4Z3N/fKNhyBhhBCLNc
	6jLrzmWp4P4/85DTF7h5XI70ZOV1X0iKA7nrptccteseLtYdsvGTg3mG7q1g4qakkmLxxpm3EhX
	PC8RKVvPnbn97WHIGOaeQ59grLvSgOcIqQuqxVjwavCedIVrEQjK1Iq1TYVQj4kQya0q+FIUqwx
	ksPlOuql0a6pc+H5F3P4=
X-Received: by 2002:a17:903:1249:b0:240:3db8:9adc with SMTP id d9443c01a7336-242c1ffb202mr221272615ad.4.1754987892024;
        Tue, 12 Aug 2025 01:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsrejQyQPUM/qvKCFw2RaISG2UWmCC1pkXJPCzFHH/tzSURwaSjJEvjHXBGqe+x2dQbAv5zA==
X-Received: by 2002:a17:903:1249:b0:240:3db8:9adc with SMTP id d9443c01a7336-242c1ffb202mr221272155ad.4.1754987891561;
        Tue, 12 Aug 2025 01:38:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:38:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 6/9] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Tue, 12 Aug 2025 16:37:28 +0800
Message-Id: <20250812083731.549-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689afd75 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lY8527DaMTNkbDEzQ6fimPSqwWTFiseM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXyBLMzi7v4ZU6
 HYJWSqviC2T7yWaAHH3S7ANccLdpUgp8udi5xgiBVea5E4IB96KsNuQK7yPFrknSR0O6WH2TI3X
 AJncgj4aNvnLXEmZMnFVTD65ef9FZ6obJpeamXtIoixexdNdKpokmLUGoBMuBXLEiV3Jdzd53Zm
 S8KNhLkFG4ttpek8ZyaLs1NyoDn0GGYdpwGuIAQlhl/PgbcG1S6CQa82pPhYeGvvATayy0Gq6We
 AXvQbc6nt3dNwn3QsVbzByjKz29UQyLjPBWOUfVnB0zpmGKeFa3ZNhhRKWoPzy9XgjREOvSVTMf
 WBill3thD2s3mV37s4PEYW1iUJU+DCcCXi+AEIrChakbr4qMwV0ELNiAerCYqY314ENLlDHV0CN
 WeDsY6ws
X-Proofpoint-GUID: lY8527DaMTNkbDEzQ6fimPSqwWTFiseM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013814_354452_F62FA2B0 
X-CRM114-Status: GOOD (  14.63  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.34.1


