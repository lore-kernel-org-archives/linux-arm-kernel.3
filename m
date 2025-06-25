Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DCDC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRqSf//2MxMV1GTSYhpVupWDyW+gdgJV8OAoAEYQMPw=; b=OCGmOURPV6w34xhJmGBMMD1ySp
	OrXAxbZ5eSQtpcVBawGu0fG8vDm8lGReM4ztyRode2dh0rJ9qg67MlrploZ00K9VoFc+GZ78/YPVB
	Q9u8bRqFhkxDM2KLO/GsxjqNkuXM4f37ObShtuERwu7/aFtfY7lOtdSZ1LMlxjbwyKvvUVF3cjRIC
	psp6K3EubDZK8o3lxGoFoGsHaJLKUicT2NXG6ijk6o1vl1l/hNASgmhNVvOA4NSQP8YFh6CHc9Yy2
	NKTs3oJpyL6mh2ttmTWXn/LsDRBdxKB1Y5CqhBEdjlaXgPkUKK/+aNf1tkuxgCEkCZ0h57F/JOw9D
	J6KKnT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOvp-00000008a3u-23I7;
	Wed, 25 Jun 2025 12:08:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULrq-0000000829K-3fom
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 08:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B96EA51C2A;
	Wed, 25 Jun 2025 08:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F853C4CEF1;
	Wed, 25 Jun 2025 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750841549;
	bh=NEjOO6MyFXxkn7NerpncmY9/qLiFsH/Y4Jb/xiTGkOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+ZBmcW72ckUTCHtrRqXpKmpnjw7iEoZCAZOrCPKTA2vJ7UfB69HatqPmcGy+u9ip
	 On1xNK9o/S8Yd29DDbgfG6XHgHxaonAzEqr5rEMfusAl4OoQY6IGSJ+4QX7OyZfct2
	 ZUSnPvbl2T2EphXFKuij6jOVnIkCdxLX3ih/tSAI=
Date: Wed, 25 Jun 2025 09:52:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	kvmarm@lists.cs.columbia.edu, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Julien Thierry <julien.thierry.kdev@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 5.4 000/222] 5.4.295-rc1 review
Message-ID: <2025062508-vertical-rewrite-4bce@gregkh>
References: <20250623130611.896514667@linuxfoundation.org>
 <CA+G9fYvpJjhNDS1Knh0YLeZSXawx-F4LPM-0fMrPiVkyE=yjFw@mail.gmail.com>
 <2025062425-waggle-jaybird-ef83@gregkh>
 <CA+G9fYvNTO2kObFG9RcOOAkGrRa7rgTw+5P3gmbfzuodVj6owQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvNTO2kObFG9RcOOAkGrRa7rgTw+5P3gmbfzuodVj6owQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_015231_052384_133CCAC7 
X-CRM114-Status: GOOD (  28.57  )
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

On Wed, Jun 25, 2025 at 10:03:22AM +0530, Naresh Kamboju wrote:
> On Tue, 24 Jun 2025 at 15:55, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jun 24, 2025 at 12:46:15AM +0530, Naresh Kamboju wrote:
> > > On Mon, 23 Jun 2025 at 18:40, Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > This is the start of the stable review cycle for the 5.4.295 release.
> > > > There are 222 patches in this series, all will be posted as a response
> > > > to this one.  If anyone has any issues with these being applied, please
> > > > let me know.
> > > >
> > > > Responses should be made by Wed, 25 Jun 2025 13:05:50 +0000.
> > > > Anything received after that time might be too late.
> > > >
> > > > The whole patch series can be found in one patch at:
> > > >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.295-rc1.gz
> > > > or in the git tree and branch at:
> > > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> > > > and the diffstat can be found below.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Regressions on arm defconfig builds with gcc-12 and clang failed on
> > > the Linux stable-rc 5.4.295-rc1.
> > >
> > > Regressions found on arm
> > > * arm, build
> > >   - clang-20-axm55xx_defconfig
> > >   - clang-20-defconfig
> > >   - clang-20-lkftconfig
> > >   - clang-20-lkftconfig-no-kselftest-frag
> > >   - clang-nightly-axm55xx_defconfig
> > >   - clang-nightly-defconfig
> > >   - clang-nightly-lkftconfig
> > >   - gcc-12-axm55xx_defconfig
> > >   - gcc-12-defconfig
> > >   - gcc-12-lkftconfig
> > >   - gcc-12-lkftconfig-debug
> > >   - gcc-12-lkftconfig-kasan
> > >   - gcc-12-lkftconfig-kunit
> > >   - gcc-12-lkftconfig-libgpiod
> > >   - gcc-12-lkftconfig-no-kselftest-frag
> > >   - gcc-12-lkftconfig-perf
> > >   - gcc-12-lkftconfig-rcutorture
> > >   - gcc-8-axm55xx_defconfig
> > >   - gcc-8-defconfig
> > >
> > > Regression Analysis:
> > >  - New regression? Yes
> > >  - Reproducibility? Yes
> > >
> > > Build regression: stable-rc 5.4.295-rc1 arm kvm init.S Error selected
> > > processor does not support `eret' in ARM mode
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > >
> > > ## Build errors
> > > arch/arm/kvm/init.S: Assembler messages:
> > > arch/arm/kvm/init.S:109: Error: selected processor does not support
> > > `eret' in ARM mode
> > > arch/arm/kvm/init.S:116: Error: Banked registers are not available
> > > with this architecture. -- `msr ELR_hyp,r1'
> > > arch/arm/kvm/init.S:145: Error: selected processor does not support
> > > `eret' in ARM mode
> > > arch/arm/kvm/init.S:149: Error: selected processor does not support
> > > `eret' in ARM mode
> > > make[2]: *** [scripts/Makefile.build:345: arch/arm/kvm/init.o] Error 1
> > >
> > > and
> > > /tmp/cc0RDxs9.s: Assembler messages:
> > > /tmp/cc0RDxs9.s:45: Error: selected processor does not support `smc
> > > #0' in ARM mode
> > > /tmp/cc0RDxs9.s:94: Error: selected processor does not support `smc
> > > #0' in ARM mode
> > > /tmp/cc0RDxs9.s:160: Error: selected processor does not support `smc
> > > #0' in ARM mode
> > > /tmp/cc0RDxs9.s:296: Error: selected processor does not support `smc
> > > #0' in ARM mode
> > > make[3]: *** [/builds/linux/scripts/Makefile.build:262:
> > > drivers/firmware/qcom_scm-32.o] Error 1
> >
> > That's odd, both clang and gcc don't like this?  Any chance you can do
> > 'git bisect' to track down the offending commit?
> 
> The git bisection pointing to,
> 
>   kbuild: Update assembler calls to use proper flags and language target
>   commit d5c8d6e0fa61401a729e9eb6a9c7077b2d3aebb0 upstream.

Thanks for that,  I'll go drop all of the kbuild patches that Nathan
submitted here and push out a -rc2

greg k-h

