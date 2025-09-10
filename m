Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB317CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFR8ZPpFEPCVYzLk5x4GOe0UcgUOQwtlh+HxpxWLLgo=; b=4lignd+2cI7qgpTNyXQwwUAWko
	qwdw0P/mm04UEeWf1+g7CebBxiqk6Ozui3Vxe/L9oRknUsOwXJ8BMAlEUuGQV70KQlD7JNDXWtZtw
	oS6WCEIq6G3Qm8CwKJxSVibu+D6KHdPVc79jGuNb0zZYIzABA2IdBJgdP4LRNClCY0a2h9ga9xcAz
	KdHa8Y7scKeD7JYqQ+UhsokyGCy6oA4cygacef6dbfRQiRotwtEvtpD0naG8L+UwbBnFyFVzI+4gV
	aBwkEk2ubvtsMRgqPfPPPciPL47jdtmLAGWu/5HcG7hcmpgfjHAEjYRjstWOplN10gjfi5OgSJZhM
	9Wxu0zyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwI4t-0000000DWdu-4AwA;
	Wed, 10 Sep 2025 10:29:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwI4r-0000000DWch-2qQE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 10:29:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61d7b2ec241so8193676a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757500163; x=1758104963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFR8ZPpFEPCVYzLk5x4GOe0UcgUOQwtlh+HxpxWLLgo=;
        b=X7cSkWCp8EwgOSbAq0oim7KR1IgThGfXh5pqYD2xtSU6ohTJqcrT/3xpRsLzXFCISD
         6SDJ/5jQGS2MToHLc7g5EHWV6YuDFOA4GNXg2Bl4mcHXAZfd8UIV5QLZbsYNvgmGoInG
         aXh4wgQSv/i8C+mrRhJ/Zs7B2XjsdCgjCg+xLM7Ahej3AyWILSHh913Jrgzgbxr1hEvT
         9x8SW0JlI0SRCUOHuxKbyTX5eGTvwRSCNNbWJrgpD/j7Ygnp04UvV7gNy827bqR+7ajh
         2S/uFmHx1//2NVkJq56XIYD2Q4lwcBTgtENN8PWa92YsXA7jwRh7IIfxDeRrrV9fxagK
         FRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757500163; x=1758104963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFR8ZPpFEPCVYzLk5x4GOe0UcgUOQwtlh+HxpxWLLgo=;
        b=vBZGupbagCNE4AmzTsC3w7QzhgeW1EOt6jGQoPg+7DiCy7BcGV7/n2K299b4yEu9I/
         wUlgCy8FBTyt53P7zQwownV+MZot8RevKJkF/66UNop1aOVkQHbh7eVBe8DnL0BPPU+c
         9BGAJJXnVj1bJUgZqMxfkBUDRqTxUBXXY5mS5WdGRn8g0c7BnFVmGDnHgR3MIV/EGsBR
         lSdrZPyDtXWc102+lbKjmW2av7ahbuxCPYdlWiPHTPEKoKe6/mvsllzVSZGx8ghjC00U
         r/FHmS6YRYB34k8IWfacL4e7jB9HVW3ompYVGW776cQ6T2ya8LEsdPaWl2tyQ85e42Nj
         rWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5qs5hRbjAp9bUH8dbRlHwR31frQE3LXnsBocbHk48PrUCDiYTWoedvK8ENxloJ60ZVbf8MDvGYLeH/xpTK3y4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4yFh3PQmENyq9uXcCyLvfeM6C7IJebR4EH3Fm0kszztbKxNJp
	aTXh13RiCBR7gep0eEoImbnG4BBETJzPZLfIgaZeq3ys3daTqbjLjo6s7myDPgK8OS9RJse1lDm
	Pa3EbOaV9rqm9UF6AzIkHlVZbTI9CbXw=
X-Gm-Gg: ASbGncsMUr31veDNUKFQ/KSrWJwPhSTsjTGWt74GDl+2LY0EEBiCyRF+YmThB5DKbd+
	1hh3aRBCiAK8m3LN8YST/LhPff0xChx5NI4hIKI+j8Q2v4OjrHSSdIlS+NVEZ+ywxw9yUt6W2pt
	kcetYk5cUIuyzO7RJYR7RLgxHJAbB4hkAR9erZiJlSp40O2CYb4vaQX+VMBU+tQvxW0Vql3480J
	3k3NNw=
X-Google-Smtp-Source: AGHT+IECula9dQIHz1fdQAkXI9rWQDEmBppATKx+V8i0x7QFJ364KiBjVFFTrRLIeHCkEnfADY+kNhoLNela/4vT6zI=
X-Received: by 2002:a05:6402:35c6:b0:62b:63f8:cdbb with SMTP id
 4fb4d7f45d1cf-62b63f8d53fmr6060144a12.25.1757500163205; Wed, 10 Sep 2025
 03:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com> <20250909-omniscient-honeybee-of-development-adca8a@houat>
In-Reply-To: <20250909-omniscient-honeybee-of-development-adca8a@houat>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Sep 2025 18:29:06 +0800
X-Gm-Features: AS18NWDxCBzuENqe0ZeZa-sBoiFIIvg2ByB3rkyz5E1gppn1Dt3RitckbH6afXg
Message-ID: <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250910_032925_737244_CAA6E026 
X-CRM114-Status: GOOD (  23.70  )
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

Hi

On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Hi,
>
> On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> > On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> > >
> > > Hello Shengjiu,
> > >
> > > On Thu, 21 Aug 2025 15:31:28 +0800
> > > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > >
> > > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio=
 device
> > > > driver needs IEC958 information to configure this specific setting.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > >
> > > [...]
> > >
> > > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int =
iec958)
> > > > +{
> > > > +     mutex_lock(&hdmi->audio_mutex);
> > > > +     hdmi->sample_iec958 =3D iec958;
> > > > +     mutex_unlock(&hdmi->audio_mutex);
> > > > +}
> > >
> > > Apologies for jumping in the discussion as late as in v5, but I notic=
ed
> > > this patch and I was wondering whether this mutex_lock/unlock() is
> > > really needed, as you're copying an int.
> >
> > Thanks for your comments.
> >
> > Seems it is not necessary to add mutex here. I just follow the code as
> > other similar functions.  I will send a new version to update it.
>
> Let's not be smart about it. Next thing you know, someone will add
> another field in there that would absolutely require a mutex and now
> you're not race free anymore.
>
> Unless there's a real concern, the mutex must stay.
>

Ok, thanks for comments.  Then Patch v6 need to be dropped.

Is there any other comments for this Patch v5?
If no, can this series be accepted?

Best regards
Shengjiu Wang

