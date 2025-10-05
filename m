Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAD4CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTBVd/nClqrF+np3hp6dXMEbrmomobOJty4TYQ6vLHM=; b=l5ZHPlZnfteYc4AUDLeMs5Xfz2
	QrsN+Wqrws/vw8XzLJylH2Rn+iMyRawsmqxYv2YHHvzlKc0LMrClwzhSrubaOlVJPSadb71MXVKEu
	wSrCZCxewXkJVkKtkEVLTN/iP+ERXNOKQAI38ZgtcVwSakksl/4VbZtL2TdAzEpntOnScH4djtWMj
	zxnIMZPZtGPBkYbzIMJUi1jObYuVmCJd67gSzB04dxlu2A5EcdIAeKWkx8c1leggMrZTyWIuNr/f4
	SQK0Vlfdzk3bLML/uwLxiDuqGEnYTaMXG5tvMVqxdg8aHMEVmREnI0MVXU3dZsP4jh+oL0afOJBFi
	v8BStHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Nyd-0000000F5RI-21mI;
	Sun, 05 Oct 2025 12:36:35 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Nyb-0000000F5QN-2FWV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 12:36:34 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-362e291924aso33118541fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759667791; x=1760272591; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTBVd/nClqrF+np3hp6dXMEbrmomobOJty4TYQ6vLHM=;
        b=hWoqSHUMdlyUMKdqDak00kHoelstcfBWA4kOKstUUp6a2CvyCc6Q8y4Exr/osm01Gu
         wLK2KY4B7eq5Eu9mHWCHtNzz3IwSuQWRRASkQ6OLzYSbrspy0N+iWuB8TLQ+nMAEvqFl
         eX/7ZbmfTbbXMqLkib2pEt2oXzt+8YLAFxpPekNx1cOdsmtczfAFONIEnYpmkBoC8zqg
         EB0Yyvm2/w/dutGAuiqtD+hmPGlFev2M46Xtf0UYW/hws0FBc/ALJqYoOko9W8eJcctF
         cZTDNNcU43eQrAeLmAg9tHennMObM9sBXxXUllJn8hzbr/dH+Fp1jzbbYerQABysMs56
         feUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759667791; x=1760272591;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTBVd/nClqrF+np3hp6dXMEbrmomobOJty4TYQ6vLHM=;
        b=WzzU5i3SNcxL03zUPCyiSKOGBJ3YHJ1mtDh52jbtwA9fJ2tndoK6lau/v8qaC14sKz
         Zq5hCWYacp9soGOVG52SZYzTQRHTGkQ3ODTpj40OFSvlMSx+zeyHExZZZjU6Du9X1daF
         IRm9uXLPArw3M7j2zhNK/F5BWFZyaBV8z0d2uYJB0xIBrrJt/+IzRxiruHj1qohd7jR+
         xN2iHvFkDoa1rvlyCkcfXypXD8w59q/Pbc/qh/4TV/5MHX41CoxafK4xarDg3ZH2ISAZ
         XB8FwM92GYPQ40vjUozrpg80Gk4T/bbUptOF75/Y1ADMG8/53qmjrU1Zwb8XsiOF//0D
         Hkhw==
X-Forwarded-Encrypted: i=1; AJvYcCW20rCrHcA/2pM+Rfkitn8KfRWaN53r0Kn6n30YiKtZROFqgmiejMUv3I9JNoq4y6Hpf7ygjZ6l4s7O936ujdL6@lists.infradead.org
X-Gm-Message-State: AOJu0YwlYlaNaaU0A5ijVUXgxgMvsVXEjNVc+BIMAU7IkyznuX+sSvwq
	XyLnjfDJgrUKnC4angmd55PCJKOGVr/fKbAaM1IncSXyLvxVprUnH4w2
X-Gm-Gg: ASbGncsMzEFOhTeAsRZ52WPfR0ijIibQh7EzIWqdSjN/P4vwK+c1RkqCfZl8D17a2zP
	zTTFcCnAbkGS6BpCaPj8UVhD9Z0cGBnWk87p0mCSpaYsOTMoeTRigIEErILGi96wHNlRwG2my+w
	mXn26kFyG5EqLNHXUQpUzopi7dd5qCRPoB9VJCkHRz0Ih2mL1DqjfVwhceZ9krrVvLc0nUjlOg+
	OLU/LjDBEomSkoJsrJH2cHi0L1ERGtlnh4l65l5PXyPI6F2BT6FjhL9gKjTER53gM60PfrqxL86
	IAUEDt6f6N1aVyEPEL2TuAppxBUiiB/oU/VLxA5Wrp9NPWbT0oXqpGteZzNdmwSszL277eyimDW
	a5zsDYC3zHEgbRDcRfiFi5nOvkQrZ8RI74BPqc7ZUxb8RW69Rbt4Zd9iXyydC2SxT6V1bE07gEN
	yrQOSYUPS7agzVjfaz
X-Google-Smtp-Source: AGHT+IGEqErpl4/yZCkCUF1+3SE3UIJICO6kK51WxwIZOJed0A6X31dHGb4CXR4L8Vz9X90HOvSsMw==
X-Received: by 2002:a05:651c:1b05:b0:356:839:56a with SMTP id 38308e7fff4ca-374c37ef44emr27261701fa.25.1759667790693;
        Sun, 05 Oct 2025 05:36:30 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2736c4sm33396251fa.7.2025.10.05.05.36.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Oct 2025 05:36:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
Date: Sun, 5 Oct 2025 16:36:15 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Dongjin Kim <tobetter@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABDCFF3D-D3EF-4EF0-B51A-AD6B25D78895@gmail.com>
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
 <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
 <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_053633_595244_29D201BB 
X-CRM114-Status: GOOD (  28.53  )
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

> On 5 Oct 2025, at 12:22=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Hi Christian,
>=20
> On Mon, Sep 29, 2025 at 1:58=E2=80=AFAM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
>>=20
>>> On 29 Sep 2025, at 1:24=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>>>=20
>>> Hi Christian,
>>>=20
>>> On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
>>> <christianshewitt@gmail.com> wrote:
>>> [...]
>>>> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm =
*priv,
>>>>                       m =3D 0xf7;
>>>>                       frac =3D vic_alternate_clock ? 0x8148 : =
0x10000;
>>>>                       break;
>>>> +               case 4830000:
>>>> +                       m =3D 0xc9;
>>>> +                       frac =3D 0xd560;
>>>> +                       break;
>>> Initially I thought this was wrong because it's only added for the
>>> G12A (which is also used on G12B and SM1) code-path, leaving out the
>>> GX SoCs.
>>>=20
>>> Was the 2560x1440 mode tested on a computer monitor or a TV?
>>> I suspect it's the former, so I think it expected the code to take =
the
>>> MESON_VCLK_TARGET_DMT path, which automatically calculates m and =
frac.
>>>=20
>>> I'll give it a try on Friday as I do have a computer monitor with =
that
>>> resolution - so any hints for testing are welcome!
>>=20
>> The original patch is from Hardkernel sources - I=E2=80=99ve picked =
it several
>> years ago and then updated values semi-recently after 1000ULL =
changes.
>> The user who originally requested that I cherry-pick it (and tested =
it)
>> was using an Odroid N2+ board (G12B) with a Dell monitor IIRC. It=E2=80=
=99s not
>> tested by myself as I only have TV=E2=80=99s not monitors, so it will =
be good
>> to have your confirmation (either way). If it=E2=80=99s wrong I=E2=80=99=
ll be happy to
>> drop it - I=E2=80=99m just trying to upstream and offload some =
longer-running
>> and allegedly good patches in the LibreELEC kernel patchset.
> So I've tried it on a Le Potato (S905X SoC) board. This patch doesn't
> do anything here (as expected, since it only targets the G12A and
> later code-path).

Thanks for testing. Let=E2=80=99s ignore this patch then :)

> Doing some more analysis, it seems that
> meson_venc_hdmi_supported_mode() simply prevents using any mode with
> more than 1920 pixels.
> I attached a simple patch to overcome this (discarding any
> meson_vclk.c changes):
> $ cat /sys/class/drm/card1-HDMI-A-1/modes
> 2560x1440
> 2048x1152
> 1920x1200
> 1920x1080
> ...
>=20
> My monitor's OSD tells me that I'm running at 2560x1440@60Hz.

I=E2=80=99ll pick that for wider testing, but it looks sensible. Thanks.

CH.

> @Neil, should we bump the limits in meson_venc.c to "4Kx2K@60" (that's
> a quote from both, S905/GXBB and S905D3/SM1 datasheets), most likely
> meaning: 4096x2160?
>=20
>=20
> Best regards,
> Martin
> <meson_venc-hdmi-support-1440p-screen.diff>


