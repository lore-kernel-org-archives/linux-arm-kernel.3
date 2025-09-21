Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCADBCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oP2fMDIO42pA5qEYFpE218RWeW1tYpqhJfL0HH4VDe4=; b=zWevLY+sv3oERCp1pWHWWVwguI
	wIbfbmXnaBFf9AYjTHmWvs/gt9RqYzgc1eZktx3ycFoL2H8OXhbdfqbE7JA5KIIxEXBjOPnBA+niZ
	9LH9T77rQQlTwPQagYliKH41WOU4F45ZXC2eH7bfbi+PIIeMadqsBFSmXAio9JFl8Fj7OEasVLsrV
	YdM1DoeRXiViADC48Wue5Izd4R6A/M9nRiIweAzFwv95Ql1x1NJKhFfsNfFJtlNRIOiZwjlGgjT1+
	CoAgE0msgrmmVKNXf9k0TwshTHJiRcCxElTnhnQ3Lp69eQha+kCwEjYiMVo344efyrJMtrYVHRIT8
	aDDojzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Ecw-00000006yJ9-2Vv7;
	Sun, 21 Sep 2025 07:36:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Ecu-00000006yI4-1ceW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 07:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A11A600AC;
	Sun, 21 Sep 2025 07:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8C8C4CEE7;
	Sun, 21 Sep 2025 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758440211;
	bh=u+7GWK94K2d12xoNceoyNQMPQ+Avsc5hXDrIp3bhOiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ARVmY+VzcXR/pwJD4cJSRgX+IajyrlajMfIWP/OlGMJvNOua8lbiv+guGXgycID6i
	 4ONFjQRLNiTR6Jr3gN/jljj8TWjlKiMfcsW7UPrZ0Xq7k7AhRStXbFpgfr2wJT4vI8
	 /I6zUmRm7+RhZM9XtLRt5Esv6URS2lD51qwKNifB4yUl3OwFQZUZiYUwjHYAqtevdR
	 JnMoUojwQxcrSZjkuXMidH8izfveUAtlaFtMrMW53mTwPKPD/lasRlrt/TvPE/9UWk
	 /r01Y3y6nxVidYXq/ZsQ+m3klo8QUcyujlIiSheFX2GDlAjZ3GLwEsv01HPfVbyTRO
	 j2wz/sYZAtZ1w==
Date: Sun, 21 Sep 2025 10:36:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
	ryan.roberts@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: kprobes: call set_memory_rox() for kprobe page
Message-ID: <aM-rDD-TRqmtr6Nb@kernel.org>
References: <20250918162349.4031286-1-yang@os.amperecomputing.com>
 <aMxAwDr11M2VG5XV@willie-the-truck>
 <8df9d007-f363-4488-96e9-fbf017d9c8e2@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df9d007-f363-4488-96e9-fbf017d9c8e2@os.amperecomputing.com>
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

On Thu, Sep 18, 2025 at 10:33:26AM -0700, Yang Shi wrote:
> 
> 
> On 9/18/25 10:26 AM, Will Deacon wrote:
> > On Thu, Sep 18, 2025 at 09:23:49AM -0700, Yang Shi wrote:
> > > The kprobe page is allocated by execmem allocator with ROX permission.
> > > It needs to call set_memory_rox() to set proper permission for the
> > > direct map too. It was missed.
> > > 
> > > Fixes: 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in alloc_insn_page")
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > ---
> > > v2: Separated the patch from BBML2 series since it is an orthogonal bug
> > >      fix per Ryan.
> > >      Fixed the variable name nit per Catalin.
> > >      Collected R-bs from Catalin.
> > > 
> > >   arch/arm64/kernel/probes/kprobes.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> > > index 0c5d408afd95..8ab6104a4883 100644
> > > --- a/arch/arm64/kernel/probes/kprobes.c
> > > +++ b/arch/arm64/kernel/probes/kprobes.c
> > > @@ -10,6 +10,7 @@
> > >   #define pr_fmt(fmt) "kprobes: " fmt
> > > +#include <linux/execmem.h>
> > >   #include <linux/extable.h>
> > >   #include <linux/kasan.h>
> > >   #include <linux/kernel.h>
> > > @@ -41,6 +42,17 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> > >   static void __kprobes
> > >   post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
> > > +void *alloc_insn_page(void)
> > > +{
> > > +	void *addr;
> > > +
> > > +	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> > > +	if (!addr)
> > > +		return NULL;
> > > +	set_memory_rox((unsigned long)addr, 1);
> > > +	return addr;
> > > +}
> > Why isn't execmem taking care of this? It looks to me like the
> > execmem_cache_alloc() path calls set_memory_rox() but the
> > execmem_vmalloc() path doesn't?

execmem_alloc() -> execmem_vmalloc() consolidated __vmalloc_node_range()
for executable allocations. Those also didn't update the linear map alias.

It could be added to execmem_vmalloc(), but as of now we don't have a way
for generic code to tell which set_memory method to call based on pgprot,
so making execmem_vmalloc() to deal with direct map alias is quite
involved.

It would be easier to just remove the direct map alias. It works on x86 so
I don't see what can possibly go wrong :)
 
> execmem_cache_alloc() is just called if execmem ROX cache is enabled, but it
> currently just supported by x86. Included Mike to this thread who is the
> author of execmem ROX cache.
> 
> > 
> > It feels a bit bizarre to me that we have to provide our own wrapper
> > (which is identical to what s390 does). Also, how does alloc_insn_page()
> > handle the direct map alias on x86?

s390 had its version of alloc_insn_page() long before execmem so there I
just replaced module_alloc() with exemem_alloc().

arm64 version of alloc_insn_page() didn't update the direct map before
execmem, so I overlooked this issue when I was converting arm64 to execmem.
 
> x86 handles it via execmem ROX cache.
> 
> Thanks,
> Yang
> 
> > 
> > Will
> 

-- 
Sincerely yours,
Mike.

