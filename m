Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D2FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 05:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqEyiR61C1W0/+KTWzUiTKCsg/9mevRSEFCD7wnXFig=; b=g/5j/JCOnekuu8gY2ZOWmpQJB2
	SQ/Z+ViwSHo8HeuxTy1z98oCbWISdeaQ0cJBix+8LswIs4s7VcM5Jsv/ivGmxrKKfZTSz2v9/rcnZ
	HjDmPAxXXyfx5/nD2lFziihDfNszaGcrTMUeQ+ulJOXSaf977nDBPRZUZocJifW8HOWf+nizoH/Uw
	BPb5dv3rweuLB4yI9fGm22YfQ4F1YWnDN/jg/QtbmOAu+jGTklITg51C1VLMCb/8M2LsnrULGzntR
	12pwCTXT/0DtuLe9rq+EWN6sq525HU8q2Fnw6aZ7PYMLVLS8tPn79owdBBh5Ca3Ud9esHeR/lhsyn
	C0KW1yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTvrp-00000004ef1-0hPI;
	Tue, 24 Jun 2025 05:06:45 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTvpK-00000004eWh-17Ds
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 05:04:12 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7111d02c777so41895327b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1750741448; x=1751346248; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqEyiR61C1W0/+KTWzUiTKCsg/9mevRSEFCD7wnXFig=;
        b=b//4Pz7NGu/eaUjbAvfAKPZpzIEHtLy2mL5XPvxFNYWMatviHt04hEczV1lyezLC3p
         5EMj4X5+stYJuEKnvtATSgF7g9aRr+Vp96k8FfGmBheNaCxU2LSpAT8CfBSnDJmz85Sc
         BLWNk0W0oSeV9wyN5tF8Apqvt86bk/UOReDeTGct/knx21+108SdlTMT6XlNojahGca7
         0/QJfAKeidCO98lbWua2+tRCZscjiRPMFUijAzoDepDvrZek5oIWfYUpE1VmSIbRk31J
         VIi8hNPUU+ypa81ddT0axKxMofGTfI2HyaoHzVmNy981IyyOyh9ey43rH0Lep21bvwBi
         Fgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750741448; x=1751346248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqEyiR61C1W0/+KTWzUiTKCsg/9mevRSEFCD7wnXFig=;
        b=dJqUU7gUrOJ3/SqakF7H7kZcfcy5XXUizKc+ona6HdU18b9rcds3ScFVQBfdXdNzOB
         WQT7MTUNn/y8N4VILYEHLb902ygksJ/8MXpT+PxudrRPV3TJLbRV+rAiWi0RlbIP7cmL
         KUuX6/1pmxBFN+WE6Cyf5mcyW6M34QngtZlKyEjngBxyo6CjY2vn+ydxLkb5CxK8MUT9
         jY4arwPD5BHZBJkGjN6bETuQ+ayR4LWt0OG6bNaLCcGffC3/xghXkW4G65gnriRblJj0
         NQeHVoBWXljSQQkXen2it6atyqTPeAKZeMAe5wSLexonnoWXxy9LNbeIr/yGNFdYJ5kn
         MrXg==
X-Forwarded-Encrypted: i=1; AJvYcCVKe8Zhfq/8VxYkMuzIAKJkUlCiJc4nEOLp4u2EaShLPbcFRFuA9+p2Dkd70Sv2azsZ62lyqe82Suhbm25icIjk@lists.infradead.org
X-Gm-Message-State: AOJu0YwHYpZWMmX5mmECOt1x1jeo221P79+9rUn7jx3OXmaOyJgicOmj
	ZgNZ0il1dqYJrLJDyX/6n+ldqPmytdts+QM9NHs+tPrJKX4xOXacEqRVxz/IhLXDlm5ysTwKTbH
	rc0fepUgjMg==
X-Gm-Gg: ASbGnctSi87PiFgHPkGwQVuOkhndK6/q1cKrlS55qv/4yTMBy1iHq2u7nL+4eZvZWwy
	O47iRDuLxXYWpNF2WXKD0sQ0ykDNlVj1pP98YuOUUPwKEQ9jSgu6MpnLy8UHgcAsfuLD0WY0Y8W
	bf1dpBaBUspPcR/fgGqb6gBPyeDlnYkoRmOB6FepiYcPiVujKDowtvLjgDZboCk9XHEZZwU/Bq5
	EAkAkJAX3ejt8ska+9FiIf6E4+HCLViJj9DcrFoC3Fw/3uQi5Z9Xh6FFDv1C05JRW+7GMvSbpZB
	A4paEKfmRgAeYMckxv2XbyvwqRTlGI3LadixoYIfEee6B/g8liJYoOZnih55/MKUTp4CNQCpLnD
	+Gb0bbrxPbRR9tRiN8NKgYCoNkPndGiuaXYGFDQ4+
X-Google-Smtp-Source: AGHT+IGm/P6K25DpiQF7YkgLr49/raT+4WnLgZKMNcfiNtPUu4DSQdRLH4DmfxjqjeuLlDpGyce8jQ==
X-Received: by 2002:a05:690c:931c:10b0:70d:fd2a:1457 with SMTP id 00721157ae682-712c638321emr159821667b3.1.1750741448580;
        Mon, 23 Jun 2025 22:04:08 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c49b9ab5sm18631367b3.1.2025.06.23.22.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 22:04:07 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e81a7d90835so4737553276.1;
        Mon, 23 Jun 2025 22:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIsgq1XaR7IFRh3nHdSUzqJFFmTFNWLxAyuxA5MC8oi1/U3+0SOVKg4DWJYbKKRPHJ9t1Y45M85bI9MxKX37UI@lists.infradead.org, AJvYcCXSR7w/v0xl+CHMlGvlIHWUFain+GYl+gUHZaIFNiy61/QD42MoLtDtWXOIWKlzBaaIByjXapb2yst4clJAr18=@lists.infradead.org
X-Received: by 2002:a05:6902:2402:b0:e7d:a012:290a with SMTP id
 3f1490d57ef6-e842bd31ba5mr17718497276.44.1750741446999; Mon, 23 Jun 2025
 22:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <2241399.8hzESeGDPO@phil>
In-Reply-To: <2241399.8hzESeGDPO@phil>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 24 Jun 2025 07:03:55 +0200
X-Gmail-Original-Message-ID: <CAAObsKB2tLewhCt6LWtuCW1niCPAHvqjWYAQ8t6fv9YLVsQmJQ@mail.gmail.com>
X-Gm-Features: AX0GCFuWUi05UoZnTls2Tcn0dm5ovOsTmo6J_0Og6xGh9EfBiQOG6iE0FtJ2MtI
Message-ID: <CAAObsKB2tLewhCt6LWtuCW1niCPAHvqjWYAQ8t6fv9YLVsQmJQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_220410_623201_996BFE1A 
X-CRM114-Status: GOOD (  19.71  )
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

On Fri, Jun 20, 2025 at 11:28=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> w=
rote:
>
> Am Freitag, 6. Juni 2025, 08:28:20 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Tomeu Vizoso:
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>
> > ---
> > Nicolas Frattaroli (2):
> >       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
> >       arm64: dts: rockchip: enable NPU on ROCK 5B
> >
> > Tomeu Vizoso (8):
> >       accel/rocket: Add registers header
> >       accel/rocket: Add a new driver for Rockchip's NPU
> >       accel/rocket: Add IOCTL for BO creation
> >       accel/rocket: Add job submission IOCTL
> >       accel/rocket: Add IOCTLs for synchronizing memory accesses
> >       dt-bindings: npu: rockchip,rknn: Add bindings
> >       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-bas=
e
> >       arm64: dts: rockchip: Enable the NPU on quartzpro64
>
> from a handling point of view, I would expect patch 1 - 6
> (driver code + dt-binding patch) to go through some driver tree
> but have not clue which one that is.

I think Jeff Hugo would be pulling it into drm-misc? We still need a
R-b for the job submission patch, and also have the userspace driver
ready for merging.

> And afterwards, I would pick up the arm64 devicetree additions
> patches 7 - 10 .

Sounds great.

Thanks!

Tomeu

