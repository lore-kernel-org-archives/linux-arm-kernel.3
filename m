Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC0DCD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UFR5yeANXS1ym7dwBfhF3G3wNluixUtSkJDeWkxZK0=; b=G7NocLRK5cNX/eoqhxh2mh0hsI
	V/hroi15Y6k3KIWcEWcyMhEPH2+dNhKkzrEpbqxYo2O6JeENp45EV52ZtWGlOIQB0PZDRsCSfZde6
	dGvGI3kZzRxXo/Gh6rM6O0JJDXVeGmTV4bDFfipz3swEKxeEZuaidc0Ue40tJ81rUOc0ktQzkSVLc
	a26L74xjl+7IJzpCEyxSOwSMchNATTClf6LtlN12xvBLv7BkK/WyRHhOON/qfrx84ThjijrsjMJks
	bb+5EdFOoxsXIqpeWP9mtG6b2POukOmPNKlFCkbbGR2lVV6jvRiuid3jBgPj6biQAnlFTNDfa171v
	SkzsrHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgyL-0000000EbL3-0wP9;
	Wed, 03 Jun 2026 08:29:09 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgyI-0000000EbJr-30IG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:29:07 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eeba68948so4704416f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780475344; x=1781080144; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UFR5yeANXS1ym7dwBfhF3G3wNluixUtSkJDeWkxZK0=;
        b=NhgCkXaREwxDeGE39fHxIrsFAr5ecoHlZ2GnmK1X/X6qwn4OOQaFlaFh7vsw/WLsBG
         XYWgxlPzTzp7K1mZEwS1zAmNx3SGMbxAUlHNxDYEuW6GMxqwMrpl5enE2iZCBj+hx4sj
         n0Y3IbB4+n1vt9SwSrpGr2WQbcv6QQ9TiXKbKNF28J19IF/wRZjEgtZQZ7SUD0BTr6s+
         6KSonFr4nMMGTmYqWxruTOMOAphh4ntnPqr4w0+RwrMt69cAljC54lHU4TXBNTbs68dz
         d3CGVP3HKfIPp3d+YOgYLq3/qUoK5M0V5MijP+FQO2Iv2Hg8gWQXTP0QE2kEzTROV4LK
         qnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475344; x=1781080144;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/UFR5yeANXS1ym7dwBfhF3G3wNluixUtSkJDeWkxZK0=;
        b=Q1qQ/ohhkhgHrVqqOVR1J20mFEK+WdFkuysmhxKjdp6+XAVjaWBE28PMGqxd8vP+iy
         odaNTBVXKVkEz4aj/XXbMRNIBmwnjZIBdKlwMhcUCc1efhA5/QOBDesKRN9jX3JwXGDB
         KzG/ECsieFVJGLeRAHbCKmXfQ+Me2+QriChunYpn4acDb8jP6STeI2ywOeyAGs1xF6go
         hZeVD9D0uIVaVCeO+pFosyFNc88+JhdGQTYsovcBKdKhqEXvBCikxJ5HOIOUtveL/W5R
         7mTvTfn7IAHPIfue2uE7XY54D8WVI1nzcM03ijpFlLdB21tR7m7EPgxzwcxF3CfHp+Pm
         5vnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lJAItZzafJTdx3OtYCOO3H8hPapUyTd02fj8RJzUrLYHjjzdCws0pjNs0MT0Y1SXJZ3ghRujJiOficLX3jbkt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/dLDmPp4HDN5NL+GGSJ7k8bDCZmtPHkYgOal+JZhvgJ4CmAMa
	XcCZRzsbYFKpB0XKp+f1jvfyOZMTeUL7+gRmjujMOU0xZVfwR6gA5qjnOz+pAQRqcRo=
X-Gm-Gg: Acq92OGCRGRCdlMzGQppClZ9DVk2YDKohjc+cSEe9mL2Y73yTzX1y1VMtnZ/JqCIv4N
	Vs5bW95qmo5oBSigFEZsGhkLGGsJwmoJySbZns7I4kbpLEqi/6rG5miVby6kqQKm36oKzJIZbL6
	h6vKl0U6DYOjYwsT5/GCKeqKzfnchuf8wDgyhzGQzMuyw9n3HVxs3+mhr9XNa1eJSwBdZ8I5nHo
	E1hzrl+f5GH1XmLhfP+FFWGYQ5B5vrwsFNbKx6Y8NGbE3ZHYp9GmskKrumT6dmrGRKy39pw9yLG
	D7Vl1cFOWxxnNNwfm4WbkizdB8qYHMepYVE7SMHCigMXIPxm5opBb0CmjNl5rorkHYdwY9Wbbv1
	duxpMdhHhB0vHHP67ASMVZ8KFw8j7nOup9jh4yzhUXXHkHpoGxrtW6K4pVKNZ2lelDMTpYStidm
	gE0fCN/qz2TLyy0tao0vm+s9h93h8uQbh9kxSa8OgXBgJsfz7XPsLekWXRu4z3oX8YlUJIegaMQ
	UVbcioiLtTWUM60M+rcpLGR4b57l6wDZ9Xu3Zo=
X-Received: by 2002:a5d:5389:0:b0:45e:f2bd:2b16 with SMTP id ffacd0b85a97d-4602182dbb8mr2455986f8f.18.1780475344302;
        Wed, 03 Jun 2026 01:29:04 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9b1c:c9e0:4645:9af0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm6191614f8f.36.2026.06.03.01.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 01:29:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 09:29:02 +0100
Message-Id: <DIZ9U0RE11CQ.3QJET21NQ2QJL@linaro.org>
Cc: "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>,
 "Lukasz Luba" <lukasz.luba@arm.com>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "open
 list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thermal/drivers/exynos: fix clock ordering race and
 shared IRQ handling
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rosen Penev" <rosenp@gmail.com>, <linux-pm@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260603013018.239703-1-rosenp@gmail.com>
In-Reply-To: <20260603013018.239703-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012906_780645_1FBBC2D4 
X-CRM114-Status: GOOD (  23.49  )
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

On Wed Jun 3, 2026 at 2:30 AM BST, Rosen Penev wrote:
> Fix two pre-existing issues in exynos_tmu_probe/remove:
>
> 1. Clock ordering race: The driver manually unprepares clocks in
>    exynos_tmu_remove() and the probe error path, but the IRQ handler and
>    thermal zone are devm-managed and remain active until after the manual
>    cleanup.  If the shared IRQ fires or the thermal zone is polled in tha=
t
>    window, clk_enable() is called on an unprepared clock, which is illega=
l.
>    Replace devm_clk_get() + manual clk_prepare() with devm_clk_get_prepar=
ed(),
>    and devm_clk_get() + manual clk_prepare_enable() with
>    devm_clk_get_enabled(), so clock unprepare is tied to the devm lifetim=
e
>    and happens after the IRQ and thermal zone are released.  Remove the
>    now-redundant manual cleanup from the error path and remove function.
>
> 2. Shared IRQ handling: The driver requests a shared IRQ (IRQF_SHARED) wi=
th
>    NULL as the hardirq handler, causing the kernel to wake the threaded
>    handler for every interrupt on the shared line.  The threaded handler
>    unconditionally returned IRQ_HANDLED without verifying that the TMU
>    actually generated the interrupt, which could cause other shared-IRQ
>    devices to be starved.  Change tmu_clear_irqs to return the interrupt
>    status register value, and return IRQ_NONE from the handler if no TMU
>    interrupt was pending.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 81 +++++++++-------------------
>  1 file changed, 24 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsu=
ng/exynos_tmu.c
> index 47a99b3c5395..5dc22006d7f8 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -196,7 +196,7 @@ struct exynos_tmu_data {
>  	void (*tmu_control)(struct platform_device *pdev, bool on);
>  	int (*tmu_read)(struct exynos_tmu_data *data);
>  	void (*tmu_set_emulation)(struct exynos_tmu_data *data, int temp);
> -	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
> +	u32 (*tmu_clear_irqs)(struct exynos_tmu_data *data);
>  };
> =20
>  /*
> @@ -760,24 +760,28 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq,=
 void *id)
>  {
>  	struct exynos_tmu_data *data =3D id;
> =20
> -	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
> -
>  	mutex_lock(&data->lock);
>  	clk_enable(data->clk);
> =20
> +	if (!data->tmu_clear_irqs(data)) {
> +		clk_disable(data->clk);
> +		mutex_unlock(&data->lock);
> +		return IRQ_NONE;
> +	}
> +
>  	/* TODO: take action based on particular interrupt */
> -	data->tmu_clear_irqs(data);

After that change the TODO comment now feels misplaced.
From a quick glance, it seems it should be moved as well to just
before if (!data->tmu_clear_irqs(data))

> =20
> +	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
> +
>  	return IRQ_HANDLED;

Best regards,
Alexey


