Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42357C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUmHj/LFwOw941/kenFz/i5xXlBgFi4Hi0DQiphahvI=; b=vSGEvCVSrsddY7Xwf8cWM+OdV5
	cDajoAbEzrgecHVLEQWIoU8mXgIrh4kV2q+oV2bcC0s3TzlSqwlVk4NEV4IVSIAGJ3etlAJd+Gwo/
	t7sjab6TXn08CrDcFTEiyqlDKkVNOZ4FgDGkc1bP7d7Rc1+0X/veAFbfUHTcpfpVekIFkAjzS1z1m
	+/lG286YoHX79UhjDGvqI9Psl8/grdpe3OQYGzDdSTUtOS/nEHnuctZRqTrAto8ELpQCIFtTTle6z
	7A6jvstvCr8nmSr7gF21oC+j8oNrcx7ldrZD8fbbqib6thWaeXy0bfxZAzeKS3+f032TLBpyEp1zs
	w/DRjoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5m9y-00000001mGu-2jxF;
	Sun, 13 Sep 2026 15:30:26 +0000
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5m9v-00000001mFO-2Bwm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:30:25 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c254403ada6so123200866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789313421; cv=none;
        d=google.com; s=arc-20260327;
        b=mXXd6m7TBHPot6G1tPk/iR4nxlCdQheyjE2szqSfSkbWeCbZ2G6tArNGdLm7D+BcxK
         F/Il6NZX28u67yobK9vI+9y8r1BLxdvBGW0xE5Ev91hi3Hqsm7dY7IyBOqA1PES/ozat
         Wo6+wxolSMHAp7UPlxb4WJjzoCTURM8BtI5NaSmokRY5bsKFlrauwI/G1lOOVS80ERis
         CM7H5y0e9jYbDfksakC/cRcdw91xDy2qb3t6Lkkz3d7N79O0fgpFgQxTu/9SU3cCj5Pi
         T+RLe9b+fxme+nAiH5X80uEinSZCQZOJqO1yqgC/s23cJLSejBKP41/8cUDvsyYm2g2u
         l23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUmHj/LFwOw941/kenFz/i5xXlBgFi4Hi0DQiphahvI=;
        fh=RQYiFThi/ZDgTKxI8R1kFp84IxjAXzvkcdguDceZvHk=;
        b=WeMFY68QYx7OuPbWNX0rf5mnUjHqsG+rvY+1hdEcy3NZreVq4FZ5igg38FWsNRtk8v
         2NB5xtqObuBfthx+ppi0HrgXhPj0g1ec3eI8RhjPsm3IsAQ5GvZxY8fiE3+IZgS2OVpv
         5q5AbCteWI6dzdHixlnL1hqiU8Q1/HAIqavhmOHOo7nHS8NCaAwG98wwdrY4Ou0CHEKc
         7Zklv5M4D/vNQk25kqAyqfhGbYzI35VVIenbHBheVjCgRrxZACMinPVWUwvTNPa5u3GH
         /SN7M+pBwSJ0a2s1YCp3pJ+4q6WaTnYl0Ya61V7JOkHZ9Jeo/ea+0xRNi3goDCfgpo4l
         OUGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789313421; x=1789918221; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUmHj/LFwOw941/kenFz/i5xXlBgFi4Hi0DQiphahvI=;
        b=Lm0dcxzwUHEZraEmRtO47R4FgVNC/tM43eriZeLyDbKtawkjVvShX+/yqIUNwkOiNn
         /9YU08GqTeFAFFjHpCwISWTUXrcdL9F3CqYV1LCfuSPEdap/gDc70psKfhb9Y+fZRIHy
         A5ivtvoIbqMGs0VE1IkHnNziiwwqOasd4mUe74BzyQXcQ/IjcIFr66MYAGFziBjE56F/
         c6WZkUbH3aHf0BqI3m8PoC+3qxr8n3JRHT2V5Zc4IOr7w6PjI/CoNHPjjdnDTYB+RjSx
         dCLl712bXYauxfuQcGCQKBkhAuT/2VlHQ5ZT4UdyEn/HHud33olrxh787T545PPfdQJy
         7OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313421; x=1789918221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUmHj/LFwOw941/kenFz/i5xXlBgFi4Hi0DQiphahvI=;
        b=qdEUsrqPF/GB1mKn5lRC2xc6FCWiA8nBMpKjKCYDcrylHzdMNHl81j1bdaOMmzyKVr
         rzmFydFDH8H5/H749rNR4OKC2JhBpktz77trm8nP8A4kEFlOAVCPyz/dlDUTlf/gwSHN
         fHZja6DlLer1P1668Ez5eOgdqJBcemRx8uvsBvKdTOEj8vOKTWq1N4uHADipX7jwyIZ7
         jHUh5y9cTxrcV8fbukgc/0SuB4XzKXe7U/f8qyynZZig+o5vmgrqlVvmI49ipvtTZ+31
         rI7n7eAyRYjeFJYIE18frL2OqFJgJxHe6wTpXpbXpCeYBY05sYCB9i87iisti54G56u/
         pX+A==
X-Forwarded-Encrypted: i=1; AKwUvBwINo8ZPvnKQIdEUXLYq2M83COH+Vt4W69URTThTH7eVYMtfLexrl609hWuDUBZc5NUne0LtnHwXB7YnyIY8sge@lists.infradead.org
X-Gm-Message-State: AFuF++ln42heOJKGL8TqxJmMh6dGhyujbs277m8EKb+wGlmSrT5HyAdW
	V4WUl2nHlpv4KIypilst7RQ8ivSmDfWUXs5le++GEqaM7jnolUwQ1uhj5bUz+JuuHAhzQLTqxbu
	+x0DRNIaLmytBTuPRK+BhEv9JiEVhVXM=
X-Gm-Gg: AYBFou1w1y8e6Zatcp7eXUwB2wmenbilbGflK9AdnTsCev3p92XNYxvCy4br1LHlJk8
	3HV/FaAuWv5sRCMy2daf0kQlXcuFfzr51Mt4qSEyPBihswNzHOGAgm24jHmZSFcq0pBTYeHqjd9
	47CtmFAzqkwuu5OFCW2Xz38AgMmKGt0fVOmMrAIohYa87y4tCRD498TvKZAJ0Kv1nnoPXSmX8om
	Tk5/3wRR9DJzlMyCkLJVd9vduq6HjMUc+Lavq/Wfv4yAxIDIVFzPblQXpkThJAEBVEylQ7BDiE3
	vvDWvRvfTPtQGUML50P69K/kexa6WO835J5ut2b/FfSxO/MBEZ4IB4eSL+E=
X-Received: by 2002:a17:907:6d0c:b0:c26:1649:47a5 with SMTP id
 a640c23a62f3a-c29858afb4dmr388468266b.27.1789313421314; Sun, 13 Sep 2026
 08:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-6-coiaprant@gmail.com> <20260912201324.126973-1-kuba@kernel.org>
In-Reply-To: <20260912201324.126973-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:30:09 +0800
X-Gm-Features: AcwNN1WBFJod78ZuorP_y9LCkHOcoGiWiUu5Cum7Oj84vat35RmRCRAX8YYOUss
Message-ID: <CALj3r0hevQ2Y9ttORKOa-oOFmyi7zDwNdLETRG0endxhCoFibA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 04/10] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
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
X-CRM114-CacheID: sfid-20260913_083023_629700_268E6736 
X-CRM114-Status: GOOD (  38.05  )
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
> dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
>
> This adds a new standalone schema describing the Synopsys DesignWare XPCS
> as integrated on the Rockchip RK3568, with a CSR window, csr/eee clocks, =
a
> Naneng Combo SerDes phy, a power domain and four MII child ports.  A few
> questions about the property set and the file naming below.
>
> > diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.=
yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> > new file mode 100644
> > index 0000000000000..0852d0bcb66a2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>
> [Severity: Low]
>
> This isn't a bug, but should the file be named after the documented
> compatible, i.e. rockchip,rk3568-xpcs.yaml?  The other schemas in
> Documentation/devicetree/bindings/net/pcs/ all use that form:
> snps,dw-xpcs.yaml, fsl,lynx-pcs.yaml, mediatek,sgmiisys.yaml,
> renesas,rzn1-miic.yaml.
>
> A rename would also have to update the $id line above, since it encodes t=
he
> same name.
>
> Related: the example at the bottom uses pcs@fda00000 and pcs-mii@0, while
> the sibling PCS binding uses the generic ethernet-pcs@... node name, and =
no
> $nodename constraint is added here.  The SoC dtsi added later in the seri=
es
> copies the pcs@/pcs-mii@ names verbatim.

I chose rockchip-dwxpcs.yaml intentionally, in case Rockchip integrates
the same XPCS IP into other SoCs in the future. The filename is more
generic and can cover multiple compatible strings if needed.

However, I understand the convention is to name the file after the
compatible string (like snps,dw-xpcs.yaml and fsl,lynx-pcs.yaml). If
you prefer rockchip,rk3568-xpcs.yaml, I will rename it.

> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3568-xpcs
>
> [Severity: Low]
>
> This isn't a bug, but would a set of SoC-specific if/then blocks in
> Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml be preferred
> over a second schema for the same IP?
>
> To be clear, a snps,dw-xpcs fallback compatible or a $ref to that schema
> would be wrong here.  The glue driver added later in the series builds CS=
R
> addresses with only a 3-bit MMD field:
>
>         return FIELD_PREP(0x70000, dev) | FIELD_PREP(0xffff, reg);
>
> and remaps the vendor MMDs in xpcs_rk_mdio_read_remapping() /
> xpcs_rk_mdio_write_remapping(), so the generic direct mapping described i=
n
> snps,dw-xpcs.yaml would compute different offsets.
>
> So the only question is where the description should live, not whether th=
e
> compatible should be shared.

As you noted, a $ref to snps,dw-xpcs.yaml would be wrong because the
Rockchip glue uses a different address mapping (3-bit MMD field with
remapping). A separate schema is the right choice.

> [Severity: Low]
>
> Should the sbd_intr_o output be described as an optional interrupts
> property?  With additionalProperties: false at the end of the file, a
> conforming device tree cannot carry it, although adding it later stays
> backward compatible.
>
> The single unnamed 2 MiB window itself does match the driver:
> xpcs_rk_init_res() uses platform_get_resource(pdev, IORESOURCE_MEM, 0) an=
d
> requires resource_size(res) >=3D SZ_2M, and the largest computed offset
> 0x7FFFF << 2 =3D 0x1FFFFC still falls inside 0x200000, so reg-names and
> reg-io-width are not needed.

These are optional and can be added later without breaking ABI. I'll
leave them out for now, since the mainline XPCS driver doesn't use them.

> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    items:
> > +      - description: APB3 bus interface clock (clk_csr_i), required fo=
r register access
> > +      - description: EEE clock (clk_eee_i), required for Energy Effici=
ent Ethernet operation
> > +
> > +  clock-names:
> > +    items:
> > +      - const: csr
> > +      - const: eee
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    const: serdes
> > +
> > +  power-domains:
> > +    maxItems: 1
>
> [Severity: Low]
>
> Should resets/reset-names be described here too?  The RK3568 CRU exposes
> four dedicated reset lines for this block in
> include/dt-bindings/clock/rk3568-cru.h:
>
>         #define SRST_XPCS               150
>         #define SRST_XPCS_TX_DIV10      151
>         #define SRST_XPCS_RX_DIV10      152
>         #define SRST_XPCS_XGXS_RX       153
>
> Since the schema ends with additionalProperties: false, a conforming devi=
ce
> tree cannot express them at all, and the glue driver added later in the
> series never requests a reset control, so it depends on those resets alre=
ady
> being de-asserted.
>
> Peer blocks in the same island do describe theirs, e.g. combphy0 with
> resets =3D <&cru SRST_PIPEPHY0> and gmac0 with resets =3D <&cru SRST_A_GM=
AC0>.
>
> Note the XPCS core does provide a register-level reset via xpcs_soft_rese=
t()
> in drivers/net/pcs/pcs-xpcs.c, so a state-machine restart is possible
> without the CRU resets, and an optional resets property can be added late=
r
> without breaking the ABI.

These are optional and can be added later without breaking ABI. I'll
leave them out for now, since the mainline XPCS driver doesn't use them.

> > +patternProperties:
> > +  "^pcs-mii@[0-3]$":
> > +    type: object
> > +    description:
> > +      One of the four MII ports of the XPCS. The port is linked to an
> > +      Ethernet MAC controller via the pcs-handle property in the MAC's
> > +      device tree node.
> > +
> > +    properties:
> > +      reg:
> > +        description: MII port number.
> > +        enum: [0, 1, 2, 3]
>
> [Severity: Low]
>
> This isn't a bug, but is pcs-mii@N the intended name for these per-port
> children rather than the generic ethernet-pcs@N?
>
> Resolving a MAC pcs-handle that points at one of these children does work
> with the rest of the series: xpcs_rk_create() in
> drivers/net/pcs/pcs-xpcs-rk.c reads the child reg, walks up with
> of_get_parent() and calls xpcs_create_mdiodev(pxpcs->bus, port), and
> rk_pcs_init() in drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c does
> of_parse_phandle(np, "pcs-handle", 0).  So the open point is just the nod=
e
> naming.

Yes, I will use ethernet-pcs@N

> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - clocks
> > +  - clock-names
> > +  - phys
> > +  - phy-names
> > +  - power-domains
>
> [Severity: Medium]
>
> Does requiring phys and phy-names here make dtbs_check fail for the RK356=
8
> boards?  The SoC node added later in the same series omits both, because =
the
> SerDes selection is board specific:
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
> and only the board fills them in:
>
> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts:
>         &xpcs {
>                 status =3D "okay";
>                 phys =3D <&combphy2 PHY_TYPE_SGMII>;
>                 phy-names =3D "serdes";
>         };
>
> dtschema validates nodes irrespective of status =3D "disabled", so wouldn=
't
> every rk3568*.dtb apart from the Photonicat report "'phys', 'phy-names' a=
re
> required properties"?
>
> Should phys/phy-names be dropped from required (or made conditional), or
> should the SoC dtsi carry them instead?

This is not actually a problem. dtbs_check and CHECK_DTBS only validate
required properties for enabled nodes. As confirmed by Rob Herring:

    "the dtbs_check only checks required properties from yaml if the
     node is enabled. Yes, that is exactly how it works."

The xpcs node in rk3568.dtsi is marked status =3D "disabled", so boards
that include rk3568.dtsi without enabling XPCS will not trigger any
validation warnings. Only boards that enable it need to provide phys
and phy-names, and they do so at the board level (as Photonicat does).

This is also the standard pattern for SoC nodes with board-specific
connections: keep the SoC node disabled, and let the board dts enable
it with all required properties.

The phys/phy-names properties cannot be moved into rk3568.dtsi anyway,
because the SerDes connection is board-specific: some boards use
combphy1 for SGMII, others use combphy2 (like Photonicat).

Thanks,

