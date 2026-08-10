Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F9EC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXlsx6jnI65lLrCHVH/Ds1l8OuKu1/H08tT9GG0irC8=; b=cp7Iez952QjJ+7RtyvWchcuxzT
	Ti06Jp9kHWWOqv4I69VaM7CCPj2zGm+jOoZAHBhrTFx2lPb6H1hHdlqoAFDcvifnUkybqJ64w/0fG
	6eszCk3vqFs00aeapc4gxpCDjJbgPAhkLHJPA3qEXOYgC4MrH9Jvto81r/RDq5DINtly9dTRg8nJA
	RePyZN7yrKMcv1JVRkpeO8rZIVZ1PtAdiu2LV4fIcCZiReDqB3aHTqKQBg8sx9BjEMMbSZsVPySbX
	ei1b2Pn2iaT2KeCUBVZRkgJcHe1jrITOsFuStpqMWPkYzdIY+B9mlsdrcUbiFqtlOKamwRcvJ5lgB
	AcON9/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNMR-0000000BWaF-2rh7;
	Mon, 10 Aug 2026 10:36:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNMR-0000000BWa9-0R0D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:36:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EB2360052;
	Mon, 10 Aug 2026 10:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F551F000E9;
	Mon, 10 Aug 2026 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786358162;
	bh=aXlsx6jnI65lLrCHVH/Ds1l8OuKu1/H08tT9GG0irC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWM5bZISaLECOKY1Wtjn0I4IsHHW5ixJ7xumDpQvvDbi+h/ismEJv96GBQEeA8Xai
	 Mm7URwrdyB+b25iei/AU/srS/DoE0czDnYav6c2okXt9fzfrjzgoqEZGSPIEyzVuO9
	 t5phGEXdiw4o91XvLM3DJ+2mSszyONGbCgMj9SaptXpuToQqlYzL1Cf2jEQqD5IVjR
	 4jBFh5JyiJN28Ve72CTKuAtb+t6EuNgybkG15ShwuwmfcEYx1PTBDpFhrwdMrzu+Kt
	 0k9p8Q0JVvb5L+gfQRTggI9gMqorpMBMC7dbYaENRs5bWvSaHxNMGPcQ5LDiBT602o
	 uxWSA/d64iu0g==
Date: Mon, 10 Aug 2026 11:35:52 +0100
From: Daniel Thompson <danielt@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>, letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 15/16] backlight: remove pandora_bl
Message-ID: <anmpiADsvzW39DNx@aspen.lan>
References: <cover.1783749722.git.hns@goldelico.com>
 <f897f695c0e1e128d7ebb41be8dfdce4d634f552.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f897f695c0e1e128d7ebb41be8dfdce4d634f552.1783749722.git.hns@goldelico.com>
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

On Sat, Jul 11, 2026 at 08:02:02AM +0200, H. Nikolaus Schaller wrote:
> Retire the platform specific pandora backlight driver since
> it can now be replaced by twl_pm and device tree.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Yay!

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

