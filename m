Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ADCCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVNPJhOrNiBpB3sN0+Cs40vDumQQrkCZPkw3xartbAQ=; b=oB506lY7ZDmpnGfi29dXzOphiy
	zwA+re2yrriRwhk5JQIRogTl4mJj+mimaOUYCW1EF4m1OAIu+qZFZBcCqsNyecv+IoKwIKNmQOpGc
	heg6btShhYOwxDk19iUaFhnOhQO0m1oOaoLXXJ/PB77WNr7ZQ02nxPYyvlZFOtHh7U5WHOKb11vzo
	fujtX/7PTIhCFiXa7k442ASq5BtdX1ybIecTAFrJmrHJxu+e1cdPj0wB3WAqp98IxJ09KQrm3ffHb
	Va2Ne0Ioe4gQFjvozi06xIln8B8bjm/2g8fN13Gu60nOyd+2wmX9/pEBQ6RwWlCzlP7r11tBOXBS4
	tNBgPtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3Q2-0000000GkWF-0xpN;
	Thu, 21 Aug 2025 11:25:22 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0YA-0000000GDcZ-3HuQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:21:36 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 872BE1F38C;
	Thu, 21 Aug 2025 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVNPJhOrNiBpB3sN0+Cs40vDumQQrkCZPkw3xartbAQ=;
	b=ojL3hv0+Cz5kOEdN4DbnIvpgTxBNACToQWvmnRob7Z18EsVZae/jT/hAzCEVT/GnqJZeGJ
	A30OH/GyNxsK7IIBYNlBNtnYOdHt77Zla8owTJLZRNXx7ctShxHjxCg1xmBJpG9JIUuSIz
	02sO3vOw2hMmiTOjpMaCt68UL64DYFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVNPJhOrNiBpB3sN0+Cs40vDumQQrkCZPkw3xartbAQ=;
	b=silvKyGuAnokhhUaEEzmSznREBsKoTliqahF5VMMZ4l75i8SekmW0VXvmIXisLAeLH9PgX
	w0NPwF2aszrszfCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ojL3hv0+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=silvKyGu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVNPJhOrNiBpB3sN0+Cs40vDumQQrkCZPkw3xartbAQ=;
	b=ojL3hv0+Cz5kOEdN4DbnIvpgTxBNACToQWvmnRob7Z18EsVZae/jT/hAzCEVT/GnqJZeGJ
	A30OH/GyNxsK7IIBYNlBNtnYOdHt77Zla8owTJLZRNXx7ctShxHjxCg1xmBJpG9JIUuSIz
	02sO3vOw2hMmiTOjpMaCt68UL64DYFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVNPJhOrNiBpB3sN0+Cs40vDumQQrkCZPkw3xartbAQ=;
	b=silvKyGuAnokhhUaEEzmSznREBsKoTliqahF5VMMZ4l75i8SekmW0VXvmIXisLAeLH9PgX
	w0NPwF2aszrszfCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A051613867;
	Thu, 21 Aug 2025 08:21:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kU3vJArXpmg+EwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 21 Aug 2025 08:21:30 +0000
Message-ID: <bf833878-3e81-4f42-9bd0-0c22d1fd7b02@suse.de>
Date: Thu, 21 Aug 2025 11:21:30 +0300
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
X-Rspamd-Queue-Id: 872BE1F38C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt,netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_012135_125564_C131E190 
X-CRM114-Status: GOOD (  16.28  )
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

On 8/19/25 11:29 AM, Nicolas Ferre wrote:
> On 15/08/2025 at 15:59, Stanimir Varbanov wrote:
>> In case of rx queue reset and 64bit capable hardware, set the upper
>> 32bits of DMA ring buffer address.
> 
> Very nice finding! Thanks.
> 
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> 
> A "Fixes" tag might be interesting here.

Looks like the commit is:

9ba723b081a2d ("net: macb: remove BUG_ON() and reset the queue to handle
RX errors")


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


Also, the patch-set is adding a GEM variant but current patch is fixing
MACB. Could you please help us with testing on MACB and provide Tested-by?

>> struct napi_struct *napi,
>>
>>                  macb_init_rx_ring(queue);
>>                  queue_writel(queue, RBQP, queue->rx_ring_dma);
> 
> For the sake of consistency, I would add lower_32_bits() to this call,
> as I see it for each use of RBQP or TBQP.
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

