Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16908E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKm4FZIk/ozrGW7rGdW3TBshP6lLkJj5mg/YznNZrz0=; b=271u5KCvm64AqPLLgeOF0Sazzb
	vC5zYp4PEvrC0J2E+18hMtgXtFdKpjKPyvi/jsdK/zGiDl7K2K9bTljQMurj4QbNOieQ+bHphs63c
	GFiUmoX18Y132FsmXn55aiVbeSHrPEOweDj2KVOa5mBMJ2zoVhfKKGo+Y7dKxt1mLqlxqRXXdl8ig
	heZWG58DTdUQ7yMIW2Wk1gGoWgEq94C7HpHkOuFLTbMRfqud/FoMsbgJMPt9wsPo7egMo1c79oNt/
	nIHvg5SXitoBrYeXM8gyuw2g16NrQMrhXu4QRYbZpR6WeM5o6pSxKitLHWbmbhyv07RlAan7goOhw
	Ipm84HTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8ON-00000004NtK-0Gdk;
	Fri, 13 Dec 2024 16:19:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8MT-00000004NeW-0A7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35878A4288B;
	Fri, 13 Dec 2024 16:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56D3C4CED0;
	Fri, 13 Dec 2024 16:17:50 +0000 (UTC)
Date: Fri, 13 Dec 2024 16:17:48 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <Z1xeLCKoSWyn2sko@arm.com>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
 <Z1hU0Ii-Sm9NHnhj@J2N7QTR9R3>
 <20c12aac-193e-43ae-9418-39db1af4ede9@sirena.org.uk>
 <Z1ht7X2LRw34pMJK@J2N7QTR9R3>
 <6d839dfb-0a85-44c5-90cc-2b2426353a5f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d839dfb-0a85-44c5-90cc-2b2426353a5f@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_081753_133862_5D785C6D 
X-CRM114-Status: GOOD (  19.11  )
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

On Tue, Dec 10, 2024 at 04:52:49PM +0000, Mark Brown wrote:
> On Tue, Dec 10, 2024 at 04:35:57PM +0000, Mark Rutland wrote:
> > On Tue, Dec 10, 2024 at 03:44:29PM +0000, Mark Brown wrote:
> > > The spuriousness is arguable, from my point of view it's spurious in
> > > that we don't have the type of the system register we're writing to.
> 
> > All that I'm asking for here is a trivial rewording; make the title say
> > something like:
> 
> Yes, I had already removed the references to spurious and false positive
> locally and changed the unsigned long cast to a __force u64 cast.

I still have a slight preference for treating a sysreg value as an
integer and cast it to pointer when needed rather than using __force.

> > > With map_shadow_stack() it's a bit of an issue with letting users
> > > specify a size but yeah, we could do better there.
> 
> > I don't follow. The only place where size interacts with cap_ptr is when
> > we initialize cap_ptr, and there we're adding size to an integer type:
> 
> > 	cap_ptr = (unsigned long __user *)(addr + size -
> > 					   (cap_offset * sizeof(unsigned long)));
> 
> Ugh, addr is also not a pointer which I'd not noticed but still.

'addr' should stay as long in map_shadow_stack(). This matches mmap(),
mremap(), brk() etc. as they handle address space layout manipulation
(these functions also do not accept tagged pointers). map_shadow_stack()
does write a cap to memory but its primary functionality is not user
buffer access but rather memory layout management.

-- 
Catalin

