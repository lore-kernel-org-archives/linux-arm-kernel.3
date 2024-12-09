Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F21E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/XOXHUCFDal+7ZJpTKg2R4DEbgyt6V9kMbo0VrdFxQ=; b=rDf+zcJDx8hR0+lzl9XtEN6Nbj
	ss8UZJ9b3beeTgHyFBym0tuqRohbs2Bj4IWEa5QmQyI+eh1MBhI7hOqNzyIgg4lnQt9zI6gzGnNYH
	6hAXdBiYBgjbremfT1ky/6Puo/cgChiy7v59yJg2NEjl93MNBlHLUVcF/SPcx3t9mQJcga89N7oer
	3fgrqIOGl7Cwbp/Dr5GNIMz/9//1gSDzQ9xFGhsJPNz9JSq/xSvHBkoFHeksblQjF9J82fvsakxT4
	vRImPtlBQ2gZ5zlOK6nGP094OpINzmxTAIhRJ1DvhARRMQmYvhS5nyCb7ezagFSqBGfkbBb7zXCuu
	N4O3O8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgW3-00000008XFo-1lRP;
	Mon, 09 Dec 2024 16:21:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgUt-00000008Wra-2t3p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93CCD5C5E42;
	Mon,  9 Dec 2024 16:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C7FC4CEDE;
	Mon,  9 Dec 2024 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733761235;
	bh=A0khTX962w4Lj2UZnP6iKvULYKO5dZNtoX7UeansjzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uK+HxU+7UrafZWQAtX1yFKqLzr3GhtOoQ/I9qjhOXe6jTLtmtJJG3KeIfN+pCl52V
	 SuXy7P2d/WL1Ss8nzRAEHSimrk2PUmzwp7X26037XpdcMPYvmkYnE+sHgTIZsKrUK4
	 U9WyfTktZYBoew26+tTqWCm5l9AYXYCGHqzGRRGKntCtlMy3M+waCF9Y3y9LNbokf/
	 q6mQufLiMJrwhcZwa6S/tanQ6e/8jGJvZ54xMfKyei1YgNOLdvanuL4NyminJoySiF
	 InqCHHwsyavoTXPiTXjGvEClQPvgvlbr9uJ6SsQ+FWCXJ6saHAT+Aavv2twnJoGIbv
	 t9dq4WzA85JYg==
Date: Mon, 9 Dec 2024 16:20:29 +0000
From: Will Deacon <will@kernel.org>
To: Yabin Cui <yabinc@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
Message-ID: <20241209162028.GD12428@willie-the-truck>
References: <20241118222540.27495-1-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118222540.27495-1-yabinc@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_082035_819562_624957E9 
X-CRM114-Status: GOOD (  22.70  )
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

On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> selected.
> 
> On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
> Experiments on Android show 4% improvement in cold app startup time
> and 13% improvement in binder benchmarks.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
> 
> Change-Logs in V2:
> 
> 1. Use "For ARM platforms with ETM trace" in autofdo.rst.
> 2. Create an issue and a change to use extbinary format in instructions:
>    https://github.com/Linaro/OpenCSD/issues/65
>    https://android-review.googlesource.com/c/platform/system/extras/+/3362107
> 
>  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
>  arch/arm64/Kconfig                  |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tools/autofdo.rst
> index 1f0a451e9ccd..a890e84a2fdd 100644
> --- a/Documentation/dev-tools/autofdo.rst
> +++ b/Documentation/dev-tools/autofdo.rst
> @@ -55,7 +55,7 @@ process consists of the following steps:
>     workload to gather execution frequency data. This data is
>     collected using hardware sampling, via perf. AutoFDO is most
>     effective on platforms supporting advanced PMU features like
> -   LBR on Intel machines.
> +   LBR on Intel machines, ETM traces on ARM machines.
>  
>  #. AutoFDO profile generation: Perf output file is converted to
>     the AutoFDO profile via offline tools.
> @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
>  
>        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a -N -b -c <count> -o <perf_file> -- <loadtest>
>  
> +   - For ARM platforms with ETM trace:
> +
> +     Follow the instructions in the `Linaro OpenCSD document
> +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fdo/autofdo.md`_
> +     to record ETM traces for AutoFDO::
> +
> +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <loadtest>
> +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=i500009il
> +
> +     For ARM platforms running Android, follow the instructions in the
> +     `Android simpleperf document
> +     <https://android.googlesource.com/platform/system/extras/+/main/simpleperf/doc/collect_etm_data_for_autofdo.md>`_
> +     to record ETM traces for AutoFDO::
> +
> +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
> +
>  4) (Optional) Download the raw perf file to the host machine.
>  
>  5) To generate an AutoFDO profile, two offline tools are available:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fd9df6dcc593..c3814df5e391 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -103,6 +103,7 @@ config ARM64
>  	select ARCH_SUPPORTS_PER_VMA_LOCK
>  	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>  	select ARCH_SUPPORTS_RT
> +	select ARCH_SUPPORTS_AUTOFDO_CLANG
>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>  	select ARCH_WANT_DEFAULT_BPF_JIT

After this change, both arm64 and x86 select this option unconditionally
and with no apparent support code being added. So what is actually
required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
it just available for all architectures instead?

Will

