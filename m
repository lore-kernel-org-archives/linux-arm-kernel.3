Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C86CF538D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne4Jq7Z5W7H9YQ7BSzseOB2fUq6ANZj8mUKL3sXr4Gs=; b=iziJ8X9TMjNwRYE5IGMnhZEW5J
	Ak9mF5OCukGGIO99gQy1vqbj1GQkP84mCZI7D6mtC7EEbebZf9wX6DTC0x91wwSzeHe0LV+oLO/xK
	hNkKTrlIb1AcB4tXgZIgxD6zj6B2rdtqfhgG6IZjjnyW7OEI+0jBWynGro1hvp4ALpoG0JAdq6N2d
	6pHSIoxJtD3+jcRQMAiRtSagk/WtZ+3KyldT/c6RmzMeJfCnrl0nu4MIhAAnLru+SpmxcUtGckND9
	LOUECpwbM2e7UaCnGGVqezDIBGkLxrYbmcuW7kPtLNfaQj8+7JqZc4gRoHBD4oJ4E2VQ5xW54cdxZ
	vgD7dhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3c84-0000000Ef0y-0VBe;
	Wed, 23 Oct 2024 14:14:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3c6V-0000000Eeg0-119g;
	Wed, 23 Oct 2024 14:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBEDC5C5E8A;
	Wed, 23 Oct 2024 14:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CA9C4CECD;
	Wed, 23 Oct 2024 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729692770;
	bh=lT+2VpBy0BT7oY5bPbktSNUFx97M8RvIUrfH+KcF/Dc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W+br8yx0K06VIfrfvTTPp6H8RvGMv96AxJZySLP4dlcJFUhpirDAHaTFpIcPpoz/A
	 N6QCXxzTD4M+AcJ6ap7fC3t/tpBJY9/E8+TUs6f/aQ8mO3vyHnxuTnyRZBeSEqLC7v
	 C4Oa5C156i+HZJokRBkMJJt24mfC3vO3F05rKjaRqv9MUjPFz1MPgH3M2T16szp2XJ
	 GhibYZl4h9CkJ46uip0M/M5DD1w9HsHBWwm8TnGy9BHdQMRTJx5OmlfCvnKkdo8UET
	 jHEf+ItWv3xYMXwUYmIgW34LPDtXlrCeKIY8d6+WpoV8SvGQqyFeDBZybAhztAPfPV
	 uL0NgWplSc4bg==
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso4618071a12.0;
        Wed, 23 Oct 2024 07:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnDhV23ANd0Wv5Lszp3N/DXGa+u/AYheNGd6q5Xwk4kxAKVvHEKFN/IVNbAKc0x5Fu9K66VN+fA1f7as2UH6E=@lists.infradead.org, AJvYcCXJYKIG9lr0gQXOnyVkC2am7lYLJI5UfH+JHNrA6s5+HExdDxDELugbUHDM+ziffdVOSXLnzrbEm9alDEzP2EFK@lists.infradead.org
X-Gm-Message-State: AOJu0YxnUEG9Bp+wEuGvyyeGXc+53ogTerYOt5x2bFFwUWLzPZ5ZSn9b
	wJtqu3aHRzfiNvBDzG/NFFllCTQQTVPUfxWJTawqx2ud/e+LgzpUUFP/clNbjdgxDVEzdT0OzRE
	y1U1a82AEmM/I/zyybUG3SiGkEQ==
X-Google-Smtp-Source: AGHT+IFlsad2/fwPdFPf6XhOvIClD0wIrRQ18NzI0oBgziJzaXBbTh6qI7+JGmlilOHZTPE+QeviZQ7b6sPyVX5hBBk=
X-Received: by 2002:a05:6a21:3a41:b0:1d8:a247:945d with SMTP id
 adf61e73a8af0-1d978bef8bdmr2663185637.50.1729692769613; Wed, 23 Oct 2024
 07:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
In-Reply-To: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:13:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8kG67ns8OokhzujmH7UNM-O+4Aa=GruO_spLOALMeARA@mail.gmail.com>
Message-ID: <CAAOTY_8kG67ns8OokhzujmH7UNM-O+4Aa=GruO_spLOALMeARA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_071251_474986_B49409DE 
X-CRM114-Status: GOOD (  17.72  )
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

Hi, Dan:

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=881=
2=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:45=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
> set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
> we do not call cmdq_pkt_create().
>
> During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
> is NULL first before calling cmdq_pkt_destroy().  Calling
> cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
> it will result in a NULL pointer dereference.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 175b00e5a253..c15013792583 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -127,9 +127,8 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
>
>         mtk_mutex_put(mtk_crtc->mutex);
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
> -
>         if (mtk_crtc->cmdq_client.chan) {
> +               cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_=
handle);
>                 mbox_free_channel(mtk_crtc->cmdq_client.chan);
>                 mtk_crtc->cmdq_client.chan =3D NULL;
>         }
> --
> 2.45.2
>

