Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29202C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=p673lJK/G/ak8lnjNNaxK9tK2t
	I6AZrCv22vvdHvS0+FE5D8OZpqDaOWRvWL/Emaq1iipBbXAJleKkTo4rAmue1P1lGeXPexY74C8QV
	kqCVZNTaB6U5IFZTPGea63bYqrOPi5xH0H4+dRjGzp50G2VW63OrTPh7Y/MrfsXc49e/iAU6VvNWU
	gRj6ob9xU5DX7VpjAZPS+Bh0RFQgivJMQTu3Y9FIlk886lGJ4USAllRJtSFeh57s3l6RveEE7JjEN
	xEz/QSr6OlWbr9de4Bme9nxUfJC5qfuNhPew35upn4Re9tTv2qTyhNDTgmMwoFxUA1TPSAw0kG3U+
	yWFbsvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whti6-00000003I0c-2qwR;
	Thu, 09 Jul 2026 18:42:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whti1-00000003Hub-3JOc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:42:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWrCI2502311
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 18:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=YfNQknXE40JDrClz
	EHFnTG1PkwuOYhq2NNByi3fOFBH8S3XdJ4p84LWsrRi0ASDYyQRM6gNf06kEg/bN
	FmGvNqpXo09tetopfi9LGsQt721cySlXMqnluZSFr+ExFKgd3EctkIoJjijlHffR
	GozG87Gp00lltvfk1OLRHKtNJBzN1BJgoU12ex+wHQvFc/duMohJlGRW2SG/S4Bh
	aLHzSmxu8Z/jb+Nh5QEKnNYPrqiUBBCOZl6iRNe57xmTL9prx8PAeJ1NkYNET0F5
	+olZA6fZD3W4xF0nLUTIf5TwqOmC3Mx+PSb/CzLmFn/5wASY+scwjCdwSSzCuNoy
	6HVfcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3ucsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:42:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so203733a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622573; x=1784227373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=YJJ32wRuSV2luISYsEphjGIfTu6A+Jmi51/GZ+iPiAaME+/WIIAZeeTH6Q7Q6t/W3Q
         D8EWugNsC+FPR/zV26lHwt6ZKC6rzWkpaS81h2vxIB8XJbPYWzNDhGwedl6jndavUQv0
         JODCs4QHK5Cta/MXWgv7XrnMMhh8FTbtYkdjewgj0KQVTkN14n8UBdmpqGSTqJWUb7Jh
         XFDKOP7TDU24IJngHXVIl/3maawIAeplm5MekYpx3VuWVz9fYKB6bLDCdXK9MBoXVol6
         hXVuG/hqbOpnMBgCX2BNpUSxBF0R5wcARP8G2Z2Wk8r+X9ShCwHYD7ayISOe88kitnHp
         cAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622573; x=1784227373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=LNJMstqys3+0xYhiLt7vfuxR4UGcZ59jVUffXXHZ4BypbJ2FjjoIzgOoLNmHILgbPF
         Trf/3Qz57xqQo23cQ2Mu39+8W3Tmkq+qM1/h7z1sQesitjULJ2OxptFANsFX6pB2/CDL
         JqcyAhaPrETFQLS/5GVwz+uo2qofS22Xa3zdpNt6jXxnoVODGFuVGQXwHTDHyZXpfdQm
         oDNydl8eknEx4Umc74xXjOEuaiLz/oIDiNLC4A9cOlQIPL+8LGQJF6a+HBNqHw9TrBlB
         PnbsscSCT0rADp20ZhUxLx6QInjzY9LvEjBkRYs5LNH8k/iGVuost7vDxw56xhvRWK8F
         oSyw==
X-Forwarded-Encrypted: i=1; AHgh+RqspVsXxDEBAeUH8Oege3JHgbfjdC1nj5QjlUqR4J3ytaVm7EgIrDNJ/rLQC6jbkLkNC1GdSFHGCpXnyYt4khCO@lists.infradead.org
X-Gm-Message-State: AOJu0YwDS8jugDij1lArH8AFb1b1lv5WbX+XauUBP4RsMQHd9ZMKa1FV
	3te3nNPH0QvWgN22XZaJN+PC1h0/uUlkYaSO0kqBXA+gRHrH1HcTuXV9piPoATVnKFcfRVaa6xg
	14eu1aaQ8CRBSARCULDtN6tV37jkJJt0jLaKA1zBfT5bDnNQrhtX4w06zcDs5J0reaX8rfb+yuB
	DwQQ==
X-Gm-Gg: AfdE7ckGdoF4fHCrPtd0zR1FET8f1PBjLhzO6rSNCKjyvl+v5/h+m02qY0AIe6UXZO3
	eg8o0PqAUb+O7/5xPANz3cwVXnw0LnCLlLQ4afh994XD3hIZNxkUHvz+talaFmuTWI1GOL75Ali
	Wno1nWItKSJfjptxD2k6kiCcGIDCzVtujO6W7Rtynmm8nSpasjBdLMz3AAkg0M5ZJ9UJHly2N6g
	rnh3sFhgbVmDeMdPQKtftWhOtrhEXirNg4bVSaHl9Fyq493ZgBTEfZ8NNkifGMBbEDc2GIUBYlo
	VSKEYG54UxCQvCsiwpJVJzT+GmPdrA7tX8P07DA4rcpQeS3ti0/s3HX9PzeWfXDFFb1rVT+eine
	ct3R/8/qbYdfV9DaWqB09Rltkawum83WWD48=
X-Received: by 2002:a17:90b:5685:b0:387:e0db:3d8a with SMTP id 98e67ed59e1d1-38943854a52mr8741858a91.37.1783622572622;
        Thu, 09 Jul 2026 11:42:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5685:b0:387:e0db:3d8a with SMTP id 98e67ed59e1d1-38943854a52mr8741825a91.37.1783622572199;
        Thu, 09 Jul 2026 11:42:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:02 +0530
Subject: [PATCH v6 3/7] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-3-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=ZHYwuBBmHydbbYbR66h8CvEw070fSbVdXWh3mYBcTePopE1EO2/nQ2AQyCyuVLwlR9uzZCS7X
 FeMi9LFyjJrC962OmSUnxwOhByuza4MZs+vELBPqh9Pj8eXByS5d7P0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: lGbBUkXUFiaqMyBEY6qkhhYyGL-c4r7p
X-Proofpoint-GUID: lGbBUkXUFiaqMyBEY6qkhhYyGL-c4r7p
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4febad cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX/MYqa/OxFGW6
 EwvFOI7bvCSdIJJzrqxfIDk1ljvQuLZHFqWeLatK/EmBVR1DeYvCQ2AqebCNNilPHrwubHJ0lxU
 i1aHh8keU/g/mRK4QEjLVkkkZ7cJ+H4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXwOGIx7wdbk07
 HLC2fGfv0nUHeLIrROFvu0/wcbQ5P/MxA99P1ByvdJNtI9/OWQZ3nLu3yQ+AjXNSkcsPsONiwny
 HESBreLeRW/cfkfErKLjk3ky6ld/cBzyWNH177jSS/jFRjpIfTeQanLpG19tHnH8bMdkPt8qBFt
 VbMN4Sh6QXfX8vZ0/ZgUkdtgTlrMEipHp7xcPbXQeTKiUKqBZ6ebmF1kspfrpaFSyiAsDFhx58d
 FmBXMURWprUEdJnhxgMqobrjVoVQaey3MJPNMpVOtKVVPffLKiyBq0rXJREpyCqTwD/Qn/A8cd9
 LwSshSkWOM/TYaWoLNbejwGsJut4N9+JX+GDiGPlM8YTJwGIqwOvCwuh8o2Cfk+9+/YfJyJmESg
 aVQ0l8Hm/59I0+HBZWo5cwSKWv78UoEoPlLy4j6/lNXvyInhx2HD/wvT7VEm898TvgIFWjsLuMd
 cokdtI6iHqZYDMKdIvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114253_877863_3BC298C4 
X-CRM114-Status: GOOD (  12.18  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.54.0


