Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148C8CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 05:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyNM8slwloHcgyPfCmyTDTiWPCaULRQDVrKg7eQmpRw=; b=ilczenB7u6DfTBHaAW3b5C504I
	L7/FBD4UIaNr82Kh288gRwZuV4+Jt9txTjLZ7s7JRKF8VN2tkuePkSqodVyNQuldieywIA+dev0f6
	/0VVnaI9OXIacXVqSDrTvY5UxIkBNyPHLjAP51WUHDDKi2/OsZPSN7tZaTTkVgIZk15eoFHhB3s8K
	cZVW1xCO11w4E/OtEePop8Ts60VDPCjdGU1W2tap/rEM7JZYD6ERmh4/icBdrLc6LLxhk2hSpYOdM
	6ksXG88EN1GZ/OP1tPNr+BAIqubrKjZ+cB0uDTsZgnxmzkFgwmJB6ht71Yd3/kZUZL1qyW7iPZ74G
	1OA8dLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKV9Z-00000000ovx-1dBU;
	Wed, 06 May 2026 05:50:39 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKV9V-00000000oun-0gVz;
	Wed, 06 May 2026 05:50:34 +0000
Received: from [10.95.65.64] (unknown [167.220.238.64])
	by linux.microsoft.com (Postfix) with ESMTPSA id 13CCF20B7165;
	Tue,  5 May 2026 22:50:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 13CCF20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778046628;
	bh=QyNM8slwloHcgyPfCmyTDTiWPCaULRQDVrKg7eQmpRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pTIJ7GQk9D6hXldWJKVX9dd14kousDi69JXWi3e3f50TycMcZbL4tmIIy42qBnJzY
	 5jAFHEKcwRIHTJ00l4z2+4+dyEr8WIYxFTL6Mka7lXucOa2EB+G3QILghYR5i5XQvo
	 EvpZDSKIPbRY9FmL0WEPyHmdgfUSeILDT7aOuQTE=
Message-ID: <024aed8c-cd97-45f0-a653-489fc334a2b9@linux.microsoft.com>
Date: Wed, 6 May 2026 11:20:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] Drivers: hv: mshv_vtl: Move
 hv_vtl_configure_reg_page() to x86
To: Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "vdso@mailbox.org" <vdso@mailbox.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>, "K . Y . Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Long Li <longli@microsoft.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-10-namjain@linux.microsoft.com>
 <SN6PR02MB4157467FDBC0203C67A67042D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
 <567cf73b-6a48-4fc3-b312-9be6d71e2f22@linux.microsoft.com>
 <SN6PR02MB4157AD364DE0755DE070D286D4312@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157AD364DE0755DE070D286D4312@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_225033_266954_BB567474 
X-CRM114-Status: GOOD (  32.53  )
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



On 5/4/2026 9:36 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Wednesday, April 29, 2026 2:58 AM
>>
>> On 4/27/2026 11:10 AM, Michael Kelley wrote:
>>> From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, April 23, 2026 5:42 AM
>>>>
>>>> Move hv_vtl_configure_reg_page() from drivers/hv/mshv_vtl_main.c to
>>>> arch/x86/hyperv/hv_vtl.c. The register page overlay is an x86-specific
>>>> feature that uses HV_X64_REGISTER_REG_PAGE, so its configuration belongs
>>>> in architecture-specific code.
>>>>
>>>> Move struct mshv_vtl_per_cpu and union hv_synic_overlay_page_msr to
>>>> include/asm-generic/mshyperv.h so they are visible to both arch and
>>>> driver code.
>>>>
>>>> Change the return type from void to bool so the caller can determine
>>>> whether the register page was successfully configured and set
>>>> mshv_has_reg_page accordingly.
>>>>
>>>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>>>> ---
>>>>    arch/x86/hyperv/hv_vtl.c       | 32 ++++++++++++++++++++++
>>>>    drivers/hv/mshv_vtl_main.c     | 49 +++-------------------------------
>>>>    include/asm-generic/mshyperv.h | 17 ++++++++++++
>>>>    3 files changed, 53 insertions(+), 45 deletions(-)
>>>>
>>
>> <snip>
>>
>>>>    #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
>>>> +/* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
>>>
>>> This comment pre-dates your patch, but I don't understand the point
>>> it is trying to make. The comment is factually true, but I don't know
>>> why calling that out is relevant. The REG_PAGE MSR seems to be
>>> conceptually separate and distinct from the SIMP MSR, so the fact
>>> that the layouts are the same is just a coincidence. Or is there some
>>> relationship between the two MSRs that I'm not aware of, and the
>>> comment is trying (and failing?) to point out?
>>
>> This was added as per suggestion from Nuno in my initial series for
>> MSHV_VTL. If the reference in "identical to" is misleading, I should
>> remove it.
>>
>> https://lore.kernel.org/all/68143eb0-e6a7-4579-bedb-4c2ec5aaef6b@linux.microsoft.com/
>>
>> Quoting:
>> """
>> it is a generic structure that
>> appears to be used for several overlay page MSRs (SIMP, SIEF, etc).
>>
>> But, the type doesn't appear in the hv*dk headers explicitly; it's just
>> used internally by the hypervisor.
>>
>> I think it should be renamed with a hv_ prefix to indicate it's part of
>> the hypervisor ABI, and a brief comment with the provenance:
>>
>> /* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
>> union hv_synic_overlay_page_msr {
>> 	/* <snip> */
>> };
> 
> OK, so this union is not associated *only* with the REG_PAGE MSR
> (though that MSR is the only current user). Instead, it is intended to
> be a more generic description of MSRs that set up overlay pages. I
> don't think I had previously noticed Nuno's comment on the topic.
> 
> Looking through hvgdk_mini.h and hvhdk.h, I see 6 definitions that
> are exactly the same:
> 
> * union hv_reference_tsc_msr
> * union hv_x64_msr_hypercall_contents
> * union hv_vp_assist_msr_contents
> * union hv_synic_simp
> * union hv_synic_siefp
> * union hv_synic_sirbp
> 
> There's an argument to be made for removing these 6 unique definitions
> and using union hv_synic_overlay_page_msr instead (though "synic"
> would need to be removed from the name).  I would not object to such
> an approach. It's a small extra layer of conceptual indirection, but saves
> some lines of code for duplicative definitions. The alternative is to drop
> the idea of a generic overlay page MSR layout, and replace union
> hv_synic_overlay_page_msr with a definition that is specific to the
> REG_PAGE MSR, like the other six above.
> 

Hi Michael,

While having a generic definition looks good to have here, I can see two 
reasons for not going ahead with generic overlay page definition:
1. All of the above definitions are present in Hyper-V headers and 
generalizing them would deviate from the strategy of keeping the kernel 
headers in line with Hyper-V headers.
2. For any of these definitions, if the use-case requires using some of 
these reserved bits, then it would be a problem. I can actually see that 
happening in "hv_x64_msr_hypercall_contents" in the corresponding 
variant in the Hyper-V header.

> I could go either way. If we want to use a generic overlay page definition,
> then that approach should be applied everywhere. With the current
> state of your patch set, we're halfway in between -- the generic definition
> is used one place, but duplicative specific MSR definitions are used other
> places. That's probably the least desirable approach.
> 
> Michael


Now, coming back to the hv_synic_overlay_page_msr definition. While 
Nuno's comment hinted at it being "generic", the same is not documented 
in the name of this structure or its comments. So it should be safe to 
assume that it is specific to synic_overlay_page_msr usage. But since it 
is not part of Hyper-V header as such, we needed that comment:
"/* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */"

Please let me know your thoughts on this.

Regards,
Naman

