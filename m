Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C631CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVOOle+AJIIuteMGQoWj0kXyHB826iCzl9rVosT29bw=; b=NMe3F/xk8lJl7QR/LT83yoqrvx
	imKz3J6rPAmTC27QM1yJrDCFu1evKVKIr3M61RH0YF3xSGu6k/awz2DZl7BCc9H23g0nNZzR+i7tp
	pnnRnUOS2gL0dxPpodVJmIhuD+7URCOGJBQKDqCrFLHXeplB2suNO21lLnqxedUUpBEaF7imPM1Sk
	oIKwEFwXVJ86i9D2Mmd75Csx7gawbnJv1RXHtvg//cETfO+45w+t/iZxzzw/U1KuP61EDVJZg1ZPk
	JYVTasAdFfrH/Ens8XVUsaqxul21p1UhMU3evOHBwaqf4+b7Cr2d9Uz7R3jWppBM/h2YPGFfw7NbH
	toFJPzzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEksP-00000005haP-1ZXR;
	Fri, 31 Oct 2025 08:52:53 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEksK-00000005hWY-33pm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:52:52 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7c5308f6aedso1415276a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 01:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761900767; x=1762505567; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVOOle+AJIIuteMGQoWj0kXyHB826iCzl9rVosT29bw=;
        b=ZRVHhkHiCVdCZZNgyD6byQ22x50IK4IejGkIeJLHdE9YIUv8rpoJ9TozWOHMp/vQWv
         0G9Tq8tPvkz7c40VqNiJN1iJUTRly2IDz1Z9N3vBg2/DsG6wgancIe2PbEWk+OQ0mB1N
         Lga9cu0dgRPQhTG58SufXkesu/ekIHc1nZ7iryy6VauWdTj9QtvhNbo2RZxTMwLwWBoV
         ExHHGmL3WKecTdjcbAX77L1k9m+8k7DvuFf9gBhrIp9MzFVOoLvtydFng6etUGTOMTtG
         +Ee+EQoZ9gYvVUBuK54AOlyn/2gQ84NYvlEAHrtQExRXsnC86LDOXbtaQMO0LpInAlIX
         Qflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900767; x=1762505567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVOOle+AJIIuteMGQoWj0kXyHB826iCzl9rVosT29bw=;
        b=MAXEYE4jevG2Hx4MKw1dPVeGRyG9w/lEUn6A4VbMM7600sCK7vrh/XQzCCGFUYcuqx
         o7Wx09o6AmQktMzJ2FhoRf2J+coxswdUvwPqVl8Cu4SOrVzCUbcLw8T3XUAxJM5/+dYk
         /4KO78md/5Ndlkwnl1TxMsWY9kd1w5ecdOg1QQzrPlp1P6gJw0GxhekqmdSyTqv2UTod
         q3lfDnTk1PZRj6LT0oZQJR3K7HdnTmWFsOpfMhPt+SxxMtkKgL/HqK2v+QXoug+iaLx4
         vaDNi9nTY0ch+rteg0vNTp9E2sTgZ87u2xsvshWj0sCOh1VDqIJtH8Cu+j5Q8VrT5sab
         2vjA==
X-Forwarded-Encrypted: i=1; AJvYcCVS7n6M5u3Cx2z4W3oMFh3WNCjBdzKL51gbJ1b11oZJA9VI7Udq5HEp4/eugq/uzudP8lxJVer5uh4eKzansslw@lists.infradead.org
X-Gm-Message-State: AOJu0YzQGK2AE2frczK+qAbDf5JbYB1QOUILcbhNhABSmKuEFMgC2yU7
	pbtKe/+YyykS2//wYCksmutjzG+Xy7vxCcJMueRtNFgIBRrs2v5aUbzPiGR7fKHOVflyGODI262
	83VNGr2JhfJX1tHug0PeLbFRNGlz+j1YBxpUyP9K5UQ==
X-Gm-Gg: ASbGncvYmGmtgaiOud7xSSgDP2uHLqJG+2v6sdaKXrvWgd7XpKiMpBPp90nszO0r2rd
	rNm4Jz8KIS3pk5No0t9JetdQpTPNhmedQ5g6vnD0S6gxqtfOkBnAQeRE4eY5gNYuEKAy1MK2ocr
	eYqZsQbBp6UFMeGrWBP/GBGtZtoW1B75+1Yok0W4HtQGsyMFZL3wTwU6ELlO+Ak8569l5xPz8KU
	qADdR6tPOxjZih4oeavMj0vYWuwmV1R7dJaafYS1qpGiwBtUoUGo6/WTv740BuJDA06qVXip1uM
	wtOQnQ==
X-Google-Smtp-Source: AGHT+IE2vnBdZNasAB1Xy72r9A2Sn2OoZw85wjD6Cd+JaiFG5aHRQrN3+j4NMQ38eKKIVVsK7pOkSngxrziJiWDeO4U=
X-Received: by 2002:a05:6808:2198:b0:437:dade:463f with SMTP id
 5614622812f47-44f95fd5661mr1151443b6e.34.1761900766670; Fri, 31 Oct 2025
 01:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
 <20250813-phy-notify-pmstate-v3-1-3bda59055dd3@linaro.org>
 <aKX5C9Xlx2CSJraY@vaman> <CADrjBPpaJdzDSe3kjk=zrODusH3LnwhaBn9-NDCJwEy3ymwvew@mail.gmail.com>
In-Reply-To: <CADrjBPpaJdzDSe3kjk=zrODusH3LnwhaBn9-NDCJwEy3ymwvew@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 31 Oct 2025 08:52:35 +0000
X-Gm-Features: AWmQ_bmf3sDwcFE73Zf2SHIWustpcGeUpWRxOdPU5lAg-c6tgm7mH2rWSEsBY1E
Message-ID: <CADrjBPqc47TBXA78gO7VENLqYdsodKAGckB528OXv2==EM9MpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] phy: add new phy_notify_state() api
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>, Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015248_970027_CB21B3C7 
X-CRM114-Status: GOOD (  33.08  )
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

Hi Vinod,

On Thu, 11 Sept 2025 at 13:23, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Vinod,
>
> Thanks for your review feedback.
>
> On Wed, 20 Aug 2025 at 17:34, Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 13-08-25, 16:00, Peter Griffin wrote:
> > > Add a new phy_notify_state() api that notifies and configures a phy for a
> > > given state transition.
> > >
> > > This is intended to be by phy drivers which need to do some runtime
> >                     ^^^^^^^^^^
> > Missing 'used' possibly?
>
> Yes your right, good spot, will fix.
>
> >
> > > configuration of parameters that can't be handled by phy_calibrate() or
> > > phy_power_{on|off}().
> > >
> > > The first usage of this API is in the Samsung UFS phy that needs to issue
> > > some register writes when entering and exiting the hibernate link state.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> > >  include/linux/phy/phy.h | 19 +++++++++++++++++++
> > >  2 files changed, 44 insertions(+)
> > >
> > > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > > index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
> > > --- a/drivers/phy/phy-core.c
> > > +++ b/drivers/phy/phy-core.c
> > > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> > >  }
> > >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> > >
> > > +/**
> > > + * phy_notify_state() - phy state notification
> > > + * @phy: the PHY returned by phy_get()
> > > + * @state: the PHY state
> > > + *
> > > + * Notify the PHY of a state transition. Used to notify and
> > > + * configure the PHY accordingly.
> > > + *
> > > + * Returns: %0 if successful, a negative error code otherwise
> > > + */
> > > +int phy_notify_state(struct phy *phy, union phy_notify state)
> > > +{
> > > +     int ret;
> > > +
> > > +     if (!phy || !phy->ops->notify_phystate)
> > > +             return 0;
> > > +
> > > +     mutex_lock(&phy->mutex);
> > > +     ret = phy->ops->notify_phystate(phy, state);
> > > +     mutex_unlock(&phy->mutex);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(phy_notify_state);
> > > +
> > >  /**
> > >   * phy_configure() - Changes the phy parameters
> > >   * @phy: the phy returned by phy_get()
> > > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > > index 13add0c2c40721fe9ca3f0350d13c035cd25af45..664d0864c3a5042949cb121e982368fe0a97827f 100644
> > > --- a/include/linux/phy/phy.h
> > > +++ b/include/linux/phy/phy.h
> > > @@ -53,6 +53,15 @@ enum phy_media {
> > >       PHY_MEDIA_DAC,
> > >  };
> > >
> > > +enum phy_ufs_state {
> > > +     PHY_UFS_HIBERN8_ENTER,
> > > +     PHY_UFS_HIBERN8_EXIT,
> > > +};
> > > +
> > > +union phy_notify {
> > > +     enum phy_ufs_state ufs_state;
> > > +};
> > > +
> > >  /**
> > >   * union phy_configure_opts - Opaque generic phy configuration
> > >   *
> > > @@ -83,6 +92,7 @@ union phy_configure_opts {
> > >   * @set_speed: set the speed of the phy (optional)
> > >   * @reset: resetting the phy
> > >   * @calibrate: calibrate the phy
> > > + * @notify_phystate: notify and configure the phy for a particular state
> > >   * @release: ops to be performed while the consumer relinquishes the PHY
> > >   * @owner: the module owner containing the ops
> > >   */
> > > @@ -132,6 +142,7 @@ struct phy_ops {
> > >       int     (*connect)(struct phy *phy, int port);
> > >       int     (*disconnect)(struct phy *phy, int port);
> > >
> > > +     int     (*notify_phystate)(struct phy *phy, union phy_notify state);
> > >       void    (*release)(struct phy *phy);
> > >       struct module *owner;
> > >  };
> > > @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
> > >  int phy_calibrate(struct phy *phy);
> > >  int phy_notify_connect(struct phy *phy, int port);
> > >  int phy_notify_disconnect(struct phy *phy, int port);
> > > +int phy_notify_state(struct phy *phy, union phy_notify state);
> > >  static inline int phy_get_bus_width(struct phy *phy)
> > >  {
> > >       return phy->attrs.bus_width;
> > > @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
> > >       return -ENOSYS;
> > >  }
> > >
> > > +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
> > > +{
> > > +     if (!phy)
> > > +             return 0;
> > > +     return -ENOSYS;
> >
> > Should be -ENOSYS either way, right?
>
> I initially thought the same, but I followed the pattern that is used
> by many of the other phy API calls like phy_init/exit,
> phy_power_on/off phy_calibrate, phy_notify_connect in
> include/linux/phy/phy.h. I can update it if you like, but I was trying
> to keep it consistent.
>
> The only API I can see (that isn't a *phy_get* or *phy_create*) which
> returns -ENOSYS unconditionally is phy_get_bus_width()

Friendly ping about the above ^^^

Peter.

