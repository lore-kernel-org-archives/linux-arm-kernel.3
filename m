Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4858ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=; b=wTlPhNhrVT28mtE3/qzCaJ1QNi
	IrZ6nlskAmmkiQCQY4T8YNjgNIxbNI708uDq3DJadVEM1VpTXFL8SvQj1TMlMvEx5zbP305nAIkS7
	GmhCwG9V3c87lVX3IIDSRqnH7MtqgKeC6HawjIBfZDN4Q74zdIUJczMnXoAPfZFOxiKOuBJZCAnhs
	JbEF5JgDYa+l7h996TB5IVbzCgAMUy50+lRTHXhpgezkwGW/0lIXQ/JBhnHOG1bBUH8FXtAz7AXe8
	9gp4Yhf1cZQrd3z54c/uQ0H+MMw3o8vr1YYtJomI1HTNniTZI9kf4yJg/m43cu20pLbJwHjo1jwXy
	m6xY768A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggb-0000000FisS-0oAP;
	Tue, 28 Oct 2025 10:12:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggW-0000000FirK-2FBs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:12:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8Xrnu1177133
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=; b=Vvc9m+mfS8OT9S8t
	5RaG6Y4QXH0PSMcW6M8yaHZfd2mhdkovxcLjjOiL6ul42Re4WpoylwkUgCy2TKvj
	Gg5twFbuk2b1SdsD4umkFQoEb9EcjTIcbimYGW+gHkvUpzWsfh4cI2CckKOnFk++
	k4gq0awmMIa37G1WSiuIQuMPDPkjMvBQTljzxRJ40kjzQCFpCOBJXL9QoRE20OwG
	/7B5A9brzZ2CgcPFkQbZlAKXAxt1TSSZHKy9wWu1I99U4SyA/akBS6XCpBMqst2r
	IeRGRj5GlsfTTT0EUUhm0r0KFvsaECh+ZZfHgl5dHcgCPjZNpZgcQ8jLpI42/hCs
	P6CEFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2tebga53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26983c4d708so44343935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646331; x=1762251131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=;
        b=vCBcnWIWcezC5w/d5pSDf59vkUEqEwhC7Zi+uic8KS9gjRoDAxLuzoRMA5yKRx6Xx6
         uEJISMSbRjExmtyzpQcf/AKHsXJQUKqq7tD6DyHJeNka5q5Fs6Ic+lfZyki9EjWyhz6F
         BW+BCRFP66uCgiliBHJIZ7UBfeRR0zHOS4lZg7F1evwsuiDXW5C85TO6zq1rBanY8uc1
         yfFGV+NQdazUPWSuF98VBrLzkW89HeNVZAxCvBmiq0FQwqPA/gjXo/Cytj/02mksRXu3
         uoTeRckGj6G7hC1FUrANA2OjyF7CyfSb4xi568Ocehy71rZBL+Uh87sA80erdDaQq+pR
         6Btg==
X-Forwarded-Encrypted: i=1; AJvYcCWLYmywCUQ9nNR4Ea+Hq5j6WSxYF+E5pAdPq//h4POZIoX+BrwVO5W3GdQb07fTzWOxQvAcCPmCFMd/H11OB0GZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxdmbGyKrMC7bka5rBWFTqTa42fPXk9j2jeCpipcjVwX1ayJkvW
	L4mYhEOpyNGFIg0Yu0dmDD5LOgaMO+UG8MbOFWEV5Yj5q3zZioFynCeK6wp0WBy3tYpzMomYpqe
	3MpEls3YllQFZi8A9IgdVYWMjh+q9wSKp5P3wW1JS/Tr9hNtRI35AzLcQiJsqSqf4eIhkxHugAg
	p2nw==
X-Gm-Gg: ASbGncs9FnqU5kFZLtbbxFPkoJzE9QMgznPhWJQubbpADZAqvuMdaG5g6Yd+W1XPJAn
	9QBoLqGxL/5pZoirk6KmViS6giuahM/bIvVytwPhdbI12ym/6Eha/WVnChbftd0SfiCodRFTAxx
	feFVgPhEsdXng4arVv7l5Z5mpnIdqNDyjzJrNjfV4KJPsfBVERLE0wvbIUcJHW+ssNW/kFU0FOa
	Ff5Rl1f8M/6WkyPX9PpPCLQkbuNswdA5Fx9ODT275cdc/ZBuw4wsH0xe8m0TZM8KRVKU3D7cdQv
	YpsS05qMYDJ1IcFpPj29YhUm/DsmnpTHeWUEDKEA6S+ZyXXEGmcCZ5bIuzndgm81dli1vjAZgFw
	B4sS1Nu6v1BMKmV7cvhr2R3l8hO3qro3VDXl4qYnaEqrPrGjA79Njhhdtu3wuew==
X-Received: by 2002:a17:902:e5c6:b0:293:e5f:85d7 with SMTP id d9443c01a7336-294cb5186efmr37248125ad.55.1761646330540;
        Tue, 28 Oct 2025 03:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb29YgEWk2tLkfhGz57DmwvdMAhUJDCMmBCcvIBnASLKQ2A1aNC//pQlo+JzoyOuG/gwC8nA==
X-Received: by 2002:a17:902:e5c6:b0:293:e5f:85d7 with SMTP id d9443c01a7336-294cb5186efmr37247615ad.55.1761646329885;
        Tue, 28 Oct 2025 03:12:09 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm110408755ad.19.2025.10.28.03.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:12:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:11:40 +0800
Subject: [PATCH v4 1/3] dt-bindings: arm: document the static TPDM
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add_static_tpdm_support-v4-1-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761646319; l=1550;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ril99Wt36AaQWNv+PDjT8BlLjpjvdFqefjO73sSkLmU=;
 b=mC9O91ScEQM7m0k2xJ3977SHUKVvtGlMU4RgMcCTUIhDtXcp4RUl8RyAH0i257VDDl+paWKOZ
 Ud/cYhe0oszCVKf4JALO09nYTVsuzQS/TGrgVZkmPzzzxnohyEVD1zM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NSBTYWx0ZWRfX6+rzIfERvguc
 d12G3+0mW/q/BH96MaNjBrITOErRT1cKPnPMXKKp67DJXJNj+01RLt5MeD+Cr6NyS7ROoZ/kgxE
 ftp1ff70YpV/LTh1dKagAZ/lWRVBuj0gnQKIphFGEInbTNRDjMY/djmzJN7Z7A9ihMR3tMAI3rY
 +OOtuoDkAAfMVHggH2iTUi0OuMszE427c7U+odDGHYXBPco8vhoGhMLNre0QS/k+JtzrVBZkpt4
 ofAlE/J2mD5hECWM3W/dAz7RX+pZvYqZPyb6wm/rQ9Mr90c9IkwsC8MCvGjf9Vtjvt+oO9aFjPn
 cUhCg0qeqNT444sQhz7A7fYCdZ8KYlTfiNYxGFQkm3VcGbH+3EdeD8QB+K5V+gkcOifoO8x0/WU
 LUKIxSgnwEE8EiCvsP4tTVfat1mlFA==
X-Proofpoint-GUID: 0Hx-BRyJirWO7ctTbHWhQRUmPznE8hS2
X-Proofpoint-ORIG-GUID: 0Hx-BRyJirWO7ctTbHWhQRUmPznE8hS2
X-Authority-Analysis: v=2.4 cv=V/BwEOni c=1 sm=1 tr=0 ts=690096fb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Z_N_GBq0btHVWfAyk4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031212_759719_79B7A1C4 
X-CRM114-Status: GOOD (  12.44  )
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

The static TPDM device is intended for sources that do not require MMIO
mapping. Its compatible string should be documented clearly, along with
an example illustrating how to define a static TPDM node in the DT.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tpdm.yaml          | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 4edc47483851..c349306f0d52 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -36,9 +36,12 @@ properties:
   $nodename:
     pattern: "^tpdm(@[0-9a-f]+)$"
   compatible:
-    items:
-      - const: qcom,coresight-tpdm
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: qcom,coresight-static-tpdm
+      - items:
+          - const: qcom,coresight-tpdm
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -147,4 +150,18 @@ examples:
         };
       };
     };
+
+    turing-llm-tpdm {
+      compatible = "qcom,coresight-static-tpdm";
+
+      qcom,cmb-element-bits = <32>;
+
+      out-ports {
+        port {
+         turing_llm_tpdm_out: endpoint {
+           remote-endpoint = <&turing0_funnel_in1>;
+         };
+        };
+      };
+    };
 ...

-- 
2.34.1


