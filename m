Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E393AC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmuCUeXTSBWTdXqlKd0iubpusTbKWwEzyplHp2MiIhQ=; b=guA17pQ4+PCYmrIVSzQU0u4sqe
	+rhQQEGLpXCgO4TH4znbW1eJ5noXGan7nyjJM5ncQwV6sowKLE+hFhg8PfD2C4a7bIh8MqIA4SU6i
	yEQ8+8/QOjLyh/I6NgQTCKH9AAlcE+C7LAoJAwK9KfaWYO5I3pm4tIWH1WIxn+3l+ksowH+6qZKU6
	EpIYva3WyFoSCQTkMvy8R8+G1NytfR10FxdeiT7fsWnCkXFkMiD+6MahZlthxviSn+GlF2yRK7iHu
	5y0nUYak6umie1h3ut0aPGi7plCaLn1r5DNByYV1WAEM66LClZShzdupgL93CuC4wqjGySYm8l8hj
	4tBFJudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfw8-00000009oyo-29p8;
	Wed, 19 Aug 2026 13:02:32 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfw5-00000009oyF-1p1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:02:30 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5bfaa014978so442515e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 06:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787144548; cv=none;
        d=google.com; s=arc-20260327;
        b=NUz6mm1KkCednlK1Tg0zgxhWaCkSjMVuYXsi5qUe/WTOq3RdWND3jyfXBMr4oYYuGd
         HvJbmg+MH6zm3xcVizhhcDwyMFqekPE3oWg3lYK7uQ2Jee2nxo6j6ta+dhNi0Zk4pii7
         af47Nr0z6rT+VMhgz0rYsXnY94vWw+t//BM0CY2L8BE40M10OiKCkJW/Bd5IGDyb1ygP
         cQtXc0EvKeaVOETJHAPabswmSWJFTBqUXAhaXNu3cUAqhrG5hq+nKL5cjvLoLrasFIJf
         KFSjvIjydsr9DyjtXGwshum6iqB+wZV2Y29PE60KtsDPf+SOfDzIxIv4238f5UCF1nVf
         zJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xmuCUeXTSBWTdXqlKd0iubpusTbKWwEzyplHp2MiIhQ=;
        fh=6iBDgS1ZYsJatUy4iKhUTwJ5hyXzpep5isaqBKxmmBE=;
        b=cfD6R8oMCol3UbLULQKNWe+Lw9GGjwJf88LQ9kh2cWP5xxqGdR4D5hUj7ZWlrh9VAw
         eOhFg4G9NquVZ6a3OJIecitXwgkxZtjv2dUPgqF9PUqx89xeSxziVG3S5PzDY+ihu3sI
         Meg4j0zNqdhtSkW/Hqfhpf+ehf0SZU5333z2Hled9qEx/a6wwviNN5cHXmJi7oNpzNnY
         p2hdn1WVZhtAWRwzYBR6PwJXcSEq+iVyXhkFOlCmxNT7aQTjWXatw7HzyYcNu2dZ0eVz
         GoZn7CIcVwCeUhYeRqJhsiWistbuYhJzIKtMP7X3LZXjbuP2OCHD+elJDO0Qv9ol/h5g
         4Few==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787144548; x=1787749348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xmuCUeXTSBWTdXqlKd0iubpusTbKWwEzyplHp2MiIhQ=;
        b=bI5yZMohlakIuHhb9wQ4yiVizNLIpYvyXpRVdDf7g1a94VsOnKrt30BuFscXNL8AY0
         3VpALb0M0K+TwNLpIyQ0uuRljKRIPG2xA+rruqvWQFasL7mCNfrLUWADeQ3X3JNr4c0h
         yKwOqTTz1yOMihhKfyGs+mgyTEejA7ACB7CxvkPkFu3BKZ2JqJx80Y7+y85uE51P3ryN
         cIerINm4ffzWAXFZ76TDFRtYKhlz1l7CaycXkPJf7hoMqIgi5FqDR/mU5jIoGmecb900
         GBer7JmRE3YLa8MTHuT1lL3+6m1k8HkKCjcKot1wu056plVGPqvHZzGM4LXtrpiuUMBn
         0nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144548; x=1787749348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xmuCUeXTSBWTdXqlKd0iubpusTbKWwEzyplHp2MiIhQ=;
        b=cjSAQaEcU+H1LOCeOT6vz7cGac9ODRCYL9HmaLZLYi2V2FpchPmKvVY1hL06O/QSJA
         LkYCHarKdQahrELWIuiFVrof5RLM2EI2XgA81i5LpiZz+arGHZlR09jCRgeb/S2WaH6/
         xF2uKb0x6Q0scEWLefERyHEX3CWhnbDJZst5yRxywfozkKjXHKAzsVxdzYIOYIsmvWn8
         21jF6gfM0KO05UZ+T5Ei2gqQ7LwljmCfda3DpPaoRf8v+WvUWQa6hKuhlbQBthm5nXrh
         CvwPadXImT3itZ/80xvQUN2UcIMmnqlTY7OB9giOzmrMrSCaAHGuUIrX40cF7MwZAkif
         uTNw==
X-Forwarded-Encrypted: i=1; AHgh+Rqyw416YaAmE3gMeWGRSwdmkGZ1UjXJxDwWTdVEVTH8Wap8NWlBE6koAOc8o/5/wgtMkGPgPUonkytOS+fusOHC@lists.infradead.org
X-Gm-Message-State: AOJu0YxoubJkT6epQRLNXOQvBv/GiebRCDVT9B2jame4hLKMaLm8Q3Qg
	d8sPV8lqEw8slKTZ2aicAaupaMubQPwr/s2PjALn3qrKbVDiDA4f8v24g+zHZIOGmRzkQk90anB
	BQkEZMf6SQIjU0Tm4MeH96YHIfIwJLgQ=
X-Gm-Gg: AR+sD11UJlk5zOzVmkkW2JIF6wrQJXPMqUxIbSp5zJCFFyk1Xmy8k25zIG63t9yQMFb
	fvz1fndq+qRCpzU0NUe5iaWfocKTNqCixiaHuEN0NObqiVPiCjvf6D8meMDWnSiOr6LPhDr/9xk
	AxQ5QwitoFZTSrKsw46n4xXGLd5WfyqQ3HfwDnAcdUnubxcO9tq9DTOB+hOmPKQKVAQh4k+bxsw
	U8r5VatTbMPycjiFim3U3cU7WPRMjLpATJ+ItPJMk2t2cFRyUSHDfNC2wc1xRkzZGrCl1sdo0n7
	Tyg17SHSKj47kCH9GsmsGZLjCpSxj8CA33ZQuAe65z9et+wxwr31EnZUwqStgB2B5T8wEVw7B4Y
	=
X-Received: by 2002:a05:6102:b0b:b0:74a:b1ee:e034 with SMTP id
 ada2fe7eead31-777f958372bmr1298668137.8.1787144547953; Wed, 19 Aug 2026
 06:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_989057BAD94EB58027BF7E9528F59A458608@qq.com>
In-Reply-To: <tencent_989057BAD94EB58027BF7E9528F59A458608@qq.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Aug 2026 22:01:49 +0900
X-Gm-Features: AcwNN1Uag8K76WBZkAil604Sve_-nPS221p9PD--DnEWCdbR_HfRd-PUmUZjhKk
Message-ID: <CAAQKjZM_Vgx-MGNP45-yQhZzV-H2ccLSP6pWYaykU5KxLMVKfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: fix clock leak on resume error path
To: Jiawen Liu <1298662399@qq.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_060229_482257_1F460320 
X-CRM114-Status: GOOD (  13.29  )
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

2026=EB=85=84 8=EC=9B=94 18=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:46, J=
iawen Liu <1298662399@qq.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: jiawen <1298662399@qq.com>
>
> exynos_fimd_resume() can fail when clk_prepare_enable() succeeds for
> bus_clk but fails for lcd_clk. The function returns the error without
> disabling bus_clk, leaving it prepared and enabled.
>
> Disable bus_clk before returning the error to keep the clock state
> balanced.
>
> Signed-off-by: jiawen <1298662399@qq.com>
> ---
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimd.c
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1325,6 +1325,7 @@
>                 DRM_DEV_ERROR(dev,
>                               "Failed to prepare_enable the lcd clk [%d]\=
n",
>                               ret);
> +               clk_disable_unprepare(ctx->bus_clk);

The analysis and the fix are correct. exynos_fimd_suspend() disables
both clocks, so leaving bus_clk enabled on this error path does leave
the refcount unbalanced, and clk_disable_unprepare(ctx->bus_clk)
restores the symmetry.

Merged. Thanks,
Inki Dae

>                 return ret;
>         }
>
>
>

