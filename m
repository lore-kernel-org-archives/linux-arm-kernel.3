Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9281C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uP7VhWa+3lPGf/kiDPxVE4KRzLICQhFofs0IJkLwpg=; b=yk792pJaxHqDMZbmSGfJC1vjSX
	z5eGlc/3N+kMNh1UOlri8GEeiqwDgQocYv6wUN+abZym+C2K8EIkj81XxEbI4RJkKBeJFlb6gFUKe
	YP1fO05Ud+O7ybuAFWSSOQgHZLZumTsR7d24cMUpQWGkdP/2WKPskvoI9bqyeYzRr+gf5De3wn+Kk
	+CMD8LyV9TXYmB4pNmwWfhr+DyZ4vC7gag8aabPX6L8xuPHVgXd77tiiDPHdlSMUUCoQlRZdIzU/B
	GMJhP2eMy3RrPIN9VrmEofGP6JRXbbXoo0U2nUjl0EPzhWh7GGfVlD69vIb+Z+fd/8+BZbcokrrhd
	XOKuGJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuBD-00000002gXk-3vOF;
	Fri, 02 May 2025 17:28:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu8B-00000002g7S-0zks
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5E0D6844D;
	Fri,  2 May 2025 17:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E7DC4CEE4;
	Fri,  2 May 2025 17:24:53 +0000 (UTC)
Date: Fri, 2 May 2025 18:24:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 1/4] arm64/feature: add MTE_STORE_ONLY feature
Message-ID: <aBT_4xNOL436-jJR@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410080723.953525-2-yeoreum.yun@arm.com>
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

(adding Peter C again, please keep him on cc for future versions; and
you can probably avoid others that don't have an interest in MTE ;))

On Thu, Apr 10, 2025 at 09:07:20AM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature and HWCAP.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Please briefly describe what the feature is in the commit log.

> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index e2b13454e38a..40f85ec01fe4 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -161,6 +161,7 @@ static const char *const hwcap_str[] = {
>  	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
>  	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
>  	[KERNEL_HWCAP_MTE_FAR]		= "mte_far",
> +	[KERNEL_HWCAP_MTE_STORE_ONLY]	= "mte_store_only",

Nit: "mtestoreonly"

-- 
Catalin

