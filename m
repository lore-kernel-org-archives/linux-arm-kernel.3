Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A4EEB491D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBA3Z6H+B+qtaJ4uI9FE1hrpEUlV4GfTM0cyFeY2RNo=; b=kOansf0rtCCILEYdM4cS0IyTfM
	5oyy95S9dw6LvfKXN/h9pzuO1lgsn1CtsBUPZi1OfZkynjZHfB4Rv5o0HTh/QPG185zZxzjT5Fixu
	VWMEuitCkwLjddTAsLrCL0Xb1BWIPpIB70Y/Y62dMxpWlvNlVl5bGvVSC7AtlSGUeWIkjwpcHRLKS
	gYc5nebGggOX7cAWQe5/f2Fin+gAgYLWp0IZ7CvJ+dHpBhG8OZXlRVHE76qw4rO++GAdr6o4YzVLp
	+lZlXiuzJrUpltiScC2P9jDnzOeD+EdSdWztIh33uSegqxHyFLj2g5q8oUpPXsqDYT1PtCrKX8Ypx
	6LtTQVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWHd-000000026yc-3uKK;
	Thu, 12 Feb 2026 12:59:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWHa-000000026xj-1gaS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 12:59:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vqWHB-0008LE-0f; Thu, 12 Feb 2026 13:58:33 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vqWH7-000PUE-2A;
	Thu, 12 Feb 2026 13:58:31 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vqWH8-00DseC-2p;
	Thu, 12 Feb 2026 13:58:30 +0100
Date: Thu, 12 Feb 2026 13:58:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, vbabka@suse.cz,
	akpm@linux-foundation.org, kernel@pengutronix.de,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, ilias.apalodimas@linaro.org,
	jan.kiszka@siemens.com, masahisa.kojima@linaro.org
Subject: Re: [PATCH v2] tee: shm: fix slab page refcounting
Message-ID: <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
 <Z-TXMIXzaro0w60M@sumit-X1>
 <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_045858_468354_FC4590EC 
X-CRM114-Status: GOOD (  48.47  )
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

Hi Sumit,

TBH: I was hoping that you will take care of this since you're marked as
maintainer for the tee-trusted-key and we noticed the warning with 6.14
and still no fix available :/

However please see below for further discussion.

On 25-04-28, Jens Wiklander wrote:
> On Thu, Mar 27, 2025 at 5:42 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Wed, Mar 26, 2025 at 02:47:46PM +0100, Jens Wiklander wrote:
> > > On Wed, Mar 26, 2025 at 12:07 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > >
> > > > On 25-03-26, Matthew Wilcox wrote:
> > > > > On Tue, Mar 25, 2025 at 09:07:39PM +0100, Marco Felsch wrote:
> > > > > > Skip manipulating the refcount in case of slab pages according commit
> > > > > > b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page").
> > > > >
> > > > > This almost certainly isn't right.  I know nothing about TEE, but that
> > > > > you are doing this indicates a problem.  The hack that we put into
> > > > > networking should not be blindly replicated.
> > > > >
> > > > > Why are you taking a reference on the pages to begin with?  Is it copy
> > > > > and pasted from somewhere else, or was there actual thought put into it?
> > > >
> > > > Not sure, this belongs to the TEE maintainers.
> > >
> > > I don't know. We were getting the user pages first, so I assume we
> > > just did the same thing when we added support for kernel pages.
> > >
> > > >
> > > > > If it's "prevent the caller from freeing the allocation", well, it never
> > > > > accomplished that with slab allocations.  So for callers that do kmalloc
> > > > > (eg setup_mm_hdr()  in drivers/firmware/efi/stmm/tee_stmm_efi.c), you
> > > > > have to rely on them not freeing the allocation while the TEE driver
> > > > > has it.
> >
> > It's not just about the TEE driver but rather if the TEE implementation
> > (a trusted OS) to whom the page is registered with. We don't want the
> > trusted OS to work on registered kernel pages if they gets free somehow
> > in the TEE client driver. Having a reference in the TEE subsystem
> > assured us that won't happen. But if you say slab allocations are still
> > prone the kernel pages getting freed even after refcount then can you
> > suggest how should we handle this better?
> >
> > As otherwise it can cause very hard to debug problems if trusted OS can
> > manipulate kernel pages that are no longer available.
> 
> We must be able to rely on the kernel callers to have the needed
> references before calling tee_shm_register_kernel_buf() and to keep
> those until after calling tee_shm_free().

I checked the code once again and figured that we could drop/replace
tee_shm_register_kernel_buf() with tee_shm_alloc_kernel_buf(). I don't
see why a kernel driver needs to tee_shm_register_kernel_buf() in the
first place, maybe this is legacy. The only users of
tee_shm_register_kernel_buf() are trusted_tee.c and tee_stmm_efi.c.

+Cc the efi-stmm folks since they will be affected by this change as
well.

Regards,
  Marco


> > > > > And if that's your API contract, then there's no point in taking
> > > > > refcounts on other kinds of pages either; it's just unnecessary atomic
> > > > > instructions.  So the right patch might be something like this:
> > > > >
> > > > > +++ b/drivers/tee/tee_shm.c
> > > > > @@ -15,29 +15,11 @@
> > > > >  #include <linux/highmem.h>
> > > > >  #include "tee_private.h"
> > > >
> > > > I had the same diff but didn't went this way since we can't be sure that
> > > > iov's are always slab backed. As far as I understood IOVs. In
> > > > 'worst-case' scenario an iov can be backed by different page types too.
> > >
> > > We're only using kvec's. Briefly, before commit 7bdee4157591 ("tee:
> > > Use iov_iter to better support shared buffer registration") we checked
> > > with is_vmalloc_addr() || is_kmap_addr(). I like Matthew's suggestion,
> > > it's nice to fix problems by deleting code. :-)
> > >
> > > Sumit, you know the callers better. What do you think?
> >
> > If we don't have a sane way to refcont registered kernel pages in TEE
> > subsystem then yeah we have to solely rely on the client drivers to
> > behave properly. Nevertheless, it's still within the kernel boundaries
> > which we can rely upon.
> 
> Yes.
> 
> Cheers,
> Jens

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

