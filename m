Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43992C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=; b=RZ6gDSMaZJT9EG6tj60lCC3XGz
	GWwtWcyE/XqndQYeBAayAReuXaC03nAueyp4vIO1yNlaxeauv2TIbUSwHdVFpY4XAAZuYK04fPFit
	t8f8UP/z2LrptpI3joDn08R6AxH4SII0CYSQm9azmh4RpgfD//sHviis8cAANwTX6dWOrEOqlv10G
	8RTwubapj02RAPCh+uhFIvzZYhX3CM4UIrUWki6LUmLfQyI/qG8pcCnsaxAq4yvlnWgIkvQVyK9qX
	tRQ5IpQ/96gYEvdIWE1UDEPk+yuXLdadDSIIOtFnoTF94cRocd/9IqO2P6YpLbI+FH9/c4HMKmTtq
	r9kAdx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x363y-00000004jjy-1sVb;
	Sun, 06 Sep 2026 06:09:10 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x363w-00000004jjD-16q3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:09:09 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6b8ef7de4bdso285046eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788674945; cv=none;
        d=google.com; s=arc-20260327;
        b=NqLcJncWihh4hymPKn6hQDeFu5Gfixo14SUC3spxpXuP3UAvaJlOPxj2zcPOy8sBhR
         6fTJx6W7qLt4/l2qL+ffeeJUt43FJuHuFzMpTJknm5A4Sixf3HKcZqRaX5rHR7GLjA2W
         cr0KVx0ytpp4PVHp5Kuk8lGy84Lkmr0wiVt1BzVovPQrG/RBvzW1JDRtG7V6LMT8W6z3
         dUzESswnvVLlhDKXVSYuY9DlITQ22leeGL0xIKoQuqJceJC8FW7PQ6AiGxx4nddS9zms
         XxEloVXoYeR27/pR2xkqiJNid6MltbuERGdjnV55slu0odDn1WPR03zmkpxRGEBpe0mg
         bCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=;
        fh=K+BA5F2aj8ki1wk3vWRVPDaOfu1MzNRuNgQxyz+brf0=;
        b=ilar3IZLoDDT782+K/Bop7kMuK9iCNwwq3s/btJ0+MI9k8IL6NYZgS7CsRZ7YzqsMP
         Iqqw0UbmKyruDW/580/8Ohcl0wr928T9Ckj34DB8ierqrJm6x10DwP579E0wGG5WBYan
         TdWrtWHQCeTAuIUrx/la920s58mqkq1DiqfqXKxKQKkNX8J1iGM491ZTv5/Qix1W9nFa
         MNUJrSOPK9u74eg0AW4WuPyNBSk22qzOxHxrZzRApS9IU/TfQ9xUHqeV9j9tiua56yZe
         Elq6MjGAANOxx791NQ3FYIqPXCtY/Gt1Tipjj5bdR0e/91DzQ1rSVGN145uAQ74ydRaS
         YYLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788674945; x=1789279745; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=;
        b=TYI98P6C/58q8hS6rHd2d5vDMzWab58jk4fxEcI0Ne0kvgT4PhVyUt8AhGgmV/J2Cg
         8FXhIvEHzr0HhlBCkXFW0ExyafoFwDSOCWxFCkVvy5sTPgSWcsID1lkQkqiOsW/d+X2b
         VLHwNko9SZWFapNOyI6+6UVpDMY8UPdFmJrHyACeXfhc7yIhi+HML1C5fGJWdDjLj1SK
         GQc3i1YHp+vlqWcG+aEJ73PxuYD1jgMYd3xNDTNG2t4YfEo0VdSIKnpyGXNx4SL1rNdd
         tLPprFxqB07v8dXCt/dgCuvHtZcykJ9ElxSKTMuXGQRhYp85Gdl/3TMGxrj9K/fdr8X8
         Acvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788674945; x=1789279745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=;
        b=Ylcg7zzMSoA2WjmN2vi5Y2WefEcHt5folxLTrdLFMoPG6nlLAQUfPsct6mYoD+i4dt
         ZHDuknF9nSMLzwaWlxQdcog0RaAYA9h95yaTB96152LxSpUqGBTt8erqU69G8nsbXhCb
         eo6SrmngEeP/3aibzZBF00bVVBlhm/BDsenuYZntQ27LM/8MBvcXhQfSJVj2MfxBOXce
         c0Wioko784K9YVGduhV+jhiMBNctLgdUOVyJOy/0413UxxLgWSR9Hh5zVYLgRu0u/gUp
         F0Z1uP9Ihj0eMOm18AFv5ReS5UZz85AyfVDdRhnnIllHAOZUp2xxsRtmT8+7OCFliCfr
         LGSg==
X-Forwarded-Encrypted: i=1; AKwUvBx/IGFMgMHQRUV2hcCLeXJSIFSuuDcYU6JrDljFgt4PEPfgrzZMKn0t+YOLGNwpA4k0GdJoaZMk5X7jnSDY3M9H@lists.infradead.org
X-Gm-Message-State: AFuF++lHGkc3zQ5txxpYheRSKzR5lPSGMSMcztY2Mluuy848B3UaMFwp
	1VkYpCXD14x9u7blAdvkOYq1tWs0soDIk/UoSRX6wywZIBOX7G62GhUJM2oFhjwjurUYFsCpsOj
	4BUEPsIqElILneyXG2VRmCbUW06noQKA=
X-Gm-Gg: AYBFou16gt0AQbi0u/hbtQwP9/+OeHNwl5ZdCR/zKoRvBGwMpZ8Rt1oTdqiGb6ZmO7H
	MbWJDSl+5ax4Bz+MS0IgYnbnge6nbHazO2LPLWqMW83TshhTzh1GQyyFGSIP8NoP7Iy5l1EY6VX
	oczKmvg5ZaQislXDfp5t7bZKJDbpHXQkWDp+H8NqKOqKQqZZulStPFIGn0GZa/tY1U+bmu/z7gX
	tAGHnMulwNwtbPn7gfS5PXAfqSxukTE9FoBk//bNMVp0xK56+aYLKZv1jMdPV5743iDzGW6RC5U
	0gaZb1Rjik8eUNBF8/WYqMfnlBhzC33uKXeB33W8JpQteXFuBrz8xQ==
X-Received: by 2002:a05:6820:1787:b0:6b7:8396:f3ce with SMTP id
 006d021491bc7-6b78396f87bmr7383804eaf.48.1788674945534; Sat, 05 Sep 2026
 23:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com> <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
In-Reply-To: <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 5 Sep 2026 23:08:39 -0700
X-Gm-Features: AcwNN1XV6eaC-hb5tnT2MKyn0nOE60V4HfLSORk_N-jEL_PXVgmbyJgM3d_DMic
Message-ID: <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Alexey Charkov <alchark@flipper.net>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_230908_316971_DB21063A 
X-CRM114-Status: GOOD (  22.66  )
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

On Fri, Sep 4, 2026 at 2:36=E2=80=AFAM Alexey Charkov <alchark@flipper.net>=
 wrote:

> > See arch/arm64/boot/dts/rockchip/rk3399-base.dtsi, hdmi ref clock is
> > wired directly to VPLL, and dw_hdmi-rockchip calls clk_set_rate() with
> > pixel clock for ref clock, see
> > dw_hdmi_rockchip_encoder_atomic_mode_set(). So at least in the rk3399
> > case VPLL is supposed to support the required pixel clock. Without the
> > first patch 1366x768 mode with 85.5MHz pixel clock is just rejected.
>
> I strongly suspect that the dtsi doesn't describe the real clock usage
> here. The TRM for RK3399 doesn't show any "ref" clock for HDMI, and no
> TRM-documented VPLL users look like anything that could connect
> directly to the HDMI controller.

See "1.1.11 HDMI Interface", it explicitly mentions 13.5=E2=80=93600MHz inp=
ut
reference clock

> I believe something is hardcoding the divisor (or leaving it at the
> power-on default) in the actual DCLK of a VOP which the HDMI
> controller uses, instead of modelling it properly as a mux (frac/div)
> feeding off VPLL via another mux - both perfectly representable in the
> clock framework and already envisaged in the clock driver, making the
> PLL table patching unnecessary.
>
> Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> depending on which one your HDMI controller uses)? Your clock summary
> already shows that something is assigning its parent to DCLK_VOPx_DIV
> and the latter's parent to PLL_VPLL, so rate changes the current
> driver code does on VPLL propagate to the muxed and divided downstream
> consumer as a side-effect rather than as an actual rate request.

I don't think it is a reasonable ask. Wrong clock for the HDMI encoder
would just result in non-working HDMI output and no feasible way for
me to debug what is wrong.

Regards,
Vasily

