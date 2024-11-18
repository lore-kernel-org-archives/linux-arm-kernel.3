Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B8FD49222
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc53FADjsmPhJRHalWX7IVUR3e7hAGYmGPhrTw0yBDc=; b=TRDOqHr3CupoTIT+KITVs9SkM/
	Jl0h7Q8efiiu8tL9Cv05lQPN6FGl/LK+KgSZEt31wQJXMlE/fwDer2FtN4ebQVYuef/0aLwKgfufR
	rOTo02NAw+2c4BIX89ri0J5hrVw+Dw8WaQXumJcpPrSXCd+5QZ93ODfUmVwhw5nEFuj/vscd+B97K
	df3ujCGuB97eYRMNd6rt8++dh+9BS8vcs7q+yqeQId8Jd5Zo2KnG3YzDSMYlqJVSjN5c2fuzLaAky
	uJn/2F4ZSUsItFQ60IFwBHJ8P+uCA/R2Fiq2XhcTrxKgQFf87orfaKz3zxWJMUs9R3wn/vPVr9V6d
	jmQw3T7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1rY-00000009ahF-0uxj;
	Mon, 18 Nov 2024 13:32:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1Tr-00000009VFY-3qyL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:07:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C3C1682;
	Mon, 18 Nov 2024 05:08:20 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E8F33F5A1;
	Mon, 18 Nov 2024 05:07:48 -0800 (PST)
Date: Mon, 18 Nov 2024 13:07:43 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Gax-c <zichenxie0106@gmail.com>, catalin.marinas@arm.com,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	chenyuan0y@gmail.com, zzjas98@gmail.com, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] arm64: uaccess: Restrict user access to kernel memory in
 __copy_user_flushcache()
Message-ID: <Zzs8DtlbCqmBgzJV@J2N7QTR9R3>
References: <20241115205206.17678-1-zichenxie0106@gmail.com>
 <20241118115654.GA27696@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118115654.GA27696@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050752_042031_D99F5E1D 
X-CRM114-Status: GOOD (  29.54  )
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

[ adding uaccess / iov_iter / pmem folk, question at the end ]

On Mon, Nov 18, 2024 at 11:56:55AM +0000, Will Deacon wrote:
> On Fri, Nov 15, 2024 at 02:52:07PM -0600, Gax-c wrote:
> > From: Zichen Xie <zichenxie0106@gmail.com>
> > 
> > raw_copy_from_user() do not call access_ok(), so this code allowed
> > userspace to access any virtual memory address. Change it to
> > copy_from_user().
> 
> How can you access *any* virtual memory address, given that we force the
> address to map userspace via __uaccess_mask_ptr()?
> 
> > Fixes: 9e94fdade4d8 ("arm64: uaccess: simplify __copy_user_flushcache()")
> 
> I don't think that commit changed the semantics of the code, so if it's
> broken then I think it was broken before that change as well.

AFAICT we've never had an access_ok() in __copy_user_flushcache() or
__copy_from_user_flushcache() (which is the only caller of
__copy_user_flushcache()).

We could fold the two together to make that aspect slightly clearer;
IIUC we only had this out-of-line due ot the PAN toggling that we used
to have.

> > Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  arch/arm64/lib/uaccess_flushcache.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/lib/uaccess_flushcache.c b/arch/arm64/lib/uaccess_flushcache.c
> > index 7510d1a23124..fb138a3934db 100644
> > --- a/arch/arm64/lib/uaccess_flushcache.c
> > +++ b/arch/arm64/lib/uaccess_flushcache.c
> > @@ -24,7 +24,7 @@ unsigned long __copy_user_flushcache(void *to, const void __user *from,
> >  {
> >  	unsigned long rc;
> >  
> > -	rc = raw_copy_from_user(to, from, n);
> > +	rc = copy_from_user(to, from, n);
> 
> Does anybody actually call this with an unchecked user address?
> 
> From a quick look, there are two callers of _copy_from_iter_flushcache():
> 
>   1. pmem_recovery_write() - looks like it's using a kernel address?
> 
>   2. dax_copy_from_iter() - has a comment saying the address was already
>                             checked in vfs_write().
> 
> What am I missing? It also looks like x86 elides the check.

IIUC the intent is that __copy_from_user_flushcache() is akin to
raw_copy_from_user(), and requires that the caller has already checked
access_ok(). The addition of __copy_from_user_flushcache() conicided
with __copy_from_user() being replaced with raw_copy_from_user(), and I
suspect the naming divergence was accidental.

That said, plain copy_from_user_iter() has an access_ok() check while
copy_from_user_iter_flushcache() doesn't (and it lakcs any explanatory
comment), so even if that's ok for current callers it seems like it
might be fragile.

So the real question is where is the access_ok() call intended to live?
I don't think it's meant to be in __copy_from_user_flushcache(), and is
intended to live in *some* caller, but it seems odd that
copy_from_user_iter() and copy_from_user_iter_flushcache() diverge.

Mark.

