Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB94FC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 03:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHN8oJW86GtmFTcDsS8HMkGJt8UaI0Cndto85RL0Sqg=; b=toEdmxRacYFWVEhR3PLlikOo0a
	OCyRNtgVHoFJEu43tNyp3XKmW7x7tMYR4RxP1Zsx/nnfxbwOmktN6wvGgCSg82qr67eO5QcRUwUqZ
	jZAytgTMrjM7HDpwJG+ZNfKsHt+M46seVP2IGNLBtfWBi9CWSDfs2Lp1ebLrOMZOpzRbDMyvefa31
	6Phh7H3nyXhqz1c8aIB6OQsuThESngetWb+HfRYdf6hRSlZvfajmx/1YnEU+4mVuc13VGcX2CKSYN
	3EMsN/L3GGZyHLUe1JT8M8Y8UmaTumRaF4zjjh/+bfYi2n1XwS5ubpDqvnwYN0YgemenzSnOEAkoi
	hZF0o7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mHB-00000007xys-2BLf;
	Tue, 08 Sep 2026 03:13:37 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mH8-00000007xyT-0KZv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 03:13:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kHN8oJW86GtmFTcDsS8HMkGJt8UaI0Cndto85RL0Sqg=;
	b=uYb/sscdXMfGCoywCu9WF61WqB68Hfi+PTJ7b3alKoqi1teqhvsbcgmZqmkvaYp9umCqs/XTn
	G/0inFxorrqNFkqqm6NjVhjb5AAfdptxLJupSYN3qFGgdafCVTOjXxcpO75zqmrdWghzxi7fvI6
	sLmDQGZS604jZrzZKykKDK4=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hf7yr4JSTzLlX1;
	Tue,  8 Sep 2026 11:02:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 29AF14055B;
	Tue,  8 Sep 2026 11:13:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 11:13:21 +0800
Message-ID: <a3bb7095-6759-45b8-b3b8-49820d97b68c@huawei.com>
Date: Tue, 8 Sep 2026 11:13:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] cpu/hotplug: Avoid trying to bring up CPUs that are
 already online
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-3-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-3-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_201335_085595_0C3317B6 
X-CRM114-Status: GOOD (  16.54  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> There's little point trying to bring up a CPU that is already online.
> Although _cpu_up() handles this case by doing nothing (because the
> target state has already been reached), it's wasted effort when we can
> easily elide the call to cpu_up() in the first place.
> 
> Check that the target CPU isn't already online before invoking cpu_up()
> from cpuhp_bringup_mask().
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  kernel/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 198c929c452a..97a9bfe4edad 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1769,7 +1769,8 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
>  	for_each_cpu(cpu, mask) {
>  		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
>  
> -		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
> +		if (!cpu_online(cpu) && cpu_up(cpu, target) &&
> +		    can_rollback_cpu(st)) {

Make sense to me.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  			/*
>  			 * If this failed then cpu_up() might have only
>  			 * rolled back to CPUHP_BP_KICK_AP for the final


