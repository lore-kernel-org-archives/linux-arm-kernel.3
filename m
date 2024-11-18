Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B19D591AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lmL6Ml3/ySb/jedLCT0Yz+EsgzLwGRL3HflcFIhF8o=; b=mAwZ2XAg8A5+Ljh+RHFJybW4wA
	ek9KfanzwK2dm+pf2CiYXnYLgN/k4O6jVox6264RWjdRmA5Ua6uyXsMEi2zQEE0kAUMPnGo1ORi+U
	MJrcPgHXS2U28eUVNcVtbUNb8gZ5kumDOjitwqsvA+5aUTqcd+V9Xq5hZOzABL0DVOpS8VuJtsVEs
	TIJSQp2+7wmKO/376XdKM/s3Mn5wbs1xjLH3xdxldhLOzoRIyVhhHxnX/5eaRAXPXQbhCFbb8ba/u
	7TefyS22Y/9XCtuPYmBfjHO0N2kfHULDSTL2ASvEjk357DvhHLQKP3+CWOklgn5Kh5JD/iTejtsWK
	54jmQBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5tm-0000000AFoy-3k68;
	Mon, 18 Nov 2024 17:50:54 +0000
Received: from smtp-27.smtpout.orange.fr ([80.12.242.27] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5sq-0000000AFj5-2W0r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 17:49:58 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D5sftAobEYfukD5sftuvIF; Mon, 18 Nov 2024 18:49:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731952189;
	bh=0lmL6Ml3/ySb/jedLCT0Yz+EsgzLwGRL3HflcFIhF8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CvgZ8LmOwyswLBBlxp/vw23cwYCgi859mdP/lWv8q9+7lxWq76eKJ/6xVrMiLNWhS
	 bDbsQAejkfjoKCbNqFu0zVKY0xH00v9QELTnn09AN1/OFDcJuN32GVZXsurra4am9u
	 aj4QbW5uSpSjGLZJJm+ZBlVNy/ogXPNDXK0ge2iJa92vEY5vbTQ3sMXnXL/AY3VaQr
	 PJRxLEAw3avSTxhQ5KF5si8XiwwOoao523j030lW3q7AOXZzQvdzOwShCDk82dzL+s
	 f/Yph6pW+azXI0snt2CAWV6s5HQ1wXMvj+CdS1Z3dqtxIkUvgbyHpws92sJGQx+XmT
	 6/XTmwg8cF9hg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 18 Nov 2024 18:49:49 +0100
X-ME-IP: 90.11.132.44
Message-ID: <52fb32e9-11f4-48a7-8042-0e09f26569d3@wanadoo.fr>
Date: Mon, 18 Nov 2024 18:49:44 +0100
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
X-CRM114-CacheID: sfid-20241118_094957_051676_9F0CC685 
X-CRM114-Status: GOOD (  10.56  )
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

Agreed.

> 
> Care to fix that as well?

NP, I'll send a patch.

CJ

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


