Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B156CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9DHbROAZYF2TwwrumG5OuCJ3Fk+7SVR/NCVKcv2V1c=; b=seoEErJMf/X0/guHBm8V3CyBjq
	q0pKSDQNDdg7VKWaq6zXk+sv79e8lnkueJRgSL1T17nfD/ke4Ss9bsSaIn+URcXqgAvgdak+JkjcQ
	ljQqy2HIoGfKdVQdOokapsOUYZkGuSbskvyH58vj+CGEumRktzBZc8VSA9ORFWzLoKe3bKpbdlm8F
	mIxmPO0g/IXr383fNlHK2isMowwhiCaq02TkPssEQ5riaQWxWB5ZWbjZoz3RbGirOLcwkamAr8Ncg
	xtPyITIiOvkRvS5VXE5ZObr2DQcQjEzYlYm1fBM/FLyRuToVz9TJ4qq89Asjol6VTvnJ1vcS0Cnka
	ZB95xD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0t5-00000003Q2G-18mz;
	Fri, 15 Aug 2025 20:18:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyIr-000000038Lh-1v83
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 17:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACF92A57FA6;
	Fri, 15 Aug 2025 17:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9769EC4CEEB;
	Fri, 15 Aug 2025 17:33:17 +0000 (UTC)
Date: Fri, 15 Aug 2025 18:33:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com, james.morse@arm.com, ardb@kernel.org,
	scott@os.amperecomputing.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] arm64: cpufeature: add FEAT_LSUI
Message-ID: <aJ9vW8SgklYByjpB@arm.com>
References: <20250811163635.1562145-1-yeoreum.yun@arm.com>
 <20250811163635.1562145-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811163635.1562145-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_103321_560500_C9FE3061 
X-CRM114-Status: GOOD (  11.83  )
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

On Mon, Aug 11, 2025 at 05:36:31PM +0100, Yeoreum Yun wrote:
> @@ -3131,6 +3132,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
>  	},
> +	{
> +		.desc = "Unprivileged Load Store Instructions (LSUI)",
> +		.capability = ARM64_HAS_LSUI,
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64ISAR3_EL1, LSUI, IMP)
> +	},
>  	{},
>  };

Since this is only used in the kernel, I wonder whether we should hide
it behind #ifdef CONFIG_AS_HAS_LSUI. Otherwise we report it as present
and one may infer that the kernel is going to use it. Not a strong view
and I don't think we have a precedent for this.

-- 
Catalin

