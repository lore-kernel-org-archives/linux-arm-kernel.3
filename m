Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842B8C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z32VOnX5iG4BO8nf+INJnfiv1CbwabFqoPmTr0NirPY=; b=eAtSznXN9boxpi6MHFU1+RQwni
	v1LrrLM2fgw38VMhbLKI1kQ7wL6YCJ32E8QK0UPclSNg8bvVF2fK62n5zcFpv7L2ZEojEzQkiyXII
	K0zRW9oHdKL0fCghgMdQKbqpmKGP+FEo3uEfCMahCn9OGY76lzp+TE5LxFvMjM8mPBmg+0GJtdEO8
	/Bg4PDlOjYv56ErVUQy6CIkidfbEJD3mkuBa8pwZ9Se3BzbqmT/1VUtx8WnuSoZ11fsOVb8okNTKT
	nsb22rek27Mdfae6GxERclo9g/G6G/epnSVFFscQj7sS5Hyu/jkxxz084h+eLvDYKSCsOZABqfMsy
	wFeYSdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rjY-0000000CGnA-1y2q;
	Thu, 24 Sep 2026 22:16:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rjV-0000000CGmj-0M9f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:16:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAC5F1E5E;
	Thu, 24 Sep 2026 15:15:55 -0700 (PDT)
Received: from [10.57.10.88] (unknown [10.57.10.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B9B93F86F;
	Thu, 24 Sep 2026 15:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790288159; bh=w55oFxyasq/JaOo+eWuI/wiOSjEK/BHz20zexwH7QsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/IB9ZOemKQDQEvic71j4jcxtkn8nKprm3yJOeOepBTucL2LNaNr4+jija45pf2Gt
	 yJvU0/cC4QCnbExWxwxkmvMeuvnvToVzhRmaJ4YlAUqJMpt6RS6gljojzVhiCRvsdB
	 W5CPqP48trn08kPjTZSYhtiSlr2uToEKU1gwDEX0=
Message-ID: <aa877f31-0ae7-4042-bab2-6a818003d26e@arm.com>
Date: Thu, 24 Sep 2026 23:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-2-suzuki.poulose@arm.com>
 <20260924095712.00004057@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260924095712.00004057@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_151601_258843_3D3BE091 
X-CRM114-Status: GOOD (  12.24  )
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

On 24/09/2026 17:57, Jonathan Cameron wrote:
> On Thu, 24 Sep 2026 14:51:55 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
>> From: Steven Price <steven.price@arm.com>
>>
>> The RMM (Realm Management Monitor) provides functionality that can be
>> accessed by SMC calls from the host.
>>
>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
>>
>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Suzuki,
> 
> One small thing I didn't really care about but where I thought you
> said you were going to tweak things.
> 
> Either way
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Thanks !

> 
>> +struct rec_exit {
>> +	union { /* 0x000 */
>> +		u8 exit_reason;
>> +		u8 padding0[0x100];
>> +	};
>> +	union { /* 0x100 */
>> +		struct {
>> +			u64 esr;
>> +			u64 far;
>> +			u64 hpfar;
>> +			u64 rtt_tree;
>> +		};
>> +		u8 padding1[0x100];
>> +	};
>> +	union { /* 0x200 */
>> +		u64 gprs[REC_RUN_GPRS];
>> +		u8 padding2[0x100];
>> +	};
>> +	union { /* 0x300 */
>> +		u8 padding3[0x100];
> 
> I thought plan was to fold into the padding above?
> 
> https://lore.kernel.org/all/d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com/

Yep, I missed it :facepalm:,  Apologies. I will fix it straight awy.

Cheers
Suzuki

> 
>> +	};
>> +	union { /* 0x400 */
>> +		struct {
>> +			u64 cntp_ctl;
>> +			u64 cntp_cval;
>> +			u64 cntv_ctl;
>> +			u64 cntv_cval;
>> +		};
>> +		u8 padding4[0x100];
>> +	};
> 
> 


