Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17874C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQ+pM52Z9d9nH2LW96A3uCNySOonoA9pMirLJW0HCh4=; b=NyGadP8d5bgP9R6VkP/4m36Pv1
	MJU1R/KpHr6Iqxhxi23UvlE9RGwJHpwa8B4d+ly3kb+YxkVhMcVhRjozJ1y+gufEQpVK6gHQmBDLN
	QuPh59g2uricgfh/Aovii+vZ8VDxxueJuR6w7wwAGkpnLdEdhZEJxxSjLcOqndeDXaOzo2BSzP0zj
	u5Q9U/C7SlH9Nu3RtiYJZxTy9ryssSlCtcYAbL7tjCRdekf5j5wCq4CqidNpuI5izIxcR7QCZ3VPg
	NPJSN6k/+iCKNbpxq55pKSWGX4e+GBPzBwnYHYzsH0QENurJvYzQ1oCae+5qXbNKx3IsJp/eVDNUK
	sFDMmodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0H6w-00000006x6n-3FKe;
	Sat, 29 Aug 2026 11:20:34 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0H6t-00000006x6H-3FZ9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 11:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bQ+pM52Z9d9nH2LW96A3uCNySOonoA9pMirLJW0HCh4=;
	b=TEFXuUckI/Pn4sONOUGuMFyHYOcYIlgy0z27KZpCM2Ve2zmXJg9iDAC2kRZp3H
	bVj6KoMT4CjdTbjdjwJ8WurtpGFp/mcMOH7K255Sk37+2XeVxoj/m9dBuOK3Aqy1
	DCuVteMRkPW1cFHHn/OcyYJ7ZlKaRSExyTc6aQOIkdlC8=
Received: from [IPV6:2409:8a62:3e6:7890:62cd:186:f39c:9f61] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDn3+tiwJJqGlPIEA--.37249S2;
	Sat, 29 Aug 2026 19:20:03 +0800 (CST)
Message-ID: <e1f544bb-a338-4360-8158-a373881a9121@163.com>
Date: Sat, 29 Aug 2026 19:20:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: stm32: fix the unit of the hwspinlock timeout
To: antonio.borneo@foss.st.com
Cc: alexandre.torgue@foss.st.com, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com
References: <9b0f76a08a7c1dbaec4684b4bc013263e0149a4b.camel@foss.st.com>
 <20260827141127.25789-2-junan76@163.com>
Content-Language: en-US
From: Ju Nan <junan76@163.com>
In-Reply-To: <20260827141127.25789-2-junan76@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wDn3+tiwJJqGlPIEA--.37249S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr47Zr4DZFW3Cr13Ar48Crg_yoWDXFg_ua
	1rJ3srCa4qkFyF9w1DCrn3Za4F9anrXw409rs0gF13Cr9Fvw4jkrZ5uF93C3Z3ua13ta4D
	AF95Xr1Sy3y7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjasj5UUUUU==
X-Originating-IP: [2409:8a62:3e6:7890:62cd:186:f39c:9f61]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1AaIOmqSwGZYRwAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_042032_270723_0A608019 
X-CRM114-Status: GOOD (  10.46  )
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


> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index d97057ec2..0d888d30f 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -87,7 +87,7 @@
>  #define gpio_range_to_bank(chip) \
>  		container_of(chip, struct stm32_gpio_bank, range)
>  
> -#define HWSPNLCK_TIMEOUT	1000 /* usec */
> +#define HWSPNLCK_TIMEOUT_MS	1
>  
>  static const char * const stm32_gpio_functions[] = {
>  	"gpio", "af0", "af1",
> @@ -633,7 +633,7 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
>  
>  	if (pctl->hwlock) {
>  		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
> -						    HWSPNLCK_TIMEOUT);
> +						    HWSPNLCK_TIMEOUT_MS);

Please ignore this patch for now, since it has a dependency issue with this one:
https://lore.kernel.org/lkml/4dcb0fb67e12ec6e6aa812e6e93b435704c6105b.camel@foss.st.com/

Thanks Antonio, I will think more about what you said.

Regards,
Ju Nan


