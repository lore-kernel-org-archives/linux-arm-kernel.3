Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18B8CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqCJ3U/dPBQGaV7i7k/kR7atpy/cVN5b99fapvM1uOs=; b=XbyWCIEAwZPQCgDA5e/4ThnLKl
	3XUkLYwvfI6y8+M4D7N0bgNrp7hzAi8lrZIYa7bvrnPMJ3y0Qh+w6vGz9zOY8itbFdx1wA7Izudu4
	9xTMIbfHfszGByye/qF4gvR/u/hVNljTB6n2a5vnVnrJfuxSj003BdNQvfZTZle/Pj/kmUcWtBa+L
	vvq9ywenJAuxf6OXAFOY6jGWlTjBorjLUmw6njfbrRpBZw/o7MOCAhD/IYa4qcnWzpQxhya0ZIA6R
	XJJyxQKdrAtp+Nb2EhOzs+q3Uj7LC2FUJis15zbFUegIWDxQjllT2fkaURTSYSO1RBNErUUQ6nyQx
	+NkGTaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxA5-0000000FJnO-3eXv;
	Thu, 06 Nov 2025 10:24:13 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxA2-0000000FJmD-42Jp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:24:12 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD3D31F457;
	Thu,  6 Nov 2025 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762424649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqCJ3U/dPBQGaV7i7k/kR7atpy/cVN5b99fapvM1uOs=;
	b=Bb8hFQAEuSZnXsy25UAs1Y+hk+z0ks/G/sifw2viOzyvExgcyxxYEGm3/afKlEhtWKoBV2
	F6UK3FYCzscG2CYbGlkD0mWbJChzyjaVGnePMEJZGD0PNOUZ9boeAsZZx8jj6jPKJLWSzV
	GW5RTMH2Ex2b5uzVgL/m9nD+4Y3ncEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762424649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqCJ3U/dPBQGaV7i7k/kR7atpy/cVN5b99fapvM1uOs=;
	b=wwWmp2qyvkHAne2YQTKe96siCokd5zgk3lJsD4v6ZyEwwxw9RFAFfAx+NH982wSaTH5ssg
	/KZ8Mf2Z5DHmIIDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762424648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqCJ3U/dPBQGaV7i7k/kR7atpy/cVN5b99fapvM1uOs=;
	b=izEmMzlLr8p7R9KnNOS2tOsBfnagLWGsm7Vuh0DgtR+Fa+uPN7QQHGnBEr+A0lPkTr28Ed
	lovcdVuH9BmhrSbHiU8rqLXp2szENMsUKc4r4FRnu/GsSBkJP+9Pmma0tALmiJSEPMEcMA
	ra28UEhvpC9jCL2v96lkrmrz9eSQ9Us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762424648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqCJ3U/dPBQGaV7i7k/kR7atpy/cVN5b99fapvM1uOs=;
	b=Xzf/5/XoHJMiLaiYgcUq0ksQp8xe9wr/VTd48oxcAL+nVZg7k6yipfyiDr/cO0Gtc4XyET
	yGeaD5lMImjpH5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F3B213A31;
	Thu,  6 Nov 2025 10:24:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TnqQIUh3DGmITQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Nov 2025 10:24:08 +0000
Date: Thu, 06 Nov 2025 11:24:08 +0100
Message-ID: <871pmbh31z.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] [PATCH v3] ALSA: hda/conexant: Fix pop noise on CX11880/SN6140 codecs
In-Reply-To: <20251106063459.115006-1-wangdich9700@163.com>
References: <20251106063459.115006-1-wangdich9700@163.com>
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_022411_147571_CB74122B 
X-CRM114-Status: GOOD (  30.13  )
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

On Thu, 06 Nov 2025 07:34:59 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdich9700@163.com>
> 
> Pop noise mitigation: When headphones are unplugged during playback, mute
> speaker DAC (0x17) immediately and restore after 20ms delay to avoid
> audible popping. This fix is specifically for CX11880 (0x14f11f86) and
> SN6140 (0x14f11f87) codecs based on testing verification.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> V2 -> V3:
> - Fixed container_of usage by storing codec pointer in spec structure
> - Added cancellation of delayed work when headphone is re-plugged
> - Limited the fix to specific device IDs (0x14f11f86, 0x14f11f87) based on testing
> - Added proper cleanup in remove function

Thanks for the patch, but unfortunately the patch isn't in a good
enough shape.

First off, the code change doesn't consider about the runtime PM.
That is, the work itself might wake up the runtime resume.

The other points are:
- The patch contains lots of magic numbers that should have been
  represented with the defined constants.
- It touches the HD-audio codec verbs directly for pin detections and
  amps, which should be rather done via the standard helpers --
  otherwise it will break the whole regmap caches.  This might be
  intentional, but if so, it must be clearly commented.
- The work must be synced properly at suspend or similar operations,
  too.
- The code assumes the fixed pin definitions without checking the
  actual pin configurations.  It won't work when the pin config
  differs.

And, the most important point is that it's better to do the root cause
analysis again.  Does this happen with the driver's auto-mute feature?
Or it's triggered by user-space like pulseaudio / pipewire?
And, if it's drivers' auto-mute, setting spec->gen.auto_mute_via_amp
has any influence?


thanks,

Takashi


> 
>  sound/hda/codecs/conexant.c | 73 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 5fcbc1312c69..f2f447ab749e 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -43,6 +43,10 @@ struct conexant_spec {
>  	unsigned int gpio_mute_led_mask;
>  	unsigned int gpio_mic_led_mask;
>  	bool is_cx11880_sn6140;
> +
> +	/* Pop noise mitigation */
> +	struct hda_codec *codec;
> +	struct delayed_work pop_mitigation_work;
>  };
>  
>  
> @@ -212,10 +216,74 @@ static void cx_auto_shutdown(struct hda_codec *codec)
>  
>  static void cx_remove(struct hda_codec *codec)
>  {
> +	struct conexant_spec *spec = codec->spec;
> +
> +	cancel_delayed_work_sync(&spec->pop_mitigation_work);
>  	cx_auto_shutdown(codec);
>  	snd_hda_gen_remove(codec);
>  }
>  
> +static void mute_unmute_speaker(struct hda_codec *codec, hda_nid_t nid, bool mute)
> +{
> +	unsigned int conn_sel, dac, conn_list, gain_left, gain_right;
> +
> +	conn_sel = snd_hda_codec_read(codec, nid, 0, 0xf01, 0x0);
> +	conn_list = snd_hda_codec_read(codec, nid, 0, 0xf02, 0x0);
> +
> +	dac = ((conn_list >> (conn_sel * 8)) & 0xff);
> +	if (dac == 0)
> +		return;
> +
> +	gain_left = snd_hda_codec_read(codec, dac, 0, 0xba0, 0x0);
> +	gain_right = snd_hda_codec_read(codec, dac, 0, 0xb80, 0x0);
> +
> +	if (mute) {
> +		gain_left |= 0x80;
> +		gain_right |= 0x80;
> +	} else {
> +		gain_left &= (~(0x80));
> +		gain_right &= (~(0x80));
> +	}
> +
> +	snd_hda_codec_write(codec, dac, 0, 0x3a0, gain_left);
> +	snd_hda_codec_write(codec, dac, 0, 0x390, gain_right);
> +
> +	if (mute) {
> +		snd_hda_codec_write(codec, nid, 0, 0x707, 0);
> +		codec_dbg(codec, "mute_speaker, set 0x%x PinCtrl to 0.\n", nid);
> +	} else {
> +		snd_hda_codec_write(codec, nid, 0, 0x707, 0x40);
> +		codec_dbg(codec, "unmute_speaker, set 0x%x PinCtrl to 0x40.\n", nid);
> +	}
> +}
> +
> +static void pop_mitigation_worker(struct work_struct *work)
> +{
> +	struct conexant_spec *spec = container_of(work, struct conexant_spec,
> +			pop_mitigation_work.work);
> +	struct hda_codec *codec = spec->codec;
> +
> +	mute_unmute_speaker(codec, 0x17, false);
> +}
> +
> +static void cx_auto_pop_mitigation(struct hda_codec *codec,
> +		struct hda_jack_callback *event)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +	int phone_present;
> +
> +	phone_present = snd_hda_codec_read(codec, 0x16, 0, 0xf09, 0x0);
> +	if (!(phone_present & 0x80000000)) {
> +		/* Headphone unplugged, mute speaker immediately */
> +		mute_unmute_speaker(codec, 0x17, true);
> +		/* Schedule unmute after 20ms delay */
> +		schedule_delayed_work(&spec->pop_mitigation_work, msecs_to_jiffies(20));
> +	} else {
> +		/* Headphone plugged in, cancel any pending unmute */
> +		cancel_delayed_work_sync(&spec->pop_mitigation_work);
> +	}
> +}
> +
>  static void cx_process_headset_plugin(struct hda_codec *codec)
>  {
>  	unsigned int val;
> @@ -1178,6 +1246,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
>  	if (!spec)
>  		return -ENOMEM;
> +
> +	spec->codec = codec;
> +	INIT_DELAYED_WORK(&spec->pop_mitigation_work, pop_mitigation_worker);
>  	snd_hda_gen_spec_init(&spec->gen);
>  	codec->spec = spec;
>  
> @@ -1187,6 +1258,8 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	case 0x14f11f87:
>  		spec->is_cx11880_sn6140 = true;
>  		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
> +		/* Enable pop noise mitigation for both codecs */
> +		snd_hda_jack_detect_enable_callback(codec, 0x16, cx_auto_pop_mitigation);
>  		break;
>  	}
>  
> -- 
> 2.25.1
> 

