Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C39DCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=; b=DbWs5FMkkQJTV/jS83iolajDdD
	+GdiYQAW0UnREHZ4bp5SxFa8PuiSo45LmWi8f1z7SoR4G9PFLxUPZANfHsJbUNGgNG2X9rosT8Btf
	xHyFhQDwscfkKv+tpNFwOcY2WsUeDeRrR9YSMUOpmo5b17ga4tqiJXGURUPxEDPJMIqwFppa5Qw/O
	Cs6wwy8VatloePFz5d5voqFwDLkLN+AnUkd5gE/fsV9/WPIgaOu5yDHpae5eAm56KBdTK+anK8f+3
	lARXSO7gr7Fd3ptlpLVyyXRhN7LNAiUm3eYlKg38aCRpqxFVI2LfcsJK/EDJ6CgcBVYEQlWIFAWcg
	6WIznjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMs5-0000000AS7J-48hh;
	Fri, 22 May 2026 10:12:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMs4-0000000AS6C-0nU1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:12:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6Fisk776936
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=; b=BaHp0and/uMoE7DS
	h5Sz57ZRPv0MyxT1qtrLFJF2OQQtbuHLeiyLzQU3sA8IHq1UVGvc6rXcdreUU+UT
	PAvSZM4zm+jOFT4WRJHe+UP3IjkTMwSfyyLeGvZux4Nn890yHF3zuwfufuOc6CTm
	gzqsZTvd39NxbrZjHvBV0S9XtKJp4x5F7R5aXn8Cv8aaVgUyZQV/SJq2FFkQBjjC
	yOcWhr4IsiXpTLVoSPEchgFBsaXWBQetjs0QQF1p7AI3z3305IY0jkvWjHVtiBpj
	rYL2rmFU7bo4bOrvjA2pb/tX3ysXfjiqjiYlWnW/fkj7hKWIaRADjGG8peid1swE
	dEf4WA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h309n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so6441372a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444766; x=1780049566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=;
        b=kmS6j8MxkkysCpun7HJ9uvNTARo6P7DuqTHi2FHi1+ylCzdPL/prskCI3yqA8cXSaf
         +baaqo7QHJpF+/FNqFECbV7d/01xT/8I4uKIZVW75BfqX1uHwNmlz7DlRnZC8e3elnqq
         lgkUaHoSi/zQP6mAyeZUvhcueC7PLZtKkI6Q9OESp7LBoxkHBFctE91RGhUOg55NeKWm
         DbCt2FGcfW6RkdrI8VvY4Z5cEd3XNLtcUPHDPMBo0rUIkD40b8Hj1M3+3Qcr2elEJCVO
         XbesTgr/KRva/lYEeOKpieCJjpKYOBobBmX+21iLoe9G6OEcOkbJw5Q9zHrIiZO6VUAp
         Om3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444766; x=1780049566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=;
        b=a3rbDY+owTcT7niEcCNp3ssuIf/UwVKds0KAJ6tscm5S9uRwKHVT80Hi2nKxef2SL/
         yJJUJYQeIMlQn/VXzY6R3qxO/bMwmyxWmAx1Y5x8SYYTybKQ41n2bnuT2hVnKa7mpvUY
         LEBcmV0qRoZH8pcNaD0AzrCszE1UHQW+643JLv++Swnoz/iVBjK96FOktAXz11kSaF5x
         o1Wo+gJWT6fswgXbrxfA+mMmSceJ1nHxyZ2cGxsirNhDvhBj1AbY1oyYHLS+ev+Wcl41
         ym55ykBg+Zt1RWm0UVwB1F+rtr7aR82DiKbzaHOFOBLHkMH+FP4pkn8pnAdbObW6hEAq
         9ZDg==
X-Forwarded-Encrypted: i=1; AFNElJ8W0qpdiDM7lRJeCQDr1ezp93KGiXB4tFPDfcaeDpfsOHwWOh2BJCN3Ty44C+J9xcSU9vbu/BIa6RFLjbHR1ZBg@lists.infradead.org
X-Gm-Message-State: AOJu0YzWqoG98w4viGrZ+IkmPLP4DNL55O/jujXEpXxD3XXykPbH5n52
	CTiCkzXzuvPCh+jvCZqGMCBls0kUZpZR80cGDAdezcWPD3i4bkNTs+6A8s7Ucs5ClWbTZhPZ9Jk
	/sLqD99tyFiwTc9Dgf20x04Ea48YK1H/Jysj9dbKBkGL13O5Yaus8gd6Zg7+qs2XwRdQCb2aZM3
	iIsw==
X-Gm-Gg: Acq92OHHO7ebMsT01xH4+kwnMvxitSpeNmTk+EAp54KMm0EGyntfbtU8u7Kl6boTz38
	S+mSRKIaNqQokSrP9ffMmNW7Dv9sKcZgldd6GkvV4bJUVZabA2mjIk7OMkIRIKUtzNU8XNfkhZ4
	zc31u0d1GyXuA6hP6TtzoEl+NStwDJaISD0HHBojc/0A/7AYRz/Hd5hm58md5HHPk5i9WobyMF8
	zHwmMvwxSa5NHuxy0idsVOQs1cS8zjhTwTn/4irST4e3zhguXQdbn9bzhHMmJzCSIijBjBv6E14
	bTJr0xbCpqs6YtK0Lk7v8NqaNFQ+5ueNmOH7TESxXLURR5N6AOPRj51EEYo98ip2v9R046YasPc
	mK13Jajxxuky4P/phJOkH9oAYf1OrZXUwDVO+qIhpgmPKwA==
X-Received: by 2002:a17:90b:23c5:b0:36a:7c8f:13c4 with SMTP id 98e67ed59e1d1-36a7c8f15c0mr757092a91.20.1779444766102;
        Fri, 22 May 2026 03:12:46 -0700 (PDT)
X-Received: by 2002:a17:90b:23c5:b0:36a:7c8f:13c4 with SMTP id 98e67ed59e1d1-36a7c8f15c0mr757065a91.20.1779444765611;
        Fri, 22 May 2026 03:12:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:58 +0530
Subject: [PATCH v5 2/5] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-2-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=1562;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=VXyPjRyCvwokK/qdzZThuxToG/yvYiuIOD5L6w36bck=;
 b=hHmHtgDv/8JAzGDQHpoxO18rVqZunMZq4oxl0d3cCR+bDPnORL1fE/cpw/Xw180Vyv/75m9Dn
 jdLWruQY/RFAIr2sYPUchNZDz0KAyA6VsVna6zODm5Hqhh57SNm7AZb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: a34DBQ3l3pNxpkTSIaMJlE8Z0Sw-R0ik
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a102c1f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: a34DBQ3l3pNxpkTSIaMJlE8Z0Sw-R0ik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfXyI+Wlt6bxpAz
 MQUxoDM0UZYkcRGlhPDITuclaAiQ6M2Q7e9cWHz2NoSg28/Zt1H18YYiB/cpuQLWt0xBQ2b+Al0
 0OWVgNava2/1o73GdPKOtPIg2Kh85usvX5TLtQbd9NLr6bgCp1QadCHbe3bO0WX7Okv8zUcLe4R
 NGB4gvr3izThzQ4s3bcBxhzHpoMM80aRHnuMBcIoBWHK7oSAu0X2RkVSVK80KvS/HpyhBN916OZ
 ME91d+YPQUrLu+n8iiqUUIiSI3OOegJM5pYkF7m+WBdBfVS3rULGib1+gW5F7HWosoEwjZFoHbo
 +Ogm36n+qP5eOZ6j/lI8YwlX9d0usfglI5oE9oA37aGMh4vya7arC3yAo7kp4FmOAiNOcdpHP6J
 nFeCld5+HpIAiGxusoJodaMjelbZISC0HkoGHO9BXqI0RyPIvj0Fh9Kv+naORqLKuSqbtGhTbVH
 o+RRyIcGvdHkbDTpDMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031248_355068_91881871 
X-CRM114-Status: GOOD (  12.41  )
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

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..77caacd0fb3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -411,6 +411,21 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-44070001
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -434,6 +449,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0


