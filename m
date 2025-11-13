Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27535CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=AbssficFanErruzka8o7k5eUE6
	58UvDiDkFODydNyebUXqzhFmGd1Yw/TYi/JTHBBKiUM0OtiW6inf3hcCb731HKQYawQtO+MeW/uKr
	iEs045TOKqM6xHB6pJAWrQC4HHJVSNbDveeJ7oZtsI0NXhjEEO2OCeRjUZvrJ1iTO/Sz6oTydh4rX
	Z+kNy0HqLRZLjT4vxrwCQXZeGXWV+Fo1K53DcegXN7pHW55Zt+JgANe3IY5FeqUK4IdAHt/mcSZZG
	GFB/6Cux1rMDNnwj2wtJO1Zxpp2tlYR05vuI9P4HanoHQbXNSr7om6urA625MdjfTDkqBl1+n9+oY
	oa4dnIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgne-0000000BI1z-2HZ8;
	Thu, 13 Nov 2025 23:32:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnZ-0000000BHyP-0rPM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:32:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMakh51745319
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=ThXyaQTDJPqOcpAb
	1tEkPU6On/laF1l3L7aoaFM6DzJ0yGYot74k9fRZpKoFQ9jOpKf+ce9rvXeL8nXC
	Jl3z7rn14ut8dTx0fKahmsGm6xSazPsfYpmZCsw/J8CqgPizB6jlxTNGOVbwtv3o
	GpgA6+7Id2RZ10O6s9GbGLpPE0IYh/f5F/T79qhql/yUkYl92xyAd9nVpvw/FT/W
	kq9Kw/rN6m0YqrkxiYBGdnddkNctuWrY0WmfZwbamQYVuhOHo867Iil/qJOhs6hG
	fHGf7RKjzmdeHDHtO5h9yooAHvlEGBi/rXyRpnYtuQlKvtbVtmVhBITOsp9ImlN1
	Ww9ijQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9eg47w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:32:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29846a9efa5so34550415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076736; x=1763681536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=gdqMjamVwGAXoNIen4gax/W1tasyBvPdgGVcuqVcTMiE6CjUNZoJqftV+Ob9/gXyl0
         uTqaIviSOfjGUFDsoosPpdgUfHGFr1NygNsN+NNs1MhOF+UjF0J+ErhA+2newil2qkoo
         ZNJ9AEK5nNlu1UrNjIcp03WCvA7VOFgeJ2JA4y3gKyMxMwNmuX3MavD+6bzp5JHT0nQn
         2nRzNxa0cM92xhtLVOubv0R7+NQE8M1nHf5/oiNHg9O11iVsdetwD2LNzFJItaw0FRos
         VSLpwQMv3Q4IMbXdDyA+d804kok9nHJw6MEk3YBUX2pPpUqmMpqQSBmLp4H4Kssg+kd9
         9oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076736; x=1763681536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=r1YSKVBowE+MHVh5f5q9pq8Wc14KbEgUqIAbgFag6di304zNDsWvW3G6bWjzamIDJO
         H35drVy00IvpACZrBk/em9sgS02LoxJ8CHhCh3rEyHPqeNAv+k7JDFtRnh563R5BfyjA
         FdDFEbOU8xhhGGg/3aGAoz6lQbowTvidfR1cixJH10hx0PYn+Y2iAhEVA1qyuaq8daaT
         eCDYLR+K2sBaoMic/c+Q5xZgJFYZmwZgTAZC9Nn56W3MWSONpOYtDRbfl91OMIFqKQK3
         3OgukqgGxYcSqmkQyPoeHp4S6P1ySdc733lpZ2czqRKVJotswE4RR15m0kEpJVvWmEyo
         gdeA==
X-Forwarded-Encrypted: i=1; AJvYcCX4et9LKJLZI5wgmAz38X3Ix+YHaKJUWd/Hgf7zme32uOlELxACALR4JEaY0bFZLZzQHpZ/U4VUnh9n97fhZIbk@lists.infradead.org
X-Gm-Message-State: AOJu0YwOm3n/qRudY+n453SZSgWMptQ6jtNLZgX230WUVwRhqgWPjFo3
	3fRYtaED7f+xiSWHjfUeX88Ezrch8iC9yBUYkGVQchL8I12RYbXnHM019mnTK0IXrMVtV03cB1b
	G2oE35C1wq+VMspTzGp90Q5CTS9fFhS7IUrJlMi0REsYXoOLTZ6i/THRPqLmlImDyhcehLSzuND
	qO/w==
X-Gm-Gg: ASbGncsNwhNBd8OtG0Pzbij1Py6ozNZM5Ifr1RyCx065cO0+1nvesMAdOGfLiaepo32
	Anhj/j+q3tN1VeO1N6oq9KnVMeovko/52byaIWotR0GVOWgjUsdfinze/SgABfmfcrz8cMImIpQ
	/W9kSEmMzIEZJWWtYQv6Vd4qSybNONEjWESxhEbvbdf864FATHK1QNarXk1oKiBdiZzFJUbAF+S
	0gUhECo6LEHDX0SYI54qi+OwG0SmOzmdlRF5qtQKmQIFK+4f+gOedcYe6zd6258ISIcxv1XM9/r
	r3B/ZV/mN+iqtpDQn7bLXmv7v6wZd5OAGO9jPZ1W1DZzb9tLcQ/fLibsHXQAZh828lkZOCcWdpl
	H9XjZuoiC/32v3G1tB954AlU=
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id d9443c01a7336-2986a7435ecmr7356125ad.47.1763076735707;
        Thu, 13 Nov 2025 15:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEodQqYgRJkYLIy60kg92PboSbyAXwzBxQKHsvJ7k9auT4mdj7T3WB7cWTBc3Q78iQHPbKACg==
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id d9443c01a7336-2986a7435ecmr7355695ad.47.1763076735212;
        Thu, 13 Nov 2025 15:32:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:32:14 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:17 +0530
Subject: [PATCH v3 20/20] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-20-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=1677;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
 b=VcSmbJTK+AwALI8XC93AXkctqWpbKLucIhitRFtg+TnNd7qWT/+mcPon0M8DxlJ+BMR8C3A3A
 P4jrORXACVYDIs9gVsH1RAPyI2NIJ+HFj6zCe6e8XrFttR2KeLzGgOY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX9Oz7JCFkb+Ur
 1i0hZ16xH8M6cQS4O3XvH9pSLJrgwtRp/qn0CGORPMnaveO3waXeSM7rVFvquV90GIYfDzvNo1W
 ufSHKc+snXnlywSECTrJLSOC3D/RQW3osiK0f+l2EfHsUzQkmRgBZZHOWsDBNnKnWfhKPD8d7Vk
 av970XyHZri6+Qsfx+QAM0OnFgiW48ATo23xQhbEHb0CFGr/OnbHTSn7xWLGjrrKpI5IvctZVT4
 TYCbwIYMSRATRLFjR7yRvKL4MHKzzGGmUcaLDpQjTvwfwMUJDR3ZqzgvakGK9YqVk2Ck5HlfE0y
 5JVE0UDfERa+YanuvVLhGlbu72793ydUV1/9FgIqeaVy34SIZP5sydFcYWmQLSxs48C1uNTXS8T
 pEmuNqWUAgQHGHeHehGPo8RWnKoy4g==
X-Proofpoint-ORIG-GUID: ouwAIFwJO_i2SrmdzGLTUqsAZbuqcEY3
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69166a80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_Uo5JhhLEGw40-SN2AoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ouwAIFwJO_i2SrmdzGLTUqsAZbuqcEY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153217_294549_4DC67F8D 
X-CRM114-Status: GOOD (  11.90  )
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

Document Adreno X2-85 GMU found in Glymur chipsets in the
dt-binding specification. It is very similar to Adreno 840
GMU with the additional requirement of RSCC HUB clock.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 2ef8fd7e9f52..e32056ae0f5d 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -327,6 +327,36 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-x285.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
+
   - if:
       properties:
         compatible:

-- 
2.51.0


