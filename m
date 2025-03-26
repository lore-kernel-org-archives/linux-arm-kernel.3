Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2050CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7gIiSkBn+7zXAPWwwqnDBEsrDXMe6gcX/DYFPbvGnw=; b=xwc2EQWg88oAUphb38Ugi65NS4
	+fhoDq9t7ZWOXvg8YTWHroImsBv9oGzqbEU3Tk1tcSvwIg06r1y1uv3/Qq/19mzkWWhd16wBcWTCJ
	4yXqdGy1V6bjulT8OUjQLH6+txvYzCZ0cz0xCtRxleuwDPhrfz4aYV/VbNvQL7RCKO+NAfF+ueWoj
	BA+YcxLCSxC5evfDxoJ4BcSucKDaW54I/CdCNYVXSvSpF/E5RwxG/TOgwS2zIFGibUMv59XxyJEIT
	QLHVQII8Rzd1sl6qLzUpvLWQMTH2dugzdvVA8g6Gouhn5DJPrdhqdBhE68qDIXSFfKdYjv4t1YWPf
	/PybAUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOy8-00000008Mfu-3N3F;
	Wed, 26 Mar 2025 11:30:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOwN-00000008MTB-2YOB;
	Wed, 26 Mar 2025 11:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CFFBA41083;
	Wed, 26 Mar 2025 11:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D4CC4CEEA;
	Wed, 26 Mar 2025 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742988538;
	bh=4Sh1ikImfk7eyob7pJYLP87Gp+VBMFoDyKt80LgWr+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dO+wudTy752jbZBiKbEzH/y7kZltbC12thCjkIvnZenkEwF5D2goiKObY33+DZByK
	 62goXNL37ZMBjPsOFTzt1itoLJjbfI4q2kHo+gcavcD8Ed+ocOY+Elo0yUuq/RzkD4
	 FOqbHWsKAMpikkVh2I3TcWSLtiluyof3uUc5RxuLdFK2gbkm+vCt964jw4Ou0EI2Iy
	 SJHfXybHBPCt7535DKZ9pCxr1axSlbqbsF7nsodCCYZDBGsbw1rDAozoM+sEo3H3k5
	 40tkPnOq6VoCDvDqRAzPP/4s0qs6uIS8Ba3o5wFBmsURz9VrW0qQnuUQ5iLdNYoEuu
	 YHaiM9Fkt9Z/A==
Date: Wed, 26 Mar 2025 07:28:52 -0400
From: Mike Rapoport <rppt@kernel.org>
To: Dave Young <dyoung@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Changyuan Lyu <changyuanl@google.com>,
	linux-kernel@vger.kernel.org, graf@amazon.com,
	akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org,
	robh@kernel.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org,
	tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
Message-ID: <Z-Pk9Bnr0lDVopKj@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com>
 <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
 <CALu+AoQj+mHECTvbuK8CpUTmOYgx6n2oMFm5kQXtSigL+5Ks2w@mail.gmail.com>
 <CALu+AoRdfjNcjweq_ipxCC6UGBzM-a5ma417RBr-C3EQ=Em9OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALu+AoRdfjNcjweq_ipxCC6UGBzM-a5ma417RBr-C3EQ=Em9OQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_042859_769820_C9D51E55 
X-CRM114-Status: GOOD (  21.30  )
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

Hi Dave,

On Wed, Mar 26, 2025 at 05:17:16PM +0800, Dave Young wrote:
> On Tue, 25 Mar 2025 at 16:36, Dave Young <dyoung@redhat.com> wrote:
> >
> > > >
> > > > Have you tested kdump?  In my mind there are two issues,  one is with
> > > > CMA enabled, it could cause kdump crashkernel memory reservation
> > > > failures more often due to the fragmented low memory.  Secondly,  in
> > >
> > > kho scracth memorys are reserved much later than crashkernel, we may not
> > > need to worry about it.
> > > ====================
> > > start_kernel()
> > >   ......
> > >   -->setup_arch(&command_line);
> > >      -->arch_reserve_crashkernel();
> > >   ......
> > >   -->mm_core_init();
> > >      -->kho_memory_init();
> > >
> > > > kdump kernel dump the crazy scratch memory in vmcore is not very
> > > > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > > > so please disable this option for kdump.
> >
> > Ok,  it is fine if this is the case, thanks Baoquan for clearing this worry.
> >
> > But the other concerns are still need to address, eg. KHO use cases
> > are not good for kdump.
> > There could be more to think about.
> > eg. the issues talked in thread:
> > https://lore.kernel.org/lkml/Z7dc9Cd8KX3b_brB@dwarf.suse.cz/T/
> 
> Rethink about this,  other than previous concerns.  Transferring the
> old kernel state to kdump kernel makes no sense since the old state is
> not stable as the kernel has crashed.
 
KHO won't be active for kdump case. The KHO segments are only added to
kexec_image and never to kexec_crash_image. 

-- 
Sincerely yours,
Mike.

