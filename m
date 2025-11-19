Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C498CF259B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=; b=yWV5O9GNVQ+hXQvRXhCsZ+B5Ig
	+1v5I+8NXBYAZlvOs1QBMCYsywACy+Ij50GxJt9U1e7bBouhWmSfZyg5nJhpGGheijhPN4M+jboSp
	LaElsrv4J2QdkB0TfpRXzpY4IcTkCwtUoezR0fdaTv3wkGer+nSCZS0eZ8GRgiFhvMRUSHfX5PGyO
	l3pfffumNrWGCmhB0XJ7wj2If28otm1B1T0w/U8Nvc7+70M5JaK6wejVoWNlG7A+KjqfmeHQ1D+8h
	iyQxnU9KlzJZ54SJs+IEuB9gSrrJ6tFMNAGtSeghLdH14ldO55SfdOfBVF7zvkNXCUf5fqBW5qawZ
	haVZ8KIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdLZ-00000002mJd-3ZQO;
	Wed, 19 Nov 2025 08:15:25 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdLW-00000002mHl-3vqf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:15:24 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA4B6211D3;
	Wed, 19 Nov 2025 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763540118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=kwcjDv1dNsgL7ftilW7s7tB3DIXZbi5SanNQmYa+93/MvwSNT94MgdxWRTudnXB5Uu1yvr
	hB8WiUNGjM+hk7GQIaPzCgrm21mqCVH/7Tg8sUi3reYgB0QMAd1eUkzqwyPgoH4zLswNTG
	juEdckNu8JLqQOAU1mnHOzL3yVczR08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763540118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=LUptNvOzJxk3idoHH3JGNZoIVAv/DRoJeKSIYsqsUDoPi6Vc0deOwG+jSwcfrKHXgUdBdN
	2uMPrNayxBQq3qCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763540116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=iV/OwwwJq8PEw8seTCm6GL9w8E2LTp1Xjz8yjBR8qOgdusULj1NX2Bi4Ccxu0cfJ+Hz06A
	5hM6ydVQj4gcQZlX2EmzuK3iFWF4rIso1IahzHoTioQqgc6+Nl0Bd2T22r7LzAJa1WH8nW
	VS9jff59RrbEvJ5idHi+ESPdV9xwnFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763540116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbB/G6BpUKesLPCrROlvA17FK9thnropM116YGSa9PQ=;
	b=z7izlDxGXGx4dxZHpD3g/ce6U6uycnscRjCaHs9iqWsvaa0Aqh6+z8/Exz+cdYQJdPr/uo
	lNbiJye2mJVigIAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FD8F3EA61;
	Wed, 19 Nov 2025 08:15:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ap/pIZR8HWnMCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Nov 2025 08:15:16 +0000
Date: Wed, 19 Nov 2025 09:15:16 +0100
Message-ID: <87tsyqcuaz.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: hda/conexant: Implement resume function
In-Reply-To: <20251119072416.120937-1-wangdich9700@163.com>
References: <20251119072416.120937-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_001523_123505_110DA7A2 
X-CRM114-Status: GOOD (  18.98  )
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

On Wed, 19 Nov 2025 08:24:16 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> During S3 sleep state, if headphones are unplugged, we need to re-report
> their status during the wake phase to ensure proper headphone presence
> detection after system resume.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Are you sure that this change is mandatory?
The common S3 resume via hda_call_codec_resume() already calls
snd_hda_jack_report_sync().


thanks,

Takashi

> ---
>  sound/hda/codecs/conexant.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 5fcbc1312c69..146ff65ccc30 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -264,6 +264,13 @@ static int cx_suspend(struct hda_codec *codec)
>  	return 0;
>  }
>  
> +static int cx_resume(struct hda_codec *codec)
> +{
> +	cx_init(codec);
> +	snd_hda_jack_report_sync(codec);
> +	return 0;
> +}
> +
>  /*
>   * pin fix-up
>   */
> @@ -1277,6 +1284,7 @@ static const struct hda_codec_ops cx_codec_ops = {
>  	.init = cx_init,
>  	.unsol_event = snd_hda_jack_unsol_event,
>  	.suspend = cx_suspend,
> +	.resume = cx_resume,
>  	.check_power_status = snd_hda_gen_check_power_status,
>  	.stream_pm = snd_hda_gen_stream_pm,
>  };
> -- 
> 2.25.1
> 

