Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36276CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9M1Gk66e75VyrGeSHywnIeDEWygfwmC5Z4EOkvRVmys=; b=JmasJKtrrvGO40SiMcBlfZ6is2
	QnJp2mSYKI+RjkV8IYpTYxl4Mwec+yhSvAOafiOOfL8HoeUUXrMhY5TIdOroEJggZZhLI9Eu3aUx/
	o5+DxToqZZeAVIo8Y3PpYApozYZyeQZ1ijNdJMnWOhHc6Zq0qCBBW/Ub5QMIvxsw6pNOcMOcOGDE1
	O9pATn4KTSmNzsfCUPs0NCIAkSGVhM/vvIGLfvUBQg6CCeuYEr+3pd3+qkN6/x/H9fDdAm13vALBg
	B3yIrApHIk8PNcFHLH6DAi2wEtKMfZRGna3Qo/GW5hjSbVXGrg8mA73g9iqL2Q3GqH+ZBa/wM1Q7b
	M8BLoK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpbj-00000006Beh-2OBr;
	Fri, 31 Oct 2025 13:55:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpbg-00000006Bdx-3WI0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 13:55:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cyj8J2hyPz6M4V2;
	Fri, 31 Oct 2025 21:52:00 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 36EBA140144;
	Fri, 31 Oct 2025 21:55:54 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Oct
 2025 13:55:53 +0000
Date: Fri, 31 Oct 2025 13:55:52 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ard Biesheuvel <ardb+git@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
	<ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Kees Cook
	<kees@kernel.org>
Subject: Re: [PATCH v4 04/21] arm64/simd: Add scoped guard API for kernel
 mode SIMD
Message-ID: <20251031135552.00004281@huawei.com>
In-Reply-To: <20251031103858.529530-27-ardb+git@google.com>
References: <20251031103858.529530-23-ardb+git@google.com>
	<20251031103858.529530-27-ardb+git@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_065557_046954_6D5186F0 
X-CRM114-Status: GOOD (  15.83  )
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

On Fri, 31 Oct 2025 11:39:03 +0100
Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Encapsulate kernel_neon_begin() and kernel_neon_end() using a 'ksimd'
> cleanup guard. This hides the prototype of those functions, allowing
> them to be changed for arm64 but not ARM, without breaking code that is
> shared between those architectures (RAID6, AEGIS-128)
> 
> It probably makes sense to expose this API more widely across
> architectures, as it affords more flexibility to the arch code to
> plumb it in, while imposing more rigid rules regarding the start/end
> bookends appearing in matched pairs.
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Very nice.

FWIW I looked at all the usecases and other than a couple of trivial
comments on individual patches they look good to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
For patches 4-19


> ---
>  arch/arm64/include/asm/simd.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> index 8e86c9e70e48..d9f83c478736 100644
> --- a/arch/arm64/include/asm/simd.h
> +++ b/arch/arm64/include/asm/simd.h
> @@ -6,12 +6,15 @@
>  #ifndef __ASM_SIMD_H
>  #define __ASM_SIMD_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/compiler.h>
>  #include <linux/irqflags.h>
>  #include <linux/percpu.h>
>  #include <linux/preempt.h>
>  #include <linux/types.h>
>  
> +#include <asm/neon.h>
> +
>  #ifdef CONFIG_KERNEL_MODE_NEON
>  
>  /*
> @@ -40,4 +43,8 @@ static __must_check inline bool may_use_simd(void) {
>  
>  #endif /* ! CONFIG_KERNEL_MODE_NEON */
>  
> +DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
> +
> +#define scoped_ksimd()	scoped_guard(ksimd)
> +
>  #endif


