Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5339BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=2z+D6zoLTmtwKLUSJ4WD6EbRSH
	cXERQyunsLZBb4uq1XTVpjDOySIzg2a8k9jlLJ43TX8+fYXFOoEEQ3CoYIukxTPBgpoJnsoIalIyS
	DIO5DENsd7+cZKbthN8hoA8v4wqJHza8Jf5QRA+vF5ij3IF1CWhEvSkzV22s8yRj+Hfd/bab7LVQX
	ySV+DjrjQAW5b4ZcDyazyq88XY8lryEDxA+6A25e8BLlmI5AUlHsnZ7hUM3DQKapzc0m3Je4BSBFt
	QZlTtH7oK1OLpdZvqhbwRVy0awDyE3itrfhpSj2u39zNxpKFY1RDqqeiaBrOdvthhVJ+VXKbCpS0t
	y35wt8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubD70-00000001PI0-0qwV;
	Mon, 14 Jul 2025 06:56:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCis-00000001M8q-30B4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:31:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMfA5Z015328
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=REri1KZsMJ77DhE/mzGNl/yqghY
	bjAKQfWVNbtNMhWurijssJEFIglssVxjxE3c8Q76RmtNonXb6LTvKOM6lf9s9/nR
	tIr+WY17CuXYD+O7xxrcxXTVJ26wmf89Y83+DWWuKzI3Y0q6ah4WMXJk1xwenBz+
	kJLTlRkjl/hGVOabI6ydRY+p5oXgPppFeE0dNec7pd1fv158lliauDtfCNDv20q+
	zfldsXS62AYhpxyWe5vRUoBJaknT8diMtw61vp8RMAyI/BQ7+L43sciQznpjw1Tb
	JoH/gl58l1dd2v5VI+NioXMu7FtmiQoftZyb1F60+isdFNvFxltvU6qr0+A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmbgxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so38148895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474692; x=1753079492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=AWzrEDxlBudkH2cSP0XoUM71lVnGkicxtBthWXODph+BMqtGxkM7LFKpSc1iCs+4Qm
         GcybG3ljl8YdDswFcwuO0h73rJFAaIxcNkgbonqraVmoolmXfaG+Lw8ghtkameWFGA6T
         L2A58E+FTKW+qraEMutd8AN1M1lOfQ8kx47dwId147Me81XNBm23kJ7sYr/LnoHcRYAM
         DiV7IkBj9jRO9Os8EwAY/FmrVAMmRCecwZx+GekQnyPsqulOblj3LOl25lUc4XGMQGuR
         7VPHw9JpT1k2jey60VglVQTHcvHToTprwZgxDN9FVdVALMHKkCPl5lcGfDoB1HkPR/Qx
         8kLw==
X-Forwarded-Encrypted: i=1; AJvYcCXR0avTwNjMCFH/kXMfDdGXcmdvc6g0FLse5zrZlTRPYU7po2fT5LwKYTGjBHkr38otvHUc6EK2+jeFBBC/N1ip@lists.infradead.org
X-Gm-Message-State: AOJu0YwP+St1JS9NaZN3m8RH1pZPUj5I1NNfHMYy1xqtj/7C5etDK+Eg
	1htKEA6Czsybn5BhHdKS4cWIaKD1LksBonIwmnzWQbnRM8p5sJzhV260/hTFPIWHRYn410uiatZ
	4HG8LqlrlMPU+R2t9Hrpl2FvY3rzHBG7mQXaza2hzbyrAqkhIevBx2RvOper+xaNwjkudPXsU0w
	ccWw==
X-Gm-Gg: ASbGncuwF3Vxi5aaiDOxxaHGDshM1tFfs7Q9rzIm7C4U0QzaRsogzfBLZ6BjfiLwSLC
	+zZzId50tvmeYvKge4LlnoVCvuaFfp1wW9F8dy/ccM9KZHAdjjV2LRpU7HYuZ3ziEOKFVslLdPF
	sBlE4CfLnInkR2eErjrJ+rzMrAHqR78L/CBwKByrD6bhX1o9rNfurkf7eri9+tkmJpSAjgJOCoA
	QHxqE5+x9FSCYM9BnUyDSQeIqPHjkNArOOazDAPfUb21dhIXhULCxl7IS5m7eup46W2peFZ02Av
	LF5PRAOUppu+qqsWMM4N1d6lCN/2B0jc0wTvVVHaIqRF+n+7aOEN0rm5zc6/NX8Yz5EQVMcVXko
	3dO7nW1mU8Y89BPTzCxqE
X-Received: by 2002:a17:903:28c7:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-23dfa765e5emr90913215ad.22.1752474692466;
        Sun, 13 Jul 2025 23:31:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOmP5t3fkfcxu3Np53dQRkDyb6/8A/C4Ok4Vy8jn2surWzItc8MyMms0KNLD48BFqUzDnsfQ==
X-Received: by 2002:a17:903:28c7:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-23dfa765e5emr90912915ad.22.1752474692018;
        Sun, 13 Jul 2025 23:31:32 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:31 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 RESEND 03/10] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Mon, 14 Jul 2025 14:31:02 +0800
Message-Id: <20250714063109.591-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=6874a445 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Da4nOvGJ3nq29dXJLfW0r1uy2FK5IvNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfXzpQ7M0+NMKJJ
 gZdWL4naZDfkasJLEsyfLJeN9jCX7FJpAZPGqiFrWpbtMY+sbqqydaTwKeDuHCCgP+J7jDlKAUN
 VqP2SrnVDLx0/zYfs3hI+XaOGRqY8IuQw5vBF4tqG41dsX/4700PRJ3Ld+XBZf4udPPg6UycMrh
 OnNmqgVSzZI+0AbhLBj4YnMpJciJo4IVslKatchTRzHJil8W62qhKQiSL5SOwxXCFdvsH7R7BdR
 8BLrbB+naDT2MrgWUICRE1yroc9We5+CToflluCNNDecxlY6uBBv3ztKZHC8dSRaFnyDELxeb5E
 DDCajPKtuI4ptjt1crQA8wkZNLWzwd/oAYFEUJVbxQ8Y8qNDNcB3bS4gS4giMqbLLUEcYrf/mEb
 8587jH2aBSjnnvCdMO1yKe1fJOdleVPmZ34lSHlhMf0iLZ1pyV7JCF+XZmlp9QkRp9vHvu/2
X-Proofpoint-GUID: Da4nOvGJ3nq29dXJLfW0r1uy2FK5IvNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233134_897973_090E32EF 
X-CRM114-Status: GOOD (  14.60  )
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


