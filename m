Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74238CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0K1aV4FFCVy6tHVmIng8iRt8o43RaEh9wu3QAChIZc=; b=nNw8xdmTVEpB9Oh/AfyHTmBqIJ
	S846x/wGQD9nER5Eg9L6avJYRcHJDo//TOl1m2xTNIGpJ58H2GAQ6WkjSCaiFW8zf5xCQNW9mDgrl
	drwtvSaUQ8E2/p4pbW7NUqvYswfh15hD6LKtz0YVlI1iMPQ5iC7Lbko5ffQ0+VolepWc31mRKIwu4
	Vao8Hy2I/h037HZYErf6R7SO0mHccw5/TzAcnmrVlCX5hTgiYYP5NmnSRiDLIIMTwwxVCCjOXtdOl
	WXUqChj0HQQlD9DLxTBlc2CvFzNjt5czjCzqScjlRSdO1SNjEraYk0Er18XyNY4Xr0/kA5OC28ePT
	ZPb/HMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyafZ-00000008nC1-1xC4;
	Tue, 16 Sep 2025 18:44:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyafX-00000008nBF-2ATC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 18:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91128601B3;
	Tue, 16 Sep 2025 18:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179F7C4CEEB;
	Tue, 16 Sep 2025 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758048286;
	bh=ZzH/GAvYqKmV6By6U8xGb7aWR+qRSf/Tqk13YrnBzV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqP8rS4ixxBvX5q737icWXhhNkcbmE+0dzL4Bz72os3H2J7BTRLCdepUkdu/lOkvv
	 faxnlBz1h+23DALmtOGoq9f7swIb4eWdeD0YgU8hX5iaUVCjSb0fE97ZzL0FiC9tz8
	 11aqlj14HGI6AAANej5ay9Ft1My+1tJuHklHxgxT6IgPT7ZrKyTSgwjpSbfpLAiE1f
	 bpVmUnpvLL3iQruwqrgFzLWUj/s4evyD7SOTbzujR2w6vGO9fqOFRHvH4n/vR7aBKi
	 01JV3B9+/0va+o7YBnT25qfuvF2bcUwqkeCirDptJYozPF/UziNmUMpZMtnOOSI5Ys
	 iM5gGqiTai20Q==
Date: Tue, 16 Sep 2025 11:44:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 2/6] kbuild: Disable asm goto on clang < 17
Message-ID: <20250916184440.GA1245207@ax162>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.100835216@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916163252.100835216@linutronix.de>
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

Hi Thomas,

First of all, sorry you got bit by this issue.

On Tue, Sep 16, 2025 at 06:33:11PM +0200, Thomas Gleixner wrote:
> clang < 17 fails to use scope local labels with asm goto:
> 
>      {
>      	__label__ local_lbl;
> 	...
> 	unsafe_get_user(uval, uaddr, local_lbl);
> 	...
> 	return 0;
> 	local_lbl:
> 		return -EFAULT;
>      }
> 
> when two such scopes exist in the same function:
> 
>   error: cannot jump from this asm goto statement to one of its possible targets

For the record, this is not specific to local labels, unique function
labels could trigger this error as well, as demonstrated by Nick's test
case:

https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1636342477

> That prevents using local labels for a cleanup based user access mechanism.

Indeed. This has only popped up a couple of times in the past couple of
years and each time it has been easy enough to work around by shuffling
the use of asm goto but as cleanup gets used in more places, this is
likely to cause problems.

> As there is no way to provide a simple test case for the 'depends on' test
> in Kconfig, mark ASM goto broken on clang versions < 17 to get this road
> block out of the way.

That being said, the commit title and message always references asm goto
in the general sense but this change only affects asm goto with outputs.
Is it sufficient to resolve the issues you were seeing? As far as I
understand it, the general issue can affect asm goto with or without
outputs but I assume x86 won't have any issues because the label is not
used in __get_user_asm when asm goto with outputs is not supported?

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
> V2: New patch
> ---
>  init/Kconfig |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -96,9 +96,14 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
>  	default y if GCC_VERSION >= 120000 && GCC_VERSION < 120400
>  	default y if GCC_VERSION >= 130000 && GCC_VERSION < 130300
>  
> +config CLANG_ASM_GOTO_OUTPUT_BROKEN
> +	bool
> +	depends on CC_IS_CLANG
> +	default y if CLANG_VERSION < 170000

Assuming this change sticks, please consider including links to the
original bug report and the fix in LLVM:

  https://github.com/ClangBuiltLinux/linux/issues/1886
  https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14

> +
>  config CC_HAS_ASM_GOTO_OUTPUT
>  	def_bool y
> -	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
> +	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN && !CLANG_ASM_GOTO_OUTPUT_BROKEN
>  	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
>  
>  config CC_HAS_ASM_GOTO_TIED_OUTPUT
> 

