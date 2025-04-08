Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F957C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7y6jmP863uF7EDdWzDa/wI58SPi5tq0Wc7whIsJAd0=; b=3u03LG3Py49/b/Zj23fqG8r1ji
	z1appCdvR1/yKb+YG+Mjmn9u0BKZS+eF46Wi4Ri5XV2KpPUkVG8+MOy2wCq0IAThpJANbD+O32ezn
	myOg+pG1Laa+1Ia8d3DLx/WP8X/UGPodOvslYKoK0YKdvLxGncoL8Sml1HNNURknRiBw7OCCPs9aG
	inJJsJcTRcE4kOy09rFB8PpxPHOQltobK03FLuVUNp3Ecd9quBVkz2VkbJ8X5Le1oC/X26J3BKU2R
	ULSr8m6SyxmIBMKSwJJ8XR7cE6zEtLqEc4R7C/wbaeW20A+cbwpa+o7fRAm74LMrGjO7/oCtrLs/a
	4QjVWcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24E5-00000003En2-3hDF;
	Tue, 08 Apr 2025 08:22:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u247x-00000003DKc-2MK4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BB124386B;
	Tue,  8 Apr 2025 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1ED2C4CEEB;
	Tue,  8 Apr 2025 08:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100173;
	bh=a0cHsypMDGBoj1KQFM5mwYajqEJrx4jAOqxJNpZ+kzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTbuCqJetua5Pl89eRSq+KlSTASP0RslqlF95iKaZ1238IoDHob5PfyjcI9b1TjzW
	 oRS9ccNNBVgaFxO6Xn0/xrrYjvwRF67tgr2Q/lVjc52IBDfXbp9/+bS1RZ1DsbfIOr
	 M3XEap2gKGIDF8vSkJU3YvnVVWMMlKpuA6S7jBu1K6Md7TQJ7y6UKAny/rt8JYyxdx
	 IFdTX4ONhmFkxnvg+N5Kx+cNhc4Bjv9jVsoXS/WZuoZfo5uzB+bSpRnInEiXNEiMqo
	 Dq4QZuYjQq/kE4ajtkQ+kbMFU1g5rKcVGLFsuMFtWZLCTz2qJdF2fxoi/fLxxkUgoL
	 zB+LZD52kI6nQ==
Date: Tue, 8 Apr 2025 10:16:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <Z_TbRGgRTDvyQyfs@gmail.com>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407164151.GB2536@sol.localdomain>
 <0d087503-88d5-4d66-aa52-161ca6e0df06@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d087503-88d5-4d66-aa52-161ca6e0df06@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_011613_625555_EDA17C99 
X-CRM114-Status: GOOD (  11.83  )
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


* Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Apr 7, 2025, at 18:41, Eric Biggers wrote:
> > On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> >
> > This is intended to supersede the patches from Uros that removed checks for
> > binutils < 2.25, right?  See:
> >
> > * 
> > https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
> > * 
> > https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
> > * 
> > https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/
> 
> I missed these, but it does sounds we easy to work out, either
> by rebasing my patch or dropping Uros' version.

It's a trivial conflict resolution AFAICS, already done in today's 
-next.

Thanks,

	Ingo

