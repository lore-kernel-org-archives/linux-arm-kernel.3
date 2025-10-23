Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A38CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2/VJEywAU9LBRvL2S4Xz/ZfJnrbrX//+Tmg/U0F1u4=; b=INT147t6NnyWWQOw9w4FFdfJA6
	RzdD6EoV/7qDl91eCkfHbSM0EmePKkJMbUNE0QDnnxeA20U22vJLO1YCkDBP7L2/E3DBMUcuL0hLJ
	KBdDV6zTF9U2C85RuFO2MbjzQSxPuQNKS94stU5lx03QwX4bl32ojOeEawOHRktfAZi12UmT/MkM3
	q5GykiJiYnYhYH0ELSZC3kdHugmYO9hjT1qJE6uJcDLwi0d7qMpNZkFHnyhRL+0z84JYIhOowi/oT
	xdeUxBAzpqt312Zqs9flLT2IA92XNdiBN0pLBXAaQEaIZ2uetvKZv2w4Oja5RJzUkgMD0eFEL5CI8
	3gKa1bsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0K1-00000007GwB-3PtK;
	Thu, 23 Oct 2025 18:46:04 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Jy-00000007Guo-3n6Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:46:00 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0AE031F388;
	Thu, 23 Oct 2025 18:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761245151;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2/VJEywAU9LBRvL2S4Xz/ZfJnrbrX//+Tmg/U0F1u4=;
	b=T4My599uidGQ17KIMIpiuMCrLcTjHTKVVWRHiTgtcmvrOPQrtjmTAl9YutNQtffhA1Xcav
	+KI+7EoZ/sL1CK9flabFtCeEfRBZn5KIbQnW6JfvZni/1J+BKAC8WblU3VEhD74Iug9PDX
	nePqMTvAFj8qpDSKhinT27FOasQRMK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761245151;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2/VJEywAU9LBRvL2S4Xz/ZfJnrbrX//+Tmg/U0F1u4=;
	b=F1hzFQB4596YPQHJ2G6n0o3XQW3Kf18ov3cO52wyctYcOCnc63ciL9Q+MfEYtxTts1Sz/o
	F00nsq2y22+gCxCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761245147;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2/VJEywAU9LBRvL2S4Xz/ZfJnrbrX//+Tmg/U0F1u4=;
	b=VCr+Zb5aned6VdcQds7Gp8QJ+zU43pxj1DaJQB2N7WC/cn0Ihbv/ODd5Z/sG3MTZ6aEUFV
	LHd3C2/kpAXLDiefZzHaXXsRW1YFSEsGOtQwvgpiXo9uxnxeGJ84Xs7/8jlqJGGsWZp73Q
	+ADhja8ThNl3uLnMFDiAcO+4/rtZ1hc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761245147;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2/VJEywAU9LBRvL2S4Xz/ZfJnrbrX//+Tmg/U0F1u4=;
	b=+qCOOoUVBZ0e7pWyy+vZTDIbPlhXABGPbWy6Yvw0k1AcwAs1XDcEwq6qhFcgFonaxpsspa
	43KdR0xKJ8fhANCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D357A13285;
	Thu, 23 Oct 2025 18:45:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5xVvMtp3+mgdWAAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 23 Oct 2025 18:45:46 +0000
Date: Thu, 23 Oct 2025 20:45:37 +0200
From: David Sterba <dsterba@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 10/10] btrfs: switch to library APIs for checksums
Message-ID: <20251023184537.GB20913@suse.cz>
References: <20251018043106.375964-1-ebiggers@kernel.org>
 <20251018043106.375964-11-ebiggers@kernel.org>
 <20251022071141.GV13776@twin.jikos.cz>
 <20251022175934.GA1646@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022175934.GA1646@quark>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:replyto];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_114559_237012_DC28253C 
X-CRM114-Status: GOOD (  17.05  )
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
Reply-To: dsterba@suse.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 22, 2025 at 10:59:34AM -0700, Eric Biggers wrote:
> > Thanks, this simplifies quite a few things. I'd like to take it via the
> > btrfs tree as there may be the hash additions (XXH3, BLAKE3) but
> > currently I'm not sure if it won't make things more complicated. I
> > haven't started the kernel part yet so I can use this patchset for
> > development and rebase once it's merged. 
> 
> Great.  I'm planning to take patches 1-9 through libcrypto-next for
> 6.19.  You can then take patch 10 through the btrfs tree for 6.20.  Does
> that sound good?

Yes, the 6.20 schedule works better for me.

> We can work out the XXH3 and BLAKE3 support later.  If
> you'd like to add another checksum algorithm, I'd suggest picking just
> one.  btrfs already supports an awful lot of choices for the checksum.
> But we can discuss that later.

Yes, I'v deleted long answer to that, it would be better to discuss that
separately once the xxh3 and blake3 get posted.

