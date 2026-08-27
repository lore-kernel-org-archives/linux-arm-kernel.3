Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB59C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/wTq/5h6B601AMx0G4llf/VxEFalYv5uCBT4yZMs9g=; b=pfhs7AhouZ3qRE+uRj5tQsvC7W
	MdI1b4gnOga+0NlXOqtU8BqHVjbF7Wj2ILzpwLil9hVgf2za2Yiq5S2c6eKXGqBJDyWfmqegHn7hl
	Rw0b7e5H8Yfivig6aCXocrwDm3o2b+Ii3Vag0TItGOh1Lyks+eQvSadAQInZO5BdhZgkCpzfKDo90
	FJ3giQXjdp78QS01PhJDEbslXAgc0K2MybvvWNhkP8/oeyAF+BsSsjlxgfJEym5mCK1sVi7rHbMzm
	zkXTWtsNXPdxmukZ3NA6J4DI/H839sDaaPi1j0+l7zA5RLPde6FTPdYoF8Vsb56zBoD6aFYLfwghl
	jwmj2OOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzW2j-00000003hj0-0pad;
	Thu, 27 Aug 2026 09:05:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzW2i-00000003hiu-2Of6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:05:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F01543C43;
	Thu, 27 Aug 2026 09:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9031F00A3D;
	Thu, 27 Aug 2026 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787821503;
	bh=R/wTq/5h6B601AMx0G4llf/VxEFalYv5uCBT4yZMs9g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=EVrEGwODkaBeMvrzrWbxnKuvHTJe2XfMSbwd7+GA7eWJReKwPuPqsHZPw+/M2HMK+
	 O7AnOVqe6fZY4YeRNPOrtVcn6wHWRw+vahFNpyuNY6TR0FesLTs6XvfjK5AhXAJE7A
	 7OIU/maYtgJLhQ9iypsBA9gENQFEAsQcruhvId38PV4X+1nbFRC5CLoU/ybbKLM679
	 6Wmmqipni/jQnjatDW/GwgiyM5Jmwtzsr7SzqL9r6LYY3pWivLPCnIyMfAMuDvSNtW
	 YgYQ3LMFybpS9np1nyr51RPLG9iEmiVXOdtmca4999q/s3bJmvaxsElHmHa5YfhaGU
	 icymwBBtw9+Pw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id DFF761980054;
	Thu, 27 Aug 2026 05:05:00 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 27 Aug 2026 05:05:00 -0400
X-ME-Sender: <xms:uv2PapEcsbDsHBA17pcE_TbDcGzVEuZUTQHUrMHdfI5tQlBFrO70Uw>
    <xme:uv2PapJDTkoopXDikPKXxe7HaHkhusQRTVLHYEb3Zn-XdhbJ6sO9WnodAPY90w2St
    TZ_FDokvrRu8nM0_giF5f1VVN4Ztyugkl2ROwOohf02fvULlyajnUU>
X-ME-Proxy-Cause: dmFkZTGal3LTGiskcZm5hnhJnxJ1Ju61Op2mR279qugGtVZrD2mheMSsjh759w2vrJFl7k
    3ogR/jxYpOyvp8DRx8rLBqX/CgmTwZbEMeyMpzmYsBtDUJMMlRYm/Ra3AZeeKUcvxua4p8
    yP5IldUlpKR/lblJdOanc3D1+1uqgKOHrGePH9hDSIf+EMHizlAOXwdWCL81tOFIYcQTQW
    CrHURoea925DMvaM6vueOkyFKpR6qkCkDH7C83iobGiTtHjQEZtHRbO1hhnYuBSj26NE8Y
    zcL1mdN+K5SLXBk9vQ3wx8zbgEJmEvS1Rrpb3ha29CljSsl9rhpeUw5836NS2KPFCsU/g7
    abfUuRn91fRw8DunTiHOcZU+6r+SRr2eqkLI7MukdkS60TaogXjGq4Uw7Ee6yUUIZH2y0w
    7mIxFWMdMd44pMLWRvHcu56PHv25KD29ZIVwq9ZoQF1aI7BczAJlpjjP0IGbVpUy3J0ogS
    sF1sniQlbDl/AFYfdWg6CDg4BhWt8pIuA3aVlzqua76GKOQQsNDdaadtz5rt23djd2ZFj7
    lARXePJS1dOTYFzNB2Q+DZ2aiWj7j/XRxiXZHU62lXu/3RYMuAs+uV7LI4Rqf1SYu7x4BR
    N/KWlD/GeWDX3kM2tZ3YUyCSAFsiZVKHQFCNwmXQddq04AAcQnq51etoyl/w
X-ME-Proxy: <xmx:vP2Pau5h6HXffnZdDLDnCx8ir5SdbubSJzDjMpKxhU37SeXXjkZ_zQ>
    <xmx:vP2PaknS_7QV4_U1v3F-i2CpXeBUq5cHUzn6noRT_a8d0irnw0UzCA>
    <xmx:vP2PahUCFIuC28uR2sgFRtcWsLqu4sovUQGP91xexrJijC-fmUcmWg>
    <xmx:vP2PalS0hfDXBU2w8JZqRB7d8Au8deXNsoAbzD9_7VqIEqBlQVNE_Q>
    <xmx:vP2PamCN2GXtrMZd_Zx9Y0JlwqWeVRWgTlwM-JPOffEauk26RLUz7TV3>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5E923F8007D; Thu, 27 Aug 2026 05:04:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 11:04:38 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Jann Horn" <jannh@google.com>,
 linux-hardening@vger.kernel.org
Message-Id: <1c0299ab-9f5f-4c7b-826e-a0547f7863dd@app.fastmail.com>
In-Reply-To: <c33d081b-7886-4db2-b1d9-61dc195844e5@arm.com>
References: <20260805104042.1107678-2-ardb+git@google.com>
 <5a3b89a6-bc42-42c3-82e8-25d6f1a2c5d2@arm.com>
 <a277a83a-cc01-443d-be42-775ce0bc96dd@app.fastmail.com>
 <c33d081b-7886-4db2-b1d9-61dc195844e5@arm.com>
Subject: Re: [RFC PATCH] arm64: mm: Map fixmap PTE tables r/o in the linear map
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Thu, 27 Aug 2026, at 10:55, Kevin Brodsky wrote:
> On 26/08/2026 11:07, Ard Biesheuvel wrote:
>>>> [...]
>>>>
>>>> +static int __init fixmap_remap_ro(void)
>>>> +{
>>>> +	return set_direct_map_ro((unsigned long)lm_alias(&bm_pte), NR_BM_PTE_TABLES);
>>> Should we not also remap bm_pmd and bm_pud?
>>>
>>> For that matter, do we need RW access via the linear map for any page
>>> annotated with __bss_pgtbl? I suppose that might be the case for
>>> kasan_early_shadow_* but I don't know enough about KASAN to tell for sure.
>>>
>> bm_pte[] is special because it is only ever written via the kernel mapping,
>> and never via the linear map. This is why it is being singled out in this
>> patch.
>
> Right I see __set_fixmap(). This is a very special case of calling
> __set_pte() on a pointer derived from a global (i.e. pointing to the
> kernel image and not the LM) so it makes sense to treat it differently.
>
> I do wonder whether there is that much value in protecting bm_pte while
> all page tables in init_pg_dir (also at a fixed offset in the LM) remain
> writeable though.
>

Yes, so those need to be taken care of as well.

> Either way all this is interesting for my series protecting page tables
> with pkeys [1] - it seems that to protect the fixmap, the easiest option
> would be to change the pkey of .pgtlb in both the kernel image and LM
> (the former for bm_pte, and the latter for everything else).
>
> [1] https://lore.kernel.org/all/20260818-kpkeys-v9-0-743ad31b2c8f@arm.com/
>

Thanks, I've been meaning to go through those but they are a bit overwhelming :-)

>> Whether or not bm_pmd[] can be treated as a special case depends on the page
>> size: with 4k pages, the whole array covers a virtual region of 1G, which is
>> currently guaranteed to be shared only with the PCI I/O space (but we could
>> move that out). With 16k pages, it covers 64G, and so it is shared with the
>> vmemmap and other virtual mappings in the vmalloc region, and so the current
>> kernel mapping code expects to be able to write those entries.
>>
>> What we might do is generalize the logic that uses the fixmap to modify
>> pgd level entries in swapper_pg_dir, and use it for all modifications
>> at PMD level or higher if those tables are in .rodata
>>
>> But this is a bit more complicated than this change, so I decided to
>> present this as a separate change.
>
> Definitely, this is orthogonal to this patch. I wonder what the
> performance impact would be if we used the fixmap for setting all kernel
> entries at PMD and above. It would be nice to keep that logic easily
> togglable, because with the kpkeys approach I mentioned above we have a
> (most likely) much cheaper way of protecting these page tables.
>

I'm currently experimenting with using __put_kernel_nofault() to update
the descriptors at all levels (including PTE) and handling the fault
using the fixmap approach. That way, all statically allocated page
tables could move to .rodata (except bm_pte[]) and there should be no
substantial performance impact.

>>>> +}
>>>> +late_initcall(fixmap_remap_ro);
>>> Is mark_rodata_ro() definitely too early to remap these pages RO?
>>>
>> No, we might just call this from there, afaict.
>
> Sounds good, could we then use update_mapping_prot()? I suppose not as
> that would require mapping bm_pte separately in map_mem()?
>

Yeah, but perhaps we should do the latter anyway, so we can remap the
region even if !can_set_direct_map().


