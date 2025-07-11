Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B9DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9QOyGddPPJaljr4xCRagD2vcJ3JwZH0mhLiORQ5XOc=; b=vUD0+zHQpk3mzUDmLE5dVClSQp
	/H3okEDzX8Z4HJfTZdVO4IAO+XL0WLVDyGgM1X4K0J5izhO5lDEJub5foyNDe68IGpvT9lur/3Npc
	gQEih6VyNCZUgXilJPkrv0F0ZbWArSjPfzlXgBlCPjPbaUmm1+ywGJloSDqdnizSBv+kWO+c2SJDJ
	/BM7WoTMfu5SsR+J8mC7cnoS5fVP+DsFkemgLmJNN1Xid7HeaeVF7Og1LGeLt3HiBE2JhRVJqHvAH
	EOCmmtrF4C41/FKHVV90oWgbuJw26G28Ot6VrjodNwDPxWZJKUf87byqPf/PAjIu6t5CjwH3SL84v
	tMcyvxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDEl-0000000EnCV-0ikh;
	Fri, 11 Jul 2025 12:52:23 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaD85-0000000EmLu-0hpS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:45:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8EFE31F453;
	Fri, 11 Jul 2025 12:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752237927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n9QOyGddPPJaljr4xCRagD2vcJ3JwZH0mhLiORQ5XOc=;
	b=jssuio6tNgnHVwlkEa6FIRhudj+VYwsOB2xhNIUngKVRemgyuasRAezhLMVKKgg4KEicEl
	e7EufgO1rDD/VmEbl3kViWVX1iaj1DTccNOx0jtTG4yuMW0lHjbXGTyNPr7FJirbHF4wSZ
	FXKmVWY2ge4Dk+Ehqmmo5RefxHyvV5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752237927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n9QOyGddPPJaljr4xCRagD2vcJ3JwZH0mhLiORQ5XOc=;
	b=5hO5/8BTOzWzxv/ng54VblrIVwaJktTYgbmLt0I+OgfxMKn3/JSDq8JpV+cvXDyDItnui+
	eAYDrxls6v70B8DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jssuio6t;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="5hO5/8BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752237927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n9QOyGddPPJaljr4xCRagD2vcJ3JwZH0mhLiORQ5XOc=;
	b=jssuio6tNgnHVwlkEa6FIRhudj+VYwsOB2xhNIUngKVRemgyuasRAezhLMVKKgg4KEicEl
	e7EufgO1rDD/VmEbl3kViWVX1iaj1DTccNOx0jtTG4yuMW0lHjbXGTyNPr7FJirbHF4wSZ
	FXKmVWY2ge4Dk+Ehqmmo5RefxHyvV5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752237927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n9QOyGddPPJaljr4xCRagD2vcJ3JwZH0mhLiORQ5XOc=;
	b=5hO5/8BTOzWzxv/ng54VblrIVwaJktTYgbmLt0I+OgfxMKn3/JSDq8JpV+cvXDyDItnui+
	eAYDrxls6v70B8DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5979138A5;
	Fri, 11 Jul 2025 12:45:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Bsr+LmYHcWj0MQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Jul 2025 12:45:26 +0000
Date: Fri, 11 Jul 2025 14:45:26 +0200
Message-ID: <871pqmhp5l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	kernel-team@android.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	David Li <dvdli@google.com>,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v2 2/4] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
In-Reply-To: <20250711093636.28204-3-verhaegen@google.com>
References: <20250711093636.28204-1-verhaegen@google.com>
	<20250711093636.28204-3-verhaegen@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[31];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,opensource.cirrus.com,cirrus.com,intel.com,linux.intel.com,linux.dev,nxp.com,linux.alibaba.com,socionext.com,android.com,vger.kernel.org,alsa-project.org,lists.infradead.org,google.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLzj6aswpe58r68z1acwzd13oz)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 8EFE31F453
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_054529_500466_76DBD32D 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, 11 Jul 2025 11:36:28 +0200,
Joris Verhaegen wrote:
> @@ -1355,7 +1389,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
>  
>  	switch (_IOC_NR(cmd)) {
>  	case _IOC_NR(SNDRV_COMPRESS_TSTAMP):
> -		return snd_compr_tstamp(stream, arg);
> +		return snd_compr_tstamp32(stream, arg);
> +	case _IOC_NR(SNDRV_COMPRESS_TSTAMP64):
> +		return snd_compr_tstamp64(stream, arg);
>  	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
>  		return snd_compr_ioctl_avail(stream, arg);
>  	case _IOC_NR(SNDRV_COMPRESS_PAUSE):

This function was recently updated to evaluate the ioctl cmd value as
is, as found in commit 19c4096ccdd809c6213e2e62b0d4f57c880138cd
    ALSA: compress_offload: tighten ioctl command number checks
in sound git tree (likely included in 6.16-rc7).

Please adjust your patch accordingly.


thanks,

Takashi

