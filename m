Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19D0CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L5+wnjbDEv3102VhOKhi89mJmJQbEkYJLYSrku4XFo=; b=md7alLDQS81AA0ox9EPJoTFlo4
	ngYjolB3P+MgzTNE6c9Knwv/hXc+qUepvDKukWB4uU91HS6XYzYxRB7WR5YV4x1I310Ksay21mnbo
	WeZx3pAbueJVzwoq7Gw99TOy9nCsf7CED89eyI/5aTZw+SlCDBj7gRyKueL8DtDmKUc31aAhB7Vk6
	14GQ0qDvAWRWYgbWy0WHxg8tPdBYLEi5nVfR2lqOA3JiOmsv7S8T2VOZ/yBuNwUqgmVAobSaP91Rm
	uW4qfWOabJif2FSa699Yd2xycRfaxV07JRMl7H98gdxq6QjDsF29+AHJDx8izMBjoPj54VKuY7Wpe
	Pjp+XJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7EL-0000000Gicq-2KO0;
	Thu, 04 Jun 2026 12:31:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7EI-0000000Gibz-3fBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:31:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548UXS71132195
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 12:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L5+wnjbDEv3102VhOKhi89mJmJQbEkYJLYSrku4XFo=; b=YihOSW7t5IckLsz6
	zvkpUu3rt5sYbJ+OAx08vyi29N4mOGsSsCaUC0oIAWOJ0E7Amiwn3MgInauKAkfV
	aGgwCTcmYg1FtV0KASu3vAkq4U6tjg1P+Hpoc3E4maSnqEi1uq0QXTTdvQK0TidU
	IllBHxoGjYOVzVaFObSY2hyiBVCa/uG7nj5fbw3dVkSFq3lr2H9wvRnoIS3yN/6u
	k4ni+Dn85uMDjrFS7F6hl4R6jhQPJ41ax6g4+ZbHfZLyDTFq011Fr0K3JJ/x77SL
	LvU1jW55gygrd2QSZwXipPYKOYqgP/skwrWZa8uYlBrA4x73iP/dxudnyJXdLQq/
	m0vd5g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsgw5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:31:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422875c676so547105b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576281; x=1781181081; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L5+wnjbDEv3102VhOKhi89mJmJQbEkYJLYSrku4XFo=;
        b=cwoP+QOpQm2FUeIRyxWKKz2+Sp4q0rb1q0n/p6su3NWpOFStqMnr0Jqqb5F1o8UdMa
         qsJ3DxCGpHmVWFaC5CppExPJ9AHc3WeoezeDy3lrtvPulC2No99PzqcLjVO103LgsZAm
         XKRPi3Uigo7m5qDYYtgBrghTF7TA0L7gseSg93REdHF1WMRH72cVxCrJxBKAd6eNzOVy
         4ycoXV2ME9lwtPVwGXoEoB+DQ6beoy+X33jJeswCOA+mnCulRZkpaaBFkwiA68l+mOit
         kn9/KSVG1OVc6Wnj9x82un1jpnt+qICcqpi4F1VbhT5so/2hDuwJib/xH/cHadhcW82H
         0I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576281; x=1781181081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/L5+wnjbDEv3102VhOKhi89mJmJQbEkYJLYSrku4XFo=;
        b=B7D6y/6MTe1e9BHLiBsVZdKVtEGePPbzCMMkC9yRhmI7HBi1fuqMyLjsocVGJAUs0A
         mzGI2FaJbLwR1M7OJLhP0dDNzS+OXW7pFEVg/uD8KXwu7AdzULept1dr7b2lfCA4DhzA
         3Px+u0zboSbAVGXjpuQsmQvbbXbqYbSiSKw0MTNKCTk62UU/UfuE0zuOSr2lCKKZxwgX
         n/3moN8dAaIn3bgnYsipTJP4YuJ6x22clDdGFKrftFqCZ4gxdZS6ebH7hiBwYmRmhacV
         DS6LNNRBxByYoa0gA8Z3BP2dFxDO6BcSGR5pplzKs9EhPkwwt0TI+WfJSdxSBsbZi0M4
         wSpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3rFRMLT0EFah3ESFtUOCmxAmwpB02oeJNPRKqW9d03NyW9GwV2Ab+sVO4j+wjzxDiEpLQuz0AlxVEv2WLhrQY@lists.infradead.org
X-Gm-Message-State: AOJu0YwxiWo3RyIa3NSdVl0+W1XPj3R1drjlzudNSHAzvR/jroyNnHNM
	WdWMaceNxBYTuvJCSj9w++8HOHMPvPz6GXwovTFOdVPF05+UmioqsObTbhptpZFj43/1x7O6uKm
	BxHydukbPl9ldJIwiSrVgsQwxOJR5ZFkSjyel4WqJ+dA0eZ7zt4ZENvwdzQ/C3UTz+n35PX4IfV
	eE2A==
X-Gm-Gg: Acq92OEfOC02xUjIDb7CPgEw+K3EpeV6fuF5l9OzpJg2/pFEXzEo0nAWh1aVWbrbBMm
	GO29UIC5sbWwc0aeL2BeGk21qgm1myfqN0SMu+UTyW2gQ7nB5xlE7NCjlpSUIBE6118HHbffgjO
	tpvlE7p+wTCb1imWNVIfOIqyIFNy8pTgZSGTqGEsyp1hdEx7QWR1uuTKkSp4desk0YidZHl5biS
	HhH5rTv88fTWovcHraf5HojnTEflDqP3Br3haWD+5OfQQoa3a49HkpJ6zUZuxgfBkg6ARL47LYu
	YWtG+TndFE5kt5B3yrjOvROZ7pxpL47xm7v12dwnHHr5Lfxu9gAhKN+iFXmv5teTbqwVTeQWYbK
	hjkPpp48reWo7VnWyWpgw9iZys3BvZssIiDYRLVeWu3vIjoznAK5CPLJF7gU=
X-Received: by 2002:a05:6a00:1905:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8429b57a3b6mr2822608b3a.4.1780576280744;
        Thu, 04 Jun 2026 05:31:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8429b57a3b6mr2822556b3a.4.1780576280004;
        Thu, 04 Jun 2026 05:31:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:19 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:47 +0530
Subject: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=4493;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WfANBIIgBzTwwuDDl6Kdw8lUaZONgWxsNNvWrRs4B1s=;
 b=MtMgBdqvWqWsrLdHxWNc0SaL5+U3fBPtkq6vzeFtJypgM4h4oQWOWMW8CatTFoOwuUB00ACxI
 /jqGFI74wkKASThmqiqyz0GObhh0XKnl0wAX2LWewF69aq3oi58Z7bG
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: azGsawjHznj5XPg7yQTh9JNoJhHRbpKY
X-Proofpoint-ORIG-GUID: azGsawjHznj5XPg7yQTh9JNoJhHRbpKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMSBTYWx0ZWRfXwmj9pMQSMY1f
 oT3mzMIxSQzAeQkvzeJzKDSZ7z9OxbnYGUZ8DeN3sHiynvZekB2FcovHGHaW+B8OgLXneaA6lKQ
 1dctCCCeVQ/lRVtfZAuoQcaqpVkv2E12XSKWGSL2Bm/pA241jMTDJSaS5twW6jFihKPllLUtYio
 4U2IaWkq9T2Gj6UzTUIQU9B1J0zjqG+mOKCCNEAOBGKKKIaGtEO5GclAP87lZd67L2FbreNVyD4
 TMXNf0W/AXZJWGEBvf2nmCDJs3lf7UeQ5SIqwGcQiPVSaR/tAPM9OeZIRPcdbtIkWydrpKnNMks
 iiF9sR4lyJylg8awLVaeOJUEtOzQh6N6widwaYGQDaVb9xeiUDq7nKcEY0C/IYJ/VQ3Ax3rcpEy
 iyOzHRobrqYufb15hpLbmZcybx3DzomIOi9oeJh3Kjj1v66s/mQJAHFQf5b8RqZDrw433K/JGu4
 n7nk4o9ckHpOKgQ6g8A==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a217019 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_tpsKkHDXNPZovU35XoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_053123_039796_2B7190A9 
X-CRM114-Status: GOOD (  13.74  )
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

Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
sharing the same register layout, DSI controller and 14nm DSI PHY.
Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
rather than introducing a separate binding file.

Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
to accept both SoC-specific DPU and DSI controller compatibles.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..a2f3e91104af 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,shikra-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..e166a73651df 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
-
+    oneOf:
+      - const: qcom,qcm2290-dpu
+      - items:
+          - const: qcom,shikra-dpu
+          - const: qcom,qcm2290-dpu
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..7184b09a8774 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,21 +4,36 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
+  - Nabige Aala <nabige.aala@oss.qualcomm.com>
 
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,qcm2290-mdss
+  required:
+    - compatible
+
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    oneOf:
+      - const: qcom,qcm2290-mdss
+      - items:
+          - const: qcom,shikra-mdss
+          - const: qcom,qcm2290-mdss
 
   clocks:
     items:
@@ -52,7 +67,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        oneOf:
+          - const: qcom,qcm2290-dpu
+          - items:
+              - const: qcom,shikra-dpu
+              - const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +79,14 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        oneOf:
+          - items:
+              - const: qcom,qcm2290-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - items:
+              - const: qcom,shikra-dsi-ctrl
+              - const: qcom,qcm2290-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


