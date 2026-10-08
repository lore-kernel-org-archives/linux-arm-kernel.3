Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C0FCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VV97U+fI+2BU63oSyzjtBz89NKgr2GCnmm8FLfD0RyY=; b=a7Aq3ibxuxcoNw
	LazMZ7rmJR0QdfX/ufp4dc6q42yGdQm7lfexyO+Kcnzgf4gyoqyUamTPlsxx4uMnYEGq6Z6qG75rs
	cs5ZVgxxhy1u5fuCVJbu/2UjTVlAolrq6wrhRG/kLgPY9u/LXLe5CPMgIKAuydzF9E7tHEwh5Etx1
	1iVjIl/455CVCOkS/88SEG8NIlgLxR3mYt47ug1g+PfRN+vpmK5OZ908aHj7JDlXJ6ulHuUm1Oodr
	gLphEffyqa/ltXwZdtXQ5LEClNSHbgFacZLPbqySQmwBAFjBwkYcjPWcGgvltCKJTjpB122EJp7zm
	SMmlbJADvak/KGlKgPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEj17-00000003oLj-2YAI;
	Thu, 08 Oct 2026 07:58:17 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEj14-00000003oL5-3mwk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:58:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VV97U+fI+2BU63oSyzjtBz89NKgr2GCnmm8FLfD0RyY=;
	b=JJ9PrRuNTyQACbAsJpgBXsMOj+ibz4H/Bw2cZG2xFX16XmzWjQxGuGI1RhEnJlSSSUlnKLxQg
	VkMRieu4gxl0qYqDMLs0PVbXOHBpIEYS+fr3Jh+nuzm+/yjQsnhmJ77BbGRAF5YtGtnrG+e4t7e
	VJh27x1ulFNNLg1rg3cnDwY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j0hr02Rrcz1T4MQ;
	Thu,  8 Oct 2026 15:45:52 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C3DE203C1;
	Thu,  8 Oct 2026 15:58:05 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:58:04 +0800
Message-ID: <37913984-3cf0-4bfb-8adf-f87ec65c8b75@huawei.com>
Date: Thu, 8 Oct 2026 15:58:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] arm64: stackprotector: Re-enable per-task
 stackprotector
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-10-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-10-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_005815_273771_EDB749BC 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/19 0:13, Will Deacon 写道:
> Now that 'current' resides in TPIDRRO_EL0, update the per-task
> stackprotector compiler invocation to use the new register.
> 
> Note that this requires a very recent build of clang [1], as (unlike
> GCC), it historically rejected all registers other than SP_EL0.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Link: https://github.com/llvm/llvm-project/pull/188054 [1]
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/Kconfig  | 3 +--
>  arch/arm64/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b8270b301809..020fcaf36b1b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2450,12 +2450,11 @@ config RANDOMIZE_MODULE_REGION_FULL
>  	  exhaustion, modules might be able to fall back to a larger 2GB area.
>  
>  config CC_HAVE_STACKPROTECTOR_SYSREG
> -	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=0)
> +	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=tpidrro_el0 -mstack-protector-guard-offset=0)
>  
>  config STACKPROTECTOR_PER_TASK
>  	def_bool y
>  	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_SYSREG
> -	depends on BROKEN
>  
>  config UNWIND_PATCH_PAC_INTO_SCS
>  	bool "Enable shadow call stack dynamically using code patching"
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 6b005c8fef70..a293ab67818f 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -72,7 +72,7 @@ ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
>  prepare: stack_protector_prepare
>  stack_protector_prepare: prepare0
>  	$(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg		  \
> -				-mstack-protector-guard-reg=sp_el0	  \
> +				-mstack-protector-guard-reg=tpidrro_el0	  \

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  				-mstack-protector-guard-offset=$(shell	  \
>  			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
>  				$(objtree)/include/generated/asm-offsets.h))

-- 
Best regards,
Jinjie


