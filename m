Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A9DCF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=; b=YQD49du0fjHOEdDIN7cwYNmDF2
	D+dynk9GheyfdDrXVMB9UgYQcZk19velua9jPTnMEsuUr08BByHKV/mCGvjiJ/arnOa9RfvuUap7X
	78hiEZGb2t/GR3bgNGUiVZaYzvvAR0EdxhH20q4YBjOXdMQH/vBg9DI8nWA2/SiN0/gX2PFhINLwa
	Ka5SU6uHMmB0k7dV0S1XDufgTnGG1m9kjs6C0RV3Z/7NucolF2/g3vneVU5EOM2pgo8a6CYp/CLTW
	SWIE4t3Zdt4J4CsH4JiW7rVAaribKYAX26GgmVMYlZZBEgAGL3OzagJFWWKrqo+tAi93jCihIrGJd
	KnRzzruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLe4p-00000002pbf-2a6e;
	Wed, 19 Nov 2025 09:02:11 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLe4n-00000002pak-2pXK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:02:10 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9910A20350;
	Wed, 19 Nov 2025 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763542927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=J9PXH68TqQoEV113rZqnL4s0d+nXAzfxebxGJNVyB+/5QrtFt/sFrt85ZShe2GRmBXdRxO
	TsjcwvJMI5VnqzCO1qvo0yno1/WndUI3Ig6+9w86qSKxvbgGv6thgXF446bBOKQStUp8qf
	TZEk26Z4N5eu9zj96isn0WuN8jzk0zE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763542927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=sPWZXHQPcGLcn/108jQi8kZzI8YuddKihnmixbxocGGuUR0CoW0vWQCmjR2ft7MY9/QWt+
	5M5Mf7axurH9BdBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763542922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=k7E9GM5feH2x/ar8CrCIQzFcYXLf6VzNikamhQcDahHrIMDuiVsBtrZy3VAZRuGm5QeJ03
	y7SCg+ttaUdePqCi8a/Z2qA/3Sds41ZrFIRfumHU5uPr/qLOHVL+JiVlnNTgxky71zDXj/
	33HMmvwlWiBCwzeJ9+4xsu7hAhRzFY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763542922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToDdAdg9C2SVcxT2uDfdI7BQPgK+8uFH1OMxwx07Dx4=;
	b=kq6SICtrft07bBeJYKcTPJQbFO/B5hGGn9fNcOuOhvnWSAppBNPEiLnRtDrXL8J2CeEzUu
	+5wkOVq5xX2fyzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54DFD3EA61;
	Wed, 19 Nov 2025 09:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XCZ7E4qHHWk+NgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Nov 2025 09:02:02 +0000
Date: Wed, 19 Nov 2025 10:02:01 +0100
Message-ID: <87o6oycs52.wl-tiwai@suse.de>
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
Subject: Re: [PATCH V2] ALSA: hda/conexant: Implement resume function
In-Reply-To: <20251119085345.141850-1-wangdich9700@163.com>
References: <20251119085345.141850-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,kylinos.cn:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_010209_859336_52501E25 
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

On Wed, 19 Nov 2025 09:53:45 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> During S3 sleep state, if headphones are unplugged, we need to re-report
> their status during the wake phase to ensure proper headphone presence
> detection after system resume.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> 
> v1->v2:
> Problem: No audio output device after S3.
> Cause: The audio driver misses re-initialization upon resume,
> resulting in stale jack status (remaining in the pre-sleep state),
> which prevents the system from finding the correct output device.

Again, please double-check what is the really cause.

snd_hda_jack_report_sync() *is* called already in
hda_call_codec_resume().  So snd_hda_jack_report_sync() is just called
twice with your patch, which must be superfluous.

The other significant difference with your patch is that you dropped
snd_hda_regmap_sync().  So it must break something else.


Takashi

> 
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

