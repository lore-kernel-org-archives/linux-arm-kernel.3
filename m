Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CE410BA42D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 05:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qpLZngxvD5vGzgjAq9F8kx7Hz38KrclZnLPXkRhlc4=; b=o4WPY0NHUULxOAiPTGC2JHDQxC
	hF+3Tzx5swo8f7QpZ3XGsy/NkTpzufjyBhh4hU9nv2NltB22K67MIHZpBdVlGSWpaeZsiDEnnxZEA
	VLiihbFvyipBL7bsknxMoatHIXXDrHjpSDwHuK+uj8KoA4y1rD5zI1jnKETbiwOcJ3IcCmpWjIXqR
	Mc8MmiH1vguctHwoF4iFWdAGeXSPyFEEJjoHR9UA6ZQzd1DRWPVWeEnuBcbhi4Clspft0C+3jMc4n
	AdtxqGLWUW5UBc/HYbzX+5b1ezBiIjEFu1XwcTtfWALshKlsXlnNUz7T98+dtuKtoIn8uN8iB82fg
	DoFPigJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w603y-00000006isJ-3yRk;
	Fri, 27 Mar 2026 05:48:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w603w-00000006irq-063c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 05:48:53 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso1061154e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 22:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774590530; cv=none;
        d=google.com; s=arc-20240605;
        b=aJ7S+HyviUqeLd+GovYQoHKiUGBv1t5M2N4pLEOHpQiaU2YzklsPyf+Nz7HGe3UIET
         o8FFuoAmA5a/mDj7C35eGxqxqbxkN0iesOFUwjwd6556nBPU6wcZfaWS0Awils/3tHOM
         P6OL4vDar0Wka7Rz1f3PXkWTgjR+QAY/mmI6uCur7hWZ5Tj8A3DxTXR8aiWzm/q64AED
         4lIH7X3VDkkSmcdcQecGEEOdqSzSo/p2jiTP+FKbZK7KRItCWKBZ0MW+427YJ9UVIJ/j
         Zcq0NEJLXry60JWz/aGYbhL2RRCuAaug0GLibciFdtwC42dvisi2CoMberDSOrrl9YfY
         SKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qpLZngxvD5vGzgjAq9F8kx7Hz38KrclZnLPXkRhlc4=;
        fh=f6W/mp8er8zJgVKGYntRpfjRJbG9rulpXJbcTvuWflI=;
        b=Xets+UoBH2R+fEok38Dk931XfwARI/Ht7+b/N7bglRwIekxKdH7LlRSR7Bh8WyTZMt
         btlGc7ck+Rx/1rMuOpOffGy10rgXNh/9H1y/RbA+wzkgqz9g5i/MjzWNKOPF+2OzhQYx
         n2jCVxuy6WYPIbbeo9CRT2jpW5SJUniL03Y/0ia4FKSLyV4G1lV9kE+/ZRojxkM6EB66
         rkMNmTs6Uh28hPJIRxQwTDSj3N+E0IAYMbPYgGJQQVcbZEKPkAD+6B3cQixBw7SL9weJ
         0QItI1Y81wxIQTiT8xGUBgjWaSGyrok0ngi9edcXaJR/ae5Nz7G/CciMuvY33JYP/XTJ
         AxjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774590530; x=1775195330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qpLZngxvD5vGzgjAq9F8kx7Hz38KrclZnLPXkRhlc4=;
        b=UXWukAzCBf/pVZcZy71Aaec46q248tHXRYiT/BItko1K78IyDnverVYNNVlOSdwSLu
         b7GEGttujM9R1k0JYba2rktOPv15bu/q18Q8W7kQEg4/wvJpSXzKOu6yKkYUf4Jopzag
         WcZ1jQiZuXL4cK47feOczlpYnOpP8JQmb2//A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774590530; x=1775195330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qpLZngxvD5vGzgjAq9F8kx7Hz38KrclZnLPXkRhlc4=;
        b=WG6C1wiASF78J7kYMLVNefsMXatm4Mh+T67YNxt3Hyr4YoW09XMtOuMB0gAjRafzmh
         i1+02fd+RHl92k+3HayMyGFkX8TnvAp6FcFiuCqsjAFqNsbUHga7cmDlptUvmNBcSPC+
         +Cq1FXi6zW4uZTvX332ovn9yT+muUxYg7MQ9PHbrKxdj/QECVC1pYtrX9q6HSgh7S+rd
         iNT6ddpGd+pgNDNnS19qzmuput2XzW4LClMj5RZss3HfF4vUFGw/aGK9C7zgzrgWqTI6
         tHNCgq4Mr6qjsEQkHpiLBqFQdisr0vCw5Ep3o9pRbePO5Xw3sZ/OnyenN86VqyV7gAEm
         HDVg==
X-Forwarded-Encrypted: i=1; AJvYcCVlgQvs0yhcfDBvvH8YDuiXUQx3+XkCLVnIDQvyHfl0hH+ZX0Q6yPyWmKl2ZteebAT7YxCMMni9IN5c64gdxSO5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf7iep6oyad0jqlzTT9h6vQR5QFZZzOGQGib0G2ZoJAlHOl3sj
	9xz/IEODKHYZtwvWmqZeuWWKGwErOkaN0QZ35yf9eCQBu/YeWltmE1CNfOOMqXWMCy8CaiEHwze
	FAD8w4OvJXhg8X9mSg4axdvkfc9RQDIkcCOGZ5ZGa
X-Gm-Gg: ATEYQzyJh3YVVPBVFS2tWRUpIcfZ+v42lhTm97XjPbSLdatVBw7uzosAoOoJ6ejFLOL
	AxyQUJYBiycAOk0VPhNeR+rX+5DBuoA3KF8fEOB1w6WGzx4Yg/oUNlhPw14KwiW+kHCbKVGvGbd
	pgr+qh4mSVmIL8meBBUY07ibiHH0meNnGAps0MOJRNRULkqEkbHoYGUZE63hSB0+hxwcEuNPI6F
	mD2x/w31GmaDbLdJ0CoK9MErupzNVoHVD7dYOIwyHGSrSUjv6jhpUFsJ8Ucqu9GEtblBZ9f99zg
	fjnOQWZsIhJ318gnoh8Pd3Vfp3tClXHp+gPTjHnKU9dHspJ2
X-Received: by 2002:a05:6512:1381:b0:5a2:a174:8958 with SMTP id
 2adb3069b0e04-5a2ab92ecf0mr476484e87.35.1774590529804; Thu, 26 Mar 2026
 22:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260326100248.1171828-1-wenst@chromium.org> <20260326100248.1171828-3-wenst@chromium.org>
In-Reply-To: <20260326100248.1171828-3-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 27 Mar 2026 13:48:38 +0800
X-Gm-Features: AQROBzARD5T-N88wRerzc6s3uT8QWrLP8JTHwtVEEck-nl5IEJvH7p2VWcn5d8s
Message-ID: <CAGXv+5EsqS6N85q6e+t1zYt-58MR2rRUUuAgeW-4RUWTYc0Cgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/gem-dma: Use the dma_*_attr API variant
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_224852_093767_6248720A 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, Mar 26, 2026 at 6:03=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> From: Rob Herring <robh@kernel.org>
>
> In preparation to allow DRM DMA users to adjust the DMA_ATTR_* flags,
> convert the DMA helper code to use the dma_*_attr APIs instead of the
> dma_*_wc variants.
>
> Only the DMA_ATTR_WRITE_COMBINE and DMA_ATTR_NO_WARN attributes are set
> in this commit, so there's no functional change.
>
> Update rcar_du_vsp_map_fb() to use dma_get_sgtable_attrs() instead of
> dma_get_sgtable().
>
> Also change the dma_free_wc() call in vc4_bo_purge() in the vc4 driver
> to use dma_free_attrs() to match. vc4_bo is a sub-class of
> drm_gem_dma_object.
>
> Sub-classes of |struct drm_gem_dma_object| can also set additional
> DMA_ATTR_* flags if they choose so. For example a sub-class could
> set DMA_ATTR_FORCE_CONTIGUOUS in certain cases.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> [wenst@chromium.org: Rebase onto renamed DMA helpers]
> [wenst@chromium.org: Make vc4_bo_purge() use matching dma_free_attrs()]
> [wenst@chromium.org: Make rcar_du_vsp_map_fb() use dma_get_sgtable_attrs(=
)]
> [wenst@chromium.org: Expand commit message to mention that sub-classes
>                      can set extra DMA_ATTR_* flags]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> ---
> Changes since v2:
> - rcar-du: Change dma_get_sgtable() to dma_get_sgtable_attrs()
>
> Changes since v1:
> - Rebased onto renamed DMA helpers
> - Made vc4_bo_purge() use matching dma_free_attrs()
> - Expanded commit message to mention that sub-classes can set extra
>   DMA_ATTR_* flags
> ---
>  drivers/gpu/drm/drm_gem_dma_helper.c          | 26 +++++++++++--------
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c |  5 ++--
>  drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
>  include/drm/drm_gem_dma_helper.h              |  3 +++
>  4 files changed, 22 insertions(+), 14 deletions(-)

[...]

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_vsp.c
> index 94c22d2db197..a4896096e3bc 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -291,8 +291,9 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struc=
t drm_framebuffer *fb,
>                                 dst =3D sg_next(dst);
>                         }
>                 } else {
> -                       ret =3D dma_get_sgtable(rcdu->dev, sgt, gem->vadd=
r,
> -                                             gem->dma_addr, gem->base.si=
ze);
> +                       ret =3D dma_get_sgtable_attrs(rcdu->dev, sgt, gem=
->vaddr,
> +                                                   gem->dma_addr, gem->b=
ase.size
> +                                                   gem->dma_attrs);

This doesn't compile. Sorry for the noise.

