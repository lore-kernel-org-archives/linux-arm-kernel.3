Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ED2C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyHP7DtW0sshgDlPdPfV3Fb0wcri5Z4d+4N94kKmjCY=; b=ZBNmgIM0zgiBpq5n54P0GCOzhv
	xklqfwkn8DkUXnPS2g9v8cbq9F/gelLtt3JtSHKHj6sevCaFWRhVpTCiXIy11x/DCUYK7QoxonI9J
	QA4IbY0sfYhqMcB/cBDtLs0x7kGGqU99VqG+GbWNSaWzWL69ADNHpgrXreM6cRrNtypKOaeHv/twz
	3u6424g/Vinuq9AzZ8M8lSF7xSEs/2e4ird/rF24mDGep+KyihuviP5uYMoZNOJ1AGeMKQTpCYqqi
	dFW0fLrtzh+lXvLn3+kURpzkKWiumXueuHu5TlOmI5l/wwh5zJnUCOe/aicyVrWj7XCoMZteezOlj
	kBgYfbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLSc-0000000CujY-1Vtn;
	Fri, 21 Aug 2026 09:22:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLSa-0000000CujI-3j0j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:22:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E794C600AA;
	Fri, 21 Aug 2026 09:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17111F000E9;
	Fri, 21 Aug 2026 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787304167;
	bh=gyHP7DtW0sshgDlPdPfV3Fb0wcri5Z4d+4N94kKmjCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LIwhA0GXgyX89Xk8x/6GbYlNrVLg4puy0BDTdWaNFwyZcC3Szje8S3aIX/zcRG+n2
	 2q3S5Y1rAqeV3Hc81Nt926VMWQywkcXH7RCxYIk7XGzkffbGx4AU/zU7qzknyaOD8M
	 AQ2usFXEPzjHOWubN3lBwVhfEMjKPIhxGtyC/jggyBKXKRzsh25b1E8eIvF7y416ou
	 JT7+G3rFYs5qOgF1SDeuh0TcrE1fTW7fMpzEe+5woRzM7RYBGSS3izU3+4Y4p6zVbS
	 Z92/JatSynV1wqtWNB5VUgC7kYhOMn7sEK7rlzZhB4UrL1ZA/OxaoVPW4D3nyF57pw
	 YzEiCCtMA2Qqg==
Date: Fri, 21 Aug 2026 11:22:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ludovic Desroches <ludovic.desroches@atmel.com>, Wenyou Yang <wenyou.yang@atmel.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: at91: fix autosuspend cleanup during teardown
Message-ID: <aogYAmDqlgmnEd3X@zenone.zhora.eu>
References: <20260808152654.2943371-1-lgs201920130244@gmail.com>
 <144ef4b2-a200-4634-a4ec-539a0ba9a15c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <144ef4b2-a200-4634-a4ec-539a0ba9a15c@kernel.org>
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

On Thu, Aug 20, 2026 at 04:50:13PM +0200, Krzysztof Kozlowski wrote:
> On 08/08/2026 17:26, Guangshuo Li wrote:
> > at91_twi_probe() calls pm_runtime_use_autosuspend(), but neither the
> > probe error path nor at91_twi_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() during teardown.
> > 
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped.
> > 
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> > 
> > Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
> > error and driver remove paths.
> > 
> > This issue was found by manual code inspection.
> > 
> > Fixes: d64a818859af ("i2c: at91: add support for runtime PM")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> 
> How many separate I2C, drm, crypto, hwrng etc patches you sent?
> 
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
> 
> Group your work per subsystem.
> 
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.

Is this a kind of LLM command or what?

I'm going to check only the patches that have been acked and/or
reviewed (people have spent time for that), for the rest, please,
follow Krzysztof's direction, put them all together (or ask your
AI to do it) and resend.

Thanks,
Andi

