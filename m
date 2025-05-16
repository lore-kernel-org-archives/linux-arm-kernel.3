Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5260FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghCVBFohCqPYMNm54QVPyhJ+LtBlN+TIFH3Qtc52S1A=; b=CsplWsMVlOZ6cAIkY3VoKY3Y6h
	sCvvNYlRHrFrrcAICMsMtXwrJbqTly3dU4REs4Zq+Tw5iacnan/mck88GKDwnx56WjF6Amip4MhES
	f1BLNM5C1QcwHL22sHfAtLyhP9YnZwW56+I+BxPdLI4hUaDr7Gq7Ni7eQISh0N2NtHGG2qDCreNx7
	x8UEJir4vM8TDAxwrptpPBTQxGnu6LoaZvUZHJqlE24P15a6owyRCQOtAu9h9eg+Ffw44vpFVsmDB
	+ySdfooj9WpIw4kGk+FE4re9+yMgshVlLK1okoEL6TWRgJzI1WgbJ2Z0xgSzgYSGkKlVn04ByvcGz
	TjtoVSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrCR-00000002yGv-0EpZ;
	Fri, 16 May 2025 09:17:51 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrAO-00000002xni-1DbY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 09:15:46 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7053f85f059so16766297b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747386942; x=1747991742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghCVBFohCqPYMNm54QVPyhJ+LtBlN+TIFH3Qtc52S1A=;
        b=AzKAZ8mxYkQy6Nt9jZ4MOcDlrjTaz8X2bxn/rXIlsMuIMIhq1+d/v98zjChXzzJCQB
         wCI6BOdXMk8XmZQbIx1P4a2DeM/cLlD/8kFfbw2AvPTTQ6TFrS9Y+x3DrTMTuBDwhI2r
         22NQcXMtLyqaDTL9ZPWAmc2/4TQy1xDlqY06WvCBD0WeFU+KAclEvaPyojjZX79vmKKw
         a7NMLA5lQTttQ90J53A4oWzaOsnEUpzbBeuAdOpmsxPNzwnkLJZQuLsYQfD5WiT4oS9z
         KxBUk4fBzDsWnOpW5GpcQtNG8EXIx+W4//Rk/LS40y8VEh5rGd5/yXlbsGfcy9RPeVZZ
         YBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386942; x=1747991742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghCVBFohCqPYMNm54QVPyhJ+LtBlN+TIFH3Qtc52S1A=;
        b=Qh6MkEvj3BlbH54AXutIATCrtutiwxF4SDWB88shhJ+7VpkxgGAXi9PbZg0yawkFdC
         XPU0tLUFDMnKodXZdmN9lMfVm1L1oJa8DPBn8Kiq/Ry7Li4ARy68KWQaWhMyA7u7OgGw
         aLHEvfyjInqjeHuzey2yloxtseE5/d6kKxe4BfFMzrqQG8lfXiAYJV6U15oXH5p1/lOp
         YE0kXxT4e8Va6ys1WRjPwHrkKwl0rsNLDGlD1ek8L1b0xZ6S0zuUnI4I+M6oIaIpZ60i
         0VLNoVW8GmpPdF3vkVyjm8UEZ0v3wBja2thFcCd5gVZDMWsReVIqB0XDsOQJ1iWKxUKK
         U+iw==
X-Forwarded-Encrypted: i=1; AJvYcCVb4BBrvKRX6/9iYe0/WnrE6ka056Pu8kwNwwQ9RvxSnePWDKgkPQXvyPFkhbwYUErxAZLU9VOetqmXlE/wlNq6@lists.infradead.org
X-Gm-Message-State: AOJu0YxMRiZF7+bG10++vWedD/rq/Gwbx/3E3ncQDNj0rmLUxohWQ+bR
	SDNUeoVWSRpzjRuUz4vvfHHrPrJdP+wfZI/jr6L9StIyX1ffuiDvXYPXagvWl0Y456E=
X-Gm-Gg: ASbGncsBTYXPVLE0AtwoMVoFalYRHPHo/cOxsst6b/j9cKVe8k9VzYv6bcJHf2VORg7
	3zKzFy3cX/rLyCUHuX5lDNAUVCMUPumSRH801Vs4wxWpwGGhyy/h+OXZWs894mgM2hHXu52wrFf
	XcTCPVwnMm3+Au5tPBhdZrkUL1kqfMLGOoUgbMaiYfLH5/TDS4dCTCSu4vjXPSntuuVSbo7XIli
	qzU7ooCyzYusj1msteg7flrQcZumm8gAeLljhCKCx4s1FJ2KdzzHPj3hexICfEPw5pwmqpH9eb6
	Cuk2xR/DWbItN+Za/j/rgMnGAe4D6p5mv+KAG6Q7K+lNhCwpUYmiQF+I0uscDRWdog6jzbyjvt+
	Gu52etoOF+btEIC0BbIU=
X-Google-Smtp-Source: AGHT+IF7CzYx0t5J3lcfjFBABQerJwAxpeQqoydbU+7kqTmzWIDhmyZh3YvckIN32gEtJEu0wtx4+A==
X-Received: by 2002:a05:690c:316:b0:709:6f9d:b566 with SMTP id 00721157ae682-70ca7bc6b82mr43438987b3.36.1747386942483;
        Fri, 16 May 2025 02:15:42 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca831c2basm3142137b3.30.2025.05.16.02.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:15:41 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7b51381445so1713629276.0;
        Fri, 16 May 2025 02:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXxvEwevsMZAV+txNNFbB9QZsFOX8iQA6ahyLxWY81cT1XxoMIOREZMjRISMsENsB+/yCNgEhIbHui4yzaOY5z@lists.infradead.org, AJvYcCXn+ItYccScmPT5q6YErwdsMW6cra5H9lJ1RUUz2zGvV8jzqYIz+eff/sfDOGLX3aFs+X5CRBISq5CMpE+9xe4=@lists.infradead.org
X-Received: by 2002:a05:6902:4888:b0:e7a:b59a:e99 with SMTP id
 3f1490d57ef6-e7b6a08f866mr3989501276.22.1747386940957; Fri, 16 May 2025
 02:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net> <2950819.ElGaqSPkdT@workhorse>
In-Reply-To: <2950819.ElGaqSPkdT@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 11:15:29 +0200
X-Gmail-Original-Message-ID: <CAAObsKBrXZscvhjYnSb2DBL1KGsaMHpPVfB_QrFUPihd2+srdw@mail.gmail.com>
X-Gm-Features: AX0GCFs7JNRTyA51Mp_5c2sfGP8DF36VD9y5YcZK4C0Caod07VePTbyWDenldvk
Message-ID: <CAAObsKBrXZscvhjYnSb2DBL1KGsaMHpPVfB_QrFUPihd2+srdw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] accel/rocket: Add a new driver for Rockchip's NPU
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_021544_594770_225FC21A 
X-CRM114-Status: GOOD (  37.20  )
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

On Fri, Apr 25, 2025 at 8:22=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 25 February 2025 08:55:50 Central European Summer Time Tomeu =
Vizoso wrote:
> > This initial version supports the NPU as shipped in the RK3588 SoC and
> > described in the first part of its TRM, in Chapter 36.
> >
> > This NPU contains 3 independent cores that the driver can submit jobs
> > to.
> >
> > This commit adds just hardware initialization and power management.
> >
> > v2:
> > - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> > - Add some documentation (Jeffrey Hugo)
> > - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> > - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> > - Repack structs (Jeffrey Hugo)
> > - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> > - Use devm_drm_dev_alloc (Jeffrey Hugo)
> > - Use probe log helper (Jeffrey Hugo)
> > - Introduce UABI header in a later patch (Jeffrey Hugo)
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  Documentation/accel/index.rst           |    1 +
> >  Documentation/accel/rocket/index.rst    |   19 +
> >  MAINTAINERS                             |    8 +
> >  drivers/accel/Kconfig                   |    1 +
> >  drivers/accel/Makefile                  |    1 +
> >  drivers/accel/rocket/Kconfig            |   25 +
> >  drivers/accel/rocket/Makefile           |    8 +
> >  drivers/accel/rocket/rocket_core.c      |   71 +
> >  drivers/accel/rocket/rocket_core.h      |   29 +
> >  drivers/accel/rocket/rocket_device.c    |   29 +
> >  drivers/accel/rocket/rocket_device.h    |   29 +
> >  drivers/accel/rocket/rocket_drv.c       |  273 ++
> >  drivers/accel/rocket/rocket_drv.h       |   13 +
> >  drivers/accel/rocket/rocket_registers.h | 4425 +++++++++++++++++++++++=
++++++++
> >  14 files changed, 4932 insertions(+)
> >
> > [...]
> > diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/r=
ocket_drv.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c22d965f20f1239a36b1d82=
3d5fe5f372713555d
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_drv.c
> > @@ -0,0 +1,273 @@
> > [...]
> > +static int rocket_probe(struct platform_device *pdev)
> > +{
> > +     struct component_match *match =3D NULL;
> > +     struct device_node *core_node;
> > +
> > +     if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk358=
8-rknn-core"))
> > +             return component_add(&pdev->dev, &rocket_core_ops);
> > +
> > +     for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-c=
ore") {
> > +             if (!of_device_is_available(core_node))
> > +                     continue;
> > +
> > +             drm_of_component_match_add(&pdev->dev, &match,
> > +                                        component_compare_of, core_nod=
e);
> > +     }
> > +
> > +     return component_master_add_with_match(&pdev->dev, &rocket_drm_op=
s, match);
> > +}
>
> Hi Tomeu,
>
> something I've noticed while playing with this: currently, it doesn't see=
m like
> it's possible to support 1-core NPUs. rknn-core-top is a real core, but i=
f no
> rknn-core is enabled beside it, it'll call component_master_add_with_matc=
h with
> match being NULL. This causes a kernel Oops.
>
> I'm not sure what the proper fix is, since the component API doesn't seem=
 to
> really have a consideration for a master with no other components.

Yeah, I think we could add a code path for single-core NPUs that
doesn't make use of the component API at all.

> I ran into this when I was trying to debug why I get job timeouts followe=
d by
> a full SoC lock-up on RK3576 by running with only one of the two cores en=
abled.
>
> As an aside note, my throwaway rocket-on-RK3576-hacking-branch is at [1] =
and
> contains some changes you may want to consider for v3, e.g. [2] and [3]+[=
4]. In
> [4], specifically the `domain-supply` part which means the NPU regulators=
 don't
> have to be always-on. Though feel free to pull in my entire ROCK 5B enabl=
ement
> patch.

Ok, [2] I already had in my WIP branch. Will pick up [3] and [4],
though I cannot test them myself.

Regards,

Tomeu

> Kind regards,
> Nicolas Frattaroli, who discovered that his cat is apparently 5% space he=
ater
> according to mobilenet while playing with this patch series.
>
> [1]: https://gitlab.collabora.com/fratti/linux/-/commits/tomeu-npu?ref_ty=
pe=3Dheads
> [2]: https://gitlab.collabora.com/fratti/linux/-/commit/73aba31a00b34c254=
be575b524da568e115d985d
> [3]: https://gitlab.collabora.com/fratti/linux/-/commit/bd3a7bf5054c54c29=
15a9dc0396730d0f24b3b7c
> [4]: https://gitlab.collabora.com/fratti/linux/-/commit/5da44d61b09c34530=
9f76159574d447d071c295d
>
>
>

