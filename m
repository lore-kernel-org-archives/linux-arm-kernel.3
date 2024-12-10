Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B23E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrU+gMarlKkRFflJ9DUPukPSCJaH9rK2BG9w/YU4poU=; b=YSIw8P1DxCyTPg+3U9cGhi/rWY
	CAalVTJklCnRDT/exZbnlNSyJMWOlFU/El5/OW26e84xee3hsd9jxhADiqmyXQsaqernlOzRhV+GD
	AxEleP1D3VvqxmdLDrp1oXW4hDEJCWa+gAAZb4EZ8EM6ttXjbSkeMYT/+BkhFhhoF9PVAMbAMmVqC
	jSRz7IqRiqIM6HZEo1d348w3dZo0fciQXrny+zdduuDBb4FHuAw6SnQfYt9j8cI+q/lTe1ChCa5M8
	GEaiFacWkZ27HifG0qV3aUTDM6IDsvHtFJCi3wQj4Zcga3COQaYnnVJ/dfNYnj/y1Wn3zXU489e6z
	zTX1Pvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3EU-0000000C7Ph-1JNr;
	Tue, 10 Dec 2024 16:37:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3DR-0000000C7Hi-33HI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:36:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4A18497;
	Tue, 10 Dec 2024 08:36:32 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD03F3F5A1;
	Tue, 10 Dec 2024 08:36:03 -0800 (PST)
Date: Tue, 10 Dec 2024 16:35:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <Z1ht7X2LRw34pMJK@J2N7QTR9R3>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
 <Z1hU0Ii-Sm9NHnhj@J2N7QTR9R3>
 <20c12aac-193e-43ae-9418-39db1af4ede9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20c12aac-193e-43ae-9418-39db1af4ede9@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_083605_851513_E85B7AC9 
X-CRM114-Status: GOOD (  27.96  )
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

On Tue, Dec 10, 2024 at 03:44:29PM +0000, Mark Brown wrote:
> On Tue, Dec 10, 2024 at 02:48:48PM +0000, Mark Rutland wrote:
> > On Tue, Dec 10, 2024 at 12:42:53AM +0000, Mark Brown wrote:
> > > We are seeing a false postive sparse warning in gcs_restore_signal()
> > > 
> > > arch/arm64/kernel/signal.c:1054:9: sparse: sparse: cast removes address space '__user' of expression
> 
> > This isn't a false positive; this is a cross-address space cast that
> > sparse is accurately warning about. That might be *benign*, but the tool
> > is doing exactly what it is supposed to.
> 
> The spuriousness is arguable, from my point of view it's spurious in
> that we don't have the type of the system register we're writing to.

All that I'm asking for here is a trivial rewording; make the title say
something like:

  arm64/signal: Avoid sparse warning when manipulating GCSPR_EL0

... and in the commit message, say something like:

  Sparse complains about the manipulation of the GCSPR_EL0 value in
  gcs_restore_signal(), because we cast to/from the __user address space
  without a __force cast. Silence this warning by ${DOING_THING}.

... which clearly explains what's actually going wrong, rather than
making spurious complaints about the tool that may mislead a reader of
the commit message.

> > > +	write_sysreg_s((unsigned long)(gcspr_el0 + 1), SYS_GCSPR_EL0);
> 
> > Only one line here wants a __user pointer, so wouldn't it be simpler to
> > pass 'gcspr_el0' as an integer type, and cast it at the point it's used
> > as an actual pointer, rather than the other way around?
> 
> > Then you could also simplify gcs_restore_signal(), etc.
> 
> I find it both safer and clearer to keep values which are userspace
> pointers as userspace pointers rather than working with them as
> integers, using integers just sets off alarm bells.  

Having casts strewn throughout the code sets off more alarm bells for
me.

> > Similarly in map_shadow_stack(), it'd be simpler to treat cap_ptr as an
> > integer type.
> 
> With map_shadow_stack() it's a bit of an issue with letting users
> specify a size but yeah, we could do better there.

I don't follow. The only place where size interacts with cap_ptr is when
we initialize cap_ptr, and there we're adding size to an integer type:

	cap_ptr = (unsigned long __user *)(addr + size -
					   (cap_offset * sizeof(unsigned long)));

I was suggesting something along the lines of the diff below.

Mark.

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 5c46ec527b1cd..096add5f2ddb2 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -71,10 +71,7 @@ unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
 {
        unsigned long alloc_size;
-       unsigned long __user *cap_ptr;
-       unsigned long cap_val;
        int ret = 0;
-       int cap_offset;
 
        if (!system_supports_gcs())
                return -EOPNOTSUPP;
@@ -106,17 +103,16 @@ SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsi
         * can be switched to.
         */
        if (flags & SHADOW_STACK_SET_TOKEN) {
+               unsigned long cap_addr = addr + size - sizeof(unsigned long);
+               unsigned long cap_val;
+
                /* Leave an extra empty frame as a top of stack marker? */
                if (flags & SHADOW_STACK_SET_MARKER)
-                       cap_offset = 2;
-               else
-                       cap_offset = 1;
+                       cap_addr -= sizeof(unsigned long)
 
-               cap_ptr = (unsigned long __user *)(addr + size -
-                                                  (cap_offset * sizeof(unsigned long)));
-               cap_val = GCS_CAP(cap_ptr);
+               cap_val = GCS_CAP(cap_addr);
 
-               put_user_gcs(cap_val, cap_ptr, &ret);
+               put_user_gcs(cap_val, (unsigned long __user *)cap_addr, &ret);
                if (ret != 0) {
                        vm_munmap(addr, size);
                        return -EFAULT;

