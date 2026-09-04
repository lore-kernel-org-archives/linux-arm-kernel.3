Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC45C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=; b=CXvUa0Iv/oVEkLscJlosB7JoKs
	T1rNaQdZVlk7DsEfmA1FOU6gKM5xB6lST1ulF+7MrsvzFmXOYMggLxIixJxO37NnO3CnW7N91BkUO
	KlHlWkeuQ61kTMiEMKtUO/Or6Yh9YFEEDTpxctk06MbDr6TB/2Ulg/95QTBzBZaXtsajiHif2T8F7
	whShnQExhfpnNRMFy9Ug3SyNHQuyaf9poIcULd/HRHtPV6zNZXHcnS9C2ebOHd3OgeCt8OVyvhSdJ
	TT/9B9i89L9Wri4BgxVzF3j6P2HPsqNbNXZ04htFL6TVJ0/GsWA9qcLf00N44tzEnzTuIoku5/OOs
	5d914FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bfM-00000003L2G-0ZaW;
	Fri, 04 Sep 2026 21:41:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bfK-00000003L1b-0lOS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:41:43 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so2399615a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788558099; cv=none;
        d=google.com; s=arc-20260327;
        b=QCUoQq17PeDJ0UnSY7c5jiYJOjT+XL8qokXMwETwYQ+aPhOaYeyBB8aUyl2S8waScq
         IJnlmQgYp6yQtKsvSYjCa7R/9/h1PRZeyjpJ4iCjc0PQquL+3ujRY3gy9NpUpT6O0tjB
         GRfVHtHJiOi6fxmVW3pmIZ8lnbj0awaMjjcQtBWy/zkP2iNexhOtT/i/6tBU9N7v6HPB
         U/58j9NUwDxsDzsbeb3vgPqntN+owjxdDb1sMzUy9WgABnR6VNMvSwZ3Do9su3nmtZlW
         e7SZDAdq1usufO6/BDa5ae64VwdmPiJwig2MPCHeAr7p33D4p4ww9sAuvq4TOTyhwGQc
         A8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        fh=DlFdfwHQ83CI9gssfDOAQRGrh1qqlsyG5ZMKhlAelnU=;
        b=bo1heXu7gOAOhAO/br3Z+mg5QAZuz7eiwDx+pE9ewplQHqpjlFH0V8fmaRJgPuVzAY
         eaSSgNhqPOUn0PpEV9cd0BCT2n1FBgf5fEVK+sdBndSdqXMejIZwZIJ6V8Gjda5CL6kn
         UZxtvfilc1dqALhw4ZNS0nb28+j8bmR4XQTHOHynDrIJm3k5EXmiC33HuI8SfpDy9PPa
         tywMn+zmvBdMclG0lCBcQWSBqueNRhNEYfs2wGk3H6UA2+cTe37HKWPAQbSvD6DxLsa2
         X8lFWay6JeS1b4qOqHbpT37iTQWl/Ae6W5UdytN7JU68gw3cUXO687uY2f9lCJHWFwUk
         9h4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558099; x=1789162899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        b=SPSzU6/CnA6vnRGXi6d3FQG+jgydnlD5NYk6OT6kC0Mw/CtwXUkgXM0tTeBm5rPSEW
         yjihMHz5NavoY1kL6ky/O25ya95Xz4AFNqoFTeirTivvmbWz/jvVm2WrJ35Ki8LV7N1w
         lx842zj5va4gibMgn3LMoztzOPdolXYZf+zOHyV2LZa3SUSB0nODd9Li60GzXStfo9qs
         uzKtGTpVpUK8ug1ByUDbXkbwTKD1u3WrxSyJy7cqZURMuzrdBipo4doTp+VJ8Cjq7ihY
         DDc2GIMeKT8aTPw9ULyVRYOxuM5PJgSFzfnMdv/UJlQrShdHG2PqHSYmEhpowDhnscaI
         OSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558099; x=1789162899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        b=ggHdKR3P3DGPDZzPWW4JL+mh7iT/TnSgQqn0e8g44ORqw5j/Eo2XYVWL48mQjwFMz3
         L1SJ6G0J0sJUbBU4QmN/rRER6BUzkuJaOx2/C5wNlPF/hFTTdNBzRUfLTnRCA3ESu/s0
         mPEbXsaTy3wByDJCJWv2ocDssnxH9xoJue9zu0FzlDfoRxx+zI68hU9DipoS/PhlhD0U
         78kees/8q9dl+cLIh/jVkDYkHyO87cbrc62/g5SkamrhiSUvsWOAc51YrUPbA+losbI8
         VewRj62/V2TeiIJrRy8Cc2f7EIP1TdOFSbxabPIg3faO48Ff/jV2f1lu0oZuhF5kVTvV
         lCHw==
X-Forwarded-Encrypted: i=1; AKwUvBz1kFbwC4A8j24C/X1gWLmFW+TZQtWVWCKVHsexbi1GHXDhl4OQ4ZHN9qXvnizJbci3q8esMYaLmQZNX283X+g9@lists.infradead.org
X-Gm-Message-State: AFuF++mlHjRFhHIoKM/4NHYqdRTEudLjfCC1HjODDJXK4uyMpl9xxdkC
	LMuFTUZMEdJoxMQbAVQnTzFmGXWFM7yD/W31qJB6ceD54ivAX+1IM4ZSgmKkfGb4554jLxY11xp
	mLg+ZMVIJgHkn0jyWcf7CSAMnupZ3/Qg=
X-Gm-Gg: AYBFou3JpANUEZ0TJQnTviIk9+Rad2cljYGS89YvmgJ56imdmp4QBaek3ovDJNpgE7W
	kduXvyX0gS8FPjWs7jNKNNF3tlErrOhzF4YwHZZHdo6JN6x39yhWDdAyhe83MjlC+gh4z2aJeI1
	xd2PhA5p6FjC8fb3GKywekMKDDQFEAXvq0CRE69UGggxmXSAWVs9Pew333tqBOKk2eEu4F+InBT
	QqpqMaug6u1HwRYYvpW0l+JlmJLJ5uBYMCbuRiqJnF3mGlRjXymuU2r9uv9hctite+9mtDXgPou
	HrENZY67+xmGCjGYiw/DrUIBw1jRGIXO7ANwLqfT0Su0uKGIluQbBvnbk8cjaihxKbjpZWSeeWH
	JRy8tfJb0NQ6PmEUavXVDOiEjZe26plznezCDTPBuNhE1PUMc29F0RWx6B2ynLGsr4haj1XTYtn
	dU5714R3fzBJdbx4EMPi8W5DTtegZg/pu3NvWUZVjW8HWQfk9Hf/9AYhBKf1Nj/bzYoA==
X-Received: by 2002:a05:6402:2752:b0:6a7:ea54:376 with SMTP id
 4fb4d7f45d1cf-6a7ea541ef3mr2147241a12.30.1788558099252; Fri, 04 Sep 2026
 14:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260511032252.361906-1-rosenp@gmail.com> <agH-ivEdw12_3OJz@redhat.com>
 <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com> <agI_ANymmPyyWxuE@redhat.com>
In-Reply-To: <agI_ANymmPyyWxuE@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Sep 2026 14:41:27 -0700
X-Gm-Features: AcwNN1VOkSQ_1hll8MMht--OgvQL0IoR_OsYRYOz3Zmp855n0-aj2ZBGahPJ2b8
Message-ID: <CAKxU2N8YimZyKFoWtHT+FZwzD1R+MzvaXoCu0MhVEzvGHd9VhA@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_144142_254200_80F394AB 
X-CRM114-Status: GOOD (  25.90  )
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

On Mon, May 11, 2026 at 1:41=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> + Gustavo
>
> On Mon, May 11, 2026 at 12:08:56PM -0700, Rosen Penev wrote:
> > On Mon, May 11, 2026 at 9:06=E2=80=AFAM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > > Hi Rosen,
> > >
> > > On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> > > > Store the clock lookup table in the Rockchip clock provider
> > > > allocation instead of allocating it separately.
> > > >
> > > > This ties the table lifetime directly to the provider and removes a
> > > > separate allocation failure path while preserving the clk_onecell_d=
ata
> > > > lookup interface.
> > > >
> > > > Assisted-by: Codex:GPT-5.5
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/clk/rockchip/clk.c | 17 ++++-------------
> > > >  drivers/clk/rockchip/clk.h |  2 ++
> > > >  2 files changed, 6 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.=
c
> > > > index ee8c79b938d3..dbb4b6f33abb 100644
> > > > --- a/drivers/clk/rockchip/clk.c
> > > > +++ b/drivers/clk/rockchip/clk.c
> > > > @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip=
_clk_init_base(
> > > >               unsigned long nr_clks, bool has_late_clocks)
> > > >  {
> > > >       struct rockchip_clk_provider *ctx;
> > > > -     struct clk **clk_table;
> > > >       struct clk *default_clk_val;
> > > >       int i;
> > > >
> > > >       default_clk_val =3D ERR_PTR(has_late_clocks ? -EPROBE_DEFER :=
 -ENOENT);
> > > >
> > > > -     ctx =3D kzalloc_obj(struct rockchip_clk_provider);
> > > > +     ctx =3D kzalloc_flex(*ctx, clk_table, nr_clks);
> > > >       if (!ctx)
> > > >               return ERR_PTR(-ENOMEM);
> > > >
> > > > -     clk_table =3D kzalloc_objs(struct clk *, nr_clks);
> > > > -     if (!clk_table)
> > > > -             goto err_free;
> > > > -
> > > >       for (i =3D 0; i < nr_clks; ++i)
> > > > -             clk_table[i] =3D default_clk_val;
> > > > +             ctx->clk_table[i] =3D default_clk_val;
> > > >
> > > > -     ctx->reg_base =3D base;
> > > > -     ctx->clk_data.clks =3D clk_table;
> > > >       ctx->clk_data.clk_num =3D nr_clks;
> > > > +     ctx->clk_data.clks =3D ctx->clk_table;
> > >
> > > Where's the __counted_by? Also struct clk_onecell_data is embedded
> > > inside struct rockchip_clk_provider, and I'm not sure offhand how
> > > that'll work.
> > Not present. __counted_by does not work with embedded struct members.
> > No need to add one IMO.
>
> I'll be honest that I'm not sure what's correct here. I added Gustavo
> since I saw comments from him before about these types of changes.
Anything else? The comments AFAIK were about descriptions of why the
counting variable assignment was moved. There's no counting variable
here.
>
> Brian
>

