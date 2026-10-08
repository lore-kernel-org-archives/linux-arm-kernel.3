Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495FACA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrSmR91whuk08N644eAwBFjzDz11AL82MPhnOqBAPZ8=; b=IQ7ZNADbVTFTJy
	ghLjromWGc1JligMePyr9oiEAe6ICKiPWB3ZhFP8Cig2ByGjFrhqfaPYg75bsc45ktYXXalJfN2UU
	jFshRNQQye41Uo8SgYekA9kSRKaPsj7oYRzhAW2KiwHxeb9QuAvTu0yw9kT//GNonlbbIzbKsn4Sn
	1XxwA8d/MmzZnCy7iMGR4mV8PnFIPrU/Ap7nb/05nMudTDI/2OfB15lFRj7GXOpCWpNLbGUc85OI2
	l6ilPEH33ZX/JQyVBWEwKeKtHQt9BfHMYZOQgOkiw1wLfiS8t9bwBB2aXbxTUgaZRV517B+QfzLXu
	nDkjZ1Xqa3CGDziihpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjst-00000003vkn-21Sp;
	Thu, 08 Oct 2026 08:53:51 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjso-00000003vfc-1xVW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:53:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XrSmR91whuk08N644eAwBFjzDz11AL82MPhnOqBAPZ8=;
	b=2O08l0oeep6LTqg6atyOJge8tnPzdgqdxkfeQyYM9prGQusXxeTpmDu4bPCmvQW4yDixvHhMK
	TqVRN8TgFheshklaoiC9UePcklih1SFdiqGqsXgvxtCyX7q50VDE1ax691/+OYsjWIYsZT9bxPn
	UkqJowGBMbe1S6Qa421sm6k=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j0k422MQGz1prLc;
	Thu,  8 Oct 2026 16:41:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CA4040579;
	Thu,  8 Oct 2026 16:53:38 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 16:53:37 +0800
Message-ID: <f35a662d-07b0-4cc5-bd5e-14fcdff2f161@huawei.com>
Date: Thu, 8 Oct 2026 16:53:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/21] arm64: entry: Split up kernel_ventry macro into
 separate helper macros
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-19-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-19-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_015347_136915_367E315F 
X-CRM114-Status: GOOD (  15.13  )
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



在 2026/9/19 0:14, Will Deacon 写道:
> Handling entry from EL0, EL1h and EL1t in the 'kernel_ventry' assembly
> macro is getting a bit unwieldy as the control flow becomes increasingly
> dependent on the macro arguments.
> 
> Split 'kernel_ventry' into three leaf helper macros for EL0, EL1h and
> EL1t, which are then dispatched by simple wrappers.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index b4df2f23ebe7..38f9327e6a0a 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -36,10 +36,7 @@
>  	.endr
>  	.endm
>  
> -	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
> -	.align 7
> -.Lventry_start\@:
> -	.if	\el == 0
> +	.macro kernel_ventry_el0, ht:req, regsize:req, label:req
>  	/*
>  	 * This must be the first instruction of the EL0 vector entries. It is
>  	 * skipped by the trampoline vectors, to trigger the cleanup.
> @@ -52,8 +49,10 @@
>  	.endif
>  .Lskip_tramp_vectors_cleanup\@:
>  	sub	sp, sp, #PT_REGS_SIZE
> -	.else	/* \el == 1 */
> -	.ifc	\ht, h
> +	b	el0\ht\()_\regsize\()_\label
> +	.endm
> +
> +	.macro kernel_ventry_el1h, regsize:req, label:req
>  	sub	sp, sp, #PT_REGS_SIZE
>  
>  	/*
> @@ -66,13 +65,23 @@
>  	tbnz	x0, #THREAD_SHIFT, __bad_stack
>  	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
>  	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
> -	.else	/* EL1t */
> +	b	el1h_\regsize\()_\label
> +	.endm
> +
> +	.macro kernel_ventry_el1t, regsize:req, label:req
>  	msr	spsel, #0			// Stay on the overflow stack
>  	sub	sp, sp, #PT_REGS_SIZE
> -	.endif
> -	.endif
> +	b	el1t_\regsize\()_\label
> +	.endm
>  
> -	b	el\el\ht\()_\regsize\()_\label
> +	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
> +	.align 7
> +.Lventry_start\@:
> +	.if	\el == 0
> +	kernel_ventry_el0	\ht, \regsize, \label
> +	.else
> +	kernel_ventry_el1\ht	\regsize, \label
> +	.endif
>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?

Looks much clearer now.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	.endm
>  

-- 
Best regards,
Jinjie


