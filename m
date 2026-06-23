Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2145CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9QcSJ5f45T1iVf+TdgPgzAQzuE+vW43HSQ7Okp/gZ8=; b=glhEfAu4QCZCdfB37fep4k6KjE
	6KmbuQsQIvrEkN409B9r50vxFArozJsoxblSm/TFzw+NWo8Dv2aQTUsnLkrzkrsMa8Zuybfq8MKqi
	cK6Eb+DlHx4bH/ZWyo9TU4/6M7x3OL4iFNXKCaAZ/N8sns/POsNiqeotP0+WxxRFsLBFoQSRN2vuu
	j40TraZwSurkHOJ4gHhFGmF0rYg8vPGytv10YwZqtAje6b0NRcknCFmtQavBjEM6hWt3DfV9V4BRN
	nyoqmO+0eVhmCEVJFKyHtq4EfRqPf33kD5k1ed/YPUQO9i599ZyElyxtjlfwthScoE7OUHWfKX8qD
	68JCR6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc088-00000006Fmv-2Wvz;
	Tue, 23 Jun 2026 12:21:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc082-00000006Fhe-1lxN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYg2v113422
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o9QcSJ5f45T
	1iVf+TdgPgzAQzuE+vW43HSQ7Okp/gZ8=; b=hN+2ckoRJn2Kj2ng85HOhbwW+Nz
	N9o5FvUgYGk8RJSpx3jDan7nvRF2hkJ4cmM1q2B3X74EbQK4mL7teRb4lPVCYQV2
	nm3iVtAirug4ZGRodY3fqPcuMWkt1QrKLdbhddPs4ApqdvbZ/bHEvyDyGTkepyay
	FMyWOQZtLMP2cnp/mvUEf9EPRO+kpmziENzl55970PvxtVwlN8kiIhQuI2wm/3Bw
	lwa9+ayuJXWvc12K7Lc/z8YM+tsFQ7fZ7s/GxV0t5JQCU9g4BGFWW+EZsPR54ggQ
	vcluBN4dKGwWq2CE5FSfEZywmB+LzK/wdaiDNvigU107RCAeL4kHjhJ9qnQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsdu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8428419982eso5219024b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217280; x=1782822080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9QcSJ5f45T1iVf+TdgPgzAQzuE+vW43HSQ7Okp/gZ8=;
        b=Y5YeY2oFZIyuNaO1e2bIj9/u8BG7zhQboPnnhpHvuUFu7VXKkgFCtTd4bh0BwdIP5C
         3N8EhJB/djYFFM5mu6tbpvcGWjSxqkiCwOp0YLDvOQV2mZPSCGxSsYh1dpEsuOt4Kx6k
         NvP2XyNwoxw/gSTvBakmifeCCo7Km8yciqcMeQV0tIwsS+Idj7mnS42USUftAQqknRAe
         Vnbcc5rNJS5GeK4Dkz0B9O7Uiwcga7f/SALsnJKg9NJ1Zi3URm8yeGMgKpA2BRtJC+vV
         +Irt9AYPxqyY21vbk16YIpWXl4UNonDR66QRb/FbU2Nef5LcnSzqrPLNxUY8MitNUXPX
         xy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217280; x=1782822080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9QcSJ5f45T1iVf+TdgPgzAQzuE+vW43HSQ7Okp/gZ8=;
        b=so0vjHBUDOjqPjBfzOLufoWP/8C8/4wbiOl6QnL7xuAJcZ+0mllxGCyflediYo+Jod
         oPQA2/dXGetFeN3KFJPj00vQBVuDC+mgS9TSDhhlcLh6DX4RVGTYJwCoU0wMaYklNeSy
         4wgDFqiOAu4lyhtb1RDjK6BhS9f/l1fUEN5YVlwNppCG7B+G8EiL6WpKa2usud/Zyqgp
         14s/nl5rNvaPuxRG/z6PddB6+cWEXs5HdY5ep3NMeAUzDnupPp+oYaRxTNSZ44Rpzk+O
         JHH2ZEVTz18rl2Oi1QeBvZVDl3W7PF0OshUKNpmuYKR8l7fCax6dkB99OwlO8+sll+IU
         GsdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8u/Jx2ne+73pbxciFrRmUwdGVEp1D46t93zeeHBvmiconDogHLu8Nv3jCxX+Z4+M7zYGpz7I0bVGXnDjN7X9QC@lists.infradead.org
X-Gm-Message-State: AOJu0YwIhVnBPgP0Zpj9t13A8MCQnY0mb6ZXDgqJ6LqiVUgB4A6TtUUs
	KmEGI2obcM/ewHCjOj8Jl0akmQ2Y7Qf7xqxDXsPisdnKXUTTNU6ShKYHc7x+bXuYGQRDnBfWrnR
	qnC3xYnK6k3I3Ms/eSeCFkk77fhhFRIUDQeFXLXKEWtm1nJIdSrfqj90nEUur9wXXI1kfa5cU/X
	T1Rg==
X-Gm-Gg: AfdE7ckbc1mYEGZ8FT2iLO73g66GKnueR39n10M4RZk01Y3StFsBB7fiqHnOZrfW6/1
	Xwx/+U+3IB2kBn/8AG6w4JQsA9fpE1d3EYJxvUf/VeNAcmevz/9WxqmKUw60q5GyXz5dVD9skMI
	1I1NphjEYU3vX+k/C35e1EVMUnvB4XyYAMEyi7ZaBz/rbiNkTJGCUnu6DSWsA91qt3k8wxK4Irv
	r//iK9qKeBqZ8c43OUZ68uFZimaouxh6b4N5IwQHCnE9qtJkJoOajp1MekrqjFi5avigKtPDWy/
	YSjYOHge/DihcJNS9ONaAB4gpkp/pj7/AN52Giplt+HKKacAjfoXe6fM8YSmIXEJPOtPCn+9K/W
	h46TVSY6Zx222gQu8AOyY6CHOJgjPHYnl7uTKig==
X-Received: by 2002:a05:6a00:2e8f:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-845970aff20mr2692027b3a.19.1782217280067;
        Tue, 23 Jun 2026 05:21:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e8f:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-845970aff20mr2691983b3a.19.1782217279518;
        Tue, 23 Jun 2026 05:21:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:19 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation paths
Date: Tue, 23 Jun 2026 17:50:32 +0530
Message-ID: <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7a41 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9AnWiAp10G-6W0uwed0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXyj6NUqLWiE0s
 lne8/P9OsXZ97tdOVNdnapEaLgGcG80W56tMyeljdvYEWh9gNtAGn4frzT5EN/8hZgI+Z+sgUMy
 SuBCMMePD8Pilow8Jy6k88BOLi0Dk9k=
X-Proofpoint-ORIG-GUID: innLhgETGlf6BaEY-K61dPMxjMkgFETd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX+zk46YjGah5H
 jFzbCTHWDeLrm2QFFzS1RwhiS+xaMwxuWr8SEOx6Fkq00DMxRfApH9CUAjY1Yjr4/KCXe095/gc
 9mJJ1a4W/vGKlIWyugXLT1kDirqHWrBZBrJe2FbJppaVa9Jo4zeQyJwgWjTIETic/Tz+KQ6b6N1
 0xzep9pZvsHf1HuFipFItJgJZ+Swb5r7no4uXm751FbZy+XvybS36MitOOikrZffRvPHjyo4FG1
 lLKLICdqmUOpw6STmr9f0Tcny7NvjiKOqA3Wg3e/h0kdUlIoTo9ILEpsGwJxxArtUh4HMeMyiw7
 GafkmFuad7Uyy4I6X9EAc5ZEVIPajpQbtSi0u6otskoNR7GesB/BRR7HZnv8DQeJcwd1TxWpwnK
 WTnjqu4gs3S1UL/r7+lt2WmB5oCLZayIH8lsaQBkV+liWmjtZNbDOyPfO/0UPbMftf7JHJ07AUa
 CGXZYFsvCEmwhnbTLAg==
X-Proofpoint-GUID: innLhgETGlf6BaEY-K61dPMxjMkgFETd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052122_586572_92C9CECB 
X-CRM114-Status: GOOD (  14.88  )
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

to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
corresponding context bank failed to probe or was already removed.
qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
directly, risking a NULL pointer dereference.

Add WARN_ON(!ctx) guards with continue so TLB operations skip
broken context banks without crashing.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 40fb0408dc07..51b60b296bb8 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -121,6 +121,9 @@ static void qcom_iommu_tlb_sync(void *cookie)
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 		unsigned int val, ret;
 
+		if (WARN_ON(!ctx))
+			continue;
+
 		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
 
 		ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
@@ -138,6 +141,10 @@ static void qcom_iommu_tlb_inv_context(void *cookie)
 
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
+
+		if (WARN_ON(!ctx))
+			continue;
+
 		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
 	}
 
@@ -157,6 +164,9 @@ static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 		size_t s = size;
 
+		if (WARN_ON(!ctx))
+			continue;
+
 		iova = (iova >> 12) << 12;
 		iova |= ctx->asid;
 		do {
-- 
2.53.0


