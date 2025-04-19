Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F70C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxmoZd8tuxVE49iYjKSAq5OITTMUkOXotBj4O53s0Vk=; b=e18eab+P9xdFTPOcklGkQSR2l8
	7P7CGaiwjK5483ibPiLuOQ36ESFtLoP+FfUKZ7aYG2+yLgkGOz2EJtd4D+8qbD7CTOSh/QyEFHu85
	hFf3vafa8axHX21rx+I6YPqoa4zcJ0u+eqwWf5qlYu6Qo0uns1sL92CFA5SBqfbEyOt26oE/ARCQv
	jN/hlk2SiYYm4tctbEN62U5X4H20U6YWYObAKcedTca0DIzRpxxZSyNArjTCqyrRyzv8jnL111Qf0
	Jiyveb78GuuvR+t6PHQLPIe8TmnYeqjWy5ONFmP4D/K7jYHOwvy4V37W+kOGydk70TNkWkxc8B+2/
	PsxiOymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u62Hh-00000000xqo-2lcO;
	Sat, 19 Apr 2025 07:06:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u62Fm-00000000xk1-3Vga
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 07:04:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04CFC5C046B;
	Sat, 19 Apr 2025 07:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E642EC4CEE7;
	Sat, 19 Apr 2025 07:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745046280;
	bh=6nJRP5dGfMS/bA/MMLA00BdyVnpxROp+uQSPSKS5EPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDWsZxoBS7ca6U3nIhX18IAbq2/5Hh9njLLAseXAOWRi0Oa+VdpjIzPek/nvV34IQ
	 aTtcDUJ7JdszDFCCczHQy3ANFaYSsi6+zkoxCoWg9kG8WnOh0E252jNjpQw7jxkKaW
	 M6YrWSo7bxWV1gMpkHdRHFPsi3Shl6nf3Jysrvrm2Qmqpjud6Jj/yMgXwqxpAk/ehS
	 RhonrsXe+D8vylx35w+0bDOpBNAPwFW1R8vqLk9moL3iMRBX1BdJWb67DXaMjXsz+a
	 vEuf4umWbpa6HcMe0/SqCneGusokl7XlUiv81xP8z3hNx6W+AzvYPPwoemkikvwj/L
	 T080eoZjTWN5w==
Date: Sat, 19 Apr 2025 10:04:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ross Stutterheim <ross.sweng@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ross Stutterheim <ross.stutterheim@garmin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <aANLAonc_0X0PnK9@kernel.org>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
 <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
 <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_000442_938257_BF8688D5 
X-CRM114-Status: GOOD (  18.62  )
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

On Wed, Apr 16, 2025 at 04:48:06PM +0100, Russell King (Oracle) wrote:
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

Passover vacation :)
 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

-- 
Sincerely yours,
Mike.

