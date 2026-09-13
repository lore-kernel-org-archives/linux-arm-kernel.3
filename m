Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7888FC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GgFKmscdboa8YUQebx8X+ClORerurpSTCm28icNW3c=; b=taLctbce/uRuKqRSxTujTEH7Mx
	H2jeaoC6ciBxC3kk3Z7tAPGsnCJrMjhWqAmEKrthsIB+3LT2kH8iVEkD1clilUWztAcgIb8yeiwv1
	FKh400gwwXQ/E/fbcjCAis99ha7ktW3Tdlq+YiABCQlUbGFeWjJtP30J0cOnX54mOn1UbLEhNbqsF
	75p8PssI8qWuWqRlj/GNxgWkMCAvWsPHxQgkNy1RSfzp/1IxGSgBEcMDYb7TFIxWekkmCoXwu1BlQ
	p3/wdqsIY1DsZC4z4LG0OnujX9tyNZZ+Ixn4N4NjQgSiVGesLxa6tn1TpEYdqAAUZ6cVfdOdC+WUj
	BD3yh4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nZc-00000001qCg-2Hel;
	Sun, 13 Sep 2026 17:01:00 +0000
Received: from mail-ed2-x03.google.com ([2a00:1450:4864:33::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nZY-00000001qBX-3GzJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 17:00:58 +0000
Received: by mail-ed2-x03.google.com with SMTP id 4fb4d7f45d1cf-6a5d1305572so384676a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 10:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789318855; cv=none;
        d=google.com; s=arc-20260327;
        b=CgS9HCJEQ/a1bUrSqsuhFFSVElkJS02DeDw8z8oX1DCrsC8XQjfPwVJIqb8zRVP2lY
         Dw4fpw2e4x3MRppj1zrIn/N4w23MUaBXZghlpBes6+vTqzUQaz9CPt7rAccWj+5Ijmz+
         D0+kgzjvJDuPEhgFIfNgmeLMdU6qfMtvy8rwg/5BXMul+8gTafUHBUr5leOxMkJ8DzUy
         g1AIjRWY6XWIGe2l4a2wXyLw2VfM0YshIWANrhQgEquPOE18dxise6i02P8WNwhoNrIm
         UcuSSIuznfwI/N3LSFB29ixeNX4C+HH3JpwsTWujbgzEtpvLA4xxMhBiK1heM7xw+xEA
         dvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GgFKmscdboa8YUQebx8X+ClORerurpSTCm28icNW3c=;
        fh=s3q0RpPm1TeGEyQZW7uzemjrCnI/IwdpCbRpF4//i1w=;
        b=F+63kYkIJY8BboKKoiDmv0nlF8E4CbAcfUavnGGjVU02xec2+UYsaSRsBVbvQy8YAC
         JuvO566Ms7zfXcmP7HEChct8v87tawLo9CISpt1CyHYYya4c61WxQ82MhvmkMyW209s8
         uiFFas63WU+8qHTQoG0gu+ZxYU4sp0kLrhFlSOFNv6uojpl1afCaOE9aRstdJyNjkmkL
         mX7bHwkqQNQ/cb3YE3yyoKtOccCC31kHxJwywLAFfIMzPowX+K4p2kcAaeCxqFFz0Mw2
         RMG5sLF9gV5nafFnIGGk+kkOk0VgN5MBVFZeHbvK0GMrb4k9ERgupXjtsVZtjt1ha+mX
         LPQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789318854; x=1789923654; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GgFKmscdboa8YUQebx8X+ClORerurpSTCm28icNW3c=;
        b=aRf56FEuoeD9HbQkkgjzBkChhNPAir6sjzF7IVj9Um4dEaOwyzy1jhseP0ZbutM3F2
         ceNOY2vGjncHZnnzOquER9m6AaEqligzacw9HWrH9MSju8axgjSiPhljXVCbcktYHpRt
         HO5/S2OA+tvSkWOFo/OHnC7l57yt1IncUlTQmJ6dcwV2ABkovdwkrT6n4lpjaWxh5rVW
         iVwsgjmT3aJOyHPOM4vlk4voy36HMdC8iL469ETYw0I6V/RVWz4nOKy8tuuLdIOhMB4o
         jCp07yEk4ulbHJR7o27Vp00QAzhlujYEkGwGEcleY+sxqAzK3wSkBrnh3mNtJ5Ma4gGj
         PV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789318855; x=1789923655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GgFKmscdboa8YUQebx8X+ClORerurpSTCm28icNW3c=;
        b=mcGUJMRV/lghKXqkUQglXjlh2ghbSJvCmSr8W7UUe3gJrqhlOag0U4TjNIjzETtjAH
         k6gTPbbjFBFYysiwHn5gCwKdWz9ES69VJfS4TjMk6MqZSEep0QkuAu8LlzYHenTNxJfp
         6V+tIC/mZie6SjbzbLctQIdhTHMuDiD7yeubajc1J9+Y37RBrcViJKx32qZwDMACkaP9
         uwmMJA/+09of4GLSw3A3UQ+8WazPL9KDV62591awaV/cV0Qts1A2UFxNbQJNnqc3pf3f
         77hVAXc6zFgwTrp/hBjyoP9RaLtj9aA9pDrUkSKP8juBHuptWBatZ+kZ0/XcbITtWwPm
         ORsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlIsY1UdJ1Durs1HM6TODjfJI8ghe4jbHNV/o1lI8XPzedjakCA1L3iWzfNLMv/C/nkMboX+vAVFsyYJhfWPKD@lists.infradead.org
X-Gm-Message-State: AFuF++lj+dU9LifAo7juN5Cr6fjgwfb4a+qxkPoPhx3TMYbddg/cZkNr
	np4JsxTDacV9izQiH1gjhVv7i5nwTx+BZdkq1AfTtFjm4gxF0dv6k1uX4Ix4gkvwCPENiMh1dmZ
	hcGptzl+RYsolx0o8+ReLwOsig0kLzJE=
X-Gm-Gg: AYBFou26s2CpfIp2fQ4FEiAzf95mTPBlrXdmkgSYvP7NO1Q8LcEkaPJufYWKMy2GS9W
	IL7kV/0mKcNoDh/bJeloKrPGO+cpmBc8HtAvQsSP+n9yb20tYHXHq7RqsWUX8VUhN6cKr1mzsZC
	zF2qAYy41COxgLdS0CNtHpBlaWrC8xr+CR/KIHp9d1V+9zMfI+w9wPX5/iv7XfvwEIgWpVJHDrp
	knaxX3LAkeqo+mGYG/DsDwfyi1I2zYuvxQob6N5SUM+PpQAfONCRsanCmVxlEKo+Na806g+Qs1h
	r2TLX0x1BJ/B0dCZALyduv+F8TdWtph8Qy8TR+yvgUip4HC3FOg4i4BSkA==
X-Received: by 2002:a17:907:944e:b0:c25:f7db:4be9 with SMTP id
 a640c23a62f3a-c29a4320d44mr166028566b.15.1789318854189; Sun, 13 Sep 2026
 10:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-9-coiaprant@gmail.com> <20260912201329.127095-1-kuba@kernel.org>
In-Reply-To: <20260912201329.127095-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 14 Sep 2026 01:00:42 +0800
X-Gm-Features: AcwNN1VFSFVNDDyXCKomI4goWrMNPOweHclbjvHYtAS5osl8bQhijCj1iDM_og0
Message-ID: <CALj3r0hkzYs8g1AqGuuENY0S2GS6HHk9_+UwPUUvazPmPjsyWQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 07/10] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, vkoul@kernel.org, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com, 
	hkallweit1@gmail.com, neil.armstrong@linaro.org, linux@armlinux.org.uk, 
	shawn.lin@rock-chips.com, david@ixit.cz, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_100056_918976_2801DEBE 
X-CRM114-Status: GOOD (  45.84  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:13=E5=86=99=E9=81=93=EF=BC=9A
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This adds a glue driver for the Synopsys DesignWare XPCS found on RK3568,
> which is reached through APB3 memory-mapped registers instead of a real
> MDIO bus.  The driver registers a virtual MDIO bus that remaps the four
> MII ports onto their respective MMDs, and exports xpcs_rk_create() so a
> MAC driver can obtain a dw_xpcs instance.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> A few questions below.
>
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > index e417fd66f660a..88bc40791e69f 100644
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> > @@ -12,6 +12,29 @@ config PCS_XPCS
> >         This module provides a driver and helper functions for Synopsys
> >         DesignWare XPCS controllers.
> >
> > +if PCS_XPCS
> > +
> > +config PCS_XPCS_PLATFORM
> > +     tristate "Generic XPCS controller support"
> > +     default PCS_XPCS
> > +     help
> > +       Generic DWXPCS driver for platforms that don't require any
> > +       platform specific code to function or is using platform
> > +       data for setup.
> > +
> > +       If you have a controller with this interface, say Y or M here.
>
> [Severity: Medium]
> Should this new user-visible symbol be part of a patch whose changelog on=
ly
> describes adding Rockchip RK3568 support?
>
> Two side effects of introducing PCS_XPCS_PLATFORM are not mentioned
> anywhere in the commit message:
>
>   - the "snps,dw-xpcs" platform glue moves out of pcs_xpcs.ko into a new
>     pcs-xpcs-plat.ko, which changes module packaging for every existing
>     memory-mapped DW XPCS user
>   - the glue becomes optional, so a config with PCS_XPCS=3Dy and
>     PCS_XPCS_PLATFORM=3Dn silently loses "snps,dw-xpcs" support
>
> Since this restructuring of shared code is independent of the Rockchip
> glue, could it be split into its own preparatory patch with the effects
> described?

You're right that this restructuring is independent of the Rockchip
glue, but the "silently loses snps,dw-xpcs support" concern is not
accurate: PCS_XPCS_PLATFORM has `default PCS_XPCS`, so when PCS_XPCS
is enabled, the platform glue is also enabled by default. A user would
have to explicitly set CONFIG_PCS_XPCS_PLATFORM=3Dn to lose it.

The module packaging change (snps,dw-xpcs moving from pcs_xpcs.ko to
pcs-xpcs-plat.ko) is real, though. I'll mention it in the changelog.

I'll keep the Kconfig change in this patch since it is small and
directly related to making the Rockchip glue a separate module, but
I'll describe the module packaging side effect explicitly.

> > +
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>
> [Severity: Medium]
> Do the dependencies here need GENERIC_PHY and PM_GENERIC_DOMAINS as well?
>
> xpcs_rk_probe() cannot make forward progress without either of them.  Wit=
h
> CONFIG_GENERIC_PHY=3Dn, the first probe step hits the stub:
>
> include/linux/phy/phy.h:
>         static inline struct phy *devm_phy_get(struct device *dev,
>                                                const char *string)
>         {
>                 return ERR_PTR(-ENOSYS);
>         }
>
> so xpcs_rk_serdes_phy_init() always fails through dev_err_probe().
>
> With CONFIG_PM_GENERIC_DOMAINS=3Dn (which covers every CONFIG_PM=3Dn buil=
d),
> xpcs_rk_serdes_phy_poweron() hits:
>
> include/linux/pm_domain.h:
>         static inline int dev_pm_genpd_rpm_always_on(struct device *dev, =
bool on)
>         {
>                 return -EOPNOTSUPP;
>         }
>
> and the driver treats that as fatal.  Since the symbol is also
> default ARCH_ROCKCHIP, it can be built and matched in configurations wher=
e
> it can never bind.  Would adding depends on GENERIC_PHY and
> PM_GENERIC_DOMAINS be appropriate?

Sure, I will add it.

> > +static int xpcs_rk_serdes_phy_init(struct dw_xpcs_rk *pxpcs)
> > +{
> > +     struct device *dev =3D &pxpcs->pdev->dev;
> > +
> > +     pxpcs->serdes_phy =3D devm_phy_get(dev, "serdes");
> > +     if (IS_ERR(pxpcs->serdes_phy))
> > +             return dev_err_probe(dev, PTR_ERR(pxpcs->serdes_phy),
> > +                                     "Failed to get SerDes PHY\n");
> > +
> > +     return 0;
> > +}
>
> [Severity: Low]
> Is the mandatory "serdes" PHY consistent with the device tree added by th=
e
> rest of the series?
>
> The binding added in this series lists phys and phy-names under required:
>
> Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml:
>         required:
>           - compatible
>           - reg
>           ...
>           - phys
>           - phy-names
>           - power-domains
>
> but the SoC node has neither property:
>
> arch/arm64/boot/dts/rockchip/rk3568.dtsi:
>         xpcs: pcs@fda00000 {
>                 compatible =3D "rockchip,rk3568-xpcs";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>                 reg =3D <0x0 0xfda00000 0x0 0x200000>;
>                 clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
>                 clock-names =3D "csr", "eee";
>                 power-domains =3D <&power RK3568_PD_PIPE>;
>                 status =3D "disabled";
>
> dtschema validates nodes regardless of status, so every RK3568 DTB other
> than the one board patched later in the series should report that phys is
> a required property.  Any board that enables the node without adding
> phys/phy-names also gets an unconditional probe failure here, since there
> is no devm_phy_get_optional() path.  Should the PHY properties move to th=
e
> SoC dtsi, or should they be dropped from required:?

As replied earlier, the phys/phy-names properties cannot move into
rk3568.dtsi because the SerDes connection is board-specific. Boards that
enable XPCS must provide them.

> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> > +     struct device *dev =3D &pxpcs->pdev->dev;
> > +     int ret;
> > +
> > +     pxpcs->csr_clk =3D devm_clk_get(dev, "csr");
> > +     if (IS_ERR(pxpcs->csr_clk))
> > +             return dev_err_probe(dev, PTR_ERR(pxpcs->csr_clk),
> > +                                      "Failed to get CSR clock\n");
> > +
> > +     pxpcs->eee_clk =3D devm_clk_get(dev, "eee");
> > +     if (IS_ERR(pxpcs->eee_clk))
> > +             return dev_err_probe(dev, PTR_ERR(pxpcs->eee_clk),
> > +                                      "Failed to get EEE clock\n");
> > +
> > +     ret =3D clk_prepare_enable(pxpcs->eee_clk);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to enable EEE clock\n");
> > +             return ret;
> > +     }
>
> [Severity: Low]
> The EEE clock is acquired and permanently enabled, but nothing ever
> derives the XPCS 100 ns multiplier from its rate.  Should this driver cal=
l
> xpcs_config_eee_mult_fact() the way dwmac-intel.c does?
>
> Without it xpcs->eee_mult_fact stays 0, and the core programs that value
> verbatim when EEE is turned on:
>
> drivers/net/pcs/pcs-xpcs.c:
>         /* Configure the eee_mult_fact so that
>          * clk_eee_time_period * (mult_fact + 1) is within the range
>          * 80 to 120ns.
>          */
>         val =3D ... FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
>                              xpcs->eee_mult_fact);
>
> With the RK3568 EEE clock parents (125/200 MHz, so a 5-8 ns period), a
> multiplier of 0 puts the LPI timing well below that range.  The register
> reset value is also 0, so nothing valid is being overwritten, but is the
> timing expected to be programmed here?

mainline's clk-rk3568.c registers CLK_XPCS_EEE with a parent mux
between gpll200 (200 MHz) and cpll125 (125 MHz), controlled by
CRU_CLKSEL_CON29 bit 13. The reset value is 0 (gpll200, 200 MHz), and
no in-tree DTS changes it, so the default multiplier is 19.

To stay correct if a board changes the mux, I'll derive the value at
runtime in xpcs_rk_init_clk() where the EEE clock is already obtained:

    pxpcs->eee_mult_fact =3D
        DIV_ROUND_CLOSEST(100 * clk_get_rate(pxpcs->eee_clk),
                          1000000000UL) - 1;

and call xpcs_config_eee_mult_fact() in xpcs_rk_create() right after
xpcs_create_mdiodev() succeeds, since that is where the dw_xpcs
pointer becomes available.

This yields 19 for 200 MHz (100 ns) and 12 for 125 MHz (104 ns), both
within the required 80..120 ns range.

> > +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node =
*np)
> > +{
>
> [ ... ]
>
> > +     pdev =3D of_find_device_by_node(pcs_np);
> > +     of_node_put(pcs_np);
> > +     if (!pdev)
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +
> > +     device_lock(&pdev->dev);
> > +     pxpcs =3D platform_get_drvdata(pdev);
> > +     if (!pxpcs || !pxpcs->bus) {
> > +             device_unlock(&pdev->dev);
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> > +     device_unlock(&pdev->dev);
> > +     if (IS_ERR(xpcs)) {
> > +             put_device(&pdev->dev);
> > +             return xpcs;
> > +     }
> > +
> > +     if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
)) {
>
> [Severity: Medium]
> Can the mii_bus be freed under the new dw_xpcs in the window between
> device_unlock() and device_link_add()?
>
> The bus is devm managed, so it goes away when the XPCS platform driver
> unbinds:
>
> xpcs_rk_init_bus()
>         bus =3D devm_mdiobus_alloc_size(dev, 0);
>         ...
>         ret =3D devm_mdiobus_register(dev, bus);
>
> and xpcs_create_mdiodev() takes no reference on it:
>
> drivers/net/phy/mdio_device.c:mdio_device_create()
>         mdiodev->bus =3D bus;
>         mdiodev->addr =3D addr;
>
> so the managed device link is the only thing keeping the supplier binding
> alive.  With the lock already dropped, an unbind through sysfs or an
> rmmod of pcs-xpcs-rk can run device_release_driver() before the link
> exists.  put_device() keeps the struct device around but not the driver
> binding or its devm resources, leaving mdiodev->bus and the ioremapped
> window pointing at freed memory.  The xpcs_destroy() call on the
> device_link_add() failure path would then touch it too.
>
> Would creating the device link while still holding device_lock(), or
> otherwise pinning the supplier before unlocking, close this?

I've addressed this by keeping device_link_add() inside the
device_lock() critical section. device_link_add() uses global locks
(device_links_lock and dpm_list_mtx), not the supplier's device_lock,
so calling it while holding the lock is safe.

> > +EXPORT_SYMBOL_GPL(xpcs_rk_create);
>
> [Severity: Low]
> As of this commit alone, xpcs_rk_create() has no in-tree caller, so the
> driver only probes, pins the power domain and SerDes, and registers the
> virtual MDIO bus without ever producing the phylink_pcs the changelog
> describes.
>
> This resolves later in the same series: rk_pcs_init() in
> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c calls
> xpcs_rk_create(priv->device, pcs_node), rk_gmac_probe() installs
> pcs_init/pcs_exit/select_pcs, and DWMAC_ROCKCHIP gains
> select PCS_XPCS_ROCKCHIP.  Noting it only in case the ordering was
> intentional.

This ordering is intentional. Patch 7 adds the XPCS glue driver
(provider), and the consumer (rk_pcs_init() in dwmac-rk) is added in
the next patch. This is the standard way to split provider and consumer
patches: each commit compiles on its own, but the full functionality
only comes together at the end of the series.

The exported symbol has no caller until the next patch, which is
expected for this kind of split.

Thanks,
Coia

