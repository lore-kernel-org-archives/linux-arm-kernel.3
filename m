Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD25CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LSzjyVjG6hrqp81++brPl8d5tvFxkXJ87i4EMFI/KTw=; b=1N/EQmDn9jOIUNYOcy7ziaoAo6
	qqYlzjztTS88j9kDDQFt5TF5j8zAqsVyCYuBW0t0itg85AN0jnUPB5Y9rHJ7nm8etFomqXZm5Jf4Y
	tEHe7xqGEih8JeyUx3ET3+3XNb5CxwbV3lO8btxmtOA+89FLAj5AlMaJiEeXK8fU/httH3eTFXgcx
	iYaKoXVist4X4PNeRVIc1zrUwwsJzLkO5dBXEHi6rySYUwUQky5J+mlYv++SiI7oBY7vNiVdtnZBZ
	SOHWEo0G690mDd5+bJC7MPfCNtOaQFMPuGH1bTBPjOWgFyzk4mEt6+dtnLeuCJ6OFqHBJWWwwfUkj
	zGb/XBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPenn-00000004PWi-37uM;
	Wed, 20 May 2026 11:09:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPenl-00000004PW2-0Q4j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:09:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oMHg1177868
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 11:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LSzjyVjG6hrqp81++brPl8d5tvFxkXJ87i4
	EMFI/KTw=; b=KXByLRgrJbKjITkMQNEpX6/TeDLS30yoyDNjFwTM08fdhjJ3aQv
	oFwhGD5N9ogJP1TjxKmxHGIE488U+jjIA/LK4ntwuypi045iO2J62QFiKtnNePQS
	uZD7YbR3jhWG9PPy5zwsiNX70iDnT5oWXqDf5Fn83kGZ9+7+qFnayFW8hzQAPA9y
	DCy/dxLUoysibXScfjOIvjOSjkL+VZI3RfeEes4DIPcWyKmGJO74KEuxm+N16OU5
	uE0SdFPxCa+jBRACKLSeuCQFzxipW8fvZBoWqyLXlE9j5KvPx++BTV/bUuUXYudT
	mU+CbJ9AEwfFvOyu50VbsENpWFJxbaV6TKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6r91e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 11:09:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b5d6bb45so51119001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 04:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779275362; x=1779880162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSzjyVjG6hrqp81++brPl8d5tvFxkXJ87i4EMFI/KTw=;
        b=AGVhAo412rslT5tU1qa1ebKikmYmbGAxgLlbBvMb00egz3pU3nLziSTgVqdnRPE6lt
         hfCghgTQHwJeArXccP15BONmhGm/ggp2VBS3zmfJDN/EVWutLB7GUFpM2ScCWfvydX0I
         Otb/sgyq4w33SN/zMVVFd6hN0jRAvI2ZfeqSOgjwHrcoBERl6HYlXHdnDNNjvhM2qJ4j
         vJbOpzkn1U+Iw+aq3Gs5C2QD4IsC0NSVq1FRd0nOjGmYrHGLKRQ0SWRd+fulgd+sor+X
         x4oLKHoQc72uYYgdcb7uA/IKaylCL0tNaZBEM91Cg+XWwkulqLY/zVffXkpYtOoMVeCt
         3hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275362; x=1779880162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSzjyVjG6hrqp81++brPl8d5tvFxkXJ87i4EMFI/KTw=;
        b=s7ForOe8agcaTzQ/NW1raPIpEIu00aOtZbneeqsZUfem75zb+OHHxx5fAarUDMqHwR
         nNmFJti2L8mJgArzN+juIgZ+6lvSVJA2ZDx2cQVITodAo0UfQADRpEk3bulZ0VcXydtw
         +xq54vM0OQXPJXwnBLH2uiFLOyDOX9Jgc+BPaFWAyzMnMw6S5Byx2rqdjdGxnG8l9jY/
         l8BqOPtC9U3zXjJGU9Hzc0ackB/lp/LxarfC2S3ujzn06rftUWWvtY6fEDFeinJoXNfK
         EizQ/Yrh33M4xOhIyYUFzBo4CVDo/xqaGSg5mkurcgxGl7fXnzg00b1rhPA+pZE93xgK
         ZGnw==
X-Forwarded-Encrypted: i=1; AFNElJ9DtSzYmCuJN4cVGt7TTC0WwZA0xodhyrGnRPxHdEEztC0Lul7pc48PTluOMEUW8HyvH0UfC3aEUm4uHJa6TJh7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8g50YVKT4RCGilU4Z0iENT1dmCvCzBBDAdWMp6llaQv0A3WeI
	GSrFlSrKlfCLOc+SW/zeLZDkMxXGgCkQdis7j9Kz+dvktBd+1CJy/fDyaG2l+i34KQ20iWnHbNf
	m1TRteyysXEVLsuPOacdHCKtreCdqjguOPm6yiw+R7xvbysXfTjApQlkPuqko6Hsmv9yXqJZE94
	eYQBaER4pWIw==
X-Gm-Gg: Acq92OEXeOEd2gq0ANkT5nfWHG8OMeqIIdXii9xC1JYZ6Lf2h4ZGmlhKp3S3MbXWPsT
	d7xHCjOpCvF6qn6Cbbib1F0tKT0F0O2VYN/bZuXDcG8cYOCBGzBWIhYEhh/gMfE3FdR2b9r2GmQ
	1gdC2vG50/S96B6ANBBuh/kr4XpSZ+GnNIJ/MnHjXgY1K4Df9/SRJfkFwRzdLZ8OoVAD4ybqlYo
	wov5E2PFFLIxKtQNGqwtAB8fyX64aOwuC7nmZ0nHHAAMjMxvIqtMkONoPR+6AVyeAuSBRzuO7y+
	jnWn3v2ZRBC/SG12FY0neL3I1U1W46tkBvhmRBWiEN1NpvSNHkAqQE0+SmGvDBq5asyz86+I3yQ
	GnWcP/l3Jr4KDg411tMBpgAt7/Kf9gXT5d5uE
X-Received: by 2002:a05:622a:5e13:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-5165a0703b6mr307281971cf.3.1779275361727;
        Wed, 20 May 2026 04:09:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5e13:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-5165a0703b6mr307281551cf.3.1779275361246;
        Wed, 20 May 2026 04:09:21 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm54498441f8f.34.2026.05.20.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:09:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Correct and add constraints for Hawi, Shikra and Kaanapali
Date: Wed, 20 May 2026 13:09:14 +0200
Message-ID: <20260520110913.87271-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=oCPQi6pqJjnzYEElWY4uswSYuY/PgQ7qdRL8tbXVe18=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDZZZc95YF3PNkoJLMoM0Gi3JS/r6PIDFTl9wM
 0LSdyjF8TKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag2WWQAKCRDBN2bmhouD
 1w9zD/4vDQx7945Ay/ee+ltZNNEk+Qjl5p1UxHJ73ISPPzBJpbg3RF5YGSvGQWk+/KS0nnjzpjf
 gMI4+iLQC3cKX9la2sc4drK2nSpIP4dWS7OiCvpDPWQ3jC5a8sqGp+VT7RMKCdtxs6nMS+HsOmL
 luZb1chLuYTSL0Y8FqN2QyVWUZQCe3ZZNPrZBmu6nsVqvjJGkFA1l/Mkj67Lw/xdegpccqf1uyW
 WF3DTR32yyZJLFmvWyAUHyLBtx50Wi5ENU1yoYV/A6blEXSka7exP/x5mbl+Zws15iqF1Iscn+d
 ClzSWn3pxbLrzqXB+YgoStjQee9kzzfsSF3dzZqcC6iiNSUpfLaP169WMBP47SQ32LKYF0zSGAT
 bDgdS/vYJUxxjS3LQQmTZfGdpVp28xvrobWG79m4dHCE1cQOPA6tm0gILdOLRUX6K6yaFadBaF/
 A1rdPq2CORYpNEgmUBrn6wavKN586NjTnO4CKQ/MKgo8j6tcL8IzV9DmWr5S4O71aqk/P5yQl7o
 EbllfOHpktQHIIpTwVqbcScHjeITL39hDJmoDoU0S3/RlMQxyQbMc8izYQNjt/9zV6UthUBbRQB
 S4eUJyB9DdX1PC81DkzcBFskv/i0zVmEnt4+KoIl4vR202EX//xwNto9LFUmE4u1+IqxXlDo7s7 pPbZCchxmqJzrlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: paXSEJatzw1BBm3GUpXkRmQmA0PsUuwH
X-Proofpoint-ORIG-GUID: paXSEJatzw1BBm3GUpXkRmQmA0PsUuwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNyBTYWx0ZWRfX6hpPnHZHU5Ms
 9dcsMCBl0HwegvaZnS/bPC+CVzTmhiDW28g7oWbTg7nzIJEDU4S2ga0xVrDQJUPeDL+YlERIxB9
 nn2NgLxDKHBcVvdp32ujobajlnR7c4+/ywdmR3oZei3OyefaOsqwKVqM7PLwAeh3j7F3ylf9B08
 kkEhMls5INZxh7A0ARw5VH7RLdzxwsfWdT7b0ERJHgytD2aSY3x2r/bV20kpl11amUV+tZIclzP
 az7yBQldZz2Ai82+23Xz9v/XMhT7bQeRL8YYu3+lBnlWgnOtBOlnQoc1HSXu4Sxpzg5M1A056z8
 Gq7k9uxLvHqF2QsYeGOoW7wEF/Jn92d5FF6Gq6w1G2V5REVQkGpMplHlRSAygCkF2GPFo2D9+sg
 gnGtxBvu+SjOhDzPwQscLqXSa8eYKMJgC6lL4EeHWrJ+0+mBmrpuWXkcd0oJD3rikXwbyapK168
 OCGM5nPVmgm1vcm7Lgg==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0d9663 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LWJPcmncUgEYCnjaLLAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_040925_169113_1BF1B603 
X-CRM114-Status: GOOD (  12.99  )
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

Previous commit 75949eb02653 ("dt-bindings: arm-smmu: Constrain clocks
for newer Qualcomm variants") duplicated constraints for
qcom,sm6350-smmu-500 and qcom,sm6375-smmu-500 - these are already part
of previous "if:" block.

It also missed enforcing one clock for qcom,kaanapali-smmu-500 in GPU
case and missed simultaneously added Shikra and Hawi.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ed0d10157bd6..5103adeee6d4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -568,6 +568,8 @@ allOf:
           items:
             - enum:
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
+                - qcom,kaanapali-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
@@ -614,15 +616,15 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,milos-smmu-500
                 - qcom,qcs615-smmu-500
                 - qcom,qcs8300-smmu-500
                 - qcom,sa8775p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm6115-smmu-500
                 - qcom,sm6125-smmu-500
-                - qcom,sm6350-smmu-500
-                - qcom,sm6375-smmu-500
                 - qcom,sm8150-smmu-500
                 - qcom,sm8250-smmu-500
                 - qcom,sm8350-smmu-500
-- 
2.53.0


