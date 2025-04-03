Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D30C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 01:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrPdZYba5S7m5juygBtsgKN6MYXblzJJ72aZaWmxDgg=; b=slO/hR4fO9ZP2rs/wXV4WnrBEx
	amg3zQRBNiyuB9ScGPbLEixoQqFViS9WNn4UoZAZDzX/EnNJHEL2/2FaGVtcPEr6e2wG4xh6Vxp0i
	J4j50Wb2cPfkZVDiwdpJ446u6pk+CXXoVuD16uOzPQzbPEpeL5RlF4d27kBtzNLYFMI5/m8tBFMKs
	QFmuXPFC4ev+44CrCEWj/B8cjsYwoC9KhRSmhk4vj14FodmDCD6ChALwkNXFW9xGejhjn4vk3HEPM
	OQmNlyHXBt1JXaX4soiv9GrlLCBaBiYAFd91iZfOhY+vwZEjXIlY47abIODf3CtMa4irbyR122MCe
	VhaeAuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u09G8-00000007XKf-36zq;
	Thu, 03 Apr 2025 01:20:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u09EO-00000007XEz-0RBA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 01:18:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57DD760007;
	Thu,  3 Apr 2025 01:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE0C4CEDD;
	Thu,  3 Apr 2025 01:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743643134;
	bh=+wbkhxA7fgD+jDjAsUlqMd94lyd4waCkfNu2fzgAVx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQZYXtlS1kTONy4KCRgddTQItMECmZ40kJOUa9mZxQD3DJoX6fnX57B7zBNBglio1
	 f2+8n2S/bZY2oIFq4Gd6nfsjqp46LwIpmT5HGCZV0qBfMuXHtC62jkFiibVkZoxL++
	 FiLNfg2aU/q2S3AL4WRCjRdrR/eV1qg8QIpjwTE5Jtw/tE79aTvHkKqxrSjtRAF7Co
	 n1Q1uWRp8Qr3livcCEB9vxE1AWrjGSTHkItxWr3oDj1i6gFY/yrl5hDp1whcEV04Vq
	 UT9sccF/J1Gdih52OAy6PM1mu1PFNzh6t8GW4SeS0LDE6V4xHyYDPzILW2M+sd4F9K
	 omLDifo9MEbKw==
Date: Wed, 2 Apr 2025 18:18:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
Message-ID: <20250403011849.GA3138383@ax162>
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
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

On Wed, Apr 02, 2025 at 06:19:19PM +0530, Naresh Kamboju wrote:
> Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
> the lto-thing, hardening and lto-full config boot failed with toolchain
> clang-nightly on the mainline master branch with no console output.
> 
> First seen on the v6.14-12245-g91e5bfe317d8
>  Good: v6.14-11270-g08733088b566
>  Bad: v6.14-12245-g91e5bfe317d8
> 
> Regressions found on rk3399-rock-pi-4b:
>   - boot/clang-nightly-lkftconfig-kselftest
>   - boot/clang-nightly-lkftconfig-lto-thing
>   - boot/clang-nightly-lkftconfig-hardening
>   - boot/clang-nightly-lkftconfig-lto-full
> 
> Regressions found on dragonboard-410c:
>   - boot/clang-nightly-lkftconfig-lto-thing
>   - boot/clang-nightly-lkftconfig-lto-full
>   - boot/clang-nightly-lkftconfig-hardening
> 
> Regressions found on dragonboard-845c:
>   - boot/clang-nightly-lkftconfig-hardening
>   - boot/clang-nightly-lkftconfig-lto-thing
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
> 
> Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
> no console output
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Boot log
> Starting kernel
> ...
> <No console output>
> 
> 
> ## Source
> * Kernel version: 6.14.0
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> * Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> * Git describe: v6.14-12245-g91e5bfe317d8
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
> * Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboard-845c)
> * Toolchains: clang-nightly (Debian clang version 21.0.0 )

The version string for the toolchain seems to be slightly truncated but
from the configuration it is:

  Debian clang version 21.0.0 (++20250330105456+3b3d1a5c2614-1~exp1~20250330225508.1357)

which can be parsed with our parse-debian-clang.py [1] to get more
information:

  $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++20250330105456+3b3d1a5c2614-1~exp1~20250330225508.1357)'
  clang checkout date: 2025-03-30 10:54 UTC (3 days, 14:17:24.134272 ago)
  clang revision: 3b3d1a5c2614
  clang revision link: https://github.com/llvm/llvm-project/commit/3b3d1a5c2614

Our CI is using a slightly newer version:

  $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)'
  clang checkout date: 2025-04-01 11:25 UTC (1 day, 13:49:39.394836 ago)
  clang revision: 290d7b82cb5d
  clang revision link: https://github.com/llvm/llvm-project/commit/290d7b82cb5d

Can you see if it is reproducible with that revision? For what it's
worth, both of the arm64 boxes I have can boot a ThinLTO kernel compiled
with a version of LLVM @ 749535ba2808e133682074f712ac6829335f8875, so it
could be something that was broken for a little bit but Debian happened
to sync before the fix was committed.

[1]: https://github.com/ClangBuiltLinux/continuous-integration2/blob/fe4844afc1be91d469fc162c8a179f23fafb9384/scripts/parse-debian-clang.py

Cheers,
Nathan

