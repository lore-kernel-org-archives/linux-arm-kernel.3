Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D63C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJCr006rkzx0rHeznFVbYO77+GKI3Gx0pNyCfV0wuq8=; b=EGbjqmLLZz6fnX0U6GnR6SJrYw
	gp7q3irfZ6f6aV6V8AtNF2X7T+fat9j6keKqgn7HlolSQnNomKPW7wHQRfN/h5b1IU8aDwBM2YGv9
	X5HyF1HGJtBLDx9bli4n+7jiBKZt6BI1nfu3FLgYKtmgnOOLqepDRW5DNM7WuGq9AV+wKyPv/c9DW
	ojPjFFu0A2Er2+18CzyzJFK4YM/OeqEqhZssIPWatyGyCfby0gbPi2IMVP2/tplm3kZf8lW2wFjw3
	mCOE7sy/Ahoa3i8cnWrKRaZgt3a5bhj3CQKZPUL/ExyMq94NsVudRdLyiTv/dVFIcLGPs9zpsZAIG
	LRGnz/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKABN-0000000CHoE-2Ppi;
	Wed, 28 May 2025 06:22:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA3p-0000000CHFv-1CFo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 06:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54C30614C6;
	Wed, 28 May 2025 06:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98EFC4CEE7;
	Wed, 28 May 2025 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748412884;
	bh=gSS4CjRAoDJno8ZPj89/BweAbZmckAAF42wPMM0GsLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aocLOYonwxONTi12LfiZ5xjosNb3Y5gKkNrj56+v0oqn+5bxipcc7fqfKMCLUiPqJ
	 86koB/f3yH3JfJeFCzRulM0tj0iUYixZECMqlrrgJScAarzNXjZRjx0mo5Zc/ertnT
	 8tvOuu4HUmgHrE5ANkuyKODt1Qj4IM4GjN2pJu4G+2hJp898Du/mknk+BrCDACyYrY
	 cdhD6bs1tV3M5NFukEJcRQhBfTCDV7yjlZxxm8fSCmI3bDhNjtnt9hUHWF+Ioq30eW
	 2vId+gOUX4vWP7jCqmsT4NHqRao2rZzclOgIRz3z+jiai+mHbfe19EkqU5HbAMTMQm
	 xv3/SBt7Q0Rbg==
Date: Tue, 27 May 2025 23:14:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [linus:master] [crypto]  40b9969796:
 UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
Message-ID: <20250528061427.GA42911@sol>
References: <202505281024.f42beaa7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505281024.f42beaa7-lkp@intel.com>
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

[+Kees and linux-hardening]

On Wed, May 28, 2025 at 01:15:05PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> by this commit, the config has below diff:
> 
> --- /pkg/linux/x86_64-randconfig-101-20250522/clang-20/d469eaed223fa485eabebd3bcd05ddd3c891f54e/.config 2025-05-23 23:44:56.781716572 +0800
> +++ /pkg/linux/x86_64-randconfig-101-20250522/clang-20/40b9969796bfa49ed1b0f7ddc254f48cb2ac6d2c/.config 2025-05-24 02:08:29.858605300 +0800
> @@ -4837,7 +4837,8 @@ CONFIG_CRYPTO_ACOMP2=y
>  CONFIG_CRYPTO_MANAGER=y
>  CONFIG_CRYPTO_MANAGER2=y
>  # CONFIG_CRYPTO_USER is not set
> -CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> +CONFIG_CRYPTO_SELFTESTS=y
> +# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
>  # CONFIG_CRYPTO_NULL is not set
>  CONFIG_CRYPTO_PCRYPT=m
>  CONFIG_CRYPTO_CRYPTD=y
> 
> it seems tests are enabled then we observe the UBSAN issues
> 
> d469eaed223fa485 40b9969796bfa49ed1b0f7ddc25
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     dmesg.UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
>            :6          100%           6:6     dmesg.UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305.c
> 
> it's hard for bot to apply this commit to previous commits in bisect, so we just
> make out below report FYI that we observe UBSAN issues in boot tests.
> 
> 
> kernel test robot noticed "UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c" on:
> 
> commit: 40b9969796bfa49ed1b0f7ddc254f48cb2ac6d2c ("crypto: testmgr - replace CRYPTO_MANAGER_DISABLE_TESTS with CRYPTO_SELFTESTS")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linux-next/master 176e917e010cb7dcc605f11d2bc33f304292482b]
> 
> in testcase: boot
> 
> config: x86_64-randconfig-101-20250522
> compiler: clang-20
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202505281024.f42beaa7-lkp@intel.com
> 
> 
> [   12.442846][    T1] ------------[ cut here ]------------
> [   12.443261][    T1] UBSAN: unsigned-integer-overflow in lib/crypto/chacha20poly1305-selftest.c:8854:47
> [   12.444084][    T1] 16 - 114 cannot be represented in type 'size_t' (aka 'unsigned long')
> [   12.444682][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   6.15.0-rc5-00342-g40b9969796bf #1 VOLUNTARY

This issue predates the blamed commit, and it's specific to
CONFIG_UBSAN_INTEGER_WRAP which was recently introduced.

CONFIG_UBSAN_INTEGER_WRAP apparently requires clang 20.

To try to reproduce this, I built clang from the release/20.x branch, then built
a kernel with CONFIG_UBSAN_INTEGER_WRAP=y.  When booting that kernel, there are
many UBSAN reports:

    [    0.000000] UBSAN: negation-overflow in lib/sort.c:199:36

    [    0.000000] UBSAN: negation-overflow in lib/sort.c:185:14

    [    0.276708] UBSAN: unsigned-integer-overflow in ./include/linux/min_heap.h:329:24

    [    0.277376] UBSAN: negation-overflow in ./include/linux/min_heap.h:260:42

    [    0.871191] UBSAN: unsigned-integer-overflow in lib/crypto/chacha20poly1305-selftest.c:8854:47

    [    0.890856] UBSAN: unsigned-integer-overflow in lib/crypto/chacha20poly1305-selftest.c:8851:47

    [    0.910455] UBSAN: unsigned-integer-overflow in lib/crypto/chacha20poly1305.c:260:57

    [    1.105542] UBSAN: unsigned-integer-overflow in lib/zstd/compress/zstd_compress_sequences.c:334:21

    [    1.113539] UBSAN: unsigned-integer-overflow in lib/zstd/compress/huf_compress.c:889:23

    [    1.114597] UBSAN: unsigned-integer-overflow in lib/lz4/lz4_compress.c:294:9

So I did get the chacha20poly1305 ones, but they're hardly unique.

If this new sanitizer is going to move forward, is there any sort of plan or
guide for how to update code to be compatible with it?  Specifically considering
common situations where unsigned wraparound (which is defined behavior in C) can
be intentionally relied on, like calculating the distance from the next N-byte
boundary.  What are the best practices now?

Documentation/dev-tools/ubsan.rst says nothing about this and only mentions
"undefined behavior", which this is not.

- Eric

