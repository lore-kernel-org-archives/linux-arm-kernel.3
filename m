Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CB4CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 23:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MeeXZpqC3UdFXqv6vtSL6Xe6aEVCezqoTh3JvClT3k=; b=T/+vhKOSrUQcdz+jXjz6I1Z0Nt
	AGnfK+tnXAEa87wJXCSbaT3KEPFz/8VsYgHPyRtJKqiidj6zMc/3drRjJscj+wWhADSFLE2l85PdK
	LzAA/IETQk5Y4rf3KUyzw2pxBmc0PDQgcNO0xgTa3l/z9MmlW9JaNG6sIhOjRRXQSHzC0mM9Cql4v
	1YT4Ak9HIdKw5qhnlhNMmDMHvVxxtgXQk+1TbhpgFL4l2L5NOvRA2iPH0k/+Q77vB8rwT1ylAd8Uj
	DM5LafU8EulZoatesRWk451ExS1rpA7M/RfnGWngHLEG1vLDWDO//tLVkbY6yQW6NHR/GkN0DeqEZ
	OofCDwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umLKy-0000000FMmf-2V1P;
	Wed, 13 Aug 2025 23:56:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umLIN-0000000FMZe-2eKi;
	Wed, 13 Aug 2025 23:54:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A76555C596C;
	Wed, 13 Aug 2025 23:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0E5C4CEFA;
	Wed, 13 Aug 2025 23:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755129253;
	bh=u7JygzuN8O8D9Rm9/+E7Tyu1Q+aQCD/m/GsaOd0yKUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CYHv8VTKo8CuWcLGz1WzmMaS+9tWfXuo2af2jk1sNinHWzn50hjztoI/wVCkpJOms
	 v2kzASz5wx30tEpRfQcLWG67YoeIvb2kYiCQKH6gepHIGPY942pjL8zJ6UDqwMxgiv
	 kq3rveto+ELOK69LN4b/9gdFM5II3uzU1SdvTRVlm5+lfiawM4XRUBGWEhMjwMzvu4
	 Nn1FxUr/KKrhWGohZ0bJu0K4b+VA8WePkrYHQbd/npPiIbbA+9mw35ONsUDV9NFIJS
	 BrA4lLKDoyvzC0DZfECDNxO9o6mZ1dumc34y4BjXHtAT6LsGyrWn2sSB6+Jjab1kTL
	 YkHjkoxnKHBpA==
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b47052620a6so1186834a12.1;
        Wed, 13 Aug 2025 16:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKdyv2z7rgsmNvTsMMYR3YbZSYzYqJU4435Y329o9kWfXAi/hiFCC/2kEqJQOc5FMeDY8Ki/GcVgVxNQR9Upg=@lists.infradead.org, AJvYcCWNmHoReRLRsdJTdXg+VLQOE4ldzmITw6r8+KkeC8FOkFWtOcwd1snw2UncvQHwESwp88FROClWpsCixWrOO5yb@lists.infradead.org
X-Gm-Message-State: AOJu0YzAM6biDQoA84vbiG9cTmpNRPjHm/FlOIlg96iV81nk5SDtYnEI
	O3Qi+CmFN19dbIWnbO/13aMSq3jCJNltLDWIe444c1fT3myBlpBS6yPFUg4gyzSPvO/QUw0R048
	sK/Ikt75RH/fwSKa81SReGfBKIepb7A==
X-Google-Smtp-Source: AGHT+IGUT/OTIlNyxqe+nQr1qgyFIqgi0Olr7Sv6oTs4ZZrhXaxRN4cOyFxc2NIPsjn1MOi8/uF1Gmy97sX5D5owImA=
X-Received: by 2002:a17:903:2b0b:b0:23f:b00a:d4c with SMTP id
 d9443c01a7336-2445c152e0cmr2701635ad.2.1755129252780; Wed, 13 Aug 2025
 16:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250728025036.24953-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250728025036.24953-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 07:55:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7wQd_m0G4+gvpH2O5HoWZQKViwZH_x9vqMiyZ9VT8Xg@mail.gmail.com>
X-Gm-Features: Ac12FXyMVcTmpTQFQCgTgXBiMkbJFCMScrI8wGKO9rqUMaeAJeCiroFGQigsTVY
Message-ID: <CAAOTY_-7wQd_m0G4+gvpH2O5HoWZQKViwZH_x9vqMiyZ9VT8Xg@mail.gmail.com>
Subject: Re: [RESEND PATCH] drm/mediatek: Add error handling for old state
 CRTC in atomic_disable
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
	Yongqiang Niu <yongqiang.niu@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>, 
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Jarried Lin <jarried.lin@mediatek.com>, 
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_165415_748472_40BD7CF6 
X-CRM114-Status: GOOD (  17.03  )
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

Hi, Jason:

Jason-JH Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2025=E5=B9=B47=E6=9C=882=
8=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:50=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Introduce error handling to address an issue where, after a hotplug
> event, the cursor continues to update. This situation can lead to a
> kernel panic due to accessing the NULL `old_state->crtc`.
>
> E,g.
> Unable to handle kernel NULL pointer dereference at virtual address
> Call trace:
>  mtk_crtc_plane_disable+0x24/0x140
>  mtk_plane_atomic_update+0x8c/0xa8
>  drm_atomic_helper_commit_planes+0x114/0x2c8
>  drm_atomic_helper_commit_tail_rpm+0x4c/0x158
>  commit_tail+0xa0/0x168
>  drm_atomic_helper_commit+0x110/0x120
>  drm_atomic_commit+0x8c/0xe0
>  drm_atomic_helper_update_plane+0xd4/0x128
>  __setplane_atomic+0xcc/0x110
>  drm_mode_cursor_common+0x250/0x440
>  drm_mode_cursor_ioctl+0x44/0x70
>  drm_ioctl+0x264/0x5d8
>  __arm64_sys_ioctl+0xd8/0x510
>  invoke_syscall+0x6c/0xe0
>  do_el0_svc+0x68/0xe8
>  el0_svc+0x34/0x60
>  el0t_64_sync_handler+0x1c/0xf8
>  el0t_64_sync+0x180/0x188
>
> Adding NULL pointer checks to ensure stability by preventing operations
> on an invalid CRTC state.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: d208261e9f7c ("drm/mediatek: Add wait_event_timeout when disabling=
 plane")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
> RESEND change:
> - Update author and Signed-off-by name.
> ---
>  drivers/gpu/drm/mediatek/mtk_plane.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/media=
tek/mtk_plane.c
> index cbc4f37da8ba..02349bd44001 100644
> --- a/drivers/gpu/drm/mediatek/mtk_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_plane.c
> @@ -292,7 +292,8 @@ static void mtk_plane_atomic_disable(struct drm_plane=
 *plane,
>         wmb(); /* Make sure the above parameter is set before update */
>         mtk_plane_state->pending.dirty =3D true;
>
> -       mtk_crtc_plane_disable(old_state->crtc, plane);
> +       if (old_state && old_state->crtc)
> +               mtk_crtc_plane_disable(old_state->crtc, plane);
>  }
>
>  static void mtk_plane_atomic_update(struct drm_plane *plane,
> --
> 2.43.0
>

