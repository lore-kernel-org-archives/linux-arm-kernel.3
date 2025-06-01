Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAFDC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=; b=un/tuctLqv84ETeLU/UzRXsV0H
	6/5tm0Wlmmf+hgpNVM2jCFUOLxZqA5t2YX9wNTRfHhlsG1I79f2EuwQTC+HUgsZ1uyUyegZvqAzNE
	OxB9vCO+SVtAe2f8D5pewDm5R5kUd/29wiMObe0UvVtb8N2UG7Jy/QjiU7wzgR5BkJuZqsTszHaj8
	0e1UKfx7HCQLWdgG4dx/g5ucULbjIyklw774Wn4wUf0vBhwrvpdaBOTXsR3DyK62Fo1yyZbv9s6WG
	RyemEaf0mtg/zdXchKh2fWx0ZqDJEnrdwCcdmC6ASy0PkNGcMoR/1Q/6U/INJcIfQ450UVppgW15p
	jv+RoYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLcPt-000000050GM-2Rs5;
	Sun, 01 Jun 2025 06:43:33 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLcNk-00000005082-44h1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 06:41:23 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-70f147b5a52so23601497b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748760079; x=1749364879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
        b=DFDjNzmRLYLLUyluc/SJmcdgRdY/wPk5rPnMdWN4x6wNr46mfTCnxECypq0tTcEdSR
         Mo5VOw6o+QL5E++amvMCwum4rGyDo3rzKnKh4RGZ2nT483R/ShKQDKq2HWxgyeK9pndt
         DIKgxPW2gCwvbmWdV33fgn0YBJWs9muOda134rDw2fy9kLTvPoxXLSntsiytvlKMjLNF
         5khmGKLKKoHs7j2TnBLIvZKDxXQY+pqyF0kUlUaEzqqjgcxoBf1B0lX/MoDsWtRFZSbv
         I/hfftKLXFPIZUdTtIELy6duiOoJCJmrPzXfUQDX1qyqfM/Pkg2p74aH+cnx+zN5b4TD
         kekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748760079; x=1749364879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
        b=X/MywN8OC1ibb+POUtP/a/5zfukQzdqiFRLmqEpJwtmbS9t6ZLg6/B9/YJfYWdBg8v
         qWhE8gTBaqmMHE5wHxjuc+meHjDstMSUwGsh7ikeFls+MQD2/BiJraM+1AVm6ELE3RET
         a1/LYwI6VegOqENB3U/MJgrcGSXONfv8zRnOUk4ZtUaSRtBp2eTtzDNWHhQacLDJwDxu
         FlLavIybJXffg6fogOLO3x4ELiTlD3IeoAuPPdnsW/FJLEloOUOXXHZhYH0LJP1OjdNi
         ojJN+BP747WIRUQHosoCMwHmSWRU2vHxXJbFmK1xd9iQzwkX1reiIQJ98gIZqT1MRBG/
         U/lw==
X-Forwarded-Encrypted: i=1; AJvYcCVhaxJEwJvfaijDBH3atUkhQ2J6/I6NtT3SH00MC3qj+gyIlyK5TbTAxOq9ckvi/7p5y19G7y5wmwtU/WdYqYrC@lists.infradead.org
X-Gm-Message-State: AOJu0YxlFdGWBZaMV6Fu5meovQqXLbqKV7AWltFmM4Lr7xgLy9dxEZqa
	b3iADNevy6KK7zcvD7W8PXQKN2Qoue8YwCIN3plOiWI6UmoGLE7LptrK6JqelHhvqyV797kuMEr
	b3KhQ0kIOKA==
X-Gm-Gg: ASbGncuRWYCSjL3ikYG6NBEDe7bi2mNUfjFKggvZFLgNV59RGFGG09YSUkCJ2xiZWHz
	5UIvDjazggUp5E4SPXgJs2l567+Td/RStW+9leO9omaj8+P4oL6JNCgr3muXH0Oi7ulc+XBAbMh
	dOHJeO98pJWvLlDJSLs8U1at7UJ3kf4do2s1oXyk5aSPNQ5uQCC7Jzfy2tJsTh7OR5wiNzg8NLw
	mZqDo5FmrC2E74uLDMLM+ECsJ9uc8t0BqnAlyWNpqs7MZMiKRokjK5CPuBaxC/yts6DH/KBtVZZ
	+hwJfW4xixKD5zExeEOxP+UeQFYlX1dcyerIL+fxLlA+l/l6J0Pk200pcW51Q4TVppYWIaZcneM
	VcTH5UrcqTvbl8KkN+w1ga0SJACh08Q==
X-Google-Smtp-Source: AGHT+IEpdTgVcfBaoEmCWcnRBwuce+Djw2pY8euGOoyl76C2+gYfNnzbCURCJhmeDtSCjcLozrM5tw==
X-Received: by 2002:a05:690c:4989:b0:70f:6ec6:62b4 with SMTP id 00721157ae682-71057d02d51mr122876257b3.31.1748760078968;
        Sat, 31 May 2025 23:41:18 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8acd546fsm15543587b3.78.2025.05.31.23.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 23:41:18 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e803de44766so1579391276.3;
        Sat, 31 May 2025 23:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMUhqfRhAV9Zs3Ti0FFxZP+aaTqWn3KAZ/F7hpJtUYs6mwGAycDS3t8kkQiGHOiKzWI2H210SNQj9oh5PPhY/q@lists.infradead.org, AJvYcCUnTZOxRjK/9G88PNn6RdoVmMc78+qE4VVaOT4Ki0ZAZbbtUQYzb+akTq9s6dgpTufmGuK7QGp7bmfCm6TzdaY=@lists.infradead.org
X-Received: by 2002:a05:6902:1245:b0:e7d:c51d:4b17 with SMTP id
 3f1490d57ef6-e7fec876436mr9326569276.8.1748760077303; Sat, 31 May 2025
 23:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net> <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
In-Reply-To: <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 1 Jun 2025 08:41:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
X-Gm-Features: AX0GCFuCkivNAaBx7rL3ymXj2J3pJIXqNYSSzMxHaNqO3jwK8nThi-KXGe-k1Hs
Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Jagan Teki <jagan@edgeble.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_234121_245328_C3572C23 
X-CRM114-Status: GOOD (  28.69  )
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

On Fri, May 30, 2025 at 8:50=E2=80=AFPM Jagan Teki <jagan@edgeble.ai> wrote=
:
>
> On Mon, 19 May 2025 at 19:14, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> >
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
> > ---
> > Changes in v4:
> > - Several fixes to DT bindings.
> > - Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051a=
c9225db@tomeuvizoso.net
> >
> > Changes in v3:
> > - Reference in the device tree only the register blocks that are
> >   actually used.
> > - Several style and robustness fixes suggested in the mailing list.
> > - Added patches from Nicolas Frattaroli that add support to the NPU for
> >   the Rock 5B board.
> > - Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbc=
fafc141@tomeuvizoso.net
> >
> > Changes in v2:
> > - Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian =
Reichel)
> > - Drop patch adding support for multiple power domains to rockchip-iomm=
u (Sebastian Reichel)
> > - Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e4=
8eea250@tomeuvizoso.net
> >
> > ---
> > Nicolas Frattaroli (2):
> >       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
> >       arm64: dts: rockchip: enable NPU on ROCK 5B
> >
> > Tomeu Vizoso (8):
> >       dt-bindings: npu: rockchip,rknn: Add bindings
> >       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
> >       arm64: dts: rockchip: Enable the NPU on quartzpro64
> >       accel/rocket: Add registers header
> >       accel/rocket: Add a new driver for Rockchip's NPU
> >       accel/rocket: Add IOCTL for BO creation
> >       accel/rocket: Add job submission IOCTL
> >       accel/rocket: Add IOCTLs for synchronizing memory accesses
>
> Can this be possible to infer yolov8/10? Do we need to convert PT/ONNX
> to any other common format's unlike rknn?

Both considerations are entirely dependent on the userspace driver.
This kernel driver should be able to support a userspace driver that
accelerates any YOLO version. Should also be able to support without
changes a userspace driver that implements execution of ONNX, PyTorch
models, etc. With or without conversion to an intermediate model
format.

Regarding the particular userspace driver that has been submitted for
review to Mesa, you can put questions and comments at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Thanks,

Tomeu

