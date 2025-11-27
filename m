Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FE3CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrv1YCp2fM14t6zKAfz6O2nTZwDL8cvvdkwi+ppBORc=; b=qxdNU8A3U6FoNuytZwP67XTxek
	jrybdz1kbmIaSxj0QlYLt+h7UhOoVAgWqZELxJ8FX3T5DBS4YurpQL/IYStgTNi8AXQEujqf/WL8I
	crad4gwNMAoG+tgZxqEGNZE2OYfj1XCBTwWmnwHZ7IhaYmbHu8jYN9TPhvgfpk1UTYl9EhRkn6mgk
	EOp7KnVLMFcZQplem244nKLGCrK3LjRxphzQPzy+sYU99lgqnkYjBuwZ93/bcUFSsNiEHH8VnuGOS
	JgarZDW4GwqWb0JREQlLX4o1wUKHOqZvGPb+uZ7b7zeVlPfCWHkJbcEjAc9l/JW4lDyunmKtKrBxP
	abljFW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZE1-0000000GNhi-3l7s;
	Thu, 27 Nov 2025 10:27:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZDy-0000000GNgK-2OXv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9698D434D6;
	Thu, 27 Nov 2025 10:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722A5C4CEF8;
	Thu, 27 Nov 2025 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764239261;
	bh=l8MEnU38WJNtf21NpEjwBL/C3hT0xHnCDwlp6PtWU+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMDXxtUZ8/H79/ftA1Ipmizsq/K2CMzQSUfqW4dB9GN9S2NleHqRTFJSC8JoWzJNo
	 XIsGgUZtni1MjlQdl0AiMCIxHLNgV2YwjtfT/j/VxFsJof0lR/DOLFeMoauZCZfFNo
	 oO3GIOwsQ7iPwUXMEKp8QxCQ0pGIxrQlDxqu6hebAQtuY+rdlOWDJruNmH4+9M+7yk
	 WQcKvpgWKzUKcTmqlsrcfHlkDFI2cSsTBeNhcsienM+iaNPcZ07oVcK7jJ2AS2Nlsg
	 9IXHtOt+e1S23JWeIWiAdywkb6peRVNp6O9GoNCTO4iaCPFpBbm/4RcIYjaHesPUMg
	 9noFk2DVFrT1A==
Date: Thu, 27 Nov 2025 10:27:34 +0000
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Zizhi Wo <wozizhi@huaweicloud.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>, jack@suse.com,
	brauner@kernel.org, hch@lst.de, akpm@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	yangerkun@huawei.com, wangkefeng.wang@huawei.com,
	pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aSgnlmQi_UPsugNU@willie-the-truck>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com>
 <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_022742_645505_4E22308E 
X-CRM114-Status: GOOD (  25.16  )
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

On Wed, Nov 26, 2025 at 01:12:38PM -0800, Linus Torvalds wrote:
> On Wed, 26 Nov 2025 at 02:27, Zizhi Wo <wozizhi@huaweicloud.com> wrote:
> >
> > 在 2025/11/26 17:05, Zizhi Wo 写道:
> > > We're running into the following issue on an ARM32 platform with the linux
> > > 5.10 kernel:
> > >
> > > During the execution of hash_name()->load_unaligned_zeropad(), a potential
> > > memory access beyond the PAGE boundary may occur.
> 
> That is correct.
> 
> However:
> 
> > >                This triggers a page fault,
> > > which leads to a call to do_page_fault()->mmap_read_trylock().
> 
> That should *not* happen.  For kernel addresses, mmap_read_trylock()
> should never trigger, much less the full mmap_read_lock().
> 
> See for example the x86 fault handling in  handle_page_fault():
> 
>         if (unlikely(fault_in_kernel_space(address))) {
>                 do_kern_addr_fault(regs, error_code, address);
> 
> and the kernel address case never triggers the mmap lock, because
> while faults on kernel addresses can happen for various reasons, they
> are never memory mappings.
> 
> I'm seeing similar logic in the arm tree, although the check is
> different. do_translation_fault() checks for TASK_SIZE.
> 
>         if (addr < TASK_SIZE)
>                 return do_page_fault(addr, fsr, regs);
> 
> but it appears that there are paths to do_page_fault() that do not
> have this check, ie that do_DataAbort() function does
> 
>         if (!inf->fn(addr, fsr & ~FSR_LNX_PF, regs))
>                 return;
> 
> 
> and It's not immediately obvious, but that can call do_page_fault()
> too though the fsr_info[] and ifsr_info[] arrays in
> arch/arm/mm/fsr-2level.c.
> 
> The arm64 case looks like it might have similar issues, but while I'm
> more familiar with arm than I _used_ to be, I do not know the
> low-level exception handling code at all, so I'm just adding Russell,
> Catalin and Will to the participants.
> 
> Catalin, Will - the arm64 case uses
> 
>         if (is_ttbr0_addr(addr))
>                 return do_page_fault(far, esr, regs);
> 
> instead, but like the 32-bit code that is only triggered for
> do_translation_fault().  That may all be ok, because the other cases
> seem to be "there is a TLB entry, but we lack privileges", so maybe
> will never trigger for a kernel access to a kernel area because they
> either do not exist, or we have permissions?

Right, I think the access flag / permission fault case will end up
trying to resolve the VMA for a kernel address but I can't think why
we'd ever run into one of those faults for load_unaligned_zeropad().

Valid kernel mappings are always young (AF set) and, although we can
muck around with permissions, valid mappings are always readable.

Will

