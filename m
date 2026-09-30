Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCCDCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGJQbIPR3kA6PZc6m3nRdbj8zEc9Mo0tTqEtYTXGkys=; b=Rrks7tM0PmtNPB6GhRBLI9j4yI
	ZSJ3sIvMBZKfxQ2P7U88NBZAYQ86jHgwvqKUI9l87f19NfGmuJxfmEu7QXASdUZ8v3HbsIUG3OAgY
	aQTp4Wt5XmyIFV06EzWhco6UfisQq/FWKBmJurx/aYxbeFrRAVf+biTN/sTxAapD1eyaDD32yPqM0
	0VScFBndRAyq2pBvJJNgItun0MtgDHJFii2lvbyZxSFqff3V3gZKFPAASiahVsI7tOJFVUC6ER1Ly
	uN/7jTVWo3CjE+iStRkIh/+ovjotjS3r9GsdEQVCBEKja4C/fm3xs9wJLefbQuCNCPLc2Mke6M14f
	9QvoQANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpxk-00000005Tk6-3WMk;
	Wed, 30 Sep 2026 08:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpxj-00000005Tjv-1ZZ2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 08:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RGJQbIPR3kA6PZc6m3nRdbj8zEc9Mo0tTqEtYTXGkys=; b=mdLorWhpgqKjOH589guBRTYGTL
	/UesAZxleDNHm8I8iFMdpQCrvGZwmfW9AjFsM00YA196vkgHHrDajcyrSRTZBP3KW/fAcmN3K86YW
	hlJ8QsYAysUbwi7XAMqGFzBVgqwpdV2f2Vc56XOBcpi8U8k4tOSoaGOB0gM1f8nHZDTfR5qWTtJ11
	LzIy1kLVqFwXfn0eIl4ynJ63vIaOjK0kSI5ahHvEhl5pPYEiq+8EHr0fjw/nUWx+HEYtI/WX1Lo3J
	gRubCVlC4DLOdYh7Y1sJDsVkG5+EgxW8337+BQyp96HSbXB0AfLid9SW6WOxSaoKeHsieAvA3fHUO
	wx23mDGA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBpxf-00000003Xfc-487I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:46:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C270143D;
	Wed, 30 Sep 2026 01:46:42 -0700 (PDT)
Received: from [10.57.9.178] (unknown [10.57.9.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C6533F85F;
	Wed, 30 Sep 2026 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790758006; bh=TbOx0th03nmS0W8loOgkbUdAvklfLT2M4ddkXiq7sFc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=N+wh5P6EBD64Hpdly5G8CCoRPlBWEpnI4pYrjVoIg30lXApnFaGyysqGtnxl4SqBz
	 307AU1GXS6RzJplrZrtzF1pAL8NeIOGfp4T9R24Zeu+5RS9ZmBS19G8eHAk5zu53OO
	 VwFaplFKHzEv/NUn7G6hRKkk8Fr9BblPL+o8enUw=
Message-ID: <a7f26cee-4378-4d79-853c-759c549544a1@arm.com>
Date: Wed, 30 Sep 2026 09:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 4/9] firmware: arm_rmm: Add support for SRO
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Gavin Shan <gshan@redhat.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Steven Price <steven.price@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-5-suzuki.poulose@arm.com>
 <20260929223042.681D61F000FF@smtp.kernel.org>
 <e12fb220-505a-44cc-bc43-4bd4ec0e9f7a@arm.com>
In-Reply-To: <e12fb220-505a-44cc-bc43-4bd4ec0e9f7a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_094648_566062_8AC0B20C 
X-CRM114-Status: GOOD (  18.38  )
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

On 30/09/2026 09:45, Suzuki K Poulose wrote:
> Hi,
> 
> Responses inline.
> 
> On 29/09/2026 23:30, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential 
>> issue(s) to consider:
>> - [Medium] arm_rmm: SRO cancellation discards partial progress limit 
>> leading to memory corruption
>> - [Medium] arm_rmm: integer overflow in granule clamp bypasses RMM 
>> protection
>> - [Medium] arm_rmm: missing validation of block_size_fld leads to 
>> division by zero
>> -- 
>>
>> commit 44837285c82689401d14180cb932077aa7982b67
>> Author: Steven Price <steven.price@arm.com>
>>
>> firmware: arm_rmm: Add support for SRO
>>
>> This commit introduces support for Stateful RMI Operations (SRO), 
>> allowing RMI
>> commands to return incomplete and be resumed. It adds SRO state tracking,
>> memory donation and reclaim handling, and wrappers for SRO commands.
>>
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>> @@ -14,6 +15,687 @@
>>> +static long rmi_granule_range_delegate(unsigned long base,
>>> +                       unsigned long top,
>>> +                       unsigned long *out_top)
>>> +{
>>> +    struct arm_smccc_1_2_regs regs = {
>>> +        SMC_RMI_GRANULE_RANGE_DELEGATE, base, top
>>> +    };
>>> +    long ret = rmi_sro_execute(&regs);
>>> +
>>> +    if (ret == RMI_SUCCESS && out_top)
>>> +        *out_top = regs.a1;
>>> +
>>> +    return ret;
>>> +}
>> [ ... ]
>>> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
>>> +                 unsigned long sro_handle,
>>> +                 unsigned long donatereq,
>>> +                 struct arm_smccc_1_2_regs *out_regs,
>>> +                 gfp_t gfp)
>>> +{
>> [ ... ]
>>> +mem_donate:
>>> +    rmi_op_mem_donate(sro_handle,
>>> +              virt_to_phys(&sro->addr_list[sro->addr_count]), 1,
>>> +              0, out_regs);
>>> +    donated_size = out_regs->a1 << PAGE_SHIFT;
>>> +
>>> +    if (WARN_ON(donated_size > size))
>>> +        donated_size = size;
>>
>> [Severity: Medium]
>> Is there a risk of an integer overflow here before the bounds check?
>>
>> If a buggy or compromised RMM returns a maliciously large value for
>> out_regs->a1, the left shift by PAGE_SHIFT could overflow the 64-bit
>> donated_size variable. This would result in a small value that bypasses
>> the WARN_ON() check.
> 
> Fair point, this was due to the removal of donated_granules. I will
> rectify this.

I have folded in the following hunk:

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index 8d839e9e61424..12075679863c4 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -354,7 +354,7 @@ static int rmi_sro_donate_contig(struct 
rmi_sro_state *sro,
                           0, out_regs);
         donated_size = out_regs->a1 << PAGE_SHIFT;

-       if (WARN_ON(donated_size > size))
+       if (WARN_ON(out_regs->a1 > (size >> PAGE_SHIFT)))
                 donated_size = size;

         /* All granules consumed by the RMM */


Suzuki


