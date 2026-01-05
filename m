Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7396ECD0403
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntFGq1LHiZkFXKklC//fNpqLH1hG7zqTkRT7osbgy6g=; b=K/B3ckq+e7RNFZMnugZZ3M7h8H
	Ol4AEXmUOUj3vmOjP/Sao3gTJV1x/TR2VlFIsqUmrHysbC3xTI+xFXjyzo/ljSsF1jcuUH1tdxi6o
	BxjwLErawqQKatmbC3efyp8dXMIknzvvVD2h7lwoZ64oqkCkQ/CvxLR+P7W/AFUXDAuZgYumW1Uyr
	+qIqkZJhP25eYMbKvb+IO5IymI6Xi16jIMcLhUxSd8mRk1N6miPcBnSw6ydIYpUqrYncvmU/VMjqx
	x0+EedOhgNLwXXI+dS5JxXE611H4FhCY/e3ASiq7PGb+uudxs5qJzJoKWfZ32aQTYfD1nchdaco96
	LgWj3WPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrbk-0000000C5AO-0lwU;
	Mon, 05 Jan 2026 20:55:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrbi-0000000C5AI-3s0n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:55:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C53296013A;
	Mon,  5 Jan 2026 20:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE134C116D0;
	Mon,  5 Jan 2026 20:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767646517;
	bh=X0kZc9BzjwN5JH7faivqULek50zMy1V0qKnPhSZPR40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+mzFxg2snhJMgHzYxsep1urxQ3+v79zFd17Eu5NrQpC2a7sDkFxwkqY6MCNFHhHQ
	 0oTsesBLF1iss1X4rlnlkvRCzjUWGzNdQV506obKfjc0QkCZI+DjxXnPGQGxHED+A3
	 tujFZt8Ib24w9bNmWtE1wyXqSW5lAvn/MKtl/mNmHgce5QOgnJ61fLhN58qQxaYuYk
	 vPClOfvEX1NYgrkegC7SBERDPxVnjCOfuPyats2f3xXGYEZd2rpv/fPtMTf3zuvlfH
	 UkwxfK5wqPapHGgkjfNcaBk0rwL0tWXdEGApwuxHH0GwHPCHV0VhYEmjk/BYa9QU+e
	 7hmEZO0Oj2ZDg==
Date: Mon, 5 Jan 2026 20:55:10 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org
Subject: Re: [PATCH 8/9] arm64: vdso32: Provide clock_getres_time64()
Message-ID: <aVwlLmvwXDFs--S7@willie-the-truck>
References: <20251223-vdso-compat-time32-v1-0-97ea7a06a543@linutronix.de>
 <20251223-vdso-compat-time32-v1-8-97ea7a06a543@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223-vdso-compat-time32-v1-8-97ea7a06a543@linutronix.de>
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

On Tue, Dec 23, 2025 at 07:59:19AM +0100, Thomas Weiﬂschuh wrote:
> For consistency with __vdso_clock_gettime64() there should also be a
> 64-bit variant of clock_getres(). This will allow the extension of
> CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
> time types from the kernel and UAPI.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/kernel/vdso32/vdso.lds.S      | 1 +
>  arch/arm64/kernel/vdso32/vgettimeofday.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
> index e02b27487ce8..c374fb0146f3 100644
> --- a/arch/arm64/kernel/vdso32/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso32/vdso.lds.S
> @@ -86,6 +86,7 @@ VERSION
>  		__vdso_gettimeofday;
>  		__vdso_clock_getres;
>  		__vdso_clock_gettime64;
> +		__vdso_clock_getres_time64;
>  	local: *;
>  	};
>  }
> diff --git a/arch/arm64/kernel/vdso32/vgettimeofday.c b/arch/arm64/kernel/vdso32/vgettimeofday.c
> index 29b4d8f61e39..d7b39b0a9668 100644
> --- a/arch/arm64/kernel/vdso32/vgettimeofday.c
> +++ b/arch/arm64/kernel/vdso32/vgettimeofday.c
> @@ -32,6 +32,12 @@ int __vdso_clock_getres(clockid_t clock_id,
>  	return __cvdso_clock_getres_time32(clock_id, res);
>  }
>  
> +int __vdso_clock_getres_time64(clockid_t clock_id,
> +			       struct __kernel_timespec *res)
> +{
> +	return __cvdso_clock_getres(clock_id, res);
> +}
> +
>  /* Avoid unresolved references emitted by GCC */
>  
>  void __aeabi_unwind_cpp_pr0(void)

Acked-by: Will Deacon <will@kernel.org>

Please merge this along with the 32-bit Arm change, as it doesn't make
sense otherwise.

Will

