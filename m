Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC9C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=; b=pKxl5WTGfZ2zS9g3D/83nS5h++
	7Z67OrT2+czfSse/9kLzF5O0gk4w17Tm7DfFL1WD+H/g5ppCh3P78n+VkzaQwGs4dmW8QDcZPoK1v
	wEb+h6NKjObMq9P4XA8zWCo3Oxks/Uhpjea/SBmLv+UsMPQMAmzORENh+dUBVeigvlt1oqXmHriwg
	2Lv6l023v9lPC5oBKmryUqks1EFbmtHRP3+CVhnz51+t7blxZTaTVxdSEr/Wvwl0R2JrvxyNYotmt
	P/at3BM7u2Fq9GFQXLjU4V7f5knzAq2yo8Ei8KYuTMioHD9oLq3ZPBTNEEwNANYR7gx9LLRaQQOt1
	4p4lEENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNY-00000007a06-3MV5;
	Thu, 24 Jul 2025 13:53:00 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetbZ-00000007GiV-3SLk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:55:19 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2CFD3218A4;
	Thu, 24 Jul 2025 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753354516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
	b=Irk0T0BTMDiOehJsNZYsUqvPQkE28G5mYq67WDVRnADUO2SlqQ1iAG/HRoKdAOlqPoMNxF
	bVUVrnn3wpT9a9krtG+QyYPNdnpKJEdcbZcP1U/FWzIPMmllwwQCACRJuOSerI3o9k1YLJ
	zP2GDIptAZMRVHJJRnEu4GzJ1moxcKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753354516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
	b=W1G/olrrwVV6urQwmohdFY8FPuoSfHOl2QKmAYECVdXg3gT2o1zBK9/iUSazDKncDkffH3
	DAy91lm0+5z1rdAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753354516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
	b=Irk0T0BTMDiOehJsNZYsUqvPQkE28G5mYq67WDVRnADUO2SlqQ1iAG/HRoKdAOlqPoMNxF
	bVUVrnn3wpT9a9krtG+QyYPNdnpKJEdcbZcP1U/FWzIPMmllwwQCACRJuOSerI3o9k1YLJ
	zP2GDIptAZMRVHJJRnEu4GzJ1moxcKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753354516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWsshxpqlq8ILqW4GaEqib4rNKrGm9gH3qXjyZvaU1A=;
	b=W1G/olrrwVV6urQwmohdFY8FPuoSfHOl2QKmAYECVdXg3gT2o1zBK9/iUSazDKncDkffH3
	DAy91lm0+5z1rdAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AF8F136DC;
	Thu, 24 Jul 2025 10:55:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I3ATERMRgmjDbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 10:55:15 +0000
Date: Thu, 24 Jul 2025 12:55:14 +0200
Message-ID: <874iv1luy5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Takashi Iwai <tiwai@suse.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Laurent.pinchart@ideasonboard.com,
	andrzej.hajda@intel.com,
	festevam@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	rfoss@kernel.org,
	airlied@gmail.com,
	tiwai@suse.com,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	luca.ceresoli@bootlin.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	tzimmermann@suse.de,
	jonas@kwiboo.se,
	victor.liu@nxp.com,
	s.hauer@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-arm-kernel@lists.infradead.org,
	neil.armstrong@linaro.org,
	lumag@kernel.org,
	dianders@chromium.org,
	kernel@pengutronix.de,
	cristian.ciocaltea@collabora.com,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	l.stach@pengutronix.de
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958 subframe
In-Reply-To: <CAA+D8AN2B_RZ9iZ3qE5zMBfs7BMAkruSRQupoXyrsr7Tt+Gfkg@mail.gmail.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
	<20250724072248.1517569-3-shengjiu.wang@nxp.com>
	<87jz3ykpju.wl-tiwai@suse.de>
	<20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
	<CAA+D8AN2B_RZ9iZ3qE5zMBfs7BMAkruSRQupoXyrsr7Tt+Gfkg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	R_RATELIMIT(0.00)[to_ip_from(RL8m7tqgwaqu97o1bbfnn6ewdz)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,suse.de,nxp.com,lists.linux.dev,lists.freedesktop.org,vger.kernel.org,ideasonboard.com,intel.com,gmail.com,ffwll.ch,kernel.org,suse.com,bootlin.com,kwiboo.se,linux.intel.com,perex.cz,lists.infradead.org,linaro.org,chromium.org,collabora.com];
	TAGGED_RCPT(0.00)[dt];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_035518_011352_B323FAEC 
X-CRM114-Status: GOOD (  27.40  )
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

On Thu, 24 Jul 2025 12:14:10 +0200,
Shengjiu Wang wrote:
> 
> On Thu, Jul 24, 2025 at 3:40 PM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> >
> > On 24.07.2025 09:37:09, Takashi Iwai wrote:
> > > On Thu, 24 Jul 2025 09:22:44 +0200,
> > > Shengjiu Wang wrote:
> > > >
> > > > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> > > > in HDMI and DisplayPort to describe the audio stream, but hardware device
> > > > may need to reorder the IEC958 bits for internal transmission, so need
> > > > these standard bits definitions for IEC958 subframe format.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  include/sound/asoundef.h | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > > > index 09b2c3dffb30..7efd61568636 100644
> > > > --- a/include/sound/asoundef.h
> > > > +++ b/include/sound/asoundef.h
> > > > @@ -12,6 +12,15 @@
> > > >   *        Digital audio interface                                      *
> > > >   *                                                                          *
> > > >   ****************************************************************************/
> > > > +/* IEC958 subframe format */
> > > > +#define IEC958_SUBFRAME_PREAMBLE_MASK      (0xf)
> > > > +#define IEC958_SUBFRAME_AUXILIARY_MASK     (0xf<<4)
> > > > +#define IEC958_SUBFRAME_SAMPLE_24_MASK     (0xffffff<<4)
> > > > +#define IEC958_SUBFRAME_SAMPLE_20_MASK     (0xfffff<<8)
> > > > +#define IEC958_SUBFRAME_VALIDITY   (0x1<<28)
> > > > +#define IEC958_SUBFRAME_USER_DATA  (0x1<<29)
> > > > +#define IEC958_SUBFRAME_CHANNEL_STATUS     (0x1<<30)
> > > > +#define IEC958_SUBFRAME_PARITY             (0x1<<31)
> > >
> > > I'd use "U" suffix as it can reach to the MSB.
> > > Also, you can put spaces around the operators to align with the
> > > standard format, too.  I guess you followed to the other code there,
> > > but following to the standard coding style would be better.
> > >
> > > With those addressed, feel free to take my ack for this patch:
> >
> > Or make use of the BIT() and GEN_MASK() helpers.
> 
> Is it acceptable to include the headers in this file?

It's no UAPI, so should be fine (although I'm no big fan of
GEN_MASK()).

Other definitions can be converted with the macros, but it should be a
different patch.


thanks,

Takashi

