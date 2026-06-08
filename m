Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F6ACD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=; b=s90+KpgiUt+ujwlryHjZQoaUU2
	IYzWg3A3c7BOI/OWBgwBLQUztQtMPhrFRaHD4B3drIrOMU3u6VuVuxQGgzsS/zhZ5aj0wQFicGd3e
	9eYNgpuOseZowU3FG5erEqzYOMtcLA3qnAsOf0goHxNaQFjNfDr9xDxPfe6InThzTs+vlwZGRFkTD
	uk0Atko2+sVcGDF8xx8sofX5ws5Rmyl49KV7hbnjMhiuVnfDgWBpyNQeNaoynWjaI2qOuFPKjoayp
	mQHbhDqifLsvrErB3VbNrP1xDhcGq8XIgCLZKMqTX8btWo/GuF3GPrQAsYdDajqFjkVQk5XBWPj1M
	D15OGk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTzs-00000002wBK-0rXg;
	Mon, 08 Jun 2026 07:02:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTzq-00000002wAQ-0MB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 07:02:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Rama2833828
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=; b=LkjzvS6F7bXJ4tOj
	C3sz8nXDmROsAjh5QWk5fvuhZV5SLFkwDQvzt0TCTge6v4ZKqKcUJLhgTbKLu18L
	2K3oLpCpzUVIDkr3ZiHDTWSh0kba4+pgsRlOMWAysVBu4equjwoNOrwDysludr8t
	fEiZKyP+h7wEPWLKLYOOEpqCGqEN+KFlUo7o5+4EtvSVAJWMCO+UH+kwFF73dw3Y
	j8/uYDV6FDzQD+/3FkraiDFTR2j18C02fzoRXrSXpVEmCDuOtGGpPBVVY/GxaqoW
	hYqSlMXaizdn3WewH4Dp3UkNPrryCB2tu/sFrHOPPy+TSy4BNEsX3f3ogRti26Fi
	cTuekA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4xpn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:02:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85edbb10dfso2158306a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902124; x=1781506924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=;
        b=MdCgV9DazhEzehSgL2+7Gh7Me4iZ26fwDoRHahjTdElv3KIMFyoge8ivkloDo0qVfb
         tjVW3LSwTBolm73owkY5ilXJyzXgyWkv0mhWE/HDJz7SR2p4LzZJuvTnrUVeJhTQdbHx
         o+JlHcc2rahd+BaTJ4bpqJocoL7Zku7Yf+rM2jb+x+ZdrQAhvCnl6HZiBLz2E2eMBGHl
         iznweZzR9Zjv81aWHS0AeYLMtmvSYjJNBMAjBFQt1CeaKU8/6NSWpOy+ns2OEMgXhsAs
         OJuc7JQ2hTutneO2kAQ7ui0gC5pKRKyP0VBpXHmLfxToztsUFpncRIFfvFlhbW2sPQEl
         FrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902124; x=1781506924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=;
        b=p5ZegVx//3HReMT07zlivsYPwrLEt2fAXpkGjME2wXaMlaj2JAKhekrEIxLowKjKIp
         6uq6gywlu0X7mWfxGJ5K0Mg8MmOxup+u2A6xrmVKa9zys65pDU7Sn+islXvo+jWHxJ3q
         +LclmG1+Z8EDAAm58nwUD9fWI4g/0qYpDz7JRdttWLvhfD6xrGgWL66UP1K7lo21OMWr
         tsMq9tubePTSj4kWQSTw0P6zQE0fIIdfv6WkhMA0iIvWcws46c1e6teL4Ei7FeU+FrpG
         /0FEsi8Siy/rYLMBbTK40VqE4oTxCeiY/svMI5vRqKAJh79zy61g/DD38LzsmAi88hCe
         NXew==
X-Forwarded-Encrypted: i=1; AFNElJ94tErZHdwj4lfxjnoz7LKFf5nam8ALpiGAY4UeOxrJrRpz1d6Y58oX6+drZi58sK1ftUaPDzimG9e1LVS7+Ymy@lists.infradead.org
X-Gm-Message-State: AOJu0YxEkU8jW9UIKycl+38MpgPJB8bQx22QaIdkQ72neo0Ij69vthEi
	gpg/LNKBwHcFomAkom/U1bv8QxvMX+SJJqr7cCYI0NH0eHWgoxUz6MQ5NJGDPGYr9ve6CADeJm7
	Ui/5AT33Jik0AWLaKjcstR7W/sRzPOmEwMQJorwFRZKd4CeyCQvPcatFmmEr0YORBB+PbLzYwmj
	6sXg==
X-Gm-Gg: Acq92OHa5fTlyFoH16Tr5GqCg+eDXKTOlEvbbrAtsrG8BvxYP9vXT7Z4msavN0Jut1E
	qG5SEVQGMToQHVEfPDMYWx94p8LtdHzmqx4mL4zx6XVptTDhYAxdKvuwYRclbvqhV9zjkKDEAgh
	lqrigZn9OXHdpkm0D4oowuF1mnoFNVTYGvAWF1NgvNbLltG0QROLKDIlrggM0OKC1HUT0bk/n8K
	pQkwZ6X7MJBbQY1BaRAr9EE+ynhRgArJrVSCz1oQV3LJVyPSu/gilBXFLxbZjeFX1C5FCN4nDhv
	EGHe03rnPABHGVjzJcjDFgd+vqdbLKb90O8Rab4FBaPQOs4IE673glqss9pniX4V0igmu3kJGlg
	+78gG63F2g3doO5iThRIQpTHihvPSbwM2lFmILVvkko+jKrHYIBSRyJqbTMI=
X-Received: by 2002:a05:6a21:6b8c:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3b4d39ea8d8mr11958832637.1.1780902123813;
        Mon, 08 Jun 2026 00:02:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b8c:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3b4d39ea8d8mr11958792637.1.1780902123334;
        Mon, 08 Jun 2026 00:02:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:02:02 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:31:42 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=3783;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=f/sCFDjTgatU0BGy4aowz36ZzDRGX9hyPbW8Spw3VEo=;
 b=3x+ZlUOf+wBvB+AHBU7fiuERNwbEV6hSQI9aySyJjZAyO4j5aINgHa5ClzJ3B/FdpAky6FC31
 e7ARgDXnF/bBbGnNPhCthcBG2EpS3e8W1qCplKY/8LUfa9o4nFpoBd7
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: PagByqbr3dGyfglpKaedN9UgxIuKVDPl
X-Proofpoint-GUID: PagByqbr3dGyfglpKaedN9UgxIuKVDPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX9/PkIl7tsZJv
 Z0COSZHzNYVnTCFf8CgeQpIQ/vUrJzZO/rFE8S2lwuZdlH3coJ5Jt2cKXpA0zwvvuJANNIOZYfn
 i+J4z10su/5hnOmixINgfK8PfRTS+XfIWvGEPs/56A9W5QC7eRGnn6i5xNUhdw5E/CLyAfwqwFn
 25h3szDwwTwV7bT/vwwIL/+ol+wBJVH1bDHb/+VMgCUDrCiDd42MT0aWD3Rv7sedbbBuDcg1SPi
 gp/RhYdhos7CLhOEoIW5075sPmq81jo/NM5n7ve9TOov9P6kMMLZhGliTGZL7wWDQRJiATeB5oY
 G/InlZAgY2VOd+fhPn+oy0+xzZH0HIpM/DDv1ExYX6bstyWqedaBvAfury36tYd0uEHI1jy4d+o
 435CDVU765CGF9aAhBad+/kFOkv0gtLrWEzclXW857jfAFf6kynxxpSMAUvSppbcztLZzybYSMq
 yOTyaN+cx0gvmnSUs6A==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a2668ec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=OEkpyX7SRU1z48_sfK4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_000206_250738_A87804C0 
X-CRM114-Status: GOOD (  14.44  )
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

Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
the existing qcm2290 bindings to cover Shikra by adding fallback
compatible chains for MDSS, DPU and DSI controller nodes rather
than introducing a separate binding file.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..fd0834d09ad6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -47,6 +47,10 @@ properties:
               - qcom,sm8650-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,shikra-dsi-ctrl
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..034d3df8d247 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,7 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
+    oneOf:
+      - const: qcom,qcm2290-dpu
+      - items:
+          - const: qcom,shikra-dpu
+          - const: qcom,qcm2290-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..49a7b5c4c678 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
@@ -12,13 +12,18 @@ maintainers:
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
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
@@ -52,7 +57,8 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        contains:
+          const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +66,8 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        contains:
+          const: qcom,qcm2290-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


