Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C2BCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 02:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTPwfw9HNw2Tf9e1a6QTCMUKDo0XtNL9djjLt4Lq5H4=; b=VI0bSlfxha1x+NDNat66u1d5+Z
	waHc/9KJLT1+dsWNI0VbEOtkAfQGj3J6zmRP0YsXXqJShX34dnS2Kp5iWmTwrxvrukAeSFSCCGgMz
	IxQmzBxKpkdZIwfcK75j/c8enD0d0+iD48UEH5h5zaccVh0zJTm4buYu7e2E0ttRKfLDRVFcHWCnv
	Axgt6DOwUxBjf31FYH9JmLSqDHj54FF1aWqK4vi3C9997uIwFGfe2yhU++6+DyQl/DWawxCtd6TGH
	Q5il78zDapMooSN06Mrg88klaAxLXficXf+87O5WpHG5Dgv0XxlCEsC7H1TBc/71Mxe/kKSIc2YYQ
	MIR0enKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utdAJ-00000003ErV-3Y33;
	Wed, 03 Sep 2025 02:24:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utd00-00000003Cx4-1oJ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 02:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35FFE44811;
	Wed,  3 Sep 2025 02:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB390C4CEED;
	Wed,  3 Sep 2025 02:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756865602;
	bh=zyVMQLH4t1KwmbWNdntt9uhUCwn5poLa8UFhIZx/Pnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2T/DDg4H3W2Qnd6UfRqBJJq2wFkaiwudQpczhYMpOVzwyf/KBVJzBWYVfqVM0ENk
	 qYR1qUloo7QHSld2UKIRIHi/cCLrO+IySgGM91h1lq7OkDzS++ShWlr52g3PgnfyH+
	 670IUhCaWtoae06dTZyRo7eeWbzqdGefKEnFg810WEtMJ1b52l2yDPQ4Y29ToCCd8N
	 GWIWqlda9QeWhbEv8qUYwwAcB27bvNB7TBS/8plpKYrOoOZX5aPxm2zMSrbth+0iAW
	 CJdwgsG3L9Syy83WtDqLRnus2h9Fmo1OdWQY3gYYTgiPen6zgsMJuB8VSuHPz9Zs/T
	 dnc6RMZ9+DXeg==
Date: Tue, 2 Sep 2025 19:12:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] lib/crypto: curve25519: Consolidate into single
 module
Message-ID: <20250903021211.GA6491@sol>
References: <20250901201815.594177-1-ebiggers@kernel.org>
 <20250901201815.594177-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901201815.594177-6-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_191324_491761_5AA9E64C 
X-CRM114-Status: GOOD (  11.43  )
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

On Mon, Sep 01, 2025 at 01:18:14PM -0700, Eric Biggers wrote:
> diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
> index 7e4e66f30a7a6..c0f3b64489dd6 100644
> --- a/lib/crypto/tests/Kconfig
> +++ b/lib/crypto/tests/Kconfig
> @@ -11,13 +11,14 @@ config CRYPTO_LIB_BLAKE2S_KUNIT_TEST
>  	  KUnit tests for the BLAKE2s cryptographic hash function.
>  
>  config CRYPTO_LIB_CURVE25519_KUNIT_TEST
>  	tristate "KUnit tests for Curve25519" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> -	default KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
>  	select CRYPTO_LIB_BENCHMARK_VISIBLE
>  	select CRYPTO_LIB_CURVE25519
> +	select CRYPTO_LIB_CURVE25519_GENERIC
>  	help
>  	  KUnit tests for Curve25519.

Small correction above: adding 'select CRYPTO_LIB_CURVE25519_GENERIC'
is unnecessary here.

- Eric

