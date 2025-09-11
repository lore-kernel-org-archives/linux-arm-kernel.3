Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDA3CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOhHNVyVLP7kW4W4c9CpTeNpoSEZbVmnYepZzBb3fl0=; b=wb0HfHKPkg0UvQGxbYenS36xwr
	ePzx9UDh8mHIS9elnZ0oU0wt5+MPHdhdiIRHyulTcgsATztgI8u2NVDu94AkdVFRN1TNrRLyZzTuq
	nUoBx/a4aDFva7cuMwIhFEW2djcRBplOhkXWGnvW+OXT/6taDChtFwmPjK0StmYDdW1PcHLLURnjN
	Q0ndsvBWzcIrSWgP4EMHd2TeoLDYlKZqmAg/6X7VIUPazfXGndJYUtA0bD3XyRMLxpJ6dnijXQgTS
	FWTIIdrOiWZhYMh2fHMcNskXSy+GdA3d2dZbb/XKkrgzUMOKpjQEXXo63EvIDWudp4oAnx252GfqO
	ICrJ3Z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgLB-00000002x2j-3izK;
	Thu, 11 Sep 2025 12:23:53 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgL9-00000002x13-20pH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 12:23:53 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-621a79a580bso100185eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757593430; x=1758198230; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOhHNVyVLP7kW4W4c9CpTeNpoSEZbVmnYepZzBb3fl0=;
        b=IHmDOduMyRs8HSTq5Mk82uwxfWkAliLe8Klk4K4nrTFeZF/nBBz8Fm4M/cg8qmdkiD
         ifgE9lricg42R3LDTUlGTyNtioOP19XihFroDEolIKRU2TtqbWwB4qD6kNEbSi59dqYS
         Pen8Y6SU/cE6/HM+pqovz1iLsZeaYVi8r8cKwv759iV3aP2vQftQejzFPtwcE4RSM2mu
         H2XIxMcH8+FwC1mNRJ79j5mdKwFV8udblklw1gDpiOCYNdpq6iD+s/OkrIz0Ng1+my6A
         nGfXDJeoLZ4z4c0ZOyKjAhFGFN9wG3VXlT/KbAoCiWUaD2UDDzZl8N88+YClbQBGJgOz
         pc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593430; x=1758198230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOhHNVyVLP7kW4W4c9CpTeNpoSEZbVmnYepZzBb3fl0=;
        b=tU9O3Kwi884iz9eOgZN6Uw/S6sMdLNytX0OBHfpGmk6kP0bG/DDyPbirZ1D/F6+1BO
         5fCjM3/wWchAPX43Vt/de49QsZVXVjHh7QjfwP+DAdsomJC090WQXXuGiu5UCXbx51d3
         ighw4bzDdZKBwl4/IBSBBEPL+O0Dq6dhiHvrPE9yW04p83O+roj1sC5/czVSQSKbxnEY
         m0zZAP63Sz5XUINsvvNsn9j/Y4qEuIVeqg17GZde73YdCpEF6FRvLWgcDMVbDMcFFrsk
         3SegDrVicx88gyo9a6ogVyVubjD2ncOjqm+9esCrzeTDVkIAs5kUSXfwUeDL4zMK0gNk
         +Usw==
X-Forwarded-Encrypted: i=1; AJvYcCVw60wIFRPGD5SIhQBQR5uMy8IfAJ5K5Ec8jk0hYY0HebVWFHfsZBxV1OO8Jo/55Lxson/lFYc01095lc+lAEzA@lists.infradead.org
X-Gm-Message-State: AOJu0YyqTxgKuoOdsLVGF/FqLZfg41vGLqF2FN87/Fx27VC45SQZ8E4q
	E2/rr8PWdukBQgi4YNgVUu+Ksz7WlcXs6Cv/ZiygY/iwj2zDr8D7x9AbzPlfOUbq//E2BgCrB/1
	n/pw3IczLNfKi8FI/JfUL18lX4pt0qI38geZ072rVuQ==
X-Gm-Gg: ASbGncsQr6P+MAVut83GhgAWNhL4h1oMk7JZjxsLRGHmSw6fXAGx2PwF1sPr6r4ynvU
	PQwXex1yZk2y7y2Kdu6bxgfRGRoS/76NqpARlvrjCpfwYPu2vU+p/TFv+RjwcJ5wTSOnvWKZfNu
	AiZG/iPKbPqLG7Z54vz1tDds0Pxau7y3a+gyQ+vZRnHUnUbO4+tX516PRgf0+jLzefl/FwUr6uI
	0eJnUWaLb11ihWOMw==
X-Google-Smtp-Source: AGHT+IFlJGRFVdFunbhE1qMFhFzsQ7ox2qrr0kPK3cR6JnkVwwd4KR9aUMOAVadxtU1iOr8rX8btiw416Km4fjx3eEM=
X-Received: by 2002:a05:6871:2942:b0:322:3811:e4a1 with SMTP id
 586e51a60fabf-32264a23b40mr11016481fac.26.1757593429792; Thu, 11 Sep 2025
 05:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
 <20250813-phy-notify-pmstate-v3-1-3bda59055dd3@linaro.org> <aKX5C9Xlx2CSJraY@vaman>
In-Reply-To: <aKX5C9Xlx2CSJraY@vaman>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 11 Sep 2025 13:23:37 +0100
X-Gm-Features: Ac12FXxrk_rVgmFgSaHooe5Gb5FZ-V_t_qQg9tRVc0kilQnohu6e2x4WgTN9EhE
Message-ID: <CADrjBPpaJdzDSe3kjk=zrODusH3LnwhaBn9-NDCJwEy3ymwvew@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250911_052351_522122_6DA81970 
X-CRM114-Status: GOOD (  30.73  )
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

Thanks for your review feedback.

On Wed, 20 Aug 2025 at 17:34, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 13-08-25, 16:00, Peter Griffin wrote:
> > Add a new phy_notify_state() api that notifies and configures a phy for a
> > given state transition.
> >
> > This is intended to be by phy drivers which need to do some runtime
>                     ^^^^^^^^^^
> Missing 'used' possibly?

Yes your right, good spot, will fix.

>
> > configuration of parameters that can't be handled by phy_calibrate() or
> > phy_power_{on|off}().
> >
> > The first usage of this API is in the Samsung UFS phy that needs to issue
> > some register writes when entering and exiting the hibernate link state.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> >  include/linux/phy/phy.h | 19 +++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> >  }
> >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> >
> > +/**
> > + * phy_notify_state() - phy state notification
> > + * @phy: the PHY returned by phy_get()
> > + * @state: the PHY state
> > + *
> > + * Notify the PHY of a state transition. Used to notify and
> > + * configure the PHY accordingly.
> > + *
> > + * Returns: %0 if successful, a negative error code otherwise
> > + */
> > +int phy_notify_state(struct phy *phy, union phy_notify state)
> > +{
> > +     int ret;
> > +
> > +     if (!phy || !phy->ops->notify_phystate)
> > +             return 0;
> > +
> > +     mutex_lock(&phy->mutex);
> > +     ret = phy->ops->notify_phystate(phy, state);
> > +     mutex_unlock(&phy->mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_notify_state);
> > +
> >  /**
> >   * phy_configure() - Changes the phy parameters
> >   * @phy: the phy returned by phy_get()
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index 13add0c2c40721fe9ca3f0350d13c035cd25af45..664d0864c3a5042949cb121e982368fe0a97827f 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -53,6 +53,15 @@ enum phy_media {
> >       PHY_MEDIA_DAC,
> >  };
> >
> > +enum phy_ufs_state {
> > +     PHY_UFS_HIBERN8_ENTER,
> > +     PHY_UFS_HIBERN8_EXIT,
> > +};
> > +
> > +union phy_notify {
> > +     enum phy_ufs_state ufs_state;
> > +};
> > +
> >  /**
> >   * union phy_configure_opts - Opaque generic phy configuration
> >   *
> > @@ -83,6 +92,7 @@ union phy_configure_opts {
> >   * @set_speed: set the speed of the phy (optional)
> >   * @reset: resetting the phy
> >   * @calibrate: calibrate the phy
> > + * @notify_phystate: notify and configure the phy for a particular state
> >   * @release: ops to be performed while the consumer relinquishes the PHY
> >   * @owner: the module owner containing the ops
> >   */
> > @@ -132,6 +142,7 @@ struct phy_ops {
> >       int     (*connect)(struct phy *phy, int port);
> >       int     (*disconnect)(struct phy *phy, int port);
> >
> > +     int     (*notify_phystate)(struct phy *phy, union phy_notify state);
> >       void    (*release)(struct phy *phy);
> >       struct module *owner;
> >  };
> > @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
> >  int phy_calibrate(struct phy *phy);
> >  int phy_notify_connect(struct phy *phy, int port);
> >  int phy_notify_disconnect(struct phy *phy, int port);
> > +int phy_notify_state(struct phy *phy, union phy_notify state);
> >  static inline int phy_get_bus_width(struct phy *phy)
> >  {
> >       return phy->attrs.bus_width;
> > @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
> >       return -ENOSYS;
> >  }
> >
> > +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
> > +{
> > +     if (!phy)
> > +             return 0;
> > +     return -ENOSYS;
>
> Should be -ENOSYS either way, right?

I initially thought the same, but I followed the pattern that is used
by many of the other phy API calls like phy_init/exit,
phy_power_on/off phy_calibrate, phy_notify_connect in
include/linux/phy/phy.h. I can update it if you like, but I was trying
to keep it consistent.

The only API I can see (that isn't a *phy_get* or *phy_create*) which
returns -ENOSYS unconditionally is phy_get_bus_width()

Thanks,

Peter

