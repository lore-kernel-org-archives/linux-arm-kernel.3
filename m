Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F64D3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=; b=ttvXcA2vdD5e2G8BtQkEqttnfY
	Vag1GfD4ml/TTVeAImjzb3OSCvpYIvBsVLqbkxrG6ypDli7acyVEsT/AcbBTQlaIMTrNxUrFPtsbX
	xnkpMjrOwFv5b3wOBIUNi0O8grOyU0LRwyMX4cnFujHk1KG0Ub7OouKUhu+eDYCSDkIovBBNptlUY
	jyV/fFioNlCV7NcaQeyGdFYhrNEbw/9iwjugeKj8FfY7BB92KV5wbZSWP1hNBit8wgcoZHcPJmven
	w0sG80V9vfSBhAjiiTWRleBkkWilKG31B9rjNyxKBS0/6bD1GvHWe1wRxEoacgMYq+ZtegnFDuv9Z
	byv+2YIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXCg-0000000Cqbg-1nW3;
	Mon, 08 Dec 2025 09:06:46 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXCd-0000000CqbE-13QE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 09:06:44 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 940565BE9F;
	Mon,  8 Dec 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765184801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=1q4XB/NlqyshiONdOX9hfb1mOHt6kWVTz4jdVlvVyJ2oABv8to3wYe9bYGSIGYIRL9TeiZ
	9YiEhvwgZB940ExRk/hTDCsV2vDWTrjCOk08DFRWhn6pUwwjOxqwUsWMAf3/4+Pw115ABI
	/EWTyIlfYpBV/fIgSykysE0SuSEJ4JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765184801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=ytvdW7jNBDJe2kkQ+8Lmguq/A4kIvPR8KWYSF1lhd+l2d6gVRPeU7QAZ5KY8OfSidrlidt
	xBx/U5MRxM0t+ABQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765184801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=1q4XB/NlqyshiONdOX9hfb1mOHt6kWVTz4jdVlvVyJ2oABv8to3wYe9bYGSIGYIRL9TeiZ
	9YiEhvwgZB940ExRk/hTDCsV2vDWTrjCOk08DFRWhn6pUwwjOxqwUsWMAf3/4+Pw115ABI
	/EWTyIlfYpBV/fIgSykysE0SuSEJ4JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765184801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=ytvdW7jNBDJe2kkQ+8Lmguq/A4kIvPR8KWYSF1lhd+l2d6gVRPeU7QAZ5KY8OfSidrlidt
	xBx/U5MRxM0t+ABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03DCB3EA63;
	Mon,  8 Dec 2025 09:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DDBVOCCVNmmuBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Dec 2025 09:06:40 +0000
Date: Mon, 08 Dec 2025 10:06:40 +0100
Message-ID: <87fr9luyu7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann
 <arnd@arndb.de>,
	andrew.jones@linux.dev,
	linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org,
	asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org,
	x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,arndb.de,linux.dev,lists.ozlabs.org,linux.intel.com,lists.linux.dev,lists.freedesktop.org,sys-base.io,crapouillou.net,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,pengutronix.de];
	R_RATELIMIT(0.00)[to_ip_from(RLdkcz77k7ty1a1n58a6bzpetp)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_010643_478639_6D4CF086 
X-CRM114-Status: GOOD (  11.08  )
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

On Mon, 08 Dec 2025 03:04:09 +0100,
Randy Dunlap wrote:
> 
> SND_SOC_AC97_BUS_NEW ---
> sound/soc/pxa/Kconfig:21:	select SND_SOC_AC97_BUS_NEW

This must be a bogus entry added in commit 1c8bc7b3de5e ("ASoC: pxa:
switch to new ac97 bus support"), which can be dropped.

> SND_SOC_CS35L56_CAL_SYSFS_COMMON ---
> sound/soc/codecs/Kconfig:920:	select SND_SOC_CS35L56_CAL_SYSFS_COMMON

The buggy commit was 32172cf3cb54 ("ASoC: cs35l56: Allow restoring
factory calibration through ALSA control").
This looks like a fallout at changing from sysfs to debugfs, so this
should be SND_SOC_CS35L56_CAL_DEBUGFS_COMMON instead.


thanks,

Takashi

