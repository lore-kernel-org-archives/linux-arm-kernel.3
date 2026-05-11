Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C914CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 19:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOTjIaa1U5hMq9uBW5pbtBS83bE1arv/7hzssbbHaGU=; b=kndIHUwabO7fYqPztqJJPHKadk
	edsY/gu03okbWzGTvrYjzdY1qc528T/zRbHICh6xz8WIP8S0kMSlCyewEzB33Q+26nvR7CrlgXPSP
	+W7XYo7vsClCZn1dAX+wTSbAY06lxlJb66no65mRq6kQhIVUKwVxIpYXp3tB2zrjtQspRyUhFwjpE
	GQEkMcz+hGl/HYYen7hipESpawWUXaHIfU74Q5U5gpjeYMlRBgQq3qxg+tr8mGNDAV6h8oSC9G9kk
	fL9VDHdYSQl543pAVF6Zn2Y9qVlp1wo8kOjk0c0rW7t5wcHwrUHf0gfkm3veGXQQ5qmINzNARlax1
	4RZQEn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMW0A-0000000EZlu-0Qe2;
	Mon, 11 May 2026 19:09:14 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMW06-0000000EZkk-2Ph5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 19:09:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67e2498f3a7so7758027a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 12:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778526548; cv=none;
        d=google.com; s=arc-20240605;
        b=frVlOGrUd0DwEKHi6GaOLatQPyRnhb2ejz3EfJBFHUJHR0MZqqJ3esj6W/ecYKsyoy
         eMru9AUtwKxv4axbLYp8dS8T35yVC+5RoWeDZVpnQPPLTtRGEIIBj5Wn9Cp64Ca0tspw
         Nk4lGTesHJ7IkYOxv3oKoeM9aWbI1eQWEA/LTLTrK4NRTarOIt0hGPltTPFaq9HAoDtA
         jK1g5ssp0H/KJgX/0hsmMcsREDuccyKxpc42oHw3NootCqMHjjAkmRjLwpTq+G+amWua
         AnPzxBZZy9qYy3j1J5XYi2wQYUWvXCpo+T4iGuVfcl7up15u6kQGfugJp5Zkdod6RheT
         63rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOTjIaa1U5hMq9uBW5pbtBS83bE1arv/7hzssbbHaGU=;
        fh=0k4hw1etHCTN06r5wPdhmKsvBVZgfgE98Mev9R/cV88=;
        b=Z55kyV31SLfa0oogHdkdlH91dw1bpXx1P17fEzSKD5gfJ1V8P0yy7q3tqbSzTGbWFs
         O7rrk1DpGd5lcIcHw5vDRqufXJ5v5NGRzUQ+7VXq0ZbIjH++ybLJ9N92GV7j9ShqzdlO
         7S8o4SWq+EZcA7FRZDypvDFexwKpfJflvbet+XCD8gEqjsdb+yOc0Zz7U9qyau5yuigU
         6F+ipfDg4FUF+qUD8RkpHt7AcetyZ+oIUOsbHNkT1065YpN9qqXOf5LJjuA5Q2Mjmfqb
         OFqR4XwDSi53Fd692ST9Yybs0GJxeXy3mL7VadRBprw0acjQueCO3VRH/5FRRDyIRSqb
         BLSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778526548; x=1779131348; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOTjIaa1U5hMq9uBW5pbtBS83bE1arv/7hzssbbHaGU=;
        b=VHI/qNWQUQSZbL+WKkjUV2KtVUoq3QmQFRgqtyweF7R/oaxeV6PZNAIRaozLJCqc4F
         AcS3Ek+qFg054a2bR9cPGLMWtLPXFSTDBf0DXx/+ORHK6oPEnaC2NNYVz6vT071K5cij
         rNVw7BHdQ4VQmAn+p2/WeGgPHbSaK3cYk6tD58b6uR2Bbld+kPxfx3ZjCMInvhCg1W69
         4N5nWkU9pvep62kFJ3En1nNGCw9Q/VJTAD7IL0QvvdrNBNXZ2L/NuUjE62SZPuuEMPrg
         wgDMlfnU1823w9HuLzbb0mjXfRKWb4T/SKoIBaIODPWyRA6F1GOxJnvge0l3m/HKzxwX
         Gj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526548; x=1779131348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOTjIaa1U5hMq9uBW5pbtBS83bE1arv/7hzssbbHaGU=;
        b=T+QxAm+303s7oP0x5evIqM5RIOGOuoQJJv/nV5vPI0ZsoZT8g0owtRHIzbFInUQ2nN
         kwprnyP527uBXhoe/TIobXbpgbs16n9SiwuL63I4sn6AW0HktW+PM+cGaoXdl6PWC/07
         C+RyBaJkYMcZw5CR/L1EhWcwXMQsH0OHSjrR29rZRypmmtCnmUde6f35ieNQt5yxoyig
         VnWBDdN+V3ySlVNJI1IVMSgbbqihQIV21VC8XADzh5iNoYTrjUfzaRRwlmYOv9bl35yh
         qo02TGDjGyFvFSD0wF1A68qqlAkKiuPyOFSWONgHac3MZjCUwpH5U76st6QlU6+x0LdT
         v65Q==
X-Forwarded-Encrypted: i=1; AFNElJ/D6McAePO65kQpZcsR54HmsiYMwyzF0KaOIIbIsz0IVr5khKBWPQ5sqaABMDgJqiDT+zf8sHw0iLFc5YBIrSFI@lists.infradead.org
X-Gm-Message-State: AOJu0YxqypoYD1VamlsdBOfkBch3VgFqj+p2se8ZN46/QFXcXCivB9cI
	MtxfLm5hbrsnFmLAjtwHzDGfM5xZ99E4DJol46sgdAS3vRobo3zXGYfHrYDtZUIEufONZNYHKeB
	GI6nSPQafEhlkUCY2L7uKVffGCZivksY=
X-Gm-Gg: Acq92OGR268fQdv67rMahF4d1gr51OjHyy3wnhcEyCkowO4A6wL5THrX1KkInkpO6B6
	4QXwBw139jXdk5j+v9Tu+/qxArca5VX2CjbiO0v2FMDeQdAmLqYNCeskGWOepGPGw/HBORAc66t
	/0LeSUXOOzMA0yE2VxpGQOLd9Ik4XZ6bKw/M/7X4H6HMDB2uP+ln7BV3TblLxoMm/IIl6FIILiJ
	XhhIT+SZ88JmRE6V3tzA7di87toVFPYvg3MXv6raKCUuC1kSYDiJryP7eBg9yNmVu1snzhWqk/P
	igupp/1J4HJotNCq2kpiPXl1O80XbucnJ9PaWum2bGccwnW097MXxckhjYNwVQfrs4Pv5Bklwyh
	hX5DX5SYBD7+DZoAuuiAaCFveTjybeuz2viBJT7zAM0XjyHvaWb3Bd7hf3CxKjgNXIIYq
X-Received: by 2002:a05:6402:34ca:b0:67b:7d11:758e with SMTP id
 4fb4d7f45d1cf-67f709eda8emr5625760a12.11.1778526548340; Mon, 11 May 2026
 12:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260511032252.361906-1-rosenp@gmail.com> <agH-ivEdw12_3OJz@redhat.com>
In-Reply-To: <agH-ivEdw12_3OJz@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 May 2026 12:08:56 -0700
X-Gm-Features: AVHnY4KyFKhYps1EIl-0Wn5HhtmX4f1BubILShxhOA0VtEaA21RrQRgVM-Ihf6o
Message-ID: <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_120910_646178_EB89036A 
X-CRM114-Status: GOOD (  23.86  )
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

On Mon, May 11, 2026 at 9:06=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Rosen,
>
> On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> > Store the clock lookup table in the Rockchip clock provider
> > allocation instead of allocating it separately.
> >
> > This ties the table lifetime directly to the provider and removes a
> > separate allocation failure path while preserving the clk_onecell_data
> > lookup interface.
> >
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/clk/rockchip/clk.c | 17 ++++-------------
> >  drivers/clk/rockchip/clk.h |  2 ++
> >  2 files changed, 6 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> > index ee8c79b938d3..dbb4b6f33abb 100644
> > --- a/drivers/clk/rockchip/clk.c
> > +++ b/drivers/clk/rockchip/clk.c
> > @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk=
_init_base(
> >               unsigned long nr_clks, bool has_late_clocks)
> >  {
> >       struct rockchip_clk_provider *ctx;
> > -     struct clk **clk_table;
> >       struct clk *default_clk_val;
> >       int i;
> >
> >       default_clk_val =3D ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -EN=
OENT);
> >
> > -     ctx =3D kzalloc_obj(struct rockchip_clk_provider);
> > +     ctx =3D kzalloc_flex(*ctx, clk_table, nr_clks);
> >       if (!ctx)
> >               return ERR_PTR(-ENOMEM);
> >
> > -     clk_table =3D kzalloc_objs(struct clk *, nr_clks);
> > -     if (!clk_table)
> > -             goto err_free;
> > -
> >       for (i =3D 0; i < nr_clks; ++i)
> > -             clk_table[i] =3D default_clk_val;
> > +             ctx->clk_table[i] =3D default_clk_val;
> >
> > -     ctx->reg_base =3D base;
> > -     ctx->clk_data.clks =3D clk_table;
> >       ctx->clk_data.clk_num =3D nr_clks;
> > +     ctx->clk_data.clks =3D ctx->clk_table;
>
> Where's the __counted_by? Also struct clk_onecell_data is embedded
> inside struct rockchip_clk_provider, and I'm not sure offhand how
> that'll work.
Not present. __counted_by does not work with embedded struct members.
No need to add one IMO.
>
> Brian
>
>
> > +     ctx->reg_base =3D base;
> >       ctx->cru_node =3D np;
> >       spin_lock_init(&ctx->lock);
> >
> > @@ -388,10 +383,6 @@ static struct rockchip_clk_provider *rockchip_clk_=
init_base(
> >                                                  "rockchip,grf");
> >
> >       return ctx;
> > -
> > -err_free:
> > -     kfree(ctx);
> > -     return ERR_PTR(-ENOMEM);
> >  }
> >
> >  struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np=
,
> > diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> > index 9e3503e2ffc2..d4033bf750f5 100644
> > --- a/drivers/clk/rockchip/clk.h
> > +++ b/drivers/clk/rockchip/clk.h
> > @@ -604,6 +604,7 @@ struct rockchip_aux_grf {
> >   * @grf: regmap of the general-register-files syscon
> >   * @aux_grf_table: hashtable of auxiliary GRF regmaps, indexed by grf_=
type
> >   * @lock: maintains exclusion between callbacks for a given clock-prov=
ider.
> > + * @clk_table: clock lookup table.
> >   */
> >  struct rockchip_clk_provider {
> >       void __iomem *reg_base;
> > @@ -612,6 +613,7 @@ struct rockchip_clk_provider {
> >       struct regmap *grf;
> >       DECLARE_HASHTABLE(aux_grf_table, GRF_HASH_ORDER);
> >       spinlock_t lock;
> > +     struct clk *clk_table[];
> >  };
> >
> >  struct rockchip_pll_rate_table {
> > --
> > 2.54.0
> >
>

