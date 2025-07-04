Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F1C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2GjZktKM3Y5oURN46oUVqyGn4fu4vb+qYUJ6tUVUIg=; b=1NI4+rfA9woNEsPwkBaCd6lPkH
	8UEfstBKzhtueXCYUNHEo5DGvpj98wPnQE+2WLOK9wjAdGlXc6PqoBCzmI3eikcuIedW91s7CBzZr
	9HIXChhPO44h3dtxqM8s5Vgqv47smS8AlSK4qHxJr0vseYAnRjjfLnTx58PhhdbCVPL8n7KcCN+sR
	7yaj1vTQJzfD22NIsiR8YEbnFfiWFTKPuZ/krTWTF9mMJi/PRAUPkYmptBFLg7bWL6ASAY3ezypRq
	TFy2NDeElPvUHU0QqF79jpru8Dna9vEL6N+Lu5TG4hUb7z7zUMTkrPuDSLOYoDcqufpJ1JXrx7a+a
	FdEsKrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiO8-0000000EpPl-3YrO;
	Fri, 04 Jul 2025 15:31:44 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi6S-0000000EmsX-4AQr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:13:30 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 887122118A;
	Fri,  4 Jul 2025 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751642007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2GjZktKM3Y5oURN46oUVqyGn4fu4vb+qYUJ6tUVUIg=;
	b=v0j0caA56jDGssv5Dw0KOkj0Of8befju4gIY9xoDO2dNMWq8mOoH68eJN1KfxFr5NHnshe
	Gi67ZBpRhxLhIoF2bTeNb5RTz+J6KYzIM7PQG8xC5QIAE0VlEfac1yIVRnx+cowLiy4oEv
	qWQT0yj+ajvFNwVr+kQ36IGcVjw6xY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751642007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2GjZktKM3Y5oURN46oUVqyGn4fu4vb+qYUJ6tUVUIg=;
	b=6ixN2WmShkS92b8vQRjMfrrLWi7Av2QKz1rP65+A1JkFdYaexJaebZZdTDeh3XoeBlYCMu
	oRGEjvtTiyLxZLCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751642005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2GjZktKM3Y5oURN46oUVqyGn4fu4vb+qYUJ6tUVUIg=;
	b=OevvFzsMb4OyUbujLhznaW5v43J0IVtrrqycIXCR/zSI48pxqxOQFqQojwuGk6ond2k+cF
	+eaf6DliMjnoBrYz8OPStmAaXvHYCWsYv0niuHW+ISOtx0lxnibFsSSGPI7hoM8jEXImKR
	8xTBq2sMbK1jkATIey/XTTosTAQWDZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751642005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2GjZktKM3Y5oURN46oUVqyGn4fu4vb+qYUJ6tUVUIg=;
	b=8mHhaZ3egnzHDBHtebzfnwFwxUIYEzAbbBz0tHN4++oHdIQWoF7ag5slwJ9SlloM4+a9ij
	pLu0WHpGNQ91chDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A76113757;
	Fri,  4 Jul 2025 15:13:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qIpcBJXvZ2hrBgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 15:13:25 +0000
Date: Fri, 4 Jul 2025 17:13:15 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] soc: aspeed: lpc-snoop: Consolidate channel
 initialisation
Message-ID: <20250704171315.30300f59@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-9-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-9-3cdd59c934d3@codeconstruct.com.au>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081329_183175_B9C6682D 
X-CRM114-Status: GOOD (  30.85  )
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

Hi Andrew,

On Mon, 16 Jun 2025 22:43:46 +0930, Andrew Jeffery wrote:
> Previously, channel initialisation was a bit perilous with respect to
> resource cleanup in error paths. While the implementation had issues,
> it at least made an effort to eliminate some of its problems by first
> testing whether any channels were enabled, and bailing out if not.
> 
> Having improved the robustness of resource handling in probe() we can
> now rearrange the initial channel test to be located with the subsequent
> test, and rework the unrolled conditional logic to use a loop for an
> improvement in readability.

I like the idea, this indeed improves readability and would make it
much easier to add support for more channels. Three suggestions inline
below.

> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 +++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 8dbc9d4158b89f23bda340f060d205a29bbb43c3..9f88c5471b1b6d85f6d9e1970240f3d1904d166c 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -294,12 +294,21 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  	kfifo_free(&channel->fifo);
>  }
>  
> +static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
> +
> +	/* Disable both snoop channels */
> +	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
> +	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);

For consistency with the probe function, I think it would make sense to
use a for loop here as well, instead of hard-coding the channel number
to 2. That way, no change will be needed if a future device supports
more than 2 channels.

> +}
> +
>  static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>  {
>  	struct aspeed_lpc_snoop *lpc_snoop;
> -	struct device *dev;
>  	struct device_node *np;
> -	u32 port;
> +	struct device *dev;
> +	int idx;
>  	int rc;
>  
>  	dev = &pdev->dev;
> @@ -322,12 +331,6 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(&pdev->dev, lpc_snoop);
>  
> -	rc = of_property_read_u32_index(dev->of_node, "snoop-ports", 0, &port);
> -	if (rc) {
> -		dev_err(dev, "no snoop ports configured\n");
> -		return -ENODEV;
> -	}
> -
>  	lpc_snoop->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(lpc_snoop->clk))
>  		return dev_err_probe(dev, PTR_ERR(lpc_snoop->clk), "couldn't get clock");
> @@ -336,30 +339,24 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>  	if (rc)
>  		return rc;
>  
> -	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_0, port);
> -	if (rc)
> -		return rc;
> +	for (idx = ASPEED_LPC_SNOOP_INDEX_0; idx <= ASPEED_LPC_SNOOP_INDEX_MAX; idx++) {
> +		u32 port;
>  
> -	/* Configuration of 2nd snoop channel port is optional */
> -	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
> -				       1, &port) == 0) {
> -		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_1, port);
> -		if (rc) {
> -			aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
> -			return rc;
> -		}
> +		rc = of_property_read_u32_index(dev->of_node, "snoop-ports", idx, &port);
> +		if (rc)
> +			break;
> +
> +		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, idx, port);
> +		if (rc)
> +			goto cleanup_channels;
>  	}
>  
> -	return 0;
> -}
> +	return idx == ASPEED_LPC_SNOOP_INDEX_0 ? -ENODEV : 0;

The driver used to log an error message when returning -NODEV:
"no snoop ports configured". Maybe you could call dev_err_probe()
here?

It might also be a good idea to add a comment stating that only the
first channel is mandatory, to explain why the ASPEED_LPC_SNOOP_INDEX_0
case is handled differently (there used to be a comment
	/* Configuration of 2nd snoop channel port is optional */
serving that purpose).

>  
> -static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
> -{
> -	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
> +cleanup_channels:
> +	aspeed_lpc_snoop_remove(pdev);
>  
> -	/* Disable both snoop channels */
> -	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
> -	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
> +	return rc;
>  }
>  
>  static const struct aspeed_lpc_snoop_model_data ast2400_model_data = {
> 

None if this is blocking though, so:

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support

