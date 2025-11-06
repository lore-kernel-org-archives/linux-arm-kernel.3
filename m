Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C1FCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jvi0Iaf+/csCxjpFObwc35qa1a6MdGB2jlu9D0Jc6o8=; b=HXqSsBZnyeD/bbAZbtqnWBqxaA
	pqITAWH1e9IIfQu6Tap9pYW3q3MoolFr281p4U8gSn4N6CrKQDf2FcGKYGmcOQByn+6jzVmvusr9h
	wBY/eZKTUguZ1Sbu+/ygQQz4zoXd4IKf+Ff+d6pA7lSExWduxSXJydcnlpxzqjHGTGSTOKcJUHN1O
	K3he/qA8iBcLYacJiSj5sMhbChnc4o2IckIHYDQdhF9d0kEFfmnySGfhx2dwqV9vC92e5ffP8vAOJ
	jmwwIeyZtpdVuQ5EI9nCBqW6hv6fiaNLIJMso31Uh1o1jieljfi7+tEQBKGQuSb13WYgfJbhnUavX
	SUIB/PaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwst-0000000FI2B-0VcQ;
	Thu, 06 Nov 2025 10:06:27 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwsq-0000000FI1I-3pJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:06:26 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A43C61F393;
	Thu,  6 Nov 2025 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762423583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvi0Iaf+/csCxjpFObwc35qa1a6MdGB2jlu9D0Jc6o8=;
	b=ltX8MbQagWfvLsNl88IH7CgBOrmXbE9fiDKw/x+3Fcxv9TqNLCwtUzdFj5+2nWZpvmxtLb
	J9Zw7+HmJRxu0nQJuI8WsT+p0hlJzQc3+aEbEgJWmCv0V6cUBs7ZakZIV600v34IlF+nAT
	o1XA+YTX6zaCBszJObTATgsk30lIkzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762423583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvi0Iaf+/csCxjpFObwc35qa1a6MdGB2jlu9D0Jc6o8=;
	b=sy1bMSgRgyAB+LGwwMJRnEY67MNpNlP8EuFB9HEmmNrIzRfus/6UscSinDZNaCNi+ThRdW
	vtUOXArfmFCbrGCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762423581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvi0Iaf+/csCxjpFObwc35qa1a6MdGB2jlu9D0Jc6o8=;
	b=leFc1KCWzrresVwOiVLInOC4KGk1bsGrDlDllzKNISAJb/+i6G1aFoR/ak+l1lBXAmdm1X
	gIrD4FIJNAOAVI737lQqyhroP3cNux7zo4IxpgBggAzbRBqncoQ2ToO9eNS+t821Ds+Dgf
	zQwWU6Os5j7+vqqxdUvzIUk6/cX5ZSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762423581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvi0Iaf+/csCxjpFObwc35qa1a6MdGB2jlu9D0Jc6o8=;
	b=sTlomgEkfuMVNE4KRWvDNUd4P+3yydTHjgUIIW668nzMQbSe0CmwePUBEVIN4AuXInG0H1
	BT5DqtXeKjQ7klCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 613E313A31;
	Thu,  6 Nov 2025 10:06:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J9JPFh1zDGmCOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Nov 2025 10:06:21 +0000
Date: Thu, 06 Nov 2025 11:06:21 +0100
Message-ID: <874ir7h3vm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/senary: Fix potential resource leak in set_beep_amp
In-Reply-To: <20251106063546.115197-1-wangdich9700@163.com>
References: <20251106063546.115197-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020625_096712_19561704 
X-CRM114-Status: GOOD (  23.62  )
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

On Thu, 06 Nov 2025 07:35:46 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdich9700@163.com>
> 
> Add proper error handling in set_beep_amp function to avoid potential
> resource leaks when snd_hda_gen_add_kctl fails.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Please align both From and Signed-off-by addresses.
And in this patch...

> ---
>  sound/hda/codecs/senarytech.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
> index 9aa1e9bcd9ec..99af8d5e51db 100644
> --- a/sound/hda/codecs/senarytech.c
> +++ b/sound/hda/codecs/senarytech.c
> @@ -47,17 +47,28 @@ static int set_beep_amp(struct senary_spec *spec, hda_nid_t nid,
>  {
>  	struct snd_kcontrol_new *knew;
>  	unsigned int beep_amp = HDA_COMPOSE_AMP_VAL(nid, 1, idx, dir);
> -	int i;
> +	int i, err;
>  
>  	spec->gen.beep_nid = nid;
>  	for (i = 0; i < ARRAY_SIZE(senary_beep_mixer); i++) {
>  		knew = snd_hda_gen_add_kctl(&spec->gen, NULL,
>  					    &senary_beep_mixer[i]);
> -		if (!knew)
> -			return -ENOMEM;
> +		if (!knew) {
> +			err = -ENOMEM;
> +			goto error;
> +		}
>  		knew->private_value = beep_amp;
>  	}
>  	return 0;
> +
> +error:
> +	/* Clean up any successfully added controls */
> +	while (i-- > 0) {
> +		/* The gen spec will be cleaned up in senary_remove,
> +		 * so we don't need individual cleanup here
> +		 */
> +	}
> +	return err;
>  }

So the "error handling" you added is just an empty loop.
What really does this patch "fix"?
As of this, it looks like just adding some garbage.


thanks,

Takashi

