Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6oSopg6Mj71dblp8EqeqZ8bJLpEkBsZJC781RVV1v4=; b=0xGg0+T5gmh4h/yeemRzjsmzIj
	xFj73/NaDTpwaW4e1VwqyvRxTXMazcxcCMQusaNmftK7v4Zuxj2njQOg3Zap/x4YBUzEQpwAqNREq
	7GaKeZ6MQsxXlH2YGqPRuv6Ov+/cGPWJmo3evvXOJpWO9ED8l4/AgoIuF2dp2ncm3yWQThElL4MBr
	ZDLJsK8VDM5oJ9l548jC4U8rE3wsUvlM3WNNKxLmjmUKD5dm1Sdw4cvRK3ob+hRF34THljYA6Um0f
	qZKrz6PpiRupeqJc4AQvCfR5eCxTsIieONsbgmmkXKnB8mw6amWNU8D5uKn88HhUq3J3ORKJNAXP5
	ZmpSteiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUfv-0000000HXk7-1hWV;
	Wed, 08 Jul 2026 15:59:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUfr-0000000HXjR-3ZYz;
	Wed, 08 Jul 2026 15:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=F6oSopg6Mj71dblp8EqeqZ8bJLpEkBsZJC781RVV1v4=; b=nlkdh0pC/i9VfopWXyeRFh4sQU
	Fvsv91+qmcZLKoGg6EkCnpuhZMj5Tm+KA4tjj7c/zUEfrIDIfJHuTAzGvHEnB8a8sLXDaWLbVSqBc
	mIxpbFgiuENlEZtxw8NL1yvWZl9vfq4o+d1PUh3CrQXqrwEqCQ4kc/gfMxid8lwYuSqjWEeSvhbnn
	uwgQUn0WQrNDAmtNn5QxKU+lHBrazr+78M+9t6YIcoVCsLb99PhhYmKDrQ72LW+ez8NidZ1IrXclX
	DtmEyeoWAdmpdRyZvmI8GaELHnOrPda/BooWXiumgF1k/Bld2clwK4bOBbxs0bMQa8OP4jOrieQma
	n/udY47Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: MidG971 <midgy971@gmail.com>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ulf.hansson@linaro.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, xxm@rock-chips.com, chaoyi.chen@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, jonas@kwiboo.se
Subject: Re: [RFC PATCH v4 9/9] pmdomain: rockchip: Add a regulator to the RK3568 NPU
 power domain
Date: Wed, 08 Jul 2026 17:58:37 +0200
Message-ID: <3205744.kC03pvyZki@diego>
In-Reply-To: <CAPx+jO_2=SYo0smYzwd8T+TUtHZtgXU0dSWQgZGZ_haV3aOU_Q@mail.gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
 <20260613070116.438906-10-midgy971@gmail.com>
 <CAPx+jO_2=SYo0smYzwd8T+TUtHZtgXU0dSWQgZGZ_haV3aOU_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_085859_909436_29EBBBC6 
X-CRM114-Status: GOOD (  23.66  )
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

Hi Ulf,

Am Mittwoch, 8. Juli 2026, 17:24:04 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Ulf Hansson:
> On Sat, Jun 13, 2026 at 9:01=E2=80=AFAM MidG971 <midgy971@gmail.com> wrot=
e:
> >
> > From: Midgy BALON <midgy971@gmail.com>
> >
> > The RK3568 NPU rail (vdd_npu) needs to be enabled before the domain is
> > powered on and disabled after it is powered off. Give DOMAIN_RK3568 a
> > regulator parameter (like DOMAIN_RK3588 already has) so the NPU domain
> > can set need_regulator, letting genpd manage the rail wired up as the
> > domain's domain-supply instead of marking it always-on in DT.
> >
> > Suggested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > Signed-off-by: Midgy BALON <midgy971@gmail.com>
>=20
> This looks good to me. I assume this can be picked up independently of
> the other patches, whenever you decide to move forward from the RFC.
> If not, please let me know.

Correct, this could be applied any time.

>=20
> Kind regards
> Uffe
>=20
> > ---
> >  drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
> >  1 file changed, 25 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/=
rockchip/pm-domains.c
> > index 490bbb1d1d8e8..19db307e3811d 100644
> > --- a/drivers/pmdomain/rockchip/pm-domains.c
> > +++ b/drivers/pmdomain/rockchip/pm-domains.c
> > @@ -138,6 +138,20 @@ struct rockchip_pmu {
> >         .active_wakeup =3D wakeup,                        \
> >  }
> >
> > +#define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulat=
or)      \
> > +{                                                      \
> > +       .name =3D _name,                          \
> > +       .pwr_w_mask =3D (pwr) << 16,                      \
> > +       .pwr_mask =3D (pwr),                              \
> > +       .status_mask =3D (status),                        \
> > +       .req_w_mask =3D (req) << 16,                      \
> > +       .req_mask =3D (req),                              \
> > +       .idle_mask =3D (idle),                            \
> > +       .ack_mask =3D (ack),                              \
> > +       .active_wakeup =3D wakeup,                        \
> > +       .need_regulator =3D regulator,                    \
> > +}

but Midgy please do some alphabetical sorting ... in my book=20
    DOMAIN_M_R
should be _below_
    DOMAIN_M_G

> > +
> >  #define DOMAIN_M_G(_name, pwr, status, req, idle, ack, g_mask, wakeup,=
 keepon) \


Heiko


> >  {                                                      \
> >         .name =3D _name,                                  \
> > @@ -241,8 +255,8 @@ struct rockchip_pmu {
> >  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)            =
 \
> >         DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeu=
p, false)
> >
> > -#define DOMAIN_RK3568(name, pwr, req, wakeup)          \
> > -       DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
> > +#define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)              =
 \
> > +       DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
> >
> >  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset,=
 req, idle, g_mask, wakeup)      \
> >         DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_stat=
us, r_offset, req, idle, idle, g_mask, wakeup)
> > @@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562=
_pm_domains[] =3D {
> >  };
> >
> >  static const struct rockchip_domain_info rk3568_pm_domains[] =3D {
> > -       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2=
),  false),
> > -       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1=
),  false),
> > -       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3=
),  false),
> > -       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4=
),  false),
> > -       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5=
),  false),
> > -       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6=
),  false),
> > -       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8=
),  false),
> > -       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7=
),  false),
> > -       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(1=
1), false),
> > +       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2=
),  false, true),
> > +       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1=
),  false, false),
> > +       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3=
),  false, false),
> > +       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4=
),  false, false),
> > +       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5=
),  false, false),
> > +       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6=
),  false, false),
> > +       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8=
),  false, false),
> > +       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7=
),  false, false),
> > +       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(1=
1), false, false),
> >  };
> >
> >  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> > --
> > 2.39.5
> >
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
>=20





