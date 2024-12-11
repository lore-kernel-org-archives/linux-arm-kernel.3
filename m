Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37E5E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 18:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mka/6c02zAmTI1ZuaE51LtWLUrXwWytHmmGzjhbNio=; b=1MM2/lx2P4PWMMoomTjgcW/UoP
	St3DBVdQ2pV5mwD3bDP1iq/FtQGII0w1t5k/H3AvbjYDpJinFo7iPo1z7wRtoUgdrAXqOKO+S+AKZ
	oMGsJDSu9Vmx6mNY5Mq6myK7EDoiacnFs1JbxTR/G4MY4AoVjSm57B5kJ0kVEzr/OAk6XTSakQtMb
	4CFae+d1X73r3gzi+lE81lZjUWoJHl+E4ZtXKxQ4JdHAvyV29I9bJMzVLUfUU0gNH2GjIBAPgQ2A7
	Q0vV6r1zN/OFzq2kEiWmupnn97V3tM5VZJVUwgJxUUERl/4HsFC5jP1RVUL5jQjM2Qekx3X5KeKGP
	GE4bjlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRnC-0000000FldS-0D5I;
	Wed, 11 Dec 2024 18:50:38 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRm8-0000000FlWT-0Cxx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 18:49:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98E85104858A3;
	Wed, 11 Dec 2024 19:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1733942965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9mka/6c02zAmTI1ZuaE51LtWLUrXwWytHmmGzjhbNio=;
	b=hAQqBamG3pG/60OscjZ3vfrjvNpj8m2HS9Zx7PKHxstCe0cPTn1Kz88hdPZOjjJXnyMXvY
	MyGNptqZYZqEi5F4DE3oHVQcLFeyfti/6HozoSH3JxhY8unkYCNQJ0x6XeVo3BLiGFU0Rl
	hdMdymft3iQw4qqb9Fln6SRL9AFz7dR9BZXchMNErvo6t3j93Gvy50dBFbxSqBIr7NOC0f
	M8B+Xrk2Hav1kYt05ETxgTFfRdvHyz8qfEanldZffnWaXKZPO9/IS5262On9RwKR0KgBHM
	bisr4YXq01XNNtPoi6FvbUjR4WJ+lsCe5OXUrf91kIy0+6ohxZfSXsJfWIzyfg==
Message-ID: <656838f1-40e5-44de-aaba-d8f5ba496af7@denx.de>
Date: Wed, 11 Dec 2024 19:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 linux-watchdog@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240415134903.8084-1-marex@denx.de>
 <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_104932_251855_A87F1DCF 
X-CRM114-Status: GOOD (  23.08  )
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

On 12/11/24 10:02 AM, Clement LE GOFFIC wrote:
> On 4/15/24 15:48, Marek Vasut wrote:
>> The STM32MP15xx IWDG adds registers which permit this IP to generate
>> pretimeout interrupt. This interrupt can also be used to wake the CPU
>> from suspend. Implement support for generating this interrupt and let
>> userspace configure the pretimeout. In case the pretimeout is not
>> configured by user, set pretimeout to 3/4 of the WDT timeout cycle.
>>
>> Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: linux-watchdog@vger.kernel.org
>> ---
>> V2: - Subtract the pretimeout value from timeout value before writing it
>>        into the IWDG pretimeout register, because the watchdog counter
>>        register is counting down, and the pretimeout interrupt triggers
>>        when watchdog counter register matches the pretimeout register
>>        content.
>>      - Set default pretimeout to 3/4 of timeout .
>> V3: - Use dev instead of pdev->dev
>>      - Swap order of ret/return 0
>>      - Split this from the DT changes, which are orthogonal
>>      - Uh, this patch got stuck in upstreaming queue, sorry
>> V4: - Update commit message to match V2 default pretimeout to 3/4
>>      - Add RB/TB from Clément
>> ---
>>   drivers/watchdog/stm32_iwdg.c | 95 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 94 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/ 
>> stm32_iwdg.c
>> index 5404e03876202..d700e0d49bb95 100644
>> --- a/drivers/watchdog/stm32_iwdg.c
>> +++ b/drivers/watchdog/stm32_iwdg.c
>>
>>  [.....]
>>
>> +
>> +    irq = platform_get_irq(pdev, 0);
>> +    if (irq <= 0)
>> +        return 0;
> 
> Hi Marek,
> 
> After re-evaluating this patch, it seems it lacks of a dt-bindings 
> update that tackles the 'interrupts' property you are adding.
> 
> That said, the interrupt line should not be mandatory for the driver to 
> probe. For backward compatibility with existing DT, I recommend to use 
> the 'platform_get_irq_optional()' API to not fail during the probe of 
> the driver.
I saw the fix
[PATCH] watchdog: stm32_iwdg: fix DT backward compatibility
Thank you for that. I'll wait for V2 with updated commit message .

As far as I understood the problem, the goal is to remove error message 
printed by the platform_get_irq() in case the DT interrupt property is 
missing, but this is only an esthetic fix, not a functional one, because 
the driver probes even if the interrupts DT property is missing, it only 
prints the error message while at it, correct ?

