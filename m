Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DEEEA3F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=; b=TfCV6BcAMOCmsVMapNVtr896Ay
	w09IdMYSYmCo6lCXJKSk0xF3unUrjpx3kz1D23RPwTrYIiLUocaaZqzuwu/rX3lLU1n/hftc/g4xG
	u+dMxWrnnTPV0ezNBvxywO2u296L349GeSZ4ns/wBWQ/qKspWD1y54R384Mrt9rUQsmxcTUjellmn
	ErEtxjGJaxGIe9VA/vmY1lZj/r9Vu3r4wTIgg8TY4LcrOrV6VxsPw4FCj1mW8wnRM6oaJiLDUZcad
	oXeL8FJ+bKqXw2EqiWhcKORszraGe+4Jroh4Mm2UXqjoVagAfD/xlIWI6HaLDckH9hUcUoyE5lXbT
	aCJFSPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfx1-0000000GRfY-0IWe;
	Tue, 10 Feb 2026 05:06:15 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfwy-0000000GRes-40Wc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:06:14 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso156851a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770699971; x=1771304771; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=;
        b=OPnxnAcdhYpRrDxyqNk7XZ7SNbWMX1j4d6vk4bp25jtvaGcwaiclJiCXBB0wbzVXSu
         hq6vAud45Fo237x/oJOp6OfF66ykFjxOAWA067MF5MTTjddooVfIuncnmJefYEj4zNwi
         PFLc+fyQ0O3ImKUWmXMZOLGrZ5Aa9ggBJyO7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770699971; x=1771304771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=;
        b=vx2tQH4sFDbch68Kv6RhhDMJH48XM/US0H442FIl8CW7S8rYi9YjAnYyPn5tuxLJTT
         UuROWchMVcW+cHnTnRVFc47IlT2q/i+6QBfNpsoNtHGFd4XHsfvwNPznKj2qKRQRvmIh
         T8hrMmzn+iVnOy9rE8Nl3aNhRX6jkcXyrKIL3VJBYqDjBRHtFIyLmr0QtUyk6WQ6zSdQ
         bYRY5/ZYvs+hiYfjbGDW13/DeeEkxnFe0VVCX96UIVw3aBsEPlXW31OH9RckKqcmzGpo
         gAs6oNz4lRNMCs+BnyAhBkrbb71NJr0v5Dx3QvY0isdP96wxxYCdxrMPKQwroGAMRoE6
         A6eg==
X-Forwarded-Encrypted: i=1; AJvYcCUdTaKsMVUS9vsk97y5agQDafJqvp+prTKusMtk0S+WfVS2RGbynbUiJ6Y2njq/JI6UFvAdFnEMV20OSaQfZH5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwXvnBMxVJi3OKlfBQc+yWOJ41V4tDWQTwQDfneSzoxvwEa5+tk
	yrIKvkyF+MV3q6fBmyDtDz5kwbUY0rLxxQYevmKmrLzmDqb85jOSLvX+CUvLa5XggA==
X-Gm-Gg: AZuq6aJedHj8a4dJv/U7uC7T4oH99sGRFyTaM9GdZgsWDKite0yf66QlS+sQ1b/HPrI
	Z103rs14qBsRghYiHpmdbFSz713XNQcbJwZoYfCGIjR2LgnJ6RUXhunz0qbfZL6xFsmnQzHAk+2
	/rAmmCEtPWMvLKK/S2k2pklLKLYl556GkhBDzyAJANjCoRiKkSrbeBU8H8QD4YPLQKdgOqJe1Op
	sh0cvbh+Vqi+tCtn/v4x9zhLDJqWdeMYn4wsPmYysxOVH2vGb4Mi8yLKrQTNKLAGrOGJMHf/1WY
	KZrSawhCNb0SYx2kTQ6PlxNMjFsa2txnSmMHqFawM29KDuSkQFMyyb/6G3q5h910VIhwNQfLXjj
	JZgJjoZpxP4SeMHuCsisWoyGtLju9N8MQF5q0/hRWpqqyZVN9BhR5wjvINqDmKL+95bCObojK1/
	LpvJaVqc4KaD0CZrCSRdTIgikT5usxwe2kE6OC8nFIdIbY0SgVhB6H44o=
X-Received: by 2002:a17:90b:314c:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-354b3e4b663mr12562993a91.27.1770699971626;
        Mon, 09 Feb 2026 21:06:11 -0800 (PST)
Received: from google.com ([2a00:79e0:201d:8:822c:995b:f23f:e04e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3562fc6f342sm3648006a91.0.2026.02.09.21.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:06:11 -0800 (PST)
Date: Tue, 10 Feb 2026 13:06:06 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, greenjustin@chromium.org,
	sjoerd@collabora.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
Message-ID: <20260210050606.GA852606@google.com>
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_210613_062627_A48EE08A 
X-CRM114-Status: GOOD (  15.03  )
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

Sorry for revisiting this old thread.

On Fri, Oct 24, 2025 at 05:27:56PM -0300, Ariel D'Alessandro wrote:
> Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
> driver") added AFBC support to Mediatek DRM and enabled the
> 32x8/split/sparse modifier.
> 
> However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
> platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used by
> default since Mesa v25.0.
> 
> Kernel trace reports vblank timeouts constantly, and the render is garbled:
> 
> ```
> [CRTC:62:crtc-0] vblank wait timed out
> WARNING: CPU: 7 PID: 70 at drivers/gpu/drm/drm_atomic_helper.c:1835 drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> [...]
> Hardware name: MediaTek Genio-700 EVK (DT)
> Workqueue: events_unbound commit_work
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> sp : ffff80008337bca0
> x29: ffff80008337bcd0 x28: 0000000000000061 x27: 0000000000000000
> x26: 0000000000000001 x25: 0000000000000000 x24: ffff0000c9dcc000
> x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000c66f2f80
> x20: ffff0000c0d7d880 x19: 0000000000000000 x18: 000000000000000a
> x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
> x14: 0000000000000000 x13: 74756f2064656d69 x12: 742074696177206b
> x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082396a70
> x8 : 0000000000057fa8 x7 : 0000000000000cce x6 : ffff8000823eea70
> x5 : ffff0001fef5f408 x4 : ffff80017ccee000 x3 : ffff0000c12cb480
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c12cb480
> Call trace:
>  drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c (P)
>  drm_atomic_helper_commit_tail_rpm+0x64/0x80
>  commit_tail+0xa4/0x1a4
>  commit_work+0x14/0x20
>  process_one_work+0x150/0x290
>  worker_thread+0x2d0/0x3ec
>  kthread+0x12c/0x210
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> ```
> 
> Until this gets fixed upstream, disable AFBC support on this platform, as
> it's currently broken with upstream Mesa.

Do you remember the circumstances you had an issue with?

Looking at our notes, it seems that for MT8188 only vdosys0 supports
AFBC. And on MT8195 it has issues with color correction on the second
pipeline. The driver as currently seen in next-20260209 only signals
AFBC support for the first pipeline on these two platforms. So I don't
see any issues there.

The commit you mentioned that introduces AFBC support failed to take
into account this flag when exposing AFBC support to userspace. But
this was subsequently fixed by:

    8d121a82fa56 drm/mediatek: only announce AFBC if really supported

On my MT8188 based Chromebook, only the planes for the internal display,
i.e. the first or vdosys0 pipeline, show AFBC support.

AFAICT the Genio 700 EVK only has one external HDMI connector, and that
is tied to the second pipeline, which should not have AFBC support
announced. I'm not sure why mesa would still be using AFBC then.


Thanks
ChenYu

