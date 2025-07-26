Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWDCpZpUnOOPODd49L0ZnvYxwzJbgJ5GTXPjGdUOSII=; b=djvQa47b3nkzZhdWCuma67IbfB
	gOoi7dxBELJzMegUa8EUBPWBIMRrd5huM6MONYcA9//TCvjvz6r9r4Vv4dVMLRdf/FgMhg0eQB0Wl
	tYSHhQoQ3uLaAkB87KayplD+6pqCEI4cVPfMgJCvM9sJx1cUboXNAFMC4LI79yGABaZT4vL/5mf8U
	nTs7Kfn2EHPXKNWU7Q9w4cquhFlhVwius3DYz8MnfAHM7bnslBnBlVwDQOX+TTs5i/iftADwcdVsh
	l+r4IYHSyPay+tY9UHofa0U7UPHnlQElOKfamS1h5eIRdoVFmKtSoYTUVrn25+nW3uHlnZSxxBXdE
	wG1lFF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSzr-0000000Ayct-16rS;
	Sat, 26 Jul 2025 00:42:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSxP-0000000AySJ-2bN8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 00:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F108A567CE;
	Sat, 26 Jul 2025 00:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8FDC4CEE7;
	Sat, 26 Jul 2025 00:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753490410;
	bh=0ljOxLf3asG8EXlvRRWHYhLY5dkENjRCIl0TEBmEpuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIAwoYcfsZX1JS5swQvuHh4YAx0Dnjek7XHbdZP95vmn5NhVaWu8fz5mXlu5BBIAC
	 x6YOX8sgCFIcwnCJiFrMCZLDejXSr5vsm7Qe4GKcJlMH7O0ky8j3xOIizTdbLij8FA
	 fqeMmkJgU9YDKqv2atpEgKynTwztATUXn+GiIk8Q2Ah/WppIH2agLqoMsvbdPbZwxG
	 CsG0gH/hqJVWGMxmA+DwhKy/2mMFW4VSAwH8mxoJSjrMcDtc6gx50fEcIJbdxST+Hr
	 /xYR7l1GHiIwy1yT/iT1EOHzrYB3/50GYc3b0mqdEu5mIY/9GWugfC635HDgQOBeXc
	 arPS14ZlZY6Cw==
Date: Fri, 25 Jul 2025 17:40:09 -0700
From: Kees Cook <kees@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250723 arm atags_to_fdt.c undefined reference to
 `__sanitizer_cov_stack_depth'
Message-ID: <202507251739.E62B1C95@keescook>
References: <CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com>
 <aINJTDD3je4XJ6VO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aINJTDD3je4XJ6VO@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_174011_720312_68DCD804 
X-CRM114-Status: GOOD (  13.03  )
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

On Fri, Jul 25, 2025 at 10:07:24AM +0100, Russell King (Oracle) wrote:
> On Fri, Jul 25, 2025 at 01:59:02PM +0530, Naresh Kamboju wrote:
> > Regressions noticed while building arm builds with gcc-13 and gcc-8
> > toolchains on the Linux next-20250723 to next-20250725 tags.
> > 
> > First seen on the Linux next-20250723
> > Good: next-20250722
> > Bad:  next-20250723 and next-20250725
> > 
> > Regression Analysis:
> > - New regression? Yes
> > - Reproducibility? Yes
> > 
> > ## Build regressions
> > * arm, build
> >   - gcc-13-lkftconfig-hardening
> >   - gcc-8-lkftconfig-hardening
> > 
> > Build regression: next-20250723 arm atags_to_fdt.c undefined reference
> > to `__sanitizer_cov_stack_depth'
> 
> "cov" suggests "coverty", and that the symbol is not available in the
> kernel suggests that coverty isn't supported.

This is the coverage sanitizer and related to my changes. Sorry! This
didn't show up in my build testing, I'll reproduce it and get it fixed.

-- 
Kees Cook

