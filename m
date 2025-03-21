Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0FDC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjbbUlO+lFrQhVSdKJY1Qq0t6HZ4De9L7Y5VLIlJUik=; b=Zd5LU2rbNlIecH05uey2ZKKgX4
	OUt1woH3n9haGgfY/1K9nP25lhWoqYb5oFwKnrWPSlHzbReUOeq6QKenIGKqcwPJN0WaX/kM9CGFV
	LWYYURWUBV0Rjg5ofjrWmJY/ZKq1Ly3O+d0eKR5K1+rq6V3/ClmNorc/iNvEID1vOHakefzY2rjoZ
	sUVz4oXztSCxADxmalqDl+8He5Nr3NWp7lNWVWmzXxE/P1lbqOwuVINRJp6K0eaqjat0o1EfIeScz
	yU3KyD33eh6OAwQ3tJH2sYLc2xuSnCJcpejZOdixbrxhg7cdDZU6PPn0qeTOAmBrKkpEkrAUuuSkM
	EoYQH1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbyC-0000000Epyn-0iNu;
	Fri, 21 Mar 2025 12:59:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbwV-0000000EpkZ-2BKr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 12:57:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 408B5106F;
	Fri, 21 Mar 2025 05:57:50 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC44A3F63F;
	Fri, 21 Mar 2025 05:57:40 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:57:32 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, open list
 <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.linux.dev, Anshuman
 Khandual <anshuman.khandual@arm.com>, Rob Herring <robh@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Aishwarya TCV <aishwarya.tcv@arm.com>, Anders Roxell
 <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>
Subject: Re: Fast model boot failure with Linux next-20250312
Message-ID: <20250321125732.6def5eca@donnerap.manchester.arm.com>
In-Reply-To: <CA+G9fYuw_jXCz07Dsk46QXQr3+y5-NfkC30ZNh+XmyeWgibQhA@mail.gmail.com>
References: <CA+G9fYvPu+MQKhYyPZSSDpAn-zhRGmeHQ8hJksT_cdDdxfbB-g@mail.gmail.com>
	<Z9ra3I2axii2HRVb@J2N7QTR9R3>
	<CA+G9fYuw_jXCz07Dsk46QXQr3+y5-NfkC30ZNh+XmyeWgibQhA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_055743_650923_272B2139 
X-CRM114-Status: GOOD (  23.40  )
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

On Thu, 20 Mar 2025 16:03:32 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

Hi,

> On Wed, 19 Mar 2025 at 20:25, Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Wed, Mar 19, 2025 at 08:07:47PM +0530, Naresh Kamboju wrote:  
> > > Regressions on the arm64 Fast Model (FVP-AEMvA) caused boot failures starting
> > > with Linux next-20250312 and persisting through next-20250319.
> > >
> > > First seen on the next-20250312
> > >  Good: next-20250311
> > >  Bad:  next-20250312 .. next-20250319
> > >
> > > Regressions found on FVP:
> > >  - boot
> > >
> > > Regression Analysis:
> > >  - New regression? Yes
> > >  - Reproducible? Yes
> > >
> > > Boot regression: Fast model boot failure with Linux next-20250312
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > Anders bisected this to this commit id,
> > >
> > > # first bad commit:
> > >   [858c7bfcb35e1100b58bb63c9f562d86e09418d9]
> > >   arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
> > >
> > > NOTE:
> > >   LKFT is currently running FVP Fast Models version 11.24.
> > >   Planned upgrade to the Fast Models version 11.28 in this sprint.  
> >
> > What firmware (and version therof) are you running within the model?  
> 
> Fast Models [11.24.11 (Nov 29 2023)]
> Booting Trusted Firmware
> BL1: v2.9(release):v2.9.0
> BL2: v2.9(release):v2.9.0
> BL31: v2.9(release):v2.9.0
> UEFI firmware (version  built at 22:31:25 on May 26 2023)
> UEFI v2.70 (EDK II, 0x00010000)
> 
> We need to update the firmware version at our end.

Oh yes, please, v2.9.0 is quite old by now, especially for a moving target
like the FVP, and when enabling new architecture features.
FWIW, after Anshuman pointed me the problem, I made a patch for TF-A to
enable PMUv3p9:
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/35884
You would need that for this Linux commit here to work.
FEAT_FGT2 should be enabled already by default for the FVP.

Please feel free to leave a comment at the TF-A gerrit, stating that you
need the patch, that should accelerate the upstream process.

Cheers,
Andre

> > For example, if the EL3 firmware lacks support for FEAT_FGT2 or
> > FEAT_PMUv3p9, the kernel will trap to EL3 early during boot and die.
> >
> > It would be really helpful if you could capture that in the report in
> > future.
> >
> > Mark.
> >  
> > >
> > > ## Boot log
> > >   <No crash log on the console>
> > >
> > > ## Source
> > > * Kernel version: 6.14.0-rc7
> > > * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > * Git sha: ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
> > > * Git describe: next-20250319
> > > * Project details:
> > > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319
> > > * DUT: arm64 Fast Model (FVP-AEMvA)
> > > * Toolchains: gcc-13 and clang-20
> > >
> > > ## Build
> > > * Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/log
> > > * Build history:
> > > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675685/suite/boot/test/gcc-13-lkftconfig/history/
> > > * Build details:
> > > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/
> > > * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/
> > > * Kernel config:
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/config
> > >
> > > --
> > > Linaro LKFT
> > > https://lkft.linaro.org
> > >  
> 
> - Naresh
> 


