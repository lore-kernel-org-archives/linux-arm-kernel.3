Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E491C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1PlyRPcXY4M=; b=cbgkYM0s3MxSdC5ttfoMjDbbkC
	RMkMsWAgqzzRA33XcvFiH3rQVyy0WME2vA1sbToKG2ByQ4aB85Nx65wFYAxq7L7n5qoLNJYNmrJ0S
	E1LOH9UQDAFOPJOCXflZ8hM1ZJAyD6Tcw5fvxyTKgpMr7JdHeLcOZBGfdk8mM71JmO+R8TVwaA6Rs
	DI5sOPSIGrbv/7ydO5MHLNIMfFKdojc94bQXG9f5RE/HCCVQdgQer0BbPxXpHsmFFuvYdKfuF19W5
	0Lf0nBLm6ZEbXzRNsIVLQThsyLZJsZipjO0T+vV1kBeGpFoY3mfs1qtDbxY4BFJaxx02M9ZIMsb3T
	fUsc/C4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PAC-0000000CIgv-0ki1;
	Tue, 01 Sep 2026 14:08:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PAA-0000000CIg1-1URc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:08:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8Yre2270319
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 14:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1Pl
	yRPcXY4M=; b=kgIepFhy1XHtm0FYuPNVqACvHfAd8lpc129/YWZ0kIP+tvQ/MDs
	QpXkSjnSAS9TgmamOYXzRjoRh/34hn5xFIcvhxjAeJvBRruXqynT3+s0BJxgBVbK
	aDg21qL5AxhBhmgoix+HqsA4ifWsbRATbzG8I9enKZDB/WgessrYES1khb/TUfeq
	CBdnTd97J/1oTw94F8d0NwboA1NGyr8G1001ss4vT6wo3nsjEsiEFrr3V8ikzww5
	OtSAuPmUwtVN6RqCIGuMve+6Xq63BPQjxptYqTLlw634fzqz/ntGKcyAnKIezbR5
	jurnC5uJn0qDoOcA/WJyJ6Dte4eeNRdRFcQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3m0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 14:08:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so8949783a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788271712; x=1788876512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1PlyRPcXY4M=;
        b=d/CI6JnLutDy+qGgEIrBHD238RckAJ/RmweiJn22y7pA9+mkli5Ly+0humW+mUi1aF
         hHvXKU7ZPBg0S5kTbjx5XTeqLj+rJyWAYU5wcPVcIDgK3XPiS0uSmTBXF/dKzGJg9Gf0
         BzMHulQNSSZ5fImARpoBAfkRtz/ocy3wWura3OA8f8Ypn+3YvYHmo4plKQCemINTAeCU
         HpeiDZ3OZTx3Zm1RNvtW0o1AwgLtWAaI3O9EKU0PzS2FQIvk8dp9yVtFpD1kKcpqSehA
         9PCEfUT0w3DXkrm5SAPXh+8QKi8tilOWnArnfAOsdMyEReAiCii285N0HWa3+hi3O06e
         ksaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271712; x=1788876512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1PlyRPcXY4M=;
        b=KhKW3OytktwPGTRyKLdv3+vlkfSNcc06+DiunTjoNqrLLo5Rkt3i8l/9CNYIj0LuiU
         tXQqhb/RkbNm1jmC+F74Pl57jpkC2tryd00OZ1X5Dp9zxBSapYRm/xmz1Om4LEpD7wpt
         BpO2lOfwCndWxtsrwn2BO9KU+pUQuHq4dWzssLmgVrYKAD7PGuG39696fqrXW/Rs9y+o
         qiqIpgmbQ1dbzlk0RYHGQA4RluEPGS7rK/x6drGxuaXLOCoKoTMXqGZhap1zMvD5rC5C
         P+HxH6+WwDQtY2mm5vmRe1jZv1eqpPlBhLOFpXs4iP6/49C1cdZcR6sXorGzSlg133Ew
         Jq9g==
X-Forwarded-Encrypted: i=1; AKwUvBzGq9xWW5vL2yPuLTrBhGun3KSqvyv2LDDFZhZSc/PkuzJ9ppFM3aE1gdB/xnKwmtWpqGqjhWXTCsiEv85BDfWO@lists.infradead.org
X-Gm-Message-State: AFuF++k9YLHJTjdwWLi6j+1Bb1YTntY3WGmxCmGpb88nF0PCyP1m5zDk
	hfk2bm2vgVDF+j2LaDsrXgqy0zZMjkPv2GrA2YUWseAnKONrw1m9DPoAgukYZaNwZTod3tsmBKR
	mPtT+UhYSf673bWQL71JP7wpQtu4Do+GhyuZTegWLRiF5fMG8KHEzKhhDXupOo5yTYOV3gk7H88
	z0oA==
X-Gm-Gg: AYBFou3NIMyZX375Eb2kf8PWg/uKZgNplVrVPMtu1MwRPafDUiHpv/4hFfJrEvN6Ygb
	eAPGx265R0ujqDRN5HLx6p6kDuiD4+4kj2+fJvTlr+br7WjAK4kBkEDf4lAVfGf/dWF4epm7xwk
	JnpEGezg2FJY+NjlK5zlsCvCMZH8ZpXtCLqzSOvb9L/Wiqx1Xawih+gAe8qR3uDh+JPxfO25cGz
	vY00VIIc6ckx3Ebdmd8XPO2Mca5sQ3V2R5h3a5VcWEm5I4EOdRDQpH42WrUdWaD8ILk8XdNQ31h
	4vfAyIJ+4UDowLrBeGoPREoWpwpIV8rWDUtqaXCfwLjrX1KrhMQCl3V0iGAQYQSQ3lAn8iWcI9A
	PgR/D9N0F3GM6WGS4muPeM2IkuwkLH/9O0+MSgBO1RJVFWnZIKDiM/rWvENaY
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr12734711a91.14.1788271712097;
        Tue, 01 Sep 2026 07:08:32 -0700 (PDT)
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr12734531a91.14.1788271711452;
        Tue, 01 Sep 2026 07:08:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm56447342c88.0.2026.09.01.07.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:08:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Tue,  1 Sep 2026 22:08:16 +0800
Message-ID: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96dc61 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=W7vQhCiC0Tbq709-ndwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX9cXIQOlroeBj
 wu4XoEsFJHIK9SfBkgqdhS+Hxb90HiIArXar5wNm9V5huu6KMHbKaRvc29agr2yFj9rSKeb4RUJ
 7OOduTNwC8NU1G5sNK4JA8yvEAI/1oQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfXx/FPM0aXHPMK
 RmM4N51Kx+uEoDpDJNM4E/GS8TevYjXzEzlH+251xwWXirENUdfOXD4a6P8DiidxqcP63356MQ8
 bLUBo0ZxGUEUVRnr2c2ozfYiI/Rzil1LVjA+ueg2YXlNHKcVfMRkw9GY05qaC6jiwDI0z/RKUiX
 N8KelP7nfcWBGqyXKhEpAqL3xo0OLfufFzJVAPGw2B82V3xM4NgoW0WH5RqnvbRzte330FxMUMR
 mqxhh+XdGyIDCvcxPXLxrUtFrd+ZiO/Ce+gXN84cCjv4XpeBXl2ri8l/JmJN39NaqxwKHbH5exJ
 as53WbnX0K4MU119Fpbm8JNzcwHIl3oIpAtXnUEHe8PWyWBAkoXzCImuV3hrsSg/cLcGWFL3981
 ww1QKZkHRSRJRzWTlZwoDUmhdnvs8mCamWeHFYbwZ8gsCnjfvfpszXnGD07bGTVZQ60KL2eiH95
 cOVuCxiiK/eTZn8YwDw==
X-Proofpoint-GUID: WRhPMDFLjsvP6eLkh4psdBTXz3FZC-zP
X-Proofpoint-ORIG-GUID: WRhPMDFLjsvP6eLkh4psdBTXz3FZC-zP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_070834_393911_D8027BB6 
X-CRM114-Status: GOOD (  12.60  )
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

Add specific compatible string to document the GPU SMMU present on
Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..ea338d313c05 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -102,6 +102,7 @@ properties:
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0


