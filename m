Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE77C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=; b=I1AnZk8qD1HcLwl0GNHNHYKrsP
	TJCQQjVrnix8vj38RCUvDX7Na/3+5/1Lp/0ddaL+vBcMcmfymgynOGaD1SkXhvOfCIZYSqqwPDDEC
	4CV7nkxuqSLSmxTwnJdtpoK2mUOYooj+deh5JkdT79VfEYHL30q4RPWXn4RO8KCkRVGXM6V2cb7vS
	4N2rjXzCDMQlTRYG+DFWJiLAWn8E1WKSHc3aXFMRvURAmM3FcVQnAUH6RQwODKYs/eJNu9mROX8YW
	TsI8flQCzggL0aEYfpugYZWKVYo5zDsjd5OVCu3g9d/dKFLE3y1E6afXjqwIHgc0xTzEqfJaemFrP
	hgnQPD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22xm-0000000GofA-2nBM;
	Thu, 03 Sep 2026 08:38:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22xk-0000000GoeM-41k8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 08:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=; b=oiwq3QNHUkCrcDbE48bPeKSjCw
	qqP0YctVCrVrwg5L/Wcu54U0vrpy966+7d4AAOqwFXkZstAqOCL1HsoBMlvGC8p5IJfH4e8ZIe3FK
	lMmyOXegD2D7uBZJXxF/c797/VYDU00bP97jv9oQ6kKAzl8pfgL5ohi4A/JKzfCiKiswVn3ZrmqiG
	2Vqnu/ubWXJkSjB7PcYrjTLYsfkAsUWDaKdGnmqJRmx4TnScZZAQdwJKqBx+3GT3mz464vUH8RTvA
	JCd4Au56JN5nO/uOerISnvl6v6+8B/Ym2QUBOf0HsGK89MYTzxIFBydLkhiNPOGbk+JYQl4bFmDbi
	qQUh9cFw==;
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22xh-0000000CsC2-3ahR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:38:23 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c254d2a2f66so86516766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 01:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788424700; cv=none;
        d=google.com; s=arc-20260327;
        b=l1dE17i+453LonP7W3lAC/rxmpFhqp/qyicJY/338q2DEcqMxuM3Ai1R/HzV8txWLf
         a0oXesggjI8RY5N6NBy1a3YAJKJr3fGxdPcSY7cKbl530jhaadnmf9R6G1CXttvnzdKK
         ZZKDvmJA5Q1KWjA1YoZDZV5dDyLZo7y8bBaQnTHLhKM1bbPmLLnSrLsJngOYzT+NsHqo
         vjAQ9vIE80+7MPa6cMscJ64piiXwTkhAXQ2i8Lk28XSUUH789Phcj70en3kqtfjaj83l
         PDxuaNC+mReBDmcplKHmgbAE9xxdBHJO/F0/ixee4uXSNyi2BtovRPPgQKStCqf9QzL6
         OSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        fh=zJMpHRFjMMTElYRaZEMHyQ1frKFIcjWgJJIe9Dj0oBk=;
        b=g0S65DHZ3qeSEG/hNH2v22gNeYVeLqwmuH92+YoIJOpTuqjK6bNrPMmA3B/FsJyl1S
         CnP9pbwMJGFAVVV0keC0PNO6zVL1QdnNEZGhtyUTUlf49j6mKkYT6mT36rUcH+oZVP86
         hTXXXHFANH7PsMpl93Ve/QW1QS11w9v08EHBaiYkOwo/O6t2JSabyaViiNcrzBp7agEz
         loJovRT883/CV0KzuCUFEnwawxu4XmJ47pcFggvOP3p6xIxaMvUz8qI1/NpgeELk8aY0
         JicR9ZvpIz7IK+f08G9e3cc3pxh6bSAtbWuvwvTZ0OLbKPz031qLf9I1UX/hA2yyocC1
         Na8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424700; x=1789029500; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        b=fk5SwY5y0Vn0ocY67YUZ9+SThUekWij89Nq6bZtfOkeV3mDcyAVIcPy4zXGJeViEoW
         YMZVkqlouP1HE71mZ7nMz9bGlfKQrOYDVZHi1CyCpZWfOrhHZl+diK2UC6FZa4bREQ0Y
         IUZ01C8O+wbMOGTWPM+zNKbh34ZAezCI7OwF57pYxhL7/zDUvorW4k11b3JtJopDF4fg
         FN+FefNXpTjR42UwBI+vR3FRW4Ur5SJwB74Fi0sg946y0sKFjM/xxHcqMsv0DDHJmu1k
         xKjZoGs1R3npdGpUBZwCghCtRrmGPNNBRKbp0pNYG/9hfGuTILA3q2/No9LFHjCdZ6Ql
         lEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424700; x=1789029500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        b=fY/FlAG/RLuFCm4yJtBRFTQvNhMsSw6U+ZehU1A4pTK6CNiHtUDvkbNECu74DmN3oe
         3ruEq7mzVP14dl9K8bGs0nGca08USmdr0o4ciIYXrq9AML/OoBm0+HUKByyOdWvwjGzc
         yTZBs01jWy5+DRi/W6pcSYPFkFRGp4jnAUcRJkFbv8UCqHQk4u65ik/8SSM/6w8RoPf5
         f5noicK/Tw7UOvkOFBb6BItYDH/rAYElZ3sucpwIGCwFGKrouSES8t22HvV4UOmVTvL9
         aducap65DQVUMq3IQJ0KT4PYoCucgJghxP1ZIBNdpDiruruCTFGdfv/fhPNuLt5URg4v
         LynQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz4gRnihk7s2TfqvsBwCXJ4D9R6m5+4uIgtU5V8gFyZBI24bSFRgwRVyoYr/1Pljr0V4mIH9Q3adTBHMINkyKv@lists.infradead.org
X-Gm-Message-State: AFuF++nbANKfpM0M0t8U89sGC3KXMz+xhfzNsqxVXIxg7Cc1Y4gPuy7z
	Qritg1gWUGGZW+Y127Y2tF8jWu1cLbBbF59lLtYEarPkFSvI09dsAcyTQRiNwv9BOu5xX9AsMbV
	qHDE95hEHd360xiE+AlsVSb20vMxeiRE=
X-Gm-Gg: AYBFou2VEjIqiKjfH7PJS2oLv70x7PD1DNdTPkUVkM28tM5Mw4A5ten+uShIFa6n0bp
	X6gslQl/AIe2VSIp05cbRUetppzweG0DimMAM5VyEXon60mE5gu+UAB5F0n3GdhdWn0xlzpOK+Q
	z5Pcyqu3nQNUI9pfJ0tcTaDTLbSLkjhxLm6fP5H/cFhb0ZQkiw39LzMhLKINAAitQ5I4wf2pURb
	AmOLZ6TvsLZUGPbb4EwmQd2F5K7xqoMHpCCxbsvI4K3OmKGVU1xv19DSSu5sQD6+0/G2sKNyzoj
	hz0qjyz9P5jLlRPGcL7TmYn9nQM40tMbLmd+sCNtMSioN89SLcH3ZKve817TGWg=
X-Received: by 2002:a17:907:c71b:b0:c20:af9d:4533 with SMTP id
 a640c23a62f3a-c25d560c603mr627292366b.19.1788424699559; Thu, 03 Sep 2026
 01:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-9-coiaprant@gmail.com>
 <f07c64b4-3018-4e9d-8aea-12454f132419@bootlin.com>
In-Reply-To: <f07c64b4-3018-4e9d-8aea-12454f132419@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 16:38:08 +0800
X-Gm-Features: AcwNN1VhuHjbmY1CA9bSBTxLCt2mOIIUXarfDkLXAsSy1buatA_CYmYfdE_lEPs
Message-ID: <CALj3r0hxSOrtRwOmAQ4Vw=nEkTfA+x93KzpAdG9m=xWFYbOuTw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 08/10] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_093822_063489_53D582BB 
X-CRM114-Status: GOOD (  30.60  )
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

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B 16:34=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi
>
> On 9/1/26 17:01, Coia Prant wrote:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be
> > connected to GMAC0 or GMAC1 in SGMII mode.  Add the necessary glue
> > logic to support this configuration.
> >
> > The current dwmac-rk driver does not support SGMII mode.  SGMII
> > requires a PCS to handle auto-negotiation and link state reporting,
> > but the existing driver only supports RGMII and RMII.
> >
> > Add a set_to_sgmii() callback to configure the GMAC GRF register for
> > SGMII mode (bit 7 set, interface selection bits 4:6 cleared).  Also
> > add a supports_sgmii flag to indicate SGMII capability.
> >
> > Provide pcs_init/pcs_exit callbacks to create/destroy the XPCS via
> > xpcs_rk_create() from the Rockchip XPCS platform driver, and a
> > select_pcs callback to return the XPCS to phylink.
> >
> > While at it, fix the clock enable ordering in rk_gmac_powerup():
> > gmac_clk_enable() is now called before any register access, including
> > the SGMII mode setup path.  Previously SGMII mode would bypass the
> > clock enable via a goto, which could cause synchronous external abort
> > when accessing MAC registers with the clock domain disabled.
> >
> > Also clean up the error handling in rk_gmac_powerup() by using a
> > unified clk_disable label, and add error handling for the default
> > (unhandled interface) case.
> >
> > SGMII In-band vs Out-of-band
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > On RK3568, the MAC clock is fixed at 125 MHz and cannot be dynamically
> > changed by the stmmac core's set_clk_tx_rate callback.  In-band mode
> > works because the PCS handles rate adaptation internally.  Out-of-band
> > mode does not work because the MAC would need to change the clock rate
> > to 125/12.5/1.25 MHz for 1000/100/10 Mbps respectively, and the clock
> > is fixed.
> >
> > Enable default_an_inband for SGMII and disable the generic stmmac
> > set_clk_tx_rate callback.  This forces phylink to use in-band mode,
> > where the PCS is responsible for speed/duplex negotiation.  Without
> > this, the stmmac core would attempt to change the clock rate on speed
> > changes, causing TX to work but RX to fail.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part1%20V1.1-20210301.pdf (Page 386)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> [...]
>
> > +static int rk_pcs_init(struct stmmac_priv *priv)
> > +{
> > +     struct device_node *np =3D priv->device->of_node;
> > +     struct device_node *pcs_node;
> > +     struct dw_xpcs *xpcs;
> > +
> > +     pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> > +     if (!pcs_node)
> > +             return -ENODEV;
>
> Here aswell you make it mandatory to have a PCS, as the generic pcs logic
> introduced in patch 1 doesn't handle -ENODEV, it treats it as any other
> error.
>
> So, either you return 0 when there's no PCS (so that we don't break platf=
orms
> that don't have one), or you handle -ENODEV gracefully in patch 1.
>
> Maxime
>

Hi,

Currently, `rk_pcs_init` is called only for SGMII, which requires a PCS.

As it stands, only the RK3568 supports SGMII, so we won't break anything he=
re.

Best,
Coia

