Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E7FCDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0xCP4KWu4tvRGx1Bk35Nb1XpPf59ZmNkKNUUYsYMDM=; b=gE6f/RGk4P+FfaztjB8jfRe9n0
	cRboN3O1vs7IrIcIMLHafYaYj2PruqJezbY0uK/Um49/RTlO9Z3dGDv8g3kAAe980PJIl3JpiprJ8
	6HcI1o54gHpqXhEJAjilsWuFhBh7fbXo3pWyJlAXWQ3SMIoXFoM2Mo1y6YYafpg5UOl7UDLriYNKf
	Pcs9kb57LTFhdeCvA2mJDDLAkLQmMOU5JiGYDg3laX5ujDOCzFMQO5OwVn08PDq/UUi0r5ZjByDIY
	BQrFvO41bpPYvo88Aj9AAKkBh/DNba8RUbM6SeF0v2ihe2VH/Jiu6/fvlMFOXbNU07WNtuuXOdtdv
	/W0WigRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvn2-0000000AEXx-3RVi;
	Fri, 26 Jun 2026 01:55:32 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvn0-0000000AEX7-00L3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 01:55:31 +0000
X-UUID: 167634d8710211f1aa26b74ffac11d73-20260626
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9c9653c2-96d6-4a31-8a6e-5fc2d3a26971,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:e7bac3a,CLOUDID:d89af0c5808b4f65f03b3c06f107fd71,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:4
	|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 167634d8710211f1aa26b74ffac11d73-20260626
X-User: pengyu@kylinos.cn
Received: from [192.168.31.66] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengyu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 156880850; Fri, 26 Jun 2026 09:55:20 +0800
Message-ID: <08fd96fa-ee3a-4904-bd11-bb08bd90436f@kylinos.cn>
Date: Fri, 26 Jun 2026 09:55:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] arm64: early_ioremap fails to map ACPI MADT on 64K pages
To: Will Deacon <will@kernel.org>
Cc: lpieralisi@kernel.org, akpm@linux-foundation.org,
 catalin.marinas@arm.com, guohanjun@huawei.com, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, rafael@kernel.org,
 sudeep.holla@kernel.org
References: <ajkFE6TmwW6B/huP@lpieralisi>
 <20260623024712.3480399-1-pengyu@kylinos.cn>
 <ajp25MIQJWWE1ziY@willie-the-truck>
From: Yu Peng <pengyu@kylinos.cn>
In-Reply-To: <ajp25MIQJWWE1ziY@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_185530_358974_FB2091FE 
X-CRM114-Status: GOOD (  14.46  )
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

On 6/23/2026 8:07 PM, Will Deacon wrote:
> On Tue, Jun 23, 2026 at 10:47:12AM +0800, Yu Peng wrote:
>> Hi Lorenzo, Hanjun, Will,
>>
>> Thanks for confirming.
>>
>> I will send a proper patch for this. The change I plan to post is along
>> these lines:
>>
>> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
>> index ... .. ...
>> --- a/arch/arm64/include/asm/fixmap.h
>> +++ b/arch/arm64/include/asm/fixmap.h
>> @@ -79,7 +79,11 @@ enum fixed_addresses {
>>   	 * Temporary boot-time mappings, used by early_ioremap(),
>>   	 * before ioremap() is functional.
>>   	 */
>> +#ifdef CONFIG_ARM64_64K_PAGES
>> +#define NR_FIX_BTMAPS		(SZ_512K / PAGE_SIZE)
>> +#else
>>   #define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
>> +#endif
>>   #define FIX_BTMAPS_SLOTS	7
>>   #define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
> 
> I still don't understand why this issue is specific to 64k pages, though.
> 
> In the example you gave, the thing wasn't even 4k aligned.
> 
> Will

You're right, this is not specific to 64K pages.

I looked at 64K first because the current slot is only 4 pages there,
compared with 64 pages on 4K. Any initial offset therefore leaves much
less room in the page-aligned span.

A blanket SZ_512K slot does not look right either. On 4K pages it would
make the boot-ioremap area 512K * 7 = 3.5M, while arm64 requires it to
stay within one PMD:

   /*
    * The boot-ioremap range spans multiple pmds, for which
    * we are not prepared:
    */
   BUILD_BUG_ON((__fix_to_virt(FIX_BTMAP_BEGIN) >> PMD_SHIFT)
	       != (__fix_to_virt(FIX_BTMAP_END) >> PMD_SHIFT));

So I think the better fix is to preserve the 256K payload budget and add
one page for the possible initial offset:

#define NR_FIX_BTMAPS		((SZ_256K / PAGE_SIZE) + 1)

That should allow any table up to 256K to be mapped regardless of its
initial offset, without exceeding the single-PMD constraint.

Does this direction sound reasonable?

Thanks,
Yu Peng

