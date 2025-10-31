Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA4CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hp4POrzGEzYWsXLUiq24bsIuyJ9VI9HcKwxkmxgRkM=; b=FMCCZmlBBsKzr8+LHM3BGClf+k
	dJLmBAnOroS4yMPcGGbXGm45tKNxZuotpXj85vCL51IHsy4BogXGqsa4jlee6HQSzGat8XrnVXmxm
	YXfa7jPAtFJdXV5lOlLGQWkd9kfDp+ptU+sLNHuoP4ZSc15OXAD2QH75aSBKVPY+SaCV5N1iHz58y
	n8qkTtilUJ/sK1p8+RgSWueSRnQ4Y2Fpnipm2C4YhB/fyZGPwIFq3PUgZW3grqfgc8mXAhondTiwp
	QZsLvZkY/fSzwU+dm6ObaNZ15qRXWJS+v0lZE/nChDGFuNH+V1HKHw+PL7Cy6xJ5F8z9Vez59OtGy
	NKd4azyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpYb-00000006BFA-1p9A;
	Fri, 31 Oct 2025 13:52:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpYY-00000006BEF-2dlZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 13:52:44 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4cyj7w6bTnzHnGk2;
	Fri, 31 Oct 2025 13:51:40 +0000 (UTC)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 772C4140144;
	Fri, 31 Oct 2025 21:52:37 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Oct
 2025 13:52:36 +0000
Date: Fri, 31 Oct 2025 13:52:35 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ard Biesheuvel <ardb+git@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
	<ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 16/21] crypto/arm64: sm3 - Switch to 'ksimd' scoped
 guard API
Message-ID: <20251031135235.000007cb@huawei.com>
In-Reply-To: <20251031103858.529530-39-ardb+git@google.com>
References: <20251031103858.529530-23-ardb+git@google.com>
	<20251031103858.529530-39-ardb+git@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_065242_991576_F52016F0 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, 31 Oct 2025 11:39:15 +0100
Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Switch to the more abstract 'scoped_ksimd()' API, which will be modified
> in a future patch to transparently allocate a kernel mode FP/SIMD state
> buffer on the stack, so that kernel mode FP/SIMD code remains
> preemptible in principe, but without the memory overhead that adds 528
> bytes to the size of struct task_struct.
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Hi Ard,

Trivial comment inline.

> ---
>  arch/arm64/crypto/sm3-ce-glue.c   | 15 ++++++++-------
>  arch/arm64/crypto/sm3-neon-glue.c | 16 ++++++----------
>  2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
> index eac6f5fa0abe..24c1fcfae072 100644
> --- a/arch/arm64/crypto/sm3-ce-glue.c
> +++ b/arch/arm64/crypto/sm3-ce-glue.c
> @@ -5,7 +5,6 @@
>   * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
>   */
>  
> -#include <asm/neon.h>
>  #include <crypto/internal/hash.h>
>  #include <crypto/sm3.h>
>  #include <crypto/sm3_base.h>
> @@ -13,6 +12,8 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  
> +#include <asm/simd.h>
> +
>  MODULE_DESCRIPTION("SM3 secure hash using ARMv8 Crypto Extensions");
>  MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
>  MODULE_LICENSE("GPL v2");
> @@ -25,18 +26,18 @@ static int sm3_ce_update(struct shash_desc *desc, const u8 *data,
>  {
>  	int remain;
>  
> -	kernel_neon_begin();
> -	remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
> -	kernel_neon_end();
> +	scoped_ksimd() {

Why does this get brackets unlike other cases?

> +		remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
> +	}
>  	return remain;
>  }
>  
>  static int sm3_ce_finup(struct shash_desc *desc, const u8 *data,
>  			unsigned int len, u8 *out)
>  {
> -	kernel_neon_begin();
> -	sm3_base_do_finup(desc, data, len, sm3_ce_transform);
> -	kernel_neon_end();
> +	scoped_ksimd() {
> +		sm3_base_do_finup(desc, data, len, sm3_ce_transform);
> +	}
>  	return sm3_base_finish(desc, out);
>  }
>  
> diff --git a/arch/arm64/crypto/sm3-neon-glue.c b/arch/arm64/crypto/sm3-neon-glue.c
> index 6c4611a503a3..15f30cc24f32 100644
> --- a/arch/arm64/crypto/sm3-neon-glue.c
> +++ b/arch/arm64/crypto/sm3-neon-glue.c
> @@ -5,7 +5,7 @@
>   * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>   */
>  
> -#include <asm/neon.h>
> +#include <asm/simd.h>
>  #include <crypto/internal/hash.h>
>  #include <crypto/sm3.h>
>  #include <crypto/sm3_base.h>
> @@ -20,20 +20,16 @@ asmlinkage void sm3_neon_transform(struct sm3_state *sst, u8 const *src,
>  static int sm3_neon_update(struct shash_desc *desc, const u8 *data,
>  			   unsigned int len)
>  {
> -	int remain;
> -
> -	kernel_neon_begin();
> -	remain = sm3_base_do_update_blocks(desc, data, len, sm3_neon_transform);
> -	kernel_neon_end();
> -	return remain;
> +	scoped_ksimd()
> +		return sm3_base_do_update_blocks(desc, data, len,
> +						 sm3_neon_transform);
>  }
>  
>  static int sm3_neon_finup(struct shash_desc *desc, const u8 *data,
>  			  unsigned int len, u8 *out)
>  {
> -	kernel_neon_begin();
> -	sm3_base_do_finup(desc, data, len, sm3_neon_transform);
> -	kernel_neon_end();
> +	scoped_ksimd()
> +		sm3_base_do_finup(desc, data, len, sm3_neon_transform);
>  	return sm3_base_finish(desc, out);
>  }
>  


