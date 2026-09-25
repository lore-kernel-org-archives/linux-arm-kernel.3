Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9938C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=; b=oJrDUhRtYz15pNvsalMx+TA0s6
	b3YVpOOwP50kN4cNcUcRXEFp863uFKFKJ7o+X+xoK2v58izrR14MYlNwxM4vGO+eLhTVWktD4+C7C
	PDAgak/1c/TQ47ca1d5Ds6wvAdiPOm5rJR0eePmf4GaMNCFJ4wSbE0QBDAvtqqXAQcaYIGsw3G4vY
	HYGjP0IoKZLZNQzPuD5AGm+9X5/jw6thKr8kPe69bm1IxyS9YI1818r6DJ9R3/nVyrFRr6ZgpD7lJ
	/f/SDPKGLB1rcZDOaymH/Ju1H6IG20S7c6XRwlcckxqgXvPmpaokmHgFsIYTiehJubawRW5K0ARLV
	FgVgIDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABmo-0000000EHq8-2amF;
	Fri, 25 Sep 2026 19:40:46 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABml-0000000EHp6-1mI0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:40:44 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c537df4daaso523947b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790365241; cv=none;
        d=google.com; s=arc-20260327;
        b=oG298W0eO4qIq1DqPCzLZ5IsuU/v4auY+Wof1kyaEZ8obtG8AbySX06jdr6+XjZpXJ
         g6hM0sIpqkK94x3C5rB99FGnY3qVULGQBo5Zdv22mz6CCZBigstjtuu08lLb6JFiKONV
         pYz2dNTP0/bOFjLalP2zKum2YVmjBQmayqiAJK+fBYawmx2VRZCZ2bbrpBv4sPQv25i5
         bfsMjIlRYyNxkT3VrzjPL6KCDVO8Qqe1vu5q1iO6Vvw3+QNaCy3e63+DNL3qEarSDOkS
         fweaO8orWiG3JVSqoaw6v6FmmoAy/r4XbszSkW1UmsXdPiJpiCbW+IXMyx5WJONpyqvw
         YgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        fh=au5DJ1XvkJfJ7exN+5wwN+Ih9PPbAitq9sVJVSlcru0=;
        b=bPXd71vAmMNoTYAff619DRIA58Hh5DayeBn01/oIQWkmQOADtDLMv7+XWj04RuW5+i
         nN55X9Br0B/n7wma8Rl3g6pI+jmjEipt9JGhxAZj8J0a18r76Z2lsfnwDZP7neOf9Q70
         sF8ouFKV3GNc5Lv5t2MZCmIAFM8BIuR/0uppK94XNAplOtRhO4+5nBXjrEuG77ha5cOs
         6cZJE8sCQRi82D6cpba3WVn/VROtVHG6NZfcDWMXBPLou93CQOcUDRKh77EsgGYhE2za
         dUnwvkQjPnmHIHnOI4jtExdeFcFFCgZf8HEi31+XFhCLMmpSNZPHavy4qVTgboS9KN7K
         hyRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790365241; x=1790970041; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        b=qhj7o5hNSoguEdq5uFjmY3CjGNviYqgbonY0mBWbN5yexjhUon636+F5EobQkKgHyF
         vYSYjet6mwIs/jscY0qft9e0jWW8L3hUcwKkW4SMEbMyYyDi9eDkP/POBfqCxOBhbBVE
         6plqsbqdRmq/oV0enhxMXoGxmHu6NIUg/ERjecTcJ+paEIg27G6ixsruAdlwMk4j8vmS
         Qe5FLtTlxSKc/vZi1ifsWPJdeWZZ4qAkNdPtUtDVS22rkTdJXFTXA3M4BlqEh/YuUtMD
         LWW0z8dvManl8R2mYBaYwlIHpGIM8MzOsioz2tb40+OIHwa3EhqPYcd6ZLYw21GjtOe5
         Q/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365241; x=1790970041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        b=sNUl9g3clMJqyngsEmIWrC8SOCyJurTxtjWnNzQB5w9AJTYu6eeegdX9V5Vm/rSU9I
         0WW29vNII/Jaeeo9Z8H12RjIUaFJid6Gs81MjAhckxbRzyQehvEpou0eNb7GLhT8b8rU
         m52OZrcTq9icdU8bEE1M9oJsvEZLj+E0FyXzDSrlXdNLg+rG8Jpa6VTAC9YlFa1Y23HK
         /HHx457hE/8xDBL7zlBl9pXyOz71aZbhC5M3DBTx6X4glCqCJGLypvPB15MLb9wbVtD7
         Han0GezeKspRgFWzhGgNigtqhV2rmMqhbupaZXRKwDVRYOncZgMYkDUk3Jt2oKmbYasa
         3fbA==
X-Forwarded-Encrypted: i=1; AKwUvBxjlYX3Hfm8tF7AdYoHSoBmbFnNrxsK5wYAEDYoPbIVKTFWcL48isdurMg/23UwIcYWFdb/Ke2HvEQucdF0TE3F@lists.infradead.org
X-Gm-Message-State: AFuF++lT0ORmRT/Vvm46WgYczOcs/m18Zf6w8m8NoVYDNXIhaajx6QdC
	klYw8sEYZUEAvducwizuEe8PPD+L9uzJ1IM89yC+82qjIVsLqGumqzK0/tHwo8eBudLi4gyR+qM
	RK1QAWTSppvO0zlb2D+1Nh/BleZvSVowySmfb7nkJ
X-Gm-Gg: AYBFou3tGdrE9FtWmWyACV3aAaPXR8t0fHsgxGIyz0mdxqcykxSNXcukf63FjMyWsQp
	UnLvzYg66qpoC3UhHod6oqoVRnMrGao89iW9lglS2fU+9RFIeWkYqcm94a7resDYv4d1kyEm0ga
	e2Y06PQoQ+V3UptUipHOI21DYRGP7z/W6CpLxxxBQZ1CM45eCktJjRN7sIlu/ysyv22iQqe+e9o
	zSkTju1eNO+fVZZ0RqDmyiA3aHMg5//dIjHPFx6U7eg8TOPs7Dfp7Dq62FPwl7rBDD7a9Tai03G
	qlie7ELWrKOrvO+JOTZfHE2uH0joREL7Daqs6lzV2w3xclUu3oE9bTRwiBjkyZe+Rh87P5uDb8+
	A2JU3rE429tUw
X-Received: by 2002:a05:6808:30aa:b0:4d6:90f3:74ae with SMTP id
 5614622812f47-4dc6606bcc9mr4067609b6e.46.1790365240133; Fri, 25 Sep 2026
 12:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260918222513.2633456-2-rdbabiera@google.com> <arF3fynAGG5khe3B@google.com>
In-Reply-To: <arF3fynAGG5khe3B@google.com>
From: RD Babiera <rdbabiera@google.com>
Date: Fri, 25 Sep 2026 12:40:29 -0700
X-Gm-Features: AclHuK_91DQZxLqN7uLYqBpJX2aYJ1LY4FTA5TNLS7LM4bAkU5HscFKOZ-tm8pA
Message-ID: <CALzBnUEw4J1SB8a7is5Q-OKhkuQuPWUJcu9KHRrZO37k==FEOQ@mail.gmail.com>
Subject: Re: [PATCH v7] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: Neill Kapron <nkapron@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
	badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_124043_481279_E3DA424A 
X-CRM114-Status: GOOD (  26.93  )
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

Hi Neill, thanks for the thorough review. Will send v8 out shortly.

On Mon, Sep 21, 2026 at 11:29=E2=80=AFAM Neill Kapron <nkapron@google.com> =
wrote:
> The driver is now using readl_poll_timeout() and
> pm_runtime_get_if_active(), we should be including linux/iopoll.h and
> linux/pm_runtime.h explicitly.

Acknowledged.

> > +#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS 0x1e85
> > +#define TCA_PSTATE_0_OFFSET 0x50
> > +#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
> > +
> > +#define GPHY_TCA_DELAY_US 10
> > +#define GPHY_TCA_TIMEOUT_US 100000
>
> With the addition of TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS, we
> should consider bumping GPHY_TCA_TIMEOUT_US to be slightly larger (e.g.
> 110000us) to ensure the hardware timeout is guaranteed to expire before
> the software poll timeout.

Will change here.

> > +static const char * const u2phy_clk_names[] =3D {
> > +     "usb2",
> > +     "usb2_apb",
> > +};
> > +static const char * const u3phy_clk_names[] =3D {
> > +     "usb3"
> > +};
> > +static const char * const u2phy_rst_names[] =3D {
> > +     "usb2",
> > +     "usb2_apb",
> > +};
> > +static const char * const u3phy_rst_names[] =3D {
> > +     "usb3"
> > +};
>
> nit: checkpatch.pl --strict flags missing blank lines between these
> array declarations (and the inline helper functions + DEFINE__FREE
> macros below).

Will check.

> >  static int google_usb_set_orientation(struct typec_switch_dev *sw,
> >                                     enum typec_orientation orientation)
> >  {
> >       struct google_usb_phy *gphy =3D typec_switch_get_drvdata(sw);
> > +     int ret =3D 0;
> >
> >       dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> >
> > -     gphy->orientation =3D orientation;
> > +     guard(mutex)(&gphy->phy_mutex);
> >
> > -     if (pm_runtime_suspended(gphy->dev))
> > -             return 0;
> > +     gphy->orientation =3D orientation;
> >
> > -     guard(mutex)(&gphy->phy_mutex);
> > +     if (IS_ENABLED(CONFIG_PM)) {
> > +             if (pm_runtime_get_if_active(gphy->dev) <=3D 0)
> > +                     return 0;
> > +     }
> >
> >       set_vbus_valid(gphy);
> >
> > -     return 0;
> > +     if (gphy->phy_state =3D=3D COMBO_PHY_TCA_READY && orientation !=
=3D TYPEC_ORIENTATION_NONE)
> > +             ret =3D program_tca_locked(gphy);
> > +
> > +     pm_runtime_put(gphy->dev);
> > +
> > +     return ret;
> >  }
>
> Previously, sashiko recommended moving to pm_runtime_get_if_active(),
> which was done in v6. However I think this may have changed the behavior
> of google_usb_set_orientation() and potentially introduced a regression
> due to the pre-existing ordering of calls in gooogle_usb_phy_probe(),
> causing this function to always take the early 'return 0' path.
>
> In google_usb_phy_probe(), we call devm_phy_create() prior to calling
> pm_runtime_enable(dev).
>
> In drivers/phy/phy-core.c, devm_phy_create() calls phy_create(), which
> has the following check:
>
>     if (pm_runtime_enabled(dev)) {
>         pm_runtime_enable(&phy->dev);
>         pm_runtime_no_callbacks(&phy->dev);
>     }
>
> Therefore, the phy device never has pm_runtime_enabled, causing this
> call to pm_runtime_get_if_active() to always return 0, and the function
> exits prior to calling `set_vbus_valid()`.
>
> I think moving the pm_runtime_enable(dev) call prior to
> devm_phy_create() will resolve the issue, but we should audit power
> managment in this driver to verify.

The check here is called on gphy->dev as opposed to phy->dev. fw_devlink us=
es
FW_DEVLINK_FLAGS_RPM by default, so the dwc3 consumer controller holds
DL_FLAG_PM_RUNTIME on the phy platform device. Every resume call on
the dwc3 controller results in the supplier resuming as well under this
model, so the runtime_get() call here passes.

> I think this introduces a regression between v6 and v7, as usb3_tca_base
> may be accessed prior to the 'usb3' clock being enabled, and
> furthermore, the call to reset_control_bulk_deassert() will clear this
> value.
>
> Therefore, I think we need to this after the call to
> reset_control_bulk_deassert().

usb3_tca_base is powered by a different clock as opposed to the 'usb3'
one, so the register access will be safe as long as the platform driver's
power domain is on. Register reads in either order both result in the
same behavior during testing, but I would argue that writing before
the call to reset_control_bulk_deassert() ensures that the parameter
is applied on PoR.

Best,
RD

