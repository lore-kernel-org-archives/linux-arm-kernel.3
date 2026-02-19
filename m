Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC864E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npuTIspAvOrD19FQ0TqG9QOxkV6FhzrkSXimIpMnL4g=; b=uv2GXzMn9fPJfIeOIEIS+GOSdu
	w0vmzDVFCkWZvtFfmVecR8ijgYfnmWXVcXfgnOgSKaOXS8KjI/NHyZF/dRQCAA+00yG1Mbl4pdV4k
	/vJSm5ogsUWanQgi/oRCtaNazHcR6uTbVFNWt8UfBzxysLBCAJFQRn5WTkMdmsLHq5XPIdxfP6Qfm
	cJEv9qe1XskNmkdMO+/+1XO8CXp7uqGQmzxy1dq0PSCpGqXgTuAL/db+Ejv/iMF1Ylt3jMOd3zQCS
	yazWOn8Hc3lfZI/oE/WRohFBM4I9rGVpwtqLPTabT0mQLgCtxKxmYnFLAJnpbswXiQ2SAb+VTBptY
	bbNebDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt47N-0000000BOvr-2sIQ;
	Thu, 19 Feb 2026 13:30:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt47K-0000000BOud-1fgs;
	Thu, 19 Feb 2026 13:30:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5545C4E4023E;
	Thu, 19 Feb 2026 13:30:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D91E5FB45;
	Thu, 19 Feb 2026 13:30:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8C6A102F18FC;
	Thu, 19 Feb 2026 14:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771507849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=npuTIspAvOrD19FQ0TqG9QOxkV6FhzrkSXimIpMnL4g=;
	b=MY9ZvABT+1aokTgV8+munKqpZOV0lg0d8+sqwvXPIHpzY+M2QHeItcwQkdXD9EZYcq7Aaq
	G6jAEx4Wd3w0VyOcSZinyqbAUGTYfX8NTbQ654p5iGnZ+5D1KpMR5oxLfOn0604lqxzI0F
	LHE4HSscCnqAiYA2vRDJ6ZKOcbN6Z2VlPCnxB2FFcNKlnrr2k0CpTl/iWy2x0F5XHzJ6Xq
	DtYRAqOEMzywC19YJ8emLHKFgIQ8b2qnGjWJ0QIWGZbkEiJvMXOgdK8YpKNSGiDHw+9TRf
	rjA/464qfqnN6nuFjorilwul9iApJFrCNCIDzW7RNHLaU5PFmsrO6TowbxnIZw==
Date: Thu, 19 Feb 2026 14:30:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
Message-ID: <20260219133044fa1ac2a4@mail.local>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
 <20260219093718b7d29076@mail.local>
 <00698644-63dd-45b0-b43b-a7bc0fa459b1@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00698644-63dd-45b0-b43b-a7bc0fa459b1@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_053054_918577_0ABABC7A 
X-CRM114-Status: GOOD (  14.37  )
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

On 19/02/2026 12:34:44+0000, Mark Brown wrote:
> On Thu, Feb 19, 2026 at 10:37:18AM +0100, Alexandre Belloni wrote:
> > On 18/02/2026 15:18:34-0500, Detlev Casanova wrote:
> 
> > > +		if (!mclk_rate)
> > > +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
> > > +
> 
> > Maybe this could be set as the default value of i2s_tdm->mclk_rx_freq
> > and i2s_tdm->mclk_tx_freq in rockchip_i2s_tdm_probe instead of relying
> > on it being 0 and testing later on?
> 
> That makes sense but since this is fixing a regression and I'd like to
> get the fix in I'll apply, we can improve things incrementally.

Yeah, actually, Luca pointed that it is actually not a good suggestion
because we need the rate of the stream to be able to set mclk_rate and
we obviously don't have it in probe. So you can definitely apply the
patch as-is.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

