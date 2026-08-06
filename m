Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12031C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XcAoiANmEcMbel61kHL29IMp6ZNyBHShgiap9zoaO8=; b=pQJaIre6hkSnfMsQBtPVey3tRb
	lrgusKADDYKnIJfhFKw7NkjyQ0KYg7+CeT8iy5drlkZXyeYRQFddQUdOe6wI8qTenfeoc89eao9qu
	3fXgBhrP9gaN7MIJ3/h6IXrAQZVeO3Ofzz8VSeYIG3n/TfRs2/X1g3UJgk4R5Hv04IZob8nFv0Ok3
	HypicDO7pjpQy4WaBait3eRrXys3makrm0QHL8LrYBlG8b2x6EqP92r/v9tN/cz96ook92nGjd+2H
	dDZ/bboSSr2+6awx6JmZajv4Q5h9tvvLfBc1PEgVn09x4KbKrLZwOIdsRlA68gkNM0lpzqCJteX3N
	OFvub2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvdP-00000005aJo-05Xj;
	Thu, 06 Aug 2026 10:47:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvdM-00000005aJD-0ZYH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:47:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nkLL1871415
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XcAoiANmEcMbel61kHL29IMp6ZNyBHShgiap9zoaO8=; b=QSKWznhVTZ6i57kV
	kjaG1ShV01GKobYOyZb3oRWY7ctX4zYP5YXNsoB0EoBQef2S/z9/2rUPiXm/HOHa
	7npdLv3qiJj9F3gFV/IMo3bv72iFiKyKES3GhvnkqoED1LeN+Hzf7+GPDIM+mxeI
	sedbtXhmZF0Zr3tEiC0Gl/U+6iFiNOOq1vhMX5m2yYaVTaEuHXCsPnrLlCU6HROX
	mMlUpV3Mgo9c9DY+5Jcugh4eVIkpmRUSgCU8mE9FjGFjFLkYnBRlfNZoNBUx762C
	rIroqx/Gu7ROp4rDwgULhKH8ISfVYJJqEbibvFi2b9ju+D4dEt8YvrvlSEZX9+gQ
	RvuP1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1m8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:47:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so5085485b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013246; x=1786618046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XcAoiANmEcMbel61kHL29IMp6ZNyBHShgiap9zoaO8=;
        b=LUnXGBiXkhhtm+HUKKEqs8iM+7Le1oYE0Z34m8p31sXdSxyqgR76cQpPVMrqL5vJD2
         oG5kaw73UIbq010FTYqGNNRBCWJdyNqUIkgzXFhn1/6vSBajo7sZBL6Fw+k0fZvjlJa3
         1bLolIrp4zWZgCwLTU3X0b7pJS4rRAdyQUb5aEKjXfw+pMDmYzI63+m42WqjEiNL6yTg
         zPquOj2f5MEaY1hsz8o//+bDtlevzY0e7OcVfNu/K5EX26MXpM8o+9q/n4nTZj+FJg4s
         D5r5IjAJwZZ+0rNjVYoShLjfIAl6xp/Iws97HQU+rS4/R/BkvlYEaLIxn3N+TpOJa1yx
         0a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013246; x=1786618046;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XcAoiANmEcMbel61kHL29IMp6ZNyBHShgiap9zoaO8=;
        b=g4W8xRU+vxCJo7mMiYnO6HCTHVUD6vW7mAupTZYlp5kYv0T3IsRnN49HJBmf7TAdx0
         y7oPmo2y828uJOwwlkjsMcvNawT6gDjK8BtvDJVrpU2VEajsMNYEBxYl77NSDERQGdUC
         WFBBcLhGyzj7/2/Togm2FGYFdkTe0aY/cMnyaEPX8OlxdxMfcJnnpDaqng8IGut3oA/R
         OPzuz+GM2O4oJdrMePSeiDzfRGluHA1EkzKcDaI1isAZdI8LiYCLad1AxuCTP4LGaq3u
         SRfhAACjzIAWtgIDB3GR7z3SNMeWEtJbMohqZAjw2pFGMAPhZx0el6ZgldnFKNUBw6g8
         tM8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqv6JbcAmuRsXSOo0bU4OpH9wzBykUKZWnOjhQCKw7umPmgElhtu3c4FoOaP8anmcr6OFHp//SliwLEXxo/VAP+@lists.infradead.org
X-Gm-Message-State: AOJu0Yym7LCF8gnsE2lhoEBch6HwEem8Il9xne3Xup1xOx4TC7TLQvS1
	6ZlKlRpjwAiY9XNRWWIM3A3FBRuEmmusTdfqXvlsiFRUVGCjjjt7uXbXLH/m1j5H4NYUOpf1lxU
	LAnpbR3oJ2dtLHvF6UiA6Ceaf9LgT5JAHD+Vbko1hF5N70TXRjGaB+dPnhxeapuk+3bLUOB+4nN
	ZPfQ==
X-Gm-Gg: AR+sD12VvXV82OvXZpn5GSkY+L7+6eG5msZJ1ozbvtu+qDqDEqrMe2BFApBafRirlmq
	UTKImb8wRccFbNupjI9Sp9/h0xWgLAzjLsxny5FEQSdLOlOVrpxOyp1Jx/4MqQNLiCIc1jCH9ba
	Vu9c3JVu8TeHZ894xYeY7n/fm9HGBke8keaMJnKGdCmS+0CdxbuIorywiYWDS9JKjFdChGsni5E
	Aaw/s/S3e5fNC8GIjibnGBwk09s7eQ3AYDRg4qQHMcf7OUSpGo+TDrAYDuQmWP3EhF1sOacnBO3
	U4wRrnQutq0Dix0zgK17/Y01Zxq4WsDP7bzFFWcVlZc5lLdNtZogb7KUQna+OGkldZQi2jPOOTG
	KxYerb9jzGKqTrJFZGdN4l0KfvOP6X4k=
X-Received: by 2002:a05:6a00:3c84:b0:845:e9f8:67de with SMTP id d2e1a72fcca58-84f2e0555a6mr14758722b3a.27.1786013245879;
        Thu, 06 Aug 2026 03:47:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c84:b0:845:e9f8:67de with SMTP id d2e1a72fcca58-84f2e0555a6mr14758664b3a.27.1786013245412;
        Thu, 06 Aug 2026 03:47:25 -0700 (PDT)
Received: from [10.218.10.148] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453bb24csm1138822b3a.24.2026.08.06.03.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:47:24 -0700 (PDT)
Message-ID: <89c7178e-dab2-4b2a-8d8c-c91363b7280d@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 16:17:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
 <anB8ydWLQw0KZxqT@google.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <anB8ydWLQw0KZxqT@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX5DR1xx6+AEHP
 N1jMyCf+YQfUf+IPQ+ZZtJycp2B+Bm9Mth2b94Qdq/jZQ9KsH5mmG2UGbNgYfYPo4vZDUMBa3XR
 uVg+2kK6nfZ0CBEXGcZxaI02AzyjgpzimbJj+Svl6A4jgCBovkCnl2AS4XlanDnYmtYeuSqB3sh
 y3e2gdDfclJz3iblinAonQ2iv0queNFNWV9r9ZgJflWLGh7fkWmB8mH8Jl3RhLsbqMKczGHVQPo
 ahQCA/6ccKtrPKpqw5QEyVh2IS4QyI4bCCMH03aPpMgAdNv9RfcWqOya9WVlxdI5aqxNDnyKcLn
 t7Mf+RnKi79gJ+mn7tc+GpJH4gFwiaJ8OfHcgvUutaeYkX+jWTDv/avWAls2VETmCD0nx0IM33A
 2P6BRF+3RqnYq6iJPCgXfyYBzAjsBBO/EU7f+qEW8lA3sIZN/PPxdM8FHElIu+5eNT7pVkYA86l
 HNA5xKfNJQLuRcVdPmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX68mJW9NEQxMB
 7HH/q9gOKwbQih0mqvSDmqSqffPsE53usb9C4etggTA3CShUiMl5Bjw7TqX2Zw6klptYh6Gv07Q
 ARvuyJLDI/uJ+yv7rwkMyeiPdUWCBCQ=
X-Proofpoint-GUID: VcGLjVcjNMT1lXvpYQEWujXgqGU3C_hw
X-Proofpoint-ORIG-GUID: VcGLjVcjNMT1lXvpYQEWujXgqGU3C_hw
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a746641 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=k4Bztf7HfYMb5pBHrIQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_034732_302631_76CC07CA 
X-CRM114-Status: GOOD (  35.39  )
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



On 8/3/2026 5:04 PM, Pranjal Shrivastava wrote:
> On Tue, Jun 30, 2026 at 02:32:46PM +0530, Prakash Gupta wrote:
> 
> Hi Prakash, 
> 
> On a second thought, I'd like to discuss one more thing
> 
>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>> sits in a power domain, all register accesses must be done while the
>> device is runtime active to avoid unclocked register reads and
>> potential NoC errors.
>>
>> So far, this has not been an issue for most SMMU clients because
>> stall-on-fault is enabled by default. While a translation fault is
>> being handled, the SMMU stalls further translations for that context
>> bank, so the fault handler would not race with a powered-down SMMU.
>>
>> Adreno SMMU now disables stall-on-fault in the presence of fault
>> storms to avoid saturating SMMU resources and hanging the GMU. With
>> stall-on-fault disabled, the SMMU can generate faults while its power
>> domain may no longer be enabled, which makes unclocked accesses to
>> fault-status registers in the SMMU fault handlers possible.
>>
>> Guard the context and global fault handlers with
>> arm_smmu_rpm_get_if_active() and arm_smmu_rpm_put() so that all SMMU
>> fault register accesses are done with the SMMU powered. If the SMMU is
>> not runtime active, the fault can be safely ignored as
>> arm_smmu_device_reset() clears fault registers on resume.
>>
>> Additionally, disable fault reporting in arm_smmu_runtime_suspend()
>> before powering down. pm_runtime_get_if_active() returns 0 during
>> RPM_SUSPENDING, so without this, level-triggered fault interrupts would
>> cause an interrupt storm while the device is being suspended.
>> arm_smmu_device_reset() re-enables fault reporting on resume.
>>
>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>> @@ -2306,6 +2329,25 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
> 
> [...]
> 
> I believe, there is a small race condition in the suspend path that can
> lead to unclocked register access crashes. (Something similar to what
> I've attempted to handle in arm-smmu-v3 [1])
> 
> In arm_smmu_runtime_suspend(), we disable interrupt reporting in sCR0 and
> SCTLR, and then immediately call clk_bulk_disable(). This disables the
> interrupt generation but what about the interrupt handlers running
> *during* suspend? I believe we could have this race:
> 
> CPU 0 (Suspend Context)                    CPU 1 (Interrupt/ISR Context)
> -----------------------                    -----------------------------
>                                         1. arm_smmu_context_fault() starts.
>                                         2. rpm_get_if_active() returns 1.
>                                            (Clocks are ON)
> 3. arm_smmu_runtime_suspend()
>    - Clears CFIE/GFIE in registers
>      (stops new IRQs from firing)
> 4. clk_bulk_disable()
>    (Clocks are CUT)
>                                         5. Attempts MMIO access (e.g, to
>                                            clear CB_FSR or CB_RESUME).
>                                            --> [CRASH] Unclocked MMIO access
> 
> I believe similar to arm-smmu-v3 [1], we must call synchronize_irq()
> on context interrupts after disabling them in the SCTLR but before
> we cut the clocks. This forces CPU 0's suspend thread to sleep and wait
> for any active ISRs to safely drain while the SMMU still has clocks.
> 
> We can simply add this loop to arm_smmu_runtime_suspend():
> 
>>  static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>  {
>>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>> +	int i;
>> +	u32 reg;
>> +
>> +	/*
>> +	 * Disable fault reporting before powering down to prevent unclocked
>> +	 * register accesses in the fault handlers if an interrupt races with
>> +	 * the suspend callback (e.g. device in RPM_SUSPENDING state).
>> +	 * arm_smmu_device_reset() re-enables fault reporting on resume.
>> +	 */
>> +	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
>> +	reg &= ~(ARM_SMMU_sCR0_GFRE | ARM_SMMU_sCR0_GFIE |
>> +		 ARM_SMMU_sCR0_GCFGFRE | ARM_SMMU_sCR0_GCFGFIE);
>> +	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, reg);
>> +
>> +	for (i = 0; i < smmu->num_context_banks; i++) {
>> +		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_SCTLR);
>> +		reg &= ~(ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE);
>> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_SCTLR, reg);
>> +	}
> 
>     for (i = 0; i < smmu->num_context_irqs; i++)
>         synchronize_irq(smmu->irqs[i]);
> 
>>  
>>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>  
> 
> Since we're disabling those interrupts and fixing concurrency, 
> this seems like the perfect opportunity to add the sync_irq too..
> 
> What do you think?
> 
> With that loop added:
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> 

Thanks Pranjal for review feedback. I have addressed the comments in v4.

Thanks,
Prakash
/com

