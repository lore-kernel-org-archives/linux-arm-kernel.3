Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C8CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=; b=jxchBGe0knLnW0EWTWvvr6avvD
	nqXfZ7VkMJYtZQxd9by0/vcg5zSROjprYdC8uPQZEPpyc9x1J4Hrwrm9QGiM7CR3fOsINO2aULln6
	jyAk3vgpPIbHcwq/DXR7bdrEqv64zTEPoLNuvzb2yXBBKgSuxJKdTgL0m6W08a+kOhLcq4QxWlQc0
	RI94EbnmAuuRujvjfAo7jzTMu964Q+DKUCG+0KD+s2V87cdJqUa/g3Ezo5CzOad8fgQ6k1HHvOW4y
	/z4oK/sCpSAGXmT+YJrx+hLJOLe4FD24nlWd4AXAVUfCDxA0reuj5ywDaUQd/BHaymhlV0oCOWvBL
	rDgeCDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtP9-0000000D5h0-3rJl;
	Sat, 03 Oct 2026 06:39:31 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtP6-0000000D5ga-3VQQ;
	Sat, 03 Oct 2026 06:39:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BD8B21B02;
	Sat,  3 Oct 2026 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791009562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=KAyDF+XOrg9b8Wr9+kJ3zqOXm697eHGDQ8fFCe2lLQAIz6Leit+XdOVJJRYQpxre9A0xdp
	U4c86F8J5T5v4yq8+5b6TdkR68oYXf/eAsTpP531QDjY9bXVisFLPFiryWkbuBNGwkWk/f
	uQKQCCGXmXWGXyD6WZsqqwwbHbvePP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791009562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=kF4JtyU/3LOEHjQBfY7qE10jZI8z+EVLGwuqqgtLmnYZJktULZw7w9cImkxBgpjWpzTEyI
	zmTHianPnkANq8Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=T+DZ6MhP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6FJAh52+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791009558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=T+DZ6MhP5XYLdPUuAzT/xpVwqesWts2vKCzkSASzMUEDZZNJmO+s13tJYxIrT4ay7cyC2j
	aMU4Z3xemjSb8p1t533vRHJLubmqQeCwrUglWiwscy7fzD7iO/ypx2LZ8FxscM9EfsBGcD
	0caU2R5OFvVSCVh4UGp0k0Fv/Ycp2kU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791009558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h0oB/zkwwpgZk+rc+sqnXw4bOmMSkziWKlHnKZN85o=;
	b=6FJAh52+hKBECMpEzhZhDMl+zgwrTQjPGj9lw5zb6aRkUV1o9Ra+cPXjJmyDLdSgLiz/oI
	1ASo8i0FYZjIp+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C27813707;
	Sat,  3 Oct 2026 06:39:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MU+pNxSjwGqQCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 06:39:17 +0000
Date: Sat, 03 Oct 2026 08:39:16 +0200
Message-ID: <87wlrzxp7v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,	Martin =?ISO-8859-2?Q?Povi=B9er?=
 <povik+lin@cutebit.org>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski
 <krzk+dt@kernel.org>,	Conor Dooley <conor+dt@kernel.org>,	Sven Peter
 <sven@kernel.org>,	Janne Grunau <j@jannau.net>,	Neal Gompa
 <neal@gompa.dev>,	David Rhodes <david.rhodes@cirrus.com>,	Richard
 Fitzgerald <rf@opensource.cirrus.com>,	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,	Ulf Hansson <ulfh@kernel.org>,	Amit Kucheria
 <amit.kucheria@linaro.org>,	"Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Vinod
 Koul <vkoul@kernel.org>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Sen Wang <sen@ti.com>,	James Schulman
 <james.schulman@cirrus.com>,	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,	linux-mediatek@lists.infradead.org,	Hector
 Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
In-Reply-To: <u9VW29vaRPGENsSTq9RHUg@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
	<20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
	<878q4k2xl0.wl-tiwai@suse.de>
	<u9VW29vaRPGENsSTq9RHUg@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3BD8B21B02
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,cutebit.org,gmail.com,kernel.org,jannau.net,gompa.dev,cirrus.com,opensource.cirrus.com,perex.cz,suse.com,linaro.org,intel.com,metafoo.de,collabora.com,ti.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,marcan.st];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[lin,dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_233929_027415_B481D4F9 
X-CRM114-Status: GOOD (  25.84  )
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

On Sat, 03 Oct 2026 03:34:07 +0200,
James Calligeros wrote:
> 
> On Tuesday, 29 September 2026 7:52:59 pm Australian Eastern Standard Time 
> Takashi Iwai wrote:
> > On Sun, 20 Sep 2026 06:53:47 +0200,
> > 
> > James Calligeros wrote:
> > > From: Hector Martin <marcan@marcan.st>
> > > 
> > > This allows drivers to implement policy around locking/unlocking
> > > controls, such as enforcing that a group of controls may only be locked
> > > by the same process/file, and taking actions when the controls
> > > lock/unlock (such as granting special access on lock and resetting
> > > values on unlock).
> > > 
> > > This is, in particular, useful to implement volume safety controls, such
> > > that only a particular process (that locks controls and completes a
> > > handshake) may increase volumes above a given safe limit. It also allows
> > > the volume to be automatically lowered if that process dies (which will
> > > trigger an implicit unlock).
> > > 
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > 
> > This doesn't sound like a good approach to me, and this looks rather
> > irrelevant with the purpose of the series.
> 
> I'm not sure what you mean by it being irrelevant. A significant portion
> of the machine driver is dedicated to implementing safety interlocks based
> on the functionality added via this patch. It would be impossible to prevent
> badly-behaving users{,pace} from defeating the safety guarantees made by
> speakersafetyd (and thus permanently damaging the machine) without giving
> speakersafetd exclusive ownership over the safety interlock kcontrol.

Improving the lock/unlock itself can be an interesting idea (but we
should do in a different way instead of blindly extending each kernel
control ops).  OTOH, the whole implementation of the driver and the
feature depending on that stuff sounds rather fragile.


thanks,

Takashi

