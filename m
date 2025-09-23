Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F763CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=; b=ACGAQCjj+RuC5nTnnz+RZSHAQc
	3WAhOROF0MFhnJcheBC09fujXLtAGymPCkLAF7yqKqHOTKH8b0a5Rj+wq5WSe8NERg5GUkTYrvf4t
	/hDXN1QhKiAd5BjO6blaWMJerhdAMzHuV04QegDwQTe15Wl48BYhUCqjhd/8eu6vFCO7VmPu1vpg7
	2q0jfQN7sXJvugnrcceFuM+NepRlht30e4X8yIp+h908wORXab1E7M/6VHObSbA3RSYtW8sH5zCKp
	sCamMvKU57tYlhgp7REAwBPrGj+/FzVV31H522QhnMEaxr9i27j2ypyKKw/prFFYej9Q/fd4nRJMf
	gywlD7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rqm-0000000C15V-411h;
	Tue, 23 Sep 2025 01:29:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rql-0000000C156-2EZV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Sep 2025 01:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=; b=T59GNgDWm0SrE2oKSFS4uygFuP
	N4k+PdkBKl9QUm7Bq5JDqlkNfpDopV64U4ygYfds9a48Ch9KNKHm/q1z//87Dnb71/z2J91+28Qtw
	FBZQpVo1kH/uML8KK2aomyEORiXBbtJjSnmWDe+dl+noBmsvF5hShACCW8DJNo+80sEVYviqksAQA
	3KM1Thdncj8EP5JWhfna6MVyC9HkvrNseFlk0p2qQ1+E13Gledf2zE5gp2tNvHYKOGtaAMLGz/xQf
	iNYlKpnTBAtJXuIRSY/y9bR9Vq48iyMu4XzBpNrhc2GZIMwoqDw5v/0yGXlk2y/gFQ72HioSfVysl
	KawMJBnQ==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rqg-00000008QOt-2g0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 01:29:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-330b4739538so3132112a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 18:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758590977; x=1759195777; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=;
        b=KkN5VY+m0WJaSYGBz19DAUByj4NjBT9VDN4uHfdXbJDqShXIqf9wolzX/XdPrmMvQ4
         i7YcZWLFZPUEtrgNS2tXvVfDNHKn6xcOVTKL9vz60Tq4jbfHOe8qMob7jJ6MwWU9v/eV
         97QoHi51AnYdwyxVaOzST1Us8TxMjY5EzZhIZ78EQuPs0kosLy4oxH1jJ/TYtKBscksG
         3sw9dF3V/NynhDFiWLBO4CLIo9mpZpnYfwLTichBBKbs123fXM847l5BZ5hDKtXbWH3A
         7iQVuzCmrYNYCKEY+IArwG0CAv1Jwyyev9yyE2yLpZ73IQ7olV548skXmp/7HRtfEnCC
         FI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758590977; x=1759195777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=;
        b=l4QsBhreDPMyNLR6H3+mGTgXbKFxoEFQpeF+imlHRbKoJGeyT0ZdOuGLSgf3jD71wz
         1m2ZBCS6zdmKicT5rp+2EEWS1ji/TRu9aOw4EiVDfKIhVwpEkzhTdHCFpNdVgIobKOWR
         ooR4SgkeyDhTCLMb3duVvIfz7hZ+s/pYnsAXwYlZiGVW13dVVHpFmnT1PPfhLenTDhqb
         JmG25guw5/kVWXzAkcDYuxwlTJxUXaGdZGZMSNMlrzoNzVmJ4s/S294542vJ4uyC1ISi
         Ult33FW427WYmeZzHsB2mTb6oEFmJ0GNKuAx2tWjxnPnd4xKMITkIWKv9ZuCxFQ1GaJy
         H34A==
X-Forwarded-Encrypted: i=1; AJvYcCULb8L1HNCleooeCMNd2HJ8kXvDMYL+Ba4buJIP50sM6U5EWDmI6iT1RTydgWNQSYRiwmk1wFpHi2aZK4+gqpKN@lists.infradead.org
X-Gm-Message-State: AOJu0YyFqZ0oBwW9GZE+JzzQ92ISk7WZ3pxxQHk9Flh9tA1m4agh3XC/
	HHJnU3CnWylvNO25/cbvDjWscForIzQUnZ6Q+hFoSUsV9rsKkTTWKTu/5lCNefjeLvPk1zhYdfP
	oOIDTPcchD/mj8t6kTxDAdkMQ3vaLudg=
X-Gm-Gg: ASbGncvQhz+0JNbfltOMHTdDqEv59pfHTrEINKUCve0SEjCL6N1kSWGmbytHcoX4HuZ
	1K/WcK+tM3O0yVll4lz0epxCptkkUtMVI94D7D98PmJWV1Ee2Tsht0kbRbkngNlFMEg3IWyOF3w
	q003HPWIpO4A/Yvq8pNrVQck2ufXK+z0xn5b72J4LKf0hrgCbmw4eon6UdShdIsiVs67DBfq/Xt
	nQZlEQ=
X-Google-Smtp-Source: AGHT+IGBT9LTfm84q4DXIRoJSFR8hZ2WWRU49SsvtumqUnLfaKU5tnx1duKBXoUog0HE+Dc5+BSde4IFSplat+4nyaY=
X-Received: by 2002:a17:90b:33c8:b0:32d:f4cb:7486 with SMTP id
 98e67ed59e1d1-332a95e8e19mr1041351a91.19.1758590976762; Mon, 22 Sep 2025
 18:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat>
 <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com> <97288c51-954a-48a9-92b9-e165ce480707@nxp.com>
In-Reply-To: <97288c51-954a-48a9-92b9-e165ce480707@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Sep 2025 09:29:23 +0800
X-Gm-Features: AS18NWBhgiBnQW_QrjL4oCw3YUyblBEb719xz-MBTlZAVwouH205ucQ6fmr_z54
Message-ID: <CAA+D8APA85PhWVkW7c=d_qWF7L1ERxe7cS3Gg00SV-3TSyLwQw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958()
 for iec958 format
To: Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, 
	dianders@chromium.org, cristian.ciocaltea@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_022942_869152_057CC1E7 
X-CRM114-Status: GOOD (  24.58  )
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

On Mon, Sep 22, 2025 at 11:01=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrot=
e:
>
> On 09/10/2025, Shengjiu Wang wrote:
> > Hi
> >
> > On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> >>> On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@=
bootlin.com> wrote:
> >>>>
> >>>> Hello Shengjiu,
> >>>>
> >>>> On Thu, 21 Aug 2025 15:31:28 +0800
> >>>> Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >>>>
> >>>>> Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio=
 device
> >>>>> driver needs IEC958 information to configure this specific setting.
> >>>>>
> >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>> Acked-by: Liu Ying <victor.liu@nxp.com>
> >>>>
> >>>> [...]
> >>>>
> >>>>> +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int =
iec958)
> >>>>> +{
> >>>>> +     mutex_lock(&hdmi->audio_mutex);
> >>>>> +     hdmi->sample_iec958 =3D iec958;
> >>>>> +     mutex_unlock(&hdmi->audio_mutex);
> >>>>> +}
> >>>>
> >>>> Apologies for jumping in the discussion as late as in v5, but I noti=
ced
> >>>> this patch and I was wondering whether this mutex_lock/unlock() is
> >>>> really needed, as you're copying an int.
> >>>
> >>> Thanks for your comments.
> >>>
> >>> Seems it is not necessary to add mutex here. I just follow the code a=
s
> >>> other similar functions.  I will send a new version to update it.
> >>
> >> Let's not be smart about it. Next thing you know, someone will add
> >> another field in there that would absolutely require a mutex and now
> >> you're not race free anymore.
> >>
> >> Unless there's a real concern, the mutex must stay.
> >>
> >
> > Ok, thanks for comments.  Then Patch v6 need to be dropped.
>
> To properly track the changelog with patchwork, can you send v7 to add
> the mutex?

Yes, will send it.

Best regards

Shengjiu wang

>
> >
> > Is there any other comments for this Patch v5?
> > If no, can this series be accepted?
> >
> > Best regards
> > Shengjiu Wang
>
>
> --
> Regards,
> Liu Ying

