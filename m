Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5CECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8ITrRH+YcsupiGQECJHppJ59lDIxrFeb+scWJOGz24=; b=ZBOETrP1et2FwYfyVYXCQjJiiR
	LSg7XAgdJ+RKAUjuiamNehNU7tdgaxfrftwhBpkqNWk6Eq7A0IjTngRq3RA8hzJDrbpA5ETvYB3mt
	+k8dY9RfeIceZ4Qrj7rl9eiizDj60hQ8pWuAqJ2Eq2SmpnHeLyk9hQFWe2z6kVEkbulUe8V0+wX35
	Jus15pYHaN+BpG87i9wrtsahDZlrFKJAnGnHPVNqOE3nK79iEW+K9sVChUy9ZrQ3P8vVCqMa0Loh9
	ScyxIIMw+Af7yLPbJdk8BHVkwDn8L8G7WWkD/TN9ZP0mupwAWenQPIrfO4e+gL0U5br4hPslWUSni
	hj6paRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdnE-00000002gEe-2PXt;
	Sat, 08 Nov 2025 07:55:29 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdnB-00000002gDl-1kcc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 07:55:27 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A366733AB5;
	Sat,  8 Nov 2025 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762588523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8ITrRH+YcsupiGQECJHppJ59lDIxrFeb+scWJOGz24=;
	b=qiEpD0x7r+GhCxqLrUH2AP0FRiYFpDO6JcZAmDOrkrhHA9Ux2zJx6/jdW/hNpRuh4LNAVr
	kb299GmgDCQnD8pmsj/IBLCjDDtuOyKq1oRIYGd9Npd+lJ28KQAEza3GCIi7cWjjQno1kt
	ApNcbrAKsI5J2BUur4NBHBQ0PcTlGOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762588523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8ITrRH+YcsupiGQECJHppJ59lDIxrFeb+scWJOGz24=;
	b=GWsG4oQTQ9O1mxJjBVx+z/7GC73jTqeXrLYJ8/7v7g8c+6OLdkupQImgIc2UIqWb/f9mJJ
	j9/omqwqpyI5L0Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762588523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8ITrRH+YcsupiGQECJHppJ59lDIxrFeb+scWJOGz24=;
	b=qiEpD0x7r+GhCxqLrUH2AP0FRiYFpDO6JcZAmDOrkrhHA9Ux2zJx6/jdW/hNpRuh4LNAVr
	kb299GmgDCQnD8pmsj/IBLCjDDtuOyKq1oRIYGd9Npd+lJ28KQAEza3GCIi7cWjjQno1kt
	ApNcbrAKsI5J2BUur4NBHBQ0PcTlGOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762588523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8ITrRH+YcsupiGQECJHppJ59lDIxrFeb+scWJOGz24=;
	b=GWsG4oQTQ9O1mxJjBVx+z/7GC73jTqeXrLYJ8/7v7g8c+6OLdkupQImgIc2UIqWb/f9mJJ
	j9/omqwqpyI5L0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6369D13675;
	Sat,  8 Nov 2025 07:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2z8EF2v3DmmRcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 08 Nov 2025 07:55:23 +0000
Date: Sat, 08 Nov 2025 08:55:23 +0100
Message-ID: <878qghq7pw.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: au88x0: Fix array bounds warning in EQ drivers
In-Reply-To: <20251107024525.38454-1-wangdich9700@163.com>
References: <20251107024525.38454-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,intel.com,vger.kernel.org,lists.infradead.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_235526_015268_DE8C0F01 
X-CRM114-Status: GOOD (  12.40  )
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

On Fri, 07 Nov 2025 03:45:25 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
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
> ---
> 
> v1->v2:
> -Align both From and Signed-off-by addresses

Applied to for-next branch now.  Thanks.


Takashi

