Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F927CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGZz4VWs/JC+aNmL95YeIOEFAldikWyWA5RKgIlO5FE=; b=AWNhEcqu346jglEDoBo4dbAGq6
	4fzWiXeB6iJ6tJHvWEqsJOgIDcZySAmNlzVj0gclmv8Z8XuWsbcAGZR9JX2IrrEmgDUCeTZvzgOTQ
	HeXrnf6ksYdo6qE97nIoiX1nOqObU9J+fhqZHlfw3Jd1yPk11/HTlyfgNn9KTIBBRL+BFeda3g9T4
	6/E2OP+t2I3W4E5EqeW0km2gvjKTU3nAGsg3GaMUtufcVT/QOV4jECD808xXTx0MdpqA8YxcFQtlk
	Ef7yWSP92h79H+Nd6qWDfbhmfHiW3w80V+Cd61+aGMgzkSRYavNTWqnFgmhpAz9D3BGsCzBBEPiQl
	n9fkixnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDItY-0000000DRE0-2G3u;
	Mon, 27 Oct 2025 08:48:04 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDItS-0000000DR7H-0IDe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:47:59 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c1413dbeeso7098329a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554875; x=1762159675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGZz4VWs/JC+aNmL95YeIOEFAldikWyWA5RKgIlO5FE=;
        b=XPfC4MYfBco+rErJJzYpFiJ+/gVown0mpOK2rNYCydPgQZKdR+biaqJwFRv9Evmg2x
         7WMDl5nobtl9erEJXviTNIK6Q24QDNJVo7Pw/QfcUd7CEgi5waQ8l6lSA7tSJgcmiDjb
         XQJduAz+BkqYa06oyUJoxbBJG6br+dSWm+5kpIvgmhTPgXdSplyAG/SzVzq8OAu0fPcq
         osPloFMMYy0nV9QFbPgwtakSsuDxyjvCs6A6p3A6s9hOjMYtjEZrbpNgxn4ffvG7vkab
         e/w5arEgQODBCZHgGijcprl8oZom4o79oRy3XXHI90Nd4pAXmbPOnL6lUSqljrVICcOv
         Ydmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554875; x=1762159675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGZz4VWs/JC+aNmL95YeIOEFAldikWyWA5RKgIlO5FE=;
        b=uQsjk4jgsZYHY3BSjXMSU6FC4gokqi00j+OpD5da89CD/wdCtSBsHRtjdDNA/+2cgT
         hgMlShTOIMfNLmu8uDxI31n+i2hJZIqHCa9J6NZdzi8z/ikiGo6NZE3VlR0SEzRNqE9h
         FttWhE8coXTlqdWhVsCbbUyYNYS0zrm0Gl/42JRpVAFReyd/dUyJLlOevl6c2b09CfK4
         x2Kg23X6kbtnDjkdgS1za5w6YkUNe3xGiyNuoBREACvH6J1QdZoY5aGCwlygg+yCw5H/
         O/BcjhWQgAGVy5CN37HaM7o4Nei6sPSD3aU54lIW+4OL5zkGqn0psh2ZNfcUE/OIHBT6
         iBwA==
X-Forwarded-Encrypted: i=1; AJvYcCXvoHJ9kReKNB7VjbhR6fW2+aseiJ1xW1JBkVzd+aevTmRJv0qDv2eV7zmXef0wqdNS757pQMc6QTb4hVhn+bY/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwzz8YDS4+sqxjiUrI128WXplpPCMvciv3UUhVw8yHCRAgloeo
	yTRR2Ze52EezT47PHgum6du63l+B9wbX9h85kcsBFk56fzFGcwVWgqUF
X-Gm-Gg: ASbGncsXjMpEzprmbam+bNBz/5HofFka333R2TLQZQkPDrnkD/rJAKgUpwHDCm9yy/M
	fSP5xiXTQm7fDfpiIR1dvTnxa36leLcNwSO+bg2wOrmjiWV7MEEY+Tdj3Bnf1qsVzPyiKcLc7L7
	pWRZTuq+7g3U6ur8LWVTElUmp4J0a3z0qc93MU1poOL8CwgkhjFOLrqbhF28gqEpAMpSfp1tiSR
	ynnkoxEaNA2NlXS3YFP8cx8aF0QCN7xrWt6lS4JaBjsuKoSKkf4GmsbfIID61uwt3m/raeEGHJZ
	csiTAOEJP3YHxScZpDyxYQ+i1C5pcYDVUoo0GLw2iiTLp8DQE5H8iWsXwk0nNeGzZwQZcGdGYrj
	l89d/nfS1U6xEi7P6jijMK3dqsYp3IzFvp9+kVYdlG7rgXsyuffOKbpCBwU5B+lH/gonrzo3uAj
	TptA/n673eNSarP0Z5TSkgj/GmEQkT5vDpv4tj5FSPh4Zp+fMPAFKTUQGA08Cpuo2qZocjku1+A
	CV4koE=
X-Google-Smtp-Source: AGHT+IHI/dPLHOEXbAgh9incjnpJfjqNEb+KRQ5szvPQKR2/DbuucHSelag9VvNOHA5WUfOKDq1CeA==
X-Received: by 2002:a05:6402:430d:b0:63e:142e:4b18 with SMTP id 4fb4d7f45d1cf-63e600843bamr9053952a12.7.1761554875180;
        Mon, 27 Oct 2025 01:47:55 -0700 (PDT)
Received: from [10.0.1.60] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef8288asm5688230a12.10.2025.10.27.01.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:47:54 -0700 (PDT)
Message-ID: <341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com>
Date: Mon, 27 Oct 2025 09:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20251027072749.GA7811@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014758_151000_6DB076A6 
X-CRM114-Status: GOOD (  36.92  )
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



On 27/10/2025 08:27, Laurent Pinchart wrote:
> Hi Andrew,
> 
> Thank you for your quick reply.
> 
> On Mon, Oct 27, 2025 at 04:08:42AM +0100, Andrew Lunn wrote:
>> Adding Russell King
>>
>> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
>>> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
>>> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
>>> devices produces an interrupts storm. Disable EEE support to fix it.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>> The exact reason for the interrupt storm is unknown, and my attempts to
>>> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
>>> understand, the DWMAC implements EEE support, and so does the RTL8211E
>>> PHY according to its datasheet.
>>
>> I believe for DWMAC it is a synthesis option. However, there is a bit
>> indicating if the hardware supports it.
>>
>> The PHY should not be able to trigger an interrupt storm in the
>> MAC. So this is likely to be an DWMAC issue.
>>
>> Which interrupt bit is causing the storm?
> 
> That's where I hit my first wall :-)
> 
> I've tried to diagnose the issue by adding interrupt counters to
> dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> interrupts storm, increasing at around 10k per second. However, the
> corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
> 
> The ENET_EQOS interrupt on the i.MX8MP is an OR'ed signal that combines
> four interrupt sources:
> 
> - ENET QOS TSN LPI RX exit Interrupt
> - ENET QOS TSN Host System Interrupt
> - ENET QOS TSN Host System RX Channel Interrupts
> - ENET QOS TSN Host System TX Channel Interrupts
> 
> The last two interrupt sources are themselves local OR of channels[4:0].
> 
> I ould suspect that the LPI RX exit interrupt is the one that fires
> constantly given its name, but I'm not sure how to test that.
> 
>>> What each side does exactly is unknown
>>> to me. One theory I've heard to explain the issue is that the two
>>> implementations conflict. There is no register in the RTL8211E PHY to
>>> disable EEE on the PHY side while still advertising its support to the
>>> peer and relying on the implementation in the DWMAC (if this even makes
>>> sense)
>>
>> It does not make sense. EEE is split into two major parts. The two
>> PHYs communicate with each other to negotiate the feature, if both
>> ends support it and both ends want to use it. The result of this
>> negotiation is then passed to the MACs.
>>
>> It is then the MAC who decides when to send a Low Power Indication to
>> the PHY to tell the PHY to enter low power mode. The MAC also wakes
>> the PHY when it has packets to send.
>>
>> A quick look at the data sheet for the RTL8211E suggests this is what
>> is supports.
>>
>> There are a few PHYs which implement SmartEEE, or some other similar
>> name. They operate differently, the PHY does it all, and the MAC is
>> not even aware EEE is happening. Such PHYs should really only be
>> paired with MACs which do not support EEE. An EEE capable MAC paired
>> with a SmartEEE PHY could have problems, but hopefully the EEE
>> abilities and negotiation registers in the PHY would be sufficient to
>> dissuade the MAC from doing EEE. But i would not expect a setup like
>> this to trigger an interrupt storm.
> 
> Thanks for the explanation, I read documents to try and figure out how
> it worked and didn't find such a clear and concise high-level summary.
> 
> I'm not very experienced with ethernet, but I can easily test patches or
> even rough ideas on hardware.
> 

Hi Laurent,
I had the same problem, interrupt storm plus link instability with dwmac.

I found out that 2c81f3357136 ("net: stmmac: convert to phylink PCS support")
commit is the one causing the problem to me.

But the phy used by our board clearly do not support EEE, so I disabled
directly in the driver.

I’m very interested in your investigation, as I’d like to understand why that
commit causes a regression, given that it supposedly just switches to using
phylink for EEE management.

See https://lore.kernel.org/all/20251023144857.529566-1-ghidoliemanuele@gmail.com/

Thanks and regards,
Emanuele

