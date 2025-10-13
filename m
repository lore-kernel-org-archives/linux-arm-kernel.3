Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51C0CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=; b=aBb2sYM8mSCHi592+kCYg8vjOr
	uPVzUtd17zKe0gvqdNSjVy+19DPPb5xXsbBCqjQTs2iEopBIP+EpNV7/w8fVmczUhP8Zdc/YaKgV/
	ql4JvjqAtrrMucFQ16vKY2HXa4Doil8U0gIg+VZgCble4nKDwcWwF4JbFYqEJ447FMhntpSjD+iW4
	X6FPkXe20pQKvdaFpAS98PJ307A32ViG5EiWRhM3gAkemu8a682Hfg3i6JVafCaceXrXtYuHRdpu+
	+6L0DTIiMLz+vvi3a2XN9SbebNpL6sUvh6qOZ9ss5oK+TuaX1JYOd3f0kjnaTNLIlqrb+dHwHqZsa
	a2qNj8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bmc-0000000CLKb-2cCn;
	Mon, 13 Oct 2025 06:11:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bma-0000000CLIe-1OFM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:11:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n5vP000691
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=; b=VVkEe17oCPV8uPhf
	QFMprB4pBsjr/jsvuiUR3AFthZI44/2qHNQIgmIF/rHd2pu77KbuhDiNeokJVJD5
	E94to2/M7jKqB3F7ug0iaennxHjIrP4wHLWIk1+eug8MBszbxMmlHzBeeDcp5d/q
	dCeYP0TTdIm+7PNh2t8AfzJY4LZccKHnavjJIZ0usL6RgCUAFFN2eUYvMmMRt3OB
	rEtV2JFsocwDCZCHp6F3iqFI2RF/PAvrtVUEgNBRBlHR3gMwE/mMLlDPlU2dE8vo
	47zrcFZVaMbwJojuxd4PPGG8xsWh8dEwkY6by09syQPgoR9TudBrPZMCAr9FbOup
	MflMGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8uevq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27eed7bdff0so76015075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 23:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335903; x=1760940703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=;
        b=cQ3tyVWUlRgKMzLrYPoP91eRiCS31hRCTVtX7Kr3V9gHdx+dun9sFigF4KzQlSIhtN
         oEJ3OaVys/92QDQ/Rc3mm4OkAfdZuXl/Maddf/QcIUO6gyUENXofLoNaXQ1mK4mqZgdr
         Nv+p5qta9bOeurU1iVxu62DXeQTgsfcwvWschJ710MrdJ1asXXN0zWFdwSdo8J40T8Lg
         Cb7609GPtGPyOzrGP9hAc9DZxVv9vjoJ2s/gFzBN7uQakeUg64lzKOH58GnNngfX1WnV
         aDaS2xIiuCRg4PajSthmCE8w5K02dcFOx07RLR+O/WQAy3XkUVxzLHnNwuwCl+vd3ni5
         vvFg==
X-Forwarded-Encrypted: i=1; AJvYcCWoOHsyiAw3JETxXrb2vo6qDlhQzJJ24VHlY7cJFvGv8AO87kYq0QhUqRoAxWKVbBoRe5tF1lBDVxNijXCJ8e/5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy04dP/OOHX2LYH+PjYvfq+IovkMtInBWZ+vhK8sxxo1lJk2/9a
	aULe+oIi64kmuRAFE59zHrnVtzJB5IJUlWD2fd40E/n9zdnmvMUNLfesJl6csPUZ4tOVYCB4IRy
	mgyomMso29pq1x7g3hF9sci9RpsuziBrgAqHcF2p1I+Sg2K//O00f4ZmawpC8hRpBdwG3BZ3Bps
	xJ+g==
X-Gm-Gg: ASbGncs7wg6/8cky2M02L58yEE84FUmxzcvjfwBwOLjiD2g7tsdzmDv9wsUr6Lc+FH2
	9hSSnySMhwjZqPokeK0ldDGDvxTpJB/XX//zRejJz8iHzJnWDue+93adLYkID6KP9Wf62+FvD4V
	BlGWLwwmwxxQpQrKXSaRWluv/1rMJ6FY0ijhxDK6z+ngewrPLKBSX3e+4+vKua1Pgz2Luh1ExiP
	vwCFwl4+CHGbFPa6tOpqjmvXW2AkiZ5XCVzhw3Ry6mO7KJq2k22Ohz0kK9Ni84KI8713Roo7PbP
	abkTbOn8K8LBbH9NhzFbYl1ipgSnGFo2aIE49OJwVY9Ys633X/I6w/MUEN7mg9RosvK7KN423ak
	yXrhSmIWHXWpqW8/KjAq0BClM4Fg=
X-Received: by 2002:a17:903:46ce:b0:26e:43dd:ae77 with SMTP id d9443c01a7336-28ec9caed29mr272651975ad.24.1760335903092;
        Sun, 12 Oct 2025 23:11:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEULiUky5u0eNgxl6LX527XaD4MnbBTJXkMtMbnf0uwC+4g+DhLvF8iPLBmq67+54X1JcIZNA==
X-Received: by 2002:a17:903:46ce:b0:26e:43dd:ae77 with SMTP id d9443c01a7336-28ec9caed29mr272651735ad.24.1760335902680;
        Sun, 12 Oct 2025 23:11:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2904f61a1desm64388675ad.82.2025.10.12.23.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:11:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 14:11:16 +0800
Subject: [PATCH v3 1/3] dt-bindings: arm: document the static TPDM
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-add-static-tpdm-support-v3-1-a720b73e83db@oss.qualcomm.com>
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760335892; l=1550;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ril99Wt36AaQWNv+PDjT8BlLjpjvdFqefjO73sSkLmU=;
 b=HvBZBhPoXjlRC0YdVww2PK4swhc3dY0OMjVa0IXNyNsiaBHrYx6rix1xuT7DU9SRmw+65geZN
 kJyQ54ZKrmwC+pp8TNSXg0alrdswDbuTaVRsA3/6eNF0p7W2T1KcFWJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: HbeuwEn6MGJOZUOo75Xubx_5IkiBONOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/lFZ7LOipKSs
 MN8Y9PVCvySg7FIB8Hp6OtBkQj8FUsQLKA2sbmtH7lbrruUOAE5qCQQRQncEIQJ0P0lTrR0RAGH
 5/TSmEmD18x+spGwLn3E8vo57VR07Re9ZEAeoifsXjat9OmsSY+sgl7hqTj9/dtm7WUPFDmwSBO
 UJRygnp4XO9Q2aF8g8xgm/J3lr5cJqOf/W3volD2t4dIM0Oo6QkTKuEb1jPlMWJpwTbFGpqUZdS
 vKsnvob2ADqwNAkjTrbtC0HwLfk8f2su+VkNhFa4wiR47qwDsTjKkq866FGxwDF82/bD2FfV0Uc
 zu71htT8YRf1DpPeG10lngV2qvvgu5fb806d2ePZexqc5addNnVQg3BDuqacUep1KTJeDjrgCOi
 iM3Lcwl+jxW94nJifaC9b1sBB+w4bg==
X-Proofpoint-GUID: HbeuwEn6MGJOZUOo75Xubx_5IkiBONOR
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ec9820 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5Z_N_GBq0btHVWfAyk4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_231144_383602_06FAA80A 
X-CRM114-Status: GOOD (  13.31  )
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


