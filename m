Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919AFCC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzjmrQ1q4F01dLrUdKab1eKm96P1ZxBBD0Tw8S1Xhiw=; b=VfTXP2OpoLdQa5vtThY7TIIXO8
	XWv7rISCRekzSPWXlZZ3TIOn/J13JYF6Hy7l9slw/MkMYnbPcBdTITBtRX4zPVU8Z10o4gJdtKvbW
	sf8V8Yk7CkyY38QjPSI4hoLoVUxbyLjCOMwRmtNSdMX/9QT8m5HnmJvf+Bhfw5e2Zn/AQ2hXSDZCm
	NqUx2PyBFqZyAKVKtrjItsETnHIKEoPMhsHugT3qTlNii1m6XMJXWlewJFq16qZPWpwVFhoKB12Jy
	JRBz2wCHYB6S+TfbQMm6k1gzu/HJwiBEYY4NEzTdw8JbpR1I2T7OYvC62cFntjJKBd/KkRGDDi196
	WvLub4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOQC-00000000rDW-3rIG;
	Thu, 15 Oct 2026 16:35:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOQ9-00000000rCq-3WwE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 16:35:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17A7414BF;
	Thu, 15 Oct 2026 09:35:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC9223F871;
	Thu, 15 Oct 2026 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792082105; bh=lsiH1+9I7R8Zogecgsc8mrMTXuCaEqcuQrsVaEDtkC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2AsLQvbUtafLx5JEFU7If/jPUmnKDzQLNnyAKcPeXuraMiO1yHOL9cr1qGxmcFDg
	 /ZtQ63wu2mEK+d3MgSz1GePJ/sF0hbTvf5y80ElN7tv5niqN5SSKYm3Huz/QQ9fjE3
	 8WSg6sfzddBzCnipx04jTzq4ZNdtfgDF7erhtQtM=
Date: Thu, 15 Oct 2026 17:35:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Iurii Trukhin <yuri@trukhin.com>
Cc: Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit
 and 52-bit VA
Message-ID: <atEAtHiHh0eeVPn3@arm.com>
References: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_093509_948678_F3D016B1 
X-CRM114-Status: GOOD (  12.37  )
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

On Wed, Oct 14, 2026 at 10:23:35PM -0700, Iurii Trukhin wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index cab741a695f5..7bca47269dd5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -313,6 +313,14 @@ config ARCH_MMAP_RND_BITS_MAX
>  	default 16 if ARM64_16K_PAGES
>  	default 18
> 
> +# default to 1 TiB (5 bits below ARCH_MMAP_RND_BITS_MAX) on 48-bit and
> +# 52-bit VA; smaller VA sizes fall back to ARCH_MMAP_RND_BITS_MIN in
> +# arch/Kconfig
> +config ARCH_MMAP_RND_BITS
> +	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
> +	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
> +	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)

This looks fine but I was wondering what ARCH_MMAP_RND_BITS_DEFAULT (and
the compat equivalent) is for. It turns out that an int always evaluates
to 'n', so not taken into account. It might be worth removing them
altogether as a separate patch. No-one seems to be using them.

-- 
Catalin

