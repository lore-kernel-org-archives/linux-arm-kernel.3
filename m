Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD45CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yprLLzu/23+hltQ8hDoRSGSE9VYBXZzoi6lRcgP6GUU=; b=2JipovSE3E13qvbCs8KWw8GQMf
	I6hFMy1A1SLHNYYYX3SvieGYS6kO1Nfx0TIj67dxkDXxTJ2w4E22xUxluB2qqXzFSBcjA8j8pJnDj
	t38hNTPI+UWoUzs7LlhuS2tVaqmtRlYf/8KbYY6c9FM0XB2Nz0KVsk3TuCHzZYwGU9Cpllt0A1AgF
	at4astUFkprxVLjnELM8dzRcm3+X8LquWAJvu8YDSaObvqjWrQamaSOII3ZuPnI57bFClMtrmsnvk
	pyg7UDtMcEbo/mMqQXFlzbcgYZELe/OGjT1prvY7gUi4lT6DMXf8kAG91+aKyNUJu2xTMdcLZ84/W
	cLJzg2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUJ8-0000000ElPI-3Nsu;
	Mon, 27 Oct 2025 20:59:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUJ7-0000000ElP7-3eh7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46FC5612EE;
	Mon, 27 Oct 2025 20:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BB8C4CEF1;
	Mon, 27 Oct 2025 20:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761598752;
	bh=yprLLzu/23+hltQ8hDoRSGSE9VYBXZzoi6lRcgP6GUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1yBFjqe7L7wiSakMaFxsykOaqlqtoXS31LKAHj3epXm3lgg8XIkT42EhxqZMwgO3
	 YE7454XpIAkuPSYsGIFN/QE3es/tu2qd9U+QkuR3owshZPsToFp83dDaCtkCVgoRzO
	 35KmyTDhGtTE2j+vKr6oONd4rMigXy3t7Mz/aWAaFUSWnkXbr3O2K/CfP3fGUjZjVR
	 ocs11llI7nRErN6nMomsXTtegUW8LQSEQwpUWBFap/NFEJuaM5hZR/g+S8dZg0YoP4
	 kMd/jISG6W4xXr1WRJwsmFiTwkZDgYkTmhOkqHuSDGeAngmyCunnKdLx+yPfkVqrjL
	 S34035HO3C3Gw==
Date: Mon, 27 Oct 2025 13:59:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kees Cook <kees@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
Message-ID: <20251027205906.GC3183341@ax162>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
 <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
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

Hi Sami,

On Mon, Oct 27, 2025 at 08:53:49AM -0700, Sami Tolvanen wrote:
> Instead of working around issues with the generic pass, would it make
> more sense to just disable arm32 CFI with older Clang versions
> entirely? Linus, any thoughts?

That would certainly get to the heart of the problem. I have no real
strong opinion about keeping these older versions working, especially
since we have no idea how many people are actively using CONFIG_CFI on
ARM. I will say that this particular issue is rather exceptional (i.e.,
I don't know how often this would really come up in the future) because
this code is relying on the fact that these indirect calls will be made
direct by the compiler and checking for it, which does not seem like it
would be really common in the kernel otherwise. We would likely have to
forbid future use of the generic pass as well.

Cheers,
Nathan

