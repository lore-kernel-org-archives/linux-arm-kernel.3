Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0975DCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0t8B9KiaKml1jWkv/ehgW2nxgxFMiIhxgi2j8Q8oeTs=; b=hzpESuqApyHW+IyWcxYS0rFzHy
	fVpOR/FWzy8IZhsYaZSIUsZiz1vW/pMLdp/e5Hn55Az6EBNj65nLdogiXCQU3rDjAeGh9g3QZoega
	LgnakIQhDGbrDxoigRN/qx+IaeB4jrLvQq0bOfHk1hL5l5h9xPp7fMpeTNHNZtu7KcdD/h2EPAvsx
	/Grxsy2C/isVml5/0hq/yGap3QbSygxZzUVhq+0rrd6ZDUhqVkD7cSYUIndMINzJ/GVmMu3PVJElu
	yEruxEpFeOIytjoswuE6FybyvWsQiZbhHzk/dWqfL6UwRjsqa0yOgFOGNQgqR/PVpbJjfU6F0E4VA
	RyyEtm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbylD-000000067Ce-1lmt;
	Tue, 23 Jun 2026 10:53:43 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbylB-000000067Bx-098L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 10:53:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso2055516a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 03:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782212020; cv=none;
        d=google.com; s=arc-20240605;
        b=USCTfmN6vxo+KIN6f9HBqEYQJyYRiqyvddzFCAoSH1e2610TgE1GR3NYHGkNd4U9aG
         neZwAUivhMDXXx07TRu4KDETFktOT6W4d8OK60GS8LyJkPIRAU9xrtbI4DewjJcxfBPY
         oy7Eg5geovuALiHE7urKgp2oa63vq/RaP9I6AesrLqam8i0LdLCaGYIPqrpqun+Uv3pI
         sIn67lZG8L9H0dJ08IKIrwtZxbNzWCO2Wiu5UyU0Gdz3iv56DL3XwCa8ErD0n6uCoPp6
         j610MYk6hXtP0fequIf4uRutRJZdavUDxn+qKEPRTI/dMXVleYc2UmTPoY8wx55uX0QO
         pg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0t8B9KiaKml1jWkv/ehgW2nxgxFMiIhxgi2j8Q8oeTs=;
        fh=LIHZNankeqr0xq9Yii8BjJ6+sNRF1DAXMtqcXoaI5Ys=;
        b=dxltUXuoOXp0VGOZF00Lg8Ia8b2ZiwcMxfJzCWTkfV853i54IemP3u4pUQ5bxrdr/w
         oZamqISa3CVWzaZzXIQuN9gKA2KwqwMJeAPBkxbj0p0fqCn26hCdbXjudhjfHFnj6byT
         DHGmIgGenBvkX4YRSdutOute7RQpec01pW8z7uM+U1qWD7hXAbTijb+OFSHNwmEgU5vy
         yvvYP9ka81vDBkmLPlVwk7RgYPKkbIm2NvB1p4fOvO/IAy0jv9hA/IZ0Ice+abad+PbF
         yI7ATftsKytAVJFIysLNqP0fiX0c9W5xKliURykPhAN75erSo0RPgNh5QRXkn9RvnJQv
         EUmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212020; x=1782816820; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0t8B9KiaKml1jWkv/ehgW2nxgxFMiIhxgi2j8Q8oeTs=;
        b=jvJtctBFMlxY6TxNpL0jkiOw5Eh6o71lGCg++ZuuL0bA2wDHqTJEEXpzfgcZu5oE43
         RsMb0f7YUrmmHWrb2vqpl9+8BHXAW3zgaIVzk1Hum4FRA/KYh/JxAPtKR6P+f7VmF8k8
         3XVOZL4KjsRR5jrzSTVbxicT394JF29cCkxjMMUZvaVAyfAQhFSxST5kZ8V340rVKIOu
         t2Yx6/ua7EkZ6CSQptE8V0PcUbvL7UA2N0Dews3jDl+O6NG9W6D2rkM/PEcX1lRE1dix
         h3FGmz5/ZUCTF81M4GTuBsOOXZObd/vkYPItx7H/RhPhkmTy/KbImeHNUM+f6F9OW69K
         4gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212020; x=1782816820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t8B9KiaKml1jWkv/ehgW2nxgxFMiIhxgi2j8Q8oeTs=;
        b=OO3Hx5UCMfTlwlhGLspKpzTCW9a6hgaYvukMJpzVJSK893tznJNP/u7X4kyJy7NIB3
         Mi4APPxFwyJ0s+odRZMMx/5llhcmYkRa6ApnnpHVZvq6/QqR7euAXLQCZLcYOE58/das
         DcjkvkaDs3UJqrsbeZZH8IUsrihEU7+QpILT8i6GYCQZVY7y4uQDcaY5jui46KeoLg6M
         v5oqB3cG0fHEllanAL2msJ7O6uPMa7OgPCZiYIhsE/Ue3fzk1tgNS8bU7Sbz/uc9f9yJ
         kkPKr0PHsykYGeusUUUrjIfMffjR/04mmSwdkCI1llci3kQJBeTnyCC0LbZBisrmMuGL
         5qYg==
X-Forwarded-Encrypted: i=1; AFNElJ+XMibDTbg/e+KE1M/5GYK/pysnsiJByFSqUaBIS74o6xo+GFXYAIGOVhZ59O/kc637e1+hT2qw9QRAaR6jdGlp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfiqt4pM0WlK7OfVc9lSdAqDsjfJhtZ6tewIG50NytQlrFo0n0
	0Ll7ycQKSZ6JrlgMP5ga0VPVUtEWOABKHiMl7e+ZQ7qTDsqWpfHOCP6JKCGNTHgXhmHqd5p2YE2
	5u7KTM0q/ym8zHUU7cQ3K3KmDNnPyzm0=
X-Gm-Gg: AfdE7cn9tJUrR/dkirp5VUcB6t9ovvwSpHNVU/TwPIT+8NI263vCggiO6gMlrNunoBM
	sxJc1hS1SIuOqkKXP21f25I60KpNHvg35JfpkotDJd8XPnXG1o08hZ0kpV/f4Q3GlrfZ1zMS5h4
	+pYbbIFRFNwBPHaRjtvfMyA8/NW3Z3kQQPsRdSfph6PWRbaLpdRlC83EYkSMcBTiWxz36Z7xzdA
	xCBUlyAH4jv8nXTH6sYloGIIY1gUinjMAHPtD3G+h6GzrT76QE0qSg5p6eg3dP+ZkGs8NP2sWVK
	hRQ33dRyTMoXzPnalGXWszVsHs93wk6rXpovRg==
X-Received: by 2002:a05:6a20:d045:b0:3b4:904f:c9cd with SMTP id
 adf61e73a8af0-3bc5181907emr16930605637.6.1782212019669; Tue, 23 Jun 2026
 03:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260622005613.21870-1-phucduc.bui@gmail.com> <229ba136-66eb-4a30-a316-58377836b4dc@sirena.org.uk>
In-Reply-To: <229ba136-66eb-4a30-a316-58377836b4dc@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 23 Jun 2026 17:53:28 +0700
X-Gm-Features: AVVi8CfJTdkORwgI_XliseheOLtan_Kjx0p8qfbLbr6t29reUwoDQB9fLtkHz3Q
Message-ID: <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control
 exclusively to Runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_035341_087510_0C09C6D6 
X-CRM114-Status: GOOD (  27.90  )
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

Hi Mark,

Thank you for your review.

> >    1 Reverting back to devm_clk_get() to remove the implicit devres
> >      enable/disable behavior.
> >    2 Manually enabling and disabling hclk explicitly only around the
> >      early register access before Runtime PM takes over.
> >    3 Dropping the stray clk_disable_unprepare() at the end of probe()
> >      so Runtime PM solely owns hclk afterward.
>
> Note that runtime PM can be disabled at build time so we might not have
> runtime PM at all...
>

Thanks for pointing this out. You're right that with !CONFIG_PM, the
driver only relies on the
two manual calls to rokchip_sai_runtime_resume() / suspend(), so hclk
stays enabled the
whole time. I understand this is unvavoidable in that configuration,
throgh, since there's no
Runtime PM to re-enable the clock when it's needed.

I'll update the commit message to reflect that the driver uses a
combination of Runtime PM
and explicit manual enable/disable, rather than relying on Runtime PM alone.

> > Links:
> > 1 This change is based on the discussion around manual hclk handing during probe(),
> >   as raised by Krysztof:
> >   https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel.org/#t
> > 2 Background for the earlier devm_clk_get_enbabled() conversion:
> >   https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/
>
> > An alternative approach would be use devm_regmap_init_mmio_clk() and let regmap
> > manage clock enablement around register accesses. If preferred, I can rework the
> > driver accordingly.
>
> > -     sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
> > +     sai->hclk = devm_clk_get(&pdev->dev, "hclk");
> >       if (IS_ERR(sai->hclk))
> >               return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
> >                                    "Failed to get hclk\n");
> >
> > +     ret = clk_prepare_enable(sai->hclk);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
> > +
>
> > @@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
> >       pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_put(&pdev->dev);
> >
> > -     clk_disable_unprepare(sai->hclk);
> > -
> >       return 0;
>
> Are you sure that the runtime PM state there is such that it knows a
> reference is held?  The driver used pm_runtime_get_noresume() so the
> device didn't have RPM_ACTIVE set I think?


You are right, pm_runtime_get_noresume() doesn't set RPM_ACTIVE. I
think we need to add
pm_runtime_set_active() before pm_runtime_enable(). Otherwise, with CONFIG_PM,
the pm_runtime_put() at the end of probe() might skip the suspend,
since the core still considers
the device suspended .

>
> The runtime PM API really is a miserable collection of landmines :(

Yeah, plenty of landmines indeed :(
I checked, and rockchip_spdif.c does use devm_regmap_init_mmio_clk() for hclk,
rather than wrapping every register access in pm_runtime_get_sync() /
pm_runtime_put()
the way rockchip_sai does.

Best regards,
Phuc

