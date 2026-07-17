Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5534EC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/6lk2kxW2nTS1x719Bxes8ej8Ufj/5F6jTJEH0kaK4=; b=fjstaDyBA+cVIYi22pnaABD7qd
	KWNJxSQy1TGUCxOSDD5v4Ty4BMLspPCRY0zlYTeqU9UcriVu2hJArfovguhmScm7RHgd4kQRdqq8v
	zOb7d7k8wEWfkyRapp5aku6uXh96vx2pvDgLxJm77frOyjc2roUAawX+BDhS4zKZOODkCpd4vrE38
	hdykMBmJnov6pzJFVhdaSPVRnbVyy0pi/d6lkHZVfTl0ci4/BpWGtwTBafVyONryaIuMgJg5i2Pq8
	94SuEuQ5s9LQmfXSJVpb1GyrRYtse6UXHT5dZDMoa3Ja7ZMwy7mfSAGPO5muxP+qwABXyBHvqiN6k
	VYNyPdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpv-00000002WET-38K6;
	Fri, 17 Jul 2026 14:46:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpp-00000002W8H-3TiU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE8WOm1677457
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z/6lk2kxW2n
	TS1x719Bxes8ej8Ufj/5F6jTJEH0kaK4=; b=Dcl3uIUwdol6XSOD4xXwUWtBbBh
	AlbqLwRt+YULgKoms56hrHdn+7deWYVfFcXknBXmyQOfgu9JAXZAMe2QRhNofxh2
	XMwiUJtiXQlDAXcD7B7DLVEmOiokKPPujSgSHWFIQmpy7tF3ENP8UuBtKmZVwRG0
	zO77DEi4h2xTbFE1+07cynDEaaZS23KOictYRWsUrv7Tzw0ub/GI8D8mCDb3JYiZ
	cWdPrQYfOdbm9eOTfwiaVWRmNz1iIst5W13Ee65jUUgU2BGi0iA2PeAkthq0lgP8
	5pcb3dFs9BvaYFAXxGoBFtL5qQMC+5i1eIgJl0s+XpIjvSBnEjlvvtjliKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78s1hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so125602666d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299600; x=1784904400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/6lk2kxW2nTS1x719Bxes8ej8Ufj/5F6jTJEH0kaK4=;
        b=G8DeqoXkelCOOVmB5hv04ibJ5aj1KoAaXOtJ6x1mXnGtBRql8SXCxJDtlYZxqF6WuC
         dr/tsC+2ECma2UzJ6ubl+Wd9hhj+ZQ1xspO7wwnun+QW5cFbPHuu06FoloAA9cy+dGzz
         AF7DXtUD+l33Axuairq7jnZ48BgN/oR2Y/q3wMVrZOL5rGRcaUY4z4SYE9U+BWRWTVbZ
         xILlo4gDLIEuAgBggAKWrfYMIrUshBvKtYH7F5EB9IU2jUNzNztGVFPppYjR8uEtanxZ
         f5vI8ySLIe+ulxz+q4klyXe3SAW76DZSTG6fSD50fHR9Od3Ko61gz0QAELABdo05+nDb
         D5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299600; x=1784904400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/6lk2kxW2nTS1x719Bxes8ej8Ufj/5F6jTJEH0kaK4=;
        b=OFF6F3dR7/QNPe8wbrV26V3cmM/V5GHGUx+scegdLOG19OD6UWVBxX7hP5UhnpCENA
         09yG0kIJq9K7svPj8jXhldWvB/52nXHqVLBDiU+b8Lib3LATBcDPK1DHxNzh9VhihMqG
         5bgpwgxdIgl1Gn092G1Au9BOaC/6CBXvlkZdvuDG6tis91Fex79fZbSjKnGXa3rEt49Y
         Bp954xuv7hxXWUBWa9VW24icyW9p6hL3d0TBxHV+1rpx196sCewrUX/AC7LM+74MWBtJ
         RCg2LIAUlA4dy06o3ROXzwNgCax4YmzDYz6b8snq+XM209W+cFMeCTRMp/miU9wxwCov
         3BJA==
X-Forwarded-Encrypted: i=1; AHgh+RqG/87FXuhfJu1K6eKMcHmbO69Dkwh4wFmWG6QCBMDm54UVeOjVc5Z9lkfHUo4nFar2igliLJ0IvYXWgkWUgqFO@lists.infradead.org
X-Gm-Message-State: AOJu0Yys3zTEDUXfxdmGhwHdu4/dLbQw9593iHryN7rgK1grT/NqvVLV
	UPWDJ1n/WZ4ijC516q/AFAkQj0kYSiGpAMSgtwd1DVmEL4KsAwiGZbJcYdPwOpaXvQXLzPCOf07
	3Bj04wzOgZupVJM8Y1JDwSe8YsFphb/PevcuP5wdKVdglawCAXcW70kN43bBY4B1IarRUrRicJi
	I2GxDQie/6YQ==
X-Gm-Gg: AfdE7cm/iKQnBD0CWwjr0txLIDpVxuVsdaPOxYvJkUhYCtoO6JKd73CXLCdlrV2SnJy
	r7sTxDfNZ70WCvLmXTPVNogU/qdtREhVVjdq0BgpZWrN2LXyGC6+8lqpwaHxWZcCgsY39hsHbo1
	BjAHBCSzR6+zfemgD48K1hHTU3mJkZzsBBRgBp5V2IR6vixpI9lQ5lctsBW27w6ViirfXHgeobz
	yObaoceretOjEBDLijc3vNqjVcxFhQzVn67T/w1Tn0OXJQfyc1DYSJH03mkfSlqHmgR6rTJpbT0
	e8xq2R7uYZ434HEfeY1aDkWgPszKp13JYytAp793YoB8NJAaQeOCHNX4k7YZzHpIfvWSGfsczH+
	02eW84UydhTWNIcu5q17VXnxSDC8=
X-Received: by 2002:a05:622a:1ba2:b0:51c:6e:ef23 with SMTP id d75a77b69052e-5213c9e3db3mr27724671cf.32.1784299600108;
        Fri, 17 Jul 2026 07:46:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba2:b0:51c:6e:ef23 with SMTP id d75a77b69052e-5213c9e3db3mr27724121cf.32.1784299599569;
        Fri, 17 Jul 2026 07:46:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/6] iommu/qcom: Publish pgtbl_ops before releasing init_mutex
Date: Fri, 17 Jul 2026 20:16:07 +0530
Message-ID: <20260717144608.3216274-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXzREoINOaJUwT
 CMbrCZ0OdPDoEyZgB9wDvILWxPe/eswVd52rQ24gPKUbIXKzO+BoHVq1vTR/E0uROqqYtTndu65
 P7R0XaFvhEzu6noZJlcnLGD2CF5jpcgYyghnTLAzG2gvv29IBUiaIaSPHVIrKocaEvyONZW/qZm
 tZoCMODbA5a/szanz6xvGR9KWYKw8YX3xUwdSTYzYzLv4HiJ/L2QerSFljKAGZge5YXqpRzNaxu
 A7HAp3pd3k7Y0yN7gNNKFs6NmqFWJbhUwh2TBHYLVtdJivxYXZ29wlw4RA02r/MS5dKHA2p+oJ/
 Ki1Da4chYsPCBvFn3XsvgT/1lBV0NqIAKLLwIu8t1BeXWWJNAKIncZtCNxo5xmIho+jIx+g0Xcw
 fGkVxPPtUjFYMNG7ku+aHndZQPayWrOvgYDIQLT3ZWn8CIUPhku17gmGgt63xF6R8cKr8bvE6De
 Bqqtp/7MZAbqnXzQXbg==
X-Proofpoint-ORIG-GUID: EQnBYQMwFjIrwCdZSIfy7_9rpvmY0a9K
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a4051 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ya-8ghbQ4qwRuljleqkA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: EQnBYQMwFjIrwCdZSIfy7_9rpvmY0a9K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX0ETCUnMTYcrF
 /S9H21k0M2p4M9d3//rzyV0vIHuLmYDQCeBh3O9Xw3qhR49km7ItEsFKTg7n3G08gDZgjnpjU55
 lY0puW5qvofewWMW0gFVXyIufI9ZxVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074641_873006_C030F6FB 
X-CRM114-Status: GOOD (  14.30  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 222bb7febd03..ecde5ca2d476 100644
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


