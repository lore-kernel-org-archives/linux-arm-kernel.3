Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA76C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 05:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzUc3cu7eYXLZesTw+qzStppD+6/bSKMRwSOeVVbqx4=; b=v5gd2tBm3V+Agv8aSh3H+TYAkl
	KEi4IqlvL+BmdM1qE5MQoBjNOL4llMe7ZcPF9751TrtkE/SpiYDR7RTNwCi03qeI/XfjywArvrdgj
	m9hiztADBfEslT0kTg5T6H0ZpXu7SkwdeVzGairDpj9YYgcHTeZjTQn5SybFsqT6kjKcQCfUxc4Il
	NxYRd9KXVlnALu2u5COXwuLEFFae2DAeBd+sZPxSJUgJUfPBePi41ZwdnnD2P8kPFVuYGVkw0gT0N
	VloeEi/YTtNlpRQJuwnZrrSl38NExfYAgT9QPCyFsxmIysfI3/ru9vTSqyLtfDYSv+OfUcESmqaKI
	xJXx58Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqP35-0000000FNmk-3ewH;
	Sun, 02 Aug 2026 05:47:47 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqP32-0000000FNld-2Ndg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 05:47:45 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so521626241.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 22:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785649663; cv=none;
        d=google.com; s=arc-20260327;
        b=mkB3W3ZDgQO2oUn4xL3mjvQ+aCwrSGcyC6yrVxTRziphfHg4Gf6xt+pjM2hMhzG3/z
         4CV5KQmrMHBW9VrHhMPkeHH10DrBWMSHsU5mttzk9pfowLwmE6LRhAjBFoCGG5bo2+Hx
         EpSBKsR0DjGaJ/Bws8ZlUv7yfEHPfA7N3WwYjfQUKJ1CAMvDbIicQjz7V8G2XfzHtC1g
         pNREbLPgH706+y6KsnNizeFAoDBCBhfR4pYeXlHaL/KzVGzLRGL6Oo6oDpM5ujOh4L1p
         nuq49lNhMrvfKy3EfAHX3377xnXU6ujZnj3rHJV2DwCtUr84UrGz7LtV6i73zP8mqhym
         fJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pzUc3cu7eYXLZesTw+qzStppD+6/bSKMRwSOeVVbqx4=;
        fh=X0Ph9nw/xsmdkopJrg+c0cxG+d5B48BGZ8jp3GHRzos=;
        b=EQ3rFxZOuHqC4/rr232sRdKZXtqqJrCf8d/qrraMakpewTwOYtzrMJRdTMAJ6d9H2v
         V2R41CpzlNxrFLwQiPBOaXHN63OmpmTmtWTQ+MBMdR5IYWHu+X/R1mUMxlxEqhSI0izb
         zn4386n9B20PSw0i56FhIARwPwMquhZzRQ5o8X3XDb3qtz9NFMONC3fbMWPtsbcPofCv
         Ra2JwjJzlTiB0PrKhkXLa+8fBmxqtO4jbIpo0qmq7oM2shMYxUm2KmPkxSqvG96tylAA
         eCGpgFHfd/HFzg33Fd8LVYMdKPXtCO8znAKEGm3w60ybpzyBXUDQdtrbDiqKfdA389HB
         8t/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785649663; x=1786254463; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pzUc3cu7eYXLZesTw+qzStppD+6/bSKMRwSOeVVbqx4=;
        b=fQH/O0BZ54pTh8Srb4HDPklrPMgrKB6W4xUgrFyw/G9YSdEFFX8Uejx1qcTsM3XmE9
         0pQyUpI9lhIMOvsSLRX/IjbSBkBSeOiPR8RmxCzHlj5PVSSSc0Xf1vptxj/Vqq6IMWN8
         9rIWdS3O3hXlCM+gYDiEJYFfcMwhqBW+FQcxhnFTc6mqZq1nMApZr+RGVyxzlqDhJAWP
         wilDteLls4mWA9tuZzchvSkKmcL8OFMwQaiSQ7t1qKp4qmH0JJBuQB1XkJNR+llY0T9A
         JQ1FYK38z7HIvfIr/Z4gSlHk+dbDOvEXuMZDxIizCIHuw/9o76uRmes/Sk4Fed1Qtzxh
         Nc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785649663; x=1786254463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzUc3cu7eYXLZesTw+qzStppD+6/bSKMRwSOeVVbqx4=;
        b=fgHT/yvFw9PJ+zXMQwqICv+3MW/LIOSZsTh5uV3/2wOKmhBoAIc8DJfWAS71NleqS5
         VBjR9n9CPLcPpS4S8ZfP7Usslg1DSHzNEi0vKjR+f/GmY549uvpFq9yBIYBKa300w2Ra
         fxv6KX7B5jNpqSpNM3v6hwoTd6wUo0pg7X4g9USq9g0CcUWndKP5Go17pVrdxffwUaNi
         5n8ceT8d0BTbXtBZxmcq6S14FJSg+Hg7GjjA80q2gTRdUYWDB9ONaL1xs1wBz46MTPWp
         SwxO8HYjQEBmXY63m4JvPmwu4Jn5cIFrZuM/QdsVuwJJB+46O8+7cNLJywZVAqhaZINA
         +BjA==
X-Forwarded-Encrypted: i=1; AHgh+RpA9UO2guES6sRrFlyxe1sj8M7exuXdf+hfUk6FTd+Du8gZwnVD/uQNSeUdzXBtQc/8f2mbrlh72lyajRfskU+W@lists.infradead.org
X-Gm-Message-State: AOJu0YyT73alhA5MhhnyIIGEh/Bfo77jJiF9oMHgV26WkXhnUKOwZm5M
	GdBuBJThqddd2+K5HfnEgFBNS9oIhWDMIAW87rVmu54rkgRgWqmb+cmOFgGZBoL/BZyLZH9HO13
	ZZKR47U4zYWbn/zCSqnSV5IHDMUvC0DU=
X-Gm-Gg: AR+sD10wt/XHL6gN7GPpu8ZyvE6vmt/PedpH2riw+8eepUIAHSCZ06Y5aOZgBggafvK
	5oPT+qroSmE/soUjghArIoRueWErFR6QZGzKzb0N/dHL1djbIj/FUWOtg8NcMEAc0THrjIFNy0b
	CUEshHLr7BXVSVFJ1pOInPgDg1f89Qp8cFAThpdCSpkKR9WijKt8KHmdldelTW2aT0hT7exIeXt
	Ksu6/fpWdJS1aplftMem1/XfsldsiM7GXOCGuO+yhbCpDRn8DAuMBQ7yyjZKqN8lx/Sa/MuQR6K
	4Fnr6gKlOkB1db/coFWcV4fmydiTg6Ry/dzeRdWsm4RPm5lWZJC3YxamsD8mXVr0oqTaqL3eMY8
	fPZVk3m3f3Q==
X-Received: by 2002:a05:6102:6899:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-75b2375d6eemr3857526137.11.1785649662796; Sat, 01 Aug 2026
 22:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
 <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com> <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com>
In-Reply-To: <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Aug 2026 14:47:05 +0900
X-Gm-Features: AUfX_mymp3gbWIvEFlOpn_puCcmLWjZUNex9N8Qxwa40WVIlIo2zevDdW66QGDA
Message-ID: <CAAQKjZM5cY8V_YaZzgF734Brabz=zwRkp2k-+b9CbqS2_Xvi2A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260801_224744_611553_036D9528 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Diogo,

Thanks for the patch. The conversion itself looks correct.

Two small things to fix:

1. exynos_hdmi.c: double blank line

> +static const struct drm_encoder_funcs exynos_hdmi_encoder_funcs =3D {
> +   .destroy =3D drm_encoder_cleanup,
> +};
> +
> +
>  static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_=
funcs =3D {

Please drop one of the blank lines. The other four files are fine,
only exynos_hdmi.c has this.

2. exynos_drm_dsi.c: header include order

> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -13,7 +13,7 @@
>  #include <drm/bridge/samsung-dsim.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_encoder.h>

Here the new include was put in place of the removed one, which breaks
the alphabetical ordering. In the other four files you added
<drm/drm_encoder.h> at the correct sorted position, so please do the
same here:

 #include <drm/bridge/samsung-dsim.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>

Both are trivial, so no need to resend - I will fix them up myself
while applying the patch.

Thanks,
Inki Dae

2026=EB=85=84 7=EC=9B=94 5=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 4:54, Di=
ogo Silva <diogompaissilva@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Inki,
>
> > It looks like you may have forgotten to post the v2 patch. Could you
> > please check?
>
> I think they are here:
> https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-1-a8d59678b7d2@=
gmail.com/
> https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-2-a8d59678b7d2@=
gmail.com/
>
> If I did something wrong tell me and I will re-send them.
>
> Thanks,
> Diogo

