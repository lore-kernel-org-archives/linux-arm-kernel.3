Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3567CCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBzpNmWrMK77dv+oRp9gwFSkRedXf34HcCV2tGd28wc=; b=WITbkSwXPTgiuRd/A8rVkFHSFh
	ZVj142mITEFEEK2mUcyIqpBuXE0KbWIyGHbv6tH5NikyCuNRBuN7ubjcHvjV2OfT4YjLzetMhgoyl
	+3e76kpLXTb5nALjyMxYMllF+uxwhf1XFjGHs/XaqjSHlTwbDSdA3z5jzYLyUcSIUkFeC4kMUozV9
	qPcQ6fchLQ+HzEDKx1n3gqILvzwBilqsXVXGKKxK4QDqgMLZxNFUDQTY1aEMyDgc9JNrO6Vgk0lK3
	k9P2ue4MXZz0RARyG10cVMlcZvVdNbPtuSepp3MdhgRR0sQihKWjdcDyN0kPZGAatBrD1K9h1PBHb
	pZiObviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc08F-00000006Fsv-3Yuk;
	Tue, 23 Jun 2026 12:21:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc088-00000006FmO-0Goq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXT5f3744677
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JBzpNmWrMK7
	7dv+oRp9gwFSkRedXf34HcCV2tGd28wc=; b=TYZQL9E8iFOu/LED/EVmRVaQnqM
	kltxe15x145sds5k3qvCjnnnbPX+49+ggmv2QX1KCaqUNgYIvbaE2R17t/aT9nLu
	1Q24L4rFnRQhE/uZY8tEQSqd0i6W/7vSlhV/qDRZTSeo6AWxSznmbRCJUnzq0AcT
	bOwxIZ/9uKDGJOfkqEmkJz2+2iTeQGYkivkeHzwSlitvorn/ldk/jRIKOeDRnaT1
	n+fIrMQZrhI+QEw/WZCgQ9psRRuIGDLV3s0HzWwPXP7lNaFd0o8vNElsC1xT+ffL
	VClykvintZVJI88aqR0BQtJLyaEIjV/TEGuN5+QbgTL872HOk6eRVBRk/nA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx38v5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84256bee9a9so3952057b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217287; x=1782822087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBzpNmWrMK77dv+oRp9gwFSkRedXf34HcCV2tGd28wc=;
        b=EbIDYx4Ujl2VsZjkXZdJ/7Wse85oZJAKGy2jt82ZMIk47Vhm5kRaTuwBBffPSOMQWC
         ylpUgeIWxCw3aaWjlJPTagRsTueebRhFPPACHsWcRdQKQmeqxvpOK+a16BV20xG1vTM/
         Uazf9lMbkphvbbS19ZmjjtugS+vjDTskB8S9fhqmcsaBY9v2TfkS9B39DKR8LFsGGeNK
         NuGpAN0UUYsT23x7iISa/3K8ehanZFsw4S4//M6vrLsmXBN/NfqjaYl2SH1rE6BgJF4s
         Sny1fAE8gQ5lFMqq4WP4LvpQMTZskKJl1JSkQuk3cE46JY2O4WfLvwpToSianM7V5WZc
         1c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217287; x=1782822087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBzpNmWrMK77dv+oRp9gwFSkRedXf34HcCV2tGd28wc=;
        b=U5xLNem+3wwq/dhix1T2UaC/8ti7+oZjo9cNs7L8hsaNNtjHqkrXcihIdQ+DYahsKn
         qIeSXDuNlh4AnAcSpibfDcM8a+h1zhnZIrsCHwvxougVhynH6BJ2BSv68qGJuFTaVItV
         vZum7okTiY5fAI6ehYjnauqoKzZaCs3germJr9I2tuXPMbflvihOfR86nU1+iDOT3l65
         Z8gBODaeQYFGbk8fwlVPf9Ekp9E+2Db0mLB7Qap3QwseDFDjcFgPPeHLevmIxGDMDrLH
         MZoyrENMoj5KE/wcvWA1oLb+EQRPHLfJlJNd3263YIcacOTu2ScmodSTavSXbeCsNS5d
         M7Qw==
X-Forwarded-Encrypted: i=1; AFNElJ8xysLPhK6FnO83G21CvhSesiHF4eLo72PL9zWD/CT/1rQxBkcJi+kh51w0ySkw5N7Yhui6674x6vCD4D2xFcR/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdpv/G3bbi21yLDKCS6VOT4hrO4FoYNTRX4uq1N4HDLrzCuIiv
	FxhFNG0kUDNOK34gLCyAsffpzE4emaiOfbiImfVIBdOshurM21Xm5sNQVNmqXhn0DN/gOSfHI7I
	Gd/EWX3/nJ0Cbh/8nzwBMrO5BTs95Pmryw8x5/wHQwMhOZtyl6pMbTFJ1quCq3GYgtseY/QCBnF
	YnLg==
X-Gm-Gg: AfdE7cmjyVnjIOgnxHwC9HQRCUCrCPkZ3siH2Sn9OT54cPF5FVcHbBapXBeRCJ1quyW
	xar+mVWNlLr3lRQHJnglH4ObIQG/VaMa3liiBWpweRkegA56lrZr8IbDhj+H6ZTKjIWxMzMDHZM
	hv5H9+T/e3zneYACPg+dRc4ZcGAviKhXLw83Sis4RjTqk+QYey8gJ9rhvphBCF/DjImle0gHCQV
	EynkZZdTslAyogu/s7hI5q00tOiMIpLi1nkm7m9Q95aZR6l1TAiIpeKgPHxNGAlSRUmqdNqpjko
	y/HN1nhu7lC03t9ShOoBQFqF0OTalV4hUyqskHoPBhWm74NnM47ciNJlhF3Tr2Ye09ycpmxuVvI
	9PNTio56n0mJwsMyhDxEja7ReTkmY5HxF/PuV0g==
X-Received: by 2002:a05:6a00:2e22:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-84597066cb7mr2782733b3a.17.1782217286762;
        Tue, 23 Jun 2026 05:21:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e22:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-84597066cb7mr2782687b3a.17.1782217286206;
        Tue, 23 Jun 2026 05:21:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 8/8] iommu/qcom: Document why sec_ptbl allocated flag needs no locking
Date: Tue, 23 Jun 2026 17:50:34 +0530
Message-ID: <20260623122034.1166295-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3a7a47 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KL97T5h_q3IXvoetim4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: PBdqhyphsJsgjvOcRkO94cMXVgxmKLet
X-Proofpoint-GUID: PBdqhyphsJsgjvOcRkO94cMXVgxmKLet
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX8gSq5LiTYry0
 oh5D1aCEkFC9XnWDEXedW+GUa+/6AYWOp7XXLS6se+6OoQ5WL5QDTGRSUlK50VMfLqSuZMG6F9t
 XSErAxn6hQBPLZTdZZtI0fdldGbNHGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX3Taxl37+yMpC
 IsrfpEdjRkCKUFrtAhzr4hjROjHV9k0EnpAWNGgr2AQ8hxPsc08+5Vn/Rm5Ov2JHGetJs0xWt58
 jFMuXIaQ0coQietctwPXxFUXm391kEfXTPbcFc6b9Tdu9mTHDjVFMQRTZbcw+lk3bPPn49GN+LF
 jIMgg1tVskqtjxmDLOHznw3tjjcphO9g3UnEL8uELLCF2M20E3wZxuhZZ0cQ+xMnYqab/g9IThB
 JNGBnys+r4qY1OrOl2SDOEGoz2q+9YirDTM+X1O8kVUKK49qDJFJSs6q2zI/KY2Gq5UBNgSQanE
 JzKoyFlX8tt4V7VAyiNRY49CXqWyuA3CNZW4DAPFnS1J3VdqBhGTsV4rWrfiIhtqCjwHIpGYUbl
 ZA5iaIA2ITeVe8s4kv+eGL1VsIvV/YfkB1JZSdKp/nvcOXNQaKRqti5qb61FWNcwS502toPLVLM
 WmUIzKU7WoFpRH0Ikag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052128_110070_82369503 
X-CRM114-Status: GOOD (  15.58  )
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

qcom_iommu_sec_ptbl_init() uses a function-static bool to track whether
the secure page table has been initialized, with no locking around it.

Only one IOMMU device per SoC has secure context banks (the others have
only non-secure context banks), and platform devices probe serially since
the driver does not set PROBE_PREFER_ASYNCHRONOUS. Concurrent calls to
this function are therefore not reachable. Add a comment to make the
absence of locking intentional rather than an oversight.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 0df8c2af8eed..bcf5ab049aed 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -624,7 +624,11 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 	void *cpu_addr;
 	dma_addr_t paddr;
 	unsigned long attrs;
-	static bool allocated = false;
+	/*
+	 * Only one IOMMU device per SoC has secure context banks, and
+	 * platform devices probe serially, so no locking is needed here.
+	 */
+	static bool allocated;
 	int ret;
 
 	if (allocated)
@@ -651,15 +655,12 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 	ret = qcom_scm_iommu_secure_ptbl_init(paddr, psize, spare);
 	if (ret) {
 		dev_err(dev, "failed to init iommu pgtable (%d)\n", ret);
-		goto free_mem;
+		dma_free_attrs(dev, psize, cpu_addr, paddr, attrs);
+		return ret;
 	}
 
 	allocated = true;
 	return 0;
-
-free_mem:
-	dma_free_attrs(dev, psize, cpu_addr, paddr, attrs);
-	return ret;
 }
 
 static int get_asid(const struct device_node *np)
-- 
2.53.0


