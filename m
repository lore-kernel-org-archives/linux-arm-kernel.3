Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6470CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud0/NDal7h32+pxm55BHIVEyVkRjDTBoLJlU5eMWHOE=; b=JBveq+T6meMvrTquJoN3dZ4cFw
	UITzHHLuOYfewCSKul2sXhcBBj7HNPvt7ycRYV3hHUinOiWva7e7UG1Y0SyN4fcde6qvCVVua6pz6
	IoVdtHL+RpwzsnWxYlAUFgXNcX3LA0oBE/oVGis0sdZqucS1jl2zTHmlWezo5eiLdMg6vPHotApgj
	HQnjgCmc+BSEUscxsMw0uQxSfEj3tHXigimke20eoayVaJUOOGiGLUjANqwO+b79LXrLpIbwlESeE
	YQfpahHhsmYU06DwSnpgKbT5LNkXrsXdZrDLamRymDksGMQRVG6Ii+CzUHBWtJneXppRYNc9sA/7R
	Ovgby5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT084-00000007tTE-2Ljb;
	Fri, 29 May 2026 16:32:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT083-00000007tT0-22gF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96D056022D;
	Fri, 29 May 2026 16:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0071F00893;
	Fri, 29 May 2026 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072330;
	bh=ud0/NDal7h32+pxm55BHIVEyVkRjDTBoLJlU5eMWHOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D3bV3pzgFD9n1lg1CVkORQf7/QVjp0SBpOkO+kZamw+ktLzVMVQzxjFc5lF2azEXY
	 5Ev+VUQgwxN547FyWeZO95RH3CGQ3RjRgP1hPJ3Xo3ewqYwFiQLxDjRY4LuVvgp9d4
	 ZCv4zqx4rVN7V5ZQBFi35X98jeTiIVODUClNFpeJGX3dyz7zGD+CpbyqLiLdJFhgzU
	 fVW3vuw2ZjxeLfW14OTp70ifp56fn8hOuSWPzID20M6nT8STG1Bf/H56Aze/KHYPgH
	 3svQdSPpTmj2q8ImWFDwvF+Tr1iahPfyxgFnbqs2ZRD8Vk8K4XdOpLyyzG74KYCDNB
	 lNaAcJKXEufAA==
Date: Fri, 29 May 2026 17:32:01 +0100
From: Will Deacon <will@kernel.org>
To: xur@google.com
Cc: Yabin Cui <yabinc@google.com>, Han Shen <shenhan@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] kconfig: Remove the architecture specific config
 for AutoFDO and Propeller
Message-ID: <ahm_gd40d4rvD6L5@willie-the-truck>
References: <20260527214510.3907973-1-xur@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527214510.3907973-1-xur@google.com>
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

On Wed, May 27, 2026 at 02:45:06PM -0700, xur@google.com wrote:
> From: Rong Xu <xur@google.com>
> 
> Resend this patch:
> 
> ChangeLog:
>   V3: (1) updated the base;
>       (2) changed vmlinux.lds.S for arm64 to avoid the warnings
>           from .llvm_bb_addr_map. 
> 
> Rong Xu (2):
>   kconfig: Remove the architecture specific config for AutoFDO
>   kconfig: Remove the architecture specific config for Propeller
> 
>  arch/Kconfig                    | 8 --------
>  arch/arm64/kernel/vmlinux.lds.S | 3 +++
>  arch/x86/Kconfig                | 2 --
>  3 files changed, 3 insertions(+), 10 deletions(-)

For the series:

Acked-by: Will Deacon <will@kernel.org>

Will

