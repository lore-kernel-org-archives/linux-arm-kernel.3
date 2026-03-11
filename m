Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D902FFD88F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 04:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=; b=dgkM1cTxnXBlcBuC6/iyy4DJ9X
	K0Q7lCyv+kRuaZNeATApu+FSJm5VsMKO2BE1TMaVP+J33+DgP3FFBRknosW8gBxtpMl2YSDGkIScD
	S9BWIkb1TdJiNGpzgs+QxNCGE4fyVoT4K3WPI5UQIT/ZTQ8u6ZuQU9v5CY7HKR1u8XDKAJ+oloF7N
	rKttv9pdn17fT0UZdQCGn6RwhJPPeq62wVnV840Yw0bDUUMXXeGMXyNafHItfk8zyNUTXTWErMfQb
	iEDLCnFe7bbfVz3KTXIRUhiD0h9++JCx+o7sUlduDXVdGcEAsdIsqSy0ZeeKeUHO/kPF8X1DduUzS
	HOyuiThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0BbU-0000000Ajdo-0ytu;
	Wed, 11 Mar 2026 04:55:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0BbR-0000000Ajch-1sbN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 04:55:26 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59de8155501so8169458e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 21:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773204923; cv=none;
        d=google.com; s=arc-20240605;
        b=iR5JspjiZtX7r6efnp9ehHfZcX1yhxqpBGri7bSebta6C6fOnahrdexz8pJSe5Dhaa
         dyLIY6p5FE2m+6krD816fWtv1e/uC76E+4M5qB/3uzQfkuy/lGUooU3Le0YKh2eGQPVk
         coSjoehkISKcloP0PbGkLI1DvaqI8U7Zqy/UnDgD1ywzM8m2FnyS/W/zhUzUKZCJNozu
         n6/K8lB+vtemR3IqHoChna4oZ8sdzx9Yno8ZYm9DVzJ8Si0LGsBCBNkTnIlU5bJkqOUN
         Gmum/nqu9RGu6TWPlTFrL4WGqnC13HdcSHYh2QYIpL+tdzELHTJx7jXXZzwifMdQFc2L
         Ddaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        fh=X7BZcni7sMUX8gOgWyMsjelKQGOKauRhbUVQLspjGho=;
        b=VlLOY4YkWDQkV72HjnjIC1QuVqdynnYTLSzw2ZDuhK/4YtZp09JYTHSUIip4hLN4mC
         1A8a3tWYzdUkMlmCxn0S1pCZncHB4j9RU94tolYxi/89xXrNk3mePfQyLyqLKlm3aVAD
         e5e1HWEb+RKm6a0sAtV8wMZFRAha/mzAeE5f1G4p7SKmZyr/MbMAJLu3QDb7JLGtiXIV
         pAKMct/ofLMtkfyiEYn8rLAJtj4U+9n6C3eJ4nJU8sMzEVaop8drxQR7lUHTN3OQ874j
         5vFshRF/JraoQDWtcCT/dC5UnyWoQyVr9Mv6V8T+hlk4XeyPUjh28lSFOZb1DAQ3PEcT
         3EMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773204923; x=1773809723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        b=kZAdDF3GZh8whYQe8EjvyMyBgSfepbwkxXMAHva8ufIzMKd+QzomJHNRd9RVrz5pij
         /GK7ILWK7kfSx5wXMJBD1Y8jfALC25wU0mF0yoDDIoznHRfqz3P9dtAvP1AGglBiVAZr
         wziPkskhq3L9rhU4kxYXmW+FxO2k3dLRvY0Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773204923; x=1773809723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        b=Je8+kIf1yxzH3IUbdD4V2sCnBCiiGpwJQoB2Sb+muk2ANNaBF3hyreGgnNgokI6+JA
         Q6eGiL7+NzhkmGEDzGFsfD7p13mhFLFomdBX/4GfNPIphhmmhV+Rc7Rt35vJH7vT/ueJ
         vVMXvXc2dtq0AgFMOi4dA3ZCCN2zLtPetYqEVJ1Plz/3iQM60dF/UmATNGORUCgWol/P
         xcD+k5ZvYSYcg3iu3wH72A3VEQ1YvDkz5qvjmgtj0p+LK5lNSc6ZtRLgKpLHMFV6u0q9
         LHhjH0jLFXyb1K/To1qJrRlNbelcQEIuGPMAhvgXs0S17H5xOVJI1sETQoqwSs16dhYe
         s+1A==
X-Forwarded-Encrypted: i=1; AJvYcCVosoZVWGUhMmSFE//+zTqP7/qmRoAZBeR+0XOtzCBqYSbiKMaWp5caM7ZelCyDCiSd18gYWfu6/vWkPWBF/6gA@lists.infradead.org
X-Gm-Message-State: AOJu0YxHsuCDF07nLTNg8ENlZv6GtPfEsJk9Yp2YE3wN9P/Ep2Az/2b3
	Z26NuiohQUAl959v6M0/BVMAhd/qRg7E1CB2m53VuaLzGnAXMfVdGWqHPm3UfuKz1Ufq2T4qUOn
	6/LJ5XKuHF3tt4MGcElRpZ8Hlel6F04oRZMXLt9l4
X-Gm-Gg: ATEYQzxxPLjqcsYabWOHCjtpvsOeif8mt7h7kBc4T66qlzyu8aK0kwmtgI77Rwc6WdE
	m2I3Mxk+TyriDU1h44YObZsJjyFRdt3QkVW0OuFwDBd0+NtUDsXaR0KjWYxLfMnvSq9BCFN+v8h
	UFOZubbVtTdt+OV7Jsk3gmfEdPt0/RMvkNLBeIO2OXfGgfyeP18ph4F0QZ0aIGBvoyuauhLJWO5
	ZIUhn7Af5l2gvew46glbQ5+qi5OUi893LnxUcmJnnyM9bCnPeTNfFsvlS+db9cIRI1YEUW9owKn
	VRrRryFAionwWOqOvJHqjOWSBY8Nwn5gNs6oXQ==
X-Received: by 2002:a05:6512:619:b0:5a1:3da6:3587 with SMTP id
 2adb3069b0e04-5a156bbdbc3mr242495e87.16.1773204923158; Tue, 10 Mar 2026
 21:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260310032511.2545500-1-wenst@chromium.org> <20260310032511.2545500-4-wenst@chromium.org>
 <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
In-Reply-To: <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Mar 2026 12:55:11 +0800
X-Gm-Features: AaiRm51TX-eh65P-jmgUubiAbXiGD5qlFS3vQBfHYDDCC5yEHtzRczjcYjc_Cmg
Message-ID: <CAGXv+5HJKjM77PdZjwUossTzrPx+LvgVaS=-sGcGNec77TJLzw@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] drm/mediatek: Set dedicated DMA device and
 drop custom GEM callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_215525_663304_6C34042B 
X-CRM114-Status: GOOD (  32.93  )
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

On Tue, Mar 10, 2026 at 4:21=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 10.03.26 um 04:25 schrieb Chen-Yu Tsai:
> > In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> > use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> > drm_gem_dma_object, but custom callbacks were still needed to deal with
> > using the first device of the pipeline as the DMA device, instead of
> > the MMSYS device that the DRM driver binds to.
> >
> > Turns out there is already partial support for dedicated DMA devices in
> > the DRM subsystem for PRIME imports. The preceding patches add support
> > for dedicated DMA devices to the GEM DMA helpers.
> >
> > This allows us to just set the dedicated DMA device for the DRM device,
> > and drop all the custom GEM callbacks. Also drop the .dma_dev field
> > from the driver private data as it is no longer needed.
>
> My impression is that this patch should be split up: first replace
> dma_dev with the dma device; then replace the now-duplicate code with
> shared helpers.

I'm not sure which of the following you are thinking about:

a) one patch with just the drm_dev_set_dma_dev() call,
   one patch dropping the custom GEM callbacks

In this case the first patch has no actual effect, since nothing is using
drm_dev->dma_dev. I think this is not a good split.

b) one patch adding drm_dev_set_dma_dev() and replacing priv->dma_dev
   with drm_dev_dma_dev(),
   one patch dropping the custom GEM callbacks

In this case the first patch would modify a bunch of places that then
get dropped in the second. The churn maybe isn't worth it.

c) one patch adding drm_dev_set_dma_dev() and replacing
   drm_gem_prime_import_dev() with drm_gem_prime_import(),
   one patch dropping the custom GEM callbacks

Functionally the second patch would depend on the first.


I still think having one single patch is better.

> > There are slight differences in the mmap helper: the VM_DONTDUMP and
> > VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj()=
.
> > VM_IO probably doesn't make sense since the buffer is allocated using
> > dma_alloc_attrs().
>
> We can add VM_DONTDUMP to gem-dma's mmap helper. [1] It's most likely
> the right thing to not dump graphics buffers and standard practice in
> most other GEM memory managers.

Makes sense. I can add a patch to the series to do this.

> [1]
> https://elixir.bootlin.com/linux/v6.19.6/source/drivers/gpu/drm/drm_gem_d=
ma_helper.c#L537
>
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> The changes look correct, so I'm here's the
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> But this patch requires a review from the driver maintainer as well.

Sure, and I need to respin the series because I forgot to remove the
deleted file from the Makefile.


Thanks
ChenYu

