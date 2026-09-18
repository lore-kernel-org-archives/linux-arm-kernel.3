Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958FBC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+g8+UxJXbBTwX2N40/dzce93+bWOJpHxoj4kNEwGWQ=; b=hGC4snQubWPpe+OLSCpnW+dKD3
	Wlg4y5i3AsHdF9Viw6EBi+OR42y8sgBU2iXoDsv1bm5dS5C1x1vWdjF1Qmofssu43HjEwFcBIMvDl
	BxqIkCC/WvlLkWxWRqAAKie2uGhzu0KIlRk7ikTKWD4HSw2Uf2HsiOL0hOc8JqlfiGx8dPfhCjoJW
	sRjWhmj4JX0mj5w0uOD7GdQnlDfS6o3kHgeClhw/YqVw5zqqJQel7rhWlknX/Kj77aVaIHvKE9c6g
	7Hlf7mtG/LhLVGYEinYRqpIytTe/ENOzio5ZFl+hYLaM39POC2EqTz5KoBF2GyRqdRzCCV1yfbhzc
	oReSXEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UAh-0000000DqRe-2gat;
	Fri, 18 Sep 2026 08:42:15 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UAe-0000000DqQl-2RTW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=7+g8+UxJXbBTwX2N40/dzce93+bWOJpHxoj4kNEwGWQ=;
	b=WJXSZjZQzxzO2WgIdscOrxkCYknvi3aF6qRYuiZt4MsL+/VuWUnKEWD/O5Q7z5
	mUuj6ATRg+1lk/hBMV5EuKHBa11aQQuBwpd2i+slidDkf/Wmzu5oL5Visd85IEaO
	e4Rj5Q8NqWMzJvmdAb0EW2wBOzrH7eYQx2XoywR3yuG3M=
Message-ID: <514b0d85-c6b6-4e31-af41-5df45319e770@126.com>
Date: Fri, 18 Sep 2026 16:41:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: request the MDIO reset GPIO only once
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260917125457.1353718-1-xiaolinkui@126.com>
 <ff811e9f-4d4b-4b26-a0b5-84cb2eb52618@bootlin.com>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <ff811e9f-4d4b-4b26-a0b5-84cb2eb52618@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3V80s+axqJuOTBg--.3829S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ury5WF45tr48GFy7tr4fKrg_yoW8AryUpr
	4rXF45JF98A3yxtrWDXw4kuF9YyrnIyF4DGr1I9w4Ikwn8Xr4ftrWxtr15Xay2kryqk3ya
	gr4xua4DuFyvyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcBMNUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlA5PJmqs+S6tCQAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_014212_985349_C064C4D9 
X-CRM114-Status: GOOD (  17.33  )
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

Hi Maxime,

Thanks for the review.

On 2026/9/18 00:10, Maxime Chevallier wrote:
> Hello,
> 
>> @@ -389,11 +389,21 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>>   		struct gpio_desc *reset_gpio;
>>   		u32 delays[3] = { 0, 0, 0 };
>>   
>> -		reset_gpio = devm_gpiod_get_optional(priv->device,
>> -						     "snps,reset",
>> -						     GPIOD_OUT_LOW);
>> -		if (IS_ERR(reset_gpio))
>> -			return PTR_ERR(reset_gpio);
>> +		/* Request the reset line only once and reuse the descriptor
>> +		 * afterwards. A second request of the very same line makes
>> +		 * gpiolib fail with -EBUSY, which devm_gpiod_get_optional()
>> +		 * passes through because it only filters out -ENOENT. The
>> +		 * reset would then abort early and leave the PHY un-reset.
>> +		 */
>> +		if (!priv->mdio_reset_gpio) {
>> +			priv->mdio_reset_gpio =
>> +				devm_gpiod_get_optional(priv->device,
>> +							"snps,reset",
>> +							GPIOD_OUT_LOW);
>> +			if (IS_ERR(priv->mdio_reset_gpio))
>> +				return PTR_ERR(priv->mdio_reset_gpio);
>> +		}
>> +		reset_gpio = priv->mdio_reset_gpio;
> 
> The problem is real, but this isn't the correct approach to solve that.
> 
> Instead of requesting the reset gpio on-the-fly at reset time (good example
> of when not to use devm_xxx) , let's request the gpio at probe time.
> 
> I suggest you move the devm_gpiod_get_optional() in stmmac_mdio_register(),
> which is called at probe time. Here, it makes sense to use devm_xxx.
> 

You're right, requesting the GPIO in the reset callback is the wrong
place for devm_xxx.

I'll send a v2 that moves the devm_gpiod_get_optional() call to
stmmac_mdio_register(), which runs at probe time. stmmac_mdio_reset()
will then just use the descriptor stored in stmmac_priv.

Thanks,
Linkui

> Thanks :)
> 
> Maxime
> 


