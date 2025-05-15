Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7289BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 18:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91eL47mipwUXwsYnh76xCPH5iwjQH/9Oy1RyT9sXTZ0=; b=1jZZbZsADXN9HbkiAOBAzGER3K
	Fb/WQUeSIsUZL4k+j3Gu3aMTmvBfiyiwFnzGa6/EpMkWzAZfZtoJ42OSyIZcjk18cSMqZPLPG4qT8
	/Xfgqss/mGEfr4Ww6XKMU6qeN25bh/WVcI1qnJmPTF8diFlVUErEDMod4mJi3FoPro4xyYSSUHPlO
	Ju2dT9RFO5nazP0m9MHSX8zQJYJIHBSoBKEXkUAdEh5QlXVrw4i4jdrYzQ5PUayMWyq39SYof4eRw
	286floAWdeTwa5I4zVhvnsh4iXEBoj7/jw0Y3qdq63efLI1vvg+TiC2lyG2yV+s4dQ0KAap/FraFO
	mF9XdF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdLj-00000001ZX5-1ylf;
	Thu, 15 May 2025 18:30:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdJS-00000001Z54-1Kn5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA0D643B0C;
	Thu, 15 May 2025 18:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F07C4CEE7;
	Thu, 15 May 2025 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747333689;
	bh=YGInIQcg7bEfVfDW2Nf5dYzwwNKPK10uDMpf45f1d7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMZ8K0LouaSIhDJ9eyhsLxTag1NTaaYDJVcV/HbTS+yy0lRFW/bvKAEFSc1ccSFB8
	 iF4Jln8u1TO5rtFHsN9WxhppohWgTbP4H2uYfQhwt804pkjsqoU5cVUgMbY/8IP5IH
	 FPlA+XKGoDvRvJUWuZhLuAKmZm3tXvtoj+BbM0YqlAaeU2ImMJbyM96PNSeboVOxJ7
	 dl4seT24XaKmWx6rI/lyCl+f6Nn9YobkiT6vX9y8LarBZ3oD90GRrBxuHhy4G82HPZ
	 wmmAKbKp6F17WazFgLrAv3kRtyT+y1YfBompgVHKp531BZrcHY2hTPrQKwFjrCwWXI
	 otqbYn3GmdOYA==
Date: Thu, 15 May 2025 11:28:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
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
Subject: Re: [PATCH 1/4] kbuild: require gcc-8 and binutils-2.30
Message-ID: <20250515182806.GD1411@quark>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_112810_374874_B8AF6E1F 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, Apr 07, 2025 at 11:41:13AM +0200, Arnd Bergmann wrote:
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index d564362773b5..41b1431f5a6b 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -29,13 +29,13 @@ you probably needn't concern yourself with pcmciautils.
>  ====================== ===============  ========================================
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================
> -GNU C                  5.1              gcc --version
> +GNU C                  8.1              gcc --version
>  Clang/LLVM (optional)  13.0.1           clang --version
>  Rust (optional)        1.78.0           rustc --version
>  bindgen (optional)     0.65.1           bindgen --version
>  GNU make               4.0              make --version
>  bash                   4.2              bash --version
> -binutils               2.25             ld -v
> +binutils               2.30             ld -v
>  flex                   2.5.35           flex --version
>  bison                  2.0              bison --version
>  pahole                 1.16             pahole --version

Later in this file, there's another mention of the binutils version that needs
to be updated.  (Or maybe removed since it's redundant with the table?)

    Binutils
    --------

    Binutils 2.25 or newer is needed to build the kernel.

