Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8258CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDTEd3/svWnVVWR0WeE+YOf1jB5nBNhMgBXhXpRKk9Q=; b=D7UH2USdQvC8fDyTDxwn2mBTte
	nVYfbo/jxO1fC/7WVToIgfp4EmzBfEZ59dJg4fLty6JxBmJSE8Q2ghsuVRj4SIjD12Ji+0WAUkGhv
	SqqDXQ61EHxtAxty1jd/0hMWi18ZUv88mz1DEW3AyZBzoV//TA8zXqk13LzNyNTeTV++H/TpMVtYQ
	gUyecgf2AjrZV7r8eJM7S5opgQuZg5Rb7ewbNLW7sCQYFWUjGsCY0RcvQWFv0ESLC/cfhMSeZOGtU
	Fa14dVaGYWhqTFEBGqozFSvxGe19/GlECZFUm1hxA15X2Uu2RqcDwyihuRXk+GMOE6Hrk1NEzpAnQ
	uqSOoeOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn7H-00000001D8V-0q5K;
	Thu, 12 Dec 2024 17:36:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmhe-000000017eC-189A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 17:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B4CA5C66E1;
	Thu, 12 Dec 2024 17:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B295C4CECE;
	Thu, 12 Dec 2024 17:10:16 +0000 (UTC)
Date: Thu, 12 Dec 2024 17:10:14 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, Dave.Martin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is
 recoverable
Message-ID: <Z1sY9tIsAZ84W93-@arm.com>
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
 <5db7f7a0-1d3c-4bbd-ad2b-124bf54f49ef@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5db7f7a0-1d3c-4bbd-ad2b-124bf54f49ef@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_091018_367861_BE31D326 
X-CRM114-Status: GOOD (  11.19  )
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

On Thu, Dec 12, 2024 at 04:47:46PM +0000, Mark Brown wrote:
> On Tue, Dec 10, 2024 at 04:09:40PM +0000, Kevin Brodsky wrote:
> > While at it, also take care of copy_siginfo_to_user(): since it may
> > fail, we shouldn't be calling it after setup_return() either. Call
> > it before setup_return() instead, and move the setting of X1/X2
> > inside setup_return() where it belongs (after the "point of no
> > failure").
> 
> > Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")
> 
> Presumably we also need a Fixes for whatever introduced the above copy.

Hmm, it was like this from the beginning. If we are to do a cc stable to
the oldest maintained LTS, I'd rather have a separate patch for
copy_siginfo_to_user(), it doesn't make much sense to backport a GCS
patch to early kernels.

-- 
Catalin

