Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPy8bMpbMrlbc5dUyvMsXWKtlvQqCr1ZlC5oiJcVLUc=; b=bmyQAp2N6KRM+Deu5mfKyJUvqc
	wQz2wO322WoNya03LAheOObrYsmqDsg0pkqAjDVWfd/FSDvG7bm19t6d3+Xrw+dLK2fEpEXzth3u/
	pYAz3d51yyFQAKNjk+wuOrIlqtJb3b8Quy4dAkqthXGWf0EJknGZ0ZPdzjWbmPsSke7Yhe9110bta
	MwaZVB5omD6u85/2bII8Vlk5TfwMb5/SOZGQ+yEGKO34FGtqRzjT4MmGaqdjfx9S1yw21R1gnplik
	FiRzB2OEKvn/KOC+nhMyPUWyzfwzqe1dvpVXpVwk9MS4DDAOjoyX2UnFTpOuD2oFbU8rhMs0hq4yY
	bit/Szgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7qL-0000000DugZ-1Ww7;
	Fri, 11 Jul 2025 07:06:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7o0-0000000DuPi-3Oag
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF82F611BD;
	Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7B7C4CEEF;
	Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752217463;
	bh=uK5/A21fH/ybXkIrVUNquGOGWtk5qo5hMSx0pRcrghQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ozfb4Ymiyjz9klNEQNJ7+XMATYrXDol/mZYRFbfu5CreWryhHBADzdHTjmGWT6pCI
	 2LI8Hg3YRs0dd48sDHV7Eivso+OTPLMGaTu1Xav9SaYjTT9eRvxnnxhOL1kS6k7eTQ
	 bXrKPl8f85Qk1zPAVj+UGD9+AU58t3/QWCmFB06enVeBKPHHaplP5gj24nlTkj0deB
	 Iopp5WPNP9nBuHVUExF+gSTKayUaynoxmromiXtiwoLlEmTz0YeOmQC4EfcF9HVpeZ
	 ex81Qyb0Ajht4BpSAF2dNL7n5bqyR5EY+VeBDQjOBjZSiSFHbzueV2hpjJqv5B0JRX
	 AsYgFP/435ZLg==
Message-ID: <1513c2dd4793403c32ccbbef4b5774e3@kernel.org>
Date: Fri, 11 Jul 2025 07:04:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
In-Reply-To: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@foss.st.com>, "Raphael
 Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Samuel
 Holland" <samuel@sholland.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shawn Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
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

On Thu, 10 Jul 2025 13:43:09 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

