Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76889C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=; b=Om+58hjUcYIbpgWO0u3rTvevLe
	GHmaEU/pNYGfY7H+FFFywmPwfpVAKet+3kAGXi1u3yUDB3XXcHX2Fde26BpJO5hIRT7yfFd94NTWQ
	344nNU5nImqMonG3YB7ZuP5Ewe6ya3VyuueObFUUgo6X9KBepEUUTQqV6hIDeQ2p3ag9Peam15/zR
	L1ii7kfaq/FY00lHIujlz0Ga70THwfkToOxwEUmArlbaYaAvWhJPSsWUH7tUq8+zZbJo63rQFN0yi
	yT0f2C7TjEGrokL99n1JuVr90JmE+igLwzSziTjHRdi6FpwhxudUjRcUNMVtnLxys4oBtWfz/N9q8
	1rjTxxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D7h-0000000BXQH-2Ibp;
	Thu, 17 Sep 2026 14:30:02 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D7e-0000000BXLu-02Ie
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:29:59 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4c0cd10d56fso504771b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655396; cv=none;
        d=google.com; s=arc-20260327;
        b=PgRY5kTe7BMvfJIOQNEZQJ2ZINBbwp7qQsDTzHq6Z+YLzo8NSWL6t403p4PPuYr3y6
         nSr83p2OX4kGASoV0Fmu6rqBxCeQtslIBi0QXIwsdqg8uTTv/w6MlKn2GSawJWfgQ5ry
         bo78xb8eluYSAVlhBuXA0SiIM41IjYM5RPkFppMwLh4f5//1wpq5twQZbn4YB3jpAamz
         CR2uHOewrRjGalHEl6GPa7M9CHnF8sqtgTlNHrd/jifpd1+i/dyIoBMFZZUqTfU5i61e
         6nVn/d0DRLzNLc1cc+uy4f2HhU4amEBtZ7TWXBUeQ++k544E47zQRN37Os95LWZpb8fK
         RqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        fh=puL7piKmSDPPhLrCNeyxWxMK/sAdLTxFxOj8NcsjkrE=;
        b=aLiHQmvdO4j5JUfZDMts7qvsYohntGh61nXOa4DCoe6AJ+3pE426YbBX7LleNZW55c
         Y6oQ99uDITwmDoj/Sq31NltNMgnHFAZMOF4s5eA8BI5GFKA5Ao8QreUgeijWGWFSSMCq
         ZRezJRX99mD2qa3295IeLZ/Iiz9LZzB1NxOshi3DbBUaI2tf89oUDSMCcazVnKqmdsXU
         xQdq6nm6LipOYfw29RGfD44hJsMe+GYahuoogMrEcdPufu1tOK8jvBmOOnEaiohGSZMw
         di5rVM3nH5uyhXF7VTEbV/yjEA7DZmytUc74oPKn/WeIM33w9OVLMvVH9xBsnvBFAYcb
         hcDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789655396; x=1790260196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        b=eSwIfjEgpP5fGL7eQF37ugYK6o0deIbJb8kF2Vi9TJRL8153p1KhjTXTJFDAkJ6ApU
         ERaetIQz1+OUJUXCqXw/hLlZev6hx9sovdCbcvtK7/Gm3UAh6MifwK83DZoUnCTRShg3
         5k5LByVzmU7IZ7WBSsN+g29h6nP9KAghHxTm6TU3k/uVgz3zGkQxqrUWzxXw7kzc19QX
         W8Yf2hfQTuR3i8RpGktA3l/C6+wmgKywoQPJTr2ShopPtFTZB74fFaeDl0Zdvi2a4KN7
         4EDXapUMIVbq9PIv9ZIN2v8VM4wOCW0pjLbg1whSoAjtowmWpJmt5kl1VycaxIC2xnyO
         hvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655396; x=1790260196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        b=2wrpWrf8esa1CQQ7pnpdau5CIz2IF4W6vZkG/u6WkmcXoh5j45H1Xq3akalXWnj4PW
         9qWBzo3Y9wkr5g0QxRTVoCtEOxg7UcCGwhaXV1dFoyjwOqY3J7Ycs51+of3KKQGxYSLS
         d1OhWPMCXjj70EdnuP2ZUe8DMhb8Kut//Uo4yyAndBjLBYj8ewhQ7wcBgLHlOp3YMTSX
         6OlYMjGC/gfuMn8igV+hatcpp+HK8rZn9VwroAn2iDkxQ6EnI5OygTgESXQsSz6wUW9A
         qAdgo8giOyy3na04ugFxQJnHV5jZr3lgB4sMJAf5dm1AzLT+NnyMVwT/ZTSBU/R0IuKU
         9opg==
X-Forwarded-Encrypted: i=1; AKwUvBw46CvRV55iVra0uddcS1p3Y5qYAqqBK7MuXHeFzdbe5REsBOwwrU09rdT3L7xNx0GAS9nHGf2D93dYazFZFL/1@lists.infradead.org
X-Gm-Message-State: AFuF++kE5AijzfEB0Isgm05319ImXvXa4BMfeaZlah+j8m6hh81bY/xm
	aKAHoaie/9P6qkoslW/kTPkVrLJIlLxhNVUe5qPUENK7IjuOZNyJCcSuXp85JWmWuEQmEhxG6FB
	g/3EsZ9dgNIw5K++74O6ox9sH5c0fubc=
X-Gm-Gg: AYBFou2GFsFpKCmbFCHxB6/y1fKe/4o8AxFdy1QfS6dNUPoWSJSLlqiOa8Thhwk77ES
	ZFUxk/pZxrrfTujHZAhcmPA5Y3WXFCmNxV8ukzA4Ff39df6msE3NHtbwpk9c7TVlU3xRKV6o/fw
	khKS9uL3hhUHcG+uZvjF8FnCvXfJAPqe2fSJqTV0iHcMqAye5fQzNPrCyeXESr++NXzflXbKUcA
	teiRdYOyv7ermMA5BB3sKanaPf/xHaErA9Tys7On98pi/qDx9Ucfc74Dplopu4D4jTGh/8uAtrT
	iLWfvbQjHaANUzMUXlQvksdDuKq8iugAg/2gmpeHBqnSWQ3bZ7h7idy6C6QoiWeNSaOLr8S6pPr
	X0boGoZny4GJBanKefYSr186c6Qrk3C5M+VN4Ix5n
X-Received: by 2002:a05:6808:5143:b0:4b8:4703:db93 with SMTP id
 5614622812f47-4cb6a5e4700mr2519969b6e.28.1789655395992; Thu, 17 Sep 2026
 07:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com>
 <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
 <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com> <20260917120950.GA44274@killaraus.ideasonboard.com>
In-Reply-To: <20260917120950.GA44274@killaraus.ideasonboard.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 17 Sep 2026 17:59:42 +0330
X-Gm-Features: AcwNN1XNeWNDN1FkqRE3CEAEFF1YFDG9VTOj1PGQgDvjVE6m2w9z6Yu-7cmX5kk
Message-ID: <CAMxPZkhoRAoz9mO29dC_+M9uEfmASpFrJqud73tz+8merQ06TA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_072958_063268_0882E833 
X-CRM114-Status: GOOD (  29.60  )
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

Hi Laurent,

On Thu, Sep 17, 2026 at 3:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arash,
>
> Your patches have been merged in

Thanks for the update. I really appreciate your review and help with
getting these patches merged.

> https://gitlab.freedesktop.org/linux-media/media-committers. I'm sorry
> it took so long. I really appreciate the work you've done here.

No worries about the delay. I really appreciate all the time everyone
put into this.

> On Mon, Sep 07, 2026 at 08:15:02AM +0330, arash golgol wrote:
> > On Wed, Aug 12, 2026 at 9:50=E2=80=AFAM arash golgol wrote:
> > > On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol wrote:
> > > >
> > > > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-cs=
i2,
> > > > and sun6i-csi bridge drivers to use the V4L2 subdev active state AP=
I.
> > > >
> > > > Each patch has already received review and testing individually in
> > > > previous postings (see the changelog and links within each patch fo=
r
> > > > that history), but none have been picked up and none currently have
> > > > a delegate on patchwork. Resending together to make it easier to
> > > > review and apply as a group.
> > > >
> > > > No code changes since the last posted version of each patch.
> > > >
> > > > Arash Golgol (3):
> > > >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> > > >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> > > >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> > > >
> > > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++------=
----
> > > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> > > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > > >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> > > >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> > > >  7 files changed, 194 insertions(+), 220 deletions(-)
> > > >
> > > > --
> > > > 2.34.1
> > >
> > > I've been trying to get these patches merged for a while.
> > > Multiple pings and followups have been sent, but they haven't
> > > been applied yet. This series is just a collection of my
> > > individual patches.
> > >
> > > All patches have full Reviewed-by/Tested-by coverage from
> > > Laurent Pinchart and Paul Kocialkowski. Current status of all
> > > patches are still New in patchwork, without a delegate.
> > >
> > > Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=
=3D28738
> > >
> > > Given the review is complete, would you be able to pick these
> > > up, or let me know if something else is blocking them?
> >
> > Just following up on this series.
> > Link to series:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28738
--=20
Regards,
Arash Golgol

