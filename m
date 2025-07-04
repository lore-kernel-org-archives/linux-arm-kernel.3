Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7889C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=; b=MbJqKVYjGGTYXL9KM7Uvy43xlq
	tfN2lvrw69nOv+yzKmc5srL1wLtFS0jtegTEZpZrGZixHHpLlBZ5W1554pRhUurcCaTicO9OOe1yR
	vJT2rKIDAU3H01H9zGsy8/+v1cx9O+yyEEx+e0y+Sx81KRfSRdiXpuwsAXmTSz3/dtDnrH9Mu9ZwU
	zTSblHNS6mgzNymw7mmmY3LL+kRxDW3J1GtnUSpcpJh2v1sBU3lK9wLlKwLKY8PGQrkLLyxHBkr9+
	VWXAXsC6q7VJVDDEK8QurFwnpXFQ5tNb+GAwpHKhjjVykOjgHsMi3efVIgT3uToJcEPVuGBzUUd3U
	9hNiy7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjm8-0000000F2xU-0DMF;
	Fri, 04 Jul 2025 17:00:36 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjWI-0000000F0DB-1CGn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:44:15 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A40F7211BA;
	Fri,  4 Jul 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751647452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=RcWspLcB3YBLz305W0/E2X3o2YDattPqn7XJh+U1iJ4jVh1XmbEzQtiDD/yXmUyz0hdcTa
	CtxsYq8d0mKgOvWWg0wEK8ORFnD0uC3R1YHtPZBmXSTqdQQ7NU46NDqbzyXPg+6Wu/wrNJ
	CxOYlhSxiOd5BjKeGyvSGg/mQmJpLmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751647452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=BX5TyJQ0SJEeI7nPi09seMV2vHO8EfK3VDsOUju91z3BoNPwcqgZow/prMeNGGI5irC7NZ
	vTn6sb+54PzS5ZAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751647452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=RcWspLcB3YBLz305W0/E2X3o2YDattPqn7XJh+U1iJ4jVh1XmbEzQtiDD/yXmUyz0hdcTa
	CtxsYq8d0mKgOvWWg0wEK8ORFnD0uC3R1YHtPZBmXSTqdQQ7NU46NDqbzyXPg+6Wu/wrNJ
	CxOYlhSxiOd5BjKeGyvSGg/mQmJpLmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751647452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=BX5TyJQ0SJEeI7nPi09seMV2vHO8EfK3VDsOUju91z3BoNPwcqgZow/prMeNGGI5irC7NZ
	vTn6sb+54PzS5ZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32D3113757;
	Fri,  4 Jul 2025 16:44:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BiWQCdwEaGj+HwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 16:44:12 +0000
Date: Fri, 4 Jul 2025 18:44:08 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] soc: aspeed: lpc-snoop: Constrain parameters
 in channel paths
Message-ID: <20250704184408.32227305@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_094414_477471_96A6856E 
X-CRM114-Status: GOOD (  18.35  )
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

On Mon, 16 Jun 2025 22:43:41 +0930, Andrew Jeffery wrote:
> Ensure pointers and the channel index are valid before use.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index ca7536213e0986f737606a52996ffea620df2a7a..804c6ed9c4c671da73a6c66c1de41c59922c82dc 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -25,7 +25,6 @@
>  
>  #define DEVICE_NAME	"aspeed-lpc-snoop"
>  
> -#define NUM_SNOOP_CHANNELS 2
>  #define SNOOP_FIFO_SIZE 2048
>  
>  #define HICR5	0x80
> @@ -57,6 +56,12 @@ struct aspeed_lpc_snoop_model_data {
>  	unsigned int has_hicrb_ensnp;
>  };
>  
> +enum aspeed_lpc_snoop_index {
> +	ASPEED_LPC_SNOOP_INDEX_0 = 0,
> +	ASPEED_LPC_SNOOP_INDEX_1 = 1,
> +	ASPEED_LPC_SNOOP_INDEX_MAX = ASPEED_LPC_SNOOP_INDEX_1,
> +};

I don't have a strong opinion on this (again, I'm neither the driver
maintainer nor the subsystem maintainer so my opinion has little
value), but IMHO the main value of introducing an enum here was to make
it possible to get rid of the default statement in the switch
constructs. With switch constructs being gone in patch 10/10 (soc:
aspeed: lpc-snoop: Lift channel config to const structs), the value of
this enum seems pretty low now. You could use NUM_SNOOP_CHANNELS
instead of ASPEED_LPC_SNOOP_INDEX_MAX + 1 and 0 and 1 instead of
ASPEED_LPC_SNOOP_INDEX_0 and ASPEED_LPC_SNOOP_INDEX_1, respectively,
and the code would work just the same, while being more simple, with no
downside that I can see.

-- 
Jean Delvare
SUSE L3 Support

