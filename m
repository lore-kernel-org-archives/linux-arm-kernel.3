Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C0BCFC29F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 19:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAdmCjEjS1k8cydxZMlTSn3oPaSnO8zwhoE0yDXmfkc=; b=aK4NaC/mnIpy/w45d8gZdD7dyM
	MNoCUuokBDMwdMU/MjzvwSevL5O7UfDDHqBsU3cFVJwT93Yo1U7rKKPAewZUIVB2VZjD+soKX6sGs
	JWKQTtetQQ51U4rJ0uM9MmhUO2s+J6QIWNyj4206V10C7C71r3uundMG91VkN2F7BWdKOjyDyaEOd
	nqKkvK4gC6w/3YDMCBv+pIFbdB4xD5lP8mJQErGOjwNjhEaPdOi7wtMuSlChbAyLY3OB6+s7ggoQm
	jWdyfkRS5gN2hKBgzzllQCUiGJkS728mIKMqaIwvSc5q2S72tz+9BwJ8qc28fxs9leO9pCLn4dzFi
	3GagNTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMX5z-00000008vFj-24LI;
	Fri, 21 Nov 2025 19:47:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMX5x-00000008vFa-3PG5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 19:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8B4360145;
	Fri, 21 Nov 2025 19:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1C9C4CEF1;
	Fri, 21 Nov 2025 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763754420;
	bh=cEdRCa2NBNmESBxc72utfubK3/50PKg3AObY9g7OMis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSFFKfMeMTUHsC8yj3jqUJ/m8QBV+GwQ/2LqO9m8lU6FGqr+MDNB9s41UgbZsY0tq
	 PL6+i4/ySPvKoZyv0vYYrhIvHv1Np1oZXvA3RRYdt5YBGKcX0HwqEINffE7tatFMvF
	 dGIgaxbXK7QEqTiOKMcR7eHx53Cn7tVkeAYhA+XTyTzDbxw967a5phtYgtwu6uxHTB
	 Gx+mhXtJgUzU6IF84T7VLB7J+/eL0T4M5XMWb3/E0IWYU+UWWMrz6DfTs0aH00zJ5B
	 txWs4Nmj3znlJOhLorrmIxXQufrgiPy0ZMLyu4JmUOpJwoYsFZq6caXJzpMPUY0qQh
	 Qb3GiKPtwPb1g==
Date: Wed, 19 Nov 2025 21:20:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Chen-Yu Tsai <wenst@chromium.org>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/8] kbuild: Split out module targets into a variable
Message-ID: <aR4mdI3u51z4qhoN@derry.ads.avm.de>
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-6-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119181333.991099-6-sjg@chromium.org>
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

On Wed, Nov 19, 2025 at 11:13:26AM -0700, Simon Glass wrote:
> Add a modules-targets variable to list the targets which cause modules
> to be built, since we want to add a conditional target.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - Add a new patch to split out module targets into a variable
> 
>  Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 638bc09a546a..8cd46222fc48 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,7 +772,12 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>  
> -ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +modules-targets := all
> +modules-targets += modules
> +modules-targets += nsdeps
> +modules-targets += compile_commands.json
> +modules-targets += clang-%
> +ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
>    KBUILD_MODULES := y
>  endif
>  
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>


