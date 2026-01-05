Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3FBC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSUV2cf2wdwz1OA1ChgrBzOimVrQQtaAOzWGSVpTAQ0=; b=nO6rPIAFa2XNuw5LuNNvD1otbv
	eg5jnJ+oZ6eZg/7FPFYiIyGY/VgOO0VDtRrdU/yo4bQ8nHzDXnT+TB7KHe37tgWLxPkLF07v4+LLk
	1IKzSTnKtJGK7vtOtMjmlSWf/JGJE4kniZXFJD0DBS0zFw3U2ZwHYy9TH0Bn8GfYVjRbkzWZwa/gO
	gbhAon7BsMkjkiZ7a3VwbeUyvN53/TQEAgBRA39JiZxTgK2iVkp+ZhSHED+XH6Q7ZtYPR5pMvBkAc
	TtCxwvJ+epp8wgGEfabnHXoPmNbx7raIzxv6DSRjfEbFk5gsSK1i3DCLjARstipCoF7SqPvI1jzkt
	cepB6ucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfap-0000000Awot-35ZY;
	Mon, 05 Jan 2026 08:05:35 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfam-0000000AwoE-3Exv;
	Mon, 05 Jan 2026 08:05:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767600323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lLTGgHz6gZ98q102lVXE1ZeJzmL3Y2g7P4uZTRcAiIyMuaunj4z3AXhK6zjFLkfPeJ7pAXk3l6m5NYaq/xau9e0/Slt60lYqNC6NmeERSn2mkEPkCRalMwPPJAED23AlCYzkkB8sruEuaevifqSVBHbmBRrUM/AMGpm5LKbBPHM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767600323; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YSUV2cf2wdwz1OA1ChgrBzOimVrQQtaAOzWGSVpTAQ0=; 
	b=alWJ32rk4UULXjYggI84BUT7QQAN3qOfOSF7SaRjS2VEvRiVx+uWFswUKZgyO9jw8ESObWkoenRh5RZBCI14QzFBIzoJpp42zkWgh1zkgh8S24VKRZUVgsR0U4N1TLQ/+OXSlU3U59csRjUWsaQdkgHjP1B0DLb2QnWQf12T+uI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767600323;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=YSUV2cf2wdwz1OA1ChgrBzOimVrQQtaAOzWGSVpTAQ0=;
	b=DMcNGr/fs0fh7UwlGOxtuvD57HjEG6ol1nvX4Rk3mxf5VjALVsVaNcja+GqwPJSO
	UvDmnHLhsYCruNSc2SnJHDrHkH6ywm6V/sxseE+E344dh+nz6Rqr6GICGWt4fVbYARh
	kV2RTwmB+Nk+CuF5+jELkwEwwMPBr0vcK1rBWzcc=
Received: by mx.zohomail.com with SMTPS id 1767600320138230.88590193818436;
	Mon, 5 Jan 2026 00:05:20 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Peter Wang =?UTF-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v4 09/25] scsi: ufs: mediatek: Rework the crypt-boost stuff
Date: Mon, 05 Jan 2026 09:05:14 +0100
Message-ID: <5038393.GXAFRqVoOG@workhorse>
In-Reply-To: <a12f7ffe8448d205a7318219ea7a18f0f722727f.camel@mediatek.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-9-ddec7a369dd2@collabora.com>
 <a12f7ffe8448d205a7318219ea7a18f0f722727f.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_000532_862090_94DC63B6 
X-CRM114-Status: GOOD (  14.37  )
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

On Wednesday, 24 December 2025 07:16:34 Central European Standard Time Pete=
r Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Thu, 2025-12-18 at 13:54 +0100, Nicolas Frattaroli wrote:
> > -
> > -static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
> > +static int ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
> >=20
>=20
> Hi Nicolas,
>=20
> Please do not change the return type if you are not checking the return
> value.
>=20
>=20
> >  {
> >         struct ufs_mtk_host *host =3D ufshcd_get_variant(hba);
> >         struct ufs_mtk_crypt_cfg *cfg;
> >         struct device *dev =3D hba->dev;
> > -       struct regulator *reg;
> > -       u32 volt;
> > +       int ret;
> >=20
> > -       host->crypt =3D devm_kzalloc(dev, sizeof(*(host->crypt)),
> > -                                  GFP_KERNEL);
> > -       if (!host->crypt)
> > -               goto disable_caps;
> > +       cfg =3D devm_kzalloc(dev, sizeof(*cfg), GFP_KERNEL);
> > +       if (!cfg)
> > +               return -ENOMEM;
> >=20
> > -       reg =3D devm_regulator_get_optional(dev, "dvfsrc-vcore");
> > -       if (IS_ERR(reg)) {
> > -               dev_info(dev, "failed to get dvfsrc-vcore: %ld",
> > -                        PTR_ERR(reg));
> > -               goto disable_caps;
> > +       cfg->reg_vcore =3D devm_regulator_get_optional(dev, "dvfsrc-
> > vcore");
> > +       if (IS_ERR(cfg->reg_vcore)) {
> > +               dev_err(dev, "Failed to get dvfsrc-vcore: %pe", cfg-
> > >reg_vcore);
> >=20
>=20
> Should free the cfg memory?

It's a devres alloc. It'll get freed on driver removal automatically.
=46reeing it manually would be a double-free once the driver unloads.

>=20
> > +               return PTR_ERR(cfg->reg_vcore);
> >         }
> >=20
> > -       if (of_property_read_u32(dev->of_node, "boost-crypt-vcore-
> > min",
> > -                                &volt)) {
> > -               dev_info(dev, "failed to get boost-crypt-vcore-min");
> > -               goto disable_caps;
> > +       ret =3D of_property_read_u32(dev->of_node, "mediatek,boost-
> > crypt-vcore-min",
> > +                                  &cfg->vcore_volt);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to get mediatek,boost-crypt-
> > vcore-min: %pe\n",
> > +                       ERR_PTR(ret));
> > +               return ret;
> >         }
> >=20
> > -       cfg =3D host->crypt;
> > -       if (ufs_mtk_init_host_clk(hba, "crypt_mux",
> > -                                 &cfg->clk_crypt_mux))
> > -               goto disable_caps;
> > +       cfg->clk_crypt_mux =3D devm_clk_get(dev, "crypt_mux");
> > +       if (IS_ERR(cfg->clk_crypt_mux)) {
> > +               dev_err(dev, "Failed to get clock crypt_mux: %pe\n",
> > cfg->clk_crypt_mux);
> > +               return PTR_ERR(cfg->clk_crypt_mux);
> > +       }
> >=20
> > -       if (ufs_mtk_init_host_clk(hba, "crypt_lp",
> > -                                 &cfg->clk_crypt_lp))
> > -               goto disable_caps;
> > +       cfg->clk_crypt_lp =3D devm_clk_get(dev, "crypt_lp");
> > +       if (IS_ERR(cfg->clk_crypt_lp)) {
> > +               dev_err(dev, "Failed to get clock crypt_lp: %pe\n",
> > cfg->clk_crypt_lp);
> > +               return PTR_ERR(cfg->clk_crypt_lp);
> > +       }
> >=20
> > -       if (ufs_mtk_init_host_clk(hba, "crypt_perf",
> > -                                 &cfg->clk_crypt_perf))
> > -               goto disable_caps;
> > +       cfg->clk_crypt_perf =3D devm_clk_get(dev, "crypt_perf");
> > +       if (IS_ERR(cfg->clk_crypt_perf)) {
> > +               dev_err(dev, "Failed to get clock crypt_perf: %pe\n",
> > cfg->clk_crypt_perf);
> > +               return PTR_ERR(cfg->clk_crypt_perf);
> > +       }
> >=20
> > -       cfg->reg_vcore =3D reg;
> > -       cfg->vcore_volt =3D volt;
> > +       host->crypt =3D cfg;
> >         host->caps |=3D UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
> >=20
> > -disable_caps:
> > -       return;
> > +       return 0;
> >  }
> >=20
> >  static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
> >=20
> > --
> > 2.52.0
> >=20
>=20
>=20





