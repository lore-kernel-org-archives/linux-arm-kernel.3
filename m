Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15E3D58CAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 00:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ7DOx1G79zRHUhJ9o4JHYL73lqH8FzGVTpS6L90wMc=; b=Y9AXL3TfBC8bkRPvieEquJL8dI
	jJReZ5eZg5uXGKEtD1mUjeyaAMrA4aZV9/jM4Fx4SyTuS+ly9OIKHp7vPaampyyrwLS6Q4hBcBWka
	fzMXVpXAdYSiWDlb30+6mDRiZQNUr2AhgJmK7LhAzoBMRbKCx8Qi4jX7Ps0i9oz7fOHD79Qni5hZq
	vfc/QjiOqv6HTGHCCrkR/ISgNVdLhvAWngxMm6DBW8+RxeBfDqygGa7sZKSu6jBaDqsAXWIgLHCwr
	c9VETLib0Gif4LizuVhOR8asaoShj3VLbGPNQk5t426yr1Co6h9jQKu+8kDOCEiuw5wRuzXujIzZ+
	GOEFIK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Sm4-0000000Flt5-37Pi;
	Mon, 23 Mar 2026 00:04:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Sm4-0000000Flsw-0D1O;
	Mon, 23 Mar 2026 00:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9E3A60008;
	Mon, 23 Mar 2026 00:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BD7C19424;
	Mon, 23 Mar 2026 00:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774224241;
	bh=TIx02c+Ao/gjEr9Xh8zmMJ4cknC+KKpUO0TYsvtJrYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qv6JxmleN9/FehBcjvyaVa1MkmaXr4Sv6DcsFlJ96PsdiyVC/3pYc+m9Fwy/RrdSG
	 k5iZa7SJc1Ft+h6UZKpE7yAG8OVAeY+4bKrG5ag2HU4QV8BqxvEHeMinl3wg76IP19
	 XbngVTWCPutXEd0vLUj4yiykgEMAB738SKwiuyl2eLDpHKdp6Dn+XZO24604aijCIz
	 vMZ00TvFd1eEU9/TTw62WquUyTwe31b33w4myELOF078ren7RgnzMj7AwOEOoJK8OO
	 He1JYHC23hpTrczCRcVKZKDqpyOBK3ynq1rAxPlCOxuKwamlGfrVspQwrE3ZP8XexF
	 uqm5O+jaQqgSA==
From: Miguel Ojeda <ojeda@kernel.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	akpm@linux-foundation.org,
	aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	david@davidgow.net,
	gary@garyguo.net,
	johannes@sipsolutions.net,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-um@lists.infradead.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	mark.rutland@arm.com,
	mmaurer@google.com,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev,
	nsc@kernel.org,
	peterz@infradead.org,
	richard@nod.at,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	urezki@gmail.com,
	will@kernel.org
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Date: Mon, 23 Mar 2026 01:03:27 +0100
Message-ID: <20260323000327.111235-1-ojeda@kernel.org>
In-Reply-To: <20260322192159.88138-1-ojeda@kernel.org>
References: <20260322192159.88138-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sun, 22 Mar 2026 20:21:59 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
>
>     On the other hand, regardless of whether we fix this (and another
>     issue in a separate email found thanks to the UML build), we could
>     instead add `depends on` listing explicitly the architectures where
>     this is going to be actually tested. That way maintainers can decide
>     whether they want to support it when they are ready. Thoughts?

Another one for arm 32-bit:

      LD      .tmp_vmlinux1
    ld.lld: error: undefined symbol: __aeabi_read_tp
    >>> referenced by uaccess.rs:349 (rust/kernel/uaccess.rs:349)
    >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
    >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
    >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
    >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
    >>>               drivers/android/binder/rust_binder_main.o:(rust_binder_main::rust_binder_ioctl) in archive vmlinux.a
    >>> referenced 36 more times

I think this reinforces the case that this is something that arch folks
should think about case by case, and decide if they want to try -- we
may want to start simple with x86_64 and arm64 or similar first.

Thanks!

Cheers,
Miguel

