Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC0CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNW+YqrAqiD02dpXizyoFZPqN7BexW83gWD+34LdzW4=; b=NFRkLrt+4/6oGvX911k1G43qgX
	3Z0cBOtORmvOS5PA/hDQKuQeVxrl/5yYwF4uknjvmJ9q3kMT5RT5mHdrm2iipaWm5Ip7bJi/ue4qX
	Y1dLUWvxcvymayH58NfXBlhmYCt40nynw71XbVOSs704gIiB6JkrxhuHO8TLjwwjShEDNUmooxqlO
	/feILBXtsYSiMp1VsQN37z9ZkwHZBfl7KQanyEO4NyyvXfxcXmCJNJU1Q8WBV9FGFEA4SbmC4cDWb
	p5xfnOT0qBBXQrJdt3R0V9cJNcyxe0fbLzjB79JqOF7391QYJV1mWVUThF3BjaTKD/MhaXiuI6TPx
	BUjbN1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfCG-0000000BvGu-0vDc;
	Fri, 02 Oct 2026 15:29:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfCD-0000000BvFc-25DQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:29:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4DF0143D;
	Fri,  2 Oct 2026 08:29:08 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 279BE3F85F;
	Fri,  2 Oct 2026 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954952; bh=P4f1hv785d621ll4HEeJjnSeVQYSEnQeNsJSJrh9rSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p8E8vMpMtKBWVnygtBY4CCJt+MHMHuQj+M7U9zx+9Pgy3DFcV8HBcxW9kxS/N/00J
	 XhEBuSPy1e7h4vteMl/XfZe//p0e5hbbJ3qzJoOHabnne1Sh49Qvv+nypCIzoo1Ach
	 9Du30zeEXLKrw1yW4XTxxKDrFWrNKDsec4rnAzbg=
Message-ID: <38a5b5d5-d39a-4fa2-8de5-ccc1d92aaff1@arm.com>
Date: Fri, 2 Oct 2026 16:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 07/10] kernel: hibernate: Add an arch hook for
 preventing hiberation
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-8-suzuki.poulose@arm.com> <ar-PiBQGye4_hQa6@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ar-PiBQGye4_hQa6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082913_632851_209314DB 
X-CRM114-Status: GOOD (  19.11  )
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

On 02/10/2026 12:03, Catalin Marinas wrote:
> On Fri, Oct 02, 2026 at 07:15:03AM +0100, Suzuki K Poulose wrote:
>> Add a hook to allow arch code disable hibernation. On arm64, with an RMM active,
>> there could be pages that are delegated to the "Realm" security state. Any
>> access to them are fatal (e.g., hibernate save image or restoring an image to
>> a delegated page). pKVM host also has its restrictions on enabling hibernation.
>>
>> Add a weak arch hook to let the architectures have a say.
>>
>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>> Cc: Len Brown <lenb@kernel.org>
>> Cc: Pavel Machek <pavel@kernel.org>
>> Cc: linux-pm@vger.kernel.org
>> Cc: Sudeep Holla <sudeep.holla@kernel.org>
>> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Nit: the subject prefix for kernel/power/ usually is
> 
> 	PM: hibernate: ....
> 
> I can fix it locally, no need to respin (and probably the wrap the long
> lines in the commit log, we tend to keep them shorter).
> 

Ack, I will take care of that in the future.


>> ---
>>   include/linux/suspend.h  | 1 +
>>   kernel/power/hibernate.c | 8 +++++++-
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
>> index b02876f1ae38a..a3815027773c5 100644
>> --- a/include/linux/suspend.h
>> +++ b/include/linux/suspend.h
>> @@ -401,6 +401,7 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data);
>>   int hibernate_resume_nonboot_cpu_disable(void);
>>   int arch_hibernation_header_save(void *addr, unsigned int max_size);
>>   int arch_hibernation_header_restore(void *addr);
>> +bool arch_hibernation_available(void);
>>   
>>   #else /* CONFIG_HIBERNATION */
>>   static inline void register_nosave_region(unsigned long b, unsigned long e) {}
>> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
>> index d2479c69d71a4..9d9d53828542f 100644
>> --- a/kernel/power/hibernate.c
>> +++ b/kernel/power/hibernate.c
>> @@ -106,11 +106,17 @@ bool hibernation_in_progress(void)
>>   	return !atomic_read(&hibernate_atomic);
>>   }
>>   
>> +__weak bool arch_hibernation_available(void)
>> +{
>> +	return true;
>> +}
>> +
>>   bool hibernation_available(void)
>>   {
>>   	return nohibernate == 0 &&
>>   		!security_locked_down(LOCKDOWN_HIBERNATION) &&
>> -		!secretmem_active() && !cxl_mem_active();
>> +		!secretmem_active() && !cxl_mem_active() &&
>> +		arch_hibernation_available();
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Raphael, any objection to this patch going in through the arm64 tree? It
> matches the style of other __weak functions in this file.

Thanks Catalin

Suzuki

> 
> Thanks.
> 


