Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbKFa6dG5UBkDfq3ndVqVEPf2wDCJCG6++eqJMrwxIs=; b=mtcm6v8oiED2Q8cfCn5xYnNLvX
	46cqb24QOGvTw293DuEEbghlcvgu7KCOF8iAWlrEZ97TM9BLmTm1RSKXmW1t3R+k2hdRHWfU/n0RX
	zXXA1ZSxTqwhTBW2V8ysF2iBx61D27seF+4F64ssm9IPIqvH2A5nsgmI7b4DR/xL9FyaNmrAaNKGM
	xbAPlOJpBcFQhxXZKQp7jrN15q4+0qt/xhuZM/e1xWbbWzWvRWGtShbdaTaBndqQGFR52k43plwq1
	LYOXYH1qXNa8pFcq9KvRmK6hcSkKfJdjyGz/sWNqM7E0a/YiUsLA2B43i4Mg9f1/boMjfSqBnBy3+
	nk62JaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sjn-00000006dGw-0p1d;
	Tue, 15 Sep 2026 12:58:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sjk-00000006dFX-2PGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:58:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hMi42675157;
	Tue, 15 Sep 2026 12:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UbKFa6dG5UBkDfq3ndVqVEPf
	2wDCJCG6++eqJMrwxIs=; b=b1b1sx4T/TbvEJ6t0UPMYxeQD8KFltkntWoh9Foh
	sX05R8XrcnvOkQUpwGfi3jKxC6JdJDOZidBhng2WQ4fd0K9PgqnrfHRclABUMPTU
	mFvzMDvu2xB1JWsd8DVY82NRYAhOWt0IySJMX1y9cBn6lkUVCO6kn7aXngyl4K4J
	1I++lyboZLSOwtNPl3nMUR9k33K0PpfzsxTrVVnatVdVeZrLn7KmGIK0BdmqZw0C
	UXugNJZ+zR2rLz/CJ70pN8bjkAyNr4foVlrCnmKSSXY3zGfO3RqeqjZw3BUyfe8P
	CB5u1KuFSntk5RVB8QXIZ3i1zcOuuYlLy8OQebJYFGOVQQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye71xbr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 12:58:03 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCvx4w2370413;
	Tue, 15 Sep 2026 12:57:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-bibekkum-hyd.qualcomm.com [10.147.243.199])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68FCvxoC2370407
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 12:57:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4253010)
	id 99CB35E3; Tue, 15 Sep 2026 18:27:58 +0530 (+0530)
Date: Tue, 15 Sep 2026 18:27:58 +0530
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: arm-smmu-qcom: Skip fault-info reads when
 suspended
Message-ID: <20260915125758.ekt323jhwsiis6bp@hu-bibekkum-hyd.qualcomm.com>
References: <20260912-priv_call_runtime_handlers-v1-1-fc0c3a17523f@oss.qualcomm.com>
 <fe22fb3d-77dd-4b34-9dd8-aafe11f36988@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fe22fb3d-77dd-4b34-9dd8-aafe11f36988@arm.com>
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX4copq2whpTUq
 skDCKOJ5ityBv84+tFSxUzk2CR+tK+qHdrtB6k0lx91khZ4Z9uMy8McIqXflmCjgJayvto0MpBm
 Zyib+wI3RfFaHFtNWmgtNkTzBrFbx4mHMaWr/uLxIL7TTsTyF9Hmjva0v5pufxjgNV/JGGXdsqt
 gQiQzd+SAT+7EYeJEABGEym5/PtqxprIbj6hgxzBlnBi/HxRaRAKeGrXoYf7B/iZfWpdroeiLZu
 3UrBqkNWO5Q3/A6Pk9M2cpZ3Erp/ePfjf5sbu5qxAcgLMD4zMlRqRQRZ5TnldbH5U2HLtZHBtlg
 G9FVblkFKAb+otRGHhx2xLCTe5Fgjj/wVgVscsBcYFR5fAkikNcloAdbQCM4UDeTnoK1AHRldaH
 XNN3bslFaXIWZ8tk/Wlx1mk1tTm8kan6K/W8WHiWUab8H7YX2wTSwxPfXTdg1KXttqs46muATP3
 oyuleQZizSupEUnmOdA==
X-Proofpoint-GUID: wFe0_PrRhd-FsqBF57E34UOXZmZzEjYQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfXyzAZkhIst5QZ
 mXrwxcdX/JbVpeExZJANiduJrbBL4TS2t4FueVFTNA4Hgfj13craL3xeU661aCAY7o5Qfiaqalq
 JetUvJz3tSoijFwYYvrQ4HBMdcYLyaM=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa940db cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=WfeKVc-BsYg2EYeYhGIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: wFe0_PrRhd-FsqBF57E34UOXZmZzEjYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_055812_737699_D2AA1959 
X-CRM114-Status: GOOD (  17.80  )
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

On Sep 14, Robin Murphy wrote:
>On 11/09/2026 11:25 pm, Bibek Kumar Patro wrote:
>>qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
>>holding a runtime PM reference. A fault is raised while the SMMU is
>>active, but the GPU may drop its power vote before the threaded fault
>>handler reaches the callback, allowing the SMMU to runtime suspend.
>>
>>Accessing the SMMU registers after suspend has started is unsafe and
>>may cause subsequent register accesses during runtime resume to fail
>>with a NoC error and an asynchronous SError.
>
>But hang on, if I'm following the code correctly, the callchain would be:
>
>arm_smmu_context_fault
>  report_iommu_fault
>    msm_gpu_fault_handler
>     qcom_adreno_smmu_get_fault_info
>
>and from here we still need to return to arm_smmu_context_fault() to 
>clear the FSR, so surely that still has the same problem in itself?
>

Ah, yes this path also should have the same problem for GPU smmu.
But I am carrying [1] in my workspace [2] for testing currently.
So haven't encountered the same yet. We might need to address [1]
also as part of this thread. wdyt?

[1]: https://lore.kernel.org/all/20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com/
[2]: https://github.com/qualcomm-linux/kernel/blame/aff7542c319ede2037eeee316f20c2429062c08a/drivers/iommu/arm/arm-smmu/arm-smmu.c#L500

Thanks & regards,
Bibek

>Thanks,
>Robin.
>
>>Use pm_runtime_get_if_active() to keep the SMMU active while collecting
>>the fault information, and skip the register reads if suspend has
>>already started.
>>
>>Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>---
>>qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
>>holding a runtime PM reference. A fault is raised while the SMMU is
>>active, but the GPU may drop its power vote before the threaded fault
>>handler reaches the callback, allowing the SMMU to runtime suspend.
>>
>>The failure sequence:
>>
>>   GPU context fault
>>           |
>>           v
>>   qcom_adreno_smmu_get_fault_info()
>>           |
>>           | GPU drops its power vote
>>           | SMMU starts runtime suspend
>>           v
>>   SMMU register access without an active RPM reference
>>           |
>>           v
>>   later Adreno PRR private-interface operation
>>           |
>>           v
>>   pm_runtime_resume_and_get()
>>           |
>>           v
>>   arm_smmu_runtime_resume()
>>           |
>>           v
>>   arm_smmu_device_reset()
>>           |
>>           v
>>   SMMU register access
>>           |
>>           v
>>   NoC error / asynchronous SError
>>
>>Use pm_runtime_get_if_active() to keep the SMMU active while collecting
>>the fault information. If suspend has already started, skip the register
>>reads instead of accessing the SMMU while it is being powered down.
>>---
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>>diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>index 795e8ec7e8fa..b1787a4ba0d3 100644
>>--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>@@ -129,6 +129,18 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>>+	/*
>>+	 * A fault can only fire while the SMMU is active (GPU is issuing
>>+	 * transactions). Use get_if_active so that if by a rare race the
>>+	 * device has already suspended, we skip the register reads rather
>>+	 * than triggering a cold resume which would call device_reset and
>>+	 * destroy the fault state we are trying to capture.
>>+	 */
>>+	if (pm_runtime_get_if_active(smmu->dev) <= 0) {
>>+		dev_warn(smmu->dev, "get_fault_info: device not active, skipping\n");
>>+		return;
>>+	}
>>+
>>  	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
>>  	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
>>  	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
>>@@ -136,6 +148,8 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>>  	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
>>  	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
>>  	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
>>+
>>+	pm_runtime_put_autosuspend(smmu->dev);
>>  }
>>  static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
>>
>>---
>>base-commit: f61bb3920fa8cb44b84d32e0fa9fbaab4eb00c80
>>change-id: 20260912-priv_call_runtime_handlers-7f3547544040
>>
>>Best regards,
>>--
>>Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>

