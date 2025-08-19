Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C612CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCP2sXh2gwfCkPbU6Wb/CWK6RQlUL1v1Xohq8MIEbiY=; b=UaprNgy+Qu2rU/6Y7fZFUpkTRI
	iPhbfnOIQ6Y29MUyaueIa1MgCV1fbgaERHXT768pbMTY0aM8PZtogv/OhgOurqDF6ZX7q97kWOksx
	bZC3IpE01k8m2NKgS0JZu8KIGsKWiRJ39IhKqIUrLTM0icRZlnd3jZjrE18qfGeWvde3EKOL/ZLf4
	VxiXocU3DaVLVjkdKjLLI/UKbHtwGXBMp0l2uGWULntQQvkRGSUbm84dyrWZ36Ko46Uh3E+f9z0fj
	pLGcN4tNyqcegrjUBokrE0toC4569Zonz3UGGK82dctdKosdQNUbYSeTkmysHWY2935WIUJEg0bYb
	6Z9nLrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMZA-0000000Acat-1ciY;
	Tue, 19 Aug 2025 13:39:56 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJhh-0000000A9Nd-1YLf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:36:35 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C0BB31F785;
	Tue, 19 Aug 2025 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755599791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCP2sXh2gwfCkPbU6Wb/CWK6RQlUL1v1Xohq8MIEbiY=;
	b=TezlJBbTjtioKcepFdP4s5z7tTYZPn/Bt16uIdS+IRohLyiD0pdEFo44EnYqhEkY4Kl45p
	+MV5ArsmtY3a8cMD0JsUKBcHduBJXeE/cTuVXDR1d8FOlbcJ3zNUEG9tnB4Jgut4IG76JY
	TZFidaoiG5mtq+uH5e48WIz8d7XnhqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755599791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCP2sXh2gwfCkPbU6Wb/CWK6RQlUL1v1Xohq8MIEbiY=;
	b=/jwHUwE/R4yDKWdeW7jVCqMk9g+olXYtz4c0NA9J4bRs5ABxBInaUESpbCJAJ1ECVdZw5O
	DPfFpH32Tp19lVAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755599791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCP2sXh2gwfCkPbU6Wb/CWK6RQlUL1v1Xohq8MIEbiY=;
	b=TezlJBbTjtioKcepFdP4s5z7tTYZPn/Bt16uIdS+IRohLyiD0pdEFo44EnYqhEkY4Kl45p
	+MV5ArsmtY3a8cMD0JsUKBcHduBJXeE/cTuVXDR1d8FOlbcJ3zNUEG9tnB4Jgut4IG76JY
	TZFidaoiG5mtq+uH5e48WIz8d7XnhqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755599791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCP2sXh2gwfCkPbU6Wb/CWK6RQlUL1v1Xohq8MIEbiY=;
	b=/jwHUwE/R4yDKWdeW7jVCqMk9g+olXYtz4c0NA9J4bRs5ABxBInaUESpbCJAJ1ECVdZw5O
	DPfFpH32Tp19lVAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBFCD139B3;
	Tue, 19 Aug 2025 10:36:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vVAZL65TpGjVWgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 19 Aug 2025 10:36:30 +0000
Message-ID: <437a8d6d-8d59-4ae3-beda-d9eab1300109@suse.de>
Date: Tue, 19 Aug 2025 13:36:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250815135911.1383385-1-svarbanov@suse.de>
 <20250815135911.1383385-2-svarbanov@suse.de>
 <37427c1a-68af-4c50-ac6d-da5ee135c260@microchip.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <37427c1a-68af-4c50-ac6d-da5ee135c260@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[dt,netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_033633_611098_B247884D 
X-CRM114-Status: GOOD (  16.33  )
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

Hi Nicolas,

Thank you for the review!

On 8/19/25 11:29 AM, Nicolas Ferre wrote:
> On 15/08/2025 at 15:59, Stanimir Varbanov wrote:
>> In case of rx queue reset and 64bit capable hardware, set the upper
>> 32bits of DMA ring buffer address.
> 
> Very nice finding! Thanks.

Hmm, that reminds me that I have to update the patch body because the
credits should go to Jonathan Bell and Phil Elwell if I decipher
properly the description in raspberrypi downstream kernel :)

> 
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> 
> A "Fixes" tag might be interesting here.

Sure, I'll do that.

> 
>> ---
>>   drivers/net/ethernet/cadence/macb_main.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/
>> ethernet/cadence/macb_main.c
>> index ce95fad8cedd..41c0cbb5262e 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -1635,6 +1635,11 @@ static int macb_rx(struct macb_queue *queue,
>> struct napi_struct *napi,
>>
>>                  macb_init_rx_ring(queue);
>>                  queue_writel(queue, RBQP, queue->rx_ring_dma);
> 
> For the sake of consistency, I would add lower_32_bits() to this call,
> as I see it for each use of RBQP or TBQP.

Ack.

> 
>> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>> +               if (bp->hw_dma_cap & HW_DMA_CAP_64B)
>> +                       macb_writel(bp, RBQPH,
>> +                                   upper_32_bits(queue->rx_ring_dma));
>> +#endif
>>
>>                  macb_writel(bp, NCR, ctrl | MACB_BIT(RE));
> 
> Best regards,
>   Nicolas
> 

regards,
~Stan

