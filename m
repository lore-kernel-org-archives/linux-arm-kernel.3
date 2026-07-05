Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=; b=ShrnbxNXEm1H1qhF41KXSkacBY
	t+JDT1PF9WNhBsDdtGLPDYie8XqM6Gewn5KU3VL2ZBFhCOBVcg380EEbXkE1AdiLyU9yhWiV+sDA6
	V46CoJIsnS7MitYA8az1Ct5vCny47iPfaj1DzulFzkFqRr3iGLcY5Njsv2cI31/6OMUP3yJIERTE+
	nvKmctgCAIlUdzuxqhhS1qy9r35dOJos553BlgPktmrTzpCd1DZcfqIFJ0K2lgAyhU7ZsoCgfDQIn
	/6UEs/QXph595062kmDJYeXUcr3uiU9xTxFiJDpjGkdLimP3Hu1BqcfD7Bf8xppDFtCiPCmI+HAKz
	sgvyUoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0R-000000096QW-1UhP;
	Sun, 05 Jul 2026 08:15:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0N-000000096P8-0coR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:15:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NaprG146751
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=; b=KvAciPTo2opHuKFN
	hIdWUJNugTqAmpZnAo3usxfYZVs/0s23fjArjmpVvW9KWQAS+qXw6UxcUIinpVVL
	du5M7pS9upROlpHBDsp6SOwIRLMw525dbjpGq76d9GLofEEAT1a5IPL1r0I+duQV
	Qxq+jSCOg3Z2SPd+poj7m2ZD4Sbhcd8OlKWfXpU6p5nkcsHgrOk3S1QQSrUk84LB
	qmfTZJHNBaZlxPCa0y0WkBFW5RrTJTpfc1gMjSyZEscAsF9PwfeEK2I5I6t8rU1A
	ckuuruQOHoKwR1uiuiEnp0dX8rReYP1ctx0kxpm8CS2newYWi2m1RMGpQYgJvRTe
	XOisJg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3aaq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:15:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caf4173b1cso33797145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239310; x=1783844110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=;
        b=K3m3Fj6DoziGhLPAGW7gipKXsacnxyAImanAMK10sfNA5it647ub6xw8Hf60QmE4ta
         hNqw3qyfrkbGpYSXT61OIrSC2kONIObkn3VKgUEbf74TzTUf4Xl8A+KBFquxUQMEr9aG
         8E3AhpUUfbUowSJAEHvfntFRTEdlCETjbFqQIUf+fz0WXON500PCVl4+htpz749w0QLg
         10noJ5lZv3iEHgfZWhxZP2XPYhg+yG8yrGUTccy3LifeGoEaWQH3Edbl+FiN6jJf3P3q
         t9pkm8T9jMI3TYiMy+9voij1s4iSmsMt/j9rKsfgVgmIOqFM+Y+HDraNdhkpzRWSSqSV
         OLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239310; x=1783844110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=;
        b=KB+P7hP+rRyGUy68VXaGOIJ9UeNtrDSoVksCd2lDS7uqDBhtEv/yDv8Xua7Qr+Ioop
         4s7oEKaQppFgoyQCsGhB+Ud1a7ivNrcWpsW1isCVYJrMzAtHm4aKNC9Bs7/YBRU52KHL
         nqUas6Ka3za2MQIwluV/xEcML0JDMQadspP0csueYUcWEUMIbU9EYw7Ne3phTnGC74Mw
         sLM4SjS5jwBE4YWuvv8mMY9Ca+VHMGQNbROmmdqUCXUm1GdF03aBn3cErSZd4ANg8sD6
         fhVGmGDVCuvJdvpElXXW7Qlih/8+aP9NiutEUToBs71/P3ytjXRj4ZppT91DrwY12ddf
         ISrg==
X-Forwarded-Encrypted: i=1; AHgh+RpRHSapIUDUiPzJChi4gF3P72jTFYrLo+X0SHUBxL9KTP8DVfZ1pP4RhY83a55NV9+9+J9LfpoUnfKdD3ismmJG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4ACOYaXhYvEDGoqf+PGWWPgAorD7h0Rmh/nO0rNA1L5M2FZY
	2EJDYL2b9kdco2Kf3X8H1O6b6cbQ00rGLmv5Ds3iHyuDSJZ6MsjXXrreu9B9wl5hGmVQYxN+0wu
	gs8FtEDduqTqJ4l//J4NuceqhEIojJmzqUDxhPnZfIJqse5yk6tp60XHXYawViLWbkdUgDSh+36
	QZAg==
X-Gm-Gg: AfdE7cnJMhJ8T2EhLiLMvxFdayJ0KZH0iu1TaFYPKlDhOQiSD+8IgukuzIypv/h3Kza
	XXL1neqwoC5NFG2mHOnJIgcaqk2/800Pf9EKPoxuinFdJNx92YJO19L3b4/08lM8jE2BXtMCgsH
	6A3agjqhJJBYlgQQWfVGmyXsXORx7gujP/vexLywwoDF5u91Iqp3GhQZOED57+5rGmbu2KetmBw
	fzSnLy4OF1FaInzn64qVGKZ6h3f8pxCB4+MfI0hWWoTxGUhG67Gskqiy6wmQee+E7n9Mu7mPjsq
	nFf2tipYI1cma3Fpbdwgs744h0D0YoUL9OJevmDhFg2glHWTzw+ovqIY9jcF8+TOjo7rmIGY7p8
	tOP/jCfqCObPb2o+Cs76sLFAqnghDd89tUaU=
X-Received: by 2002:a17:903:94d:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cbb9f17242mr60483935ad.47.1783239309771;
        Sun, 05 Jul 2026 01:15:09 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cbb9f17242mr60483705ad.47.1783239309320;
        Sun, 05 Jul 2026 01:15:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:19 +0530
Subject: [PATCH 4/8] dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-4-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1118;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LaExk5CcIsnQobdkf+tB0TGQXJcIbfm+LHR//18ybOQ=;
 b=VCe5OcUC+YrAxAUSyCuNQqTb0M7+on6Cxws1+B96zvqSXIOvBEXu8K5mbkAmqcoJ/obMc4EbB
 40gj+Ln37yCAo6AFTXP4OAT10Srm2ogRfoYXQqUulwYf1GqRudc9cNY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXx20QPDlDutvH
 Wbf33L3fMu1pvWPTYP1t3s55nWfdg4KllTpUkErovAvqURhrSVG6hIVnYF9HRK+kIOTefWMCUzc
 WARxYLfttUMgkLrOfFKQR8N5gp+CMlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX8svILVCOE9vs
 Mr2FMSpHtPSRCz7c/5WjPfJeTBwwwYBoB2V/nc3sMkHST7/BYwSa1UPGnTY9EuD1Vy79NdqKwrK
 QOLmT6iN8/Tr+SJccpOyxwTNnv9QlH5L7RBcmAh8c73RD/D6QC3JzJdZlKVAslWvqUZmijA+QbW
 njYXVzv++P4SH2TGjYOrVTT4jnJuDeOe+rRr3PuL8LXOD25hI8KNBfrbzcXVLIdZ4YxOStInzdH
 hFmyBYfifuxTtCecBLVqjgIM+ltt73EAhtNmtoZooSg7pYH9U0uV2ZIt5xoX64pv6ouvwFKZQc5
 KcKMW8dloBF371Pwo0HsY+B6WIsx6k9ODGQD3Rrk0vs/4RpSUrM9Thjt0583u6yh9Bm87DCw8s5
 xvgwdSZeoyl9vOrBUCjsA6AnCDiL3PSjHggjz/8KSNKh7YWpIEbQVGUGEL7jNA+K+qHwJC42MpI
 dORzqRcTp0/8IHB9FRg==
X-Proofpoint-GUID: uChcnQGnYIwMqO-9eA13sRsJpg9wbupi
X-Proofpoint-ORIG-GUID: uChcnQGnYIwMqO-9eA13sRsJpg9wbupi
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a128e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011511_206843_99494CAC 
X-CRM114-Status: GOOD (  11.86  )
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

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ed556683817c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -95,6 +95,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
@@ -570,6 +571,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.54.0


