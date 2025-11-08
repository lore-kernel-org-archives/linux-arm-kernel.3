Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA16BCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGdoZognkXIiV0HydNaGqmGNn2PJy1yzawAViXgjG8s=; b=XN3DvOSher6MpjtvEb3paJf5wy
	jG7YWR3rXqJ5esasUm0YRL0hRTkQHF0/aOKkhdz+zp6gxXePka2eK8innJCn6utmMydQ1rA0rxbZG
	TZbPOTeB7Q1KZcw7DvsKx+dmgAuR2P/Pci28aazL2LOvWv990gd7P4k7ueZUMHFdHe2MFSMmX/VRH
	RvqiNWG9IRE15vSSqPcTht2iAETsltpHtyZ8jCBCpI2v7p9GG6PAyytaIPSqwsX+eku3zMU0p59US
	6V4GJ18ddVXDBk+diGxTFJJJh+bcs6z1Ex2y6rabWLAKO+m12BQxcnO64Vjj4z0+YIeZRClDuCcNq
	em+9icEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdn1-00000002gCg-17n6;
	Sat, 08 Nov 2025 07:55:15 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdmx-00000002gBe-3W6J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 07:55:13 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94BE7338D7;
	Sat,  8 Nov 2025 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762588508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGdoZognkXIiV0HydNaGqmGNn2PJy1yzawAViXgjG8s=;
	b=LoxxDRRC2MtBarFArNz8UE89GztHUPawhICNckaG76WTjng11YLpVI4nYT5ZKTCoy7eyoO
	/WclqEwyCPCwlHgtkctWIGEp5lcVRw0wGQdlBOjjS/1pGYaRY+XTptFOCHBYsEb7XF9q+2
	rNUVp6IQLhk9NFx7i1y7mV9mqZpD4XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762588508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGdoZognkXIiV0HydNaGqmGNn2PJy1yzawAViXgjG8s=;
	b=N8Hsa3ceVc8iGJV2lMysSJL50RkGC7lqfTzSVpXgb5el8bdrFUlZY1rnRi+PoKHxZfDiyz
	YJfFXsIuxGFOyhCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BaRo542r;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LAyvKMXw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762588507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGdoZognkXIiV0HydNaGqmGNn2PJy1yzawAViXgjG8s=;
	b=BaRo542rfa8do4d7KG9vDUgeeEuGlQk8EdtKTcF72iM8tlE70lmgAZJJIqxDzKmYHQHQJg
	/T4di/58wnrTDHCOLsPm//imM3UIHlKApW+S+BlgZWh7Jws0Vvch5D9H7MQcAEFjyDLS3B
	VNKAK96Zo0PNRjws52yReIwsXVFbffs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762588507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGdoZognkXIiV0HydNaGqmGNn2PJy1yzawAViXgjG8s=;
	b=LAyvKMXw2eQcrzeRzeFrcdVhem07cp3qqX2DgkK/MAD4u4PgTBJpxA6vjegH/obsMCZFYr
	IjJMBVpYUngu1dAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50F9113675;
	Sat,  8 Nov 2025 07:55:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DeBmElv3DmmEcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 08 Nov 2025 07:55:07 +0000
Date: Sat, 08 Nov 2025 08:55:06 +0100
Message-ID: <87a50xq7qd.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: hda/senary: Replace magic numbers with defined constants
In-Reply-To: <20251107024030.36712-1-wangdich9700@163.com>
References: <20251107024030.36712-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 94BE7338D7
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,kylinos.cn:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_235512_715168_E19888BE 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

On Fri, 07 Nov 2025 03:40:30 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Replace hardcoded GPIO node value with a defined constant for better
> code readability and maintainability.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> 
> v1->v2:
> -Align both From and Signed-off-by addresses

Applied to for-next branch now.  Thanks.


Takashi

