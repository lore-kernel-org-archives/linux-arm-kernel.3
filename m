Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3883BD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=; b=cu3rOyet2yi7GV9fXFepKOFxTF
	ucEPaLhddPP21PjMsiOB4whgKqDUx5Ej4Qcyfns1ZoNVi8hnLfxGwhl4pz0MAdOjSBylXdzFzcctG
	U0qvJmYt6mcFUNGXXYx1ROeU4qfJDWujabgc40kHB9+DKhyPH/LexHqhsZYUnbouWlLSVYRxjmRgj
	eb7b5/AAiOVFKrKRYsp+aBb3+YjCHNz/h+64tPlO3cW8wpCcejwUNeVF3H80Lk+lnqr2Y/cOQUjyf
	A8QPOuqOGyaemhDkyAQ7eGiWLQ0IbUFJEClntvYHGPiuhgELahXtfxRXqH/751ZYbatzWDt9wazUp
	wYjynIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSDkh-0000000Burw-3U20;
	Sun, 07 Dec 2025 12:20:35 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSDkf-0000000BukP-3wBL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 12:20:35 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16A455BCFD;
	Sun,  7 Dec 2025 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=ptJ+j6YPX4g+bVfgoE8ZGTjROuh8vTpSPNCv/qp0Q1ZljH1k6a8NBRAl9PuRb/OAq+XIDy
	Ms3IQNYL1UGQXarbvyUzIeXgSBkeivNsvAZU9knIC1uAehc4VZSgwD6WyKttisOejkucd4
	wsZ8RlWhvRqiXF3CkmGsZ4ILGDkvVZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=VkgzOLXvVzmsNyshw1DtVQoAoqZnxBQbXa/ajCsN5DdEWhfMRf3OddfIE276hMSQ5nWGvz
	qgzw3pUkeCxWoFDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0YuJJ3XF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="yM/pJrbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=0YuJJ3XFWR17M6QyJQov2+FyIAhSdoGYPfrmbxb1xuXppPswhnxE1s6EE+4EqIbTRZu8Bp
	8EX1Rjq6OSEDARqS9qICqkYEYcKjU0uA/07KnY5JMh6XQQnbIagxjjj5mgDtxZuknqyCQ7
	S6z6B7TTfVPYuJuL+MrjDPCS+IZkj04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=yM/pJrbcO/dEmDdgL7ZVTAFBtzM7UxjjJqeIgGuIINwlyBUV6fSD7Tb1eGcAL+4S1SR8dQ
	ln3+ze8SfTkZ/GCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67A4E3EA63;
	Sun,  7 Dec 2025 12:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gID+FnVwNWl9JAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 07 Dec 2025 12:17:57 +0000
Date: Sun, 07 Dec 2025 13:17:57 +0100
Message-ID: <87pl8qv62y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: david@ixit.cz,
	David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: Do not build obsolete API
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 16A455BCFD
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[armlinux.org.uk,mleia.com,timesys.com,iki.fi,gmail.com,atomide.com,nvidia.com,alpha.franken.de,linux.ibm.com,ellerman.id.au,kernel.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,perex.cz,suse.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[david.ixit.cz];
	R_RATELIMIT(0.00)[to_ip_from(RLin1spj7ezzoz4e1zj94tyerm)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_042034_177299_1F3132C1 
X-CRM114-Status: GOOD (  10.95  )
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

On Wed, 03 Dec 2025 23:34:10 +0100,
David Heidelberg via B4 Relay wrote:
> 
> From: David Heidelberg <david@ixit.cz>
> 
> ALSA 0.9.0-rc3 is from 2002, 23 years old.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Maybe I could drop also the code and Kconfig option?

Thanks, applied now.

I believe it's safer to have this default only off for 6.19, then
disable for 6.20, eventually drop the dead code later.


Takashi

