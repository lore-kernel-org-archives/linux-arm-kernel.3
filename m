Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFCAD591B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 20:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2taa0UsiDaOJXoR9CITESohKEOrxoakSVH3g+gRS8Vs=; b=O25U/LRW5AnlWdOzUyzA1ofM3x
	GO64iCDBPam1lGqxAW6C90MTNNYKSo8gjY78d8EmvwZbujDWfZErDybiAvxfb5LNnJGnSOS533BOR
	BKEUZGvwI34GjNe2D1qp27XGiZllUVeuYUgseLOvTF4aRKXYk7JffCiZhi32p2EnczndHZIFxrw0R
	PhOuq/cAVMbUTiJKhf+mIpXN973vRvy4ro0RBX65kZrQ0TE9lmuut3ZSsLINisWnPzj81z7IDDBtw
	+t0OjTH8/lm69anyc0ddNDVeb8CxbJQNDFa3xd3a1HXPh8Zz9CaMzP4wBPu1SmfFkoGF5z27yTV+4
	nivPwmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD8ZU-0000000AafC-1QbI;
	Mon, 18 Nov 2024 20:42:08 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD8YX-0000000AaU6-0H0X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 20:41:11 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D8YLtJy3aW6lUD8YLtdjd8; Mon, 18 Nov 2024 21:41:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731962465;
	bh=2taa0UsiDaOJXoR9CITESohKEOrxoakSVH3g+gRS8Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Z87tQCm2pAyVE5hS3osvEjqtFlDYtFmWWvZMd8pDyCk0/4P753RBg0TM4yBfGfiKb
	 IYDXx/GSbiYWXZF0D0xAJ7eHfHdv11FkvtklAenfc2M0LZ+p8r8XIs0vg4kpqqUm9b
	 zIwBSGzZ/0n7Niwb3Jk5rRTRpXOJYQlyLX0bxxtev2I+Fq9GmUIQ6biRxY3OMmpsze
	 N5R5VlrsO9hxVoPPewrR+jhgO6l9nCNx6H+ZfmsCeJ7SxqqO4TvL/xGGcht0itQmO4
	 JOvepPKaQhRPjZxpGyVIKx7ZGVZ2cksnFSj+aIwwFauyLqBsiKPBroFSL9dN3UM3u3
	 Lu+A4FwUcKT+g==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 18 Nov 2024 21:41:05 +0100
X-ME-IP: 90.11.132.44
Message-ID: <c8358dc9-24e0-40f9-b559-18cf7b93f5c3@wanadoo.fr>
Date: Mon, 18 Nov 2024 21:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs in
 exynos_irq_demux_eint16_31()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
 <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_124109_241563_EBCD4011 
X-CRM114-Status: GOOD (  12.40  )
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

Le 18/11/2024 à 10:40, André Draszik a écrit :
> On Sun, 2024-11-17 at 13:03 +0100, Christophe JAILLET wrote:
>> chained_irq_enter(() should be paired with a corresponding
>> chained_irq_exit().
>>
>> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
>> is not called.
>>
>> Add a new label and a goto for fix it.
>>
>> Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only.
>>
>> Review with care, irq handling is sometimes tricky...
> 
> Well spotted, thanks.
> 
> It looks like there is a similar problem in exynos_irq_request_resources()
> in same file. It should likely call gpiochip_unlock_as_irq() if clk_enable()
> failed.

Also wondering if it is needed in exynos_irq_release_resources() if 
clk_enable() fails and we early return.

I don't know how these callbacks are used and if we could dead-lock in 
such a situation.

What do you think?

CJ

> 
> Care to fix that as well?
> 
> That said,
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> 
> 
> Cheers,
> Andre'
> 
> 
> 


