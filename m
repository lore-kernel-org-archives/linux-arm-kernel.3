Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9032CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4YEyM9f6Z17eEJMqdNsc5OUh7Msjd29NFeDMFxBuvU=; b=p4LlkjKJ4uQzgaXB/0as+WglbN
	aSnyVCG5eHMjyo2vQe6uDxOxUIk2t/UOtzRX0Mzw6o1WPECiLUeiP/Py/GvcgUhU03c2a2x/FwwN+
	kuByAZXmwOaBJhZIBsIcve1xZ12zf1OBbuNo+XBd3Rf4VRRTxEU/BXus87Mi5YcIp8AfGOPFCc8SU
	nNIMEC0zlAdOdgfrlW0rvA5tn9FK5a1ZvSBjh3qCpusitBqDE/BC4rHvuz92qPkyLeO//9HtzN9Cg
	4YG02YuHYmHTO1uiQpt+smnz8rc0nQon39hi7h8cwlLXP7Z6uxxQAPjNSzUR2GkyQ+d7ARLQ7rRBn
	CFEfNIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1ST-00000005O8t-1qYj;
	Tue, 24 Jun 2025 11:04:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0rv-00000005Iuz-37iF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21EA144FD2;
	Tue, 24 Jun 2025 10:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A80C4CEF1;
	Tue, 24 Jun 2025 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750760831;
	bh=3VL2ZDaeQDvTAIFDhdlXuLjhBEWyHHUcwX01jX3cGqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g03dfxio0dn9OjGUhqbB9BMwcW6zwImbvgJcdQHvYSKEqqVlm+aOhNI1+Z1KdgF0I
	 mjd9iDzCyt/uv65zT2pGlNOe8moqYM/NnmKrF9SJdz/1QIgn6sEjyIHcJtGo+hFxyx
	 lRCedPrAnE1PdQCTWcwV7WHFDffuReRF7ipWtVq0=
Date: Tue, 24 Jun 2025 11:27:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Julien Thierry <jthierry@redhat.com>,
	James Morse <james.morse@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 5.10 000/355] 5.10.239-rc1 review
Message-ID: <2025062457-uncouple-oncoming-f933@gregkh>
References: <20250623130626.716971725@linuxfoundation.org>
 <CA+G9fYt2e-ZGhU57oqWwC1_t2RPgxLCJFVC0Pa8-fYPkZcUvVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt2e-ZGhU57oqWwC1_t2RPgxLCJFVC0Pa8-fYPkZcUvVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032711_822948_28149EA7 
X-CRM114-Status: GOOD (  22.47  )
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

On Tue, Jun 24, 2025 at 01:56:56AM +0530, Naresh Kamboju wrote:
> On Mon, 23 Jun 2025 at 18:39, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.10.239 release.
> > There are 355 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 25 Jun 2025 13:05:51 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.239-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> Regressions on arm64 tinyconfig builds with gcc-12 and clang failed on
> the Linux stable-rc 5.10.239-rc1.
> 
> Regressions found on arm
> * arm64, build
>   - clang-20-allnoconfig
>   - clang-20-tinyconfig
>   - gcc-12-allnoconfig
>   - gcc-12-tinyconfig
>   - gcc-8-allnoconfig
>   - gcc-8-tinyconfig
> 
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
> 
> Build regression: stable-rc 5.10.239-rc1 arm64 insn.h error use of
> undeclared identifier 'FAULT_BRK_IMM'
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> 
> ## Build errors
> arch/arm64/include/asm/insn.h:573:9: error: use of undeclared
> identifier 'FAULT_BRK_IMM'
>   573 |         return AARCH64_BREAK_FAULT;
>       |                ^
> arch/arm64/include/asm/insn.h:26:54: note: expanded from macro
> 'AARCH64_BREAK_FAULT'
>    26 | #define AARCH64_BREAK_FAULT    (AARCH64_BREAK_MON |
> (FAULT_BRK_IMM << 5))
>       |                                                      ^
> arch/arm64/include/asm/insn.h:583:9: error: use of undeclared
> identifier 'FAULT_BRK_IMM'
>   583 |         return AARCH64_BREAK_FAULT;
>       |                ^
> arch/arm64/include/asm/insn.h:26:54: note: expanded from macro
> 'AARCH64_BREAK_FAULT'
>    26 | #define AARCH64_BREAK_FAULT    (AARCH64_BREAK_MON |
> (FAULT_BRK_IMM << 5))
>       |                                                      ^
> 2 errors generated.

Now fixed, thanks.

greg k-h

