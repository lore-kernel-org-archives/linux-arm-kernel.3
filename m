Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cy2Jt6lny7j/yQ3c78NTqavzrjxuBgUkufs4x1Ayla0=; b=sUKYO3Ka6mHssx4iPy9KHprzdw
	2I7kQycftvbQy2y2a6V6rBJbX6A8oFpEyAsse6cmSOSqVjWlhnZwjySvvPziVRtOV7gGDiTmMktRF
	41aj0JrLS15XnpD4lgyaHJzGbEhyoc5VMJGhgA3SVm47A2j7ZVB3dBgeb7nq8GSBG1+ndY00v5xnV
	aa+jV7lpkvzTg2rmzSH/m6Nbeus/a2a++gC72wuA+DiitUXjC19d+nhkJ4KZBlP9n+43XkIeaQuZ1
	Rj4xqxpDrHQJX24dcSRijPPi0VtvxGeF1yWyJEJ/8ZxydhyWntwlcCsD3VKtsJ0+CZlB9UWrbxKzS
	RAmHdNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgGH1-00000009160-47x4;
	Sun, 05 Jul 2026 06:24:16 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgGGz-0000000915Y-1E0m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 06:24:14 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so2052882e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 23:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783232651; cv=none;
        d=google.com; s=arc-20260327;
        b=hAPXlZlfKHPYLjQKcGdg/VoHGXCZzb8suEacIgzug84BwRgffiyD3lZnXAlkreq93Z
         F8Q+fP5lcRbFa6gfUZwAfATG0vKSTFob7ZXFr329rw0QToVUF7nI3KSdFu13dsh/eVD4
         s6cDL3o5gClw1LXLl05wzlxDSEZ17kBs4QxZgoy/Q0IaBzZ44madeg09uiEmjBHxdBk+
         EF1x6i7mnN6A2zFRJRQK+fqhcCprJMyUhcnV/wMiMf2EVRIPA3BnAuV5pTPGiBXbBfzI
         eyNlZjpeT5ZWwJav00IWXAzzgGNvM5fl4PzREMelabzNUpNSvwsoSn+lYv4YDTWR1P+l
         RT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cy2Jt6lny7j/yQ3c78NTqavzrjxuBgUkufs4x1Ayla0=;
        fh=Ydo4n5+iArH7oIDptNzVeZFSJiffrJ4Y6mmeUuHEtJ4=;
        b=VxhKM5z82J6HcNarL+wFvHFH4hQD2/g029QuqIRMqILGhJecgJUmVJYiAF2fDE+fSZ
         H98mF/uVtZst0q4VZ5VdH9F6Rbkz926YvFBGkW/Pz3sSDve0GUhMCTN4z0meEzRkhxAo
         SXqFoDmaXPcceqMvc6I4JsojmdVGsIyJj+NArsX6kPGUBjPrYU39HZH/0I8LzOuU4O7Z
         9GHrCx9YNQBxo5z0orMM91m815ECqLRQzMv5PAN/MAMsO3GJvfq2r76BtsqqHIpi3YAm
         ieoX4esEqUIgWxXAtWw4/ihJJB2bVsme8eDg6zX24sQsMsY+0XdHFaxFB8kP+lZnrOFq
         ujrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783232651; x=1783837451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy2Jt6lny7j/yQ3c78NTqavzrjxuBgUkufs4x1Ayla0=;
        b=pHOUcRTCHpplQ1eWWCG5mm3wbWZGKlRb0YKDhRr5Q8dCjP5FZe2k7uAHJXtWmCzHrV
         9EjI8nRVGzhNGlmm2vZWhqdpDq1wdNW0j1jBgOMwzbT6Ftvz5T8zsUQksCUo5dyF+tQN
         jlnuRTf3WWCuF6FQLu9xOZ/F5lKVQy4EHA+wzhkWwX0XLNHuFhZTrFTiCpzaRxlrmI+q
         5BP6v2qMAFyQtS2pw2TN5j/WQ4HA6+axiqf5H8rh9KSwGrQobN1qYOfbYVR9GaE4NU+m
         KgRLoiPLS6Lajy/XyLr+dOT+n2+cZDU3Yku6/0w16laG8NTI61nutT/0YMCCrH3zLRWP
         GEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783232651; x=1783837451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cy2Jt6lny7j/yQ3c78NTqavzrjxuBgUkufs4x1Ayla0=;
        b=YqM6O8sNr4UqpmIr/a3o0js47uJotymXtRCp7yfiX/twIJATMjK0nXAXy6JKYy6wZR
         jd+odsfq/eFEg9UgbKU+NkYrIwLIKEz3n6F7sqZdveP/djrEKQON8Dh/UEX+szZU1cm3
         h2eQ5CBzPUPLmWPwXGv13NdxwcRovL+DCQgzKk/lDP2/8PHOl1m0Km7cWRaUgDszJPuP
         8ZnKq16eiBVaNvunS8OM/9aTh1ijXcuml1kyg05OCsfCCgrpCSLxRu50NMcCoAVLYOVc
         XHv5yoOX2ID5v1GxqVfxDIX/8G8CJ7g1bnmQo25ov8tDTCYoHVjq4dOIbytfxCvAe1lg
         ABgg==
X-Forwarded-Encrypted: i=1; AHgh+RphF/ZHwP5J07D668zLAFV6ABGZyykPs7UyC29pud/pbQyU3IxGmlolYx78aPhfvQ+1NH1kSFR1PxaXlFxKnJNg@lists.infradead.org
X-Gm-Message-State: AOJu0YzyOKuTXIcdJM7Q7k8y3rQshVrnR8M43b/iukfbdZAZM0QJfyyW
	dvkGv/4oLufPrbnc3qcCXqCZV8r4WvV2tstQ+vcgUzHc1fP4jC1Yxsu8ggvJkLIAYnRF3+ym/hr
	RM4nk5eQZF0eAKDh6ujoYPKYWJQ8d95c=
X-Gm-Gg: AfdE7ck49LPZKd1kTyts6EgWt6yLVfjwzG5LpIJQ8HhUOGG6I8nf0K87OZS71kb8leT
	vu3xwI2vsUCO4gsxwWvYB/QXLcm8MBuwsd8BMgdVBOhxiSTszPG6OAh98m2sD0sI5MEuA5k+QHB
	/qn8ncMDmUxOHJW7bPsdINyuZvnL3r/gCRE/aBuJ79g8gfX5Xag8OMjr31dYxqgkhd+rgaorc5Y
	sorijHclJKjNXIaBHKzBUQj2fMA8mv764itGOFEy1hP7aLGaEhMEMLP9AE9DSqML0DU/5UObQ4Z
	5KxSTSP7rd01xVpGnLP1VbSTSsI=
X-Received: by 2002:a05:6102:e06:b0:643:80f1:350a with SMTP id
 ada2fe7eead31-7427ce18c0dmr2135936137.2.1783232651081; Sat, 04 Jul 2026
 23:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
In-Reply-To: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 5 Jul 2026 15:23:34 +0900
X-Gm-Features: AVVi8Cf8yc--a4qZ7FOXrm9j2w5KabYozWK2_t--A7TY5sNuVyS73aMpX1qw6v0
Message-ID: <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos devices
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_232413_345811_2A75EAC2 
X-CRM114-Status: GOOD (  14.83  )
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

Hi,

It looks like you may have forgotten to post the v2 patch. Could you
please check?

Thanks,
Inki Dae

2026=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 10:19, =
Diogo Silva <diogompaissilva@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> This series does two things:
>         - Open-code drm_simple_encoder_init() since it is deprecated
>         - Handle the error code from drm_encoder_init (previously
>           drm_simple_encoder_init) to prevent silent failures and
>           cleanup of uninitialized encoders
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> ---
> Changes in v2:
> - Fix mistake in exynos_drm_vidi
> - Fix indentation
> - Link to v1: https://lore.kernel.org/r/20260623-exynos-drm-simple-v1-0-b=
b52f098b1ee@gmail.com
>
> ---
> Diogo Silva (2):
>       drm/exynos: Remove dependency on DRM simple helpers
>       drm/exynos: Add error handling to drm_encoder_init()
>
>  drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 15 +++++++++++++--
>  5 files changed, 57 insertions(+), 10 deletions(-)
> ---
> base-commit: 60326b17f877e12846167bf8ef83680b9875218a
> change-id: 20260623-exynos-drm-simple-bb5386d64597
>
> Best regards,
> --
> Diogo Silva <diogompaissilva@gmail.com>
>
>

