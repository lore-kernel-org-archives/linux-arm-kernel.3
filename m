Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1258ACA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=; b=paHgOrM/2UkXTz0601h9G7t7X9
	VZ5uoXDAeRBB4LGKJFUt9fLlrIg5ObTMfcX2K6zqSPTpTuI8ozoBFfqTPFHLkFmBiF5KGub0oqGaT
	4UVRb23ntGY+RLhi4WPloA/juHFUiYD6LRlU6PBed2Azns7bOQtyZhxPI6rAQz3TYzT81akX2myva
	W5fT9sg3dRw4z9gYGwIeYp+t8yhd55U9lUiW4gTwkzmkmERePSw/JtwXRElxJoqjvmz40agT0l3aK
	RhF+Ta/tLKcWUqd4HM2mQKjhxcM2WRlCzky2XDrLJe8+JzvvrfNBeTFr8oYukY/M+QMyPNEGArHtu
	pqhkOTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgj-00000008Nf9-3OBO;
	Mon, 25 Aug 2025 15:00:49 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXLi-0000000865K-231b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:35:03 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7e9f7c46edbso448773285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756128901; x=1756733701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=;
        b=c5k3sQ4YnfTrz7VHq59iGgcMWQrQYQu0U/QKenDAxWRVdNNXNMFoq6BQBnse2Rv4yt
         Ym7B9EGme1NtIv5x7eGpqS8bfNa+aMp/FdML1/vp/i97aA9mRv7e40VXR8QOqoAYsIVh
         HuMFaJnXmWxwAf+z8GPRPYQzypev1Y0Ltq1NlDSv+tpLGfTtR3Czp7/FP2cHHGIWqtpz
         umS31LtLo6ZaAn/6Bo/I/oLTsIqCP5SBcnWa8Ql1r82BDOW8w9DmW2yn6tVUtIK2o2RE
         VkIdNHKDrU8lej/vnAmWs10p5VRvG00uTpx8OEerFC9EkE+20UbWUEUhKxDs4yxAG2Dr
         5O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756128901; x=1756733701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=;
        b=ZvCI9xNBscNI8dXQQNWoHZv6HELowTnzBxjwfDaMGIXq1/MsxusNSMb/WVWJp5cx+z
         1BUv4PH7FwYg8AJpWwutwS4QWcHC18i4nZYcdqSPLN2/d9sZBe8yr6hYrgVD9/8wTkcO
         r9Pbyitj/lWHkofvMqIWwlJ9iT9XJ/JuVB8DV9wNNgoDs4N82dVpK2W2f+HC5loYyRpe
         qa2008TtgafeJT2+C4RSWP2GQoPADbzmoXMuujcPh5OaH4NKqOjanSiOq65xfO7MDDHZ
         Eq/sDXhNK/g/G1J6tlQWFKiwYfABBJBttMWmQdpZYMb/r8BTp+2Yqt1LrYgGfmkNS6sl
         JBHw==
X-Forwarded-Encrypted: i=1; AJvYcCUIe6NxLKQ9/5qDTyysvRZJEnldKLip7whJC83WXinMKGyRlwIx0CRVCRo8cD1h+BuwpU9hwHxzNfEa1nuFGMJl@lists.infradead.org
X-Gm-Message-State: AOJu0YwzmxUSQJxbXvg9SpxrMVOqdnTekff2E3r+JhcPDnF5knyRCqVS
	0883mafQhanZYXLNT7i+5VH0yrJchPgxtp4bdmsp4jLdDf8J5o4qsR569gLVeX/S34AI5rC5c78
	kXabBXm3mAZZLfFGiwjYAc5PI2fhLH8yjuXO1wRNm1g==
X-Gm-Gg: ASbGncumCkvvFfe+qnDjSAEx0YJQrjLez6Prj6Q2EEuZlLvP4rkowMtYhODwHeHAqSt
	UiQODKmcY+sYhC50d2U/Y50LXaWkISI8C7NU/dzEvEV9Ws4cvuBqW6olAXjLM7pRc9qZTaLDAk7
	7pQOA8G8cWuSYwdLs46rCBlMAtdKLPFkxofGC9cupK5rfgUl7NotQgFvNBA5qqWdqmqAelM/l7a
	PfsjwiwyyQBlpUKUh1pK1VlMubFBR1HK8FSoa0LLq/Hplpl/Bba
X-Google-Smtp-Source: AGHT+IGOpK3uEJnQCrmnbOgq3jE9IN0xRtPnGuzZNnzUoPGGiNaxqS5J379tibwH0bqxmCutM7cmIZBZS3IWNjGPhFY=
X-Received: by 2002:a05:620a:7109:b0:7e6:81cc:6999 with SMTP id
 af79cd13be357-7ea0948df2fmr1733993185a.32.1756128900796; Mon, 25 Aug 2025
 06:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 25 Aug 2025 14:34:48 +0100
X-Gm-Features: Ac12FXydArko6F2KpO-xscTn2Bhfj39k97NaH0mQfBe9_vPNG3yvbIIh17F1fXw
Message-ID: <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
	sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
	joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com, 
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
X-CRM114-CacheID: sfid-20250825_063502_625814_893C8E0F 
X-CRM114-Status: GOOD (  17.12  )
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

Hi Nicolas,
Thanks for doing this! It's great to see.

On Fri, 22 Aug 2025 at 19:36, N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> -/**
> - * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> - *
> - * @dev: DRM device
> - * @colorop: The drm_colorop object to initialize
> - * @plane: The associated drm_plane
> - * @lut_size: LUT size supported by driver
> - * @lut1d_interpolation: 1D LUT interpolation type
> - * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> - * @return zero on success, -E value on failure
> - */
> -int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> -                                       struct drm_plane *plane, uint32_t=
 lut_size,
> -                                       enum drm_colorop_lut1d_interpolat=
ion_type lut1d_interpolation,
> -                                       uint32_t flags)
> +static int
> +drm_common_colorop_curve_1d_lut_init(struct drm_device *dev,
> +                                    struct drm_colorop *colorop,
> +                                    uint32_t lut_size,
> +                                    enum drm_colorop_lut1d_interpolation=
_type lut1d_interpolation,
> +                                    uint32_t flags)

I think these would be better in a prior commit which only moved the
plane init around.

> @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_o=
bject *obj, bool atomic,
>                                 continue;
>                 }
>
> +               if (post_blend_color_pipeline && obj->type =3D=3D DRM_MOD=
E_OBJECT_CRTC) {
> +                       struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +                       struct drm_mode_config mode_config =3D crtc->dev-=
>mode_config;
> +
> +                       if (prop =3D=3D mode_config.gamma_lut_property ||
> +                           prop =3D=3D mode_config.degamma_lut_property =
||
> +                           prop =3D=3D mode_config.gamma_lut_size_proper=
ty ||
> +                           prop =3D=3D mode_config.ctm_property)
> +                               continue;
> +               }
> +
> +               if (!post_blend_color_pipeline && obj->type =3D=3D DRM_MO=
DE_OBJECT_CRTC) {
> +                       struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +
> +                       if (prop =3D=3D crtc->color_pipeline_property)
> +                               continue;
> +               }

Hmmm. One issue with this is that it makes things like drm_info
harder: if drm_info opted into the client cap, it would no longer be
able to see any GAMMA_LUT/etc programmed by the prior userspace. So I
think allowing at least read-only access would be reasonable here.

Having a client cap without a driver cap also puts userspace in a
difficult position. If the driver doesn't support post-blend colorops,
then enabling the client cap strictly removes support without a
replacement. And without a driver cap, the client doesn't have a way
to know which is better.

Cheers,
Daniel

