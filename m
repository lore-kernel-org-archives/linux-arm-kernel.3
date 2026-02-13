Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83854EDF148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEkkLmmkFZin8djP7DhwaM2jbb7jPvUYx62XstqaFD4=; b=47I98uiSxf+xxQQ0PsPPcm2FPo
	+nKvadncSf5x1GvQgzk5SuUpnV2WLHA9HV0pbt0TpabYx6bjWoKEJvsfNA5XVXI+pbVIRMPkI9b4A
	H1aYUZcDxgkwwgezInK6hxYV+5NCIaqpbjvMcW4/9j30l2zrktzg7URcYjf8o8bbxPVg9m//PDOoR
	blWZs5DpQL5f0Y2ELlrKhGfp0vhRpZSeqdVfup6GehjOktky/3Ed+YrKoFSoZIWmYRBEZbRYBmphz
	NPy06C5Tt8hseN2Zk5xNeNuRKeBUZHYrcXthROqaohItQeJ2pnrwg/72Nv8mePAQLaz7pC7lde1Py
	ZDtpeRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrYb-00000003Pc1-1HgM;
	Fri, 13 Feb 2026 11:41:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrYZ-00000003Pbt-3qK9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBDC76001A;
	Fri, 13 Feb 2026 11:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6D6C116C6;
	Fri, 13 Feb 2026 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770982914;
	bh=//FUPQtiHgkA6+8ggCTux5TUR6pLkT0fZp0gFDq5xRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQTI1b3u0Q4pyuXy0AQhK+daoEjRVYcgNTOfFMrdfdZ/HhxV617xG2c28/P8pq1D9
	 iD6Nks4akO4w62sa5jNdbS1F3SbFTTRPizMUdXq1cLYFHPAp4bKBlvjlTaRgILYdoP
	 yr2bOqqRtlh5pbgCIlnuOlrak4uvTjq6VUbgw+bWGAJs7gDbZSS9Oz80rWkzus5pmr
	 LQ9t52v1iig1a0ANoVlL58TPaRATwVW6B4fAuR0VCVM7Pqsk8YrSNBf9BzttKJ4j+v
	 UDPatfhhstyabt8VHBDQo07Uu8TWw2eXjm5ROfA4Slm+pmClEI6C7f5EzgQt3ZOw6D
	 zYN4e8eHOIZ7w==
Date: Fri, 13 Feb 2026 17:11:43 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Matthew Wilcox <willy@infradead.org>, vbabka@suse.cz,
	akpm@linux-foundation.org, kernel@pengutronix.de,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, ilias.apalodimas@linaro.org,
	jan.kiszka@siemens.com, masahisa.kojima@linaro.org
Subject: Re: [PATCH v2] tee: shm: fix slab page refcounting
Message-ID: <aY8N90jMp25bBZhi@sumit-xelite>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
 <Z-TXMIXzaro0w60M@sumit-X1>
 <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
 <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
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

Hi Marco,

On Thu, Feb 12, 2026 at 01:58:30PM +0100, Marco Felsch wrote:
> Hi Sumit,
> 
> TBH: I was hoping that you will take care of this since you're marked as
> maintainer for the tee-trusted-key and we noticed the warning with 6.14
> and still no fix available :/

Mathew did suggested a fix long back on which everybody agreed but
didn't got enough attention from you to test and report if that fixed
your issue. Since you insisted further, I have created a formal fix
patch based on that here [1]. Care to test that?

[1] https://lore.kernel.org/all/20260213113317.1728769-1-sumit.garg@kernel.org/

> 
> However please see below for further discussion.
> 
> On 25-04-28, Jens Wiklander wrote:
> > On Thu, Mar 27, 2025 at 5:42 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> > >
> > > On Wed, Mar 26, 2025 at 02:47:46PM +0100, Jens Wiklander wrote:
> > > > On Wed, Mar 26, 2025 at 12:07 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > > >
> > > > > On 25-03-26, Matthew Wilcox wrote:
> > > > > > On Tue, Mar 25, 2025 at 09:07:39PM +0100, Marco Felsch wrote:
> > > > > > > Skip manipulating the refcount in case of slab pages according commit
> > > > > > > b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page").
> > > > > >
> > > > > > This almost certainly isn't right.  I know nothing about TEE, but that
> > > > > > you are doing this indicates a problem.  The hack that we put into
> > > > > > networking should not be blindly replicated.
> > > > > >
> > > > > > Why are you taking a reference on the pages to begin with?  Is it copy
> > > > > > and pasted from somewhere else, or was there actual thought put into it?
> > > > >
> > > > > Not sure, this belongs to the TEE maintainers.
> > > >
> > > > I don't know. We were getting the user pages first, so I assume we
> > > > just did the same thing when we added support for kernel pages.
> > > >
> > > > >
> > > > > > If it's "prevent the caller from freeing the allocation", well, it never
> > > > > > accomplished that with slab allocations.  So for callers that do kmalloc
> > > > > > (eg setup_mm_hdr()  in drivers/firmware/efi/stmm/tee_stmm_efi.c), you
> > > > > > have to rely on them not freeing the allocation while the TEE driver
> > > > > > has it.
> > >
> > > It's not just about the TEE driver but rather if the TEE implementation
> > > (a trusted OS) to whom the page is registered with. We don't want the
> > > trusted OS to work on registered kernel pages if they gets free somehow
> > > in the TEE client driver. Having a reference in the TEE subsystem
> > > assured us that won't happen. But if you say slab allocations are still
> > > prone the kernel pages getting freed even after refcount then can you
> > > suggest how should we handle this better?
> > >
> > > As otherwise it can cause very hard to debug problems if trusted OS can
> > > manipulate kernel pages that are no longer available.
> > 
> > We must be able to rely on the kernel callers to have the needed
> > references before calling tee_shm_register_kernel_buf() and to keep
> > those until after calling tee_shm_free().
> 
> I checked the code once again and figured that we could drop/replace
> tee_shm_register_kernel_buf() with tee_shm_alloc_kernel_buf(). I don't
> see why a kernel driver needs to tee_shm_register_kernel_buf() in the
> first place, maybe this is legacy. The only users of
> tee_shm_register_kernel_buf() are trusted_tee.c and tee_stmm_efi.c.

No it's not legacy but allows for efficient memory reuse within the
kernel as to not create bounce buffers to share data with TEE.

-Sumit

> 
> +Cc the efi-stmm folks since they will be affected by this change as
> well.
> 
> Regards,
>   Marco
> 
> 
> > > > > > And if that's your API contract, then there's no point in taking
> > > > > > refcounts on other kinds of pages either; it's just unnecessary atomic
> > > > > > instructions.  So the right patch might be something like this:
> > > > > >
> > > > > > +++ b/drivers/tee/tee_shm.c
> > > > > > @@ -15,29 +15,11 @@
> > > > > >  #include <linux/highmem.h>
> > > > > >  #include "tee_private.h"
> > > > >
> > > > > I had the same diff but didn't went this way since we can't be sure that
> > > > > iov's are always slab backed. As far as I understood IOVs. In
> > > > > 'worst-case' scenario an iov can be backed by different page types too.
> > > >
> > > > We're only using kvec's. Briefly, before commit 7bdee4157591 ("tee:
> > > > Use iov_iter to better support shared buffer registration") we checked
> > > > with is_vmalloc_addr() || is_kmap_addr(). I like Matthew's suggestion,
> > > > it's nice to fix problems by deleting code. :-)
> > > >
> > > > Sumit, you know the callers better. What do you think?
> > >
> > > If we don't have a sane way to refcont registered kernel pages in TEE
> > > subsystem then yeah we have to solely rely on the client drivers to
> > > behave properly. Nevertheless, it's still within the kernel boundaries
> > > which we can rely upon.
> > 
> > Yes.
> > 
> > Cheers,
> > Jens
> 
> -- 
> #gernperDu 
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

