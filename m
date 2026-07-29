Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2077C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 04:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g61n9d1IViPkUAiOWnNWq2bymq99oNhhk+FJJvFjI8M=; b=nSvDg95CogFtVc
	IraK7lozr9E/aWGl7d+EInO1Dgwbg4uLzWbe1XwiK5LPGcgZ9m4Bic6F68JJdXVnHxHU5hvVxrPDW
	fQU/BOogE7/sIOkERMoj4ClVJT4J9W8aababx7UCY7t2sKYvAEDlnjHkk1xT2MSnc1JKM6JCP41Cu
	nQu3otXbOsOMowFZW0rXwbvFJ0UGPM6p998CorjjpbUWxSrrcdvjylpGyIKVpylzjFouKCz+c1Np3
	tNTgyboT1pcqbmnoRXWUUyOeFclXxyI/X3XGpyMWcz2BIo7jqP5szIo9a3A035Sv8XC0I1HYQKYv8
	kn+Lnm2hwoHxD0xBDtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovTN-00000006nYi-3NEp;
	Wed, 29 Jul 2026 04:00:49 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovTL-00000006nYI-0J9V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 04:00:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=g61n9d1IViPkUAiOWnNWq2bymq99oNhhk+FJJvFjI8M=;
	b=bEFnSR+lII8hQtAlMaNPv3Qvjm9ZgAvZZvtgzKjkAs8+H5PjQuRI4Sf3/qmOeGfF149dr7xii
	SNWBPF3ZJBbTiiV6gSA0jPxn13QOZOsys0UpZw3XrNVs79KqDNO7lgwK/23S9nNZ9C0j1Ou9oVv
	zmMP0DOc3D8SI87bRUI2lNg=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h8z005krKzmV91;
	Wed, 29 Jul 2026 11:51:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D60B340565;
	Wed, 29 Jul 2026 12:00:39 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 12:00:38 +0800
Message-ID: <9f28ee32-d0cf-4297-9a41-03d499273ff8@huawei.com>
Date: Wed, 29 Jul 2026 12:00:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/13] arm64: preempt: Treat should_resched() as
 unlikely
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-3-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260728123859.2911495-3-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_210047_414958_C8A2D9C5 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, maz@kernel.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/7/28 20:38, Mark Rutland 写道:
> The arm64 implementation of should_resched() doesn't treat the need to
> resched as unlikely, while all other implementations do, e.g.
> 
> * asm-generic since:
>   bdb43806589096ac ("sched: Extract the basic add/sub preempt_count modifiers")
> 
> * x86 since:
>   c2daa3bed53a8117 ("sched, x86: Provide a per-cpu preempt_count implementation")
> 
> * s390 since:
>   c360192bf4a8dc72 ("s390/preempt: move preempt_count to the lowcore")
> 
> Do the same for arm64.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/preempt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index ca2ad1a8db095..3ef24ab8f3399 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -58,7 +58,7 @@ static inline void __preempt_count_sub(int val)
>  static inline bool should_resched(int preempt_offset)
>  {
>  	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
> -	return pc == preempt_offset;
> +	return unlikely(pc == preempt_offset);

It is rare that preempt_count is 0 or a specific value. Therefore, it is
reasonable to use unlikely.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  static inline bool __preempt_count_dec_and_test(void)


