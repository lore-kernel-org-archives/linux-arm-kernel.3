Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36487D2F00D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZmsUZzOar+YS2D9w22Y1U9KyUG6BCOh6hWMj2EvhdY=; b=tjsyRn6wJAH9CCRuB7XLJ7LBRy
	Fkm4l0N+HHQ44bEMclnH7Rht5ketYToiedsYKi5PKcA63GSQWd8AytWev+d7f3yemL51B5bAgjyUw
	H3Jwz3YtzuqM+hekhZpxqvREU40LMDX00OJWmvCe9dVskC/dVh8iciiaS141VJXdASGtyL6H/W+5c
	Y9eR6f7NF42gedw6tdqyom7icxmR4l9bw0eq2U+FAg+BHKF33JAgYZNWBgyhLWZs6bojGIrSnFx8T
	uJT1WhIRbP1IGLzohQXk9yC52JUI40C8oz267LGc0RrA16g5/f2BPeVDvzMATYgeMGRrCAVFU4gXa
	U5NMjHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiYR-0000000EGwr-3oDC;
	Tue, 27 Jan 2026 12:52:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiYN-0000000EGvX-0E7p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:52:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87JvN2379266
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZmsUZzOar+YS2D9w22Y1U9KyUG6BCOh6hWMj2EvhdY=; b=WCrpUSk0Nh9wdcbh
	Fo+ten/wdGiQOiLHT0QyBFfckfZqc322d55xRVMEuU6g9EijEwIXYb8H51/vA2xf
	0edmpNWQEzfpjvPiCic3HxswW09BjH7bU9X+3Zw5fxmK2nc5a6N3BbSHVoKJ0Ztn
	+HSl2F8O1sX0y18apoVW9+Nh1PsWZRqhzTQhJ1/pbdvlJ0CSGce7fHmsr8EmknkP
	vdy4PLdcvYHZGqGwMVnaxlSqWpQbNlHyfssC2mDNKqptrTJgtB++IVG/7Qj4hUJu
	auqjIsXl19ZieAECUNN1OTY0auD65XyZc8eEqVDIkEfl9ApVUPNhqjuLTAFQ68ct
	/mpayQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8wk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:52:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352e6fcd72dso8787838a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 04:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769518338; x=1770123138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZmsUZzOar+YS2D9w22Y1U9KyUG6BCOh6hWMj2EvhdY=;
        b=KfwLa734EGqNiFd/Vk+kA5URtPErra+ML3KVDxg/E6nyiWX+GDGtunTFEblgt351np
         JcAN8v3t6ZH/fe59zJKqXyhCzOhmQ+l0Im0e9LCBYLgZWypi3M6/T7ZNnULqsDUCHNSk
         CVbNPwuWY6QaALxKMpWKsQs+rGNUvpy56YUHeRAlFuC90YL+sYkykQ9YI0KDWZLIaFWq
         LXIoLAipg9asLu30G8f+Nm3o2Xw0HZsVpxT7Q3rT35Cq6SP2k342LgMcFT4IU3z6kbal
         NUOkAJ5PAbGyKI+7dGAnZHKOW57dG/TCWkKg1zkfgRsD2UcsbOdFoTA1+SNY5r646g14
         lhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518338; x=1770123138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZmsUZzOar+YS2D9w22Y1U9KyUG6BCOh6hWMj2EvhdY=;
        b=RE0ITsNfudMHBvQpw5DMO4jKMKQQOgZDDQpYphA91slKi3ubWTqBDvJr6yvpX+zCDZ
         LehI11gStCoNV9M2LG2ZEL3Xl9KlHVE9CuT3iRG1BHMoEUnkCfh4RWJa6JSe6K1twWK3
         sM6IblCyQyAoeO+qqyCUFZOI6iwCR3kezEgc+/iXOD1T9JmYBn2R4XuD8pkiWrdiNTtW
         lRr8Y/qi/xyjJeqBwk/PjIhvNaQ3loTdQYqNh5cl6vxhNAE7a3Es3UOUEh0oZ5LV07NN
         sdT+vBwYLZbq1gxeM6IvJz5JudCk7FPgBrza1lvU0lPyIO78kYK3a2zO3rtzlEd3SYgX
         J2rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz+WSi7D6sd+rjj5zxG7wr9GS+QoFz5y+YCgH7sw7oeJHYhTPysbf/0ERNjYXhXUAIpQy2Lv5qG45/tarUpmGI@lists.infradead.org
X-Gm-Message-State: AOJu0YzNpbLNuI44gdS8qhSKvBBICdBLI9Wb/U2vv/VLPU8m3Ql/ycm4
	qN+6W4gkY/5ObRLFiF7my7sMuWYVT6WEXSxR4baUG4kK5sn2zGV8X39B7apHZm3In7LHOc6Y6Vi
	LguhYxaenoeBd+9Bknuvyx85UVwaqZjNakNNLEMZdFD4KDgCDNCtg7vvu8bWCV56UTW8kdEUFN+
	mx+Q==
X-Gm-Gg: AZuq6aJxigvHbFCfCFr2xpI9J3c/4cjMNhXM2svmsRHhgLsr6QBO34PJTP72kGVmI1I
	hIwkWq0vO2SiZJABIMSYcbcZsTv6X1jH1jNmcMT6TODOMhs0fw+ThbQi9QL1ulMRwi+opQUsQlA
	7vZO4UcTvpFJ5VTr8eW94A59do3Sh1Ey1GD75Gn2xWF5U/47FtP5XTm+ko87oz2zM6i+vHFEY1X
	eJC8JbIMwJAe8lf5QzD8tdAkN37uz/Ep+rqzidilqLlTsS5g0/wXegwfb1aeD0KuHBHXyAEEN1X
	bAiIs3/79hchYSt7DqhgI8CmtyuixrxuU58taXKvWyxZWiWrRVF9sbRBd9ah8vQU5LQNy1Ed0ic
	rozqWf+gMH9cEcWZrfgdc8gzfl9FDDVC9
X-Received: by 2002:a17:90b:4a88:b0:353:2e1:9605 with SMTP id 98e67ed59e1d1-353fecba4efmr1642192a91.6.1769518337647;
        Tue, 27 Jan 2026 04:52:17 -0800 (PST)
X-Received: by 2002:a17:90b:4a88:b0:353:2e1:9605 with SMTP id 98e67ed59e1d1-353fecba4efmr1642162a91.6.1769518337184;
        Tue, 27 Jan 2026 04:52:17 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536aeddff9sm5409630a91.0.2026.01.27.04.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:52:16 -0800 (PST)
Message-ID: <9d3c78e9-db4f-4ffd-9097-f48e73d62c8d@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 18:22:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0MjmidVTcZEK6KoLQsBHkeflgzAaf16X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNSBTYWx0ZWRfXw6q2wPCA8e2e
 kPHTvTyJ1/j7CQ5dRFoZC7XtM9jjWgau2bGqml/81cF7NYHzmiCC8B0W7bvUybOtdHhxJdpCpE4
 EL2l9UULAsS4xchP7tVhM7UP8gCqPecj6NrS5H/ULp/H+9wjnBSQpQ1Lse++bNhMN6enyyIsYhX
 owDT7S+7wd4TW2nmRHNZFVyDLbluDbig1X3y/ulNUcuP6OXSZ8lOQH9HaimXE1KAMCqpjbRsoZb
 EmwP2lWquMo1MxNpSV4K8pNFqoaOZ9K4+cqEv5viWBKzmxFBbb6aH7Qo1v1ZVJr7GoIUp10+1uU
 Uj/s9LhUPub+lckjMsbYsJ+zgNqE8/LbQZAn2wMWETwBlPJeLKaNgKrOc/ph79S73hTPCiv7CgQ
 2WrtOV7R226jnLBfddNhTGEHTGFu9vTCCKCFv5gCAWjdNobA993MqXuMWtV4d152+37fHzEIa6L
 S3f6Ls4pmsRb4kGTjKw==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978b502 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hxDPLbPtHj1mDd5Mi3AA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 0MjmidVTcZEK6KoLQsBHkeflgzAaf16X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_045219_104437_4D138C9F 
X-CRM114-Status: GOOD (  14.62  )
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

On 1/27/2026 5:41 PM, Prakash Gupta wrote:
> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime-resumed to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down
> SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.
> 
> Guard the context and global fault handlers with arm_smmu_rpm_get() /
> arm_smmu_rpm_put() so that all SMMU fault register accesses are done
> with the SMMU powered.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

