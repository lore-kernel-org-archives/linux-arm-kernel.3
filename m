Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D64CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDfLIv6tiWpmACcsMnlD5yn+pQeqBizpoJHnp+m+Mek=; b=3IHeZyfgHFdJ9R1WXI5jsSvJoO
	g/bWwG+NkMFRZy/VZYstbanvWt535i13nEXNFMvn3TDBM0cNY36jg6zDFoYw7mAiBSM2ix0/MnP10
	QboDlPyNQg0hS6ljxOjmdt5DNvcgrG563KoUEb2I7soA69jzjQQowy/dSr3sKD00akJ1ChOl43Pwg
	BWIpiQTVx5uB7OWdGWhnzS/7l1qSBO70fNwfuFo1qOuFZoKDXA68onNhk5RTZwPOTEqy5sCNkYp0k
	V3yr3NF4C4HACL25DGcALYLuoAJPJE/Dz2Bxoe/lEw2s3gnOSFQn3jN95xjTF3QlJHlDsbzoBma6F
	RfN3/dNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXRl-0000000Ejis-2qpn;
	Mon, 11 May 2026 20:41:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXRf-0000000EjhT-1ABW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778532101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDfLIv6tiWpmACcsMnlD5yn+pQeqBizpoJHnp+m+Mek=;
	b=J5BjjX6BWmkvVStnPPEJnJ0dpkln2l9LC7c7EkwUk9MiwKsoEFOCFOpOnr53maUczpjNPs
	omxafssGgLLGafekPODPMMr8GFx45GXlWDN3n8bvDTJ87G43mMbtIXG43vCYiKYilQHzON
	O8hijnVC8dd3dIq1Eckwlz3oW1xpXxE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78---DAYjbnND-I1cRQuJtFVw-1; Mon, 11 May 2026 16:41:40 -0400
X-MC-Unique: --DAYjbnND-I1cRQuJtFVw-1
X-Mimecast-MFC-AGG-ID: --DAYjbnND-I1cRQuJtFVw_1778532099
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b55b5aa8c7so105299136d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778532099; x=1779136899;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDfLIv6tiWpmACcsMnlD5yn+pQeqBizpoJHnp+m+Mek=;
        b=dQDFmlMpJbzTGgDclPY2+9AapqQsLyLyLxS1BAg6QCnap16zoaoAlNhuEjAytW6D0P
         LgvqBgNJWNWlh0/mh1cF0tPCX0NFn2Or0ySj97ht0HAiLjLi/Uno1RwsshreeLLnDeJQ
         qUfLsXua83bNVMxrULK5rp/p5MDKVtgA1fa8dAzMwb0GwV87Z4Mf9ciaivBUMNQcyiwm
         XVkluZ6HZapjhsO+uBb+ZpYOxwnSF9NEItdCoIaUJDE3P9RYV7jCwRgd+Z8XJXgfAotk
         hFGIbLIbyOWAJGba+s0qxuQQLExGFWTEKnSBudUQNt539iQ/I4Lj4xZGcl+vXhkp3fJR
         yNpg==
X-Forwarded-Encrypted: i=1; AFNElJ9b14XEhw4aXkG1ni6a18Q4rtVGP5crXwAwn4Umc7/U8doCaprgO+XmWqN3OJ4EyJ6nA8Oy/SMYFzYDuLXk37u2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe8aRmircJXor+v1Jdr+palWe9XuZekK1rWqHOrS8sOLhjdV76
	pGy8fCKWova1avwfWKX6XdnCw7jSyswIg2cl5fB75u7AlQoPcKz5lcxuK8VSion0F8IlWUcIgPm
	86Z6LQo8Nmx2gPgdICzntAhctiX39dR+E/aRLUykbmz1jZJNmOzQOa09glHgMFunEF8qB4WTCYx
	Aa
X-Gm-Gg: Acq92OHfxkzP6xS2XYIW0QDDwdguK7wQIW9I76bVC0YfODBPKZH+4zsWi/DsnL8f+IV
	2l9jk8f5rqcl+PLZ3Qgc0rTlBZ3+0Mdmuofz4gwQ17d6D89LnN7pytlgIAZLVFNsHUSjtokfQw3
	38HYofOCGTCsp+KeqkMxuVVsiU9DkUQf3li0Qzqt1/hb8rVuKF+1yS+aRq+LXLlDFfRZAqXlDxX
	myWPLjK1nfSmOy3zmlgq6EHofUnyan5V+T59bXST0vIp6E5rjRxAtKLoFqEjBYYQnBZiqtxzBDl
	rjmAUbgdDanU7+Zi64xeF88pNOenG5kJla/M3WgY72JJg1T76d8GGWuJdZ3qhCCqOQ//V02JrD7
	ocfsANcWp1o+W8SCLGp/X8kLJGFtfOZQAKLaFipbka6gs/0Wo9RpQtOet
X-Received: by 2002:a05:6214:3c8c:b0:8ba:942:3e38 with SMTP id 6a1803df08f44-8c661e86acdmr4794246d6.19.1778532099476;
        Mon, 11 May 2026 13:41:39 -0700 (PDT)
X-Received: by 2002:a05:6214:3c8c:b0:8ba:942:3e38 with SMTP id 6a1803df08f44-8c661e86acdmr4793766d6.19.1778532098935;
        Mon, 11 May 2026 13:41:38 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c4c9dsm108806616d6.5.2026.05.11.13.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:41:38 -0700 (PDT)
Date: Mon, 11 May 2026 16:41:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
Message-ID: <agI_ANymmPyyWxuE@redhat.com>
References: <20260511032252.361906-1-rosenp@gmail.com>
 <agH-ivEdw12_3OJz@redhat.com>
 <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YVK1yO1b_rmcQ8YNgBsH1XKpoJe7FjhVPNp-yTKBqZ4_1778532099
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_134143_387242_AE36F71C 
X-CRM114-Status: GOOD (  24.64  )
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

+ Gustavo

On Mon, May 11, 2026 at 12:08:56PM -0700, Rosen Penev wrote:
> On Mon, May 11, 2026 at 9:06 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > Hi Rosen,
> >
> > On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> > > Store the clock lookup table in the Rockchip clock provider
> > > allocation instead of allocating it separately.
> > >
> > > This ties the table lifetime directly to the provider and removes a
> > > separate allocation failure path while preserving the clk_onecell_data
> > > lookup interface.
> > >
> > > Assisted-by: Codex:GPT-5.5
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/clk/rockchip/clk.c | 17 ++++-------------
> > >  drivers/clk/rockchip/clk.h |  2 ++
> > >  2 files changed, 6 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> > > index ee8c79b938d3..dbb4b6f33abb 100644
> > > --- a/drivers/clk/rockchip/clk.c
> > > +++ b/drivers/clk/rockchip/clk.c
> > > @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
> > >               unsigned long nr_clks, bool has_late_clocks)
> > >  {
> > >       struct rockchip_clk_provider *ctx;
> > > -     struct clk **clk_table;
> > >       struct clk *default_clk_val;
> > >       int i;
> > >
> > >       default_clk_val = ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -ENOENT);
> > >
> > > -     ctx = kzalloc_obj(struct rockchip_clk_provider);
> > > +     ctx = kzalloc_flex(*ctx, clk_table, nr_clks);
> > >       if (!ctx)
> > >               return ERR_PTR(-ENOMEM);
> > >
> > > -     clk_table = kzalloc_objs(struct clk *, nr_clks);
> > > -     if (!clk_table)
> > > -             goto err_free;
> > > -
> > >       for (i = 0; i < nr_clks; ++i)
> > > -             clk_table[i] = default_clk_val;
> > > +             ctx->clk_table[i] = default_clk_val;
> > >
> > > -     ctx->reg_base = base;
> > > -     ctx->clk_data.clks = clk_table;
> > >       ctx->clk_data.clk_num = nr_clks;
> > > +     ctx->clk_data.clks = ctx->clk_table;
> >
> > Where's the __counted_by? Also struct clk_onecell_data is embedded
> > inside struct rockchip_clk_provider, and I'm not sure offhand how
> > that'll work.
> Not present. __counted_by does not work with embedded struct members.
> No need to add one IMO.

I'll be honest that I'm not sure what's correct here. I added Gustavo
since I saw comments from him before about these types of changes.

Brian


