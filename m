Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C37C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In8xSVodpg/2gOBaNjKny0YtfnUlx40SwXT9GJk2ZlQ=; b=liPSmnfcF8EdQ0IaB3fwMuvUkJ
	3VWApxc5s8g5VtqUHHNYmosSlq45egRy7C9IHXipn1xQ2vFyCTH8h7Pn0tys/2ogAoLHWRFikVGYM
	0TaskViboa4wop6+Nuhkn6kmM3yDY88IfmVastwHr9fQ5Hyf4ppkLEbmIphiS0Vz/0t0vN/LzXieS
	vxsGC0fZ5urX++ZLq54MT6ltZ25mWS/8NMzSkc2waOMn6a1z+YzRbG+o6BGG9b72Ln2R2Xe+JV8+9
	HmSACJruGROW+G0RQG/8up+gn4X6VF18zXuRewCMGF1luRDgC0KkAvzwwib5xG6C6RNjCNK177MIa
	2zAXbcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1QC-00000005Nt6-0AKi;
	Tue, 24 Jun 2025 11:02:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0qg-00000005Ijb-2nbM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DA9CA50D08;
	Tue, 24 Jun 2025 10:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD138C4CEE3;
	Tue, 24 Jun 2025 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750760753;
	bh=vDay8J81ygLKIuI2jhCI+PZX+/fJvYJhHaZQbh7hB0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OY8yIRNrKURFBHI24oxv/Y4MkVwLHUwknjWnTwnY+btkJL+9yAOKyPnB7xO8zTsA8
	 lCyPMIfQWmwJO0qKXxMS14x4JsMNhRXbhy1hJnKd4OhfhhLr9+URrADU3M81OyunjA
	 WOJV4QVGRSVgI0LWOFjiPciBBixnH6IIQGZSvRhI=
Date: Tue, 24 Jun 2025 11:25:49 +0100
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
Message-ID: <2025062425-waggle-jaybird-ef83@gregkh>
References: <20250623130611.896514667@linuxfoundation.org>
 <CA+G9fYvpJjhNDS1Knh0YLeZSXawx-F4LPM-0fMrPiVkyE=yjFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvpJjhNDS1Knh0YLeZSXawx-F4LPM-0fMrPiVkyE=yjFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032554_838855_3D3F561B 
X-CRM114-Status: GOOD (  23.88  )
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

On Tue, Jun 24, 2025 at 12:46:15AM +0530, Naresh Kamboju wrote:
> On Mon, 23 Jun 2025 at 18:40, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.4.295 release.
> > There are 222 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 25 Jun 2025 13:05:50 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.295-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> Regressions on arm defconfig builds with gcc-12 and clang failed on
> the Linux stable-rc 5.4.295-rc1.
> 
> Regressions found on arm
> * arm, build
>   - clang-20-axm55xx_defconfig
>   - clang-20-defconfig
>   - clang-20-lkftconfig
>   - clang-20-lkftconfig-no-kselftest-frag
>   - clang-nightly-axm55xx_defconfig
>   - clang-nightly-defconfig
>   - clang-nightly-lkftconfig
>   - gcc-12-axm55xx_defconfig
>   - gcc-12-defconfig
>   - gcc-12-lkftconfig
>   - gcc-12-lkftconfig-debug
>   - gcc-12-lkftconfig-kasan
>   - gcc-12-lkftconfig-kunit
>   - gcc-12-lkftconfig-libgpiod
>   - gcc-12-lkftconfig-no-kselftest-frag
>   - gcc-12-lkftconfig-perf
>   - gcc-12-lkftconfig-rcutorture
>   - gcc-8-axm55xx_defconfig
>   - gcc-8-defconfig
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
> 
> Build regression: stable-rc 5.4.295-rc1 arm kvm init.S Error selected
> processor does not support `eret' in ARM mode
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> 
> ## Build errors
> arch/arm/kvm/init.S: Assembler messages:
> arch/arm/kvm/init.S:109: Error: selected processor does not support
> `eret' in ARM mode
> arch/arm/kvm/init.S:116: Error: Banked registers are not available
> with this architecture. -- `msr ELR_hyp,r1'
> arch/arm/kvm/init.S:145: Error: selected processor does not support
> `eret' in ARM mode
> arch/arm/kvm/init.S:149: Error: selected processor does not support
> `eret' in ARM mode
> make[2]: *** [scripts/Makefile.build:345: arch/arm/kvm/init.o] Error 1
> 
> and
> /tmp/cc0RDxs9.s: Assembler messages:
> /tmp/cc0RDxs9.s:45: Error: selected processor does not support `smc
> #0' in ARM mode
> /tmp/cc0RDxs9.s:94: Error: selected processor does not support `smc
> #0' in ARM mode
> /tmp/cc0RDxs9.s:160: Error: selected processor does not support `smc
> #0' in ARM mode
> /tmp/cc0RDxs9.s:296: Error: selected processor does not support `smc
> #0' in ARM mode
> make[3]: *** [/builds/linux/scripts/Makefile.build:262:
> drivers/firmware/qcom_scm-32.o] Error 1

That's odd, both clang and gcc don't like this?  Any chance you can do
'git bisect' to track down the offending commit?

thanks,

greg k-h

