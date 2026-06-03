Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04877CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGbgVRlfEor30WlWCGLzSIVGUFV+hNP+erkcA7/AzcM=; b=Mtzrz+GGkLE2mYmhpE8B/di/Rk
	rSCHtQHZPkuP+BMZpBs3ajMe3uY2A//rQAmqMirn0QZvBz6SZc5M7nds2AeRcpod22D5a8w/U8ouy
	m17FFTDTXMpmxLoWRpytglLaNpBX4zH18XtVxJkEC86tw0vL7LQ2TfwTue9o6nvUTSP7SBqFI7wtz
	/0+Yn1KlgM0uOvEnh84PBt6lhj/mw6HfAWdXkRjvIYi+xg59bx+TDilLSZoVci5AEtLnZPfSqTVCc
	UMPwH9Z6qpO55l4dCtsDTFtzQeXLVIambvYVohA3llBwHYV13toSIzW0LXcZ6ebbxrXFMQUIU1t+9
	oEzpKFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnpe-0000000FSZg-44La;
	Wed, 03 Jun 2026 15:48:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnpc-0000000FSZG-1Sas
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:48:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D89B13329;
	Wed,  3 Jun 2026 08:48:29 -0700 (PDT)
Received: from [10.57.26.22] (unknown [10.57.26.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3BF53F86F;
	Wed,  3 Jun 2026 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780501714; bh=ouNCmZE7oxdLfG4i6FQgbNqLCetP2ysLUrVM+nxytVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BZPVSxWChcvpFStmpjWtyNPJrIiDIdtMGaliCHESVQgxKks3WhIwVurwh2M0vbBHe
	 c+oLB3bKYJLBZa25Gwo8Ti/3Xhg/aoZyl+vGG9BeO5d4ikeiVDAOzInvUPrXrCiAKz
	 ptKYlqrdFMdTA99NiEIX2Etg1etKPu/Qzn6HR3qc=
Message-ID: <9d29cec1-fc2c-4a99-9ec3-79f7574743e4@arm.com>
Date: Wed, 3 Jun 2026 16:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 07/44] arm64: RMI: Configure the RMM with the host's
 page size
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
 <20260513131757.116630-8-steven.price@arm.com> <86a4tsx536.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86a4tsx536.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_084836_490726_16576299 
X-CRM114-Status: GOOD (  23.23  )
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

On 21/05/2026 14:30, Marc Zyngier wrote:
> On Wed, 13 May 2026 14:17:15 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>> feature registers and configure the RMM so that it matches the host's
>> page size. This means that operations can be done with a granulatity
>> equal to PAGE_SIZE.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v13:
>>  * Moved out of KVM.
>> ---
>>  arch/arm64/kernel/rmi.c | 42 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
>> index 99c1ccc35c11..a14ead5dedda 100644
>> --- a/arch/arm64/kernel/rmi.c
>> +++ b/arch/arm64/kernel/rmi.c
>> @@ -49,6 +49,45 @@ static int rmi_check_version(void)
>>  	return 0;
>>  }
>>  
>> +static int rmi_configure(void)
>> +{
>> +	struct rmm_config *config __free(free_page) = NULL;
>> +	unsigned long ret;
>> +
>> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>> +	if (!config)
>> +		return -ENOMEM;
> 
> This is the sort of buggy construct that is highlighted in
> include/linux/cleanup.h: initialising the object for cleanup with
> NULL, and only later assigning the expected value.
> 
> It may not matter here, but it will catch you (or more probably me) in
> the future.

Good spot. I have to admit I'm still getting the hang of these cleanup
handlers.

>> +
>> +	switch (PAGE_SIZE) {
>> +	case SZ_4K:
>> +		config->rmi_granule_size = RMI_GRANULE_SIZE_4KB;
>> +		break;
>> +	case SZ_16K:
>> +		config->rmi_granule_size = RMI_GRANULE_SIZE_16KB;
>> +		break;
>> +	case SZ_64K:
>> +		config->rmi_granule_size = RMI_GRANULE_SIZE_64KB;
>> +		break;
>> +	default:
>> +		pr_err("Unsupported PAGE_SIZE for RMM\n");
> 
> Do you really anticipate PAGE_SIZE being any other value? This is 100%
> dead code. If you want to be extra cautious, have a BUILD_BUg_ON().

No, but falling through is clearly wrong (and likely to trigger AI
review comments if nothing else) - BUILD_BUG() sounds like a good solution.

>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = rmi_rmm_config_set(virt_to_phys(config));
>> +	if (ret) {
>> +		pr_err("RMM config set failed\n");
>> +		return -EINVAL;
>> +	}
> 
> What is the live cycle of the page when the call succeeds? Is it
> switched back to the NS PAS and allowed to be freed?

Yes, as Suzuki answered - it never leaves the NS PAS. The RMM just reads it.

Thanks,
Steve

>> +
>> +	ret = rmi_rmm_activate();
>> +	if (ret) {
>> +		pr_err("RMM activate failed\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int __init arm64_init_rmi(void)
>>  {
>>  	/* Continue without realm support if we can't agree on a version */
>> @@ -60,6 +99,9 @@ static int __init arm64_init_rmi(void)
>>  	if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
>>  		return 0;
>>  
>> +	if (rmi_configure())
>> +		return 0;
>> +
>>  	return 0;
>>  }
>>  subsys_initcall(arm64_init_rmi);
> 
> Thanks,
> 
> 	M.
> 


