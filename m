Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6C6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3gndaGJcN2hgsC7vt0hd7Xv3Nt3ExEva3jSiEJodDw=; b=VE4Cn/oj4O0GY2+W/fQWd1aX3t
	rlekpRBKatdKCJqjix2YMv4lvK8TpTJXEn+c4eXCwRw8YhQbuw8wW0dysIb/KcB7uRZeuO+znnfUA
	vtzA+Chk1qEchE42rQ9nhDoXhyx7qROOAtqx5j8QWhNjx4RFdjt/xcZhPxEGL+gd7Qsnq4Zh75IvN
	tB1H4mtSszZtBBpVIkJbETCB/O279WRm5doO3B2P1Mu9T4BbcYlIX6BHEAhHzWsAqEKldrkfsbUSj
	tMBBCUlijPXY2iSPjxS5yv9xlhKl6Zz0bCsWeImoAGmsSgcYjLAjOYAXfjKLDW1TnlNUMdr0xdk2u
	mb5FKvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjY2-0000000CUwr-4B8p;
	Fri, 18 Jul 2025 11:46:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjAO-0000000CQJ5-1Fvv;
	Fri, 18 Jul 2025 11:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F511A56FFF;
	Fri, 18 Jul 2025 11:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833A3C4CEEB;
	Fri, 18 Jul 2025 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752837733;
	bh=z3gndaGJcN2hgsC7vt0hd7Xv3Nt3ExEva3jSiEJodDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8N985kTHPLNugtnVOg+RXuGHqT+Zz+SodSw21j8A2XMNGSyAS2qLmGjRtdbzVdfe
	 IFIMulnZKrhgbpw3w3A/wIDLW7jS+0lr7ib7SjYztz4624iM9GPyVasvL+ut1PbsP5
	 GATm09kiT/gS55onS8uWpLtxEReQqqli+IZv1Yy9PgkTsUWUEC0/zWoIWjaqVIVhco
	 SkIA3BmQ+Qhzd2LQH9Ep7QagVHdJoHE7Ob0JsgkdtSsXlR4nkYf283TsM9C81gdIQ2
	 5WVhkuIH1cek7XJyrnqpNFcrBlNvDicGrWLCZv53/xtUyuqeVZlNXH4XKH4CTgNd7Z
	 8s9kw2QnTs+AQ==
Date: Fri, 18 Jul 2025 12:22:04 +0100
From: Will Deacon <will@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Oza Pawandeep <quic_poza@quicinc.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 06/13] arm64: Handle KCOV __init vs inline mismatches
Message-ID: <aHouXI5-tyQw78Ht@willie-the-truck>
References: <20250717231756.make.423-kees@kernel.org>
 <20250717232519.2984886-6-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717232519.2984886-6-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_042216_404655_9F6D30DC 
X-CRM114-Status: GOOD (  10.97  )
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

Hey Kees,

On Thu, Jul 17, 2025 at 04:25:11PM -0700, Kees Cook wrote:
> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we
> have to handle differences in how GCC's inline optimizations get
> resolved. For arm64 this requires forcing one function to be inline
> with __always_inline.

Please can you spell out the issue a bit more here? From the description
you've given, I can't figure out why acpi_get_enable_method() is the
only function that needs fixing up so I worry that this could be
fragile.

Thanks,

Will

