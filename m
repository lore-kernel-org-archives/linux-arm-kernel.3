Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CEECCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrSdeYVsExbXCSsc4DcjFqBQJeI/j10zG99MtGVcrCY=; b=R5fAJZHZx74bqQUdBn9qin0LbF
	Oz9RclQgGBaEBV/5Q6ZX9j/lQ7t8Pmz0L4b1Q01Zc0Qc0+dYTKnoRaX/tlMkHym0feUJWOHQ52aZg
	lJEK0sbY61AT0fU5lwS1qNPnZPlaofFPD0+g94lPhLn6kQDAIl+zoweiXcCovzurVLqM1Ntz5qaxG
	eDJ31uQA+KIP6xPtwjfMs8sjU+bVJX1tooFZZ4pCk+BA3Ez49R4vHQ3iKT3LSYmyrC3zbAhrmhvM1
	KaiTbrMuJS9fvnh+fXSG9umlU5F7xpuJPSXikacO28/bC51xu3rSdBQDneKd5JGun33xlCW6UgaUL
	RPU2HARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHuN-00000003LpU-2ivl;
	Thu, 30 Oct 2025 01:56:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHuK-00000003Lp7-3xXE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 01:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A625D4446F;
	Thu, 30 Oct 2025 01:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF82EC4CEFD;
	Thu, 30 Oct 2025 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761789415;
	bh=HRpBacWvcERcW6Qv0x09GJHb3Ah9hMytMcYGZZIFbVc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gh4ILMBqEHUxbzVxPNqMOyFKoBk1D/2dQepMJwwn7MC+LxPe8bWzlFc0eOlE3GmMs
	 GjyszMZWKU+BKnqE3gljkkBM8c2E3CgG2lA3V8BGoiqAsrCoiDbdpA4LmayHj9+2ct
	 btpzGcp+9t29UohHNXRtpOZ22usFiprhf4Q0VHOdumxE8QVL/n8lNGeWrnDzN98pwL
	 o96amkoTXFSNP+m+eKA5tRAB0mUJXoaZMs/1ZkRbVT+miZRfxHASMkTAxQ6wyGwkfx
	 bw9x/TVL5KywwZOQnv89h5iDMO1jIqg+5uAiBwFh8onEhOd2lCVQWvC35MEHJiKewk
	 AdpETnV8lF1Xw==
Date: Wed, 29 Oct 2025 18:56:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Paul Barker
 <paul@pbarker.dev>, Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros
 <rogerq@kernel.org>, Alex Elder <elder@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Stephan Gerhold <stephan@gerhold.net>, Loic
 Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov
 <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Chiranjeevi
 Rapolu <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun
 <haijun.liu@mediatek.com>, Ricardo Martinez
 <ricardo.martinez@linux.intel.com>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Michael Nemanov <michael.nemanov@ti.com>, Kalle Valo
 <kvalo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, Roopni
 Devanathan <quic_rdevanat@quicinc.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND 1/4] net: ethernet: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20251029185652.14483c58@kernel.org>
In-Reply-To: <20251027120559.GA365372@ragnatech.se>
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
	<20251027120559.GA365372@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_185657_002874_A2AEB17B 
X-CRM114-Status: GOOD (  10.62  )
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

On Mon, 27 Oct 2025 13:05:59 +0100 Niklas S=C3=B6derlund wrote:
> >  out_rpm_put:
> >  	if (!priv->wol_enabled) {
> > -		pm_runtime_mark_last_busy(dev);
> >  		pm_runtime_put_autosuspend(dev);
> >  	} =20
>=20
> You could drop the { } here. With this fixed for RAVB,

fixed when applying, the wireless patch needs to go to linux-wireless.
You may want to repost that once again if it's not in linux-next by
next week.

