Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7201C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOSc/4c9SbQQBCe93XY6xPCkzEFokZXSPeuKf38HAZs=; b=gBCywx5R6J597okrPAivbqoOMe
	eo9Vp/NZnU7D+hQjIAJF+7jCYRLZ9rI2z+X4rwt87eDeqKcJn920McoEKi0bxUmwQAA6xlT6gADFv
	Egh4K1imZD33Qj52SGJOmtfv95EE6o5K0jyNV5Vl0DQGiw1hr+/jVSK7+nuBubBlSHJiOjcJvL7+G
	4UwWZXdNbDC6sY6A+03TnEEX9BIpHtIOAf9Ae/zove3Ndk/DYBArq7GkXbcENPZVMGBfp+BhOOjpU
	qmqLpLb36jWuolFD3ZJyjYN+QrBYOP/lyVe8zfbrx0E248AawAy6tvIiZkn3ARb78qNBWmrcE2TOr
	hNhtX+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyyg-00000003BUL-2Gwh;
	Fri, 14 Aug 2026 20:58:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyye-00000003BTy-0R3J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:58:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2363911a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 13:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786741086; cv=none;
        d=google.com; s=arc-20260327;
        b=NkDHYHagnoV3+KkvtArYrVmjWbR46u5zZ/2lW+/XsV0RkiwuDbNjr/EoDFumsoBIq2
         jVyrG32pp5XbQY2+lR6m3VwtsXMa9le74RyqtcB3SBYIr/v1VV7DrkF+yLRzQoixer6+
         LIDo5my++bRrCoIw0HbiG0d7dOrecjss9+68hsNOS6CKNY7frFBYOmyNTINNWUkNz3Td
         fFLAx4TEqcE++36H/y9voECPkLPow6n+s2LfRfbDa1q5f3GRJ5qeGuWsMmCTDh0IEiDM
         x3HeUzLaQLuuuBgO+qhKuDJnrdORGjo8la4gFQinFcHa9YeQDBF/5EpqdZGke6Fn90CA
         S8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LOSc/4c9SbQQBCe93XY6xPCkzEFokZXSPeuKf38HAZs=;
        fh=64LBYNXHPtO7UJc6PJk8EUN+gYUJ0hSsPlAqeKx1bFE=;
        b=XWD3uzbAbxPYsU1QKJTsyyEn/iP0ubG2XsGuhgDT7rknnDMF8xVGciKCdVRraLqH38
         5+whGaJIreCyWpAnWZ+X57P8TO0lXgJfnGEWqaaFvFsRcM8NaKjVzKuxgtTtmU+QNNVV
         2tVEtVygpv9vM8AdtWP3skBYHmuulDCazt83wC/hFWYrGtQw+TKQAv7NDiYJmhhsMP3B
         EewWCHIyxzkb1zkyuqbPoKpRXXaT0+9tjAlzcgxmNis9PBucz8r80nVc/V2I4j0911ax
         ZpYBpy7y2qA0lD3DF3KG9eIfUWhocZID4cjxoLiNa8XReUHq130nyBTc/oIin+Q3fywE
         K3og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786741086; x=1787345886; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LOSc/4c9SbQQBCe93XY6xPCkzEFokZXSPeuKf38HAZs=;
        b=VSqYvYEZzMCq93cCJssJvWlNw5MqXkae52qciZl18vGNyVPhXxCZzLccOlNNA/6s8S
         r5/z6emYHxnUFfimwK6WLNShh4gAKb5ErM3Q0wptVUex690wxP6ya9eLR9RMMFBUbtVs
         5Nkic3na5wQ8tdnEHCf0NBa/HGtNnT2yJZkZwNN3rYQDs7w8/I79Laq+prjLWt/QjdCl
         vi13vlkytcj6xIGNMxmDa8vaRqw3y0tpMpebQTNrbi9zp2XZmgf9syOv+ZASSsnkeyOV
         Mco/JZPyWCuR7q+v52HtNXQadiQA4sZxbMCyg8w/5Ux5qMC5oyZEiY3S5jZqMSoKFRg8
         ObgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741086; x=1787345886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOSc/4c9SbQQBCe93XY6xPCkzEFokZXSPeuKf38HAZs=;
        b=oii3t68Mm1msAVCTgFsfohFxXMaoHk+kgufzb2g9r4qIBkxzhoad/XfSkrS4K+I6U2
         qa9zziH2SmyL4EI1kjUVwLCB3YLTUwZ5MrmG/3Vqb/yMFk904J36Pzo68xW7B5doR97C
         1G+O6mWGU4zhQNyOMqetNCQL5Ry4Y2Af9W74FsLOyRwKuy+PKWC/U1dhXzMB2lQ+MNpc
         YRKNVeicbzKiUU++Hcn/w8OMt0oOwUiDxCETzmi5MF2wARYZ7f//oKkV87yHkGgJXCLK
         Lu1LqcAimWLpFdppPSKf1C+A1IPoLmGrs+hgJr48pebvih7SW1Kidpx+CaJmXHFCRDy4
         71QQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMnju7yIYaSJr2pF8oov49KAbLCVWdLutI1fxbmrw0G9IsOwihM31a7BTf6SDailfN6rmndLXVOct25zDYaRrz@lists.infradead.org
X-Gm-Message-State: AOJu0YzbkoCt8EMsOv44n5MdGJ0QgPdq6TotLdj20xRg6dh7jg0OLPw/
	Mp3mI2Ip98dbZXmgFcBxfPfVj8KokpEPWkZl5DJbF5nXIXVWHKZjjY6CPHQw05lYRLoi0Khmn1I
	SI6YXziIK/w7prnkM+71bREFpvfJwxOE=
X-Gm-Gg: AR+sD10aZFJxV9iG8Cm9oApixpJKNj/5aYLQxG3B1Q7Zm8LJX7l9zHv4XSk7fH/VHD4
	WHamRnRSlAjbAGETBqMtSyz6LaiWbaJ+SrYt+wa9v8xyKQRFF3ixkclSLhRNNzbbYgoPbaVPMn+
	Kq6fDW05oKUn3iBLccGBceWfq8F0kE0Qzb/0rluw+8JFJqniFo3bd3eWeiv+ujH0ZVhDb1XoFHs
	K+PlAFJ+y08zCTs6fcG74VyHtrNhALkDCcbaeeIm7mgNQG9xUpG0tpjC/naXllk5DREuhZwzrdM
	Zycr2gAuMF9X7T85ELPqG7/ujeYEHX87w7PW642WTLQ0f/qz22UFBNToTpahNsHqfaLU5I4K2gM
	8kcx1fn7fy3ZxjyF5xpMG4/HrVxVJ+D7zjWAZrHXmhGDlxijUBug1w/XZd8TIT4WPVKlRyVjWO+
	FoQJlUPpDl85aAqJajBt6/vBZFwu9XjJCtyeMRlkiTBduh7tw/hy608Bw=
X-Received: by 2002:a05:6402:914:b0:6a3:691a:9d71 with SMTP id
 4fb4d7f45d1cf-6a38a957c26mr4430136a12.11.1786741085853; Fri, 14 Aug 2026
 13:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260727194208.10082-1-rosenp@gmail.com> <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
In-Reply-To: <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 14 Aug 2026 13:57:54 -0700
X-Gm-Features: AcwNN1X2VjIXLPSnb7iCG-Vzo6JnErx51Wj3qJ1nwrzVQVCAOL_rU0eaB-XX0V4
Message-ID: <CAKxU2N9MDwrEpVZ3Wm11K=kf2Q4Dq=nOTd20eux3iw4_fQy3JQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:MAILBOX API" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_135808_184834_F74F26BB 
X-CRM114-Status: GOOD (  35.37  )
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

On Tue, Jul 28, 2026 at 8:56=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Jul 28, 2026 at 3:42=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > Replace irq_of_parse_and_map() with platform_get_irq() and move both
> > IRQ and MMIO resource acquisition to the top of probe, before any
> > allocations, for early error exit.
>
> There's no real reason for the code movement. It's going to fail once
> or maybe twice at the most. And the ones you moved are the least likely
> to fail.
Not my experience. They can and do return -EPROBE_DEFER with some
drivers. No idea about this one in particular.
>
> Now I could see replacing irq_of_parse_and_map() with the more standard
> platform_get_irq(), but you haven't given a reasonable reason. And it
> should be a separate patch since it has nothing to do with streamlining
> the error handling and dropping the remove function.
>
> > Switch from devm_clk_get() + clk_prepare_enable() to
> > devm_clk_get_enabled(), which combines both operations and registers
> > devres callbacks for automatic disable/unprepare on unbind. This
> > eliminates the manual err_disable_unprepare error path and the
> > remove callback entirely.
> >
> > Use devm_mbox_controller_register() for devres-managed controller
> > registration, and drop the remove callback and platform_set_drvdata()
> > which are no longer needed.
>
> These two are what are important.
>
> > Assisted-by: Opencode:Big-Pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
> >  1 file changed, 18 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msg=
box.c
> > index 6ba6920f4645..28d8636afad2 100644
> > --- a/drivers/mailbox/sun6i-msgbox.c
> > +++ b/drivers/mailbox/sun6i-msgbox.c
> > @@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_devi=
ce *pdev)
> >         struct mbox_chan *chans;
> >         struct reset_control *reset;
> >         struct sun6i_msgbox *mbox;
> > +       void __iomem *regs;
> >         int i, ret;
> > +       int irq;
> > +
> > +       irq =3D platform_get_irq(pdev, 0);
> > +       if (irq < 0)
> > +               return irq;
> > +
> > +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(regs))
> > +               return PTR_ERR(regs);
> >
> >         mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> >         if (!mbox)
> > @@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_dev=
ice *pdev)
> >         for (i =3D 0; i < NUM_CHANS; ++i)
> >                 chans[i].con_priv =3D mbox;
> >
> > -       mbox->clk =3D devm_clk_get(dev, NULL);
> > +       mbox->clk =3D devm_clk_get_enabled(dev, NULL);
> >         if (IS_ERR(mbox->clk)) {
> >                 ret =3D PTR_ERR(mbox->clk);
> >                 dev_err(dev, "Failed to get clock: %d\n", ret);
> >                 return ret;
> >         }
> >
> > -       ret =3D clk_prepare_enable(mbox->clk);
> > -       if (ret) {
> > -               dev_err(dev, "Failed to enable clock: %d\n", ret);
> > -               return ret;
> > -       }
> > -
> >         reset =3D devm_reset_control_get_exclusive(dev, NULL);
> >         if (IS_ERR(reset)) {
> >                 ret =3D PTR_ERR(reset);
> >                 dev_err(dev, "Failed to get reset control: %d\n", ret);
> > -               goto err_disable_unprepare;
> > +               return ret;
> >         }
> >
> >         /*
> > @@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_dev=
ice *pdev)
> >         ret =3D reset_control_deassert(reset);
> >         if (ret) {
> >                 dev_err(dev, "Failed to deassert reset: %d\n", ret);
> > -               goto err_disable_unprepare;
> > +               return ret;
> >         }
> >
> > -       mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(mbox->regs)) {
> > -               ret =3D PTR_ERR(mbox->regs);
> > -               dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
> > -               goto err_disable_unprepare;
> > -       }
> > +       mbox->regs =3D regs;
> >
> >         /* Disable all IRQs for this end of the msgbox. */
> >         writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
> >
> > -       ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node=
, 0),
> > -                              sun6i_msgbox_irq, 0, dev_name(dev), mbox=
);
> > -       if (ret) {
> > -               dev_err(dev, "Failed to register IRQ handler: %d\n", re=
t);
> > -               goto err_disable_unprepare;
> > -       }
> > +       ret =3D devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_nam=
e(dev), mbox);
> > +       if (ret)
> > +               return ret;
> >
> >         mbox->controller.dev           =3D dev;
> >         mbox->controller.ops           =3D &sun6i_msgbox_chan_ops;
> > @@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_devi=
ce *pdev)
> >         mbox->controller.txpoll_period =3D 5;
> >
> >         spin_lock_init(&mbox->lock);
> > -       platform_set_drvdata(pdev, mbox);
> > -
> > -       ret =3D mbox_controller_register(&mbox->controller);
> > -       if (ret) {
> > -               dev_err(dev, "Failed to register controller: %d\n", ret=
);
> > -               goto err_disable_unprepare;
> > -       }
> > -
> > -       return 0;
> > -
> > -err_disable_unprepare:
> > -       clk_disable_unprepare(mbox->clk);
> > -
> > -       return ret;
> > -}
> > -
> > -static void sun6i_msgbox_remove(struct platform_device *pdev)
> > -{
> > -       struct sun6i_msgbox *mbox =3D platform_get_drvdata(pdev);
> >
> > -       mbox_controller_unregister(&mbox->controller);
> > -       /* See the comment in sun6i_msgbox_probe about the reset line. =
*/
> > -       clk_disable_unprepare(mbox->clk);
> > +       return devm_mbox_controller_register(&mbox->controller);
>
> Like Sashiko said, this doesn't compile. All devm_*() functions require
> a |struct device *| parameter.
>
>
> Build testing your patch before sending it is a must.
>
>
> ChenYu
>
> >  }
> >
> >  static const struct of_device_id sun6i_msgbox_of_match[] =3D {
> > @@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver =
=3D {
> >                 .of_match_table =3D sun6i_msgbox_of_match,
> >         },
> >         .probe =3D sun6i_msgbox_probe,
> > -       .remove =3D sun6i_msgbox_remove,
> >  };
> >  module_platform_driver(sun6i_msgbox_driver);
> >
> > --
> > 2.55.0
> >

