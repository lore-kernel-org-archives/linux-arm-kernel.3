Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA03BC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcOiooG2G+sVvJmhsG5x6mYKgDHj4Ma1u4mxqtvuOgo=; b=Hsvpk4ieO5REzjr7+NFCk6x5tp
	mb8Uvf9mhn4tpo5C9znP3DqnYORnUhHVO6g1rutG1Wz7bOd0i30KrgOBmXzVaJm1RWjpNCWURSFLr
	VIPuaTkUOjqM+Y3ZXy/l/vvLH5g7+rcu3KwfzndstLZ7FwLhQFo4WFmrejARifKkNw3vrzzjMlZIY
	JQKu0leKk0SPZsZXHlRYb2ApbIBXqPJNeKxliLdlN5E1O0VmXRINSh4r1PGEEs3E3xLiHQVWdB68t
	Jx4z3+Qvt+///53IpfTBSUEtrVm6yk5+qLFAqSLL1gDt8YCpL/6tfSaXN6UDoQ1zRM7TghqUAZHlu
	UafyG7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ai3-0000000BEhC-1Txx;
	Thu, 17 Sep 2026 11:55:23 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ahz-0000000BEgn-2pHk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:55:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pcOiooG2G+sVvJmhsG5x6mYKgDHj4Ma1u4mxqtvuOgo=;
	b=cxw7qayv1a5Siaj9L1VfdzxrHF6Qgwz9VehGMpaIvQWE+AfpFR3OweTSMuzehuhUrITIegkoM
	4I0u3hGUuQxmnAg/ZzOqBVe6wNJZCtWYVMAXzgj1LPcS267SV9PKoPLToSu72tUs7zwjahpsXu+
	sGmIPlX5BpgIYNWKjJBdxX0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hlv6f5hzdz1cyPY;
	Thu, 17 Sep 2026 19:44:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7FFC8402AB;
	Thu, 17 Sep 2026 19:55:09 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 19:55:08 +0800
Message-ID: <e43f3ac8-a1f6-4d6d-8247-c64a181f588a@huawei.com>
Date: Thu, 17 Sep 2026 19:55:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/38] genirq: Do not call add_interrupt_randomness() in
 NMI context
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-38-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-38-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_045520_204233_C39F3FE7 
X-CRM114-Status: GOOD (  11.17  )
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



在 2026/9/14 18:21, Vladimir Murzin 写道:
> handle_irq_event_percpu() calls add_interrupt_randomness(). Similarly
> to 512718bbc51b ("genirq/chip: Don't call add_interrupt_randomness()
> for NMIs"), calling it while handling an NMI is not safe.
> 
> Stop calling add_interrupt_randomness() when handle_irq_event_percpu()
> runs in NMI context.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  kernel/irq/handle.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
> index b7d52821837b..114fd63b0210 100644
> --- a/kernel/irq/handle.c
> +++ b/kernel/irq/handle.c
> @@ -245,7 +245,8 @@ irqreturn_t handle_irq_event_percpu(struct irq_desc *desc)
>  
>  	retval = __handle_irq_event_percpu(desc);
>  
> -	add_interrupt_randomness(desc->irq_data.irq);
> +	if (!in_nmi())
> +		add_interrupt_randomness(desc->irq_data.irq);


Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	if (!irq_settings_no_debug(desc))
>  		note_interrupt(desc, retval);

-- 
Best regards,
Jinjie


