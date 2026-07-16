Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ECAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=; b=ejquKBMPJPfLoxXZQli1KrPFdx
	Aqk1qS87WxJ62K8euqGt24cvX2CDMjkQ08z96jGI0vLNFEtQjRywgoSh0dA3MjOouWhM1ciJepB+j
	Z8KZqiiOEnA1bWtugNBQ1uGVWwqBYk+gVlmOwBWAaHehCn2srsQF2kcST/0aUL/guxc/x3581nWY3
	rjxT3+fBMHPVAmCwThZHm8FwnsfdnRHtYpuHvnUy8eSJ3lhQmR5TzgXawsmfx2bVTJOemSdxw7sTN
	VuY31jArTnggO7r9dGiQcay4Tn55ZeVQ2vHCKaOaif+1o2GdcmBWGXjA5GjuPhOyiKAdpFOjxBBuo
	bDk4GvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIZ4-0000000GuCc-2qRT;
	Thu, 16 Jul 2026 09:39:34 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIZ2-0000000GuBj-0bzB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:39:33 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6682b598e77so289102d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784194770; cv=none;
        d=google.com; s=arc-20260327;
        b=qxHLsw7e4tBrykXCFa/OIslgM3ftLHJe77V/tX8nrOKbb0+9cNwbT5IGAUMhVZSUnm
         wSNdcwAVNlOa9W5cexVhKtXCJoy6VyJlGzRYMhsrvXPWFk93HgiQwvTPj28sUg/Ka5mW
         VTCAev7R6ygzR/xy4BFeNsEvn4QACKc/wfQfHOboIb3v3XmVVH0AUhMX7yOnHtdMe6qx
         dDqUxOMkFBvbcinZvmTKWDpuqBkPvHR+x2KioD4nWFTlR4+BQO62RIeiQOivcOtbom9w
         g5XmPUpdURDoBkLqe1Fs1Dt+dXGUL/6s0eQ5UBv9FCv2ecA6MnBP0o3V3JYbSEdCw85D
         oKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        fh=YVOwq0r1Rx2PtSRYe9rwIwlHCY1+f82t5T1/o2fWjLo=;
        b=aPkwihlcbJCU6ge5GBnhZI7xlRjhg8R4l3TJ6DJJmL9ks4eW7XnBWFMhDKgirR87F+
         ghuyln1sDBQsHz2G9fFO80ASqrC+iWzEmOJynzjTV6n5y0yC6JDgeVJO+8s9Lj/ibt2Z
         pQV/Ya0Kh9O3B98L0J2/rmLt3UZF3tTcgiCVD7kajyji/QK1p4Aq3Z63eJlKqwe3ZOyk
         8z8ErEAVkEQ/2f5WPaVWJQyYwynMHbVFW/KloOy4bjcSPCivhdfdbhPzmcDfjfWzSKKE
         L/HDVBWOxWqaqvZsYpjIuuHvGknPemn7Qc65+g48IuJaQLL9IW/5c8t1RI2XyVfjXCSC
         WWyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784194770; x=1784799570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        b=IpIVooidAb0YzfYdzQAGVQHAy9TSUXNzMmD9aJGpXRUHzePkhkm8bCPcOUgO+uqqzW
         pbJmvuWSu5juEGScWIjXIw7sYqw+mMSPJv7FbvVlNJ+E9tAdjYlWyofPee6jwPZl5Ztp
         M/9GgBaR+7bd+MgyIZWqiGYqJZh2xS6ANdt2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194770; x=1784799570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        b=TcHQHAAptX1lJ0mG1IeNRUVijh7x3AGw6hNtqa63VrgIiPeW+KVEW4K55bvtSrDaNK
         2TR4t7RlRT7xUEKPpEtYAjrbfWfHYXwh+hqo9+hY8Mc3VhOuHPb3NbXbIUiBHWckih30
         9vL9JYUZieZwLTs8DIDqiXTvNOfEIfQsRMqWqzqB61UjUAnUvuzt78Gw7f7a0D4wY8/5
         24/3xcb897ujerQ/ZiSBxQsmu1HatttLz5ifNMkdSU4xP/0iMSQMIm1kOlKF3Ni2oBC6
         8vMem9WUJLzUnIeii6pVAxdwPsdvA6Ws4oz9HdXgSlhAMVT+FHysCWrtRgtCiW/OuAcT
         nb4Q==
X-Forwarded-Encrypted: i=1; AHgh+RposyfIh6AeIAhB3SwqO6B27Mn7uiwl8JIYsgqx9ULQosL4aun68VXyCfjA/SLBw/1Tz6CRc21CEY6mN6f1hpIw@lists.infradead.org
X-Gm-Message-State: AOJu0YxIMpgCqf9Wou7Ob7SdKnxvidJUZSEj1nXOC4DBsKKjRJR24rhO
	XMeoEY/EIqFY4GrJpW5TaQXEGeuYgStq8cStE+4j6f7l5+b7SeL94DtunLD6odxpyNkiU/Dfq8Y
	DC7Jy21AgHKBnYTGw8zg//0Z+vCHR1Vq1Gjw2K3JP
X-Gm-Gg: AfdE7cmy45NoAJhVnEwT7qoXDKZucqgal+HHIRq6T2aRmGqR7oZ/F3s4FxEtYxc7FMT
	cOGRe9jMHoxHnkN6SyXdN3yp2RO6hF8EyBdXLPyos7yiZ7qGr4I27UZVtxoPhFG00REKS9uAflZ
	qpLCiJrkX3Ygh4C3CnDXPtQ3ZXl+lxKtlimRZpzMdsARx+lqdVSGIu/ikkyy8rx7aj+Jj31ggiw
	/AtdRidQF4pGRabFJGjGdW8EJakt3AHcD0f7dxfbqTb1HN44b03FR1/dczNPq8dn15Ga/QNzsnq
	a1vRJOjx/bDLTrZG
X-Received: by 2002:a53:c80e:0:b0:667:bb38:d969 with SMTP id
 956f58d0204a3-667d7b0060amr9599454d50.16.1784194770410; Thu, 16 Jul 2026
 02:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
 <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com> <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
In-Reply-To: <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 17:39:19 +0800
X-Gm-Features: AUfX_mzbe7WMgo0cPdR-Yi-m3qfqJETc7DH9Y1NWKQqSMqgCgHS_ReKsQ1v2DI0
Message-ID: <CAGXv+5G0Ffrh-8UohJuGPQ0e7KGpy11=X7t1JtDYLTJ_tZgMCA@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_023932_238792_F3944500 
X-CRM114-Status: GOOD (  40.47  )
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

On Thu, Jul 16, 2026 at 4:14=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 16 Jul 2026 06:59:01 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >>
> >> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> said:
> >> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> >> >> The power sequencing consumer API already does power on state track=
ing
> >> >> internally. Expose the state to consumers through pwrseq_power_is_o=
n()
> >> >> so that they don't have to reimplement it locally.
> >> >
> >> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> >
> >> > ...
> >> >
> >> >> +/**
> >> >> + * pwrseq_power_is_on() - Queries the last requested state of the =
power sequencer.
> >> >> + * @desc: Descriptor referencing the power sequencer.
> >> >> + *
> >> >> + * This returns the last requested state of the power sequencer.
> >> >> + *
> >> >> + * Returns:
> >> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> >> >> + * negative error number on failure.
> >> >
> >> > I would rephrase it a bit.
> >> >
> >> >  * On success, 1 for on and 0 for off; negative error number on fail=
ure.
> >> >  * If desc is NULL (means optional) return 1.
> >> >
> >> > And this rises a question: why 1? Shouldn't it be some "unknown" sta=
te?
> >> > (But since Bart Acked this, this doesn't prevent the patch to go, yo=
u
> >> >  got my tag above.)
> >> >
> >>
> >> No, this is good feedback. Maybe we should prefer an enum like so:
> >>
> >> enum pwrseq_state {
> >>         PWRSEQ_POWER_UNKNOWN,
> >>         PWRSEQ_POWER_ON,
> >>         PWRSEQ_POWER_OFF
> >> };
> >
> > Well I think the crux of it is whether the API considers the descriptor
> > optional. The power on/off functions suggest that is the case.
> >
>
> True. That may be an inconsistency of the API contract on my part. There'=
s no
> such thing as an optional variant of pwrseq_get() so perhaps pwrseq_power=
_on()
> and pwrseq_power_off() should be converted to returning -EINVAL on NULL
> descriptor.

OK. I guess the other resource subsystems allowed it more as a convenience
to consumers.

> > I modeled this on reset_control_status(). I believe the rationale is th=
at
> > if the reset control or pwrseq is optional, then either there is some
> > other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulat=
or),
> > or it's always on and operational.
> >
> > In such cases and the rare case where one has to query the state, the
> > queries are possibly chained together and I think it makes sense to
> > assume the "operational" state as the fallback.
> >
> > If this returns an enum, then I think the previous approach of returnin=
g
> > an error value for an invalid descriptor is better. One doesn't need to
> > learn a new set of return values.
> >
> > I'm fine either way. I would just move the checks over to the consumer
> > side. But I think the principles guiding the overall API design is
> > something you need to provide:
> >
> >   - Is the descriptor optional? What should the action functions
> >     (power on / off , or query status) return when NULL is given?
> >   - Is the subsystem optional? Should the stub functions besides
> >     pwrseq_get() return 0 instead of -ENOSYS?
> >
> > Right now the API feels like the descriptor is optional but the
> > subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
> > around the consumer API to make it an optional feature.
> >
>
> There's one more use-case where the power state trully can be *unknown*.
> Please look at the proposed new function from Loic[1]. Here we deal with
> targets over which linux has no direct power control even though it may s=
till
> control some of its dependencies. This is where an UNKNOWN state may make
> sense.
>
> This is where I also floated an idea of renaming pwrseq_power_on/off() to
> pwrseq_vote_on/off() for better clarity of their purpose.

OK. Would it make sense to revert to returning -EINVAL if the descriptor
is NULL now, and then add a different error return value if !controllable
in the future?


Thanks
ChenYu

> Thanks,
> Bartosz
>
> [1] https://lore.kernel.org/all/20260710-monza-wireless-v3-3-46253587af64=
@oss.qualcomm.com/

