Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527A3105D992
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyE4CQgdazk9TvXMcT4uIOX0z6M4JHt2jPBcB6gTN8Q=; b=qTqKts9rMYhkTn
	QgmH30NKFeytHFiBKnUW0PCKH/fr+0gO7XKXsnOsujPl6p2n8c6ND6Q+Fh9Tg6GroAsT55hqPD8YB
	JZp29v2kuf2VI51rEQnuHvOFKcPItSLNMYgH+zaRq5bKfTIJ7EnOusA8WNYOXJcGKOYcEjl6bHSHv
	GuUCFwaj2ECdy+vgPxhpJJTeqlwlooqL7GbJqoPUrlVoo3T8x6E00HwHS9fXgeRRlTO5j2S3JFy1z
	zGp91jC5m8BVIwAv+kG5xvPOowje9AvxpRNh0gxHr0F2LArp2yw/6oNEAwgEZ4kRyEmaZ1LK5sP9W
	9ZCDsAmkBN7oOA+NjHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI48-000000086Wt-3DV1;
	Wed, 08 Apr 2026 01:50:49 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI45-000000086WX-1t2d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:50:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oyE4CQgdazk9TvXMcT4uIOX0z6M4JHt2jPBcB6gTN8Q=;
	b=MWWp/cEx5bzXjjGSdNs79WabodKbJ3BBNtQsERBzCwOjkTbnP6gYBrggVWWlwFNZ1ha4jvA2i
	HwAW8xrXiyrlucn4XiZvRCVJ8awhALzy2LU2c4Oa0sDRluwT6z9d/AT4/3OIaFmP1CQ+6R2pLIG
	XvwgChP+6wSwjMEqYAQ6vfo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fr5TQ4zTxzRhT3;
	Wed,  8 Apr 2026 09:44:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9300440538;
	Wed,  8 Apr 2026 09:50:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:50:39 +0800
Message-ID: <3ae3e1d3-c951-8204-82f8-0c0d431517c0@huawei.com>
Date: Wed, 8 Apr 2026 09:50:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/10] arm64: entry: Use
 irqentry_{enter_from,exit_to}_kernel_mode()
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-9-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-9-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_185045_675556_221D699B 
X-CRM114-Status: GOOD (  17.16  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> The generic irqentry code now provides irqentry_enter_from_kernel_mode()
> and irqentry_exit_to_kernel_mode(), which can be used when an exception
> is known to be taken from kernel mode. These can be inlined into
> architecture-specific entry code, and avoid redundant work to test
> whether the exception was taken from user mode.
> 
> Use these in arm64_enter_from_kernel_mode() and
> arm64_exit_to_kernel_mode(), which are only used for exceptions known to
> be taken from kernel mode. This will remove a small amount of redundant
> work, and will permit further changes to arm64_exit_to_kernel_mode() in
> subsequent patches.
> 
> There should be no funcitonal change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 3d01cdacdc7a2..16a65987a6a9b 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -39,7 +39,7 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
>  {
>  	irqentry_state_t state;
>  
> -	state = irqentry_enter(regs);
> +	state = irqentry_enter_from_kernel_mode(regs);
>  	mte_check_tfsr_entry();
>  	mte_disable_tco_entry(current);
>  
> @@ -55,7 +55,7 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>  					      irqentry_state_t state)
>  {
>  	mte_check_tfsr_exit();
> -	irqentry_exit(regs, state);
> +	irqentry_exit_to_kernel_mode(regs, state);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  /*

