Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85C0CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ele1vlbSomyiSBoUzoimnTmuiwSnUrUWA5wS4kbapQ=; b=R03JDSdC+2SR4T
	6RCeiOvnn11gvnGNqugiDygzyDcKG516Bgz/83MxY7QuRFVSmqgEs3SLFJZ9r/jABnUOLIoOSKES4
	J6b1tFKkqDhKfkDlVi4S4NLUmmi89kv3qamAGLCufTJcLeRIkO8qfZfLcPeCwlVBFIZQl8jNXUXBk
	1I7gcZdZY0GSHGikYfVa1W6Xls4fhbrA0iykYPR84BJ/YRu6ZkQjNvu2f7DXfgBgtoFqpZhbCbWmN
	BATHMZDLm0GIW+MqPnZbIkgToxNCfzUseG3wEBamJ1dxWZZ4RMxpFQvrfHrIdqa2QNh6tnSF5gDd8
	Hg3zXWnhEAeyF/5jvJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEi26-00000003gLQ-0TU3;
	Thu, 08 Oct 2026 06:55:14 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEi22-00000003gKQ-27ov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:55:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3Ele1vlbSomyiSBoUzoimnTmuiwSnUrUWA5wS4kbapQ=;
	b=ucUuazigWRp1V1+LbQc2FgmgpLRTcMZsKgMnZIyYVef7EtpyHy9mG1fIIq0Y3wwm37+G21sd1
	YB8i3ZPAcew4vA46UAaRmTsToMkdy7JfL8MCWraTfBqyapF5mt4bv+0UTIfp1eJEtdHt7PBCAIi
	BdYBQCA5d+FaEJhpTSSH0iU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j0gRX1FtWz12LHn;
	Thu,  8 Oct 2026 14:43:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B372D40577;
	Thu,  8 Oct 2026 14:55:01 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:55:00 +0800
Message-ID: <476fe846-af4f-4cdd-b98b-86cc053b37c2@huawei.com>
Date: Thu, 8 Oct 2026 14:54:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] arm64: entry: Only check for stack overflow on
 exceptions from EL1
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-3-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-3-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_235511_010352_6213490B 
X-CRM114-Status: GOOD (  16.62  )
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
> Checking for kernel stack overflow on entry from EL0 is largely
> pointless and gets in the way of using SPSel to switch to the overflow
> stack. If the kernel stack overflows on entry from userspace, that
> implies that it was unbalanced on the last exception return which means
> we can't sensibly reason about the state of the system given that we
> could've returned to an arbitrary virtual address in an arbitrary mode.
> 
> Remove the stack overflow check from the EL0 exception entry path.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 59f045e496ec..b5d8277f608a 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -54,6 +54,8 @@
>  	.endif
>  
>  	sub	sp, sp, #PT_REGS_SIZE
> +
> +	.if	\el == 1
>  	/*
>  	 * Test whether the SP has overflowed, without corrupting a GPR.
>  	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
> @@ -64,8 +66,11 @@
>  	tbnz	x0, #THREAD_SHIFT, 0f
>  	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
>  	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
> +	.endif
> +
>  	b	el\el\ht\()_\regsize\()_\label
>  
> +	.if	\el == 1
>  0:
>  	/*
>  	 * Either we've just detected an overflow, or we've taken an exception
> @@ -96,6 +101,7 @@
>  	sub	sp, sp, x0
>  	mrs	x0, tpidrro_el0
>  	b	el\el\ht\()_\regsize\()_\label
> +	.endif

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
>  	.endm
>  

-- 
Best regards,
Jinjie


