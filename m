Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1057CC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQbuzXsahLKlS1AmyUDnw4CvDcqL8vtwyd4JaedCY3E=; b=GHrE2ZkqfwlXZByTQLgpU1Oed9
	5j1tjPwRZxd981RM7wyvKPlCt90IdBkC80sY4aES2lyKff5pKQ6k978QONun93FpN6kx2hwt0Q0XT
	zaDeBoRB2togBGZkn+z7ez9R/D+rlVMHc07bVR/YjielD9htgZvvCFy4znGFkk6AEht/Gu+LnbJ+c
	Cx4e3V/gcfzKdOpKIzFja70QXPNQItjM96mvCaJk8+DcnSuidvYYcn3nwajx7SDJBsr6qiknDqvCp
	XGY1s2eRqSRVgXiZ9hEOIl6eGY6Mz8ErAV0AnlGqkjmJPQxWxyaSZUAqTvw4WFXhj4xYudHbCNdYY
	8x9lWxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufM4A-0000000AJhB-0liI;
	Fri, 25 Jul 2025 17:18:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLtx-0000000AIV7-049N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 17:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19A145C6B9C;
	Fri, 25 Jul 2025 17:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3832BC4CEE7;
	Fri, 25 Jul 2025 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753463287;
	bh=eEiIL0rv55Mb2Vf0/AmSi7VJDqvdOD9ADdquhg19Z44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zqns/GEB3bmWH+iIQWRad69gSqXISVZ56gvDEmAHEGZ+iO2A8kwbdAAR3JUSJ0Go6
	 YBqyQFLrgTFdlcgFa21yjYMkzKEcJOXcZ2OgimQgjqA9jXUj5DTSMhEClqto1FqL0M
	 b26HA8kAP3Y1At2Q4c6tVwgJufnh9R6TsVr//u8w=
Date: Fri, 25 Jul 2025 19:08:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Tom Rix <trix@redhat.com>,
	Christopher Covington <cov@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
Message-ID: <2025072504-easel-propose-0474@gregkh>
References: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
 <2025072553-chevy-starter-565e@gregkh>
 <20250725163851.GB684490@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725163851.GB684490@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_100809_106120_E112A5A3 
X-CRM114-Status: GOOD (  26.41  )
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

On Fri, Jul 25, 2025 at 09:38:51AM -0700, Nathan Chancellor wrote:
> On Fri, Jul 25, 2025 at 10:58:05AM +0200, Greg KH wrote:
> > On Thu, Jul 24, 2025 at 06:15:28PM -0700, Justin Stitt wrote:
> > > A new warning in Clang 22 [1] complains that @clidr passed to
> > > get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> > > doesn't really care since it casts away the const-ness anyways.
> > 
> > Is clang-22 somehow now a supported kernel for the 6.1.y tree?  Last I
> > looked, Linus's tree doesn't even build properly for it, so why worry
> > about this one just yet?
> 
> Our goal is to have tip of tree LLVM / clang be able to build any
> supported branch of the kernel so that whenever it branches and
> releases, the fixes for it are already present in released kernel
> versions so users can just pick them up and go. We are going to have to
> worry about this at some point since it is a stable-only issue so why
> not tackle it now?
> 
> > > Silence the warning by initializing the struct.
> > 
> > Why not fix the compiler not to do this instead?  We hate doing foolish
> > work-arounds for broken compilers.
> 
> While casting away the const from the pointer in this case is "fine"
> because the object it pointed to was not const, I am fairly certain it
> is undefined behavior to cast away the const from a pointer to a const
> object, see commit 12051b318bc3 ("mips: avoid explicit UB in assignment
> of mips_io_port_base") for an exampile, so I am not sure the warning is
> entirely unreasonable.

Hah, we've been doing that for _decades_ with container_of(), so if that
is UB, and the compiler can't handle it, I'd declare that a broken
compiler :)

Look at e78f70bad29c ("time/timecounter: Fix the lie that struct
cyclecounter is const") in linux-next as one example of me trying to fix
that mess up.  It's going to take a bunch of work to get there, but
eventually we will.  We will not be backporting all of those patches
though, that would be way too much work.

Anyway, as the maintainer doesn't seem to want this, I guess I'll just
ignore it for now?

thanks,

greg k-h

