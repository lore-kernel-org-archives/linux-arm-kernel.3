Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9F7C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=; b=kmC6Vl/KJKAqIgiCW/+j5CrUMU
	uIxXPREB4z5u/xu3+aOJf38tAqpOsFeonmcIgz7a1zqOSCF6PuGHN/lChRmPp/zEvCHEuaPywM6rd
	LwFSCt7H6ZQ16g+T2D5yDZFY8ZGa6WrPod1RgJj4q/ijj4SGSuEwnNdkMnkWNx27D7/fdlra209xS
	H+URjjKBrXLwv4IiZfxABegIhwnNRlk0qVt/YeHg+3cilxnOSaR2rj2EMmDcaD8J6/XQBBApyApDP
	rJEajgK2qU8yP6kya2KB3efxCMqWLyk6m8wty1Y2/EMSW49ri0+QlholxRqfoxOJenX2t2PiEvxWf
	3iEDdrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oD3-000000083Ci-3ye4;
	Tue, 08 Sep 2026 05:17:29 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oD0-000000083CL-2jhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:17:28 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-66fc7196ca0so2389669d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788844645; cv=none;
        d=google.com; s=arc-20260327;
        b=b8GDtfOQubo0rjdCF8RKiq0Qs5/231rbajI2iB4Xv1l7zsP3u14viUjk2Grjv0DS8m
         PbWRbKTJ1HR0kYffjXxy0i1/GL9fEamgpKWW6ZcE3QGGumPtbI6JUv0TgU0aS8D2le6g
         +KnI/Wwykat/dWXsP3Chn8zfxY8nzSYvJp+lCvNNmvXenRqr226x1ifpo8ReqcVhiLs0
         ZceJg6HAf4HSlx0X5P/dOiTcsJgUil9qtOGVmSHLCxyGX/YU2VB0es97CuCWrQRiNtqB
         ah9HhjjjPTyU2BaWS3MOpH/w6l0ZYQP75Vsv9+i2nojQuiUITR34X4RL4nYQK/VlxQcA
         WoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        fh=wCthHMEz3Ed5s5Q9wFte7kq14TeELclLzZNs/GdU1Do=;
        b=CI9MAfFjBUxkI7r2jLOlSsxtIlb9YmX3PS9LbXsDuBc3oH0mse7fCh20+n4XU7gf1S
         AqTDZJhW97hZ9JH1+ypVzCel7G1/GkiaBhgt7o5ElDZ35K2wDsAXa/AC1iMoLirUmc1t
         w84gXA2xunD9txSFq79c2efdXGPJOeiujJFirPC9gK+ZBZESiPSBMhBIK8wUPWA3DqGO
         gwWGcpqN6Wv9tZWa6BtYKIYvEtw9OwDHyodagxJxmsEbqGKQtl+JAtltw0NkN9366eoM
         2QIPvEFYsqph7GFxAaEEKPw1m+5bApXRFa0TH8hAeC9eKTSvAdEsfcLiIsYTwhR+GySU
         2/gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788844645; x=1789449445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        b=hAMDMidxD6IQScEwKOAq84RTy4PR4bYLuv3oupGspd2z3nTjqo3+q08bmT1AE0v+co
         AyQMh5EMrGM2xApEot7aqtnfiFDUSz2pS4A7P5Im/hv2f0I2Zv6JknkjCImKEqO3t8Bp
         G6op17Y1J8ddsND1iPadmTXn1gcKiqLrR9nIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788844645; x=1789449445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        b=nck2rlWtLPtQaFCcrGj2X78gtxmEtNNNydeCb7LET/03C2/o8Khd5gjeC6KjG2u9eD
         oSiN2CGd34fYGjM7mAzAg7DLj/ZnQSXzycUjVSU4QZTB/iBoilXjeaY5ujtoAfnBCxYy
         KWxhF0fMzjaDDsF3ez7vPmdeM5NoMfppw9P+J6ADXYTEP+X+se+GrH5LNxYoKp7jV2lQ
         3DVqhUvvoCW5F42jI9Oymuzd62wwqiIMT5hlxVsryLUfIEEwmd8YE7yqrdNeLTxoUfVw
         BotCENLjKidDuDpO2khx/G62qtlU1UZAnM+GNk5OSE1KJboW3MsgYjAVDDQihppNkdZb
         /uKA==
X-Forwarded-Encrypted: i=1; AKwUvBxeEFKRWS1kwZIPzGSJ5qJKzZN8VOLY+xVvzm4lu71B5rKfIcxui4X2EFwqjkYH+Az4mtk7oimxNwD2oGId5e8F@lists.infradead.org
X-Gm-Message-State: AFuF++lCTr9NQRJd3Vm9yu9nfn2GcV0mEa684IDe9KN6tS5TWthkafqh
	Bvb1IAKPdYx5uygzEjWU8zGFBTT1UDhCBgGxhxvzHTuz+Hmch0xjjIN+S0ssEqUYRItraY2GEQe
	ClTuP/EL2MQhY4b6Sp6TM/kl4JJykTOmb3jjgoXfr
X-Gm-Gg: AYBFou3MD9DDnMeQsqGaOqDe9qvCZIJ0S87lgQURxwSDIFcWuwPkeiBV/GcDFxXE1Rr
	ocAoDMJJgwpAQ7AgEXPoJUUYZXq3QzTGTLmL4xA0O8Z/pf0TU9YphxQe1p0ovEWR8+NigwmzCug
	pfeSPYaFficKiBNGXXLD6Lg9RBbnq8U/1iaML0infMGIDs/px5NgYL6za0+v//UVwMTsaRcRrBA
	KXjnrWl82TFXLbyn/PXUvCFwz8ZRUybsT4g5YucToriVAQkowfgioRg+8A5dVjhytbzYy0ZuEme
	/M5KP7Tf0tM3GOH3nwkd3OF3NMXi9PYXe1t5LFN6moboiou+jViLiebMd+uur4A8MvXOpnXLvHY
	=
X-Received: by 2002:a05:690e:d49:b0:66f:c1bc:87db with SMTP id
 956f58d0204a3-66fc1bc8991mr4871587d50.52.1788844645029; Mon, 07 Sep 2026
 22:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260908050229.754977-1-wenst@chromium.org>
In-Reply-To: <20260908050229.754977-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Sep 2026 13:17:13 +0800
X-Gm-Features: AcwNN1UvbZam4KMBF7rri3O2usHHuyHcUFKj6A3hEX1XxQedM-d5CJUALYS2SIM
Message-ID: <CAGXv+5FjHY36sHc+osF2ENjpz9Y97WDCzFEE0c+unXtyxR23Dw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: Align VI buffer addresses for subsampled formats
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_221726_848467_B1C82C09 
X-CRM114-Status: GOOD (  27.44  )
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

On Tue, Sep 8, 2026 at 1:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
> get display memory") dropped the code to calculate the framebuffer's DMA
> address in favor of drm_fb_dma_get_gem_addr().
>
> This turned out to be wrong in a couple ways. The hardware can handle
> pixel offsets within a sub-sampling block, but the buffer address must
> start at the beginning of the subsampled block for all planes. The
> hardware then does the interpolation internally. However the helper
> gives the address exact pixel for luma, which messes up the result.
>
> Instead of reverting the commit, calculate the intra-block offset and
> adjust the buffer address so that it points to the start of the block.
>
> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Cc: <stable@vger.kernel.org> # 7.1+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Please ignore this one. As Sashiko pointed out, this could underflow the
buffer address.

Instead this should be sent along with another fix I have that switches
this back to the clipped buffer address.


Sorry for the noise.

> ---
> This is an alternative to Jernej's original revert:
> https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785=
772659.git.jernej.skrabec@gmail.com/
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 2e9cda45c04e..185e9e5211c1 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -207,6 +207,20 @@ static void sun8i_vi_layer_update_buffer(struct sun8=
i_layer *layer,
>                 /* Get the start of the displayed memory */
>                 dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
>
> +               /*
> +                * The mixer can handle odd offsets into sub-sampled YUV
> +                * planes, but needs the address of the first pixel in ea=
ch
> +                * sub-sampled block. Adjust the luma buffer address back=
wards.
> +                */
> +               if (i =3D=3D 0) {
> +                       u32 x_diff, y_diff;
> +
> +                       x_diff =3D (state->src.x1 >> 16) & (format->hsub =
- 1);
> +                       y_diff =3D (state->src.y1 >> 16) & (format->vsub =
- 1);
> +                       dma_addr -=3D y_diff * fb->pitches[i];
> +                       dma_addr -=3D x_diff * format->cpp[i];
> +               }
> +
>                 /* Set the line width */
>                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
>                                  i + 1, fb->pitches[i]);
> --
> 2.55.0.979.g7e5102b832-goog
>

