Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BA1C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 03:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qUyEujLX22GdEnd5CUDnJ4Pz1LPAiyWrj7/y+BbMoE=; b=xehJSde+hhpxEqrFlz3pZ98xpa
	xm5zlL+3TpUjCsz1koyvVOwgdfZukmr3N/KHUhpsas5z8WWCYqzOvmpe2TvVjzP0kZka7OJc58iZb
	qYoLxGxASASzO9A4lQTL/9hHBgWYHUc69tdc/gf1783QHtvIL7Jn2Z1BSPeMrTI92r4w6NUo71O5t
	yySn7Xl6GELEO8B6ZylGvuCh35fmqHTEdiiuMCdKaVSxIzT97z8AEYW2tSxdZepYaTO+UrPzOT5Z7
	ZjDXKUSpAs3gt8VplGhjEjIVUrfAtXm04EJsoEm4TOoc2w+lK6FSS2Gn2PvAR+KYzrQbFTTPED8br
	y9f3e9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u35AG-0000000COwq-3yqf;
	Fri, 11 Apr 2025 03:34:48 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u358R-0000000COno-1zXF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 03:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744342371; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6qUyEujLX22GdEnd5CUDnJ4Pz1LPAiyWrj7/y+BbMoE=;
	b=Fxs1oatWg4nc7bj+L6vz8tqThAV9UpAYF/PO1TCNnDlMhUbO7UUl6qvf2Xm3vektGh1q0HGNTRBVVpcwV5M36Vtf+COTll0qEF8pNQez80BYQnSJLCyS8yE+W0fBZyWridgYnNTQOkZueKWtwe8RzGOt5BJf031MRZ73isDJaZU=
Received: from 30.246.160.68(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WWRkGtA_1744342365 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Apr 2025 11:32:47 +0800
Message-ID: <18875bd7-bf01-4ba8-b38a-4c0767e3130e@linux.alibaba.com>
Date: Fri, 11 Apr 2025 11:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/11] arm64: idle: export arch_cpu_idle()
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-pm@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, x86@kernel.org,
 pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de,
 lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com,
 mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org, maz@kernel.org,
 misono.tomohiro@fujitsu.com, maobibo@loongson.cn, zhenglifeng1@huawei.com,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <20250218213337.377987-1-ankur.a.arora@oracle.com>
 <20250218213337.377987-11-ankur.a.arora@oracle.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250218213337.377987-11-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_203256_175698_4E91DAE8 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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



在 2025/2/19 05:33, Ankur Arora 写道:
> Needed for cpuidle-haltpoll.
> 
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>   arch/arm64/kernel/idle.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
> index 05cfb347ec26..b85ba0df9b02 100644
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -43,3 +43,4 @@ void __cpuidle arch_cpu_idle(void)
>   	 */
>   	cpu_do_idle();

Hi, Ankur,

With haltpoll_driver registered, arch_cpu_idle() on x86 can select
mwait_idle() in idle threads.

It use MONITOR sets up an effective address range that is monitored
for write-to-memory activities; MWAIT places the processor in
an optimized state (this may vary between different implementations)
until a write to the monitored address range occurs.

Should arch_cpu_idle() on arm64 also use the LDXR/WFE
to avoid wakeup IPI like x86 monitor/mwait?

Thanks.
Shuai



