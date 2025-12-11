Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD39D3E786
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=; b=kNXylkFc3eQ4lHvgr8xjSzXZOF
	Bun9im0lvTRhruxHS0Ob8tuMOp8GdSXgJTJ6IJBAW3WmOaYfcWWqYJ+uAUNPWgiIn/5g54LcKGLcm
	7Mqff8v8vCHVaj5saIaEM1POMDqf3E2ri3FCorKQGzxfLtOpCz4cK+Y+Jsa7hFIfyid5KPtbovf8H
	mcfg/bmlrLDpKsng31ApDmN9d+klUO2ZVPzDqQRBilBx9sq4U+P91COUOPqF3XXMVViHt789mqR9f
	pLp7LVugAH6rwMJzMIg8BqS6qTEiF+M9k+lRpLVrKoJIdeE6ZgkTiJ08Yr3dmDWtBhxpcklphL7Cs
	MTYHcjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcIj-0000000GOO5-2J4s;
	Thu, 11 Dec 2025 08:45:29 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcIg-0000000GONg-11eE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:45:27 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E1FC85BECA;
	Thu, 11 Dec 2025 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765442723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=GlYruRJPCONRQGjgDAC28DzJwQYozXNcpOGthFLfiGwUO9m3AOtr9QvofxkbTYowTGt7Vn
	WQCCMEZcadeQXvgiD2rQTKfwhvliZNGFw0eGraE/qIDr195QdmBRdg9ikMs1QGuPfMifHp
	6K4RZg11W4ecB/KD/ArVIdnMq77zGbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=Sa4LRwWs0MnGkk4tA8o9qpVkNydgBQOjByEg1opnPBbhBL//WnJXG9tJTsE6GxtnTnXCAK
	e+gy+1LLUaJj2LCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="A0/93nHL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R603Zwi8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765442721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=A0/93nHLm7wQ0nLM6co4gTQUH+JHBcSXkKDN32qaRhnY+JoPuTPNT5wCH6kjRviNioPJWs
	7deGbOhzaoWibFtKL/gyzCdW1RG4u0j/VViHhKZnw/T8zIDYTDsZyODS/502DTPJ/A7aPw
	uBUz/Ic/oqSTd4CPCZNMDg5sXmcToIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z4wy4QB9BjJPKd5vBr2cgx8MSASwZ1Wr5arHs4K7bLg=;
	b=R603Zwi8Elh6GOX4xWc0goDMhV/eK0ywXlHZmYL0RKP4KVVXykv+J2x9of97omotV35JIi
	X9Qe25WPzEUc1kDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A113F3EA65;
	Thu, 11 Dec 2025 08:45:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3r9GG6GEOmnaUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Dec 2025 08:45:21 +0000
Date: Thu, 11 Dec 2025 09:45:21 +0100
Message-ID: <874ipxcspq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ALSA: hda: cix-ipbloq: Use modern PM ops
In-Reply-To: <20251211-hda-cix-ipbloq-modern-pm-ops-v1-1-c7a5580af021@kernel.org>
References: <20251211-hda-cix-ipbloq-modern-pm-ops-v1-1-c7a5580af021@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E1FC85BECA
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004526_455339_D43A2358 
X-CRM114-Status: GOOD (  14.32  )
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

On Thu, 11 Dec 2025 02:50:03 +0100,
Nathan Chancellor wrote:
> 
> When building without CONFIG_PM_SLEEP, there are several warnings (or
> errors with CONFIG_WERROR=y / W=e) from the cix-ipbloq driver:
> 
>   sound/hda/controllers/cix-ipbloq.c:378:12: error: 'cix_ipbloq_hda_runtime_resume' defined but not used [-Werror=unused-function]
>     378 | static int cix_ipbloq_hda_runtime_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/hda/controllers/cix-ipbloq.c:362:12: error: 'cix_ipbloq_hda_runtime_suspend' defined but not used [-Werror=unused-function]
>     362 | static int cix_ipbloq_hda_runtime_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/hda/controllers/cix-ipbloq.c:349:12: error: 'cix_ipbloq_hda_resume' defined but not used [-Werror=unused-function]
>     349 | static int cix_ipbloq_hda_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~
>   sound/hda/controllers/cix-ipbloq.c:336:12: error: 'cix_ipbloq_hda_suspend' defined but not used [-Werror=unused-function]
>     336 | static int cix_ipbloq_hda_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~
> 
> When CONFIG_PM and CONFIG_PM_SLEEP are unset, SET_SYSTEM_SLEEP_PM_OPS()
> and SET_RUNTIME_PM_OPS() evaluate to nothing, so these functions appear
> unused to the compiler in this configuration.
> 
> Use the modern SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS macros to resolve
> these warnings, which is what they are intended to do. Additionally,
> wrap &cix_ipbloq_hda_pm in pm_ptr() to ensure the compiler can drop the
> entire structure when CONFIG_PM is unset.
> 
> Fixes: d91e9bd10125 ("ALSA: hda: add CIX IPBLOQ HDA controller support")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied now.  Thanks.


Takashi

