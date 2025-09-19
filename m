Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3218CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 03:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKMYfdVwb74kV6i8GOAfD4K3WUGY3beOoq2S/aiwLCo=; b=b0SqCitYBcDmTR8cMIuyG/bsuJ
	QS1LPr52H/L8E9ZKBhR97AvDmL6BPvgkRtwzvwLezmI2HG0strwTzuPLWIaO1IHDtloI+hmXlQjoe
	Tidzyf/yboWT22Vjn6YQApUpJHhI5YRm/q/uZs20wHXX2dugjIYgaAyLB+jzqj40bPXkbJxtfCA14
	ESLoqnyuDTUCK+XwoyeFaBUhIZUkn0CDAVnuWEMVVUQFrK0wYD02dj2d41lpdHKhln//MpPxu1zQl
	DeIhn2HkzhKbdvprJPE9qteET/17uUn4ATalqzL0q1zv1ZZTPkYzEcRIZhzw2wbqUhhRquUFk5AlB
	HHBk2owg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzS22-00000001lCg-0GXF;
	Fri, 19 Sep 2025 03:43:34 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzS20-00000001lCH-0jFw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 03:43:33 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so1870894a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758253411; x=1758858211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKMYfdVwb74kV6i8GOAfD4K3WUGY3beOoq2S/aiwLCo=;
        b=EfFz0et9Rj/wU50FBv65HufkzIRhg2JoM6UsExcQl+avJg6LJk/aFeFTRZgm7eOXDD
         Le+ysmk/lK3LAcesuiXX2VbYYobyfCeDYNcPehBD3YrVxGCU/rj45xr1kr6tLlbk5KpS
         SwmV0sJe86futkP18cxPi9YH+lCRxkVPUmxixMMNfkEUDfXdcFMbcaYOyk7VQXrXMHSM
         b/gmOal6rrJC8wD9g1NeAgqAyEcGWjfL0+XclgmSGDQxnf8KevoK3SMxWpzaNFJRbRDT
         Ga3AW6KWQN9Y3LMTOHBoHBrr0UX/ZIIc9ANj7+blmoMGtSvRwQjU28e0s0/A126WGWnY
         gAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758253411; x=1758858211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKMYfdVwb74kV6i8GOAfD4K3WUGY3beOoq2S/aiwLCo=;
        b=QRHCIXHTJEX3oPsDnc2nluzl8D6YIkYGMWpCOZy8cmX4i/rF8iIwt3wX7tOJRpbw4L
         KuUaq/BkXj9qEBj0xxT5n5he1EwW6YmQZdvLcrX16wXlRyOkLVKJk4ALIIXOfIZH49vG
         YogBCvIEeKIQJV4F+91Ucdv9MKLJ91epcgOJ4BaYGTlgPT/8g+YZ4FQtfWR8S83mLsfi
         CssCWbg6y1/WZ4/ZLGcEuJ3MHAeJ6/gUv7ENRv86tSaROtq5V3bLGXF1YEPcC+X65kAu
         5aqv3mN2En6Zh3kP09gZJEzpV+osZgbGyiDlGfnVSVZEgSwEq4WjEpZPyGo5wBG7J2U4
         oEQg==
X-Forwarded-Encrypted: i=1; AJvYcCVBVvOsbhSoXwNT5qtdvshJZZWDJL8Fbkd1YFXIyEFJNxYanR+Cvy6MX4V5ayZcQBfjcM77FRsmpMLzKDAzcTJE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Zmidj0ti/nSD5g73dOoBttd5BlnTd/l04wtnr/OieLBARSGo
	utHPJgsUh8C+3IrAobgzVS5cToOmn0bAEMcI1OdT+4Sjo9/HDvaV053/Kawo5oIjz1xFOCILfXR
	pnsqBRwE1iCknraYtcIduqUAdazSS/uk=
X-Gm-Gg: ASbGncui3qsNkXEhx/lyc4MDp2xEkezu5obAX9BxVWlvwV0rXnK16VE8X4MyXDQ6y1F
	zBXYuxiytBG2/xWm/vJei6VctHc7kPI6myhUdTKgYu7yxZX2GBx13Pz9ReJ91jv6qsJxRVKVDBT
	4oNsuqVmH4PkO1pId8CDUy/zeiRhXrUHmqRl5sJnbezhL10E7OiRrqxOaqJdLCBr3ds14OLaEhL
	u0bT4o=
X-Google-Smtp-Source: AGHT+IF3ku8gvZB1hxFYXtLnd7iwTR3jkeyD4oKxxo5kWDQcOyxdH6t3IjIvgH7PYtQujNBSFI44t24lqUYUtwzzka8=
X-Received: by 2002:a17:90b:52d0:b0:32e:d011:ea1c with SMTP id
 98e67ed59e1d1-33097ffd1b2mr2599824a91.15.1758253411070; Thu, 18 Sep 2025
 20:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat> <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
In-Reply-To: <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 19 Sep 2025 11:43:05 +0800
X-Gm-Features: AS18NWDra1nGW4hE_RulzgXqUXLGFVIDrxwneg_8Sfyhy5B_85F5WDGUq5FPeS8
Message-ID: <CAA+D8AP8eJ8_pueq1ZSb-ORzTJbNT7HOwKFOO5ZCXqgqoQ1qGQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958()
 for iec958 format
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, l.stach@pengutronix.de, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_204332_238489_02303336 
X-CRM114-Status: GOOD (  25.58  )
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

Hi Luca

On Wed, Sep 10, 2025 at 6:29=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> Hi
>
> On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > Hi,
> >
> > On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> > > On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@=
bootlin.com> wrote:
> > > >
> > > > Hello Shengjiu,
> > > >
> > > > On Thu, 21 Aug 2025 15:31:28 +0800
> > > > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > > >
> > > > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because aud=
io device
> > > > > driver needs IEC958 information to configure this specific settin=
g.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > > >
> > > > [...]
> > > >
> > > > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned in=
t iec958)
> > > > > +{
> > > > > +     mutex_lock(&hdmi->audio_mutex);
> > > > > +     hdmi->sample_iec958 =3D iec958;
> > > > > +     mutex_unlock(&hdmi->audio_mutex);
> > > > > +}
> > > >
> > > > Apologies for jumping in the discussion as late as in v5, but I not=
iced
> > > > this patch and I was wondering whether this mutex_lock/unlock() is
> > > > really needed, as you're copying an int.
> > >
> > > Thanks for your comments.
> > >
> > > Seems it is not necessary to add mutex here. I just follow the code a=
s
> > > other similar functions.  I will send a new version to update it.
> >
> > Let's not be smart about it. Next thing you know, someone will add
> > another field in there that would absolutely require a mutex and now
> > you're not race free anymore.
> >
> > Unless there's a real concern, the mutex must stay.
> >
>
> Ok, thanks for comments.  Then Patch v6 need to be dropped.
>
> Is there any other comments for this Patch v5?
> If no, can this series be accepted?
>

Can we have a conclusion that keeps the mutex as Maxime's comments?

Best regards
Shengjiu Wang

