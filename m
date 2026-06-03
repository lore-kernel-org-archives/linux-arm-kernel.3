Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AC9CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCvEktdSiv4A6mtT0YE77fV8FNu/cYvcs0DIGD1tKXo=; b=sNUvcfDB4wstnNYb2pZfD+heoB
	CvL3Cgew3lkhoBq93epM+S2Xih4JwGcHhl1JTCvoFNUJ8xo5O6x5GDnTohuYvYXcck6dkiWEV5VMG
	SUDjIva1aJaVPieJnld855GnPoX84NUmWhojpkRvAid/QgpCzd5GmxX4ezD/gSXbkE0Lxa9BfGraJ
	o8UZfCrUKsyJ9UIcn0AetGQiyDFyF/EtFHJYhc1uL/YY0GV/i2Rp9ZlKj4VXwYOLvEmf9VS83FZ6Y
	NjHJKF2a8D19YmJcaQnH6D3d9M3Yv/PkfmoKfyW/vdLCb9JXhKy5pkVZvinM2OExU4r+qh+atMst/
	ZNbDHS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4V-0000000FJLC-0xuD;
	Wed, 03 Jun 2026 14:59:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4P-0000000FJJW-1rWT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:59:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CMGrr1200009
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 14:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCvEktdSiv4A6mtT0YE77fV8FNu/cYvcs0DIGD1tKXo=; b=MpJfbVvM755po/He
	XTPfzryXQ/64qNgjYaLJh72VMguEPzoGAErIPRLRKcpzjRywcQXw/8RNcL3rD/jc
	vNGtu7kok8OpwFvnqX/kJOUyRQNWQnrTjP54ejaTJ8IPtZD2tMZJgVlNkTmcf8mB
	WWZWU0WvHj4SnloocUhlLjwEbas13xbjvGi0TzsE48O+GwMzhdNTgwZaRSeEPlOQ
	ShgH6NFjD7xaTGoz83jwWxdZM13Wo88ObLFGEmbqB6scRCcwhyBH+AR+a38QJvC3
	1oTYWPA8RTBWpIfAqteBT60TWBeFvA20Q+S2oJw47qqY1PQx2W5gHUoLM3Vx7Ia1
	jF/yQQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw2m81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 14:59:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84245e2bb00so3277216b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498787; x=1781103587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCvEktdSiv4A6mtT0YE77fV8FNu/cYvcs0DIGD1tKXo=;
        b=ItvGNjMWX2ZKy3ygTuCAxsscGILUmveXHErY3v2CefoHDzqn9051eMrjtBzTQUEuWk
         6JxEYyZn+TCeJ0+MWEw76I6ScOy8RbDvYG9BOXUwmFzPAQM8JKIMMEEnt/NLkiGsSnTe
         ATeUFu5Kl3i+6pOK1zi/yfyq+8g4tx83O5fPlhdZz6XWEnTIw5l0xqdebG+yUweAhNWK
         5CR189ZgcSi27b2e2VgJK4K4LUezNASQy5euXis8j0dtFdA+rIhUmZF+cjKWIQiZ9ymL
         csXnl+weGOBhNK86U+Yua8ilF3nA4z+H538wOSLxC8njGc9x5SUWl1UoVR5FT/RojhaY
         NzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498787; x=1781103587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FCvEktdSiv4A6mtT0YE77fV8FNu/cYvcs0DIGD1tKXo=;
        b=fRPiXzM2FDGZY2PDB1dHyohi5uSe2xvAS0beFWr/KRXIW69YXAONFbqEH0aABniB3e
         nMIN4Y0jN5mbalT8vpaCgRRWnHKSaD5r7VwAxH21nX+emOaw8MY0gNVxP9BWMn7Vavnt
         beX4rODsnvYg60r5ep7zt8BnjrXlPNk51kXdVVDn9bqvfLU80wvEhKvUfMjd67JGaLR/
         92d8Vn/Snh9FSoZXUbqsP0Awzyo0QDmjPVT0njCQMzxsxgzKheGr9U8J+CRbeTMzGaeT
         dlWKiwGvZFUuDKUtE3NA/7LboEiL7npSo+YUQ0WUw5zTTkatek9vbPC8SGRXja2LR7k8
         /0HA==
X-Forwarded-Encrypted: i=1; AFNElJ/5SleNokkJTo78bD4kH7q7DzyyzrbCc47Wo4wBhzVWEWcJEeZGOK9qPH/KVRIJ5pYUrUNNp1SR2wCgDc/IkpBL@lists.infradead.org
X-Gm-Message-State: AOJu0YwllooX+FrZHct6dmIQUFEfBYGrSKeL+a+7pbt/RjbvGoTiiGrA
	/oBLUSKUwWxicz7WFTMcafTr06297e2AMzN9cvpTAnwAhXHVL6wTpEji60tXrAPJCxk/UG8wo02
	wkuRcFJKMIe8C6+eXRE8TNEbRht5ikW8yfcnkZUMBmgYkr0CJkK6cxSDiYD1QZq3aYqAFswif4Z
	IhBg==
X-Gm-Gg: Acq92OFvvgtrwKt3URdc+vFfG/pX5gD9XOA2bjjszsKDS8C+h5KCsDa0fEgUHy1dp/7
	mzoHH561DzoP3b7evs3paNw4Y2ADtfPWJGJxmEkUfdolIXKiAcBBzjVn9J7uu/i35IWujJVj34J
	x6XqCjq9opkXJGJGWzC2z/ELAmLpI6xIAU5LP+AR/TRULj6yEKBrFU+fSJTsd6+SUsi4FKfRuUh
	FchD8HEGqOkqsDojTqfXsWtL/31Sh9A27KcjO6MKvg1CJJ6qMbDqhKS7BgSu7s15D8UMGk2EtRA
	fMb0dgwxcvoZWJkLOmtGO2e+jz0pbWROBup34pB70/8CPKlnm2CvyqBttTEIeiS9KMJdCmm1sHy
	DEjiQeOcX6NH/B0gKQDcC5d6ZNm/60qcmDuO2dskxvOnA8yTjXazWxHCcYOM=
X-Received: by 2002:a05:6a00:181b:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-84284f4eb8amr3945723b3a.49.1780498787373;
        Wed, 03 Jun 2026 07:59:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-84284f4eb8amr3945675b3a.49.1780498786882;
        Wed, 03 Jun 2026 07:59:46 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:46 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:26 +0530
Subject: [PATCH 1/5] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=4175;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=MlVeOjyzwpym+szw56TwOtGwaPWWiF2YunpAZEWQfDo=;
 b=oxLSInKe2xaUTLeI9g3Z5OUf7JJRMtiRqN/OpXficZ7vBb/NRa3zVy3B7/ShmW5dyy21yM4/H
 tkNVDWGHZMUBTCpEPMfU6fGIUthwjbz1/Zk+f3hiIxAYjthF9wOuCYJ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: r_h_1sXpi3eRcjmtPddW_V0dOuWbSQiu
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a204164 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_tpsKkHDXNPZovU35XoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX1pilELSD0cyW
 +IkYfOd5bJmMAc/zrFoJPgwoybfO8rgcGgXmQkOIJmR7jJxueyx3HzUZgOp8ltw3+2qzXtXvqoU
 oHNfYse5bZk4eEaT5NmzQ8z/xVFTKmD7gGWESp6WBeOlWUqX29y38YFKCUKBW87JwgPHwoUT1tN
 +4EGF6hvDSA5ejTQkgCKjzZSD9yBsU7c1jbrIUztkxs1JaGfP/x4WZj9TsfAIq6BAPe18F5qYsh
 JHbVTIabUsGlT6N1BtpjAzTr2M7zKy/oOrz5e73fj8JOXyxYwett+JRH8Em/l8vwh4gcyUceM1Q
 6q5MbhE9tdrFkLzAOOnv9gqNyEfoFBNjIWkNAITOSDCcB3CrHKuMBauS/rE3aKjsckQxirj1QMw
 tHfZt6NKX1Wn4Jzn+ipoaTv04QdsHqD4yYjFjZhxrSAGPImxE4w0BU08wQZMDVgAvm7PL4EZ7Cf
 pyCabuuFqINhoseKKog==
X-Proofpoint-GUID: r_h_1sXpi3eRcjmtPddW_V0dOuWbSQiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_075949_605968_B5917743 
X-CRM114-Status: GOOD (  14.39  )
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
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  4 ++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 34 +++++++++++++++++-----
 3 files changed, 31 insertions(+), 8 deletions(-)

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
index be6cd8adb3b6..cc1f227ade2d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
+    enum:
+      - qcom,qcm2290-dpu
+      - qcom,shikra-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..d2609c24e305 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,21 +4,35 @@
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
+          - qcom,shikra-mdss
+  required:
+    - compatible
+
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    enum:
+      - qcom,qcm2290-mdss
+      - qcom,shikra-mdss
 
   clocks:
     items:
@@ -52,7 +66,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        enum:
+          - qcom,qcm2290-dpu
+          - qcom,shikra-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +76,13 @@ patternProperties:
 
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
+              - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


