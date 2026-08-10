Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49F2C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fkRRQESuJogTJbUlw1TtnlKX+cyZWiGY0fHfzIT9Xw=; b=p1bC13eKlBb/l+0QmmDo22H7zF
	scsdcMzicHLIunGwWTTagMWx+GpPLQ8bf6o8gUSPfaNPMjlqtpqBZuMKGBe/xgMSiFaAVJjJcFJjj
	kJxg2BQz7IXQr3eOLcP504VHVc25kM3GG2Eqp9NL43ZH0/4DJpkl5CLbK+Zmqdrda1PBVi4q8fFx9
	pCsG2o/H+hpffx2TDBvFcFl25zAq+wlHG3purIWycUlxe81cPjCwr3JNeRG2zqBF/gmo0aYLf6Zvi
	zoyQWS+rX/1EYNpKcmckjrkKCvU/LwqPfXFWp18EfLpAM1JG9e+tjjp8WB41pae3GAG0+wvx63Ul5
	Y03HI0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWhu-0000000CqIH-3pGz;
	Mon, 10 Aug 2026 20:34:50 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWhs-0000000CqHw-3fWx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=5fkRRQESuJogTJbUlw1TtnlKX+cyZWiGY0fHfzIT9Xw=; t=1786394088; x=1787603688; 
	b=dPldqICuN9PL/26ZE6jDyxPMn0dFNkGDV292XxKH9gQV+MVM+BO7BxVBnyg2BBYEvxsOCiv+st6
	GAvjgW8okc3s9sUr3SxJAxf/TH6e61RFNFS818CXfDIFWqM00SZvZhgCTc2OR2grAKgZr3PJ4Yt3t
	wXlm1onGhvBYFaPdzTds7ITPIl5lbqCCt3JexrvmwB9EJPSrtBPwuNOpp4Pq3djXe05gcV6YRGKkY
	qEvZNqw+dDHZmPVTw1N+QbgHlTjGuHgVlJimb3HjXKB7MWrLN38FmUFHi6dVoJDcJECFpUeFc3Exs
	XfLYE6Nni6jRcrQK5kGFex81uAm/CdKkLFrg==;
Date: Mon, 10 Aug 2026 22:34:13 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Daniel Thompson <danielt@kernel.org>, Grond <grond66@riseup.net>, Stefan
 Leichter <sle85276@gmx.de>, Grazvydas Ignotas <notasas@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Sen Wang <sen@ti.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 15/16] backlight: remove pandora_bl
Message-ID: <20260810223413.01af9a6d@kemnade.info>
In-Reply-To: <92FE1162-8C61-4186-B073-6AB4B2BDA640@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
	<f897f695c0e1e128d7ebb41be8dfdce4d634f552.1783749722.git.hns@goldelico.com>
	<anmpiADsvzW39DNx@aspen.lan>
	<DA9588C6-0238-4713-B1A1-CB2123F02028@goldelico.com>
	<20260810143914.64d29a5c@kemnade.info>
	<2C9844A3-3C4C-48E6-863D-BF8328CEE540@goldelico.com>
	<92FE1162-8C61-4186-B073-6AB4B2BDA640@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_133448_931230_0D0C7251 
X-CRM114-Status: GOOD (  22.29  )
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

On Mon, 10 Aug 2026 20:30:13 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > 
> > Yes that is what I mean. It needs to be ported somewhere. If it can be ported to
> > some compatible = "pwm_bl_for_tps61161" or what fits best it will be fine. Or it
> > could be in some compatible = "pandora_bl" driver.
> > 
> > Has to be worked out when the development machines are not blocked by 3 or 4 other
> > projects already running in parallel :)  
> 
> Nevertheless I did a quick look into the pandora_bl driver structure.
> 
> Here are my findings:
> - the code fragment is part of pandora_backlight_update_status()
> - priv->old_state remembers if brighness was set to 0 or not
> - so this code triggers on any change from bright = 0 to bright > 0
> - the pandora_bl driver is the only one to use TWL_MODULE_PWM besides twl-pwm
> 
> So the most natural way of transplanting this appears to me:
> - add this logic to the twl-pwm driver

That chip could be connected to any pwm driver, so
it does not make sense to have that in a pwm driver.

So it belongs into a backlight driver. And since it shared so much
code with the pwm_bl, it could be extended.
The compatible should have pwm in the name to be able to also add
a w1 driver later.

Regards,
Andreas

