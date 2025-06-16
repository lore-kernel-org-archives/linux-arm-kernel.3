Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B6C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=; b=q9dQ4rZkIKu2ilCiiuc/HrH4BF
	LHvMKf6Smgc9PGgWvo0Yyh57Ik5fqIfpiHVQuq9TrhCaTMKzUF5pZgSv8OPA+IztuODtfVdrs+Ui8
	amOZtSVzJcHazu1gp50kbtpMQZDZxlyrcyYDQq0Qiq84tF0OZ7eW9aGSCBAuElFqbB4cWi1Q+KWFh
	le+swj1qwhUTenIKOEJCAKZmj5RyuDUKwrfU7YrM3REturOvPthYmuoFDY77mHqTEzgfS96/DG6ub
	gXUQfWaZKpZS803j9BbZB8jja9ZS/Ww7bgS6uLXko/VmfqITQz7hOgTm6tQDpkzywf6PoNIDb5eXK
	uY+A7I3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4yy-00000003lDz-457X;
	Mon, 16 Jun 2025 08:14:20 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4ep-00000003i0O-2SFf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:53:32 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0A6E211FE;
	Mon, 16 Jun 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750060408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=jA8Tl/bcm1QKccJM+Lx2zE+F5jR85TlQ7FlI5b6T4IhRFkWvzUAoAwMupyjFDtYatgK8Oj
	pSpp4V10oPOstwTxwjNwXYhunLVkn7ekDvT+vTY/CyDashEJUomAyGD2xY3jebA+KqM6Hg
	xspwxd6gLYkK6VrIo61aIJuIio+Qxl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750060408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=L/xo79ZsURSH2a98r12zuA0hZPl/AeTJLT0eHDdrkAUHOP/wOvVojpKQ9GuHz5tHIxgb/f
	cq/qpmhyLeJr3ACg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750060408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=jA8Tl/bcm1QKccJM+Lx2zE+F5jR85TlQ7FlI5b6T4IhRFkWvzUAoAwMupyjFDtYatgK8Oj
	pSpp4V10oPOstwTxwjNwXYhunLVkn7ekDvT+vTY/CyDashEJUomAyGD2xY3jebA+KqM6Hg
	xspwxd6gLYkK6VrIo61aIJuIio+Qxl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750060408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=L/xo79ZsURSH2a98r12zuA0hZPl/AeTJLT0eHDdrkAUHOP/wOvVojpKQ9GuHz5tHIxgb/f
	cq/qpmhyLeJr3ACg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78F8E13A6B;
	Mon, 16 Jun 2025 07:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7fARHHjNT2ieLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 07:53:28 +0000
Date: Mon, 16 Jun 2025 09:53:28 +0200
Message-ID: <87frg0p1fr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdicheng <wangdich9700@163.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
In-Reply-To: <20250616074520.582138-1-wangdich9700@163.com>
References: <20250616074520.582138-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_005331_790949_A17A33EA 
X-CRM114-Status: GOOD (  18.69  )
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

On Mon, 16 Jun 2025 09:45:20 +0200,
wangdicheng wrote:
> 
> Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Try to fix up via either rename_tbl[] or rename_pci_tbl[] instead.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index d3c9ed963588..e18b2a2acba8 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6712,6 +6712,13 @@ static void alc_fixup_disable_mic_vref(struct hda_codec *codec,
>  		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
>  }
>  
> +static void alc_fixup_ft_alc257_rename(struct hda_codec *codec,
> +                                 const struct hda_fixup *fix, int action)
> +{
> +       int err;
> +       if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +               err = alc_codec_rename(codec, "ALC3328");
> +}
>  
>  static void alc294_gx502_toggle_output(struct hda_codec *codec,
>  					struct hda_jack_callback *cb)
> @@ -7799,6 +7806,7 @@ enum {
>  	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
>  	ALC233_FIXUP_MEDION_MTL_SPK,
>  	ALC294_FIXUP_BASS_SPEAKER_15,
> +	ALC257_FIXUP_FT_RENAME,
>  };
>  
>  /* A special fixup for Lenovo C940 and Yoga Duet 7;
> @@ -10143,6 +10151,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc294_fixup_bass_speaker_15,
>  	},
> +	[ALC257_FIXUP_FT_RENAME] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_ft_alc257_rename,
> +	},
>  };
>  
>  static const struct hda_quirk alc269_fixup_tbl[] = {
> @@ -10715,6 +10727,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
>  	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
>  	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
> +	SND_PCI_QUIRK(0x10ec, 0x12f0, "BXC NF271B FT board", ALC257_FIXUP_FT_RENAME),
>  	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x10ec, 0x119e, "Positivo SU C1400", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x10ec, 0x11bc, "VAIO VJFE-IL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> -- 
> 2.25.1
> 

