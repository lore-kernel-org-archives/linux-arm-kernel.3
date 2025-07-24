Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F01C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=; b=BRPRFLIXXH83SQ0gqkeCJFnrww
	n+R5btSJT3hM2qR7U7hRWwOXg7wZAvfUzFZy4JMONj4qAeyVjE362tRhS4gjUFU55wRytAcq/AIP6
	bf4t+HWYKAEWMQsm9SEvq46W+6+pASkLOe2iJfhFJB2QtzyXjRTBMRaXa/H0euRSjOUo1g3KpjU03
	FIkd+ji4glaogQwrNtZq6NreiibhQ7KkCOqjPB03bF96ywvcT5DYM9EMxmLTHR/iVstKWYyeWlYRv
	Bp4vn9891xgNLs4Ldmr3yo8aIS9Z1TY5pVjtTIPAgGkD6Kg6MyYhbT2mlcCQ5mPOd8CR/ZOj+2CGq
	kdIHlfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqrB-00000006lrb-3XH7;
	Thu, 24 Jul 2025 07:59:13 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqVt-00000006jCt-2drG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:37:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8AB781F394;
	Thu, 24 Jul 2025 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753342630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
	b=iSmpZvav8lnYGFgYWT9RAL6mampmVxsQdOjORxZQmpl2iwQ5NuepLPirg2axvQMywNZgsg
	sM/0rzB57rZzEH02wqXjW5wz+pcC37QvGMCoeNz+fEKMCHQtyI/iIz9EuMlZaSg5Zjlh9u
	Cqykg5TDSqTxG//PZUt1z2wPWxaauJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753342630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
	b=z4rbEGUwD7bCn2kBeVEXY5/AYO2k2An2G2PY3o03wE+J5eEo0PlaGSqS80GqXeQKv6Rpds
	ExwDAG9wh3tpu4BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753342630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
	b=iSmpZvav8lnYGFgYWT9RAL6mampmVxsQdOjORxZQmpl2iwQ5NuepLPirg2axvQMywNZgsg
	sM/0rzB57rZzEH02wqXjW5wz+pcC37QvGMCoeNz+fEKMCHQtyI/iIz9EuMlZaSg5Zjlh9u
	Cqykg5TDSqTxG//PZUt1z2wPWxaauJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753342630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LBu7qSBaLkXMmbSWG/aE/FgzcMzPqdoHLqQXT0G0B0=;
	b=z4rbEGUwD7bCn2kBeVEXY5/AYO2k2An2G2PY3o03wE+J5eEo0PlaGSqS80GqXeQKv6Rpds
	ExwDAG9wh3tpu4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A643D13302;
	Thu, 24 Jul 2025 07:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7gjAJqXigWjKMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 07:37:09 +0000
Date: Thu, 24 Jul 2025 09:37:09 +0200
Message-ID: <87jz3ykpju.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	lumag@kernel.org,
	dianders@chromium.org,
	cristian.ciocaltea@collabora.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	l.stach@pengutronix.de,
	shengjiu.wang@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958 subframe
In-Reply-To: <20250724072248.1517569-3-shengjiu.wang@nxp.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
	<20250724072248.1517569-3-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,chromium.org,collabora.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,nxp.com,pengutronix.de,lists.linux.dev,lists.infradead.org,perex.cz,suse.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	R_RATELIMIT(0.00)[to_ip_from(RL8m7tqgwaqu97o1bbfnn6ewdz)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_003713_814603_58B4E90B 
X-CRM114-Status: GOOD (  17.95  )
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

On Thu, 24 Jul 2025 09:22:44 +0200,
Shengjiu Wang wrote:
> 
> The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> in HDMI and DisplayPort to describe the audio stream, but hardware device
> may need to reorder the IEC958 bits for internal transmission, so need
> these standard bits definitions for IEC958 subframe format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  include/sound/asoundef.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> index 09b2c3dffb30..7efd61568636 100644
> --- a/include/sound/asoundef.h
> +++ b/include/sound/asoundef.h
> @@ -12,6 +12,15 @@
>   *        Digital audio interface					    *
>   *                                                                          *
>   ****************************************************************************/
> +/* IEC958 subframe format */
> +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xf)
> +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xf<<4)
> +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffff<<4)
> +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffff<<8)
> +#define IEC958_SUBFRAME_VALIDITY	(0x1<<28)
> +#define IEC958_SUBFRAME_USER_DATA	(0x1<<29)
> +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1<<30)
> +#define IEC958_SUBFRAME_PARITY		(0x1<<31)

I'd use "U" suffix as it can reach to the MSB.
Also, you can put spaces around the operators to align with the
standard format, too.  I guess you followed to the other code there,
but following to the standard coding style would be better.

With those addressed, feel free to take my ack for this patch:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

