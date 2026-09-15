Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5A7C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9/n5mwO6kR68u3vVbGR7jjrxxIi1w6BUultNSxEIyM=; b=r/Hr6jp/Qfwz/2bJ7lb+Bv9xv9
	U1NAsNSMLRwkLG7zeC82Yo3otYUOfFPBxmC9Y75yeu+kjOvtFwMLCX+wqwhy70l3o0QuqBCPu1PBg
	pX2uzziywbe/OQAZoNT5Kx/aJR6j63/Nw9xYwHvfsf4/jMWVN3u3mWfp+KalY94QgaYplqDdhn6Fi
	ICy0tdX/81nJ19P6A+BCKXKmo74kkNrv7OekrbWZhMZUhraZSeUnDro6ZhN1f07CwUcm6VVUEYXNG
	WgiEiNmrdEK74rk0z3KnwT/i+J55Cgur6Qi3bFXR6SJHFZqC88o12POJbnh52ydsQbzAeKrG6c51i
	v2LKGsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZG1-00000007taN-2b3C;
	Tue, 15 Sep 2026 19:55:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZFz-00000007ta0-0r7Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:55:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34FCE152B;
	Tue, 15 Sep 2026 12:55:50 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 697A53F7B4;
	Tue, 15 Sep 2026 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789502153; bh=os1BDjQW0NBjktNzzqxnXfDDyaHtfLgy26yzzeiQoDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HSa38V7N4c8nhvp7rfjuBg2mwrWCDfXnjscowE1tm7LV7+wLp8nz5bQboqStLyKAg
	 6x3nzIcx+n5vvmtfbkNKAfYYmvtpilQoTdLxWtXv+eM/mL7XURFFSgICEmtQ6KOnro
	 G5KtsIMp2ne2O9lN2jsJ9G5QJyqqYKUJBajyGw7Q=
Message-ID: <6f7eef15-da58-4f7f-94ba-778772e91270@arm.com>
Date: Tue, 15 Sep 2026 20:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 7/7] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
Content-Language: en-GB
To: Alper Gun <alpergun@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-8-suzuki.poulose@arm.com>
 <CABpDEukTAc1m=g+rZRPPqaTwrvhUJPsFRWpFd0PxZsyWw5mR=Q@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CABpDEukTAc1m=g+rZRPPqaTwrvhUJPsFRWpFd0PxZsyWw5mR=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_125555_289358_6F418798 
X-CRM114-Status: GOOD (  14.00  )
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

On 15/09/2026 20:35, Alper Gun wrote:
> On Sat, Sep 12, 2026 at 1:37 AM Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> [...]
>> +/**
>> + * rmi_rtt_destroy() - Destroy an RTT
>> + * @rd: PA of the RD
>> + * @ipa: Base of the IPA range described by the RTT
>> + * @level: RTT level
>> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
>> + * @out_top: Pointer to write the top IPA of non-live RTT entries, from entry
>> + * at which the RTT walk terminated.
>> + *
>> + * Destroys an RTT. The RTT must be non-live, i.e. none of the entries in the
>> + * table are in ASSIGNED or TABLE state.
>> + *
>> + * Return: 0 on success, positive RMI result code or negative Linux error code.
>> + */
>> +static inline long rmi_rtt_destroy(unsigned long rd,
>> +                                  unsigned long ipa,
>> +                                  long level,
>> +                                  unsigned long *out_rtt,
>> +                                  unsigned long *out_top)
>> +{
>> +       struct arm_smccc_1_2_regs regs = {
>> +               SMC_RMI_RTT_DESTROY, rd, ipa, level
>> +       };
>> +       long ret = rmi_sro_execute(&regs);
>> +
>> +       if (ret != RMI_SUCCESS)
>> +               return ret;
>> +
>> +       if (out_rtt)
>> +               *out_rtt = regs.a1;
>> +       if (out_top)
>> +               *out_top = regs.a2;
>> +
>> +       return RMI_SUCCESS;
>> +}
> 
> Doesn't out_top (regs.a2) need to be populated on RMI_ERROR_RTT as well?
> realm_tear_down_rtt_level() checks next_addr > addr under case
> RMI_ERROR_RTT: to determine whether the RTT is missing or has child tables
> that need recursive teardown.

You're right. The out_top is valid even when we get RMI_ERROR_RTT. I
will fix it.

Cheers
Suzuki

> 
> Thanks,
> Alper


