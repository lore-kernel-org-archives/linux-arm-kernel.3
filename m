Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044A8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqy2e7Vl2dCVoFI9LrkJ5a+szigX+DcaNhhV2Ef5eI8=; b=lZl60ICihzEfi+lhykuIZBbN2g
	5A3BYP6nf3SD/+Tinik5Ua8xdfMYoHax9CMwcrKdpZZkjFUodI5VDl+hZ2NiSxVVCdqCgSwIwBNry
	H4YRl3fQ2z+8kUaenhr81ANyuVIpUSW0CdbsAu2RcRtBHOdRcTDelOCsvub2YZFHYUM0MHZj/fRcy
	TW4opcb6a+b/n/TYsT6jSQKEe7SmlTyZ+P9k8Rr3BKaPH+MSOSFKDWzfpxT/JyZaPq9XBYyCmDkdW
	SL7fT1QZFCebb6RKuK7mURDJC2m1u621AGaH7MZAtpW0+ZxM/VURBbEZT/Bli3hZf1F9jdQFvybAU
	+9kDRSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwtZ-0000000FI9F-1uQi;
	Thu, 06 Nov 2025 10:07:09 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwtX-0000000FI8V-0eqi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:07:08 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15B9E21192;
	Thu,  6 Nov 2025 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762423621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqy2e7Vl2dCVoFI9LrkJ5a+szigX+DcaNhhV2Ef5eI8=;
	b=jJ3/bdbQZ6LuKTSl4CUJxWNMsl7/qQigS3kpLoz72YInxvsCaTRINe+tREd1DsZygv1ZMK
	R/+6isQ5mL5OkfzaZFzZ8q/Fv5JYPbipf22i/VG87MZxTs/aJAfiyMN88NIVflI1IYywSL
	ANjnilh8a5vDkWO4eYE5/rmgU1tnFok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762423621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqy2e7Vl2dCVoFI9LrkJ5a+szigX+DcaNhhV2Ef5eI8=;
	b=vdhprjmrCNcPL7NRnhX59NxsXa8fEyX5fuIGmwIYwIFpnyeQTJsB6FJtxEfeKqQGCUPoE2
	HhVjwsyVARSFnvCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="jJ3/bdbQ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vdhprjmr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762423621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqy2e7Vl2dCVoFI9LrkJ5a+szigX+DcaNhhV2Ef5eI8=;
	b=jJ3/bdbQZ6LuKTSl4CUJxWNMsl7/qQigS3kpLoz72YInxvsCaTRINe+tREd1DsZygv1ZMK
	R/+6isQ5mL5OkfzaZFzZ8q/Fv5JYPbipf22i/VG87MZxTs/aJAfiyMN88NIVflI1IYywSL
	ANjnilh8a5vDkWO4eYE5/rmgU1tnFok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762423621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqy2e7Vl2dCVoFI9LrkJ5a+szigX+DcaNhhV2Ef5eI8=;
	b=vdhprjmrCNcPL7NRnhX59NxsXa8fEyX5fuIGmwIYwIFpnyeQTJsB6FJtxEfeKqQGCUPoE2
	HhVjwsyVARSFnvCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDB6F13A31;
	Thu,  6 Nov 2025 10:07:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0csMMURzDGmzPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Nov 2025 10:07:00 +0000
Date: Thu, 06 Nov 2025 11:07:00 +0100
Message-ID: <87346rh3uj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: au88x0: Fix array bounds warning in EQ drivers
In-Reply-To: <20251106063339.114596-1-wangdich9700@163.com>
References: <20251106063339.114596-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 15B9E21192
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email,suse.de:dkim,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020707_344348_97C96357 
X-CRM114-Status: GOOD (  12.43  )
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

On Thu, 06 Nov 2025 07:33:39 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdich9700@163.com>
> 
> In file included from ../sound/pci/au88x0/au8830.c:15:
> In function ¡vortex_Eqlzr_SetAllBandsFromActiveCoeffSet¢,
> ../sound/pci/au88x0/au88x0_eq.c:571:9: error: ¡vortex_EqHw_SetRightGainsTarget¢ reading 2 bytes from a region of size 0 [-Werror=stringop-overread]
> 	vortex_EqHw_SetRightGainsTarget(vortex, &(eq->this130[eq->this10]));
> 
> Modified the array access in vortex_Eqlzr_SetAllBandsFromActiveCoeffSet() to use pointer arithmetic instead of array indexing.
> This resolves a compiler warning that incorrectly flagged a buffer overread when accessing the EQ gain array.
> The this130 array has fixed size 20 and the index is safely within bounds, making the original code correct but confusing to static analysis.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Again, please fix From and Signed-off-by addresses.


thanks,

Takashi

