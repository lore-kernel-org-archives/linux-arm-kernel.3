Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC9C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=; b=JK7NrR0hf2yoxQwaKBgaXTsSW5
	E8nDTyi2/LBMO/s35tQJHJR1DM+AYR3mdhUZi7572dR51IJM+BgFE2QdsZJA4rH9zrkw0pO+MkiH5
	Q6OSeyh9DFLlMRFKcAZLtD9t8OXNdFZYjwowadQQij0DkTRP9C4/0DkplufJmXcN3tf/pBop5ycL7
	U4bqE4gRgrSHHosjBD4+02C9hYuzeW56fRI7IebM7QakxK65tD+v0KMb/zvQr728UjBHjkvORH1o3
	XVxVC8TbYZg0nFeeSbzECR3PqLT9pr57ODx7ze8HkUhaKaWkGtKR60dZ58UFvjENrJS4q6AwN6NGj
	+LYsDi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWoI-0000000F0a3-0GzD;
	Fri, 20 Jun 2025 08:09:18 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWhx-0000000EzmV-0gmB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:02:46 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5E33211F4;
	Fri, 20 Jun 2025 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=xSQ3BENt0Ey4p9oXPf0aelaBSBPr8+LPQqrGMLhP1AVzamyhjuYVucUZTNzDJgqlce/K2G
	97Jcc2atr+yGHI3e/Auixrzkm2wrhLQ4/YwsblB1HbngO/qsRuB6SnX1Th4y7zAuQ9rDpF
	Uqg/s175w8fSbn/WQM2ZTxkEV3P9P4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=2aimzrqEVwTK2LNFM5vo/pNUEkftGIX5KjW+76JjYfvZB6SUOtNQtLjNlNDPe3EG606Kgl
	w2mH3V8TwvVuCHCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="J2vGJ/wp";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S9mNe68W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=J2vGJ/wpVUD8Ta/tzNw2e9U/MXAuddlSr+2kYlC5eOfOULs544qSJNE4PRyC7TbGQ37/p7
	ZRHDoDXnvIlZ0YAtML6MU3Gas2ufK/tD148/qLUrz9QbKTJecnUZXU6gNe5da9L5Wbvqr2
	cIPR0vTZdT6orXIqGbdIGz75xfcse1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=S9mNe68WrNAyNiu/zjtEUn2GQHJ+vl9DqdbvRSAnyJX2/+dBVZ+6SPCG7khxKgHvCVp8+4
	ngyw5qXXPaC1viCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 954D713736;
	Fri, 20 Jun 2025 08:02:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mUsII5cVVWgJWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 08:02:31 +0000
Date: Fri, 20 Jun 2025 10:02:31 +0200
Message-ID: <87tt4ax2lk.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
In-Reply-To: <20250619071745.149299-1-wangdich9700@163.com>
References: <20250619071745.149299-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ASN_FAIL(0.00)[7.9.0.0.4.6.0.0.0.5.1.0.0.1.0.0.4.0.1.0.1.8.2.b.0.4.e.d.7.0.a.2.asn6.rspamd.com:query timed out];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RSPAMD_URIBL_FAIL(0.00)[kylinos.cn:server fail];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: D5E33211F4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_010245_347454_53334DBF 
X-CRM114-Status: UNSURE (   7.90  )
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

On Thu, 19 Jun 2025 09:17:45 +0200,
wangdicheng wrote:
> 
> Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied now.  Thanks.


Takashi

