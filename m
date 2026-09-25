Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B708FC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMLuV6/uZsUNZeXVfeQcmRIEgi8iWHmU4wnnVaPLUtw=; b=nWGjmlf8Vex6S9idnnBkqdNqar
	y95PdCxdXPwgl2yHGbL5kRNNrW26kR25eoxTbjCj0EWAlnbGC5Ypl4SXRtkvGKOQmuVu28pYjxQZ0
	xOELH4e/RdiArnZZ0Byy6a+Wr2N3jxBkaGtJ869B6nmwkEsKW8nUmpAZ1Yph7Y2pA7DhnDpnQZ38f
	JwiOdQJu3TCmZQ7bZeo4juEMqO1RxDhqWdIGPBiAR8PzMi/3YO5j/BwZMPRqhziNhWnDm9LZEsQAb
	q4cuRSv36ClSVK8VnY8lALpntUH/+/WTpIYUnhocVelEZyUwJtCqr64jKxM1p/gw+7bP3b8vU7LrM
	8P2UBUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xvb-0000000CesK-30uT;
	Fri, 25 Sep 2026 04:52:55 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xvY-0000000CerF-2paH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:52:54 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c2950c25486so27740966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790311971; cv=none;
        d=google.com; s=arc-20260327;
        b=hvQ2CzHfoe3S9mmLdkm3nQRpsZNW364MPSifx4m+5pdy3bQOVlS5u6Iz88zc1S4XQv
         kOfrHsQdMSSFm/1XIAxILLUrZpqBE53yfgLE5sRJXV8w+nvT5fEK6bFoJmhUQcmJw309
         eL1gLqscrlIpnjShH5rEcDfvnQJqURykoilTvG5V7eM0jQkUC908+ZhoXLRiYiNljRE7
         168zc1m6tukZaOmYbANadbJtwpar84RTKa0vzuyooh/m6AnWAO4jpd/62FumIglT3qxC
         o5/bL7lXbL0M+MeRMPF7yjQn7BnBqQUTONFgsKJieWy+w436BYxBVj0rpNlZ1nvJTqcQ
         /eSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YMLuV6/uZsUNZeXVfeQcmRIEgi8iWHmU4wnnVaPLUtw=;
        fh=+wwg5tqcXbgaHSmmc8cR+KKuPKo+oL7fU3H2LUxdBLU=;
        b=VAaHi0B8WpjkwJH8HmvCqnWI1EdswPEcuIfeEyf2XFh3vXXOhm2+x4f5CNXGfnHaJY
         zKNXSWt+vexTNG017jrw3DdNQ7OQDUe3Vj5IDN3EiQB2wJkRAiQO5Ms8E7grTnFyl7aJ
         4IsfSx9knMQce4R2Vih4n42hoFSpN6B6oLXT0Px7BZxWh3b9YZxgqLo5imnILtdZHd1B
         NGrd7gbmiPMD/jZ2qW5JaY0m3nc96LAUcoT/XXecHnxxL9FhjrTQFaar25fTrmBT+O0/
         RixRxnSVnl/CClfDlNJA4K53OKPasPMlYWLSKuLVLJTJVuJ9FW63FUa+2aw2XxIBhSub
         nHUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311971; x=1790916771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMLuV6/uZsUNZeXVfeQcmRIEgi8iWHmU4wnnVaPLUtw=;
        b=f+CvzmDKviTySZ51Ms9lu5Mm9WZdzemP3WBtbTkp76dS51tJjRHsiHdjCDdO8NpV1S
         dlyiIMOoteYJVJZpehFqjUCXOVNA/n1TIAodVJsXBdNQ5QQbLqTQ2UHo8tEb329QMnhq
         96npxo2Ywoj6Y247IwYEtSmXva8SdsRfvMIu7IogAAFyh6ubMlPmi5jUhUN5ZB4yP55i
         QJj7f4Uv0jGbcpGlos76x12JvU2IYvx0h0MPUyth26bU48t1J+95FTl3JGEVutcWU+3t
         YS6Wme0U62WxmAfpbiULj2OogsjzJtiBgiLZHxm9dPnciM5FT2OvqWGKlirInIXjJjv1
         6lBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311971; x=1790916771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMLuV6/uZsUNZeXVfeQcmRIEgi8iWHmU4wnnVaPLUtw=;
        b=C9mDiVyPUN8afyN89LbhmSYuvIPKZNxfXf5VBRy+xtlewAxW6cxqLwXFN4bhrVV7FZ
         V3YUazqMnZKzCVO5jbr4G1DEeu2s0oNQ72D1zbpq0LKfl2BGUU3lSNTImCCK6nj5Wzsc
         pAJIL4a9dzGr7M0N7MnwFcbsET5sX8lbCApOw8zZ0fMV8+obCMeavcYIrJlkEypS2DLk
         wNXIz9fWOjBfMIIiupjETZB8/8gsVdPLF/WBadWuanG9Y7LhDxPTwNIh4vdMjTsv8lsb
         rHLXUvkLxF8PsDJr63zUWrjYdVJVeA02Y2rJxdpGEhtCrN6e0L2Tau/rjiPp7EBwieE2
         FKOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE0f9akW4Spay3f7WsTk5XqLcDQvpe7DSBwAPjmWB3wiGK3qqAT18DR1E3VLprBnazE2l12XIwKg0/WPJNeNxc@lists.infradead.org
X-Gm-Message-State: AFuF++kFHdNiP8BD30VHGDxOXmB1I2v4E6PDLLwQHh7PWEG1WfqSm4hL
	ni3sxKoD0obPTjY2Qzie+x7Dd9r03iSIjrt3ruhvGodb5BQx64B7QDzBA5GedmgL88qW/0H9aAN
	tDjnKy6D/CLxEuTUgxTvzlU0BZVJ0vE4=
X-Gm-Gg: AYBFou1sWJjU+9TIQhAsHYe7kiM0lW+URwiD6lyrNTtO2lSCNL+9TbuFxjdHjvLXSf2
	LDmoRsZyel1MCAM/dM6xtCmNAGJ7t2XR8gAsW54TqCXoiZk4onbhpP1kVSO0AL+b/8rKmc654VT
	zIbPPrqt/oWRoZWjRk0QPTqg6GEWksRpULdjGOVwKKD4rjXjUMyv+APEzAK716KUptK1X480kCL
	KjSUfHkH7wqactZn59IxAB3VC28eduRxCInguJNQJjXryFzKAnQbW99QeVTm8WceaA48cS2ma3N
	S5AerlgkHIRDPnTmB8FtR0n6sa9AeB+dOAs+VZf00DqYXICYgdd0fI5tFw5AeZx1b8xNtg==
X-Received: by 2002:a17:907:e155:b0:c2a:c799:d068 with SMTP id
 a640c23a62f3a-c2ac799d409mr238869566b.28.1790311970470; Thu, 24 Sep 2026
 21:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260922200336.2201212-8-coiaprant@gmail.com> <179030182389.2160803.3666914180615619528@kernel.org>
In-Reply-To: <179030182389.2160803.3666914180615619528@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 25 Sep 2026 12:52:38 +0800
X-Gm-Features: AclHuK_QSlVOHZL4rfbkJK77lciB5Q35Ewt_icBWLaH_ziPpWM-jpQQyPZjBPUs
Message-ID: <CALj3r0gFPLE3Prxvqd_2XzW8=j7tPZYioyfBXdXLTdLwYeGOyw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org, 
	linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215253_046809_57108EE2 
X-CRM114-Status: GOOD (  48.84  )
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

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8825=E6=97=A5=
=E5=91=A8=E4=BA=94 10:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] In drivers/net/pcs/pcs-xpcs-rk.c, xpcs_rk_system_suspend()
>   relies solely on device_set_wakeup_path() to keep the PD_PIPE power=E2=
=80=A6
> - [Medium] xpcs_rk_mdio_write_remapping() (drivers/net/pcs/pcs-xpcs-
>   rk.c:137-150) forces writes of DW_VR_MII_AN_CTRL,=E2=80=A6
> - [Medium] xpcs_rk_create() (drivers/net/pcs/pcs-xpcs-rk.c:537-546)
>   dereferences the struct device_link * returned by device_link_add()=E2=
=80=A6
> - [Medium] Concern: xpcs_rk_create() validates the supplier with an
>   unlocked read of the driver-core-internal field=E2=80=A6
> - [Low] Concern: xpcs_rk_create() is EXPORT_SYMBOL_GPL'ed and published
>   in a new header include/linux/pcs/pcs-xpcs-rk.h with no in-tree caller=
=E2=80=A6
> - [Low] In xpcs_rk_create() (drivers/net/pcs/pcs-xpcs-rk.c:518-558) the
>   comment justifying the device_link handling misstates the API=E2=80=A6
>
> --
>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This adds a Rockchip RK3568 glue driver for the DesignWare XPCS that
> exposes the APB3-mapped CSRs through a virtual MDIO bus, splits the
> generic platform glue into its own PCS_XPCS_PLATFORM module, and adds
> power-management handling for the shared PD_PIPE power domain.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > index 0000000000000..35ee980a759e5
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> > @@ -0,0 +1,619 @@
>
> [ ... ]
>
> > +static int xpcs_rk_mdio_read_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     /*
> > +      * Reads are redirected by hardware to the port's read-only mirro=
r;
> > +      * only writes have to be targeted at MII (see the write path).
> > +      */
> > +     switch (addr) {
> > +     case 0:
> > +             return ROCKCHIP_MMD_MII;
> > +     case 1:
> > +             return ROCKCHIP_MMD_MII1;
> > +     case 2:
> > +             return ROCKCHIP_MMD_MII2;
> > +     case 3:
> > +             return ROCKCHIP_MMD_MII3;
> > +     default:
> > +             return -ENODEV;
> > +     }
> > +}
> > +
> > +static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     /*
> > +      * These registers physically live only in MII (the management po=
rt).
> > +      * Ports 1-3 expose read-only mirrors of these bits, so writes mu=
st
> > +      * always target MII; the read path remaps per address and the
> > +      * hardware redirects to the port's mirror.
> > +      */
> > +     switch (reg) {
> > +     case DW_VR_MII_AN_CTRL:
> > +     case DW_VR_MII_AN_INTR_STS:
> > +     case DW_VR_MII_EEE_MCTRL0:
> > +     case DW_VR_MII_EEE_MCTRL1:
> > +     case DW_VR_MII_DIG_CTRL2:
> > +             return ROCKCHIP_MMD_MII;
> > +     default:
> > +             break;
> > +     }
>
> [Severity: Medium]
> Reads and writes of the same (addr, reg) pair resolve to different MMDs f=
or
> addresses 1..3.  xpcs_rk_mdio_write_remapping() sends AN_CTRL, AN_INTR_ST=
S,
> EEE_MCTRL0/1 and DIG_CTRL2 to ROCKCHIP_MMD_MII before the per-address swi=
tch
> is reached, while xpcs_rk_mdio_read_remapping() returns ROCKCHIP_MMD_MII1=
/2/3
> for those same registers.  Since xpcs_rk_addr_format() folds the MMD into=
 the
> APB CSR index, the two accesses land on different physical offsets.
>
> The unmodified core does read-modify-write on exactly these registers, e.=
g.
> in xpcs_config_aneg_c37_sgmii():
>
>         ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL, mask=
, val);
>         ...
>         ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
>
> and in xpcs_get_state_c37_sgmii():
>
>         an_intr =3D xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS=
);
>         if (an_intr & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
>                 an_intr &=3D ~DW_VR_MII_AN_STS_C37_ANCMPLT_INTR;
>                 xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, a=
n_intr);
>
> For port 1..3, is the value read from the port mirror then written back i=
nto
> port 0's register, and is the autoneg-complete latch that was observed a
> different one from the latch that gets acknowledged?
>
> Two related questions on the same mapping:
>
> AN_CTRL (PCS mode / TX_CONFIG) and the EEE registers become one shared
> instance for all four ports with no serialization, yet the commit message
> says ports 0..3 can be routed to GMAC0 or GMAC1 independently.  How is
> cross-port clobbering avoided when two MACs configure their PCS?
>
> DW_VR_MII_DIG_CTRL1, which holds VR_RST plus 2G5_EN/MAC_AUTO_SW and is
> modified by the core in xpcs_config_aneg_c37_sgmii() and
> xpcs_config_2500basex(), is not in the list and therefore goes to the
> per-port MMD.  Does that contradict the comment's claim that such vendor
> registers "physically live only in MII"?

For ports 1..3 the vendor registers are read-only mirrors of MII. The
hardware redirects reads to the port's mirror, so reading MII1's
AN_INTR_STS returns the same value as reading MII's, and writing MII
clears the shared instance. The read-modify-write sequence is
therefore equivalent across ports.

On the cross-port clobbering question: ports 0..3 can be routed to
different GMACs, but the vendor registers live in a single shared MII
instance by hardware design. The glue mirrors what the hardware does;
it doesn't add serialization beyond what the core already provides.

DW_VR_MII_DIG_CTRL1 goes to the per-port MMD because the Rockchip
hardware has a per-port copy of that register, unlike the shared
registers in the list. The comment in the write path is about the
specific registers that only exist in MII.

> > +     /*
> > +      * Establish the device link before reading the supplier's drvdat=
a.
> > +      * device_link_add() does not fail on a supplier that is unbindin=
g:
> > +      * it creates the link in DL_STATE_SUPPLIER_UNBIND. Whether the l=
ink
> > +      * actually protects the drvdata depends on the supplier's state =
at
> > +      * creation time.
> > +      *
> > +      * Check link->supplier->links.status right after creation. If th=
e
> > +      * supplier was DL_DEV_DRIVER_BOUND, the link is in
> > +      * DL_STATE_CONSUMER_PROBE and device_links_unbind_consumers() wi=
ll
> > +      * wait for this probe to finish before unbinding the supplier, s=
o
> > +      * the drvdata stays valid for the rest of the function. Any othe=
r
> > +      * state means the supplier is not usable yet; defer and retry.
> > +      *
> > +      * The link is released automatically when the consumer device is
> > +      * destroyed (DL_FLAG_AUTOREMOVE_CONSUMER), so no explicit
> > +      * device_link_remove() is needed on the failure paths.
> > +      */
>
> [Severity: Low]
> Two details in this comment in xpcs_rk_create() look inaccurate.
>
> include/linux/device.h describes the flag as:
>
>         /* Remove the link automatically on consumer driver unbind. */
>
> so is "released automatically when the consumer device is destroyed" the
> right wording?  The core drops such links from __device_links_no_driver()=
 on
> consumer probe failure or driver unbind, not at device destruction.

DL_FLAG_AUTOREMOVE_CONSUMER is dropped on consumer probe failure or
driver unbind. device_del() also purges the link via
device_links_purge(), so the comment isn't wrong, just incomplete.

> The claim that a DL_DEV_DRIVER_BOUND supplier implies DL_STATE_CONSUMER_P=
ROBE
> only holds while the consumer is DL_DEV_PROBING:
>
> drivers/base/core.c:device_link_init_status() {
>         case DL_DEV_DRIVER_BOUND:
>                 switch (consumer->links.status) {
>                 case DL_DEV_PROBING:
>                         link->status =3D DL_STATE_CONSUMER_PROBE;
>         ...
> }
>
> An already-bound consumer gets DL_STATE_ACTIVE and anything else gets
> DL_STATE_AVAILABLE.  Could the comment (or the kernel-doc of the exported
> helper) state that xpcs_rk_create() must be called from the consumer's pr=
obe?

This function is called only during the stmmac probe =E2=80=94 as indicated=
 by
subsequent dwmac-rk patches =E2=80=94 and has no other users.

> > +     link =3D device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONS=
UMER);
> > +     if (!link) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     if (READ_ONCE(link->supplier->links.status) !=3D DL_DEV_DRIVER_BO=
UND) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
>
> [Severity: Medium]
> Is it valid to dereference the pointer returned by device_link_add() here=
?
> DL_FLAG_STATELESS is not passed, so this is a managed link, and the
> kernel-doc above device_link_add() says:
>
>  * If that flag is not set, however, the caller of this function is handi=
ng the
>  * management of the link over to the driver core entirely and its return=
 value
>  * can only be used to check whether or not the link is present.
>
> No kref is taken for managed links (kref_get() only happens on the statel=
ess
> path), so the caller owns no reference on the link object, which the core=
 can
> free from device_link_drop_managed() -> kref_put(&link->kref,
> __device_link_del) or from device_del() -> device_links_purge().
>
> Since link->supplier is just &pdev->dev, and this function already holds =
a
> reference on pdev from of_find_device_by_node(), would reading
> pdev->dev.links.status instead give the same result without touching the
> link object?

Agreed in principle: for a managed link the return value is only good
for checking presence, and I hold a reference on pdev from
of_find_device_by_node(), so reading pdev->dev.links.status directly
would give the same value without touching the link object.

That said, this doesn't actually cause a problem today. The link is
created in DL_STATE_CONSUMER_PROBE and the supplier waits for this
probe to finish, so the link object cannot be freed while we're in
xpcs_rk_create(). The dereference is safe under the current caller.

I'll clean this up in a separate patch, together with the same pattern
in mtk-svs, so it's one change rather than two.

> > +     pxpcs =3D platform_get_drvdata(pdev);
> > +     if (!pxpcs || !pxpcs->bus) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> [Severity: Medium]
> This is a check on a driver-core-internal field (links.status) followed b=
y
> use of the supplier's devm-owned data (pxpcs->bus, pxpcs->eee_mult_fact) =
and
> registration of an MDIO device on that bus.
>
> For the in-tree caller the window does look closed: rk_pcs_init() runs fr=
om
> stmmac_pcs_setup() in __stmmac_dvr_probe(), so the consumer is DL_DEV_PRO=
BING
> and the new link is DL_STATE_CONSUMER_PROBE, which makes the supplier wai=
t:
>
> drivers/base/core.c:device_links_unbind_consumers() {
>         if (status =3D=3D DL_STATE_CONSUMER_PROBE) {
>                 device_links_write_unlock();
>
>                 wait_for_device_probe();
>                 goto start;
>         }
> }
>
> But xpcs_rk_create() is exported and does not document that precondition.
> For a caller outside the consumer's probe the link would be
> DL_STATE_AVAILABLE or DL_STATE_ACTIVE, nothing would wait for it, and the
> supplier's devres could be released while pxpcs->bus is in use.  Also not=
e
> that xpcs_rk_create_data() publishes drvdata before bus and eee_mult_fact
> exist:
>
>         pxpcs->pdev =3D pdev;
>
>         dev_set_drvdata(&pdev->dev, pxpcs);
>
> so the read here relies entirely on the supplier being fully bound.  Woul=
d
> it be preferable to document the probe-context requirement, or to avoid
> inspecting links.status from a driver altogether?

Same reasoning. For the in-tree caller the window is closed:
rk_pcs_init() runs from __stmmac_dvr_probe(), the consumer is
DL_DEV_PROBING, and the link is DL_STATE_CONSUMER_PROBE, so the
supplier waits.

> [Severity: Low]
> At this commit xpcs_rk_create() has no in-tree caller, and the new header
> include/linux/pcs/pcs-xpcs-rk.h declares it without a
> !CONFIG_PCS_XPCS_ROCKCHIP stub.  The caller does arrive later in the same
> series (rk_pcs_init() in drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> calls it and is installed as plat_dat->pcs_init for
> PHY_INTERFACE_MODE_SGMII), and DWMAC_ROCKCHIP does "select
> PCS_XPCS_ROCKCHIP", which forces the tristate to at least the selector's
> value, so there is no y/m link mismatch either.  Noting it only because t=
he
> symbol is unused at this point in the series.

The caller arrives in patch 9 of the same series and DWMAC_ROCKCHIP
selects PCS_XPCS_ROCKCHIP, so there's no y/m mismatch. Splitting the
export and header out would just create a forward declaration for one
patch.

> > +static int xpcs_rk_system_suspend(struct device *dev)
> > +{
> > +     /*
> > +      * Keep the PD_PIPE power domain on during system suspend.
> > +      *
> > +      * PD_PIPE is shared with SATA/PCIe and would be powered down by
> > +      * genpd once all its consumers are suspended, killing the SerDes
> > +      * and breaking MAC WoL.  Mark the XPCS as part of the wakeup pat=
h
> > +      * so genpd keeps the domain on.  Unconditional because the XPCS
> > +      * core has no callback to convey the MAC WoL state.
> > +      */
> > +     device_set_wakeup_path(dev);
> > +     return 0;
> > +}
> > +
> > +static int xpcs_rk_system_resume(struct device *dev)
> > +{
> > +     return 0;
> > +}
>
> [Severity: High]
> Does device_set_wakeup_path() actually keep PD_PIPE powered on RK3568?  T=
he
> commit message states:
>
>         genpd then leaves the domain powered, because the Rockchip power
>         domain driver sets GENPD_FLAG_ACTIVE_WAKEUP on PD_PIPE, which mak=
es
>         genpd check the wakeup path of its consumers during system suspen=
d.
>
> PD_PIPE is registered without active wakeup in
> drivers/pmdomain/rockchip/pm-domains.c:
>
>         [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false, false),
>
> The last argument is the wakeup flag, so pd_info->active_wakeup stays fal=
se
> and GENPD_FLAG_ACTIVE_WAKEUP is never set for this domain.  genpd only
> honours the consumer wakeup path when that flag is present:
>
> drivers/pmdomain/core.c:genpd_finish_suspend() {
>         if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
>             !device_out_band_wakeup(dev))
>                 return 0;
> }
>
> Without the flag, does genpd fall through to genpd_sync_power_off() and p=
ower
> PD_PIPE down, which is exactly the situation the probe comment warns abou=
t
> ("The domain must be powered on before any register access, otherwise the=
 SoC
> will trigger a synchronous external abort")?
>
> dev_pm_genpd_rpm_always_on() does not appear to cover the system-suspend =
path
> either; genpd_sync_power_off() only consults GENPD_FLAG_ALWAYS_ON:
>
> drivers/pmdomain/core.c:genpd_sync_power_off() {
>         if (!genpd_status_on(genpd) || genpd_is_always_on(genpd))
>                 return;
> }
>
> If the domain is power-cycled, what restores the hardware on the way back=
 up?
> phy_init() and phy_power_on() are called once from xpcs_rk_probe() via
> xpcs_rk_serdes_phy_poweron(), xpcs_rk_system_resume() returns 0 without
> re-initialising the SerDes or the PCS, and
> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c has no dev_pm_ops at a=
ll.
> Does that leave the combphy and XPCS at power-on-reset defaults (no SerDe=
s
> configuration, no SerDes TX clock) after resume while the driver, the xpc=
s
> core and phylink still assume the programmed configuration is live, and M=
AC
> WoL, the stated reason for the mechanism, non-functional?

You're right. RK3568_PD_PIPE is registered with active_wakeup =3D false,
so GENPD_FLAG_ACTIVE_WAKEUP is not set and device_set_wakeup_path()
alone does not keep the domain on during system suspend. The commit
message and the comment in xpcs_rk_system_suspend() are wrong about
this.

The separate patch for the Rockchip PD driver to set active_wakeup on
PD_PIPE is here:

https://lore.kernel.org/all/20260925041751.495818-1-coiaprant@gmail.com/

It affects SATA and PCIe as well, which is why it isn't folded into
this PCS glue series. Once it lands, the device_set_wakeup_path() call
here becomes effective.

The runtime path is already covered by dev_pm_genpd_rpm_always_on();
only the system-suspend path was missing.

No respin planned for this series.

Coia

