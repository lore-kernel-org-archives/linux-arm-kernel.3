Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CB8C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPoYuv4adlatd4Hzk/LfgNc/D++K5WUmJkN1Q1g1F1g=; b=mPnNuIBKmIX5qpzbVvQ9F7HU8U
	ABzAmJY2SfBc3Z3zS6TdlNfVo/8x/1Hft2N4HSXXImvWFky144B3aVVNv2MTRa/xml4HvczcMF8gE
	Z/tIO28Yt6Y4iYLtC2SBt/4v1fUpeOLAKX5wFM8EedGCJp6Q8UuxJcRrYVaCg7FfgtXDDKtiPn2/a
	wQLMMf//pqfDO71czlXs/JkNCpSMBYAhUtXD/V679IQIcsIqoXwxB/q3ybELgVAQxk9dlOWYrlIc0
	l5hNF+icEBZ/fTIwE1/VhwzIYoz8oO7AnLo6JT05bDUnBl2bpJu5XgOGSeD0u55/LHoKnt+gqhob8
	dwY45bVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvpi-00000005b3T-1dL2;
	Thu, 06 Aug 2026 11:00:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvph-00000005b3L-29vZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C76060A69;
	Thu,  6 Aug 2026 11:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649A91F000E9;
	Thu,  6 Aug 2026 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786014016;
	bh=IPoYuv4adlatd4Hzk/LfgNc/D++K5WUmJkN1Q1g1F1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fw/IFohIGWLsUJarv3T5aajrdn7PBvI9ZTskXCDZZSQ3ndBiuaLH+Mj2XnyNmD6k5
	 Ku2CmzseKBcaN4mUc94dYbJwsJRnizbgGBkni3m47qomuRoTtS94YUYoh/wrRUmfW+
	 1bIQRAkSAzHE4sPeDKPHlboDg95ygEqRK5H4rN53qTvJ+rl5lsfHttLKtq7QPfT5k/
	 RMZSIQfg1ZFEbH/fEfzSKM7s5gdeqxhxMHTEOJMcttoUDcSOIN925uGBYGwJY9vtku
	 HJ/TPMErSgKZaTpG06tlwMk5yjGRpdLenNuf31Ms5CQyju1Mna88NNkB+pTjTCvE7Z
	 9KD7m+96OUp2w==
Date: Thu, 6 Aug 2026 12:00:11 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: He Kuang <hekuang@huawei.com>, Wang Nan <wangnan0@huawei.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: Ensure tools copy of linux/filter.h exports the
 UAPI
Message-ID: <anRpO_kxC9-uKnMh@willie-the-truck>
References: <20260805-arm64-selftest-fix-filter-h-build-v1-1-c29648ee3126@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-arm64-selftest-fix-filter-h-build-v1-1-c29648ee3126@kernel.org>
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

On Wed, Aug 05, 2026 at 10:32:23PM +0100, Mark Brown wrote:
> Normally when there is an include/foo.h and an include/uapi/foo.h the
> non-UAPI copy includes the UAPI copy.  This is the case for the in
> kernel copy of linux/filter.h but not for the copy in tools/ which
> results in build breaks for the newly added arm64
> seccomp_ptrace_x0_bypass selftest.  Add an explicit include of the uapi
> to fix the test and avoid future surprises.
> 
> Fixes: 2fcbc4adf997 ("kselftest/arm64: Add seccomp ptrace x0 bypass test")
> Fixes: f143c11bb7b9 ("tools: bpf: Use local copy of headers including uapi/linux/filter.h")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/include/linux/filter.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/include/linux/filter.h b/tools/include/linux/filter.h
> index bcc6df79301a..4ead4e72097c 100644
> --- a/tools/include/linux/filter.h
> +++ b/tools/include/linux/filter.h
> @@ -6,6 +6,7 @@
>  #define __TOOLS_LINUX_FILTER_H
>  
>  #include <linux/bpf.h>
> +#include <uapi/linux/filter.h>
>  
>  /* ArgX, context and stack frame pointer register positions. Note,
>   * Arg1, Arg2, Arg3, etc are used as argument mappings of function

Is this still needed if we take the test changes from Jinjie?

https://lore.kernel.org/r/20260806090935.39311-1-ruanjinjie@huawei.com

Will

