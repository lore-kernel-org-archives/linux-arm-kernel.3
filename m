Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5305FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ot5TxyKJjPzjzN+8Cq0PVEpJQ4hmA5h/YkejpmLh/0=; b=cizboVZnGPouwaFcIGhAz/lsIQ
	0FahqhcxmQ+q7pk05KVJkij2L6+RWI/FO0hE1VtSsUsg1Z9A0mO3xo2MK3vJ9g3tLxF0UevolYvi3
	JnCJqEZFciAyX8kb3V0KSzvP+TKGWjUYpMZksdHgDUMAVWDPJfXrayBHUWlrQFItfu47pni+0d2u7
	3tdf0h0/mDZG6AfIExv5/Itv4m9YNG8PPxl3MfuOm7qZZTh1YQ9px0dInKfx3mkNeVx309FwK+BST
	VtrjApaUUAkb3rgP3nWCFDN3GK3DYbgkWJatZKcVvxDmUJ9uATwZAN8S7vr5f6+UirAf58g76NDFs
	Ohbc1Jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMJv-0000000Aadx-0Xvg;
	Tue, 19 Aug 2025 13:24:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKco-0000000AIV1-0Wwf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 612E05C5E04;
	Tue, 19 Aug 2025 11:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E62C4CEF1;
	Tue, 19 Aug 2025 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755603332;
	bh=w2jIOR1lpkDHoLj88fhmQi3DcBG4GO0JGHddxQqGBjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnHeHwfCL7dIpX00FXdlapFMe1o9fIymJbm0eNGknjVrOlwgmnUlBurcLv8B33XIO
	 SA474yTpPk1jC15kb8Rf7hVjllhBiKYG0PjxPsRTFbb96m/2Sg4FhZ8FACEbVLj2l2
	 +d4vPTt53k4hwNbpDqmauIJNOgmDuHhbtSRfi7LsdZ4LQpXeSqjdzNqr5pr+vFe1a3
	 3xBM3JKtoOkHr4Ml3QYAkosEc/sx++Uj1r+2chdU1uUQA2gE5cChvNvHxC3XPCRRp7
	 yVh+ukQ4XTwkU27RUY513SFainLW/1wnVxA2j5+Ig42urB4zXX4eOLfc2uJ4KCzRyv
	 EYAmbxond/15A==
Date: Tue, 19 Aug 2025 12:35:26 +0100
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] arm64: Remove tautological LLVM Kconfig conditions
Message-ID: <aKRhfmLHzjgi-HiJ@willie-the-truck>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
 <20250818-bump-min-llvm-ver-15-v1-4-c8b1d0f955e0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-4-c8b1d0f955e0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_043534_209362_7709AA89 
X-CRM114-Status: GOOD (  13.41  )
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

On Mon, Aug 18, 2025 at 11:57:20AM -0700, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, two sets of always true conditions can be
> safely removed in the arm64 Kconfig file.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/Kconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

