Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B06C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=; b=ly1KlvKOXZhvA+f1EL2hDUE+jG
	xjKZszb7bpQQNPb16SJWR2cLHEXJ3HiDQ+cDfExnnE420vv12J/OXWlRlg2vIvbXXzl9X3d4c+vlN
	ApGrjPX57JegXuXMcfhlUClkAiuV5LemaDqRp11Dt9xUi0PDpqhfFWAf7sguvsopE9EMrHy/eEUVb
	ZSjeFZxe4L24BAg5uKqvXUhEWIVMepx9Zzb+GjYHuo68wRgzmw30NNlzKizuLPTWbLd23g2Isnf84
	VZ7z/Oc0kKk6DQcrYQujLKkDrqOlT4zNiOwZlpD/nQc804D/fMM37FkbPcxtFmDOovsbYvsPO4u2k
	4aAqlTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6th-0000000Bzg5-33rW;
	Thu, 20 Aug 2026 17:49:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6te-0000000BzfP-1nBh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787248185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=;
	b=ST58cAe4UMwegV8iqMm2q1awNbT691uSkWV4WNhkjkxu+nhXXe7vlb7xcY6xc2ivtQJQH6
	R9AjDUg97hCKeMvvqbfptTKxhxTSkkaxCCkGydrh6nv//GHlZzNV7lwgO8YJvz1vr5F55V
	Xx4oMWobFItjqElVf5H01lEn8ULM+OA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-YOy7DvuwMT2kLvXo4fjdag-1; Thu, 20 Aug 2026 13:49:42 -0400
X-MC-Unique: YOy7DvuwMT2kLvXo4fjdag-1
X-Mimecast-MFC-AGG-ID: YOy7DvuwMT2kLvXo4fjdag_1787248181
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f6db77430so98049f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248181; x=1787852981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=;
        b=gL9pBHGFimoGLGCWLJwnO8/BZXMbsC6bfdO+ISbXqC7kpdWP2vNS6uu9H8Lf5dFoTl
         QBejxXilXgB9d0ATk0G0Ue8uYx+2LYZV0JLs9OPEaX1mpsncmVUOaQQHnYGum2uvtt1T
         AEKHvLGTe4mZp5h8zt9iETbFiVM3xpoyIS06I8hl3x6kYtxBFj8JemM+EN+kWCqfkHPs
         l2NJTd5OD+xY8fFxb8JA0ZoKBHXStOVhJNl6IYi6gpnQ0m5FHlgxFr5AjHPOT7/CxMTp
         gLwznE6nMswxL+oeajOcsZQS+NnzqyIDJEYJ2nrjtoSn/UiG8yqgaX2Rmcj6gFNkcXtS
         pGIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1awY8uZOEHiO6cRwokNTBO3dk+JWPBscoR56uYyMO8E6oK9KLM+egGKuMY8s7pRahuucuaF8tJKequa87Bcob@lists.infradead.org
X-Gm-Message-State: AFuF++n7X4pN43clotKJ8eGNBSBMBJwRVSpj/YqiQmHWrqCMO+c4rHtt
	2ExHT7z54v0a3nCARS1R0kNwARKNjpeKePNX1Eg9HWnoznqZHD7xj4TKVJ4nnLmWB7UYwGkU4t9
	iFW+RXQnxDxu8aZwkMeBzKBxNGFYr97MBczYjS2zjopZ9SOrgXlwZSrgAXNSSvWNAwH9hVwIwXm
	aw
X-Gm-Gg: AR+sD10RIbH7pcPsX4PaMidKwvYpWO7sen8LNLvUtfIfhGO1zza5IOH4Gf6zEe2PSP8
	xrvLCk4op7ndVCXENGWbUuQXDZDZT4alSVAjOCat323OflHEkSLus/+9wAFVASPGHrpuDAjDFrr
	XoncEEsZpC5rf+Zy7SIFsRs69ucZOo3R5vIWFJM0vEeWG/z2fTbVBgdB+Y6WMVejO6M3y7Zrpas
	pPDsoKKv+M6LPQ2bCv3kqHCcu6dhd+C+l5M1tO04zZUliYKQbOUMmRRF/xrTVfMCjleSYkvPT1C
	IMKSyrTlbX0OjONPtH6W+QOJgFk4fOYqQ+dQh+/uGzldUR/Zoh42Q7IAbCUaD91AE8PEFQE8dXR
	pgeR1RQ30gWmTZ7rbeTBVuy9IA5OnSNtthkCfNCQQfWAXow==
X-Received: by 2002:a05:6000:184e:b0:47f:f339:556c with SMTP id ffacd0b85a97d-482c0b4a40dmr705158f8f.2.1787248180691;
        Thu, 20 Aug 2026 10:49:40 -0700 (PDT)
X-Received: by 2002:a05:6000:184e:b0:47f:f339:556c with SMTP id ffacd0b85a97d-482c0b4a40dmr705081f8f.2.1787248180291;
        Thu, 20 Aug 2026 10:49:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145d31bsm13853815f8f.16.2026.08.20.10.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:49:39 -0700 (PDT)
Message-ID: <e4da5ba4-9a02-4080-9a83-19d401017910@redhat.com>
Date: Thu, 20 Aug 2026 19:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/panic: Split into core and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rP_Or6eNZsaZxzacm1EkiC56RlC1NLD0jVrC8VXalZc_1787248181
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_104946_545092_3867EAFA 
X-CRM114-Status: GOOD (  30.08  )
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

On 18/08/2026 14:27, Thomas Zimmermann wrote:
> Split DRM's current panic handling into a core and a helper module.
> The core is still part of DRM's core library. The panic helpers are
> part of DRM's KMS helper module (for now).
> 
> The motivation behind this series is to get panic handling's drawing
> code out of the DRM core. At some point it should share a single
> module with DRM's other drawing and format conversion.
> 
> With the series applied, panic hanlding follows DRM's established
> design pattern of having a DRM core interface with an dedicated
> implementation in each driver. Drivers share common code in helper
> modules. For panic handling, the DRM core still contains the panic
> entry points, the parameters and the debugfs interface. All drawing
> is now located in the panic helpers.
> 
> Patches 1 to 4 improve several issues in the current panic code. It
> makes sense to fix them before moving the core around.
> 
> Patches 5 to 8 put handling of all panic state and locking into a
> single place, drm_panic_display_panic_screen(). It is maintained by
> panic handling's DRM core code. This also enables the test cases to
> work more independently from the kernel's configuration.
> 
> Patches 9 to 11 split the panic-handling code into the core and panic
> helpers. The former maintain all state, locking and public interfaces.
> The latter handles drawing and details of the involved framebuffers.
> 
> DRM devices that offer panic handling provide a single callback, struct
> drm_plane_funcs.display_panic_screen. A new initializer macro makes it
> point to the existing panic-drawing implementation. Hence there's no
> change in features or functionality. If panic handling is configured
> off, it all clears out to NULL.
> 
> Patch 12 reworks the test cases slighly, so that they can be build as
> a separate module. Do 'modprobe drm_panic_helper_test' to run them.
> 
> Tested under bochs with debugfs and test cases.

Overall the series looks good to me, and I like the split between the 
helper and the core.
I would just drop the first two patches, as I don't see much difference 
between static allocation or kmalloc() at init, and I think that 
memset() the buffers to 0 is not useful in this case.

Best regards,

-- 

Jocelyn
> 
> Future directions:
> 
> - Panic handling shares some drawing code with format conversion and
> clients. There's even more drawing code in vkms. Later series' can
> attempt to unify and harmonize all these implementations in a single
> draw module.
> 
> - The drawing helper drm_plane_helper_display_panic_screen() still
> implements various access schemes (map, set_pixel, memcpy) in a single
> function. It could be split up into specifialized helpers.
> 
> - If we ever need a driver-specific helper, it is now possible to
> implement a custom version of display_panic_screen.
> 
> Thomas Zimmermann (12):
>    drm/panic: Allocate QR-code buffers statically
>    drm/panic: Make allocation of zlib workspace more robust
>    drm/panic: Return -EINVAL if font is not available
>    drm/panic: Return errno codes if panic output fails
>    drm/panic: Pass colors to draw_panic_dispatch()
>    drm/panic: Pass global module parameters to drm_panic_dispatch()
>    drm/panic: Retry in dispatch function if panic output fails
>    drm/panic: Split draw_panic_plane()
>    drm/panic: Display panic screen via per-plane callback
>    drm/panic: Internalize panic locking in DRM core and helpers
>    drm/panic: Move panic display code into helper library
>    drm/panic: Compile KUnit tests as module
> 
>   Documentation/gpu/drm-kms-helpers.rst         |  11 +-
>   Documentation/gpu/drm-kms.rst                 |   3 +
>   MAINTAINERS                                   |  11 +-
>   drivers/gpu/drm/Kconfig                       |   5 +
>   drivers/gpu/drm/Kconfig.debug                 |   1 +
>   drivers/gpu/drm/Makefile                      |   3 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   2 +
>   drivers/gpu/drm/ast/ast_mode.c                |   2 +
>   drivers/gpu/drm/drm_atomic_helper.c           |   2 +-
>   drivers/gpu/drm/drm_crtc_internal.h           |   2 -
>   drivers/gpu/drm/drm_drv.c                     |   3 +-
>   drivers/gpu/drm/drm_kms_helper_common.c       |  14 +
>   drivers/gpu/drm/drm_panic.c                   | 914 +----------------
>   drivers/gpu/drm/drm_panic_helper.c            | 915 ++++++++++++++++++
>   ...drm_panic_qr.rs => drm_panic_helper_qr.rs} |   4 +-
>   drivers/gpu/drm/drm_panic_internal.h          |  59 ++
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   2 +
>   drivers/gpu/drm/i915/display/i9xx_plane.c     |   3 +
>   .../drm/i915/display/skl_universal_plane.c    |   4 +
>   drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c       |   2 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h         |   4 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c       |   2 +
>   .../gpu/drm/renesas/rcar-du/rcar_du_plane.c   |   2 +
>   .../drm/renesas/shmobile/shmob_drm_plane.c    |   2 +
>   drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   4 +-
>   drivers/gpu/drm/sysfb/vesadrm.c               |   1 +
>   drivers/gpu/drm/tests/Makefile                |   1 +
>   ...m_panic_test.c => drm_panic_helper_test.c} |  65 +-
>   drivers/gpu/drm/tidss/tidss_plane.c           |   2 +
>   drivers/gpu/drm/tiny/bochs.c                  |   4 +-
>   drivers/gpu/drm/virtio/virtgpu_plane.c        |   2 +
>   include/drm/drm_mode_config.h                 |   4 +-
>   include/drm/drm_modeset_helper_vtables.h      |  11 +-
>   include/drm/drm_panic.h                       | 117 +--
>   include/drm/drm_panic_helper.h                |  40 +
>   include/drm/drm_plane.h                       |  57 ++
>   rust/bindings/bindings_helper.h               |   4 +-
>   37 files changed, 1253 insertions(+), 1031 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic_helper.c
>   rename drivers/gpu/drm/{drm_panic_qr.rs => drm_panic_helper_qr.rs} (99%)
>   create mode 100644 drivers/gpu/drm/drm_panic_internal.h
>   rename drivers/gpu/drm/tests/{drm_panic_test.c => drm_panic_helper_test.c} (80%)
>   create mode 100644 include/drm/drm_panic_helper.h
> 
> 
> base-commit: dc462ab791b686c48545c160ecc81be64f77a846
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
> prerequisite-patch-id: b9adc9622920a3e70168e672c2c92795b3e3a106
> prerequisite-patch-id: 5030de433a01c2e99056cadb676a8e2ba35f055a


