Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8B6E65298
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LARm2Y3oL9MqfVRvr87lH7jEV+ZHtuB87P+3QLUsfN8=; b=I5Jq8LcRFUkgOBdsMkSjzNDHtR
	lzEOcUZb9LPGuec6qbQC+HenCCDFgfJSOM4dlc9EgL7TmKxhpYJQVh4AqEOYGeZS0L7PyeYP7/oAa
	TA05M4D3i2AGby870LAY0fLcZy6gKjQf49bJOjNYRK+Z01s2pzc73XknZ0QtaPnwP76XeyxMB2pJk
	yws0841WBu4lmXLK1li9ItXAhIctTElJeGwTfyqu6r/5YjCv7vIThfMfy01OGGU7uEaAOUKt7E+hd
	YlfHOUuP+YyPGv7tjgfxzFFNjJqIDksBbqjplvLzFqmOD2GzRgJxBNEUxeaULC7pjOhD/0izROuBI
	VbxFgXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcJM-000000045Qm-2EOg;
	Sun, 01 Feb 2026 18:36:40 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcJJ-000000045Pp-3yed
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 18:36:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F55C109D9D;
	Sun,  1 Feb 2026 19:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769970991;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LARm2Y3oL9MqfVRvr87lH7jEV+ZHtuB87P+3QLUsfN8=;
	b=NBNAV/WqTMJCNSC3XKmzFMaQg50nfqsgqNjohQWgTwz2cl63bw7bslLiPdI7BHXhL/Czq7
	FOeJO9GgdbK7MVeCHC8R7tilL8fqzmPLqNh7TiJcxRp4BoaYI+6CqlY4d5fe55jho6HQEU
	9tmHj3kpUwsKNhQyYMYrmdRHKPQi8atOhn9uj6n20dGBsqoGFybPwDpSmRiN7iH3p3qKH2
	NDZhfrvRzkRz33AokZ7yITLhWf6B3ysRdf2lk+rQHg44Uyg84JbZH3lXJYWoPZTMlM6bV0
	SMEcPVnREi3xMMEgNGgiz/oGwm9csACAkFjfxPSV3MJXaH6JRgYbT0cVtc8tWw==
Message-ID: <35d31893-2a28-410f-a1c7-038b4167e265@nabladev.com>
Date: Sun, 1 Feb 2026 19:20:09 +0100
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
 <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
 <aXzT1UCpG4kN-dQv@shell.armlinux.org.uk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aXzT1UCpG4kN-dQv@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_103638_208615_B77BF767 
X-CRM114-Status: GOOD (  17.16  )
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

On 1/30/26 4:52 PM, Russell King (Oracle) wrote:
> On Thu, Jan 15, 2026 at 12:27:05AM +0100, Marek Vasut wrote:
>> On 1/14/26 6:12 PM, Russell King (Oracle) wrote:
>>> I think I'm going to start over, trying to figure out what happened.
>>>
>>> c7308b2f3d0d net: stmmac: stm32: convert to suspend()/resume() methods
>>>
>>> Did the conversion, and it always called stm32_dwmac_clk_disable() and
>>> where it exists, dwmac->ops->suspend() on suspend, provided
>>> stmmac_suspend() returns zero (which it will do, even if the interface
>>> is down. On resume, it always calls dwmac->ops->resume() and
>>> stm32_dwmac_init() before calling stmmac_resume().
>>>
>>> The conversion added hooks into ny new ->suspend() and ->resume()
>>> methods to handle the stm32_dwmac_clk_disable(), dwmac->ops->suspend(),
>>> dwmac->ops->resume() and stm32_dwmac_init() steps.
>>>
>>> However, in 07bbbfe7addf I failed to realise that, in order to keep
>>> things compatible with how stuff works, we need to call
>>> priv->plat->suspend() even if the interface is down. This is where
>>> the bug is, not in your glue driver.
>>>
>>> Please try this:
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index a8a78fe7d01f..2acbb0107cd3 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -8066,7 +8066,7 @@ int stmmac_suspend(struct device *dev)
>>>    	u32 chan;
>>>    	if (!ndev || !netif_running(ndev))
>>> -		return 0;
>>> +		goto suspend_bsp;
>>>    	mutex_lock(&priv->lock);
>>> @@ -8106,6 +8106,7 @@ int stmmac_suspend(struct device *dev)
>>>    	if (stmmac_fpe_supported(priv))
>>>    		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
>>> +suspend_bsp:
>>>    	if (priv->plat->suspend)
>>>    		return priv->plat->suspend(dev, priv->plat->bsp_priv);
>> This works too, thank you.
>>
>> Will you send this fix ?
> 
> Sorry, I appear to have dropped this patch on the floor, and just
> tripped over it. I'm just build testing it and will send it later
> today.
> 
> This problem affects every user of the platform ->suspend/resume()
> stuff, so is not just a stm32 issue.
ACK, thank you.

