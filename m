Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2221FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FbKhSU90NlGW1d2QoysiqJHk3Yb91hEocxCgqPl/zD4=; b=LFoTeD+ikhOZRu5JXWLUxExNFz
	897RO/g8nfEGI/CDcY6WOZIOIEO/8uyvA4LSvn6ZyJKZEoCdlOzcuC6PsXLjK7ufR5LtLUoTVf2Ot
	iYicTdNr07f7rKXu5vGrF4YI4KQzS+9e9cj8tLXgmOz8vQBW2pGj5fl8MQKD0zLxbRi49R5RrNN21
	wlcoqHK3B3AVzRHiHFk3mSyLBvRPZBCWPWvs6XCKgtno5NQWJOIvo/e/f1mK2DSggA8VR7/C5rbdV
	3d+39Ka4JvIGSLRvCnSvt8E5/Gg1PXEZ6WN/eOiEKs08J2daB5sKeAbscncsl5Rh1X0YUhEomCqXt
	OPu3s90g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHezO-000000016zI-0ftk;
	Tue, 28 Apr 2026 09:44:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHezK-000000016yt-47Fq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:44:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3vYj62006190
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FbKhSU90NlGW1d2QoysiqJ
	Hk3Yb91hEocxCgqPl/zD4=; b=pS6pWmQgpEyf8EL8Zh74MO9N1JnVlUVRODBVgy
	qddZ8EFDPlZVksZ5FWHdKeSIgxOPPfT954CX5DMAfEy+YUYDC9EJ8OMdXXCkWUR4
	h2jcjzm1pA0QlgbBs6xwj87zlF6iJHMYRyghneAPC55dooXCjbpWVO8zZtLk0dsR
	zf61FQb+HFzYMU78BXgxUWMqHQl85OGAqr+0KdhV/KUUXBDwzP3IktCZX75w0lii
	b838jNLGfVuzdQMr88kZprgra8SXkapRMp4yqJpxyu32BeAQfQYhBlLte017lrKN
	uf4crkZpZfv+bkKFnxeBRhlZsqe4838DCvEA2l7px7gNUstg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkmfkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:44:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6b0a7164so14787886b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369456; x=1777974256; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FbKhSU90NlGW1d2QoysiqJHk3Yb91hEocxCgqPl/zD4=;
        b=IB8PKdDUOGXpQPiBTNoLS5fXFoEkLwGHOi9vm+LFpUCaz+1QDCEiF9nNGJm1tw7BW0
         MHtJ1Bd7XwwwJJG8tnZVq9qmIq1TrsG6RcDd3BLOTkHfkwxifjm3qtwGA2uDtlO9DMHn
         TbLlXzGKSWFRkpkFU2qeYWZRhDx7oNdvipYD6WuDGNAq2EWpYocbfKsEz2GJl6RwU6ab
         gaDRcj0ocw5tvauwV5o4nkjIvI6WwjCGDBYec+4TVl6eDDYJYSwE0ZYxy1AsLC//uYe2
         yVcotLs/SEnKh6kneAs6cds2a/psTfviuOReRaOA/+uRYo1UwEb2+6teQs+sRhukF7G8
         yKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369456; x=1777974256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbKhSU90NlGW1d2QoysiqJHk3Yb91hEocxCgqPl/zD4=;
        b=ogNSvQvzAlL0cdXV2k4z265jm5j7g7X/4aN++1Onc+DH7AW6UcreU0xE+oS4MWreHD
         VXYGcyEESNdH5K9A4egmb2y/qKhFh9BIn+5RyC8EqBS9pJFJWE/+xwXwALzY3pgdX42m
         pUy2H2yxOVegsv0e2NikPTJEpVVVUrboo5xHlOov0qBKU04OKufJG+7tr3HApsEOqozO
         uL6k7XvUWj3t+0B3JBQEjq8oKBXurdqJfg9NGjbNQcfsRTDaKfjzGwzqsdcbexjwCo2U
         RvG1aZX+Qzc1KH7lw42kKjghOuvyui6qD094Bk5MpZTiiZKpMMy86QGNBan7yOZCnnJO
         EdMg==
X-Forwarded-Encrypted: i=1; AFNElJ9KVtCqFuflQGqmmzdidBkJlTECAKrYqL3QScrmfPdsq9Gh2LlY1EgP40OGau1Z2jwybFjvkQPSxdV42p/L+6pi@lists.infradead.org
X-Gm-Message-State: AOJu0YxhBGqUsS8iaQ1lHmBNk6EGmB8KDLJJUgv8j47PQ7bfDKE1zvHX
	hC2D0lUCyGjYn6tO/t7ofdPbaCJwmVMxwo2ufOLMFO44crw10ekyBZ94dtgupM7D7KkDdx7yB31
	GHy9SvSOLV4niUekkkyoRQdqe9Fb/rhH3PxNzygrYk87T7+3X/mMWDclJPHZEhhvySUqzKIOH8C
	KkDA==
X-Gm-Gg: AeBDieudRY3Jo7Qrd5JwBPNKRNAQR1zmgz2DbU0azlMUcFqesI8DwlTxT8O3PyfPSHR
	v8um46X29NcCttKAGCJ6xPU/fvJHdyazAxondiJMeRIvfNKHlBb2Xt2JMrhbKvxaU62VdGbbPNL
	tludxnBvUNOTwGwotStls2Ms587Pajv9MS4WjVcnd/lglEOGiFVzGbJqZhA8gvXK0JCy3RiNii1
	IIVyZBaobLcPFckQYxVoFFtsXf8/roL/4v1k/gRs/6SdAODYFXBb3lP8gNJK5D5knMSYc28qbWf
	x4iMoB73lQCTAiSbVWCR/WhTeKORlHogxGI/3gxPcvWunweBga+Ykw1iPzljf2/lRXXjIv1bS7d
	+3o4uGHnQ7Topr85Fzm2Qqhzp7s9nJTn0BeyAwOwbesWEh/u8WzFh7Hv9th/pzTNYw713dEVQjD
	lotyAywp5FmqyuK09l0W7huPMrYz8sozzX31GrG1ULbqcb
X-Received: by 2002:a05:6a00:e12:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-834ddbc0d38mr2135337b3a.30.1777369455924;
        Tue, 28 Apr 2026 02:44:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:e12:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-834ddbc0d38mr2135310b3a.30.1777369455438;
        Tue, 28 Apr 2026 02:44:15 -0700 (PDT)
Received: from hu-lmr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00a4fsm2168428b3a.5.2026.04.28.02.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:44:15 -0700 (PDT)
From: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 15:13:50 +0530
Subject: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFWB8GkC/yXMSw6CMBAA0KuQWdsEa4HqVYhp+hlwDAXSAaMh3
 N2iy7d5GzAmQoZbsUHCFzFNY8b5VIB/2LFHQSEbZCnrUkktbAimHz5xTSYGZuOnONuF3IBCqa5
 yUl8addWQgzlhR+9f3t7/5tU90S/HCPv+BWQcG/1+AAAA
X-Change-ID: 20260428-add_glymur_mdss_compatible-44f5b2837498
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lokanadha M R <lokanadha.r@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777369452; l=1484;
 i=lokanadha.r@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=E5Fp9SeBlxlY5LkEyncq8DbWiaXUn9TX29qYsqFaHc4=;
 b=GxReak954ZzGmZqlgnafc5bl4MSkvrNHTmLT2Ber8YUDsqdVq8fCPAkZMk2YDZwaMCMRXg7+B
 UyP4R6kL3t1CAtinzijNaV/C076Tk8T76b1SZZ6d+NduSyoDzGzxch7
X-Developer-Key: i=lokanadha.r@oss.qualcomm.com; a=ed25519;
 pk=PfwARBW5uLDUvebYCDLNkw3HD4g2b3T0VDrb1uc1Rxc=
X-Proofpoint-GUID: 0i4p5TWfGI-PduQLeJA8wG2jvG_PXUXJ
X-Proofpoint-ORIG-GUID: 0i4p5TWfGI-PduQLeJA8wG2jvG_PXUXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NCBTYWx0ZWRfX/mV9mBMS9yRN
 re5CddLnE3BCs/oSy03RaLwg7XuCgm/5JshIBDP0tXp+Fw+kfeVymupt6ELMYeSQJikcKvjqBvT
 nUyC22u6fX5hnjWe6u5jng7Z9QKSGURkDtGBu68tw7sEtPFlpU4iWEBzrfopZ6dfOQ/vWZQZ14B
 1vrkL88rfeqcWNH9AsqS3YsYhIntIdW6t3yiY6VTjvx+mmK4PzTFrqLWZOlIytjXJimFvUpvGPH
 +cqnZaAmM8OSA8V7vnIKP1tFFtYNNhMDJAbcV/ifY5coJOi8/b695XBAaKMJ1YCGaJRMUf0I1b+
 zMBiPupsyKzsnFmT4FaPW50AIrBaDhRYRuTVS58ZzXoT8iS9D5WdEnmyXcT6CVK/mrn1nlYfqM/
 XFs+U09JeRiqzGVnkdWZa+DHMlSpALJZ79qVr7AR/hPhTRtYa3+nmqS0sxqMKt5u1Uule6q0Ick
 7ZrNav6nCo/qaLek+Cw==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f08170 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=X4sqO_BnIXgP0qhT90oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_024419_167164_8D7DF8B3 
X-CRM114-Status: GOOD (  14.93  )
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

Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
table to configure the SMMU-500 context bank for the display
subsystem (MDSS) on the Glymur platform.

The settings disable the next-page prefetcher while keeping
macro TLB caching enabled. Without this entry,
qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
device and leaves the context bank ACTLR at its reset value.

Signed-off-by: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..6df48499a4b2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,glymur-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sa8775p-mdss",

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260428-add_glymur_mdss_compatible-44f5b2837498

Best regards,
--  
Lokanadha M R <lokanadha.r@oss.qualcomm.com>


