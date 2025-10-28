Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F65CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfzo+zhajCDy5YoRs8Kez4QqmFzyjmbKPNgTAWkNhwg=; b=Rmp5rKKqtlJYnrbFW50tCz1i+K
	67UZYGhTDu4jjF/qRGF7+wDYuduTD1PJ4l+tNqf4wyy3NyXiy9f0gK9FPocqT6y8Lh+MIQC28i/BT
	ZJjMdU+j1KwiDmjjcNEndM++snHXk8VQDWODMAgSzMFCkhq6ixDDLCdnO5Lfi2ZgAy43gJTUJ7Iqt
	0keSvEwV7wRioSTnujjpRwSXxPmtb205+Uhu1iXXVcCyGUCK3FU1jY/vp6lYPTSPRfEcgenqQk4J4
	+2K3RPSJxjvI6UsdlMEWAnGvkeLu8+f3cY8JYA1KjvNPw0Ou8bTTew+otymDsu1eIeAqpIxcLLd7B
	NPOromJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBt-0000000FKw8-2zr6;
	Tue, 28 Oct 2025 06:28:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBn-0000000FKu2-3jJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S1LPVv2961774
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfzo+zhajCDy5YoRs8Kez4QqmFzyjmbKPNgTAWkNhwg=; b=FM4dVzLGC7j99Mox
	3ZyFb8DhfHrblRfE49VgmXsWH7fS1hh5ezbI5Q/+l7oHyMwQSAOtcEKD2hq2nS+3
	5kMe1mlpT+s3EiPtHNoXhz2PR13wbfB6nq0BdN3BdODxjUfjc57r428SKmgFPcr3
	TxWsB2c+8lHYLXkyZWlUXUvy6yJ2/KOJT2ys2ytDpnf5zt5tZvTcsojtg6KWBcJf
	DVZLx+r31e4RYMs7w0gB6YJw6IXQ0A0zesP+L6tFMGBBc8Tq1NCtQAHjKgvZ7MJX
	BvPmhl0SiCnJEXYcDTQhe2sA4zBnDmCOARcWlLIfwAoz23c9YBdmeSLX4jEvg7E+
	xiksTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29v9tnug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290e4fade70so45995595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632894; x=1762237694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfzo+zhajCDy5YoRs8Kez4QqmFzyjmbKPNgTAWkNhwg=;
        b=K5Zb8fTRyefoUljMjArGi2eJ/VI/OFnzn22dxeVFkw5tmBzm5ehHkt8VYgcE5WZUw8
         peHvUjQjvzYJjnLhkZPts+KnAX9eeo+irvY+XgkvPm5hHlgpWJwsV/NU5ooYJTgRaUzY
         GvNMD+HyCAFiqJAn6pRGQprK4zZjCnAjfy065L23cvav/GD1n7p32OnJZVP48DmaNkNM
         8lKMBbNbXi9JJ6m0I8DRR0+b9GXvp8ZiGVT5RBRzteKTb1ArM9fPnouMH5tD4prasKId
         PD6jXHY5/3r34GZPC7spMywu3yEWxoB0VJ1fQjzKHUDOjuFS9v4V9NEIRf/mJ3scRTZl
         dopQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg6tAtYNtXQPRDlN19WCJJfRYOWMBLOtJ8KFPXZFeK6OSVlNi80+TqL6QHjhjEzs45z6lgLwRzhAXNHvCNY7Q1@lists.infradead.org
X-Gm-Message-State: AOJu0YzTepkV3o9De7rPuP3gEB/1IQl8XNoAxxYz63Flq6OF0NfLmYTB
	UHB6sEfw258ANwKIwwuNkHZd3cYTFYPZCYXCTYCtcPEqLeFgwaOFcC0REYvDv6kOqxQfihNMDxK
	uSANchaQY1EQ75gOPNF5A6Sv8ffAkBeEIBqtrac8hYSDPH+1PHysgFRiWDoUVb3k61C/gRrHqSn
	M+1A==
X-Gm-Gg: ASbGncseOPGHICNR4iU0HikoM9g+ZXLfWh32xWW9iUnEImXUA0eIsZ5O6GZlfza1qzF
	1BdBCGE8u+6mmAw8YAxcPJWzTBBCpC6hCDyAhkm88W9NTo7uW1qVberPCwtGqIgCm2fB/UX0kbg
	2dgCbmRch6mkqEYOIZQol5yT9QPv5Grlbnkt1fT9nn7DC9jQ62yx9ml5r/xvxTQ/oq6XxmnR9zh
	GsudVXeU2FYMOR8Do5AH96erUOXiTwa9RaKsO2k6e1Ax/Af8OO4QMJ6LPR31y9yyNjDAa4I2b1/
	Q6y4TGOVQrwIccwIvkm8DocWR0HaiIF1tsKuVGpWwujpZaNdZRm4eQSKgiH/ZkhVp2+AS3wAOFZ
	TOVfOrwHpyol/02/1fEIfSAs2jhENjwFQVoiP9aRMfmQ+ZtwzXxG511xD
X-Received: by 2002:a17:902:e5c6:b0:290:b53b:745b with SMTP id d9443c01a7336-294cb5232d3mr38383795ad.39.1761632893874;
        Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLMay05a+vAXuQxOkbTQFiIgxcmfZljtBPlP7Po1PvPoXnE7k7Y6n0QTmLswWPRio4+BUB6A==
X-Received: by 2002:a17:902:e5c6:b0:290:b53b:745b with SMTP id d9443c01a7336-294cb5232d3mr38383555ad.39.1761632893438;
        Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:03 -0700
Subject: [PATCH 01/12] dt-bindings: arm: coresight: Add cpu cluster
 tmc/funnel/replicator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4225;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=PPtBIz8qEFvPp66GNhz5hdu3RpRfVBfYsLuidxR205M=;
 b=xr2MpTWnfc1z9/DYs0lmEaPgzO67s3OtRkMFlUDMRC0QKViHGXoLtClSlhp7erTCm29OL1zn3
 8IE3NPo0bKqDB+lxtdSRdV7bNd5lvpqfA9voMhVZAzwas3ZA4x0zJFk
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: spSNTchrVGtHm_hCCWh70NHWJZsh-dgF
X-Authority-Analysis: v=2.4 cv=D/VK6/Rj c=1 sm=1 tr=0 ts=6900627e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=G4amIDmpmRGM4OpAro8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: spSNTchrVGtHm_hCCWh70NHWJZsh-dgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX0Ei6i1PgAg02
 Tk/tcIuHG4beabt+5/z2uasAv9n7vqgpBQqnt6IUD9hBJ3pTcuGjE3oughqNNDaLrlbvTwBaK6+
 laXVip0DeR2HMJTFdapXFK+mdSFM/WuYyqJynriJrRtSkmkOTEbiNlv5Sx4ExzJkGvUjsQxltCX
 SC134rNkRCCH4Ebe1jsRLyKCHcOjjCobUCcREcIIiCF5g7WYRzlXkIXE7Lgs7CDMwQjVNMVzpP7
 0yfwyRysBNbr4u9keg+KAXSlvVbIgdXbAJJiGhDL4aHHYT7qJXYL23ZMY/2RsTFYgGMRPK+BZij
 jR6FzE8BE6LEUDS4/BgXdae2iERPVYMzOwWKsLR0mTQ5aogopiOxL0DS5gtg/BFDP2/5Q/rklJS
 2O6rZoVIPXEz2g2hNVVCTVsiJe+Y5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232816_068181_DE82FA45 
X-CRM114-Status: GOOD (  11.97  )
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

Add the following compatible strings to the bindings:
- arm,coresight-cpu-funnel
- arm,coresight-cpu-replicator
- arm,coresight-cpu-tmc

Each requires 'power-domains' when used.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml | 23 +++++++++++++++++-----
 .../arm/arm,coresight-dynamic-replicator.yaml      | 22 +++++++++++++++++----
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml | 22 +++++++++++++++++----
 3 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8af2226b817f6af5f533b1bfc74736..8f32d4e3bbb750f5a6262db0032318875739cf81 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -28,19 +28,32 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,coresight-dynamic-funnel
+        enum:
+          - arm,coresight-dynamic-funnel
+          - arm,coresight-cpu-funnel
   required:
     - compatible
 
 allOf:
   - $ref: /schemas/arm/primecell.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,coresight-cpu-funnel
+    then:
+      required:
+        - power-domains
+
 properties:
   compatible:
-    items:
-      - const: arm,coresight-dynamic-funnel
-      - const: arm,primecell
-
+    oneOf:
+      - items:
+          - const: arm,coresight-dynamic-funnel
+          - const: arm,primecell
+      - items:
+          - const: arm,coresight-cpu-funnel
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 17ea936b796fd42bb885e539201276a11e91028c..5ce30c4e9c415f487ee61dceaf5b8ad12c78e671 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -28,18 +28,32 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,coresight-dynamic-replicator
+        enum:
+          - arm,coresight-dynamic-replicator
+          - arm,coresight-cpu-replicator
   required:
     - compatible
 
 allOf:
   - $ref: /schemas/arm/primecell.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,coresight-cpu-replicator
+    then:
+      required:
+        - power-domains
+
 properties:
   compatible:
-    items:
-      - const: arm,coresight-dynamic-replicator
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,coresight-dynamic-replicator
+          - const: arm,primecell
+      - items:
+          - const: arm,coresight-cpu-replicator
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a39138df9adde0c9c9a6f5583d9da..d7c0b618fe98a3ca584041947fb5c0f80f1ade6e 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -29,18 +29,32 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,coresight-tmc
+        enum:
+          - arm,coresight-tmc
+          - arm,coresight-cpu-tmc
   required:
     - compatible
 
 allOf:
   - $ref: /schemas/arm/primecell.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,coresight-cpu-tmc
+    then:
+      required:
+        - power-domains
+
 properties:
   compatible:
-    items:
-      - const: arm,coresight-tmc
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,coresight-tmc
+          - const: arm,primecell
+      - items:
+          - const: arm,coresight-cpu-tmc
 
   reg:
     maxItems: 1

-- 
2.34.1


