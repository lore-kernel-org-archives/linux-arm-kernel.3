Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2208E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yg+xO+DMhsVqWRgNV/Whh0UZbOdYFyNRKM0eEisX/MU=; b=CWwyG8qasMFTRaiKDUMrlSRqQB
	K84/sicRtvIc0Pg2OguyMrAs78vykLQsQvgTDW5EOXa7nMorheTCB3sEzLIIFpE87DEc5jqM+vWVI
	IOQyN3ROvPSJla6QMEc8LxzRVbIEZUCgtP0UDYRZ16nKCb12oz8ATvDZCoESi8B0WUDTH8xCiKX2/
	rGptaDq3uIgUM9QXbbGLF1kc0pkD5bmddzU3zOQPwWdrIWdGZ6HlBi6ompr9dzTYuON2WL4tKCEKF
	W/JcOX5012635sCMs01XUJ/kyyzKH1t+HHxKVAzDMiL2LBB/sGw6LmvHJDtpiGVmtRca8V86buZnh
	vecSWR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnN4-00000001HjU-48t5;
	Thu, 12 Dec 2024 17:53:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnLz-00000001HWA-0WXc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 17:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3067BA429AC;
	Thu, 12 Dec 2024 17:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF81C4CED3;
	Thu, 12 Dec 2024 17:51:56 +0000 (UTC)
Date: Thu, 12 Dec 2024 17:51:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, Dave.Martin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is
 recoverable
Message-ID: <Z1siulo_PKdI3xC_@arm.com>
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
 <5db7f7a0-1d3c-4bbd-ad2b-124bf54f49ef@sirena.org.uk>
 <Z1sY9tIsAZ84W93-@arm.com>
 <a70cd007-a2c8-477f-972e-fa1e9c362604@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a70cd007-a2c8-477f-972e-fa1e9c362604@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_095159_229488_35656435 
X-CRM114-Status: GOOD (  15.79  )
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

On Thu, Dec 12, 2024 at 05:26:47PM +0000, Mark Brown wrote:
> On Thu, Dec 12, 2024 at 05:10:14PM +0000, Catalin Marinas wrote:
> > On Thu, Dec 12, 2024 at 04:47:46PM +0000, Mark Brown wrote:
> > > > Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")
> > > 
> > > Presumably we also need a Fixes for whatever introduced the above copy.
> > 
> > Hmm, it was like this from the beginning. If we are to do a cc stable to
> > the oldest maintained LTS, I'd rather have a separate patch for
> > copy_siginfo_to_user(), it doesn't make much sense to backport a GCS
> > patch to early kernels.
> 
> Hrm, good point about it triggering backports.  I'm not sure it's worth
> doing that TBH.

I had the same thoughts. I think this was mostly triggered by the
POR_EL0 changes when Will raised the point that the kernel might return
with a more privileged value in this sysreg.

-- 
Catalin

