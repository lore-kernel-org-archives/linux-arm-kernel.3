Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0655EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYWJkhNIK4vEw8z7nhJCveZpwInyCIrXGAzZOF/vmPE=; b=ZaEadBGUzPY2VUMznz7oQ8rxon
	VRRj6WpPtJC89rqxUXvSglITZ8SymgUD0+oyZIF+WplJS74XZeYgDIyU+6xMvm3ibonEmAo5HJIYo
	BF+a/FFBp7PZkuYYH9wKvGumbqLH/RYSYj4p58n5kAmPMoV48Bm1px9JmTxjdpIPMOvBPz0NNG7Kc
	c4kV2ntPiEdISESLq0KBL3oMAFXT0WOJsDKDVFlVcZ6lYlDQykaUB9eg3MtP7Smvcl1NwSRniw07W
	EtBKjYFoZ9RWAaMlD/pquG1JNoVFuqbc1TMfHWgfjqmVGPLDBs91riZo0XzJyzrFUeLLQ6rSFLOMb
	O+3LOI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7x5-0000000BVAf-0t1T;
	Fri, 26 Jun 2026 14:54:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7x3-0000000BVAA-1Ai5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:54:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcr983384438
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYWJkhNIK4vEw8z7nhJCveZpwInyCIrXGAzZOF/vmPE=; b=nZ1SMgbCdM6XOVR1
	iinWb5Si+AAILW4f57MbZ3eRlU/0q35t64nBbizVTVbZNFoCH6nvIkJw6hJbEHtW
	5JVJwD98DI77lkVNqJYPkXVJrvDn32XrCQKSSL6DRJyBW4AjxnXz2xgVJibIytrg
	XyJgoblrtq6VLyEn1JzepHwFwNgBz7bjPYJSzoi+v/HMjobPLtCLK4lqG5+mkO5e
	v7pWy6tPs55DZate5bFbwqrP5j1653J4BDTV/diUTNIHTyKEanmzCmPJeVtKTCOu
	hnkIY9O9h0VSxqx5Oq9mNrT+wH3y8zSeLobSTP5OUTjIbYtQxtoTyhpqi9V24eLU
	p4KcMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f19m3v8px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:54:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bbd0afffso15762055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782485680; x=1783090480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mYWJkhNIK4vEw8z7nhJCveZpwInyCIrXGAzZOF/vmPE=;
        b=kuvyEY0d9Kx5V2Rb5rSgV1SGtaq+KMwjjQjntV622kNU3Tb+S8ELg9pc3QB3vx4B5I
         16mgklSVBnuNKCfZxdhRRV88p1TFDUZ3/WbYATZDyPALri29fcW7Q6Wm5PxvBQzqbjIA
         FcucTIoK98qAKIS4LXBbWQKXAz0DQ0zsbL+uV4ApsLkAR0xr22u96a1NtYgy4qoTAeoM
         GYvmqS04Q7Mr9Hm4aNPIGMaklCIC33X/G3gOc/15t3s8amik+gpbDNJ4ddBI1EAuLNRw
         NKuJ5ecU14+DNto83uMSGwbn/CtfHur0+nzvX2zfOYICs1hEDnMkeGQxBkL8AxuxfEm8
         8zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782485680; x=1783090480;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYWJkhNIK4vEw8z7nhJCveZpwInyCIrXGAzZOF/vmPE=;
        b=bJo1T3tWk2z41BJLowxLw68h32+PsPsSu6ZHKIUYr4UICggqKADNMtYccxhA0CC219
         ++DOK3I4/sz5T573ymZkGpo7UPZ5nIRz0WCduQ0PqmuFzNo8nPX4YKSE5RGEqrG9Ff0d
         C9aZHp9IS/1rnpyEo6X7Ti/zQFjZRcVNNnZT35VIhaTq4aqcrLYS4QjNAjBWiYWAuOWr
         M20aRcP8yUvV78PsykcrtmebPzS4UcZbrSxOggohGtQgGa9aCRm7Ddbn29MemfC+VMkH
         NsEKFGkfNc0OdHgVah0NTPkhZLkqWeuMSaaSVxrHfBRlka88tznK/l2RwN83nvuy27Zy
         kUYw==
X-Forwarded-Encrypted: i=1; AHgh+RptW8xUw1Y7pcfA9c9OgetcyTV+mgG+DQRapshtPNecM2uZjrZPu8cFT2UVU//hBN6ivdkaoiZSixbj3xTdkXbQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxHPW8QNFQtiIHBlCbXipJ9eE3Yb8gVONbJpfFI8I66q5OwHpK+
	1FH8lvOt2Cx2TeU26Y/B1+FWIHOWU30HQ0JGdnIi661+KrjFR6wgfEtid6V5RWsKgThlVzdxdou
	BSztPMy3gUor8YiDvZmhouO03JJJbDQXRPKDwjDnaUaeZCibMOgZDWFYBEx+CWdhhmjM6gPDARR
	xTPQ==
X-Gm-Gg: AfdE7cls2jWKWtOuScTptoJSjrLltQmICTT0sLx/Grsmo+yU12BBmumd+qpvtFUtkdM
	NdMEBg9A7kaxVR0g6pnbCpG14gBtP/vzGenZQpdq8qW21Qyk8DBVBC2q+xoIgyLRvy6YUnYjtQ7
	hvHJpUPCVPxXaniE9zLcfEaw3hKNc64Niwx0/8pnjkvgNuQchw9hQRrFfy1VsC6b+eLcwpVh2b/
	X6D2MgM6leHXtHG9UBzI6tChwj7+f+YXZ31MLV67OLFsnq5qZcsptKlG2VjgWrXl0m55MAuEq9i
	VZe21rCt/O19ggZd0JI9x/bRVIZXUYCXhAKdcNdINtuenbj0KycEsN5N1ZdxvJxq5wOHIIe6VKk
	9yM/0Y6TRU7A8BTI5UuVl2K1UFd8fYqy83Jo=
X-Received: by 2002:a17:902:c40a:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c7fc654109mr75502885ad.6.1782485679550;
        Fri, 26 Jun 2026 07:54:39 -0700 (PDT)
X-Received: by 2002:a17:902:c40a:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c7fc654109mr75502655ad.6.1782485679097;
        Fri, 26 Jun 2026 07:54:39 -0700 (PDT)
Received: from [192.168.29.96] ([49.37.170.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac899esm41390565ad.7.2026.06.26.07.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 07:54:38 -0700 (PDT)
Message-ID: <2a52ecb1-be8a-4522-aa23-f3277f0555fa@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 20:24:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: harsha.v@oss.qualcomm.com
Subject: Re: [PATCH v2 00/11] iommu/arm-smmu-v3: Add PRI support
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, robin.murphy@arm.com,
        jgg@nvidia.com
Cc: joro@8bytes.org, bhelgaas@google.com, praan@google.com,
        kevin.tian@intel.com, kees@kernel.org, smostafa@google.com,
        baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, skaestle@nvidia.com, mmarrid@nvidia.com,
        skolothumtho@nvidia.com, bbiber@nvidia.com
References: <cover.1779944354.git.nicolinc@nvidia.com>
Content-Language: en-GB
In-Reply-To: <cover.1779944354.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyMyBTYWx0ZWRfX7WTJELQeg6Q3
 QcsLObmzKK8r4LNRr/zTEQsvk8MPmiZjfTIFpcrI7+WL5iaAwVecqzi8Whk61yE/I7JYOkaT6WI
 T0y13QR2CiXkVVuprtwKhT7i32w/Ii4=
X-Proofpoint-GUID: waxLIsPbxWz2FprWd9OXbghecw3OMMyG
X-Proofpoint-ORIG-GUID: waxLIsPbxWz2FprWd9OXbghecw3OMMyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyMyBTYWx0ZWRfX6c2OqI1jPVWy
 a+1CRGvptkZZHlRR4+i0hD/omVbPH9xaBEU+pBsiIayLtcu3EyEfx1wtxPS3SNwlTaQtEj2AInU
 mol/VNQqekzDksRaXf6NnzQyVIPBodPQuZdmGu1U1LdCLIO5scJDLbOp53mVn2gl+FofGUfpl01
 6FMD2IfG/Rs1kzMFNySqfHbIKo6JfsOGvSYh2z5y2jLBRxkT7ng4U4XNcdAzZdNebq+aZBdIbZI
 310v5M5nHbMbbfdUT2CEloo/8e/196OameXFUDDuaHIj3E8sJTE4bE9bBmfLB+TeTXvhWerGxCD
 gQqZNp3b66guUDIUHWLxUWdvtnwm2Ir2AoiBWZ6Ldcqt2zU0xuxdcq04SSqPhCORXhGHcGVQ4bb
 qSqtxZBnIVxamSqIH7I/F9vpoleyjnt9C7iUGCVZ0DOtldRoJuVUKMqSnPRIXl6+zMHZB++RD97
 g/PqPUdUHqBFDbHnZ2Q==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=6a3e92b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=asHclmMlXTalQ/2ShlWtEQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=XZ8z-I0mWLgmP2cXQ10A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_075441_321923_647385E4 
X-CRM114-Status: GOOD (  19.89  )
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

Hi Nicolin Chen,

On 5/28/2026 1:29 PM, Nicolin Chen wrote:
> The SMMUv3 driver doesn't handle events on the PRI queue or respond to IOPF
> faults. This series adds the missing pieces, using the IOPF infrastructure,
> to convert PRI page requests into iopf_faults and issue CMDQ_OP_PRI_RESP.
> 
> The iopf_queue_flush_dev() contract requires the driver to first drain the
> hardware PRI queue and synchronize using a threaded IRQ handler before the
> IOPF software flush. This drove the additional commits compared to v1:
>   - arm_smmu_drain_queue_for_iopf() drains the hardware queue to the PROD
>     snapshot
>   - arm_smmu_attach_release() moves the teardown outside the global lock
>   - synchronize_irq() closes the gap before the final flush
> 
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/smmuv3_pri-v2
> 
> FWIW, engineers on the NVIDIA side have managed to verify the PRI feature.
> 
> Changelog
> v2:
>   * Allocate evtq.iopf for ARM_SMMU_FEAT_PRI
>   * Pick up Jean's PRI stubs and PRI export patches
>   * Enable PRI for PCI devices in arm_smmu_probe_device()
>   * Add arm_smmu_drain_queue_for_iopf() for EVTQ and PRIQ
>   * Add arm_smmu_attach_release() to rework the IOPF drain
>   * Add IOMMU_FAULT_PAGE_REQUEST_STALLS_TRANS for STALL mode
>   * Gate pci_enable_pri() on FEAT_PRI plus a non-NULL evtq.iopf
>   * Deny unrecognised-StreamID PRG_LAST in arm_smmu_handle_ppr()
>   * Disable PRI when no IRQ handler is registered (unique or combined IRQ)
> v1:
>   https://lore.kernel.org/all/cover.1772568590.git.nicolinc@nvidia.com/
> 
> Jean-Philippe Brucker (2):
>    PCI/ATS: Add PRI stubs
>    PCI/ATS: Export pci_enable_pri() and pci_reset_pri()
> 
> Malak Marrid (1):
>    iommu/arm-smmu-v3: Submit CMDQ_OP_PRI_RESP for IOPF event
> 
> Nicolin Chen (8):
>    iommu/arm-smmu-v3: Add arm_smmu_attach_release()
>    iommu/arm-smmu-v3: Factor out __queue_empty() and __queue_consumed()
>    iommu/arm-smmu-v3: Add arm_smmu_drain_queue_for_iopf() helper
>    iommu/arm-smmu-v3: Drain in-flight fault handlers
>    iommu/arm-smmu-v3: Support PRI Page Request in arm_smmu_handle_ppr()
>    iommu/arm-smmu-v3: Disable PRI when no IRQ handler is registered
>    iommu/arm-smmu-v3: Allocate IOPF queue for ARM_SMMU_FEAT_PRI
>    iommu/arm-smmu-v3: Enable PRI for PCI device in
>      arm_smmu_probe_device()
> 
>   drivers/iommu/arm/Kconfig                     |   1 +
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   3 +
>   include/linux/iommu.h                         |   1 +
>   include/linux/pci-ats.h                       |   5 +
>   .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   1 +
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 244 +++++++++++++++---
>   drivers/pci/ats.c                             |   2 +
>   7 files changed, 221 insertions(+), 36 deletions(-)
> 
> 
> base-commit: 74fa4c177ad09800b007cba043370c887bb1b4e3

One thing I noticed while reviewing: when arm_smmu_priq_thread() detects
PRIQ overflow, partial faults (non-LAST pages stored via
report_partial_fault()) whose LAST page was lost in the overflow remain
permanently in iopf_param->partial. This is a monotonic memory leak —
it grows with each overflow event.

Intel VT-d handles this in prq_event_thread() (drivers/iommu/intel/prq.c):
     if (head == tail) {
         iopf_queue_discard_partial(iommu->iopf_queue);
         writel(DMA_PRS_PRO, iommu->reg + DMAR_PRS_REG);
     }

iopf_queue_discard_partial() was written for exactly this scenario.
Could we add the same here arm_smmu_priq_thread()
(drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c) ?

     if (queue_sync_prod_in(q) == -EOVERFLOW) {
         dev_err(smmu->dev, "PRIQ overflow detected -- requests lost\n");
+       iopf_queue_discard_partial(smmu->evtq.iopf);
     }

At this point all surviving entries have already been consumed by the
loop above, so discarding unconditionally is safe — implicitly matching
Intel's "head == tail" guard.

Best Regards,
Harsha Vardhan V

