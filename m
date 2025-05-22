Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B7DC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=; b=rgrv9wItd/q/BUdI+LMdmkqSn4
	PruuCB8Ui4MhTcVH9+2N+lEpLndzrajoMXGPgv6T6NgQYb+1azszdP0oyB1vFcEMpWCr1134T83N8
	9vTKQFCVT6Yj54ohjGHj2jJjoNpcqLMptLUOVIu8D3puCTTa0XDFCTSk4o1TIxpI9tSR2M7O9Uw59
	TFm9pF4yR+FNGWGuT883r+W6SzIPrjYuvV+hbaN2iVB8wghcoTxByQByuLPilxjpqOkWWq75IfL2o
	X3OAQaNTJLxqOh5j6Gzy+8ymrD68d2mxrIiULf8yez1OsD684pXT5O5ZUp153K4Glyc8Tv87p4Hpg
	YBW9cPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAuK-00000001td1-1XmN;
	Thu, 22 May 2025 18:44:44 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAn2-00000001sjU-0w8f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:37:13 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45E952191C;
	Thu, 22 May 2025 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747939029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=qvvrFRs/0quPeZtxTgbqWT5X3YMzWs/AK6Gq7XU201+B51o5Xs+KH+Rc171Tp2zjkQbduc
	8CfF5ubD/MThzrVRNcihWmikGSVNp1Ito+hWCpjm44ZC0c4DeJ3clEi9c3M07GwJK17nSI
	XyVrWRXMI10p3t6DiXeOd5y2dQw5NNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747939029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=iDQxvoUbsgjcc9bkZLut5qNfE2GCgHFifO4BFZTrHxjbSjUqkZmazn0P7UFScBpZ9UkFNz
	SzXLyICaYApvJhAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="qvvrFRs/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iDQxvoUb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747939029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=qvvrFRs/0quPeZtxTgbqWT5X3YMzWs/AK6Gq7XU201+B51o5Xs+KH+Rc171Tp2zjkQbduc
	8CfF5ubD/MThzrVRNcihWmikGSVNp1Ito+hWCpjm44ZC0c4DeJ3clEi9c3M07GwJK17nSI
	XyVrWRXMI10p3t6DiXeOd5y2dQw5NNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747939029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=iDQxvoUbsgjcc9bkZLut5qNfE2GCgHFifO4BFZTrHxjbSjUqkZmazn0P7UFScBpZ9UkFNz
	SzXLyICaYApvJhAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17823137B8;
	Thu, 22 May 2025 18:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hDrvBNVuL2iVXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 18:37:09 +0000
Date: Thu, 22 May 2025 20:37:08 +0200
Message-ID: <87y0uo7aqz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Nicolas
 Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Takashi Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: atmel: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250522180111.12144-2-thorsten.blum@linux.dev>
References: <20250522180111.12144-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: /
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 45E952191C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_113712_413856_C657CE5F 
X-CRM114-Status: GOOD (  10.12  )
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

On Thu, 22 May 2025 20:01:09 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead. Use strscpy() to copy the
> long name because there's no string to format with sprintf().
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi

