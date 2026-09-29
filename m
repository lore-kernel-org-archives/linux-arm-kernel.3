Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D65CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=; b=oT5YM5ypuO4mOIqVOS0ko+26yx
	ChMdwUONkkPtAa/uQIpgJGk+UZMfhJfe6vhelV1b962OjXutUzTkH8+mZKkMYx0S82HPLCGVqJk+W
	dmiiBScPt3eipVGRUMG1EsLzMHNBz47jqJjAPxUbMd+MWUehLEv+sRt+YZoM5Wrt8ZP9VsCRrYjoa
	/XRb9eYTl7XDl6DMwHXtR2U9pgyrsHTzakmcW2paYfeYh1Mr8GQsUD6kYFUzhFKWCp+re57MTBP6Z
	3425QFH2UyoDSqJLf9giNCyaMpgai/rrHCg6NqRgIbOaq7kPXWsP9XQSyivovWQ9l1EEQv4ppoH/u
	vTSOI9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUWV-000000031vT-0ZlP;
	Tue, 29 Sep 2026 09:53:19 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUWS-000000031um-1AgL;
	Tue, 29 Sep 2026 09:53:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 820551F444;
	Tue, 29 Sep 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790675588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=IR6OyRhy9njtgSWGu5dmBV5fq2a2iSY7zSpuCnAC4r1LDvrMzaF7HrsGWBC9yc7030Cmey
	YXmlWgv3VqyPwuNf6kxvymlGhY+o3GG7NYNBT62HDXFxRifA5OUEMpQOyaq/Fld9DIfyDk
	mCEsKPFAsFoM4TFKDJjgzKC0O/tdx+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790675588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=RI2iC9Uyd+Kid4F1uCZuCevrwCYLsVo5HsM3K2NX+dg/JmeWGYDnMpfctjG7FyGif9graT
	+6ofcNl6xgt105CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ef8ORTcE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jy6iYy8+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790675584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=ef8ORTcEBdUmzDfukXYj0Ra0pCYyGNwZY3AeOcAIG9jdfWU/pD8IBdQxlADdWGHW2yjS6A
	USif8lF+XS4DV8rGdUqE4YbVrGT9WjOalCZ06HO8AR4WHsw6bsgl4+Gl/jJMvmgwsZ/1Tx
	MYw0bRj5uKlZTEEFtZz8mpZtlsATiUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790675584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=Jy6iYy8+AVNnk0GnA+0G2zcraJ5WdNWWhd1npGOvbUlB+jAegV9NL2JeFC1K2wDFiPXusW
	ht7mubNR55etGoCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03EE2136E4;
	Tue, 29 Sep 2026 09:53:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P+SYMn+Ku2pSLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 09:53:04 +0000
Date: Tue, 29 Sep 2026 11:52:59 +0200
Message-ID: <878q4k2xl0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Rob Herring
 <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor Dooley
 <conor+dt@kernel.org>,	Sven Peter <sven@kernel.org>,	Janne Grunau
 <j@jannau.net>,	Neal Gompa <neal@gompa.dev>,	David Rhodes
 <david.rhodes@cirrus.com>,	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Ulf
 Hansson <ulfh@kernel.org>,	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Vinod Koul <vkoul@kernel.org>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Sen Wang <sen@ti.com>,	James Schulman
 <james.schulman@cirrus.com>,	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,	Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
In-Reply-To: <20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
	<20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 820551F444
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,marcan.st:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[cutebit.org,gmail.com,kernel.org,jannau.net,gompa.dev,cirrus.com,opensource.cirrus.com,perex.cz,suse.com,linaro.org,intel.com,metafoo.de,collabora.com,ti.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,suse.de,marcan.st];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[lin,dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_025316_678232_F630A089 
X-CRM114-Status: GOOD (  15.63  )
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

On Sun, 20 Sep 2026 06:53:47 +0200,
James Calligeros wrote:
> 
> From: Hector Martin <marcan@marcan.st>
> 
> This allows drivers to implement policy around locking/unlocking
> controls, such as enforcing that a group of controls may only be locked
> by the same process/file, and taking actions when the controls
> lock/unlock (such as granting special access on lock and resetting
> values on unlock).
> 
> This is, in particular, useful to implement volume safety controls, such
> that only a particular process (that locks controls and completes a
> handshake) may increase volumes above a given safe limit. It also allows
> the volume to be automatically lowered if that process dies (which will
> trigger an implicit unlock).
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

This doesn't sound like a good approach to me, and this looks rather
irrelevant with the purpose of the series.


thanks,

Takashi

