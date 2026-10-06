Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3576CCA6001
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=; b=SVvFcPtO4uT3i1xYKoanoKmL8t
	4TTpj1cee0JZvXkC5BOnWQ3EIzZJmmHjFJbdhY1EsQtvKITRpcvb5LkC67SpTscG+/qomExeYmwxS
	CK2cHfpj8c18Q1rP1G+TsJueKnCa9kq5bPU5/ZpDcUhy5I2DATzQlcQKg55g8jdqBKT8NTGqCp1xX
	0ReuGJfBM/kHOTdo/aN/wnh3rhc4IbmvJ5baDwfaJnU6lOZZBuTGhfP1uNwBP09PSv8p716MqeA3k
	auWwU1Bo3nKDQEWbACPhUlgCauhnjh9TqNqA4JowYbY/4IxSaNbVKP2jL7lePLmiOOhlxb4TNnd58
	xBDhFYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE83n-00000001936-0yzT;
	Tue, 06 Oct 2026 16:30:35 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE83g-0000000190h-2e41
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:30:32 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c2e25574351so193780066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791304227; cv=none;
        d=google.com; s=arc-20260327;
        b=gIQM+y+mVjCPZCpkDv8I2VgSPOOVSevGXJpk/eJAkNlobdECxg4d0DQZOqk2tlNHqI
         bR33cihyzhfYSvitfxbbv6XYy9dkNbfsyaoHI3JSJG5vH51AIO/N62rDeDOwYHP+Jw4w
         KWryC1RtrkB1XLS3DHwU+pzJh+Ex0bS2vRjfv/cle3p2Cx9gPUTYy11mi/LF9xiNDtbI
         eAjRqXHPNfrJm3Kk1QgvboFIJsw+npCgGywafkTqON8hPtR5jsRyB8HZJLjzSIrxk2yY
         CQzM53Q8rxKeFIaJj7h+ZrRauX6ufF0uHUGe/gjdbGxJVfuoZ0kDVjwDpgOIStBESiLT
         FtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        fh=SG2/2lCwba6+7dC3vuSOLMex67auRFUZuUol1LJ/eTI=;
        b=AUiiNT48grdIKTv4mX60qDL83r+i4F4nLolZCv+e8rJ+/M5cWPKm/nhngqt14dMr4h
         WZNHPBUq0qB4KmTR7cwcWU+d8IVTU0EU2NJUiFGSZcvX2ZWKGUeISi7Svdq3x6kE7r/D
         73BEABayOVAKLWBTWadUwiJc1//IThBBZGnbs/EfjuNU0NgDZb+RS4enInj3odDLSdGg
         k9g2xWT7Sna+UbJjOCfgxqMFL/WcWbuRJvMxc85y1s9mywnZ56JkMH6qwZ/KtMMRIl7B
         gm7p0esPLlAYtc20lecwdGxe1gGNTzdXBxc6D0ex+9U42ahxIyLdeIf9GO33DrLqUN6J
         1yHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304226; x=1791909026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        b=NKeULLwLoe0ww9rJWk6IJ7hGKgKuRFlCghATKK0ACpnn5LCsHhZJ2Fbth5bocXgjIJ
         n937J74DlhUND1VQeNiNzxbJ77EReiHPtad8t/kV/qGq9hbN82U9lMUAQN+1H6p3Gawr
         xukUUkgziSsELWArdKOcb8gum3fhkiQGe9pr49Pi/cn+UZ/bWewkZb0zda3KwwGlWT5W
         jVDmpejYo/PKPUk551sC7Dc4P45XeqYvOO+k1P356o3IZRh+A1h2qXcaa3Md/VcCfoY2
         pV4LIwp9UkrmYQxz9TzXjO/3C5ukWaDwn81uXHjFlBI7n2apCABwuig1SkdkaRVpNibq
         26qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304226; x=1791909026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        b=gsAZ07+WZRfvt6delAdQsmwoGMV8WGmTB2Mg9zfQpimIDUI1kARvGFBf4kb25p7CGo
         SR0ZVqPn/LOrEea+9JRLwOUGLZFaceY/0TLWU4QWJNm5OGm/VDq4F75E1Wm2NohcFECh
         ip9DMXwkZYy0k4UxL+DJJb/kXh6nITxm919pjaF9VUIScp2/BIjWMSm8hkUX7xVS2FRq
         PxfH5HhGxn2iPS1Fm8Sqij992Re0zJ2i60EROt91D21ng8kwT5YIii34R1xYn6+vVv6G
         BlawShrjN8gnPI8SCOiTW8iCjWWzi2a+G4/c1se55U9T3NIYClqdcYT0NZXcDrPU/gWb
         V2hw==
X-Forwarded-Encrypted: i=1; AKwUvBzENEklXrRG7X99MHlkw2KcZ14AeSswTfmem6R5NQskkF4hFOLIhvt9/hjM2CfdEFF4jeXDrMmmwofiuCI/xXGF@lists.infradead.org
X-Gm-Message-State: AFuF++lomoRUuF3BCxYSTYQuiR1VrY+5HOeDDypQG+3+Ky7xHXQzPFNw
	2sba9tbFbxV1eJbQaoD0fqn3sQ/5CXX0f/tPJBYgVdkK6H1BJ87grY/Y91NAW8ektM5pknX0/Qi
	JlO4v0MIoam9ISre1wVB7t4rPUiGmb34=
X-Gm-Gg: AYBFou3EbLm+yV5U84DEa9JJqn5psNJ4IVRVjaVg9mdWRoIiBIAMhc9k4OW7IaKBgBP
	7tIDyJRkV80IBZemdOuAzrN2JOa6p7OoVt4zuf8ek4gbYzeU+1/C/1xB5XEaeloHQu5nDv9G8DJ
	pT/PnuV5cPIlvZ8YfJZvkD9+Q4TS+ItI7HWZWnzjU8r3cE0Kcjgnzc+zPs4d0Iq/Q4L9d9H9JzU
	/uLhDzig5CeAHz7H2MKwohLddhPU52Z8SMTchkw6O2zfNiR8UdVsiCx7CtBIEEOAysPakYNYDXE
	z/7wkGu8k8ojdy0SI1hssNg7DlSR3+WtVINfYM8JdB8PA6+eiHcFK+34TQ==
X-Received: by 2002:a17:907:944d:b0:c2a:fd39:f231 with SMTP id
 a640c23a62f3a-c2e6ed68303mr1020357266b.26.1791304226334; Tue, 06 Oct 2026
 09:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261006074749.2010233-1-coiaprant@gmail.com> <20261006074749.2010233-3-coiaprant@gmail.com>
 <08736f4d-a728-4b1e-a28e-882648a412e0@rock-chips.com> <20261006161403.GA2469169-robh@kernel.org>
In-Reply-To: <20261006161403.GA2469169-robh@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 7 Oct 2026 00:30:14 +0800
X-Gm-Features: AclHuK_1XvsTomk5pZfZ6KjwFLcu1GrCsrDj9BN4LAny9Xe_1QYEOW_C3FucYAs
Message-ID: <CALj3r0haEf-oGo3QW5XVaz_F=oTNX14PFs31Owkq+79Vb8qjVQ@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_093028_705888_D1C16B14 
X-CRM114-Status: GOOD (  33.39  )
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

Rob Herring <robh@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=887=E6=97=A5=
=E5=91=A8=E4=B8=89 00:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 06, 2026 at 10:53:22PM +0800, Shawn Lin wrote:
> > Hi Coia
> >
> > =E5=9C=A8 2026/10/06 =E6=98=9F=E6=9C=9F=E4=BA=8C 15:47, Coia Prant =E5=
=86=99=E9=81=93:
> > > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> > >
> > > Add support for this selection by introducing
> > > the "rockchip,sgmii-mac-sel" DT property.
> > >
> > >  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > > bit 1 (pipe_sgmii_mac_sel) is defined as:
> > >
> > >      0: SGMII routed to GMAC0
> > >      1: SGMII routed to GMAC1
> > >
> > > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > > remains at GMAC1.
> > >
> >
> > Thanks for your patch. I have a question below, please have a look.
> >
> > > This is necessary for boards such as the Ariaboard Photonicat, which
> > > uses the SGMII interface connected to GMAC0.
> > >
> > > Out-of-range values are rejected by dtschema, so the driver does not
> > > duplicate the range check.
> > >
> > > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%=
20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > > ---
> > >   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/dri=
vers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > index 7843356a4dd47..7b867e7520064 100644
> > > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
> > >     struct combphy_reg pipe_xpcs_phy_ready;
> > >     struct combphy_reg pipe_pcie1l0_sel;
> > >     struct combphy_reg pipe_pcie1l1_sel;
> > > +   struct combphy_reg pipe_sgmii_mac_sel;
> > >     struct combphy_reg u3otg0_port_en;
> > >     struct combphy_reg u3otg1_port_en;
> > >   };
> > > @@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
> > >     bool enable_ssc;
> > >     bool ext_refclk;
> > >     struct clk *refclk;
> > > +   u32 sgmii_mac_sel;
> > >   };
> > >   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *=
priv,
> > > @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct devic=
e *dev, struct rockchip_combphy
> > >     priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> > > +   priv->sgmii_mac_sel =3D 1;
> >
> > Before this patch, SGMMI was routed to GMACX depends on bootloader(if
> > setting), or routed to GMAC1 by chip default. Without knowing any
> > potential candidates setting it via bootloader, you might not force any
> > DTS files without "rockchip,sgmii-mac-sel" to pick GMAC1 as fallback.
> >
> > Maybe you could just keep the SGMII route as-it if the property is not
> > present. Meanwhile, should validate rockchip,sgmii-mac-sel is a valid
> > value passing from DT.
>
> That is the typical way tri-state properties work (as opposed to using a
> boolean). In that case, no 'default' in the schema would then be
> appropriate.
>
> Rob

Hi Shawn, Rob,

Thanks for the review and feedback. I've just posted v13, which addresses
both points:

- The driver no longer forces GMAC1 when the property is absent; it
  leaves the routing as-is.
- The driver validates the value and rejects anything other than 0 or 1.
- The binding drops 'default', since the property is tri-state.

I'll avoid replying to each comment individually to keep the thread
clean, but please let me know if anything is still off.

Thanks,
Coia

