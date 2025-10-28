Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE9ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGqgCqSj4+eDurNR5uOg2tNpRaSUEQfF3D2HFe5YavY=; b=Rkzts7z8dwpIYh/KHzCuUD7og/
	6FA72HyhaSeNX6kkEfLN0qc7LaDaU42SDDI7rhV8ZORNjtMZlQmGFZIj0aieubMvkb9J6yMkSFhHh
	VH+wahhL/SOlBBOdtJU7tvIQ5bkYA55NO1M8MWkWfczedwrbhOkiTVpqY1ePq5O6fNY1JDurc+h3C
	egquh5josI9aLtHLP/WnVuv3XoaN0ivG5Y3SKzcesFCNcnDOkuogXnmzK1Uh5g7BbZ+tRnJdpw6MB
	Je5tV8+AbAD7bLpMR57Se4gZ8D9wkJnNwxnc7R/UqKXFIwb9xlbFXHEmcxkcfKY4UOv0XHNwFY2Yq
	1gO/0JJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnsL-0000000GR6B-3HhW;
	Tue, 28 Oct 2025 17:52:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnsJ-0000000GR5e-0Pne
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:52:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DAFB449B8;
	Tue, 28 Oct 2025 17:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F24AC4CEE7;
	Tue, 28 Oct 2025 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761673970;
	bh=Moq064DwQdSS6qTOYeb42y6SY5Kr7+VDV6iVv9m8xBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcqim24vkU/lNUAwQO+ySvG//0jPahaWXHXgAox1AfcfBdPxJPT3NTHoljAfIQYGt
	 MaBdO4/AgJqqdZ1woP/x1NfOVWC8yunhevd9di6JM/iv1H0gJ6eqPQxFXzoUHGJ04D
	 scy+VnPKywP5ILoZhGpWVOIRAO5XcBMvpBvKhPZDzpq2NhBpAuqqbUUowFnp8a96KC
	 4rlVUHFdp71lSRoL2i/I5XpYnhYsLp/3LnWR1D0bbTjC0rcdQNHh9Sjo+1WtXiSX0P
	 yVN+0IeIxy/79PMPodDKBtZBZNCwUeLSgW2NbN9RZOlwk167bZu+8Er41Ugle2BBsI
	 Z3n/fBO32uYAA==
Date: Tue, 28 Oct 2025 10:52:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
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
Message-ID: <20251028175243.GB1548965@ax162>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
 <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
 <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_105251_154531_42D9A808 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, Oct 27, 2025 at 11:56:21PM +0100, Linus Walleij wrote:
> On Mon, Oct 27, 2025 at 4:54 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> > Instead of working around issues with the generic pass, would it make
> > more sense to just disable arm32 CFI with older Clang versions
> > entirely? Linus, any thoughts?
> 
> We have people using this with the default compilers that come with
> Debiand and Fedora. I would say as soon as the latest release of
> the major distributions supports this, we can drop support for older
> compilers.

Okay, I think that is reasonable enough. This is not a very large
workaround and I do not expect these type of workarounds to be necessary
frequently so I think it is worth keeping this working if people are
actually using it. That means we could mandate the backend version of
kCFI for ARM with Debian Forky in 2027.

Cheers,
Nathan

