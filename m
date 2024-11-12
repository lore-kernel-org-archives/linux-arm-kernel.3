Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D0D32D9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLPANBLamjGfC5r6egRWAEDIhWpqsCbbZn+Iq+TVaHs=; b=TFT/pIYcRuJ8vGrZ8dEaXvmLJf
	2ouU2Ws9sZjczkV7okBeenICAtCvwsvt5mX4nfky8DeqYjgPnuSexAjUcy0URcTHOOZgXgY8/9dR9
	n6tWH0l+BoHpZW3szG71MP9BBE0iSBXw80tWD3EFtAi2fa4d4tOZzkZuTA+Ck/ubKPXAyxirJrlzc
	YYis8iGiFuod07UHT9o51nm1Y4p3mbCIlEFbyvTi42lvrSIwkW9j2IGvdEspAqv9TJCKQ6PskollG
	A+5YntkWi/FEoAhTiYLCzMgO4udTkd6eXDpTLN+qS8Yxv/Vezg6NYwXwcuxx8byoeUeUBIkhyhQ4H
	bUSAqfag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApzW-00000003OQS-2JBy;
	Tue, 12 Nov 2024 12:27:30 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApX2-00000003JdF-0Mvl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:58:06 +0000
Date: Tue, 12 Nov 2024 22:57:36 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1731412678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLPANBLamjGfC5r6egRWAEDIhWpqsCbbZn+Iq+TVaHs=;
	b=a2/tyhe7fNibfAbbCny3Aikp3SsQnw6XH7Ov42dzBegj2EiTgNMN3Xtj9HxXtxU8+uGVBm
	nI9QJwwmQq3bac1SiNPQ53yBhbBEyJpPAlZrm8CZ4rAOzxF6iZ1FJVCbk2xF0Y9mw3Q3N8
	0PWbOjQIDg3RwbSIyV7Ve+qisx+cnXeNfaZRvcKs1sKx2WLVjquVBuWwRjFd96OsiKw4a5
	zJGLpuo/iZ/i7LfAsFL1Zmb+8W2cMl1QovdUVyShoYPgpXyfcsMFIFqpfd0XdqkFtzY2kO
	0SEGYCrQNR+RkH+svIeIYbE1elx45wTijw4bX2EApjeDRad+MCIup1tiKLtEPQ==
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
Message-ID: <ZzNCsFiAiACFrQhE@titan>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan>
 <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy4c9BFcrz2JVU6k@titan>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_035804_360845_1E34BD19 
X-CRM114-Status: GOOD (  28.65  )
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

Hey everyone,

I'm not sure exactly where to add this but I discussed some of this with
Parthiban on #linux-sunxi a few days ago, so I want to write it down
before I work on the next version of the patch.

I had assumed for some reason in my mind that DE0 and DE1 here referred
to mixers, but they actually refer to chips that have multiple DEs. It
looks like at least with the A133 it has two DEs instead of two mixers.

This can be found by looking at the Allwinner BSP: SUN50IW10 requires
CONFIG_INDEPENDENT_DE and has a device tree with an extra reg and clock:

<0x0 0x06800000 0x0 0x3fffff>,/*de1*/
<&clk_dpss_top1>

However the tcon-top code seems to conflate mixers and DE in the
mainline code and the Allwinner code. So ... It seems like 'DE0' and
'DE1' really do mean mixers in this case. It's probably best to note
that down.

I thought a bit more about how to solve this properly- setting two
mixers to the same output is something people probably won't do in
practice, so the only way you could really arrive at this bugged state
is by setting it as the default state. This patch may be the correct
solution after all.

John Watts

On Sat, Nov 09, 2024 at 01:15:16AM +1100, John Watts wrote:
> On Fri, Nov 08, 2024 at 07:36:16PM +0530, Parthiban wrote:
> > To add, 0x20 will be DE0 <--> LCD0 and DE1 <--> TV0. Below note (copied from
> > R40) states the priority of the DE selection, which fails to work? Not sure,
> > may be disabling CORE1_SCLK_GATE and CORE1_HCLK_GATE in de2-clk helps.
> > 
> > With A133 following the same as T113 with single mixer without TV, still
> > sets 0x20 in vendor kernel.
> > 
> > copied from R40:
> > Note: The priority of DE0 is higher than DE1.
> > If TCON_LCD0 selects DE0 and DE1 as source at the same time, then
> > DE0 will be used for the source of TCON_LCD0.
> 
> Hi there,
> 
> Yes that was a pretty bad typo, I meant to say DE1 to TV0
> The prioritization seems broken in the T113 at least, it's racy from
> what I see in testing. I should note this in the patch too.
> 
> I looked at the datasheets and kernel code briefly: I can't seem to
> figure out what SCLK/HCLK gating does and I don't think the kernel
> touches these registers which are gated by default.
> 
> > Thanks,
> > Parthiban
> 
> John Watts

