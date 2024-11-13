Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E16FD41C13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UNEWkaaWi2aH87Bu/nkPPrIJzqMJy0nOzkhi0xcK50=; b=oR4yeNTFLWkAusj47XMhh9NbYS
	ZnsTWxC3u28FtPzuE1Eh0W26uJlGopF2QBW3lmQHCCZcAn6rbHxajr39qjbB+Z2FqX3pKIpLozUD5
	0jddTBoc8KaxLia9YFB/DHb/BDDY6Y+ehgysQMaH9wfOwiNCGXXXpY8uC3XxuOde4s+oodTr8p2EL
	5AG14RRp06X/C1T71m1GOM+95KeoI9hwrZKnfjOxmlECmAeJXo2yBddvry1SjRBg2NbK91vT3zxue
	PecRVuE3G5yimxOvDWtTnVESSpU/dFmgb0nKsc4gpiRZFhOR2aPJwqDJnUsVP87tr+/71FVgwXq2s
	4JKvRiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8dt-000000065Wm-05ma;
	Wed, 13 Nov 2024 08:22:25 +0000
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8c4-000000065Ou-3TxL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:20:35 +0000
Date: Wed, 13 Nov 2024 19:15:59 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1731486030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5UNEWkaaWi2aH87Bu/nkPPrIJzqMJy0nOzkhi0xcK50=;
	b=idA6PtSuL7Dp9RxF1Bk6TI7/3VnRiu3fNXfySYDOyaDq5JaEfZYHUTmS6PF5ZJcxqYfT3p
	HB2st5Z5LNBKsVWpxNGXK0rXZNRXCVEfrcxv+AVAg/q9Rcq06JNxViVMSQ4FROMPp0H87U
	Wdu0zLoI7zkmv1c0HAIzT5taFlZXz7RCAn+Sm3xYMHJ5JxwDHnzoQXfpZUgE8YZTt8YXSZ
	hIofh7rDKlVtAEPuvfpBRtSX0O/uEYjA94VVNLGETrumTo7wqRc13ePRp9cx+m0IfclD8y
	Kuvy4F2jB0Nnye0lU1ojPCjWw0sqN95IckT5MPrmfgv82F5Pfeu5jXRyVa+JvQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Parthiban <parthiban@linumiz.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <ZzRgP7-hHWE8JH8K@titan>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan>
 <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan>
 <ZzNCsFiAiACFrQhE@titan>
 <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com>
 <ZzPluoI7xSTwhNcm@titan>
 <2ef6afa0-2756-493b-83a4-62e73a8e2af9@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef6afa0-2756-493b-83a4-62e73a8e2af9@linumiz.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_002033_476668_78E580FA 
X-CRM114-Status: GOOD (  20.49  )
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

Hi,

On Wed, Nov 13, 2024 at 11:40:14AM +0530, Parthiban wrote:
> No, Mixers in upstream refers to RT-Mixers inside the DE. It's only the
> quirk for R40/D1 setting the DE ports using mixer numbering.

After an hour or two of spelunking the code base, I'm still not sure about this.

Confusables:

- sun8i_tcon_top_de_config uses 'mixer' instead of DE
- The datasheet for TCON TOP mentions DEs
- The DT documentation for TCON TOP only mentions mixers
- Only mixers are passed to the TCON TOP DT
- Allwinner's tcon_de_attach works on systems without two DEs
- Allwinner's tcon_de_attach special cases systems with two DEs
- Allwinner's tcon_de_attach implies theres two TCON TOPs for two DEs

However sun8i_r40_tcon_tv_set_mux seems to clear this up:

- The register value is found using the remote endpoint reg
- tcon_top_mixer0_out specifies 0 and 2 for lcd0 and tv0
- tcon_top_mixer1_out also specifies 0 and 2 for lcd0 and tv0
- The 'mixer' is engine->id
- engine->id is found using sun4i_tcon_find_engine
- It gets the id from the endpoint number
- mixer0 has id 0
- mixer0 has id 1
- there's one engine struct per mixer and display-backend

It really seems like the code means mixers here.

> > Hmm. Are you sure? Looking at the Allwinner drivers it has the method
> > de_top_set_de2tcon_mux in
> > drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c
> > which I think means it's for DE3? But I don't see it called anywhere?
> 
> Missing in the upstream. 

So if Allwinner and mainline don't use it, what does?

> So far there is no real user for DE1 in upstream. DE_PORT_SELECT_REG value for
> DE1 can be negate of DE0, so that they won't conflict or cause timing issues.

If my thoughts are correct, this would break use of mixer0 and mixer1 at the
same time.

> Also DE_PORT_SELECT_REG mentions only about TV and LCD muxing, but missing HDMI,
> DSI and so.
> 
> Otherwise, if I get DE1 working in A133, I will try to add quirk to set DE0 and
> DE1 port mapping in that case to respective connector.
> 
> Thanks,
> Parthiban

Thanks,
John Watts.

