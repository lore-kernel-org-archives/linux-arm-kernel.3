Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4138CCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 04:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Qns5dn2dvno3ve6iqCYk8wqgCZmSxxATXCbyS5iFWU=; b=yXoiXlfSKoSH96mkOjikK4hGA5
	IyxKsGlWtwyD5ARKWX+eSE3oz9hiMCrNnSfwFmL3Td2qGhlD2QWMvM0BYj+QK8jb1gOLDz8DXF1QF
	HZSn6tFOppCg/bD+/1NoqOFBz8L2FKmQwqXcdCtcSQyNKhx+Hh/seuPL7yUIZc5RqMnySS3eviinA
	ytVUGE20V6q2Mxkm74nKmCzVOhQVWwiU5X/NIqVxWQI9ZQgA1nb6JEZfFtYnqrEeUgt6M6IyGnHlt
	bRMAmXkVBlxU7/z7820QSFjBl3NyLe2aS0nOAe5tSK8EdasWvK6wGYBtNBNS7E6oaZpJXMsgWBqpw
	u71QtQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzSJw-00000001mXA-0buX;
	Fri, 19 Sep 2025 04:02:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzSJs-00000001mWp-38tr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 04:02:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F98C1758;
	Thu, 18 Sep 2025 21:01:51 -0700 (PDT)
Received: from [10.164.18.52] (MacBook-Pro.blr.arm.com [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 700843F673;
	Thu, 18 Sep 2025 21:01:57 -0700 (PDT)
Message-ID: <70958792-2d11-4fab-be78-e35434f2e524@arm.com>
Date: Fri, 19 Sep 2025 09:31:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: kprobes: call set_memory_rox() for kprobe page
To: Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250918162349.4031286-1-yang@os.amperecomputing.com>
 <aMxAwDr11M2VG5XV@willie-the-truck>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aMxAwDr11M2VG5XV@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_210200_835234_DAF48068 
X-CRM114-Status: GOOD (  15.97  )
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


On 18/09/25 10:56 pm, Will Deacon wrote:
> On Thu, Sep 18, 2025 at 09:23:49AM -0700, Yang Shi wrote:
>> The kprobe page is allocated by execmem allocator with ROX permission.
>> It needs to call set_memory_rox() to set proper permission for the
>> direct map too. It was missed.
>>
>> Fixes: 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in alloc_insn_page")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> ---
>> v2: Separated the patch from BBML2 series since it is an orthogonal bug
>>      fix per Ryan.
>>      Fixed the variable name nit per Catalin.
>>      Collected R-bs from Catalin.
>>
>>   arch/arm64/kernel/probes/kprobes.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
>> index 0c5d408afd95..8ab6104a4883 100644
>> --- a/arch/arm64/kernel/probes/kprobes.c
>> +++ b/arch/arm64/kernel/probes/kprobes.c
>> @@ -10,6 +10,7 @@
>>   
>>   #define pr_fmt(fmt) "kprobes: " fmt
>>   
>> +#include <linux/execmem.h>
>>   #include <linux/extable.h>
>>   #include <linux/kasan.h>
>>   #include <linux/kernel.h>
>> @@ -41,6 +42,17 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>>   static void __kprobes
>>   post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>>   
>> +void *alloc_insn_page(void)
>> +{
>> +	void *addr;
>> +
>> +	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>> +	if (!addr)
>> +		return NULL;
>> +	set_memory_rox((unsigned long)addr, 1);
>> +	return addr;
>> +}
> Why isn't execmem taking care of this? It looks to me like the
> execmem_cache_alloc() path calls set_memory_rox() but the
> execmem_vmalloc() path doesn't?

Ryan has raised this issue here -
https://lore.kernel.org/all/d4019be7-e24c-4715-a42a-4f1fc39a9bd4@arm.com/

>
> It feels a bit bizarre to me that we have to provide our own wrapper
> (which is identical to what s390 does). Also, how does alloc_insn_page()
> handle the direct map alias on x86?
>
> Will
>

