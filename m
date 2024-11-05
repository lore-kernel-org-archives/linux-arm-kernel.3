Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC6DD36137
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 20:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h71mhEAFtMfzAvjQCt9oe39hLBh7KapKFPrJuYSmWg=; b=RtgYAKJMP0ewOayO8CCd8WhQFb
	PETVLf8p/Lwwp10Yv7GHVR0CxWx3f3QFCGh3v4rObZD6y0DQDm6WpEghYCFiMn/WpD3JFLEzm08w6
	iMxsDGEYhL9auap5ubpS+RzrkiZ3wgDzOhsjMwRCu5DCYbOPYZvtdHeOv30NYrmy9jqVoWYa8DVTe
	l2YabFmTC3YwaP261Vd8hRojqODG4yyXjxOmuzkoNrEfNRJC94eYvu6MRBLNJCkbUKB/Q0x74hdbA
	dblC9N+xbZA5+46RbFgLZZLWhoQWKfVv8P4Uo0+HN+U6o5Ckb3L9/Dd6wN4DnvV+33xxtjxln+KE4
	jDKfle0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PvI-00000000h4J-3YM9;
	Tue, 05 Nov 2024 20:13:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PtV-00000000gm5-31rE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 20:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6251A439C1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Nov 2024 20:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C7CC4CED1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Nov 2024 20:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730837476;
	bh=pUzCR3wb1F7ue7zroROqvIhqYN1kgGH2ohUVUIxI92U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XXz9sYuJAc4SoRb4zZkyF0KvE/yHoI0xQkdEbHA6ow3GEKjSVUwRKuQU9qhHd10Go
	 KIQDVnr1vWd3cKDCdwiZoee3H8dH8y/vNgGgh5I+K/zQi+EQXEVIiJFDN5m71YZ94o
	 FA2U4VVHpUfvPW9+4ftAPCfo/iENEjhdGwE9RqPbbBvasCmgkrppresShuEIq56FHf
	 efbvVMtBaOUUTeEiaZutIlHNqeM+w3WNxkhhwpV57ZhSyLgfGpZjODmw8iXGAqhDPX
	 mtC5ESnnwJKKXrPMTZRlXzQVQm8a7JbMCZF9x/tajIU7yrFmvCdSFfAgj4A+xL1B1E
	 1et6S3vYGoPXQ==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e30eca40dedso4837934276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 12:11:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMw+qZqZhNVKP4gIYdWeISwGnBmeGuSeZsJmHqridjYxpCGlWl3dVIIm1NlDz38WhwVNBsiD0rnjnbXTAs8Aa5@lists.infradead.org
X-Gm-Message-State: AOJu0YxRSw7bl0Vp4aU9ym6rcEM1q3dH757MM/V+R9wJi3rM/0MvfTX/
	WmjLQ/awEaXlcpKKASwuUojBc1E+1jM3L3HHfk/g/npOKVWZjYu1gvzkJlkVD37PQDDtJINA8IK
	jSyqujsupUTNGTocGHZmsykvstA==
X-Google-Smtp-Source: AGHT+IGjBrKey81nl3nx8kOyR1h49mszjJqU8gpqGeS0+ZBCji4nxidLWF6J3Nufn1F4QsUGN28RJnR1wt8dJZyfAgc=
X-Received: by 2002:a05:690c:6e03:b0:6e2:1bba:ed4c with SMTP id
 00721157ae682-6ea64af4defmr187913797b3.17.1730837475817; Tue, 05 Nov 2024
 12:11:15 -0800 (PST)
MIME-Version: 1.0
References: <CGME20240919151130epcas1p10a885b3364250f5ff4e06975cfef13e4@epcas1p1.samsung.com>
 <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org> <000001db2c1c$12e86c50$38b944f0$@samsung.com>
In-Reply-To: <000001db2c1c$12e86c50$38b944f0$@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Nov 2024 14:11:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
Message-ID: <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
To: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= <inki.dae@samsung.com>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_121118_427911_7C5CD682 
X-CRM114-Status: GOOD (  21.61  )
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

On Fri, Nov 1, 2024 at 12:08=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen P=
latform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:
>
> Hi Kaustabh Chakraborty,
>
> Sorry for late.
>
> > -----Original Message-----
> > From: Kaustabh Chakraborty <kauschluss@disroot.org>
> > Sent: Friday, September 20, 2024 12:11 AM
> > To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> > <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>; Da=
vid
> > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Krzysztof
> > Kozlowski <krzk@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; Rob Herr=
ing
> > <robh@kernel.org>; Conor Dooley <conor@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.o=
rg;
> > linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; Kaustabh Chakraborty <kauschluss@disroot.or=
g>
> > Subject: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
> >
> > This patch series aims at adding support for Exynos7870's DECON in the
> > Exynos7 DECON driver. It introduces a driver data struct so that suppor=
t
> > for DECON on other SoCs can be added to it in the future.
> >
> > It also fixes a few bugs in the driver, such as functions recieving bad
> > pointers.
> >
> > Tested on Samsung Galaxy J7 Prime and Samsung Galaxy A2 Core.
> >
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > ---
> > Kaustabh Chakraborty (6):
> >       drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference i=
n
> > functions
> >       drm/exynos: exynos7_drm_decon: fix suspended condition in
> > decon_commit()
> >       drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to =
Hz
> >       drm/exynos: exynos7_drm_decon: properly clear channels during bin=
d
> >       drm/exynos: exynos7_drm_decon: add driver data and support for
> > Exynos7870
> >       dt-bindings: display: samsung,exynos7-decon: add exynos7870
> > compatible
>
> I will apply all except for the two patches below,
> [PATCH 2/6] drm/exynos: exynos7_drm_decon: fix suspended condition in dec=
on_commit()
> [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add exynos7870 c=
ompatible

Now we have a warning in linux-next that samsung,exynos7870-decon is
not documented.

Please apply the binding patch. Or let me know if it missed 6.13 for
DRM tree and I'll apply it.

Rob

