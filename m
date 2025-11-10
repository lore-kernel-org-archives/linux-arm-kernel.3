Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FC4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1sh5TmGoz6Jgc/8yxa7Z0cN9cWHOtB+XEJ7MN02YQ0=; b=YUpLymncHb8Df8HAp29XfJw9MH
	n+0Ap1XcFoVqWtkbwiXnMyovhPk/tq+ThPByXbPSTK4rfJIZR/YFIFckFvx10jTVJcQ655kCdRQ4k
	oz6cw+sriUnFDSbuSzZgLdy1p1FhhAigYfSpGwmDS0lr9pya252dotVlhVFAHu29a0+S/iFTNaojn
	e97awvHIIAk2CmFZskg/pkAj8gmMYwT2cpWuL8gDT0mwFkG06kBdg75XXIhmCTfd93HbxBai8crHh
	Rv62wAhSPu6iuf/dUy4L9mO9VpXQl+CilcKJS2XohEJ5B5Tkfx/ZXPbY5FzY85mQFyMKjZLP3Idug
	G6HYGgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN2Z-00000004xWE-45cy;
	Mon, 10 Nov 2025 08:14:20 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN2X-00000004xVZ-3hHa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:14:19 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 621771F399;
	Mon, 10 Nov 2025 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762762454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z1sh5TmGoz6Jgc/8yxa7Z0cN9cWHOtB+XEJ7MN02YQ0=;
	b=X+CraUtYEnj5d2o57jTQqWsqtuF5/mSgSlPRZhtlw/M2NkgxLG7qIgQbGkntn9Df2yrWXV
	PtoO8tRzyjvIaC+G5bp26jlfKC+MK5mXG4o9doRUeC12HA8gvkC0G1SrbB+dK3Ja7eFWNf
	osy0j/zS7S1DGUx+qmd9pBLMgMOH/ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762762454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z1sh5TmGoz6Jgc/8yxa7Z0cN9cWHOtB+XEJ7MN02YQ0=;
	b=w4ytOpwLHgPAeMgalPau+4o4NKbcJYxSmA7kqR3ji8t9s0VUYMniEi4x313XRWBoW7JmZL
	qobSq8dDqo/ozDAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yVVsWHy4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QUue0kzI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762762453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z1sh5TmGoz6Jgc/8yxa7Z0cN9cWHOtB+XEJ7MN02YQ0=;
	b=yVVsWHy4USkZSr8H6dbCqxMmzZ2ORvSyqHdmZPMVGQEiedy7H+5ckHlVNOZFp+xovassFJ
	BNY6u1dJj/fcE0q1xKnRyPy52/ltj0NmNP3JkJBvnuXihlBNZ0GRAUBtVdWCktiNnGmZuY
	//T+sYF0+V1SUzXZnXX1t99YwLHzfGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762762453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z1sh5TmGoz6Jgc/8yxa7Z0cN9cWHOtB+XEJ7MN02YQ0=;
	b=QUue0kzIYLwecTRF8IFmE5sw9X6lHIcl2wzAdiyxNPbVD2+4xycZd+xiEZ7nloIn7Bt9Fe
	xSsCeAbBQKA5cPCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1109413BA4;
	Mon, 10 Nov 2025 08:14:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uVGTAtWeEWk7HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Nov 2025 08:14:13 +0000
Date: Mon, 10 Nov 2025 09:14:12 +0100
Message-ID: <87pl9qxq23.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix resource cleanup in alc_alloc_spec error path
In-Reply-To: <20251110072349.102169-1-wangdich9700@163.com>
References: <20251110072349.102169-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 621771F399
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_001418_070970_636B54BF 
X-CRM114-Status: GOOD (  21.13  )
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

On Mon, 10 Nov 2025 08:23:49 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Ensure proper resource cleanup when alc_codec_rename_from_preset() fails
> in alc_alloc_spec(). Currently, the error path only calls kfree(spec) but
> does not:
> 
> 1. Destroy the initialized coef_mutex mutex

It's rather an optional operation.  As of the probing phase, there is
really no much race, after all.
(And, it's not handled properly in your patch, either...)

> 2. Reset codec->spec to NULL, potentially leaving a dangling pointer

This is done in snd_hda_codec_cleanup_for_unbind() called in the error
handling of hda_codec_driver_probe().


thanks,

Takashi

> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/hda/codecs/realtek/realtek.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
> index ca377a5adadb..9a358c072e50 100644
> --- a/sound/hda/codecs/realtek/realtek.c
> +++ b/sound/hda/codecs/realtek/realtek.c
> @@ -1029,6 +1029,7 @@ int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
>  {
>  	struct alc_spec *spec = kzalloc(sizeof(*spec), GFP_KERNEL);
>  	int err;
> +	bool mutex_initialized = false;
>  
>  	if (!spec)
>  		return -ENOMEM;
> @@ -1040,14 +1041,22 @@ int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
>  	/* FIXME: do we need this for all Realtek codec models? */
>  	codec->spdif_status_reset = 1;
>  	codec->forced_resume = 1;
> +
>  	mutex_init(&spec->coef_mutex);
>  
>  	err = alc_codec_rename_from_preset(codec);
>  	if (err < 0) {
> -		kfree(spec);
> -		return err;
> +		codec_err(codec, "Failed to rename codec: %d\n", err);
> +		goto error;
>  	}
>  	return 0;
> +
> +error:
> +	if (mutex_initialized)
> +		mutex_destroy(&spec->coef_mutex);
> +	codec->spec = NULL;
> +	kfree(spec);
> +	return err;
>  }
>  EXPORT_SYMBOL_NS_GPL(alc_alloc_spec, "SND_HDA_CODEC_REALTEK");
>  
> -- 
> 2.25.1
> 

