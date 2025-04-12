Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953CCC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 01:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAOByrONyFXE8RLmAxCRdBlUWUhuicRHMMqe6Btlsis=; b=vxJT9x/nWKyRSjPo9Jnn+IqpvA
	Y95jgmztrJ1u7uKWkbUzBT1zivMpt0QT30K1I0B8BwnXm6Kt3B81K3qBB8yz3h0btB1yFgkhwsa4h
	ojIaB27wDJjqW8r843PtV+US9mzj4ccrPAf51+4KiOW2cKE7BjoayZBC3cBmLD7SkyPPRrUgxXUPI
	jWVRFkY+ytzA+UrYeM5hgHLNsanNVaOGjqYusriyXXWPeVZYnPZM3MJ+9L9/EHIVrFZtJepTVnzpz
	edKhkCjVhpCadZDzUmbHeOHMOFHT4lGtC7MpKlBrimCIFMVKVMkkZ2+pbOSZ6vfcujFo/f6dhyN9r
	3vdhkXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Pxn-0000000FG5k-09uy;
	Sat, 12 Apr 2025 01:47:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Pvy-0000000FG0G-3OB6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 01:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77F27436DC;
	Sat, 12 Apr 2025 01:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E420EC4CEE2;
	Sat, 12 Apr 2025 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744422324;
	bh=InI5YIvfIbmAEiSsiYv9SXaP67nBUB72BNS5xoI3aAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aH+8Ve3afihmbx2mG3X6H3vD1yYcxfvJMEbeZy3r6GNURDIawp3cGTwMPoLAOMuTg
	 1YT/qJ5wBUGByYhU3Oq2i6i5mv0T5+dKl5WLcOUJWHirosE4yxpJNi7r1Pc+4SGUOs
	 EtX3OnwWfkzlPA2IexZvxSPgrp5xmiZWOOK+fsPFraHP/TsHwfHkgqla/XXpBSeDHh
	 d96HwnBB//WT0ut72I5mXESz76FZmw/PayPGVWaCoGWz3Vm9xUalZisllvVixG6bNX
	 RMh5o5t1sbvg+WgE4+sSWcjgz4KMPFFj80RDBd8BL9+uUbjju+zyz/c0e5VpKb4fRJ
	 3uUQJsWi7bNSg==
Date: Fri, 11 Apr 2025 20:45:19 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
Message-ID: <20250412014519.GA1905363@ax162>
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162>
 <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
 <20250405002757.GA836042@ax162>
 <CA+G9fYv=jUunRgUs=ROptP4p5DNxUuUHxYsnWaxUUXbiwdszsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYv=jUunRgUs=ROptP4p5DNxUuUHxYsnWaxUUXbiwdszsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_184526_867031_DF2680AF 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Hi Naresh,

On Fri, Apr 11, 2025 at 12:49:17AM +0530, Naresh Kamboju wrote:
> clang-nightly boot failed with stable-rc 6.12, 6.13 and 6.14 and
> mainline and next on following devices and virtual platforms.
> - dragonboard-410c
> - dragonboard-845c
> - rk3399-rock-pi-4b
> - Juno-r2
> - e850-96
> - FVP (Fast Models Fixed Virtual Platforms)
> 
> Boot Test links,
> - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.23-2-g8e0839d16957/testrun/28076019/suite/boot/test/clang-nightly-lkftconfig-kselftest/history/
> - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.23-2-g8e0839d16957/testrun/28076006/suite/boot/test/clang-nightly-lkftconfig-lto-thing/history/
> -  https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.23-2-g8e0839d16957/testrun/28076009/suite/boot/test/clang-nightly-lkftconfig-hardening/history/

Thanks again for confirming. As this is reproducible with the FVP, I was
able to cobble together how to boot it locally with tuxrun and your
configuration (which felt rather convoluted to get from the website
above) and use that to bisect LLVM:

https://github.com/ClangBuiltLinux/linux/issues/2082

I will continue to look into this next week.

Cheers,
Nathan

