Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057BBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=; b=V23RwHckkpGaiEYRnYlH++a2Tj
	IgE6f57Br0cpVRUDIKtvzaUxhTEFspB2z83hgMFviz6XsN+pi0aU+JyUJbhgRUX93pMW5vezlTJWl
	/xObHqyVSupSN8IHCyoSgBn9BcgPGlWldziKWncKMTu0+3HXKfqPcpmIffPHiq1cpusTDCWqBKfqm
	n881ZIk7xobT8sU+kD9U0oaI4qVXBDQ6IRMea2Qanu1ny+Kh7tRxnx52C3axt5E0E824OaqzXUF0K
	gqYajBLPwCm+c3H/nAd8SpXQgBi9pIUukeB1PF0FhDmlpk2cs5f45rwolPmPqWIgH9ABq49SfUJy/
	Lh/loHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDA6-0000000Eme7-0EY3;
	Fri, 11 Jul 2025 12:47:34 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaD3v-0000000ElXs-0Qdm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:41:12 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12995211D0;
	Fri, 11 Jul 2025 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752237668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=mvvfA2GjUK9B5BoVIq0LkOjcQ66Q8ndM3eE5q9FhZERXsNh+uBeAR3egTRXJaLCCrYgZud
	CDQ+iW59hpZD4yk6rJILnbPxXbK6Y/ZmQTCFqmlcxTxvKPvB4MJGNMqQzJmCvjy567vYZw
	AKx+hcJ+PqZu4YlDCrTuGRY+qiqBG8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752237668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=OyyJRv9SNDM3TMyOwzYIV9u5M66jR7evWwzoL7zLsOSFsdxPeJFP9yoGRE/R8iPVmYSp7y
	uH/z6Zmq2vlxDHBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752237667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=i+T+nIxWWlwfEqZ1zj/27kzojyXmRkFkc5UzKFURsZf3ZfV2jaHfoSw2n8SLTAAkmWB9yj
	YuKAoXj9d4jy3O+A3kJ6ELVOMBBUuKHvav5GFfVvMJR1hwBU/IJxEQgPbrVMZ91ywhi9QV
	5kNcq3gRNH/PlqRfA+fEHMQsEzSK7nI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752237667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=ijim6fxusABPnaEAUSVIPHXj/xFyeRSa0F5mqZStfhhSLPFzektelsyjUANZkrAvu6xgiw
	5haTlLR5mfeImrCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ADB9138A5;
	Fri, 11 Jul 2025 12:41:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ku3rEGIGcWh4MAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Jul 2025 12:41:06 +0000
Date: Fri, 11 Jul 2025 14:41:05 +0200
Message-ID: <8734b2hpcu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Joris Verhaegen <verhaegen@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	kernel-team@android.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
In-Reply-To: <aHD7/9MZbcOmn+08@opensource.cirrus.com>
References: <20250711093636.28204-1-verhaegen@google.com>
	<aHD7/9MZbcOmn+08@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,perex.cz,suse.com,gmail.com,opensource.cirrus.com,cirrus.com,intel.com,linux.intel.com,linux.dev,nxp.com,linux.alibaba.com,socionext.com,android.com,vger.kernel.org,alsa-project.org,lists.infradead.org];
	R_RATELIMIT(0.00)[to_ip_from(RLtwg9tyn6faipwn1aqsxq4m86)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_054111_431718_573E9E2E 
X-CRM114-Status: GOOD (  27.73  )
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

On Fri, 11 Jul 2025 13:56:47 +0200,
Charles Keepax wrote:
> 
> On Fri, Jul 11, 2025 at 10:36:26AM +0100, Joris Verhaegen wrote:
> > The current compress offload timestamping API relies on
> > struct snd_compr_tstamp, whose cumulative counters like
> > copied_total are defined as __u32. On long-running high-resolution
> > audio streams, these 32-bit counters can overflow,
> > causing incorrect availability calculations.
> > 
> > This patch series introduces a parallel, 64-bit safe API to solve
> > this problem while maintaining perfect backward compatibility with the
> > existing UAPI. A new pointer64 operation and corresponding ioctls
> > are added to allow the kernel to track counters using u64 and expose
> > these full-width values to user-space.
> > 
> > The series is structured as follows:
> > 
> > Patch 1: Introduces the new internal pointer64 op, refactors the
> > core logic to use it, and defines the new UAPI structs.
> > 
> > Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> > 
> > Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> > 
> > Patch 4: Implements the new .pointer64 operation in various ASoC
> > drivers that support compress offload.
> > 
> > This series has been tested on a Pixel 9 device. All compress offload
> > use cases, including long-running playback, were verified to work
> > correctly with the new 64-bit API, and no regressions were observed
> > when using the legacy API.
> > 
> > Thanks,
> > Joris (George) Verhaegen
> > 
> > Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> > 
> > ---
> 
> Would it not be slightly simpler to just update all the in kernel
> bits to use 64-bit and then only convert to 32-bit for the
> existing 32-bit IOCTLs? Why do we need 32-bit callbacks into the
> drivers for example?

Right, it's a usual pattern to have only the 64bit ops in the kernel
driver side while providing the 32bit stuff converted in the core
layer.  Having two different ops are rather confusing and
superfluous after conversions.

If there are tons of users for this API, it'd be needed to convert
gradually, and eventually drop the 32bit ops at the end.  But in this
case, there doesn't seem so many relevant drivers, hence the
conversion can be done in a shot as done in your patch 4.


thanks,

Takashi

