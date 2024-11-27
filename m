Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015CBD6D244
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 22:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4hMroRe5vC2NxlBWRRYYxsYO1szD/OqQeolaWtKQGk=; b=flY+gvaiqtEV29jXCtCF4QAcj4
	xodYujwXdoSLnoa6HmrVB4ni3iTmGx3yOUD6T3xeMGVlEww9IERicqxUtWGVmDhhna5SjrrWld6L3
	3+QHAGTOC/MQ7xnCLOKphLHizWhO4Swcg+tjRMMD4U/swJMqg0yZpADac/URV2QdTVdVPjS64lXIM
	xIBf0za/JPrKXQ8G/XH9HtmR76ctviYyjEBD09sG0sakQqifG1W6UGfSg2LPNKLSRsadLUXVlM8ge
	BVPvnyqfN7SRBs5SbHospunMd0ysz11odma9X8YU/ApP7fgOAbo+K2/kfhIIiXyAIUUHy2z5lLQhz
	9Jv8XtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGQKg-0000000EBMv-0qmW;
	Wed, 27 Nov 2024 22:16:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGQJj-0000000EBJJ-0T8x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 22:15:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso19190266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 14:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732745725; x=1733350525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C4hMroRe5vC2NxlBWRRYYxsYO1szD/OqQeolaWtKQGk=;
        b=hcU8E3+Yx8nthr9hSliN+dHvfaVewjJXP+lDlmne3Mf2CHAFOZFnZvjXLMHGUy4kHh
         5H7L0GQkAoAwsZiwyXx8TsJ/lbgwHyHwRoTT5M0kpv95kb1helb3z2GHZhn2HXSnJR+J
         l3tdUf36YtAY5gnJbYn9dczh7lnh4if0f+iBQyIrfAvvQYUvJGA2+cAbcJdewczD9mHi
         zwyEajPThC9UyJxPohCzMQaZofojK+nxnRPz1IhtFYhASpIE0spPcp0OgqnSCMfGnLHy
         q+pOZt1GmJk/bqk9GbUJaYFVCtbG9jucmCsjOxDUOH9x3WytHjvt0kYfhcEA5NiOe8H8
         2aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732745725; x=1733350525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4hMroRe5vC2NxlBWRRYYxsYO1szD/OqQeolaWtKQGk=;
        b=Pp+6ofZM//yL2fm1zrB7Qv2XW/KB80jbxWoljiXuiwxS2ehbYbXCieWHhO+4vlTA6y
         rgAiz1bw+FwsD8G9m/7plFIXW4isxFh3C68DtyP4ZR7bJulUNYjDVHsJdHrTURDwMLUk
         jWnAPeAToOv+W4sPZydEjok8HeS/zpu7YDwaYcZKpbc+EPJqvdZRV3hpA73MySAL8y3R
         GpFjOdNyIktjTFUutrHnR/bLE0Mw23bU81R1lfkXq3HCT67zY0sJ9cILO3uUMhx0MA4e
         BP7AG+c6fnY8B9jpalW+WHaQIBZoWjWIGBDp52ZB1euoQpOg0YrRUZpvCOyT/MSclvoP
         EY3A==
X-Forwarded-Encrypted: i=1; AJvYcCXvUjETRBMqsevclPE1KWpiEkhOwnJpNz0+jrzqiSQAWMq3S1lkSStLvhso0YR+tFQhVwq33NsC/7Y7ySb3N+40@lists.infradead.org
X-Gm-Message-State: AOJu0YyPTsYUC2RzEhQHP5jGEzGugSF8H0gp3gUuPDjo2OVl7piaL5TF
	CCakcdVYRoAa+7COnOrj44fwQcSPd+VX4H5bNS4q7Zp4itgkwtJS
X-Gm-Gg: ASbGnctjGGSqTrKe/jF79QSDgpcDVq4Elzj2pMKsil3UyI5fN4FOIXuzCboxlLNPG9S
	lfMqBMKks6W+ZJ2YeTBVlg9kpOLma9HeADTb7uc5xzItcmpO/FsV+OwFT4WGEBBo9ntLdhbd7iE
	YpEAvmtVZl+Uii8su15uxVGbDyiaqB5u8ZZTU4cLg/lOM9GupNXvrwL77YMaSl8l/CwPT/HlHjB
	a9o6XXbLj1uSexqqfCyk+7xVmr/eM57aKo/ERKW0CfPMbYC9rkY9A9XrQ7374bkspJZdgUBNB7s
	xw/n92h8usoAU8PjglbKWME6naXphJzrXQLD1shz/1es7G6IgQrE9Fjk1CIbDAxiPn5IaJ1ORWD
	2bOp1twFATe3eMgEMLb43UnEdQxZpI88mKkuhzgDr3A==
X-Google-Smtp-Source: AGHT+IHYgWvU50Owdns9gA4SJOoFe3enu43XPSQT/+67ke9HUNtG8d/ql9AEHSChYJ3EEYt+kRuvzg==
X-Received: by 2002:a17:907:254e:b0:a99:529d:81ae with SMTP id a640c23a62f3a-aa581062752mr318792466b.55.1732745724778;
        Wed, 27 Nov 2024 14:15:24 -0800 (PST)
Received: from ?IPV6:2a02:3100:b12f:4200:648f:850f:5e23:bc2f? (dynamic-2a02-3100-b12f-4200-648f-850f-5e23-bc2f.310.pool.telefonica.de. [2a02:3100:b12f:4200:648f:850f:5e23:bc2f])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa55567771esm386400266b.79.2024.11.27.14.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 14:15:24 -0800 (PST)
Message-ID: <6d4bf2cb-b5be-4b35-bc05-c6cac08a7028@gmail.com>
Date: Wed, 27 Nov 2024 23:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: net: rtl8169: EEE seems to be ok
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 UNGLinuxDriver@microchip.com
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <Z0b5NepJdXiEQ1IC@shell.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Z0b5NepJdXiEQ1IC@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_141527_160020_8BC55E91 
X-CRM114-Status: GOOD (  20.53  )
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

On 27.11.2024 11:49, Russell King (Oracle) wrote:
> On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
>> In doing this, I came across the fact that the addition of phylib
>> managed EEE support has actually broken a huge number of drivers -
>> phylib will now overwrite all members of struct ethtool_keee whether
>> the netdev driver wants it or not. This leads to weird scenarios where
>> doing a get_eee() op followed by a set_eee() op results in e.g.
>> tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
>> to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
>> really needs urgently addressing, and I believe it came about because
>> Andrew's patches were only partly merged via another party - I guess
>> highlighting the inherent danger of "thou shalt limit your patch series
>> to no more than 15 patches" when one has a subsystem who's in-kernel
>> API is changing.
> 
> Looking at the rtl8169 driver, it looks pretty similar to the Marvell
> situation. The value stored in tp->tx_lpi_timer is apparently,
> according to r8169_get_tx_lpi_timer_us(), a value in bytes, not in a
> unit of time. So it's dependent on the negotiated speed, and thus we
> can't read it to set the initial phydev->eee_cfg.tx_lpi_timer state,
> because in the _probe() function, the PHY may not have negotiated a
> speed.
> 
Right, hw stores the tx_lpi_timer in bytes. Driver's default value is
one frame plus a few bytes. It doesn't use phydev->eee_cfg.tx_lpi_timer.
set_eee() op isn't implemented for tx_lpi_timer, because no one ever
asked for it and I'm not aware of any good use case.

> However, this driver writes keee->tx_lpi_timer after
> phy_ethtool_get_eee() which means that it overrides phylib, so hasn't
> been broken.
> 
> Therefore, I think rtl8169 is fine.
> 


