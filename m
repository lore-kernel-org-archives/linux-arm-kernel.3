Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB59C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz26gRCVrDuU7/m86QzTM8DmM+9NqccLuC7myTPEUhI=; b=QQWC0fbqOnsoM6XRLAYQM6obD7
	u+jy66ROTHpcOgJEAMwnq1BpMnwMlwg32awmRFSBDLbore4owsYCKP0I/RCutg1vKaq1iEOrqct1Z
	aV2MMvR4usSP89aWFnKDBX5EdkDOvM78XJ40NWZVAzaIVB/fUSu0Ys/hbyz2nM4jdBMcBH+6j1Nxl
	WocG7xx8ZHMRYeWIBkdZopVvptAb6Q2GXvjkQm/qwoUmSdQYnPkBLpEqbvY6PzXZ9abZvrs0ecStj
	BofbBcUszUHNAIoZOKLbaSQynGRV2ANbOC/667ezTctzrRJKRjC4Lg2xow0FYvSa+nyX+FtJ7iUvT
	q4wlZORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuuu-00000009IDV-2yVe;
	Wed, 19 Mar 2025 15:01:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuupO-00000009GtC-03rT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:55:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66DB0106F;
	Wed, 19 Mar 2025 07:55:37 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FD2D3F694;
	Wed, 19 Mar 2025 07:55:27 -0700 (PDT)
Date: Wed, 19 Mar 2025 14:55:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	kvmarm@lists.linux.dev,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: Fast model boot failure with Linux next-20250312
Message-ID: <Z9ra3I2axii2HRVb@J2N7QTR9R3>
References: <CA+G9fYvPu+MQKhYyPZSSDpAn-zhRGmeHQ8hJksT_cdDdxfbB-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvPu+MQKhYyPZSSDpAn-zhRGmeHQ8hJksT_cdDdxfbB-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_075530_092070_AFB0300D 
X-CRM114-Status: GOOD (  13.88  )
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

On Wed, Mar 19, 2025 at 08:07:47PM +0530, Naresh Kamboju wrote:
> Regressions on the arm64 Fast Model (FVP-AEMvA) caused boot failures starting
> with Linux next-20250312 and persisting through next-20250319.
> 
> First seen on the next-20250312
>  Good: next-20250311
>  Bad:  next-20250312 .. next-20250319
> 
> Regressions found on FVP:
>  - boot
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducible? Yes
> 
> Boot regression: Fast model boot failure with Linux next-20250312
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Anders bisected this to this commit id,
> 
> # first bad commit:
>   [858c7bfcb35e1100b58bb63c9f562d86e09418d9]
>   arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
> 
> NOTE:
>   LKFT is currently running FVP Fast Models version 11.24.
>   Planned upgrade to the Fast Models version 11.28 in this sprint.

What firmware (and version therof) are you running within the model?

For example, if the EL3 firmware lacks support for FEAT_FGT2 or
FEAT_PMUv3p9, the kernel will trap to EL3 early during boot and die.

It would be really helpful if you could capture that in the report in
future.

Mark.

> 
> ## Boot log
>   <No crash log on the console>
> 
> ## Source
> * Kernel version: 6.14.0-rc7
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
> * Git describe: next-20250319
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319
> * DUT: arm64 Fast Model (FVP-AEMvA)
> * Toolchains: gcc-13 and clang-20
> 
> ## Build
> * Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/log
> * Build history:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675685/suite/boot/test/gcc-13-lkftconfig/history/
> * Build details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 

