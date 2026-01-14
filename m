Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1707D3CC84
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 23:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiEt5tJdQlHAgpu2iagQYFNv192gre7oSLS/ZJhMtzE=; b=koPRr04ZvRQkQ2wCkElYoFnVzD
	5iHZDfb/oGgK6RrKoj9f3hlWlzD9ORsaJfzxq4SGrV+nfSB0g5y60KVGfU7gSD2o7elRzU7sT0AYA
	hoDMFnjDQo4fHtX8jHJ9nWItIAEblVhvWva41rZalHj+W8WFhmMx87Oeb93BJuJTOgtHk581VfUxH
	c/qSXaw/ZfgWfr9NXjDQqME2umS5nBwGG32hoYZ2NPbvDdQBw/sLRmmDfZZzBvYlVP+LE1lxkrq3L
	CuLAEHLpQba6Py+WM9ZpggpeJluxoC0Ld7/5kgSVXF59KrZWReJoM4eZJXRP1AnL+bnteWYa6nCWR
	E76dnAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAGl-0000000B5gc-37sw;
	Wed, 14 Jan 2026 23:27:21 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAGi-0000000B5fn-2x2c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 23:27:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2988210BED7;
	Thu, 15 Jan 2026 00:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1768433233;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IiEt5tJdQlHAgpu2iagQYFNv192gre7oSLS/ZJhMtzE=;
	b=YUg1qGLJSITou0JJmJWYIydNnCKQ1FkTkndzOlAplCVJORItwbrLJGylBFPxYUvrzwguKA
	88r+FXMfkjMQZyWds34VpeotYk0TorwZZ/wOWAJvlrLntLf9r423sH6R5u3kF6bFI5fTi6
	t/zJ7TqUpNjZI1gU2qzNc9IYc5yH5daf2Ax6np8YLkc/xkoHgxu5zL2yZcJu7KCF3yXm+Y
	Eq2MbN0RVOHKU4JX9BUTSYsM0SsKibe71KoAogQVM2Wdsqwx/dgZlQrdPgU6lFB8a0Sx7J
	PndaRF57SYoIC4rvW18yVEfDNt82vOkMitOcqIGTq5HFtE9srI9um8AO6BMPfA==
Message-ID: <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
Date: Thu, 15 Jan 2026 00:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,PATCH] net: stmmac: stm32: Do not suspend downed
 interface
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Christophe Roullier <christophe.roullier@st.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260114081809.12758-1-marex@nabladev.com>
 <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
 <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_152716_972461_D6249581 
X-CRM114-Status: GOOD (  24.64  )
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

On 1/14/26 6:12 PM, Russell King (Oracle) wrote:
> On Wed, Jan 14, 2026 at 04:29:17PM +0000, Russell King (Oracle) wrote:
>> On Wed, Jan 14, 2026 at 09:17:54AM +0100, Marek Vasut wrote:
>>> If an interface is down, the ETHnSTP clock are not running. Suspending
>>> such an interface will attempt to stop already stopped ETHnSTP clock,
>>> and produce a warning in the kernel log about this.
>>>
>>> STM32MP25xx that is booted from NFS root via its first ethernet MAC
>>> (also the consumer of ck_ker_eth1stp) and with its second ethernet
>>> MAC downed produces the following warnings during suspend resume
>>> cycle. This can be provoked even using pm_test:
>>>
>>> "
>>> $ echo devices > /sys/power/pm_test
>>> $ echo mem > /sys/power/state
>>> ...
>>> ck_ker_eth2stp already disabled
>>> ...
>>> ck_ker_eth2stp already unprepared
>>> ...
>>> "
>>>
>>> Fix this by not manipulating with the clock during suspend resume
>>> of interfaces which are downed.
>>
>> I don't think this is the correct fix. Looking back at my commits:
>> b51f34bc85e3 net: stmmac: platform: legacy hooks for suspend()/resume() methods
>> 07bbbfe7addf net: stmmac: add suspend()/resume() platform ops
>>
>> I think I changed the behaviour of the suspend/resume callbacks
>> unintentionally. Sorry, I don't have time to complete this email
>> (meeting.)
> 
> I think I'm going to start over, trying to figure out what happened.
> 
> c7308b2f3d0d net: stmmac: stm32: convert to suspend()/resume() methods
> 
> Did the conversion, and it always called stm32_dwmac_clk_disable() and
> where it exists, dwmac->ops->suspend() on suspend, provided
> stmmac_suspend() returns zero (which it will do, even if the interface
> is down. On resume, it always calls dwmac->ops->resume() and
> stm32_dwmac_init() before calling stmmac_resume().
> 
> The conversion added hooks into ny new ->suspend() and ->resume()
> methods to handle the stm32_dwmac_clk_disable(), dwmac->ops->suspend(),
> dwmac->ops->resume() and stm32_dwmac_init() steps.
> 
> However, in 07bbbfe7addf I failed to realise that, in order to keep
> things compatible with how stuff works, we need to call
> priv->plat->suspend() even if the interface is down. This is where
> the bug is, not in your glue driver.
> 
> Please try this:
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a8a78fe7d01f..2acbb0107cd3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8066,7 +8066,7 @@ int stmmac_suspend(struct device *dev)
>   	u32 chan;
>   
>   	if (!ndev || !netif_running(ndev))
> -		return 0;
> +		goto suspend_bsp;
>   
>   	mutex_lock(&priv->lock);
>   
> @@ -8106,6 +8106,7 @@ int stmmac_suspend(struct device *dev)
>   	if (stmmac_fpe_supported(priv))
>   		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
>   
> +suspend_bsp:
>   	if (priv->plat->suspend)
>   		return priv->plat->suspend(dev, priv->plat->bsp_priv);
>   
This works too, thank you.

Will you send this fix ?

