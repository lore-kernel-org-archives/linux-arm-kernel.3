Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED82C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX8RVGcjNGfza1J+8Y/TBJXjjM61IDQf7sORQ0CRlUE=; b=SAB3Eb70v5M7fOvWIyUPkh+q0e
	ZelCtR6WuVoYGy/mJX7N5RFi3HOUPXWbpIpMqv1otYZRp8ZL26PrUBuMCSqktfraCS5csyb1k/bsD
	5pJjgzE0ADPqBFa6t6aP9Ek91CAtfUpMWjAwp9I7gnxijfJIV0Z8E0+lbHPt5yVDvXidHPDUHRaMd
	5tbF6wF5aLAeQoC7OwU8Wht4DLWPBqGdk1H1RMXRoqNgnMkl7l/vbO8r8dW9RXxLsAiVna/kEMWjK
	ue3SS2HTCLZHL42EnSJ74hT1tghAuweMwvyAQ2dex3dX27ZfoypjVem+yn8gI3nfNAFKQu5gVwnRY
	ASNMl93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4qB-00000001Y6U-0r4V;
	Fri, 30 May 2025 18:52:27 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4o1-00000001XoP-3iaL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 18:50:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234b440afa7so25209035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1748631012; x=1749235812; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CX8RVGcjNGfza1J+8Y/TBJXjjM61IDQf7sORQ0CRlUE=;
        b=CuT32xcLmys87DBZaBak/nPBtm1vAKtJl1n0qH7htpRiWvSQ6zcEYbOE6k0MK6DANZ
         75KQQ6N7cStDLiGSBdK7AZszYxaI/eYkSWnFuMC/O7s7Wbzon+aAJB7T/JaszhLg3jKs
         xeLwyKcl0jdU/W8DNtXij0c7roFbfGfxKrb59H7yYCxwSE670oW6KXo9Mi1FrUKKfHgb
         vzEfjIFirAwNky7J4h9gxfuNba7paWShmaxrXemR07qBzfjSZpsH568IC9fieT7SrSTc
         EiwOYHXbEBXz88WNow/JPVpJhxBb8NFIB/+bKD4Jb84zwlJOoeMadv9pKCYa1HhcKctF
         g/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748631012; x=1749235812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CX8RVGcjNGfza1J+8Y/TBJXjjM61IDQf7sORQ0CRlUE=;
        b=C28gtnjkEdo5UWYinICLCi9+Eyxc7glKNr7kc3GysgL+LB1TTTzVrApmKo7Gvra/ok
         VEfkJ48WcI3M/o6VHnOhuGVOwpTX8LbTEvTqFTB91HfrtszYPAYOovlNQsVkapo6ycNO
         nf9XkSrdnbgleoIz6oYV79CfPeh9d2iYN2aadI8mfOXZzcHDWSa+81Uy35sZTqBZvCKw
         tliTlqSiNGHGwsamsfi4wmt0NV8ZvTiZzWUv6AeWaYX5Mz7BiplKlUlzyI7wsrxXtr2C
         nRsRHHikrp5jJO42nDG8mvHWsxBc8N9aPwe6+nOgIcec888RDfet7NfWZ0/iblm/rVKK
         nSjw==
X-Forwarded-Encrypted: i=1; AJvYcCWio8eeiMAZiVNeVosvL+VOsGN/3E6q7N70Wkur7uhFup9mMcCo3UUSQkWsNlt6luDS/YB6xTVrHVDx4eeG7Inu@lists.infradead.org
X-Gm-Message-State: AOJu0YxBXWPPdPh8CXzuOZ8nX3L0NNypY2QwxmBacrEvz4yiq4z4ZXZR
	F2LVvkB13Xd9RfcN/qFNnSY7vCiNWw8R0puWFBrHl4laHcruYsx9vKy80Vb8CiCFCITktaE8/TB
	GzwsKgDPUzmqjYXs8r+3ePFlmAS7oL5iCBJyiPnx8Uw==
X-Gm-Gg: ASbGnctH+uMgUi2xv3Qy8eb9Gc96TpX/eqhUu9bpwuSPhpHIfh/R3nmmoxbwwW5JAkW
	Ii4zjuj+Hmd/kvqYSBD2YzjZQJB+1X+41dZhDjhiRlugIGqi3LGf/Tu595SiLmWhAHnSQ437IGq
	V2JviGRs9Lj9HkKzZzATaJ/EvDggR7NNtNvelP+e5+Pg==
X-Google-Smtp-Source: AGHT+IFy6gculqd6TMBrN0rYJWssXVz6+60yi4DzoSheepAu+OoDDguVK86eUKc83jB1uCOQJbumvqYQqLIeYGr+pL0=
X-Received: by 2002:a17:903:1b6c:b0:234:ba37:87b6 with SMTP id
 d9443c01a7336-23528ef7833mr65464395ad.17.1748631012585; Fri, 30 May 2025
 11:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
From: Jagan Teki <jagan@edgeble.ai>
Date: Sat, 31 May 2025 00:20:00 +0530
X-Gm-Features: AX0GCFvkNnwtQ--V1GCDW4BcbIzs35k_zL3RhgmHKFDsjekxRIDXrFhtYRu24lI
Message-ID: <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_115014_166260_01A8CDA9 
X-CRM114-Status: GOOD (  21.82  )
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

On Mon, 19 May 2025 at 19:14, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
>
> In its current form, it supports the specific NPU in the RK3588 SoC.
>
> The userspace driver is part of Mesa and an initial draft can be found at:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
> Changes in v4:
> - Several fixes to DT bindings.
> - Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net
>
> Changes in v3:
> - Reference in the device tree only the register blocks that are
>   actually used.
> - Several style and robustness fixes suggested in the mailing list.
> - Added patches from Nicolas Frattaroli that add support to the NPU for
>   the Rock 5B board.
> - Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net
>
> Changes in v2:
> - Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
> - Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
> - Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net
>
> ---
> Nicolas Frattaroli (2):
>       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
>       arm64: dts: rockchip: enable NPU on ROCK 5B
>
> Tomeu Vizoso (8):
>       dt-bindings: npu: rockchip,rknn: Add bindings
>       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
>       arm64: dts: rockchip: Enable the NPU on quartzpro64
>       accel/rocket: Add registers header
>       accel/rocket: Add a new driver for Rockchip's NPU
>       accel/rocket: Add IOCTL for BO creation
>       accel/rocket: Add job submission IOCTL
>       accel/rocket: Add IOCTLs for synchronizing memory accesses

Can this be possible to infer yolov8/10? Do we need to convert PT/ONNX
to any other common format's unlike rknn?

Thanks,
Jagan.

