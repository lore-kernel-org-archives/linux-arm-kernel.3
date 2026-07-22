Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445E0C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=; b=NcdoVj70nkE0qErnr34Hy58mgp
	p7kcB3+5rAaAQHp1cMTCn/2TLiG22Y6Li9Cn+XoP49O9+QDV6GdBJB7yDSHkYmd/oMLyWDtydlC4r
	CWrleCFQh8QuOrBXb0HPiZxOSxS5Ph7SRenPvUPJ/VBXb8KeP6H5hyZ8t0+4FJd8J0n9oQScENnKE
	zFA1jTBjNl+BU+EpFFONoKh6uneW/lf44acycrbrRUqz2Av6+jPQIM9Ed5GBE2zW884A2FsB6HOqg
	7OSTAvHmuR6tNwOi91cepHNifzck0PZWWChWqDxtP+KVfLOKwKqYh88p0p7SqPJGWhGycH0KGg+R3
	XmXx7Aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSpb-0000000BJyW-29zx;
	Wed, 22 Jul 2026 09:01:35 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSpY-0000000BJxH-24Ug
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:01:33 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-81ea0b7d137so97832477b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784710891; cv=none;
        d=google.com; s=arc-20260327;
        b=lguf9INVemo3x6BLXQhSZGzLezgjTwCGnO0to4QI6G3yfGNp8sONGYJb0rDL9VNTbU
         FLTCqthMTvm2lABrdnYlvhfk+m65Fz+XxzKm8PyvBD7VLzV5by8M1wttX4z5Yzz9dzKY
         paS0nmU3d2dSJoYiJ6jynH2yQOFynUiYoxa/YJQYegMnF4a37gkl+KfSvYfEbVZVe2xk
         uvY6cbAp8gPkSNDD+4BDUzb7QD1YS45VMCSrSqgDD4a8BI81D/hj9SMMS6yLOrvb2Q5H
         PPORqlHoF7XjsxSGzcRha89Vg0KoCnjvWuLobyuPAa3mDwZ2HQffGdhZdruuOeWDNrnv
         F7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        fh=1mwlLcAz81PEa/rY+Dp9fn59oeepT6cTc9+88fo/XTo=;
        b=Puk9alxs+aCuy5vYflm5wnR5tUh2cUhlguIjqQ2RqLsBPzZC8lTVVCd7mgYTpgjwN4
         9r3gOi9kzyMD6QIMJ8I1Tuj+keA9habR+KLiGwASO/E3lkGsyX9D8T+6pzj78PBhoct1
         m0LQrK+LRZl/XR5kdiJ56kXX6qaiSbVxrH5SGpzUscmVJYaj53rrvJmWv32ayZMIpRgM
         01oEy0cmg8Kl3ob7HmaObvbSCLil2fm6DckmjDS/5gNpHOPrWIG2Y25lP3tcHeWdx7+I
         3D+rMalmOV/cl4EOvqRpP89M6dUe2RmRbllHkHAfA1E1nxLNgW5U/3TMN2+b84Iudmq/
         SZFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784710891; x=1785315691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=lMgIcdugTHq9h1WJCJQU/0QfLyNwdKhrZmYjHs4eVhgJmZTXlVPcwmxasgYBhbnosc
         Lgd4bGUm54Si8DRV6kNr5yCGqCGYr+uaFFGzxg+7N9g/LT3f1/J8T+YhGChjN5lxbkeS
         7KExPyS2MFWU/nxOZVnHvgv1qu6F9+aP6ImAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710891; x=1785315691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=tAkQyamkmlQcBa/SjLBJCMeErhnOoj/AkidBM2fTO781/teGFD8MfO3+Jf54wSdBwS
         rzCM+h17oyPhOp+6ihyq1EZd3x1lLp3nX18O2Axp5FwC+W8yuljgd+VAZ382j/Gp309W
         CQYPkUQRMmW10EpYNaZk+TbRpL51ue5rPFnyfu7v8MUFTxPV1hwbfG/oW2to0uvIVgP6
         fvBG5t+br3OVnn9Opy4dC7ru/P7lfH7o5ceLGhaGrQhUbf/0BbytX8rj05YQsi04uAHL
         KrSMcdnjyg4wsIILCCDD4FF47BFAX556SBKBxmHEwMXELwlz1/4pDU2H05Ti8a/HZb17
         5AtA==
X-Forwarded-Encrypted: i=1; AHgh+Rre4xnPrMGJ6fQHzRhUHsyG+pAgTJ0+ocDEFMIjoNoVugtVzpRSTkxImyem1FZMj5Cc9WXNakd0AwtQQg5BsMrD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6dK5/LwCYmMb7Bb0Jw9GnpuGVDDUtkcy8A9N6wjH46J74uQl7
	UAKVHdZZWKpRY4z2bu69XQf80KLwoDN52UasrTu5/fDHcRCPycO54KkOsqcgV4X40c3/ZnUql6Z
	KksRKW9mRr6zYzSCQfYjuwk0P/mbFRYqxM1IMR8eL
X-Gm-Gg: AR+sD11Vih1fLclWd0pETKIsWiNdORBdqmHg0QvTXHSXDk73ZTBAwkpYipHKh/Vk9Do
	wOO7hL8ZSSIe//wce5HMUpuwDWPso3uD6/U4QI0Cp9GKEDYR5RFmVsX5UUUeyMwG4gVJpHzlGZi
	eMtUR5f/+wOobfktfzQm4V60GjIZE4vJ948YNO0VhRcKxV+xkY7vTsLJfmCT+OR8cwFkW8Xk81i
	1N9tKuKzYROk3CWnnPcvv8FBXXYMxXpn+PZYOEXPg1R4S5Dt4RAy9BegqWLr8o+Ow/um9sxb0W2
	ROlU+ybttjCac4Q4
X-Received: by 2002:a05:690c:e0c:b0:81e:6a1c:e30b with SMTP id
 00721157ae682-81ef28da7b0mr69266347b3.67.1784710891191; Wed, 22 Jul 2026
 02:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
 <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
In-Reply-To: <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:01:20 +0800
X-Gm-Features: AUfX_mzymMOrnzz3ZSisQQjvbDECVUbqfaXF7TwtpwvIT3XYymwiPHVmpWvFgt8
Message-ID: <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020132_574684_771052B0 
X-CRM114-Status: GOOD (  27.52  )
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

On Tue, Jul 21, 2026 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 21 Jul 2026 08:53:58 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v5:
> > - Reverted back to returning -EINVAL if descriptor is NULL
> >
> > Changes since v4:
> > - Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
> >   the descriptor is optional, matching the other pwrseq consumer APIs
> >
> > Changes since v3:
> > - Added missing stub function for !POWER_SEQUENCING
> >
> > Changes since v2:
> > - New patch
> >
> > Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
> > as it is a build time dependency. Bartosz wants the change on an
> > immutable branch to pull into the pwrseq tree.
> > ---
> >  drivers/power/sequencing/core.c | 18 ++++++++++++++++++
> >  include/linux/pwrseq/consumer.h |  6 ++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing=
/core.c
> > index 02f42da91598..72b96d36920e 100644
> > --- a/drivers/power/sequencing/core.c
> > +++ b/drivers/power/sequencing/core.c
> > @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
> >  }
> >  EXPORT_SYMBOL_GPL(pwrseq_power_off);
> >
> > +/**
> > + * pwrseq_power_is_on() - Queries the last requested state of the powe=
r sequencer.
> > + * @desc: Descriptor referencing the power sequencer.
> > + *
> > + * This returns the last requested state of the power sequencer.
> > + *
> > + * Returns:
> > + * On success, 1 for on and 0 for off; negative error number on failur=
e.
> > + */
> > +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> > +{
> > +     if (!desc)
> > +             return -EINVAL;
> > +
> > +     return desc->powered_on;
> > +}
> > +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> > +
>
> Didn't we agree on introducing an enum to make it future-proof for when w=
e
> also pull in pwrseq_is_controllable() from Loic?

My bad. I misunderstood and thought it wasn't needed yet.

> I think this should work like so:
>
> enum {
>         PWRSEQ_STATE_UNKNOWN,
>         PWRSEQ_STATE_ON,
>         PWRSEQ_STATE_OFF,
> };
>
> int pwrseq_get_state(struct pwrseq_desc *desc)
> {

I think you still want this here?

          if (!desc)
                    return -EINVAL;


>         /* Only once this is upstream. */
>         if (!pwrseq_is_controllable(desc))
>                 return PWRSEQ_STATE_UNKNOWN;
>
>         return desc->powred_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
> }
>
> Bart


Thanks
ChenYu

