Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D210C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmmflsCJs+O4XzU3h43GHEyo2nPD54EvzzNcB6z/E44=; b=1dEX8GGLbaW9G/BevT1cU1hw+/
	zpDlpZ6zi498vlTkx9whTMzVWugU37jNnVYhrfzWxZD4iT0J25iBBQEi6L4Tpc3Gi0mW9MHmChhL8
	EdTJ8no6aHUjihoKGBJI5SOruG5WIks8yhgCQQuv0bGCrAs0xEIrlf6GmLy3iciv/xOftdRFxNqDi
	Z95ujDCH5MAsPoiLgG2a+IkW8BDfLzaUIEVkVfVTBisUWaYb0WCgIYROnHfAami9w+zwg6+tslss8
	Q+AlNAr7l8CP7FI1wQREn/yAHaPVOGwm6mBl0RhRY6v03PGZ+NoKSS/5wthd2PocAVSENzgqq3XIk
	qqR2SSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANgh-0000000F9VL-2f8g;
	Sat, 26 Sep 2026 08:23:15 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANgd-0000000F9Ul-3T3S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 08:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=DmmflsCJs+O4XzU3h43GHEyo2nPD54EvzzNcB6z/E44=;
	b=hOrucROUvk7Az/fM59lAs7lVr4tq1vYJkMdKQXLuvRPHv1Qjbe+xavGHdkQ8E+
	esttqk3pnj1P64myVpFZ+E1UQ+b0xLHhFpFMMzGEwM5GiqggxlblnW5VvVSVaCX2
	wMk/3TXi92ppK4zmOvWmYLJaGYb2L75eWSyKM3PukW6HI=
Message-ID: <9ecf6f60-a2ab-4905-9ba6-011523684547@126.com>
Date: Sat, 26 Sep 2026 16:22:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: request the MDIO reset GPIO only once
To: Jakub Kicinski <kuba@kernel.org>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 lorenzo.bianconi@oss.qualcomm.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260921015727.2643540-1-xiaolinkui@126.com>
 <20260924093720.1aaa697e@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <20260924093720.1aaa697e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3NzuygLdqIQa8AA--.62328S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1xtF13tw15Gry7CrW3Wrg_yoWxKFc_uw
	nF9r97Cr4DXrn3Cw1rur4aqa9F9rsrt3WqgF1SgF98K34kX3yxurs0yrnIyFW8WrnavFn8
	Jrn8t34fAws7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjc18PUUUUU==
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqBPUq2q3gLNy3QAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_012312_450510_691C09F1 
X-CRM114-Status: UNSURE (   6.96  )
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

Hi Jakub,

On 2026/9/25 00:37, Jakub Kicinski wrote:
> On Mon, 21 Sep 2026 09:57:27 +0800 Linkui Xiao wrote:
>> +struct gpio_desc;
>>   struct stmmac_pcs;
>>   
>>   struct stmmac_resources {
>> @@ -287,6 +288,8 @@ struct stmmac_priv {
>>   
>>   	unsigned int pause_time;
>>   	struct mii_bus *mii;
>> +	struct gpio_desc *mdio_reset_gpio;
>> +	u32 mdio_reset_delays[3];
> 
> Someone already marked it as changes requested but also no need to
> forward declare structs unless first use is as function arguemnt.
Thanks for the review. I'll remove the forward declaration of
struct gpio_desc and include <linux/gpio/consumer.h> in stmmac.h
instead, since its first use is as a struct member.

I'll send v4 shortly.

Thanks,
Linkui


