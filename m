Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A219CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 07:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4roag8RkeTHO2FDEZ6Nr16KR62pxOLQkv39DNg6fV3I=; b=Zi2vapi8qHwnQ2tgtuRx7oZrMI
	wfCE/0Sh4flI5Hi++ZBd+VQjLnil24WXAXRQ4RXY6m2mZKOwV2XtHSzLEs9eRb4XmPn+DQJYtTc9+
	mAPicIeqkCUxQFMd3snRbyottYYHQ6UquztjKtccN/tntfljzS47sG3phmBiyBvpRAeWfvskDvXwj
	qYVziqtjB0u1jiT0g7oeX91q1+jkBk4T3/hTqhOREeS/4RzgpoGi2iVGfh4jOf97Lwro2TgNb2rA4
	flVZB6Y+VcLRv2Q0TWgg7t6wwXknG8A6JvfAfYXTucjgrhoJzdq8HiLgYGSZIHY4GwnTeizyfgs/c
	JOsiwvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpcL-00000005KmX-3lPu;
	Thu, 23 Oct 2025 07:20:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpcH-00000005Kks-3zuc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 07:20:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A14CEC0C40C;
	Thu, 23 Oct 2025 07:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 670866062C;
	Thu, 23 Oct 2025 07:20:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53C8E102F2429;
	Thu, 23 Oct 2025 09:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761204006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4roag8RkeTHO2FDEZ6Nr16KR62pxOLQkv39DNg6fV3I=;
	b=mdorGzg2LzGiR0C8GxZXl2UlSgbq9yAfDNeqY/Y4sEAXMkzTrTy0W8Kr2uoVdDfDD9xPFL
	oyXAtASGmQPpdlMBu3alqEE6W5MXKBS/g53aq/vzqyqQvd/Wau6H/EgoW/4QF2brlnxcz8
	J/je+VRBLPtGgC6HQsM65ElhOZHRrSrjAA/h3b3DeNYm8qz5z70Rx0ReayxNC8Vkgl0uvm
	UbxjwwfGeTa8XFj6JAADH+ZmpNnZuFUskfiiUqFVl0kxYv2Pg0kjhzMkwGxqq61zdoJ07W
	QFmJ9IrAIQ6mL5GnMbOolzzriyutWAccNDuyts4XEg1eS9RybRT0SlLBF3y9Kw==
Message-ID: <2fb53c04-17a1-439c-b8dd-ec52aa23808c@bootlin.com>
Date: Thu, 23 Oct 2025 09:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: phy: add phy_may_wakeup()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
 <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
 <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_002010_176588_248B863E 
X-CRM114-Status: GOOD (  11.00  )
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



On 22/10/2025 20:20, Russell King (Oracle) wrote:
> On Wed, Oct 22, 2025 at 03:43:20PM +0200, Maxime Chevallier wrote:
>> Hi Russell,
>>
>> That's not exactly what's happening, this suggest this is merely a
>> wrapper around device_may_wakeup().
>>
>> I don't think it's worth blocking the series though, but if you need to
>> respin maybe this could be reworded.
>>
>> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> I've updated the description as I think patch 4 needs a repost:
> 
> +/**
> + * phy_may_wakeup() - indicate whether PHY has wakeup enabled
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
> + * setting if using the driver model, otherwise the legacy determination.
> + */
> +bool phy_may_wakeup(struct phy_device *phydev);
> +
> 
> Do you want me to still add your r-b?

Yes with this change, that's good for me you can add the tag :)

Thanks Russell,

Maxime


