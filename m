Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCFACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcPL8o8Z4XmsLGjpASl8k9Dx4lA/LaSxR/sG1Qa60vw=; b=Oup7AKOBEzkTBwGvO21XuZmi2C
	OuxkBYMmgDIqOXfht7tESUn5YQjwZhYRbwfKOyrcwJDWshGx51ZyFMPg9Rd+bdFTMgC91pU5pX5EY
	w1W12ueWHNYyq0xiFzvlCSm2I7MosSNXSnDmPXgSVWn8hcK9Q4zfKNwzNb2dBoHsI4Bek/xhiFB+l
	Q4nmvXrpUAHmgg6mm+jasXnTYgeySjkUe0fq2vxIvK/UDyhMElrSwQFnY74fzlvRzcQFGW/ugpDYL
	KxYu8XkO5M1aoRmVKvAJ2ING0mbrJaTap4WTyAF7NR5FTqYwpg2F472zmHy1ZQ/rrAkNdlpX+X4Gx
	RPX7jqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEeG-00000009Phq-22Ln;
	Tue, 19 Aug 2025 05:12:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEZx-00000009PS6-3zpr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D836601FF;
	Tue, 19 Aug 2025 05:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C7FC4CEF4;
	Tue, 19 Aug 2025 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755580092;
	bh=v8ckINysU01zdhrDxYflMq4LyhKbfk5+seby+1Vuep0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOVzgR6P8ZuYW6G/v1G9RUH3Fa2+XpSzz1TkLHsRKDbq2Vn1K6UFEC33TOxUAcruN
	 tLTUz1siRWJn7b+cUwdprNOyjDYufOZcmLEru8HCNrUgtRDFPyjW4YfIbsyuzdU3vW
	 5jGw/AAfC124CDX+foVBZCj8qKkXWY8DcjNKQv3xt/upGLJdKSdwaqt0/KqsoMo1B+
	 KRPUVuVPg/4xU5qzKD+jRnZzC1jEy4jXL0oPGws8Jn5yTdzxK1GG1iD1lyZyOoXFXA
	 Ff8t622Tq1tq40otnIZjiD1tXp3624zVnExt04b7X0uKGGRBxbnw9VFnSXjak5kctL
	 KR+I+/zzoJb6A==
Date: Tue, 19 Aug 2025 10:38:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>, Joris Verhaegen <verhaegen@google.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add
 SNDRV_COMPRESS_TSTAMP64 ioctl
Message-ID: <aKQGuPgwXE-Unzeq@vaman>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com>
 <aJGM2zXS6hOLDFm1@vaman>
 <87h5ym1f75.wl-tiwai@suse.de>
 <aKMzGRzeRqkOwTNS@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKMzGRzeRqkOwTNS@opensource.cirrus.com>
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

On 18-08-25, 15:05, Charles Keepax wrote:
> On Tue, Aug 05, 2025 at 07:59:42AM +0200, Takashi Iwai wrote:
> > On Tue, 05 Aug 2025 06:47:59 +0200,
> > Vinod Koul wrote:
> > > On 01-08-25, 10:27, Joris Verhaegen wrote:
> > > >  	ret = snd_compr_update_tstamp(stream, &tstamp64);
> > > >  	if (ret == 0) {
> > > > -		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > > -		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> > > > -				   &tstamp32, sizeof(tstamp32)) ?
> > > > +		if (is_32bit) {
> > > > +			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > > +			copy_from = &tstamp32;
> > > > +			copy_size = sizeof(tstamp32);
> > > > +		}
> > > 
> > > Most of the applications and people would be 32bit right now and we
> > > expect this to progressively change, but then this imposes a penalty as
> > > default path is 64 bit, since we expect this ioctl to be called very
> > > frequently, should we do this optimization for 64bit here?
> > 
> > Through a quick glance over the patch, I don't think you'll hit the
> > significant performance loss.  It's merely a few bytes of extra copies
> > before copy_to_user(), after all.  But, of course, it'd be more
> > convincing if anyone can test and give the actual numbers.

That would be better

> I am inclined to agree the impact should be very minimal and the
> only alternative is a more complex implementation. I would vote
> for leaving this as is.

But yes, we can for now, go ahead. It is internal kernel flow can be
adapted anytime :-)

-- 
~Vinod

