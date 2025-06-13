Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E64CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=; b=par4BX7s6YVECa6bUTNaVTTsOf
	YNBA01ZkXREvBUx+YvQpBZmBe/qyELalTmoAF7CnKP4jwlsO2qOvu+5vRoI4OIkjY20TL9CSJSrem
	6iAtkl8P+pNQ3/1GvzINFicyb8Nvlwx36vUVc4SEq/n5dTuFOsipqnIXuIGi/6JLzL1iQxGWbemV2
	ArtWE89NJE7IZ8sDNcuMGYp/VjYot6AU9WYI4jrW2KZNsLqqVhJDZeR7F2jiGPlhP/LvSzEtVtobt
	gSdfaj1WSw0JqM3a+ycaYleupnBbyDgBfe/JlydEA816tCIWSb18lsMI1JUeUnMNlaicXzP18sEU3
	EpKTWzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzep-0000000Fk6b-1O9N;
	Fri, 13 Jun 2025 08:21:03 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzcU-0000000Fjtl-2lI9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 08:18:43 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F26D61F78E;
	Fri, 13 Jun 2025 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=f9OuD+eS0qWOJwIgBRSd7f9w8gkuAivygEdXHg/0M8q78UUz57aOeAcYubT+hRfnF3MkSR
	vTgfm7SZcLaBqw/llN99+vocOx86xcqKVe90gj8aoCKXkArzLk/6dLp2wn76fWgiTXb4B8
	QeoA/E47uQP/3GUVDbk8whZoz68PBwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=T9hp0W+2/Ojs0cLZig3umY/6kkhNj7l6kWeSQ9fTvru6O+e6UE0Ja/sLBg0wLOalHP9kdi
	sE8cV+33eUIbIvDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KDdbe7kG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4kgYUPC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=KDdbe7kGKMhPMOximCvmn4oEw+geeg71MDW52G40vn8TNZG7Vu2GDvpSZSaRIFWsVNqzJN
	0zDg2FAmGCciVI8jLux+Q+i05COZ4LS7QAOzml/LG1eKRLz5jetHPlhlZ1stlHyDN03aQf
	KbTZAOPpoUS7wDqNDiGakPiVU+RgFvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=4kgYUPC1BDb1jMXwztl2kzx+4j+lwwILOGUwflLIZgfnelgxQlBZnIyqKgXRL9X5dEcU9O
	ivpFSm6xSTCrkYDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B284913782;
	Fri, 13 Jun 2025 08:18:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QEg9KtreS2h6JwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 08:18:34 +0000
Date: Fri, 13 Jun 2025 10:18:34 +0200
Message-ID: <87o6usrr51.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card
In-Reply-To: <20250613063636.239683-1-wangdich9700@163.com>
References: <20250613063636.239683-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: F26D61F78E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_011838_843677_0FDDB9B1 
X-CRM114-Status: UNSURE (   9.22  )
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

On Fri, 13 Jun 2025 08:36:36 +0200,
wangdicheng wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> PCM1 not in Pulseaudio's control list;standardize control to "Speaker"and"Headphone"
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Thanks, applied now.


Takashi

