Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916FFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQDSv2OwEavGfPD7QFHW1wvt5oA5GKyg6BpElu5hA3g=; b=G2RwWkFccnR7psx0g9ww1QpRE9
	lY5bP6726mm7FqJNvwHTZJ7H4dB1K/pprm6OGV6TFaI01eRszsbSHEuNpv9J1KmcqrGwRsdmZbU7U
	Q66GNw9tlVzFcOy9tZg1gK3gU9TnosDDRMx7Yui9679+pHa/f2zsB/LiUkMVBF6H89xoMXEM3uoKM
	SFnxFsrEsH4N9TTERgiwLWM5ewrKUMDt51hIS4oQTxFR3sfnt6NBC8+zvEa+uHv9gjvU4H6c14a/j
	Az1C2Ja7On6LkrSSWR4MJu7ZeUh/UMquri/jokDXwcX6tZxEzuNHt3YYcAbnXvVJgW0U/6TjhY3co
	4EBqN29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk74y-0000000Fvp6-0Ufu;
	Wed, 15 Jul 2026 21:23:44 +0000
Received: from mail-ej2-x03.google.com ([2a00:1450:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk74u-0000000Fvnt-0bdt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:23:41 +0000
Received: by mail-ej2-x03.google.com with SMTP id a640c23a62f3a-c160e831693so102400466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784150618; cv=none;
        d=google.com; s=arc-20260327;
        b=W4pdF0oQLsyQbqW+uUXs+ZjbSeGnvUcCBBMl6PCDsDA3apn/Q3XTT40iIHtquHciDM
         4RGqKJgATe0jkkHEaZityczigyjWKHg4ApPtlPUYP0ibA/83U7pE9yA2zoBbPB2NXY7h
         iluK1LOMCLGPFYqTa5a12oi8sQNjiQWYXlVj2ZJytRVcuydu3AvXG+ytGbMmo8ySAtaQ
         ESSLPFkTvlHPGhcVDhaTOL8zVKh5R9b3NZSmj/Wjjrh0NUaNI0u8WvEL6bnarJoOIIUy
         Ch3yQPA6U82bAIuZWhjZ6AAZkL5XSOexbzvUaqEJojeAjOJLUs+qa7VTDXTHS9xJNDPZ
         jKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VQDSv2OwEavGfPD7QFHW1wvt5oA5GKyg6BpElu5hA3g=;
        fh=xcwh6Ls3+1p2cF6MpSTgkJf4Y4/VOnVt5oydB1raqhA=;
        b=iE5jnxI5wx3Banof8HtM7NzZFhR8dnXj1+bZh5CtBYuQFnrIblbJyqLaMrtQ99Fx0f
         sRdysruHpUpkJCtB2V5yMDN/Sr7xjsfd2pclp6vXt3bXLr69ZpSCrqApfQbBWwd/GlxO
         EK0LCYbnDJWSWjLVCyP7r+JhTRY0tIj1oeGY8HZurTOmUuRS7MxJsOqHxQYEfy79QA5y
         LcivRNTFTSRlz2A64LztfWwQ8V6AbgWOHazkw8+ugvqcnrPRM0XF3MGkTH7uEPMqVvmY
         5cl+X8nwHKf0GEjYL/4Cv/vN9onWHtjVFI9xzkUU9AXnDf53oO6+tuTVuBlUCM9M0vyC
         nO3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784150618; x=1784755418; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQDSv2OwEavGfPD7QFHW1wvt5oA5GKyg6BpElu5hA3g=;
        b=df1ajmtSe31lxe3O0WrgWUVpvqUD3+QxxGPOKhAv9TndVuoRyu1Ez/RZcvKkyX4DqL
         so7kzCiTDzqOy8R94J77sC9SYWJIlxK4YISKWAuNfc36GdcUyz6oQl4kxM7vbclEt1fB
         ppFBKTcaZck+1n/r5eftdZJ0fooq5jgvJV9wHCkWFYQM5fUtBDokHXCMld73/27+Oca6
         sgBF4v++PiQgW0SKJWLu8eEYLucSescWdI8X+QijVnZPhn0KAnX0vV83FkQ7tpG6oNZF
         xmegGzcfCqzBG9Ycfgogs+6KdKG8LfA/aO81iylpX+MYdA3m/ySGW08X35K39yw2fZkj
         JykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784150618; x=1784755418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQDSv2OwEavGfPD7QFHW1wvt5oA5GKyg6BpElu5hA3g=;
        b=PMax6JB3E2JaYR5Ur6xvxjTiT0HrXrOhPNaeemIgymc4ZcjMiOU6qAd7mOFVAP6CEK
         p9JmsBpPN/vhaBzeX4WDv6fOmYemoaUTaoLtikxH27van+4jIKgWeqaVt/ppFUPRgsse
         Zct9gsPaywfnz5Ptnc/UYXh86ag3C3OFPI3ECzpl6EXDEvuybHRUFTdKIPcJhh1ykEoQ
         j4vNXm8Z1lpV6ykuAKcYK5lw5ZshjeqGb+HFX3UPxXNAUY7MbeObbmhQpUNl7oaDP6vw
         yecBp4cW8JeOMmTiOT8/IwSkUDAbHOI6K3PMnh5538lvaxs6+coCxYlAYCklwd99+9OE
         1uSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rocba7BsgOcuP9QOouhSRFtOkY+VAtzKmYmpUG2I0xkk7AhwRRQfxS7NyFEGK1WoNNzJetN0fhFbhlDB94EzzOl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6cepTtEac3KFnoZL/o/Tt5y+vb870NUunTu96r+i44+fmAo6r
	AEilb2RfYZOtg5ia8Zgl/YVOJFp1/Mw7jgr8chtfj78NaDTE8fFvRKBE6GLLexZaUW/qr+CSUE+
	+C7tQHoOZ0ymft7eN31FES/qK1l+FUTk=
X-Gm-Gg: AfdE7clrPTg+XqphEXHhfQt+M+N2J+xPpCKamrobpISP3IOZY94TY3nRT0Jbjp6IF9A
	Q9uFR6tsRU19j+EVIjbSR4bkVWAMzEr1FOiMDDISP5qo72OyWDY4An8LuiibRVWgwuK1ac0G5NT
	IqC/TMIw4iAh9CJwClJ99FM+jHx8F3yFxOwvP1xxh2wBdgtnGjI4nK/a/u9M1j5TARUoUqEFD9f
	NFndWf3UFVRjLoSKY9Vkrana/zZjlXbZTrTcACb3PtbKvXVfjvfBlLkWB4wDdci
X-Received: by 2002:a17:907:9622:b0:c12:da4a:97d5 with SMTP id
 a640c23a62f3a-c161f404f86mr992959166b.50.1784150617701; Wed, 15 Jul 2026
 14:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-8-coiaprant@gmail.com>
 <4823c1d9-51d9-45fa-a96c-f2caab1cb29e@bootlin.com> <CALj3r0h4cFd-tp9-UVxihL9-a1W7_4nvnKoXW_cP5WECKc66Hw@mail.gmail.com>
 <1d92078f-3009-43d1-a228-c3e67a1f4f4c@lunn.ch>
In-Reply-To: <1d92078f-3009-43d1-a228-c3e67a1f4f4c@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 05:23:26 +0800
X-Gm-Features: AUfX_mxzLgLRVJ8_d4XQuIss8MuWS0O5h7pFciiDmngjjPthH3hDcKxQHuYBdj4
Message-ID: <CALj3r0gBnyEVwo3rK-dKssYN9F4nFn93QJ24FVv8YBLjNNgPmg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_142340_584791_D0117FA1 
X-CRM114-Status: GOOD (  28.47  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8816=E6=97=A5=E5=
=91=A8=E5=9B=9B 03:57=E5=86=99=E9=81=93=EF=BC=9A
>
> > This is intentional. The SerDes is attached to the XPCS node because
> > on RK3568, a single SerDes serves all four XPCS MII ports in QSGMII
> > mode.
>
> This is not the only device supporting QSGMII, and so the issues you
> are addressing should be common to many QSGMII implementations.
>
> Please take a step back. What would a generic solution look like?
>
> Can the reference counting be placed into the core somewhere? The
> common clock framework allows a clock to be enabled and disabled by
> multiple consumers, and the core clock code does the reference
> counting, only calling into the clock driver when state change is
> actually needed. Maybe the generic PHY core needs something similar?
>
>         Andrew

On Thu, Jul 16, 2026 at 03:57:22AM +0200, Andrew Lunn wrote:
> > This is intentional. The SerDes is attached to the XPCS node because
> > on RK3568, a single SerDes serves all four XPCS MII ports in QSGMII
> > mode.
>
> This is not the only device supporting QSGMII, and so the issues you
> are addressing should be common to many QSGMII implementations.
>
> Please take a step back. What would a generic solution look like?
>
> Can the reference counting be placed into the core somewhere? The
> common clock framework allows a clock to be enabled and disabled by
> multiple consumers, and the core clock code does the reference
> counting, only calling into the clock driver when state change is
> actually needed. Maybe the generic PHY core needs something similar?

Hi Andrew,

Thanks for the thoughtful question. Let me walk through the design
constraints on RK3568 and explain why I chose the current approach.

First, I want to emphasize that this is still RFC, so the binding is not
frozen. However, DT is ABI once merged, and changing it later is painful
and often requires maintaining compatibility with old bindings. So I
would like to be careful about the architecture we settle on.

The current design
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The dependency chain I chose is simple:

    stmmac (GMAC) -> pcs-handle -> XPCS node -> phys -> SerDes PHY

The XPCS driver is the single owner of both the SerDes PHY and the
power domain. The MAC driver doesn't need to know about them at all.

On RK3568, phy_power_on() is effectively a no-op for the Combo PHY in
SGMII mode; only phy_init() is required. So the PHY is not a
power-controlled resource =E2=80=94 it's just a one-time initialization.

Power domain management is handled via PM runtime:
    - XPCS probe: dev_pm_genpd_rpm_always_on() ensures PD_PIPE is powered
      (this allows us to use PM to manage csr_clk)
    - Each register access: pm_runtime_resume_and_get()/put() controls
      the CSR clock

This is the simplest model that works for SGMII/QSGMII today.

Why not move SerDes to stmmac?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
If we move SerDes and power domain control to the MAC driver, we
run into several problems:

1. Reference counting for phy_init()/phy_exit(): in QSGMII mode, four
   MACs would all call phy_init() on the same hardware. The generic PHY
   core does not currently provide reference counting for these calls.
   Adding it would be a larger change affecting all PHY users.

2. User misconfiguration: even with reference counting, if a user sets
   `phys =3D <&combphy2 PHY_TYPE_SGMII>` for GMAC0 and
   `phys =3D <&combphy2 PHY_TYPE_QSGMII>` for GMAC1, the same PHY would
   be initialized in two different modes.

3. The stmmac SerDes callbacks are legacy: the existing
   serdes_poweron/serdes_powerdown hooks are called from
   stmmac_legacy_serdes_power_on/down functions. They are marked as
   legacy and not intended for new hardware designs. Building new
   support on top of legacy APIs seems like the wrong direction.

Current QSGMII usage on RK3568
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
I searched OpenWrt, Armbian, ImmortalWrt, and GitHub for any actual
device using "rockchip,rk3568-xpcs" with QSGMII and found none. It seems
QSGMII on RK3568 is limited to specialized evaluation boards or niche
industrial applications. Even SGMII users are rare =E2=80=94 most boards us=
e
RGMII simply because the pins cannot be repurposed.

If QSGMII does become a real requirement in the future, the generic PHY
core could be extended with reference counting for phy_init()/phy_exit().
That would be a cleaner solution than pushing SerDes management into each
MAC driver, and would benefit all platforms with shared SerDes resources.

That said, I had an earlier test with serdes_poweron/serdes_powerdown
callbacks in stmmac, so if the community strongly prefers to move
SerDes control to dwmac-rk, I can do that in v2.

But my preference is to keep the current design: XPCS as the single
owner of the SerDes and power domain. It works today, keeps the DT
binding stable for future QSGMII, and avoids complexity.

Do you think the generic PHY core should grow reference counting for
phy_init()/phy_exit()? Or would you prefer to see a more generic
abstraction for shared SerDes resources?

Thanks,
Coia

