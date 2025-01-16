Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F69AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgkwLgCWzmgLOE3ol5nUrrYM3q0gttpxxlvJ2sepa/g=; b=Y27i6s6h9mg1vFW2BxwOO6zPMi
	gPH/FdPK7c8AHuKZmFN9vjjTPjd4OLLMfwpm3PoU+1vb3CS+ryld/sRUdMUuWfguncrV4DlLr9kWy
	epzTsV1H+jKvYe71hbwhWSp0L9Lc5Ks3AC7kRBIPwbehS30qOqMDqWKi7p42Bzh70tOHziZlQLN55
	uBnJ4k7DE2ggvDd8xvjmmzs7DwLm+vFC+ID3jnUGqyFfhG20lplTQFioWUGiqZ/NXcbAa40Bz/Co4
	QwW8T7qKIHeKRv/sxHBHh2CcnOZO2S7iknlZ957FZi+2s3GcYFTaU4fvSZZmbfJw3k1tiyDG9bBO2
	JRgm03mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPj6-0000000EzBX-1h7s;
	Thu, 16 Jan 2025 13:16:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPhm-0000000EywV-3xYu;
	Thu, 16 Jan 2025 13:14:40 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so1890030a12.2;
        Thu, 16 Jan 2025 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737033276; x=1737638076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgkwLgCWzmgLOE3ol5nUrrYM3q0gttpxxlvJ2sepa/g=;
        b=eHMlR45HDwJwWLkUvjxpjiZh+x/aTyvvI+kkDYfopDfPGv/pKazQ8E6bOHFEf154Z7
         +qKowOrHPkP7KWmS0MRdf7GhljmSWwKjkmhiyTLKu1qMGhSONYnpxyeiaM82jeKIQBkN
         OUe3iiv5ocWAPzhd0EFbKOUp9/2tRoJP/kB9qJkf5UZzlmYC3PDxCoQhzmxOUocMoep8
         0MhMP0wfsn0ozxbir2w6i7hqfHVaMMngj2w6B5JqbV2MMhAG6Xo+Nqhtnw04PzYjheZo
         NbGd92JkuSRAGKT9qXd+LCDO0iDZUjtjO3uWT26ASEBnCMBIPw/lx0WnMvApRSLfVBM3
         uVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737033276; x=1737638076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgkwLgCWzmgLOE3ol5nUrrYM3q0gttpxxlvJ2sepa/g=;
        b=BnR2HiXqVIpJeub/lKcaQCydLl5JTzZmJ1wxF3qqLkxn3x1XmHAGzGWrMzWhTkk3hN
         3Rx7S80NzhNWEzTSe/fmSTpcMs6wS+HQsYotRzBtWheqLuHNYdwAJmKxMiSDnjaWEUf3
         o8iPDmronK4CSLVondG5DHpgl3ZWjtvJDO+5WQi+W5kmNlC+Rg4QiRVunmZl25w99/KF
         LFIQHNk7FbNHsoGAMVjIa/wrJDk5rXSCK8AnUYdzCQdD58YRnEgzx3VcZ8gMj7GpxJed
         HCKmx/N3sHHyd4bcDMzJBnHy49GgP+U9KsIGtqyM6TDz1xBRKVkC9XQX54XggO/mBMKh
         lGdA==
X-Forwarded-Encrypted: i=1; AJvYcCUKFBCbYw/QgtHuQQHDZkfqbulU3vJxCrWEDTrdQdxkttqHEPMt7rECRF/nGyvPkLptojM+UR9zbnTv+muV62A=@lists.infradead.org, AJvYcCUscgYV/qkwTzJW3DaGwoCUDIdcS8GIncOZ2/igD1e1EYpfCQ4LbE0JoKRuevZuqB2XH8E9JPG7frwQ@lists.infradead.org, AJvYcCWoK8KKJWBGlkfu5JIY+LwkObhkC0eprPSLt4qxAYNJE7YafBU+IqLrqpmyt/nw5f5b5psSw62plEK3ufs39829@lists.infradead.org
X-Gm-Message-State: AOJu0Yym0NLgjywOa5kCBNn6YpPt7uw1KLRWj8b3ZW3suI8k0flQWZxg
	LOHv/KJTr5pxm14FiwGf8XOzuAnlhEAuv6xjOZunipteYRyzTdUdNBOEhMZ0EuiNyyh4/Q7yojS
	sSPxEdRfYxA2AQ/4+ZsgSNs9bCds=
X-Gm-Gg: ASbGnctQ4IBda3I0XjzcjpkIu+ZoHLSb8ako+3XepRw2kxro3XqPFhfS7EloQHk8FDS
	mvnVRjeu5unjGv/7t2Mh7mTJw/o0Q3qoc/fmiQhM=
X-Google-Smtp-Source: AGHT+IGWBzeyy8ZRTTIplRo7KqPXh999VfdXc4NvtCaOT95M+6jOYdI2ado3G6u0XC9i2P1r4qNqsDJftx/H0uFXbzQ=
X-Received: by 2002:a05:6402:2711:b0:5d3:e4eb:8d1f with SMTP id
 4fb4d7f45d1cf-5d972e06d96mr32583211a12.12.1737033276201; Thu, 16 Jan 2025
 05:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <20250115012628.1035928-4-pgwipeout@gmail.com>
 <87001334-5a37-4fba-b08c-3679fb556f83@kernel.org>
In-Reply-To: <87001334-5a37-4fba-b08c-3679fb556f83@kernel.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 08:14:22 -0500
X-Gm-Features: AbW1kvbd5RNkRmBz2X-AgwMT62XSxPdN26Z4wI9fpto11ZTEzL5AVa_14otokaE
Message-ID: <CAMdYzYoNdAvsO4R5qPJpO4vpd8V0tmsgWhHtXmnM4LR5s=zZpA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/6] phy: rockchip: add driver for rk3328 usb3 phy
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com, kever.yang@rock-chips.com, 
	frank.wang@rock-chips.com, william.wu@rock-chips.com, wulf@rock-chips.com, 
	linux-rockchip@lists.infradead.org, Algea Cao <algea.cao@rock-chips.com>, 
	Arnd Bergmann <arnd@arndb.de>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Vinod Koul <vkoul@kernel.org>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_051438_990382_F2B41FD4 
X-CRM114-Status: GOOD (  31.37  )
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

On Thu, Jan 16, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/01/2025 02:26, Peter Geis wrote:
> > The rk3328 has a combined usb2 and usb3 phy block for the usb3 dwc
> > interface. The implementation up until now has been bugged, with
> > multiple issues ranging from disconnect detection failures to low
> > performance. This driver fixes the majority of the original issues and
> > allows better performance for the rk3328 usb3 port.
> >
> > This driver sources data from multiple sources, including the rk3328
> > trm, the rk3228h trm, emails from Rockchip, and both the 4.4 and 5.10
> > downstream drivers. The current implementation allows for basic bring u=
p
> > of the phy block and fixes the detection issues. Interrupts are enabled=
,
> > but currently only used for debugging. Features missing currently are
> > power management, OTG handling, board specific tuning, regulator contro=
l,
> >
> > Currently the only known bugs are a AX88179 usb3 gigabit adapter crashe=
s
> > when operating at usb3 speeds and transmitting large amounts of data an=
d
> > full disconnection detections may be slower than expected (~5-10 second=
s).
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
>
>
> ...
>
> > +}
> > +
> > +static int rockchip_usb3phy_parse_dt(struct rockchip_usb3phy *usb3phy,=
 struct device *dev)
> > +{
> > +     int ret;
> > +
> > +     usb3phy->clk_pipe =3D devm_clk_get(dev, "usb3phy-pipe");
> > +     if (IS_ERR(usb3phy->clk_pipe)) {
> > +             dev_err(dev, "could not get usb3phy pipe clock\n");
>
> Syntax is always:
> return dev_err_probe
>
> > +             return PTR_ERR(usb3phy->clk_pipe);
> > +     }
> > +
> > +     usb3phy->clk_otg =3D devm_clk_get(dev, "usb3phy-otg");
> > +     if (IS_ERR(usb3phy->clk_otg)) {
> > +             dev_err(dev, "could not get usb3phy otg clock\n");
> > +             return PTR_ERR(usb3phy->clk_otg);
> > +     }
> > +
> > +     usb3phy->clk_ref =3D devm_clk_get(dev, "refclk-usb3otg");
> > +     if (IS_ERR(usb3phy->clk_ref)) {
> > +             dev_err(dev, "could not get usb3phy ref clock\n");
> > +             return PTR_ERR(usb3phy->clk_ref);
> > +     }
> > +
> > +     usb3phy->u2por_rst =3D devm_reset_control_get(dev, "usb3phy-u2-po=
r");
> > +     if (IS_ERR(usb3phy->u2por_rst)) {
> > +             dev_err(dev, "no usb3phy-u2-por reset control found\n");
> > +             return PTR_ERR(usb3phy->u2por_rst);
> > +     }
> > +
> > +     usb3phy->u3por_rst =3D devm_reset_control_get(dev, "usb3phy-u3-po=
r");
> > +     if (IS_ERR(usb3phy->u3por_rst)) {
> > +             dev_err(dev, "no usb3phy-u3-por reset control found\n");
> > +             return PTR_ERR(usb3phy->u3por_rst);
> > +     }
> > +
> > +     usb3phy->pipe_rst =3D devm_reset_control_get(dev, "usb3phy-pipe-m=
ac");
> > +     if (IS_ERR(usb3phy->pipe_rst)) {
> > +             dev_err(dev, "no usb3phy_pipe_mac reset control found\n")=
;
> > +             return PTR_ERR(usb3phy->pipe_rst);
> > +     }
> > +
> > +     usb3phy->utmi_rst =3D devm_reset_control_get(dev, "usb3phy-utmi-m=
ac");
> > +     if (IS_ERR(usb3phy->utmi_rst)) {
> > +             dev_err(dev, "no usb3phy-utmi-mac reset control found\n")=
;
> > +             return PTR_ERR(usb3phy->utmi_rst);
> > +     }
> > +
> > +     usb3phy->pipe_apb_rst =3D devm_reset_control_get(dev, "usb3phy-pi=
pe-apb");
> > +     if (IS_ERR(usb3phy->pipe_apb_rst)) {
> > +             dev_err(dev, "no usb3phy-pipe-apb reset control found\n")=
;
> > +             return PTR_ERR(usb3phy->pipe_apb_rst);
> > +     }
> > +
> > +     usb3phy->utmi_apb_rst =3D devm_reset_control_get(dev, "usb3phy-ut=
mi-apb");
> > +     if (IS_ERR(usb3phy->utmi_apb_rst)) {
> > +             dev_err(dev, "no usb3phy-utmi-apb reset control found\n")=
;
> > +             return PTR_ERR(usb3phy->utmi_apb_rst);
> > +     }
> > +
> > +     usb3phy->ls_irq =3D of_irq_get_byname(dev->of_node, "linestate");
> > +     if (usb3phy->ls_irq < 0) {
> > +             dev_err(dev, "no linestate irq provided\n");
> > +             return usb3phy->ls_irq;
> > +     }
> > +
> > +     ret =3D devm_request_threaded_irq(dev, usb3phy->ls_irq, NULL, roc=
kchip_usb3phy_linestate_irq,
> > +                                     IRQF_ONESHOT, "rockchip_usb3phy_l=
s", usb3phy);
> > +     if (ret) {
> > +             dev_err(dev, "failed to request linestate irq handle\n");
> > +             return ret;
> > +     }
> > +
> > +     usb3phy->bvalid_irq =3D of_irq_get_byname(dev->of_node, "bvalid")=
;
> > +     if (usb3phy->bvalid_irq < 0) {
> > +             dev_err(dev, "no bvalid irq provided\n");
> > +             return usb3phy->bvalid_irq;
> > +     }
> > +
> > +     ret =3D devm_request_threaded_irq(dev, usb3phy->bvalid_irq, NULL,=
 rockchip_usb3phy_bvalid_irq,
> > +                                     IRQF_ONESHOT, "rockchip_usb3phy_b=
valid", usb3phy);
> > +     if (ret) {
> > +             dev_err(dev, "failed to request bvalid irq handle\n");
> > +             return ret;
> > +     }
> > +
> > +     usb3phy->id_irq =3D of_irq_get_byname(dev->of_node, "id");
> > +     if (usb3phy->id_irq < 0) {
> > +             dev_err(dev, "no id irq provided\n");
> > +             return usb3phy->id_irq;
> > +     }
> > +
> > +     ret =3D devm_request_threaded_irq(dev, usb3phy->id_irq, NULL, roc=
kchip_usb3phy_id_irq,
> > +                                     IRQF_ONESHOT, "rockchip_usb3phy-i=
d", usb3phy);
> > +     if (ret) {
> > +             dev_err(dev, "failed to request id irq handle\n");
> > +             return ret;
> > +     }
> > +
> > +             usb3phy->rxdet_irq =3D of_irq_get_byname(dev->of_node, "r=
xdet");
> > +     if (usb3phy->rxdet_irq < 0) {
> > +             dev_err(dev, "no rxdet irq provided\n");
> > +             return usb3phy->rxdet_irq;
> > +     }
> > +
> > +     ret =3D devm_request_threaded_irq(dev, usb3phy->rxdet_irq, NULL, =
rockchip_usb3phy_rxdet_irq,
> > +                                     IRQF_ONESHOT, "rockchip_usb3phy-r=
xdet", usb3phy);
> > +     if (ret) {
> > +             dev_err(dev, "failed to request rxdet irq handle\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int rockchip_usb3phy_exit(struct phy *phy)
> > +{
> > +     struct rockchip_usb3phy_port *port =3D phy_get_drvdata(phy);
> > +     struct rockchip_usb3phy *usb3phy =3D dev_get_drvdata(phy->dev.par=
ent);
> > +
> > +     dev_dbg(usb3phy->dev, "usb3phy_shutdown\n");
> > +     rockchip_usb3phy_reset(usb3phy, true, port->type);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct phy_ops rockchip_usb3phy_ops =3D {
> > +     .init           =3D rockchip_usb3phy_init,
> > +     .exit           =3D rockchip_usb3phy_exit,
> > +     .owner          =3D THIS_MODULE,
> > +};
> > +
> > +static const struct regmap_config rockchip_usb3phy_utmi_port_regmap_co=
nfig =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .max_register =3D 0x400,
> > +     .cache_type =3D REGCACHE_NONE,
> > +     .fast_io =3D true,
> > +     .name =3D "utmi-port",
> > +};
> > +
> > +static const struct regmap_config rockchip_usb3phy_pipe_port_regmap_co=
nfig =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .max_register =3D 0x400,
> > +     .cache_type =3D REGCACHE_NONE,
> > +     .fast_io =3D true,
> > +     .name =3D "pipe-port",
> > +};
> > +
> > +static const struct regmap_config rockchip_usb3phy_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .max_register =3D 0x400,
> > +     .write_flag_mask =3D REG_WRITE_MASK,
> > +     .cache_type =3D REGCACHE_NONE,
> > +     .fast_io =3D true,
> > +};
> > +
> > +static int rockchip_usb3phy_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device_node *np =3D dev->of_node;
> > +     struct device_node *child_np;
> > +     struct phy_provider *provider;
> > +     struct rockchip_usb3phy *usb3phy;
> > +     const struct regmap_config regmap_config =3D rockchip_usb3phy_reg=
map_config;
> > +     void __iomem *base;
> > +     int i, ret;
> > +
> > +     dev_dbg(dev, "Probe usb3phy main block\n");
> > +     usb3phy =3D devm_kzalloc(dev, sizeof(*usb3phy), GFP_KERNEL);
> > +     if (!usb3phy)
> > +             return -ENOMEM;
> > +
> > +     ret =3D rockchip_usb3phy_parse_dt(usb3phy, dev);
> > +     if (ret) {
> > +             dev_err(dev, "parse dt failed %i\n", ret);
>
> return dev_err_probe()
>
> And do not print errors twice.

This is a remnant of the debugging era, thank you for catching it.

>
> > +             return ret;
>
>
>
>
> > +
> > +     /* take apb interface out of reset */
> > +     reset_control_deassert(usb3phy->utmi_apb_rst);
> > +     reset_control_deassert(usb3phy->pipe_apb_rst);
> > +
> > +     /* enable usb3phy rx detection to fix disconnection issues */
> > +     regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG,
> > +                  (USB3_RXDET_EN | (USB3_RXDET_EN << REG_WRITE_SHIFT))=
);
> > +
> > +     dev_dbg(dev, "Completed usb3phy core probe\n");
>
> Drop.
>
> > +
> > +     /* probe the actual ports */
> > +     i =3D 0;
> > +     for_each_available_child_of_node(np, child_np) {
> > +             const struct regmap_config *regmap_port_config;
> > +             struct rockchip_usb3phy_port *port =3D &usb3phy->ports[i]=
;
> > +             struct phy *phy;
> > +
> > +             if (of_node_name_eq(child_np, "utmi-port")) {
>
> Why are you comparing node names, if you decided to put there compatibles=
?
>
> Decide on one method, but wait for full DT review.

The compatibles are remnants from the old method where the driver
bound each device individually. Now that I've switched to the generic
phy system from the usb-phy system, everything is bound at once, they
are no longer necessary.

>
> > +                     port->type =3D USB3PHY_TYPE_USB2;
> > +                     regmap_port_config =3D &rockchip_usb3phy_utmi_por=
t_regmap_config;
> > +             } else if (of_node_name_eq(child_np, "pipe-port")) {
> > +                     port->type      =3D USB3PHY_TYPE_USB3;
> > +                     regmap_port_config =3D &rockchip_usb3phy_pipe_por=
t_regmap_config;
> > +             } else {
> > +                     dev_err(dev, "unknown child node port type %s\n",=
 child_np->name);
> > +                     goto err_port;
> > +             }
> > +
> > +             base =3D devm_of_iomap(dev, child_np, 0, NULL);
> > +             if (IS_ERR(base)) {
> > +                     dev_err(dev, "failed port ioremap\n");
> > +                     ret =3D PTR_ERR(base);
> > +                     goto err_port;
> > +             }
> > +
> > +             port->regmap =3D devm_regmap_init_mmio(dev, base, regmap_=
port_config);
> > +             if (IS_ERR(port->regmap)) {
> > +                     dev_err(dev, "regmap init failed\n");
> > +                     ret =3D PTR_ERR(port->regmap);
> > +                     goto err_port;
> > +             }
> > +
> > +             phy =3D devm_phy_create(dev, child_np, &rockchip_usb3phy_=
ops);
> > +             if (IS_ERR(phy)) {
> > +                     dev_err_probe(dev, PTR_ERR(phy), "failed to creat=
e phy\n");
> > +                     ret =3D PTR_ERR(phy);
>
> Just read how dev_err_probe() works. The syntax is:
> ret =3D dev_err_probe.


Thank you for reminding me of this. The error handling portion is
about the only part that remains from the original driver, back before
dev_err_probe became a big thing.

>
> > +                     goto err_port;
> > +             }
> > +
> > +             port->phy =3D phy;
> > +             phy_set_drvdata(port->phy, port);
> > +
> > +             /* to prevent out of boundary */
> > +             if (++i >=3D USB3PHY_TYPE_MAX) {
> > +                     of_node_put(child_np);
> > +                     break;
> > +             }
> > +
> > +             dev_info(dev, "Completed usb3phy %s port init\n", child_n=
p->name);
> Drop, not really helping.

Thank you for catching the remaining debugging stuff I missed stripping out=
.

>
> Best regards,
> Krzysztof

I appreciate your review.

Very Respectfully,
Peter Geis

