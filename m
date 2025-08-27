Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F25CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=; b=xI09HOzF9sRBOy2ix1RY0GubRw
	BcOQnyTU9B/1d+Q9+OzAkxQkV+26qT6KU5iYNLOWBA5GxdikYY/7pQGGcsjO3Wn353aw1y44oCAsJ
	zyxCyyEyKEQLyhy3D0w5XhxO+KegUiRsGab9aZoQZob8Z9z1lDkQ7BY8TIjqo9hVR2+nTw9jYXdnD
	pPYF1X8OiX4aNO3rjM5hGhVnshyScR8hm7xxvHCUK5GLokYA1nXUJUQdUgAXK/ETM64RYxNfArxR0
	bLjpob/O1OCUNVDE+H7AY/tmeoUVjg6XuNoFjY9I6ZdmbUD6R+635mH8sWINelbJLod2Uefe8OFOx
	j1+Z6fYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOc-0000000FyC7-3COV;
	Wed, 27 Aug 2025 15:49:10 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEOj-0000000FHLP-2hWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:33:03 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7e872c3a0d5so652268885a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756294380; x=1756899180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=;
        b=GkE7Dpsl4vr1hDlHn/niIKUvJaFnqcP/G6axC1q3Ww/enhpiZ+h12Zg8Wx3jBBRp3m
         LcvRo6dJyXyL5wro25msKbddDPBfwHt9/wRY3NN1PMWDVYO6Q920lrvFI2hvTxwDfFyQ
         +TBhY4qffTiDQsmjB64TLm0RVUwqkD8POG7dPe42B7YkG3plYqiEZqO6Bsg4Y9gmnRY2
         wXunvoTKXbY9Y0Te4cOPADuNi4Zj2kepQmp8oLOvxanDxV9Ll0kSaTahZiR57g5BmiBR
         VduRV7aw3K8erB8SVkzONyJLqSDKw2Rh2aM/OX2U9sa+vUWGibpjv04Gj+nDLqr226IB
         MCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294380; x=1756899180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=;
        b=ZNwRxe0HSZiAa+qS0Jwa4y0Yab88+APa5D2BfUGdbeomxgooqP4NpTUwrllOJZftfk
         XTXId8KB3HeaLbQ3I/q4k9gbp51QjFg9alv9TBZWGKweFCqU8nyVJcIDB+77pKZuFwQv
         c0yKxLXYTb9dMnmSqK98b1IQI23rL2bYEpE4Z6v6Jftze+X34MteIPRckf1JfVK3vfiO
         bv3Jc3fskQ5r4dB6WZB832Ppq+lMkKfu+Pl/TtLUZrxh2EKE1+hBW3ECyHgk4GXqNCEl
         5/TyfMK/oByF3QBeUvgJDr9PrhsbW9GNqZ1l+tBIZStUZ/A3TUeyjNSpXwe/GLj1+LrL
         F8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJsMfCd2WGrS1FZ3bpD/v6SC+6NRvTYgyTt6NsMK+Bn2cKXZtDnteu7TlPFinRP8X2tcX6I7LWOW90jIfWJ1xS@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ/g2vr7P4nRKyTJtHnrugBWdSo31K5sI6bR8sbYon80R7WhPR
	WDEzAO6Sa0a2cNwdPfV27QQ0h+tfnRBoqGb6aI7VNkhSEaLzrgnbrN7ltrGQDqXLUyv+YGggfUc
	pVByArOk7sm2oOOndLPYZK5OxrZXzUKEtZMyrC5KEDw==
X-Gm-Gg: ASbGnctgEZyDlUJyS788KDxcDWe+Cf1XjvTSB/X6/wmRgXoTyDlUNWDuUO+C+s+DTht
	SMwFaP8UD/m2R2oR1TwQ5juPhgyz/3LAKWifwgqWLuMZfauPebQdw8lBF1m9I+ZaURmtuwuXYII
	4ZauzvPD8retfHDgos8zS5htG5BEEpPCa46nt+Bleq4vGZIsH3NZ7kBZwQoXjVhn92RpxMi+OF0
	eztqYIdagkU5Q9w
X-Google-Smtp-Source: AGHT+IGmmuxWMn1RQng0MqU7LfWDmGXD9wRFwAweLJvIB7bsSHwPntqlQ+JKaDysNEyaOvC876Q504deR3IuVc5pgao=
X-Received: by 2002:a05:620a:2804:b0:7e8:1718:daf4 with SMTP id
 af79cd13be357-7ea10fc7a07mr2104471485a.16.1756294379779; Wed, 27 Aug 2025
 04:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com> <DCD62EFHFCEB.XEOPUPKZQ5XW@redhat.com>
In-Reply-To: <DCD62EFHFCEB.XEOPUPKZQ5XW@redhat.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 27 Aug 2025 12:32:48 +0100
X-Gm-Features: Ac12FXz3D5zUTg3Df1XjwtCpaINdk3SCVFUs0YESiGpt04Vrw7Xa6CeoI-p4LK4
Message-ID: <CAPj87rMDvaj28+h9fHkH+bZYH43N-dS_XHu9eomDphjXmPqArA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
	shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es, 
	mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com, 
	victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
	Liviu.Dudau@arm.com, sashamcintosh@google.com, 
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
	kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_043301_698217_D29534CF 
X-CRM114-Status: GOOD (  21.44  )
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

Hey,

On Wed, 27 Aug 2025 at 12:17, Sebastian Wick <sebastian.wick@redhat.com> wr=
ote:
> On Fri Aug 22, 2025 at 8:36 PM CEST, N=C3=ADcolas F. R. A. Prado wrote:
> > Introduce support for a post-blend color pipeline API analogous to the
> > pre-blend color pipeline API. While the pre-blend color pipeline was
> > configured through a COLOR_PIPELINE property attached to a drm_plane,
> > the post-blend color pipeline is configured through a COLOR_PIPELINE
> > property on the drm_crtc.
> >
> > Since colorops can now be attached to either a drm_plane or a drm_crtc,
> > rework the helpers to account for both cases.
> >
> > Also introduce a new cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, to
> > enable support for post-blend color pipelines, and prevent the now
> > legacy GAMMA_LUT, DEGAMMA_LUT, GAMMA_LUT_SIZE and CTM properties from
> > being exposed.
>
> Please note that you'll also have to deprecate the semi-standard
> Broadcast RGB property. It serves two purposes at once: it changes the
> values between the color range (similar to COLOR_RANGE but at the other
> end) and informats the sink of the range as well.
>
> So the post blending color pipeline will need something like an inverse
> COLOR_RANGE op.
>
> We will also need a new connector property where user space can select
> the color range, which does not change the pixel values, and only
> exposes options that can be achieved (default sink behavior, full range
> infoframe, limited range infoframe).

As a note to others, the follow-up is on the 'pixel_encoding' property
thread here:
https://lore.kernel.org/all/DCD5VIFRKFB9.1KHIZI3ASID2I@redhat.com/

I think we should keep discussion of those properties there. :)

Also strongly related is the proposal to add range/encoding properties
to writeback connectors; analagous to the inbound properties:
https://lore.kernel.org/all/20250813170542.331206-1-robert.mader@collabora.=
com/

I've talked myself around into thinking that the writeback-connector
property is better than trying to use colorops to do the transform. On
the hardware I've seen, whilst the CRTC output pipeline does have
colour-transform properties, the final yard of the encoding (YUV/RGB,
full/limited range, primaries, etc) is in fact a per-connector
property, so I think it makes more sense there, as that allows
usecases like RGB display output whilst streaming to YUV writeback so
you can push it directly into an encoder without an intermediate
RGB->YUV conversion step. But again, I think conversation about that
would be better on that thread rather than here.

Thanks!

Cheers,
Daniel

