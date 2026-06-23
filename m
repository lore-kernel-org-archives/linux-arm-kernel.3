Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D1CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl6TMjOkY0vpzUkVoZ6vM0rqRq7dBnGr6QKrXS58jEs=; b=rMTtCTuUStoMs0BwkqetJ7N7pO
	hRdUly0+W9Fn208vOCuRsxnhJfpW7lbfPOw7S0MZH4M+Va/XJR3fibQ1MFNSKynn+8CjjOGqctbqD
	aXD/DsFSL0l0lHYbl3eo6kedgo/AnUISed2VuiGp6XQGV5rNB3FmL/3SmfvW7TyJJtNHKZkVO6ZIJ
	xRyFGgBhpScnQ+7gNrof4Kvao6dgKKEilmxysSygFyzkCFbPK22exLVP9SwtChT8mvzbo5s/MDza/
	OzRXIt7V2aov5Ms4Q287bvv/D69vJO4yHXiby5BBUWmwIV+eJrnY0qWnJ9t1XcbOiv23ZuM20DE3l
	RxqdFSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc081-00000006Fh6-1kuC;
	Tue, 23 Jun 2026 12:21:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07y-00000006FfM-133x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXgNP3753485
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tl6TMjOkY0v
	pzUkVoZ6vM0rqRq7dBnGr6QKrXS58jEs=; b=YHNtFBBDs4TKgMga48qTiEUHFKi
	NmksgOIL2hvnjwXE61ef29VKhpTJ0T7IbUYhvOh2TVF9Qpkehu0YI8f8764Y8naO
	xX8+mTSMV6yeVIjL6RZKtfOUgFhRPtMR6ypwkMQ1A5O5sftSQeFh4/81MmplR9xe
	wCcHqiXMoonbj5/wn5u9Ta8Jqd9vi9bqMRUARtvSLDTgJzPciAGC+d+5tjqPx5fP
	lxa9daalE6wcTE1eo2CpcxGwaBEHP3449oEXbgdPCYnDIHQI/c3mx8xw11SJi92H
	djHxlxu3/wuSfosV8PXhRE20g+tb+hSPGQJ8UW55cq5JH3F4DPqsewuq8Tw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29h2wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso3240826a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217277; x=1782822077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl6TMjOkY0vpzUkVoZ6vM0rqRq7dBnGr6QKrXS58jEs=;
        b=d2/jaEfSgYqeuazMeFFfLUXBq9PSSHaQ2YSo7Ns2kLxYL2AwpW9fJjJECBOSHd//qe
         p9Z0p6/Q74AVwXXm2+tPmlEzjB7TPPdGlRvcE6NiZiMY23iu0UsQNgQeUCSFYi5YPqTr
         HhPpuOaAKZna/52cZI7at46dzzD0JaJoAgvdkYcVONGBPypZCvTLBg4EkeN3/krqb9uA
         l2Rpg+uZGKfMTFd374vQC4PQ66H+zmbRPV6FPfFDK0rvGCBS9S2cO1Yhrz9w27oBZKSd
         JXlryUNcdI6hatOca1I1fll1HKc1Ulco+eQqHSao3kbyf3IbvRJqX8xUOeQvAOo336Vo
         dnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217277; x=1782822077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tl6TMjOkY0vpzUkVoZ6vM0rqRq7dBnGr6QKrXS58jEs=;
        b=ruW82bLShsGAkdjU1050Y62EvFwgpRHCJBWBuXYRKgsnBjl3sTWuuvrFwoZ9gDckw+
         Ph4W4fIXkIoA0BR23MfpebAsnYaJgHIoMc6sTHlMwXep2FZon6vFSJSwtw4IRCaP3oZG
         ulGleQ+iMGb58T0CFMrObgsm9WvycSsBB/DMfsx9k//oSHPEF+W/fCDFI1q7rO9QFp8b
         j1gJ6mz3o0nycmvb21la9pC3Lbr3oxgOjEEFx60acpqI1J4w/PvpJ0mrmWaT9Dn70XKz
         boX9zYPycplerKE4ztcjfhFuIwMwbP96OvcZfpZJYYazapLag/5AZaWAr3C5OuDkUb6D
         idLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pvnYQoFU75J2tcvvZTZ2EW5vExItg9MOPdxTe9/9yKNQPADlS101X/y8b/YdmQ08FP2f14ftHQM3PX3U5OIem@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6taE1uYUBjuKQxSL6auMG6nKsCDvw3jh2yC033VV0lgcdDVuL
	lYqZm9zF6eNtFNEt/wT9VgLu3mMssb7AEF/QmtNjp+NsVLcbnxVJ193YJL5NGd24ZaXWdVOZWuw
	qYcdW1k00HRlyv2O/+IKiTxKHn/2/6s3BhYv1b/W2tP+z++fW0qQmcu1tAMR+7amDP5TnuKBdfZ
	JpNA==
X-Gm-Gg: AfdE7ckwuyCc+WGp0KFxeF6oN0JvXTB48UII+R5fbl6jDJ3LQFzkIplCfNilsxBR7KV
	CwzaN9jDPeQWc/rRuSaxYkYuvKQIxT3gR66IMIccGJNm6pJJsjZI5aS6Y9imAJnNUB7JzKKY9zK
	EjkiC8UL/43lkEi4YLuBFvU1AU2gKGKZtz6eb8U1/NkS7I94vuF0NDQa2a4gGR/Tn69uCRF1JEW
	slk+Y+TGWtdYz0cJIgTMAUkG2C6oukBzCvsCVZhMZFesawWok8jOR1iNUp5nUuPcjnaX63u3cfR
	Jj9/gUxjI3S5PB4gVoZBqvLMpQDfLoe4owKIYPpd5mePG528dZmq9NAxkxTp/f4GAdY4Eut3ylL
	gYCbDXMtVlYvlYscJSfmEFQHc35P2wwevosHzuw==
X-Received: by 2002:a05:6a21:1f83:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3bd14f00047mr3463392637.9.1782217276880;
        Tue, 23 Jun 2026 05:21:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f83:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3bd14f00047mr3463324637.9.1782217276119;
        Tue, 23 Jun 2026 05:21:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:15 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/8] iommu/qcom: Publish pgtbl_ops before releasing init_mutex
Date: Tue, 23 Jun 2026 17:50:31 +0530
Message-ID: <20260623122034.1166295-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a7a3d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Ya-8ghbQ4qwRuljleqkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: PPs3dvBs53CiU3djdPvj39rDF0dg3edv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXzb8JMQnRaac6
 0yR7GgbkI37sAyKTrtDkR+Rs2ldJ4tOGw6Dbf2clRg5UNXOJkXGGXxvlxlzWfVIWUa5gzUHFsYd
 bWTJO79O+B3TxJM/f7VH49Q93ypB8Ek=
X-Proofpoint-ORIG-GUID: PPs3dvBs53CiU3djdPvj39rDF0dg3edv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX91MgHfu6lc/k
 70HWf/I6E1USSpVmFSVtEQSFLOCQWWISBc62TsLoxfh4K6yJTOaLHdcyrV1PZIGEWfTQdB8LLaP
 aPpQWmN5EoTmcDn89RbBNPT/oqHJPNEKKEFD6jhPR3nGWcDNXnVCEAySRsWU8zqT+UYAsM/XtKD
 q3K7Bn3kANDPBJB1EdBxh16VRZTbKxtUPD05K+7jI79tt3HPXMbpAtwzbpnfvf9S2dxpWUwgwSb
 IPn5i9eMNLUJ85SZn9xd5OOR327j0JZ6FLzrPRW8LZHPDBVhvqm9UCbLWcbFO6Gc8F++EWCvn3s
 PfiagQEbScFMQdYoXt1mTPQCDQlFvnoNK6j04l3HiJk5nGfVaXiWlP/RF9MrqWsyc1F7daLdVc7
 afFf52hSgMeNi3iXPy0b2D8vh6LMnWwGtaZHkE/K0ISpzKcZFG+Z173bnS6CHkTr4dPODuEt05u
 79unxgvyjdgiPneAC5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052118_301679_77081846 
X-CRM114-Status: GOOD (  15.03  )
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

qcom_domain->pgtbl_ops was assigned after mutex_unlock(). Another thread
calling qcom_iommu_init_domain() would see qcom_domain->iommu already set
(domain fully initialized) and skip re-initialization under the mutex.
If it then called qcom_iommu_map() before the first thread set pgtbl_ops,
it would observe a NULL ops pointer and return -ENODEV for valid mappings.

Move the assignment to before mutex_unlock() so that once the mutex is
released the domain is fully visible to concurrent operations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index b6ce85f7f923..40fb0408dc07 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -306,13 +306,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		ctx->domain = domain;
 	}
 
-	mutex_unlock(&qcom_domain->init_mutex);
-
 	/* Publish page table ops for map/unmap */
 	qcom_domain->pgtbl_ops = pgtbl_ops;
 
-	return 0;
+	mutex_unlock(&qcom_domain->init_mutex);
 
+	return 0;
 out_clear_iommu:
 	free_io_pgtable_ops(pgtbl_ops);
 	qcom_domain->iommu = NULL;
-- 
2.53.0


