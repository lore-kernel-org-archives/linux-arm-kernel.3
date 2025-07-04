Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E439C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnCd8EhWi608gG2ZJYlh4eX8dcVJgRAAdrIHdUvyEVw=; b=jTFcd4XwR8a5K32xHJqLUR1Ygf
	tAJV6AnBoCN1/z/XLrWQRMWRch+Z/PlPpzgiCyuYi8xTPA99wi7kgAapkEzydAxaKzlN6+yVohTi3
	v/PnXdwQyaLWuzAZpv2DyV+e9hACsYANsx5rfuNOEMGu6ljht+AkZkuo1p+O23RJrzZcDKZ5+wlfL
	TuBPj/SeifC1g6lte7eSwcdssOVbqbe6eW6ZFD7rt5Eau9YtgiSduKFmHvJahdL//9nZ1JeqYlGKS
	AuAGp7g1gnhEmgpLObsRXsKxuSxUlblfIaa2B3pAX6N1MyaT/uHrBxmbGnkZAH51cyWA8tpGGAJQy
	OPuP6itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjhQ-0000000F28C-3uam;
	Fri, 04 Jul 2025 16:55:44 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjCd-0000000Ewqe-1GLT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:23:56 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA2A51F38A;
	Fri,  4 Jul 2025 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751646233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnCd8EhWi608gG2ZJYlh4eX8dcVJgRAAdrIHdUvyEVw=;
	b=L2gR8tuP/PGpICezWU6I/FHdzfdVJ014+mXt7VCUxfIQQGuLHGkju0of77fIkhWtrXhLlv
	6B6Nnw61wPYIIbP4VKNpFWgCSNIN7tPBAOsVBDPKwM6gVGRueQs4W3TQ4dj3xYzz/Imi/M
	8K8tJAs/q55YfzyCxE5lnc279+Ynnyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751646233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnCd8EhWi608gG2ZJYlh4eX8dcVJgRAAdrIHdUvyEVw=;
	b=2ovIm12+Lw1AIzV5K/Ddziql1f/EX0Vn9Xt4Lt+ZdAxmlKIPcDAKDV1CHX+WjgoQJFWuV6
	kQc3a1yAdZFyzRBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751646233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnCd8EhWi608gG2ZJYlh4eX8dcVJgRAAdrIHdUvyEVw=;
	b=L2gR8tuP/PGpICezWU6I/FHdzfdVJ014+mXt7VCUxfIQQGuLHGkju0of77fIkhWtrXhLlv
	6B6Nnw61wPYIIbP4VKNpFWgCSNIN7tPBAOsVBDPKwM6gVGRueQs4W3TQ4dj3xYzz/Imi/M
	8K8tJAs/q55YfzyCxE5lnc279+Ynnyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751646233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnCd8EhWi608gG2ZJYlh4eX8dcVJgRAAdrIHdUvyEVw=;
	b=2ovIm12+Lw1AIzV5K/Ddziql1f/EX0Vn9Xt4Lt+ZdAxmlKIPcDAKDV1CHX+WjgoQJFWuV6
	kQc3a1yAdZFyzRBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48A4613757;
	Fri,  4 Jul 2025 16:23:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Kke6DxkAaGhNGgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 16:23:53 +0000
Date: Fri, 4 Jul 2025 18:23:48 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] soc: aspeed: lpc-snoop: Lift channel config to
 const structs
Message-ID: <20250704182348.53808e0f@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-10-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-10-3cdd59c934d3@codeconstruct.com.au>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_092355_642932_4B5E09AE 
X-CRM114-Status: GOOD (  32.12  )
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

On Mon, 16 Jun 2025 22:43:47 +0930, Andrew Jeffery wrote:
> The shifts and masks for each channel are defined by hardware and
> are not something that changes at runtime. Accordingly, describe the
> information in an array of const structs and associate elements with
> each channel instance, removing the need for the switch and handling of
> its default case.

I like this.

Note that technically, the removal of the default case in the switch
was already possible since patch 06/10 (soc: aspeed: lpc-snoop:
Constrain parameters in channel paths).

> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 100 +++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 9f88c5471b1b6d85f6d9e1970240f3d1904d166c..2d97b8d5fb429e215c321c9c2ee3fa35d39f8618 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -63,7 +63,16 @@ enum aspeed_lpc_snoop_index {
>  	ASPEED_LPC_SNOOP_INDEX_MAX = ASPEED_LPC_SNOOP_INDEX_1,
>  };
>  
> +struct aspeed_lpc_snoop_channel_cfg {
> +	enum aspeed_lpc_snoop_index index;
> +	u32 hicr5_en;
> +	u32 snpwadr_mask;
> +	u32 snpwadr_shift;
> +	u32 hicrb_en;
> +};
> +
>  struct aspeed_lpc_snoop_channel {
> +	const struct aspeed_lpc_snoop_channel_cfg *cfg;
>  	bool enabled;
>  	struct kfifo		fifo;
>  	wait_queue_head_t	wq;
> @@ -77,6 +86,23 @@ struct aspeed_lpc_snoop {
>  	struct aspeed_lpc_snoop_channel chan[ASPEED_LPC_SNOOP_INDEX_MAX + 1];
>  };
>  
> +static const struct aspeed_lpc_snoop_channel_cfg channel_cfgs[ASPEED_LPC_SNOOP_INDEX_MAX + 1] = {
> +	{
> +		.index = ASPEED_LPC_SNOOP_INDEX_0,
> +		.hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
> +		.snpwadr_mask = SNPWADR_CH0_MASK,
> +		.snpwadr_shift = SNPWADR_CH0_SHIFT,
> +		.hicrb_en = HICRB_ENSNP0D,
> +	},
> +	{
> +		.index = ASPEED_LPC_SNOOP_INDEX_1,
> +		.hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
> +		.snpwadr_mask = SNPWADR_CH1_MASK,
> +		.snpwadr_shift = SNPWADR_CH1_SHIFT,
> +		.hicrb_en = HICRB_ENSNP1D,
> +	},
> +};
> +
>  static struct aspeed_lpc_snoop_channel *snoop_file_to_chan(struct file *file)
>  {
>  	return container_of(file->private_data,
> @@ -189,28 +215,27 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
>  }
>  
>  __attribute__((nonnull))
> -static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
> -				   struct device *dev,
> -				   enum aspeed_lpc_snoop_index index, u16 lpc_port)
> +static int aspeed_lpc_enable_snoop(struct device *dev,
> +				    struct aspeed_lpc_snoop *lpc_snoop,
> +				    struct aspeed_lpc_snoop_channel *channel,
> +				    const struct aspeed_lpc_snoop_channel_cfg *cfg,
> +				    u16 lpc_port)
>  {

I'm confused by this new calling convention. With lpc_snoop and index,
you could already retrieve the aspeed_lpc_snoop_channel struct and the
aspeed_lpc_snoop_channel_cfg struct. I can't see the benefit of the
change. It even forces you to add an index field to struct
aspeed_lpc_snoop_channel_cfg, which would otherwise not be needed.

If you prefer to pass cfg instead of index as a parameter, that does
not imply passing channel too. You can get the index from the cfg (if
you decide to keep it in that struct), and then the channel from index.

Or you could even pass only the channel (to be consistent with
aspeed_lpc_disable_snoop), if you set channel->cfg before calling this
function. Again this implies keeping index in struct
aspeed_lpc_snoop_channel_cfg.

>  	const struct aspeed_lpc_snoop_model_data *model_data;
> -	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
> -	struct aspeed_lpc_snoop_channel *channel;
>  	int rc = 0;
>  
> -	channel = &lpc_snoop->chan[index];
> -
>  	if (WARN_ON(channel->enabled))
>  		return -EBUSY;
>  
>  	init_waitqueue_head(&channel->wq);
>  
> +	channel->cfg = cfg;
>  	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
>  	channel->miscdev.fops = &snoop_fops;
>  	channel->miscdev.parent = dev;
>  
>  	channel->miscdev.name =
> -		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
> +		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, cfg->index);
>  	if (!channel->miscdev.name)
>  		return -ENOMEM;
>  
> @@ -223,39 +248,18 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  		goto err_free_fifo;
>  
>  	/* Enable LPC snoop channel at requested port */
> -	switch (index) {
> -	case 0:
> -		hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W;
> -		snpwadr_mask = SNPWADR_CH0_MASK;
> -		snpwadr_shift = SNPWADR_CH0_SHIFT;
> -		hicrb_en = HICRB_ENSNP0D;
> -		break;
> -	case 1:
> -		hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W;
> -		snpwadr_mask = SNPWADR_CH1_MASK;
> -		snpwadr_shift = SNPWADR_CH1_SHIFT;
> -		hicrb_en = HICRB_ENSNP1D;
> -		break;
> -	default:
> -		rc = -EINVAL;
> -		goto err_misc_deregister;
> -	}
> -
> -	/* Enable LPC snoop channel at requested port */
> -	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
> -	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
> -			   lpc_port << snpwadr_shift);
> +	regmap_set_bits(lpc_snoop->regmap, HICR5, cfg->hicr5_en);
> +	regmap_update_bits(lpc_snoop->regmap, SNPWADR, cfg->snpwadr_mask,
> +		lpc_port << cfg->snpwadr_shift);

It is a good practice to align the second line on the opening
parenthesis of the first line (as was done originally).

>  
>  	model_data = of_device_get_match_data(dev);
>  	if (model_data && model_data->has_hicrb_ensnp)
> -		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
> +		regmap_set_bits(lpc_snoop->regmap, HICRB, cfg->hicrb_en);
>  
>  	channel->enabled = true;
>  
>  	return 0;
>  
> -err_misc_deregister:
> -	misc_deregister(&channel->miscdev);
>  err_free_fifo:
>  	kfifo_free(&channel->fifo);
>  	return rc;
> @@ -263,30 +267,13 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  
>  __attribute__((nonnull))
>  static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
> -				     enum aspeed_lpc_snoop_index index)
> +				     struct aspeed_lpc_snoop_channel *channel)
>  {
> -	struct aspeed_lpc_snoop_channel *channel;
> -
> -	channel = &lpc_snoop->chan[index];
> -
>  	if (!channel->enabled)
>  		return;
>  
>  	/* Disable interrupts along with the device */
> -	switch (index) {
> -	case 0:
> -		regmap_update_bits(lpc_snoop->regmap, HICR5,
> -				   HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
> -				   0);
> -		break;
> -	case 1:
> -		regmap_update_bits(lpc_snoop->regmap, HICR5,
> -				   HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
> -				   0);
> -		break;
> -	default:
> -		return;
> -	}
> +	regmap_clear_bits(lpc_snoop->regmap, HICR5, channel->cfg->hicr5_en);
>  
>  	channel->enabled = false;
>  	/* Consider improving safety wrt concurrent reader(s) */
> @@ -299,8 +286,8 @@ static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
>  	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
>  
>  	/* Disable both snoop channels */
> -	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
> -	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
> +	aspeed_lpc_disable_snoop(lpc_snoop, &lpc_snoop->chan[0]);
> +	aspeed_lpc_disable_snoop(lpc_snoop, &lpc_snoop->chan[1]);
>  }
>  
>  static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
> @@ -339,6 +326,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>  	if (rc)
>  		return rc;
>  
> +	static_assert(ARRAY_SIZE(channel_cfgs) == ARRAY_SIZE(lpc_snoop->chan),
> +		"Broken implementation assumption regarding cfg count");

Both also need to be equal to ASPEED_LPC_SNOOP_INDEX_MAX + 1, right?
Otherwise the loop below would break. But it turns out that both arrays
are now declared that way, so it just has to be true. This makes me
believe that this static assert is no longer needed.

>  	for (idx = ASPEED_LPC_SNOOP_INDEX_0; idx <= ASPEED_LPC_SNOOP_INDEX_MAX; idx++) {
>  		u32 port;
>  
> @@ -346,7 +335,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>  		if (rc)
>  			break;
>  
> -		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, idx, port);
> +		rc = aspeed_lpc_enable_snoop(dev, lpc_snoop, &lpc_snoop->chan[idx],
> +					     &channel_cfgs[idx], port);
>  		if (rc)
>  			goto cleanup_channels;
>  	}
> 


-- 
Jean Delvare
SUSE L3 Support

