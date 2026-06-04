Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED71CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbcLbAFN8HwhN5sC7vX9Y3YgYrgHuGPi6izauGKqrps=; b=JYf3JsvwHpNYmbl/uTJGM2BBNu
	o/iuf6yuNPVcX5TwBXyKdPLR9ylAO3qqsfaVqfiB4+V6/RW+0rZEINHRQl3c+g1HGUYBR5Nl0WjVY
	xwRr8i6OTo6OmoBGmqAoDW5+tov8L87tjgVlzdHGivXm71dog3ljuBob+jOHAML8SDiLr4EK6DPAt
	+zwj3IfO6JdSLzKakTvt4gD6COXH/FYApj/jk/yobKfj2aTJQ1CDLrMt147XKHjCYe4cleiDmf0ke
	0meMSbeRvt3uLIpuvxb48+I6dgxoAx1E8tXXCJOInyvX7yDr0JnMSMtjalPKZa75c4gTZjYiM3tcd
	QMBsKUzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Ig-0000000GviM-3SSd;
	Thu, 04 Jun 2026 14:44:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Ie-0000000GviC-3AAR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 14:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RbcLbAFN8HwhN5sC7vX9Y3YgYrgHuGPi6izauGKqrps=; b=MVMqppLIdUmd/H5l5Ktr+WGroN
	w3Zg+fIKLE8pEoQXh0urTdY08ffihMDmtSXn4mwFp/SLirOyKOCG0aJcik0iETTw3BVIWXdBeDZjL
	+ZxvVoRkMFXSalMu8yuFd9TZbxFbyC7Yr3mC7YabYU9IuxqVzwD1ZccVr50p13paLQHf378tuTWX3
	uuhsg6FCaVoaBfg5/O/JrqFNG+vLbdqZXonjsZFHRdgR0zec1SUvjOmpW3yVeXJJ5JA5oKGoT7cSo
	x7MuKWFE6c5d/OUtPsM9GZroRfvGP3NRHDnGT2p4BJtCQAb9K8B7rssFJI42cKbkWLKaudu0oNGx8
	XjaC2rpQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9Ib-0000000ESM7-1YWd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:43:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1F783D4D;
	Thu,  4 Jun 2026 07:43:49 -0700 (PDT)
Received: from [10.1.34.54] (e122027.cambridge.arm.com [10.1.34.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2373F7D8;
	Thu,  4 Jun 2026 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780584234; bh=b/UDPb8ZwzcbmTijGa9ghHw1SVkFtR2lx41scNsuBjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gn6z/d22MGsutY4vrKsRLbGb1JtpNa5H68u4zp2JsNXjaVzof1wCdH042dXjksL32
	 3bQQkNGnNvI/E3bx/qFU+wirdXrg2s3UT8bnf/anDlnzOBsOrKTbQ0RD5hblrWE1yd
	 Xm4/PDVe6lFcK9jaluBGd8A0FpR/YMBGavFmftuY=
Message-ID: <fad5dc03-f7ce-4b15-bb73-e2dbd43810a6@arm.com>
Date: Thu, 4 Jun 2026 15:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/44] arm64: RMI: Provide functions to
 delegate/undelegate ranges of memory
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-10-steven.price@arm.com>
 <867bowx3qx.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <867bowx3qx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_154357_938601_A698BF07 
X-CRM114-Status: GOOD (  23.63  )
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

On 21/05/2026 14:59, Marc Zyngier wrote:
> On Wed, 13 May 2026 14:17:17 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> The RMM requires memory is 'delegated' to it so that it can be used
>> either for a realm guest or for various tracking purposes within the RMM
>> (e.g. for metadata or page tables). Memory that has been delegated
>> cannot be accessed by the host (it will result in a Granule Protection
>> Fault).
>>
>> Undelegation may fail if the memory is still in use by the RMM. This
>> shouldn't happen (Linux should ensure it has destroyed the RMM objects
>> before attempting to undelegate). In the event that it does happen this
>> points to a programming bug and the only reasonable approach is for the
>> physical pages to be leaked - it is up to the caller of
>> rmi_undelegate_range() to handle this.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> v14:
>>  * Split into separate patch and moved out of KVM
>> ---
>>  arch/arm64/include/asm/rmi_cmds.h | 13 +++++++++++
>>  arch/arm64/kernel/rmi.c           | 36 +++++++++++++++++++++++++++++++
>>  2 files changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
>> index 9078a2920a7c..eb213c8e6f26 100644
>> --- a/arch/arm64/include/asm/rmi_cmds.h
>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>> @@ -33,6 +33,19 @@ struct rmi_sro_state {
>>  } while (RMI_RETURN_STATUS(res.a0) == RMI_BUSY ||			\
>>  	 RMI_RETURN_STATUS(res.a0) == RMI_BLOCKED)
>>  
>> +int rmi_delegate_range(phys_addr_t phys, unsigned long size);
>> +int rmi_undelegate_range(phys_addr_t phys, unsigned long size);
>> +
>> +static inline int rmi_delegate_page(phys_addr_t phys)
>> +{
>> +	return rmi_delegate_range(phys, PAGE_SIZE);
>> +}
>> +
>> +static inline int rmi_undelegate_page(phys_addr_t phys)
>> +{
>> +	return rmi_undelegate_range(phys, PAGE_SIZE);
>> +}
>> +
>>  bool rmi_is_available(void);
>>  
>>  unsigned long rmi_sro_execute(struct rmi_sro_state *sro, gfp_t gfp);
>> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
>> index 52a415e99500..08cef54acadb 100644
>> --- a/arch/arm64/kernel/rmi.c
>> +++ b/arch/arm64/kernel/rmi.c
>> @@ -12,6 +12,42 @@ static bool arm64_rmi_is_available;
>>  unsigned long rmm_feat_reg0;
>>  unsigned long rmm_feat_reg1;
>>  
>> +int rmi_delegate_range(phys_addr_t phys, unsigned long size)
>> +{
>> +	unsigned long ret = 0;
>> +	unsigned long top = phys + size;
>> +	unsigned long out_top;
>> +
>> +	while (phys < top) {
>> +		ret = rmi_granule_range_delegate(phys, top, &out_top);
>> +		if (ret == RMI_SUCCESS)
>> +			phys = out_top;
>> +		else if (ret != RMI_BUSY && ret != RMI_BLOCKED)
>> +			return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +int rmi_undelegate_range(phys_addr_t phys, unsigned long size)
>> +{
>> +	unsigned long ret = 0;
>> +	unsigned long top = phys + size;
>> +	unsigned long out_top;
>> +
>> +	WARN_ON(size == 0);
> 
> I find it odd to warn on size = 0. After all, free(NULL) is not an
> error. But even then, you continue feeding this to the RMM.

Ok, I'll admit that this is left over debugging - although this is a
condition that shouldn't happen.

Note that the while() condition prevents this from actually getting to
the RMM.

I'll drop the WARN_ON() since it's confusing.

Thanks,
Steve

> You also don't seem to be bothered with that on the delegation side...
> 
>> +
>> +	while (phys < top) {
>> +		ret = rmi_granule_range_undelegate(phys, top, &out_top);
>> +		if (ret == RMI_SUCCESS)
>> +			phys = out_top;
> 
> and size==0 doesn't violate any of the failure conditions listed in
> B4.5.18.2 (beta2). Will you end-up looping around forever?
> 
> Same questions for the delegation, obviously.
> 
> 	M.
> 


