Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2155CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=; b=rKVdb8HaofLw7ReUxKboQIJ856
	w3RL5d1EIYpnBah/OlxCycD2WOr0eIqEBEgzaQLkymBU4P0ydjRIqYz4tOUJB3WqqXUxxLBCEMP+E
	WgnugZhcnsrJLkw41yl0KhYBDiwHBAgdvWhx1YIvkS+NZRqXclcxvWfa8nFpaLnbAhjEHRWoqTByg
	k2Rsgs56l4ffa2etjBxjgfsJGgmv2UwlUMBZw3QY5uJUyh433tvll21PC0bw5JD5fFwMyaxqiLxMs
	jGUC9O6gq0ZFFoX71Jp44XvQ4JCyupYJfnEIeQJoXMJ8uHWUO72/7SaUhB0NHG2NPTtpGFitMLhEt
	elzqljyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvx4-0000000DGgE-3sF2;
	Sat, 03 Oct 2026 09:22:42 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvx1-0000000DGfm-1Rxd;
	Sat, 03 Oct 2026 09:22:41 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 046611FECE;
	Sat,  3 Oct 2026 09:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791019353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=my52R8VSIc8jiRLCwxnGDMah/d0WwzVDvjzRTIJTlK9GAFKAvrqTQ67aGfZbZ8GORxGkEt
	pBWBC/ecjvRjMDmS45a0Z+Zj/V3ytzTX3W6pbhLcTBFi7tRhHKh/zf1Q4FmwSgtd9CJRSq
	MLRVo2Ffd4xTt3Tiu45K2trgd7Qqtwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791019353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=y0e4ZY/x/TijHmgs32hn1KqyWePaDtRh3o0dbqpSmUr3s4aLjjUDCu93NADdtVSKZtTWqN
	bE11BeY0SlMNLwAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791019349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=o0qnjyBdc81rS3mR5z80q6HVqgP3FC+xtHgJzjReQt5TLk9IxCelCFG1xofvS2Okrva/jO
	XngN2vy3wUWWpqEigs5U1Re04z2VWQ4syhsN2WoGbsdeF9EJBG50Y4SalCIAmAO8ecsSi4
	dbv3Oiy4GjgAgi6vbux8kP3IVSYmIlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791019349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CEGk7PrMceY9JeyothIm/f0yHByMW+ulWmkh/YcGW0=;
	b=tKiNhQPy6pFKT6VAQEePtpoOWhJQJNWWwMrNGF15zCU3LCOT0rgsqjT46Ob8jSm+06t6En
	YNjsNdqTI68AtECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E974413712;
	Sat,  3 Oct 2026 09:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7r3OLlPJwGodKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:22:27 +0000
Date: Sat, 03 Oct 2026 11:22:27 +0200
Message-ID: <87fqynxhnw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Rob Herring
 <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor Dooley
 <conor+dt@kernel.org>,	Sven Peter <sven@kernel.org>,	Janne Grunau
 <j@jannau.net>,	Neal Gompa <neal@gompa.dev>,	David Rhodes
 <david.rhodes@cirrus.com>,	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Ulf
 Hansson <ulfh@kernel.org>,	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Vinod Koul <vkoul@kernel.org>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Sen Wang <sen@ti.com>,	James Schulman
 <james.schulman@cirrus.com>,	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,	linux-mediatek@lists.infradead.org,	Hector
 Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
In-Reply-To: <87wlrzxp7v.wl-tiwai@suse.de>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
	<20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
	<878q4k2xl0.wl-tiwai@suse.de>
	<u9VW29vaRPGENsSTq9RHUg@gmail.com>
	<87wlrzxp7v.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[lin,dt];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[cutebit.org,gmail.com,kernel.org,jannau.net,gompa.dev,cirrus.com,opensource.cirrus.com,perex.cz,suse.com,linaro.org,intel.com,metafoo.de,collabora.com,ti.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,marcan.st];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_022239_707885_1295C77A 
X-CRM114-Status: GOOD (  28.72  )
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

On Sat, 03 Oct 2026 08:39:16 +0200,
Takashi Iwai wrote:
> 
> On Sat, 03 Oct 2026 03:34:07 +0200,
> James Calligeros wrote:
> > 
> > On Tuesday, 29 September 2026 7:52:59 pm Australian Eastern Standard Time 
> > Takashi Iwai wrote:
> > > On Sun, 20 Sep 2026 06:53:47 +0200,
> > > 
> > > James Calligeros wrote:
> > > > From: Hector Martin <marcan@marcan.st>
> > > > 
> > > > This allows drivers to implement policy around locking/unlocking
> > > > controls, such as enforcing that a group of controls may only be locked
> > > > by the same process/file, and taking actions when the controls
> > > > lock/unlock (such as granting special access on lock and resetting
> > > > values on unlock).
> > > > 
> > > > This is, in particular, useful to implement volume safety controls, such
> > > > that only a particular process (that locks controls and completes a
> > > > handshake) may increase volumes above a given safe limit. It also allows
> > > > the volume to be automatically lowered if that process dies (which will
> > > > trigger an implicit unlock).
> > > > 
> > > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > > 
> > > This doesn't sound like a good approach to me, and this looks rather
> > > irrelevant with the purpose of the series.
> > 
> > I'm not sure what you mean by it being irrelevant. A significant portion
> > of the machine driver is dedicated to implementing safety interlocks based
> > on the functionality added via this patch. It would be impossible to prevent
> > badly-behaving users{,pace} from defeating the safety guarantees made by
> > speakersafetyd (and thus permanently damaging the machine) without giving
> > speakersafetd exclusive ownership over the safety interlock kcontrol.
> 
> Improving the lock/unlock itself can be an interesting idea (but we
> should do in a different way instead of blindly extending each kernel
> control ops).  OTOH, the whole implementation of the driver and the
> feature depending on that stuff sounds rather fragile.

Also, if you want a locking by user-space, how about to simply provide
a boolean control element for locking, instead of extending the whole
API and infrastructure?  The control can be taken exclusively for a
process, and the driver just blocks the operations from others while
the flag is set via that kcontrol.


Takashi

