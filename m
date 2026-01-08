Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444C7D1D496
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=; b=xh2JqoncPE8BTlmgg0Z2wxhcQb
	jCCnluXuPWxVwp6GZKDR5ASn+C/ulofo3cCBf8ondgm8n5yqn6DGRHCeh2Fi7RcNXqyQPbHwaQxLj
	FfxEmXW1RATpPGn0eJWZiE+MKB61Y6hnykthVm9utbK/CvTJ6Fv64pz4H0vHPowuR0e51dYY4EZq7
	GH1yXDyV9wqX+3WTMLc7OxQP4zMYUAW3uSfmUDEcAQWV6HQUeMJMZiXRsrQGo8Yep6YQnzUNURUgQ
	Kl/je87oPgxoNtCIT9pLituejuoQHaC6zcsyNk0+ynYQv6+9TpPfku+p/ZeSd5yCGf5TBHZvdb8aq
	8ksiCJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxU2-00000000u6l-31qK;
	Thu, 08 Jan 2026 21:23:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxTz-00000000u5W-45n4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
	b=Uf7uzfNJ3+JSJCkeGBiusv/Kt7p1mxr2a1YeOLNrN0ZKArxnRyPkIes1TQa2m9iE2nTc/C
	FtR2nf/nN65TFVxroidR3GAK+iYvvB13tMCHsTz1LLABaX/oMMRxaV0u/DrVRLjLy9QTcb
	9hJYP+016PKwfrm1ol4yQuFj2QV5Qrg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-IRUGdbEXMKeGwJ308ORFww-1; Thu, 08 Jan 2026 16:23:49 -0500
X-MC-Unique: IRUGdbEXMKeGwJ308ORFww-1
X-Mimecast-MFC-AGG-ID: IRUGdbEXMKeGwJ308ORFww_1767907429
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94125ded3dbso8232502241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907429; x=1768512229;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
        b=F5iA2GmvRPQes05THvUQ92Yz8iX+IgKBmt/F74JYbC1AyFw+os249LS2eR7jxBgibV
         XCxK+EBeXhNAIwwwDzNBvDphIoAF+kqzvdkm2IieL2huaVvbOEti4idaHBcMo+Qj1/o7
         pqQygh0hVAWv8Q/MyoghIAcaxd2+5CmmrKXkRdTZKhUT65FVW8MUtJDRnOenRifvHrZ+
         fX+8vN0wxup+1rtx/XwO0n3gVoYL4E0dmeIq7AQVQxE/8rh7ieUbAL5preEXOJYVpz2u
         I6zbiqjFNY5aHKrLYZlfwnVtkocEdVG9nD/qPk1bpXS2X0SbdJCPk7dA9eXps31HyZlo
         hVRg==
X-Forwarded-Encrypted: i=1; AJvYcCVsduaKW6EJfpVpxQAJ2M3gWlN2h687YOhGcoPcpU7cA4xaRVAwZBI+LJaPOXcfPgjcN3GJMl8/FSqXvB6L5TLT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl4mQA2d1b7eXdtKe5vLOBCnb4QLtFQAWV/ypekCkgepH0Qpzi
	F0aJzczQS9cTRmNtX0d15pFNYaWzQMVtBZ0ZJ0SwfNjwcKrLWU4sMddfBErLA4ROTTWqyxnk8qW
	fUvSIt4ZgzBd4ZwquagQa5eNsJghXycjnEICbOAIwfbGDcipRovbeJBrGtCgwJZv9FfYzmwujlf
	UK
X-Gm-Gg: AY/fxX62MTDxVly5hmVMOAchuHSyODGyLi4dIm7I7TkFhmIoj8269Hcqxkp5KnmYa76
	B6jLdaotR+T9mf+DpGWIgyb2wq7KKZCd1uLE4VNX3G51qS6EQ1WPWatMABG1dVErHTR6wSn7QhA
	EUs37i7wXXd6btTP7wjvQaPYAcOBx2lEfbrpOBCohHajRURBQgfVj+JquPKoxkvutr6u3JEMuf9
	SyZIU5WYgWmtd5/53bAbOVaOh9DdcvbZcrVifeI5I76wux9yW0XNMkKKpeZ6wMZEz0NyJMlywGT
	ttIcKc78tvQ2JhQ4s5E8eIf9A8eFwO65+X3ZY7IteIwjodaPdjeopfGn/+Rjz/zUetoZkSQuY1Q
	oSHKI+alO
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5eea76a8724mr1006307137.33.1767907429138;
        Thu, 08 Jan 2026 13:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9+XK5E3OQPztXIo7GPKPfvpra0LA99i0XMQua/Tc/8Kj6tPqIGZY+3/QAUKTGxXE41kQHWQ==
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5eea76a8724mr1006294137.33.1767907428708;
        Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Received: from redhat.com ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e322asm7790577137.13.2026.01.08.13.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Date: Thu, 8 Jan 2026 16:23:34 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
Message-ID: <aWAgVt599agpNqZQ@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
 <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
 <aVurM1XRqiYlzi1B@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aVurM1XRqiYlzi1B@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hXD5mYLx4Aesj5v7I2Go5pP9K_th2ZCxoBeurhbz7Nk_1767907429
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_132352_273166_B4C47D00 
X-CRM114-Status: GOOD (  29.02  )
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

Hi Geert,

On Mon, Jan 05, 2026 at 07:14:43AM -0500, Brian Masney wrote:
> On Mon, Dec 29, 2025 at 11:18:52AM +0100, Geert Uytterhoeven wrote:
> > Hi Brian,
> > 
> > On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > on the cover letter of this series.
> > >
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
> > ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
> > in phy/next
> > 
> > > --- a/drivers/phy/ti/phy-j721e-wiz.c
> > > +++ b/drivers/phy/ti/phy-j721e-wiz.c
> > > @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
> > >         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
> > >  }
> > >
> > > -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> > > -                                  unsigned long *prate)
> > > +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> > > +                                     struct clk_rate_request *req)
> > >  {
> > >         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
> > >
> > > -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> > > +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> > > +                                      div->table, 2, 0x0);
> > 
> > Is this correct?  divider_round_rate() can return a negative error code
> > (from divider_ro_determine_rate()), which is not handled here?
> > 
> > Looks like several other users of divider_round_rate() use this
> > same logic, and thus are affected, too.
> 
> Thanks for the review! You are correct that this is a bug.
> 
> I had planned once round_rate is removed from the clk core to post a
> series to remove divider_round_rate() and divider_ro_round_rate() (plus
> the _parent functions) since they call the corresponding determine_rate
> functions. I'll bump that up on my todo list this week.

I posted a series that fixes the issue you identified, plus removes
those deprecated APIs all in one go.

https://lore.kernel.org/linux-clk/20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com/T/#t

Brian


