Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7D3C369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjER2dd/IvbGBlh5ypFvuRBoRbgvIHWFumU90CTNS5k=; b=aZktGBX9fs/uz3U7hGmFxy5gDp
	ZKHJUPoxbvgY1kjdlTWdvkSOq5WiTC4ge8ldsj3NKR2ffpmmiPAIoFZ1iGQBONyppBEP55vzDCJW/
	1tB7AtdHXWDL/40EENDRDXXDO+08vHqv3YRJUXw+wUKVlQdBVxJkguxYPKMJg2muI8sHQAU8gLHb8
	1A6AbRHbnzzsJjRJVvTcz1tLF1aA48KkjqAmNof0B3VOkepezxTGqaX+PzQBJ/BJ68BSmdagjzHYg
	WjI8S2H+z3G+7im46hQoIXQ2xFRGGZGb1frANcTpZd5OCrYU5B5vpjegYZwgvF006mjkdBa9Wq6+Z
	dXhJpPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYL-00000001cnk-2MNG;
	Mon, 07 Apr 2025 18:50:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pXm-00000001Fam-3F5W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE86D5C4ACD;
	Mon,  7 Apr 2025 16:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B715DC4CEDD;
	Mon,  7 Apr 2025 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044113;
	bh=2DZaBdiIWfRi2cZXVupSLX8P1kQDQE1JN+1+Y8S2N2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jx56oOeJKQbuRt2tp4+Xt6FIXUoZzIU/0LeM+CA9psDCzTxiRu73kTHMT8QNjQzxj
	 NeJABgeGL2rOuTieaPWkit/Ti5qv6ZStUTbHWHH3sGmNBPrWvZZ5jFTC5/Y5G/Q5io
	 csCPtwRcv7BVxCHj9xNP8nZc9ibQFOSwLZNMC44ARnPnjs2YZRo9CNfe5XgXv4ts97
	 bOV/tzzCrGy41yMfhpifKnNcb9JXzPXg+YKSZZjjpPNJIrfhpHY8d5IZ8b8K+ND4sX
	 OwjRJYyUZVeLpVEwwNRlqVAYJWUxvA00mDxRjqHnFU1wv5uh8MEYjIdA1XX5fWDld1
	 X+TPrxdxwu2Aw==
Date: Mon, 7 Apr 2025 09:41:51 -0700
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
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <20250407164151.GB2536@sol.localdomain>
References: <20250407094116.1339199-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_094154_854511_3220A43F 
X-CRM114-Status: GOOD (  16.49  )
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

On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
> actually go through all  version checks and make this is the minimum
> for all architectures.
> 
> Most of the actual resulting changes are actually for raising the
> binutils version, which eliminates version checks on x86 and arm64.
> 
> Arnd Bergmann (4):
>   kbuild: require gcc-8 and binutils-2.30
>   raid6: skip avx512 checks
>   x86: remove checks for binutils-2.30 and earlier
>   arm64: drop binutils version checks

This is intended to supersede the patches from Uros that removed checks for
binutils < 2.25, right?  See:

* https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
* https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
* https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/

If we can indeed bump up the requirement to 2.30, that would be great.

Just a note though: I recently added VAES and VPCLMULQDQ instructions to
BoringSSL, which increased the binutils requirement of building BoringSSL to
2.30, and this caused issues in a downstream project; e.g. see
https://github.com/briansmith/ring/issues/2463.  Specifically people complained
about being unable to build on Amazon Linux 2 and CentOS/RHEL/Oracle Linux 7.

So I just thought I'd mention that, based on past experience with this sort of
thing, those are the specific cases where it seems people are most likely to be
trying to use binutils < 2.30.

But if those distros are not going to be supported any longer (without
installing newer tools on them), or even are already unsupported due to the gcc
requirement, bumping up the binutils requirement to 2.30 sounds good to me.

- Eric

