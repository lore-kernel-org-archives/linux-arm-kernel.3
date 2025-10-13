Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D652FCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsycQsQDunAKAjG18m7RQFoGc863uQg22TnoWmsfuDs=; b=jRTiLc5oRNVHPGP9eXF0MHKf/C
	NFcSH+e0Rnr8w730YjdSqt3T3GH8oS2h9LoZh+oiUW/sm+pK8S7kPmbHXOcMfIUAtA9PsY6fUCxzL
	enlpdgBnoxmBIZMjbMd/kAfVgocTgiwCQWunbQFxycTK2SL6E5rme80kV/rMGLhYJdyZ7ePrMsLJs
	x8J5duvGPXIP0LhMgEN++kGVpMpa1CcN41PC65ktp6dOJP1oRgfUNCFvnEZXS92VE0izCbGIZyG2l
	7s8OfYIiayMBKVH+cOxYSZgNbmE+MAs2cxyn63NUXQFB2KB9OsxdhnNlttdkCl3wThKIkPMf1lcp5
	LjLoDDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRr-0000000CIOQ-14Qc;
	Mon, 13 Oct 2025 05:50:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRo-0000000CIM3-0Kmj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:50:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nMfi029629
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsycQsQDunAKAjG18m7RQFoGc863uQg22TnoWmsfuDs=; b=Q3tKhg0Qt6P5ntJF
	cOWwJnxBdef2kw45mKEa5vFAy6gxCnYYwjVnThfK8YxWpbq3bpxd6QwXhHhsetnX
	GzGldlya7rEkoFbxaKxpCuX0DvZzQ3jQPYTyg503j7kSscGFP85+WFuV4iCDUGzJ
	OJmDQ7xeu37aXwEct9Z62zxDy97je7SV+I95HsSkRm6iAaT2/UmaXqfsUEOsK5PM
	TpqOezjnFbusexdWPCAGiQNES+wwM+KYh78Kqut+FNRVmRjBsV/pw+iOFf/+bfM3
	uPQSDoZ6dD1MDxUHd1065x37Yu7zgk0sKDLu3JetBvSCLCeoXpGYR2GIpeloiZGg
	NVz73A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0kcb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78104c8c8ddso6680210b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334606; x=1760939406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsycQsQDunAKAjG18m7RQFoGc863uQg22TnoWmsfuDs=;
        b=J3ShXC3v6eWdOhTscyFnd4T3KDRLx651T2UGtDYh0KFMbTP/QVbf5V3CajFK8oC4fN
         GrojxR3ZfQtYTeciQ8LeZbxlunO2fZREBN/XCV4Ff9ffqyE9YY3L1NESdjmVplZu/lT2
         n+kw1oFeF9w/P43yN+r7Ss2KhA6t9SRCOSmyrzT/BvmB1LpaBi2aFwvNM04uvNpYxXYA
         STySyTn/RpzxI3oh9LcFfSxQmn/qH3l4/LeOajTAmKgUuHt/WnbEkQpbDgnAmgjHMzlT
         WZCFw2xHMfSM+C4P2YU1NZfE08tLmNqp9csvOBe9Sp8LCTp3U7JX0eCwc23IBWohwzjA
         K8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXMfa78LRaAaPwGj7E+Vitba+6ozdaPN7I/xnAn0RWCnBfGxL0Ag7k5XyGiPYlAhTb1bGteDcr1zFlJK7tPvZ/B@lists.infradead.org
X-Gm-Message-State: AOJu0YzsfVOJ66q9tUWH5j6BV8CApNphe9jEEOfvhLlMfodqGMTioMfY
	XgioM6phqWtCUglpKjbwy45zzcjrrNJG5pEmOUPkwQ/VjkDBHGzXuw3OJ641x9a2RWx014U6wof
	5+IhtxzmzZ9qHEv2KJMJWQdcQY7tIRrmr158lN+6bcS4ppxUnh5kXhQD6YfA6m5yRSN0mnw35lr
	Oy5Q==
X-Gm-Gg: ASbGnct3NtAhOAqMqdGTb58m4Va8YUZHeDs9YTcPXw9DHn8owweLFWEVG+F7jhUbDg2
	0oAKP+KLvamcwzQUlTWBG8+2+QnCkFLHvpb2XAAIYmDGc+OOwRshsZ71C70dMusAlKtUCFF89+B
	GOf9MEXii91iCp+nkYRoj9/aF3bfTZ6Pi1IfVZz2d7lvISB3pllGhVXYtON0y5c3/eHDooN9MRW
	olvvAVjrAqAREx8IBMmiAHNc1fDA7xC3EB5TXSk9/nqb+WFnf6E9oaUK+YvX8Vf+U/H7Sp/3nau
	dlSnbhnwIfgycw6K1YNwu4srewRSDZj2zy9BL0kBw19Whi810CxcxFC/l9nZZDdK2RixtM8PN/R
	H6QkvqGfWUnR/Zldt/y9SOEFj/jQ=
X-Received: by 2002:a05:6a00:886:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-793883dad54mr24936552b3a.32.1760334606570;
        Sun, 12 Oct 2025 22:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAWCgGwUZgm58CiKTOQW8YpRQefy9Oj0tMsYK5hjcqfo9P/GDSHFU6aimLp46L1AlwnBdA4Q==
X-Received: by 2002:a05:6a00:886:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-793883dad54mr24936514b3a.32.1760334606099;
        Sun, 12 Oct 2025 22:50:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:50:05 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:15 +0800
Subject: [PATCH v7 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-6-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334568; l=1810;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CPQNjReZzEuthWP4R2lJNdjHauXO/hHJqKsK5LCwEHw=;
 b=E7D4erC9cNnqmN3+hV4stIfeW2COgvL6aUFQ3zZqFMBAx/RfATnpgwV3/QmCnzco2wauJocyy
 CRu6J+UQWwXD/eqErWvs55GM6UbPa9O498wfkhVWGT4UGRBOMuVkKRC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2wSoSWKLMGlc
 kXM9/z64zZ3JxL0QH9fqOW7HwVpuIdNm3Qc5MkrCDP70cSfQm8CBJbl9S3GjsLX1GnK1t3tP6hi
 /KGDsI6iJEfw01AVuCj/8S7w5RBYZ5ASJu8TDcAXqzt9sJwg2jwdB5WEe5/EbGaMkmOfP84dWjC
 dHpirN8cOs3niDMrM/879q4b2owYYrf13z3ISV09Zc7C50XmOEQlWaOynUcSggNpZKFLqh42u6S
 5F1zKX3xyd1cDTQFTIUSfpwh2TKexGiXi8HBApGIH0/lZtGv63A9lTMEv/Hif95Lr7FTHPyEfDU
 bX8Y+MDYJ2azyi4Ki9fXsXfWqSvmsgl3AT2wr7KX8AzG4OCS6gxKMSHBW2abIVQH102QFd/B9Wh
 xeUngFvE6y8WIY45UEz3/0zLizpZag==
X-Proofpoint-GUID: mnAJCdXYpQU3NU-aGG6JzwmJr6vids_O
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ec9317 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mnAJCdXYpQU3NU-aGG6JzwmJr6vids_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_225016_132256_302E5EBF 
X-CRM114-Status: GOOD (  13.97  )
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
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..02797e5f3b58 100644
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
   label:
     description:
       Description of a coresight device.
@@ -60,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +79,11 @@ examples:
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


