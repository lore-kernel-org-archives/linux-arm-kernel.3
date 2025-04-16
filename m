Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A3BC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 23:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuEJA7KTly/UFGLH22yPxMHjZY7rFvEX0PP6e07PxfU=; b=28wt91fTZPKQ/6Pc0tRFb+Brtg
	PIDsMVIbTy50OEs8HZxxSiVsJZ5NEGu9/OswCmITwaTq/TPndF6KAHPHFGulhYVntzF6BZOznpGYj
	w4NUWLegGEaTCqX6req61FINVadxEOWp5QhBeZ1qfFWfLp5M+24yYmftmaVabnjeTz+hzE8tCTeRx
	Bh0FQV7eK41BDdsYvlv/yxY+CWLlgepBtv9jXdY7i05C96O3vJ3wbZnPYVpztI5HOARXgcxx+imiS
	K8W0u6LY6rAbkjVfy9RB41a3kUktFEk9NCjX/x4TBwmFjy2MbsnnybdAr6m+mEU+APgBECml4OmA/
	qDEs2o4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Bkm-0000000B6bo-3fOC;
	Wed, 16 Apr 2025 23:01:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Be3-0000000B5hJ-3oCg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 22:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15BA168429;
	Wed, 16 Apr 2025 22:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F256C4CEE2;
	Wed, 16 Apr 2025 22:54:10 +0000 (UTC)
Date: Wed, 16 Apr 2025 23:54:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ross Stutterheim <ross.sweng@gmail.com>,
	Ross Stutterheim <ross.stutterheim@garmin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Linus Walleij <linus.walleij@linaro.org>, rppt@kernel.org
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <aAA1EHMzoHOTpv-l@arm.com>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
 <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
 <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
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

On Wed, Apr 16, 2025 at 04:48:06PM +0100, Russell King wrote:
> On Wed, Apr 16, 2025 at 08:57:09AM -0500, Ross Stutterheim wrote:
> > On 4/16/25 05:09, Catalin Marinas wrote:
> > > > Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> > > > Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> > > 
> > > I think you could also add:
> > > 
> > > Cc: <stable@vger.kernel.org>
> > Done. I also added some other Cc: entries on V3 along with Reviewed-by:
> > lines . I'm new here, so I'm not sure I've used those 100% properly.
> > 
> > > Not sure how Russell picks patches up these days (I used to send them to
> > > the patch system -
> > > https://www.arm.linux.org.uk/developer/patches/info.php).
> > > 
> > > It might be simpler with git send-email (that's the alias I had):
> > > 
> > >    git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"
> > > 
> > Thanks. I created an account there and submitted V3 through the web
> > interface (to avoid my SMTP server appending more stuff on the end).
> 
> Thanks, seems all good, applied and pushed out. I'll send it to Linus
> tomorrow as it's certainly a serious regression.
> 
> I'm surprised Mike hasn't responded...

Ah, I think he joined Microsoft. Adding his kernel.org address.

-- 
Catalin

