Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DD4FCD0C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 06:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AIpEMFSc1w1UU+CwQpv+mXG0dXIbG8YyU6JKJWt2Ig=; b=ZnuiZCkHTERc7ua/kfYYlo7Ufs
	p+jYt+khxR7x0H3paCgs5UBh0PYpFzuvFoAj0mzJpSe9cEgRFIYoF/yx4DvELL1gZKyQ4NQ9r2Hw0
	RrAydG5HEe00Lr6XOGlpmDApRLE6eI60dZrABRs1PeLcRKMc4wG+HgLns8VKL6JVet+DiDcdKpWiN
	aro+PL55tEIn9Kcu+1cdF+ytj2BBnh0ZRtDgivIViu45EOsTRVDEit/X9QeCgO5HgIUXugBQ97gq2
	vLk3xeskK+ZgartHFrO8zqmvomWXmOD09cx78vODlk3+YOEjB98mb59GJJ85qYePklqt2oL2VpDBY
	8SMMRmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kkq-00000007tPP-3uS9;
	Wed, 18 Mar 2026 06:51:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kko-00000007tOt-24bz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 06:51:43 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so5965716e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 23:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773816700; cv=none;
        d=google.com; s=arc-20240605;
        b=Tp6+KIgwkN580Ww8ZtBpInwxLO6Vl9iEYJkBMzIduRJmh/DO2advz+nyk2mz69VfHO
         XhkjLrE0H33kvix+jadnR/BvJYNixv2aLezQO8A5xvRWjMIVy/89N1Xpb93JrYSHm7bs
         Va8Q54qZydb2ZJAcskqAjq9lH88N87SV5UN5FzVogxkxCoD9n0W8pfXz6mtsPaPV4xNY
         QLZSJg6OMnJPXN/WpCwrXGEsUhiCVyFu5WEnDCREhl3dEAfMzxkaL1GA/pSH2WgMnVUo
         yturmW5gt8BJUjoI5lSrzilvc6DNcupxKiCv6T7JN2r2Xm3N266/a8e5fijYu96KKDnH
         bFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3AIpEMFSc1w1UU+CwQpv+mXG0dXIbG8YyU6JKJWt2Ig=;
        fh=BC4n2DwKLQuDyK03+GBYr4Q6SUOkCL+2YUM0wuQYVv0=;
        b=HfpiccXnrFGilbnDspDdYZ+TZva1VAsd1bavmkBvvajs/z434y/hClFxyMpPz25e+C
         v59Jhrl3TQGWpTtTskOvBqu1WUbYsaNnGRgM+bzbqGtDH4fm4MXrBSuZuZfV9nCYXIVz
         p7s+wWM0jfhvmQBDwm3Dg1apwVotw1o5gGjIkuP7VQkD0VtuNHRNijETse+E3Os+y8xl
         qvSpVDChIH+8ukFlNKGCmuz6b3JICjxC+Oi6KMErN16s/pHaqsPYFrV6il87n+ifhVyX
         g8ptz+/NrBsknudFjoSlbDwYdNWeUmdxd9sgOGPG2fxZ4j+5YVHXA2Ryqt3V8CPK7hkR
         UXFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773816700; x=1774421500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AIpEMFSc1w1UU+CwQpv+mXG0dXIbG8YyU6JKJWt2Ig=;
        b=F7eLELpU/d4AqaRqJfKuZBj4pOWvT4+HTDdJAO0Kde3ZgXxKpEg4hXsZUAbUuZkhMO
         XmPe1gB6UIflK9AkbVG7xlOdieFRWX3Bjx4J+cNqZE5X3t4ZrAIH0wrZGjNneA8hVO7f
         SXnItViAZ8AZ+C0OKOBIzdg7X0WS14nVw/FVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773816700; x=1774421500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AIpEMFSc1w1UU+CwQpv+mXG0dXIbG8YyU6JKJWt2Ig=;
        b=qCDBShu8YrC4MP6wc0SzNpgQ+BgpRXMWW9KvBRXbT4YEqu3pGV56iR5jsYA2ogypIu
         65UgRaImLm8opiafb6++LaY0U7KWMmZt3D6NFQXgaMp14A3vcDIVICB8i4vYmAvwVBx8
         A4G42sWksLtuaJgT3Zmf49OrQl+IvPdJijlxiWxO+ZyHDF1Y7T4E7ogr7kk5CGylRRmC
         PpzJUfpeELSEfQD4RCJEnnG19tN5xHFmz4ZYZ6UGPU3tozz/XXMACEFgFCucViUNHuLe
         BWV6x47K5yQDzx0nPGApaTneWtHX6WwmrvoW0oQUQq3jepSeXw9Iv3rwDRa+C7Gjp4nk
         rEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKbC0UR6MvrJQdZM17rBoYypLxmZwb15ti19fPDNsAl7RqFkdSm6DJvYtdjYoYLoThXIDdKtWj8F9FULaP6UJY@lists.infradead.org
X-Gm-Message-State: AOJu0YyiA6/wn1/ohvUkI8pkiqEw0KxAfl9U88JU6yQoQTqYhDP74hJf
	U4hqbjA3YVf6/f4XrzICrhPec9LkJm6g13HJ//pFKZH6YPfSoLX7h1fZtE9JzwGxUOtzx1oxeJF
	LklYta+Ie81Xnh2mzzx+CIkIb5KwIhqRxYgKj+88/
X-Gm-Gg: ATEYQzxeEfJDYtqDfB1mBVx9pvOs8hIkv5Y5KmcN/ZjPmMrEQMwk/gpRlRci1eQWhGx
	JC5e4gEzZR6lQTyimKX80SRppl/zhx537EBou0iQM6C+u9a/laA7mzL07ekquJ2JaXfbC9OYhdZ
	jkT6kRdIetO8m1WFyidO87IYStKtxlmhBCq84YK4EyyJpcb7073GPkUwWMAxLBNTiTTv034O/NR
	XhlmiKK1DxlhKD9T9/oCpCc8oXqrrvO0yymwoDX8wqeUKMYMVk2bqF5KvHuB3xouHZP0SCD+G1I
	WJM03xxnd/8Dg+l6hyDzCYetrhhueN+pMm0l7A==
X-Received: by 2002:a05:6512:39cc:b0:5a2:7b43:62da with SMTP id
 2adb3069b0e04-5a27b4363damr337188e87.30.1773816699777; Tue, 17 Mar 2026
 23:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260317064049.696795-1-wenst@chromium.org> <20260317064049.696795-3-wenst@chromium.org>
 <607daaca-79ed-45b2-941e-1680a17618e8@suse.de> <CAGb2v66D3=s9c8oJyYEAK90A4SekW6FjLUpWBGRHnJwtfMvUeg@mail.gmail.com>
 <ada8ca6f-a2f2-4f8c-b916-f6dc24db6db5@suse.de> <CAGXv+5GUmCEDM9XcOgHL5EKNhZMNc5RTdeheqLAT0CFp=qJavQ@mail.gmail.com>
In-Reply-To: <CAGXv+5GUmCEDM9XcOgHL5EKNhZMNc5RTdeheqLAT0CFp=qJavQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 18 Mar 2026 14:51:28 +0800
X-Gm-Features: AaiRm53nz_HSaQkfIL5l8CVEXOdYGY4r-GTPWU2czp-tZ8-rpvpmtLxKehanc8I
Message-ID: <CAGXv+5GF8zPjgzSy68x7wxFLc=zEMac1VVE8OUcBH1+=GgqMGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: wens@kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_235142_632499_53593AF1 
X-CRM114-Status: GOOD (  38.72  )
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

On Wed, Mar 18, 2026 at 12:57=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Mar 17, 2026 at 8:24=E2=80=AFPM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > Hi
> >
> > Am 17.03.26 um 11:58 schrieb Chen-Yu Tsai:
> > > On Tue, Mar 17, 2026 at 4:12=E2=80=AFPM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
> > >> Hi
> > >>
> > >> Am 17.03.26 um 07:40 schrieb Chen-Yu Tsai:
> > >>> From: Rob Herring <robh@kernel.org>
> > >>>
> > >>> Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> > >>> drm_mode_create_dumb. This flag is for internal kernel use to indic=
ate
> > >>> if dumb buffer allocation needs a kernel mapping. This is needed on=
ly for
> > >>> CMA where creating a kernel mapping or not has to be decided at all=
ocation
> > >>> time because creating a mapping on demand (with vmap()) is not guar=
anteed
> > >>> to work. Several drivers are using CMA, but not the CMA helpers bec=
ause
> > >>> they distinguish between kernel and userspace allocations to create=
 a
> > >>> kernel mapping or not.
> > >> Any dumb allocation might require vmap. This is not limited to inter=
nal
> > >> buffers.  Because if the dumb buffer is shared with another driver, =
that
> > >> driver might require the vmap for displaying the buffer content. The=
re
> > >> are enough of such drivers.
> > > By sharing, do you mean exported via PRIME then imported by another d=
evice?
> > > Or just passing around GEM objects within the kernel?
> >
> > I mean PRIME/dma-buf sharing.
> >
> > >
> > > And could you provide an example?
> >
> > Create a dumb GEM buffer on one of those CMA devices and mirror it to a
> > display or udl device.  These devices have no means of scanning out the
> > provided buffer directly, so their drivers vmap the buffer and copy the
> > pixel data into their internal memory (via a peripheral bus). The vmap
> > call happens via the kernel's internal dma-buf interfaces. Hence any
> > driver needs support for vmap if it wants to support this use case.
>
> I see.
>
> In that case would it make sense to limit not setting this new flag to
> drivers that already specify DMA_ATTR_NO_KERNEL_MAPPING? Or rather
> inverting it so the default without the flag is to have the kernel
> mapping. It would be opt-in rather than opt-out.

I guess this won't work since drm_client_buffer_create_dumb() calls
drm_mode_create_dumb(), and we need a way from the upper layer to
say we need the mapping.

> This includes just exynos, rockchip, and previously mediatek. Having
> this would allow moving them closer to fully utilizing the GEM DMA
> helpers without changing their existing behavior.
>
> The flag was removed from the mediatek driver during a previous
> refactoring to move it to the GEM DMA helpers, but I think it was
> a limitation of the helpers, not an intended change. Angelo might
> be able to provide some context around that.
>
> Or maybe I just keep the dma_*_attr() conversion patch to satisfy
> the needs of the aforementioned drivers? What do you think?
>
>
> Thanks
> ChenYu

