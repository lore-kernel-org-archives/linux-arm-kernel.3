Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52961CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHKsUzzxZm5K3EIZT6z287s6v96pFtzqZHd1wpk6TpM=; b=IwYOf3t5WOnXZ5lZieOHdsFBkh
	yfdCIYuPIDa1dlyNzsXG5vINb4WNnLwmL9erJS4a0YR0jcrK9tEv3r1CGjR979gp2c5SfFtc7BePE
	C6ICag/CI7BPquOvIXxent/KLXtldRTD/uW+1DOYEWeUiLgEnUWj1D0ZAUeBi20BDkD4UX+TiUbZO
	WzBSsktfcpNjm+OxN0vMZSYsQAm9OnyJ2d4SYHzIMJRmxdsaRo5TyUkE8vp+6Ll7WfV3cnypgDUnu
	LJXn/iEH6ImM37wBmsGwI5GULkZJMQYTKZ/PeGjDzSUDDimcjfq080qIwGaFZjWu8N1spsVtJ3d+r
	RxhMLaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpE1-0000000B3hH-0VUd;
	Tue, 26 Aug 2025 08:40:17 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqp9d-0000000B2Wf-3g51
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 08:35:47 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD3D92120C;
	Tue, 26 Aug 2025 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756197343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHKsUzzxZm5K3EIZT6z287s6v96pFtzqZHd1wpk6TpM=;
	b=LWnzIXeenph3BMz5+gXjhU8YY/bqG9LtRtR9MRQFbZJtkBy/G+9fe5mU6rkfejuDSuMjvT
	axQJnFNLNewUqJjoGPtn9NVqeE5fYBxHONKeBmwmqBOx57z09JNeaFr84dDyTIqMTf9C/i
	rvEraAWzI+DWXosfmnwMisdhWNge31E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756197343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHKsUzzxZm5K3EIZT6z287s6v96pFtzqZHd1wpk6TpM=;
	b=tRjjHYFWmr6SxISznVyCI10VPcYQwQkRtLfd+NhCPmwyMgCdTwAsiIX8jKHnqvdthYwnjW
	+JL85c5ma7vQXTCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756197342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHKsUzzxZm5K3EIZT6z287s6v96pFtzqZHd1wpk6TpM=;
	b=BkhEO0qL+fBcLNmT00fIz++vQx1ER1MVWTFtShSwv/z7wh7Dcjya5NKlHdwILsOTlzvmu6
	EwoIIPWOnO191US+QQ/gOK7w8PwYTwU/lNh6ctWbIzN5vzjvl1Ped7+33pRzzVCVB1i6dH
	XOZ/cVknAAhe9tLqoeMG2DOgFbh1tJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756197342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHKsUzzxZm5K3EIZT6z287s6v96pFtzqZHd1wpk6TpM=;
	b=o9Rnci4iE+NYXjZEJGyC7Dk6kDWhNbSvBm/MWNn6U6HpAmdfbBVftnt/qO3MZE6NvV0Sk+
	y85pUuQn3SXR76BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF5E613A51;
	Tue, 26 Aug 2025 08:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CwRoMN1xrWhZUAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 26 Aug 2025 08:35:41 +0000
Message-ID: <1ecd4a9a-d685-4bce-ad06-cc8878f0a165@suse.de>
Date: Tue, 26 Aug 2025 11:35:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
To: Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, stable@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-2-svarbanov@suse.de>
 <20250825165310.64027275@kernel.org>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250825165310.64027275@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_RCPT(0.00)[dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_013546_108342_E053B9FB 
X-CRM114-Status: GOOD (  12.26  )
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

On 8/26/25 2:53 AM, Jakub Kicinski wrote:
> On Fri, 22 Aug 2025 12:34:36 +0300 Stanimir Varbanov wrote:
>> In case of rx queue reset and 64bit capable hardware, set the upper
>> 32bits of DMA ring buffer address.
>>
>> Cc: stable@vger.kernel.org # v4.6+
>> Fixes: 9ba723b081a2 ("net: macb: remove BUG_ON() and reset the queue to handle RX errors")
>> Credits-to: Phil Elwell <phil@raspberrypi.com>
>> Credits-to: Jonathan Bell <jonathan@raspberrypi.com>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>> index ce95fad8cedd..36717e7e5811 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -1634,7 +1634,11 @@ static int macb_rx(struct macb_queue *queue, struct napi_struct *napi,
>>  		macb_writel(bp, NCR, ctrl & ~MACB_BIT(RE));
>>  
>>  		macb_init_rx_ring(queue);
>> -		queue_writel(queue, RBQP, queue->rx_ring_dma);
>> +		queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
>> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>> +		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
>> +			macb_writel(bp, RBQPH, upper_32_bits(queue->rx_ring_dma));
>> +#endif
>>  
>>  		macb_writel(bp, NCR, ctrl | MACB_BIT(RE));
>>  
> 
> Looks like a subset of Théo Lebrun's work:
> https://lore.kernel.org/all/20250820-macb-fixes-v4-0-23c399429164@bootlin.com/
> let's wait for his patches to get merged instead?

No objections for this patch, it could be postponed. But the others from
the series could be applied.

regards,
~Stan



