Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C56C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvD8IUqr+Bzg9GKWiYPMFuwvqaPjoCioCLoAukeES3o=; b=eyrX5dlr4v7H6QXyuNgpeLGhSm
	j2EQoYOdLlcnBa4HB5UhV2z4/TEWKt02QvTuOXgCJazha7tgIuJyr5R/gTCK317lQu+JNxNpBUgnW
	wcY4Ntt4lPxy+BUg+NGduhP3GkJZTQDkk3qbeAxyO5CnbYw5mna8+vo2IUosPN0pG0alb/oLOQD3E
	QBDMPDVNw3prhY/VzpL+OewyUkvcuGryggpt/enG/ZV9EpF03S8naoVwr3Ypwj7f7fbrtNf+ACdOG
	EcdITBfbtG2PuWzRqxqCu+FYq1WN7j5YJWZDocxqWBnXA77HgYkOW0mOTUHOA/gDRq2ZfkYHZeRtv
	14lJYdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq0J-0000000HIIT-1Jvf;
	Mon, 21 Jul 2025 12:52:27 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoRS-0000000H36K-0Ylh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:12:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so37485751fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753096340; x=1753701140; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvD8IUqr+Bzg9GKWiYPMFuwvqaPjoCioCLoAukeES3o=;
        b=gtODH4aed+y4EjYArTW4ziDhY9S1HqOqj/mtYrHzeiqLapuUzL8wlThIDPwZnIR5LX
         fJj7sZ1qSwVfOr19ir3eN3ULu7Fgt9wKwaPyNFDuxdFmKb2hroHwRZ92e+zhmIyBSZla
         8Zyqthm+B95pQl0wTuGaQL2n8W3vMBr1keQCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096340; x=1753701140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvD8IUqr+Bzg9GKWiYPMFuwvqaPjoCioCLoAukeES3o=;
        b=i1k3OdQAD3BOtOIq7EqMA3CD9Fr7uYI/5vqrLS23HFM3j1oUaYtirXMl52a9duPHqx
         ifJodYUYW4AF/nwYp21+K8GT6sgwM2BIcS4NAmbcmmNu5hnpg8Z8dAJnZud1dFq7hVst
         6r8QDztmQRIYHsv96Z+MsgAivzAy34yCkKyolD1HaG34nC9QPNaMCNMREqWUREpoQ7MT
         ZTfRAxaSS4ZRmy5rzxuG9w5H5tlwVPK8CcCypxtAbNpvniKPjnjLyWZMp0JimJkD3qrt
         XwpSMW52+vN1mtkjZHmsB/yvysoaFvkRlu5sbK85L3hZYEjRHyPh5Sib0eSgW1z4/Qp7
         nYJg==
X-Forwarded-Encrypted: i=1; AJvYcCVtLjf0ts3PMqrLl4Jnq+ylsMie1u1yBSnyOjOG3nj5EsiQ+ykUQvWULvp1geOfUc2gYBC0QLlf2f9WfznvXFs9@lists.infradead.org
X-Gm-Message-State: AOJu0YyKqEUQRJOxxiJMuM328iQUzTuuntrCcw3FfpE3zT1kUruN+pLe
	O2rcKtNsVeM3b8C6sKsvRZp7R91CfUq+jIIXZSTgBLyuUr0XwuSaeF6uQeLuBA6NnVfMkPAMn/y
	d3eoDB99x0EbmVd7hgBD1n/JLDs2XgfXMBeC61aM0
X-Gm-Gg: ASbGncvwCUNoSxua3jGXnB6UwO63f8e5lr3ipbxL2hYJA/VAA2wVndAA4GqTsFD230v
	cXEzqguoCRqtDXrJiuBOfSc9V1L/yMVLe/n4t2c9vfvQU1SSgAE9xYQNjUxas8xjRP5e3e31qcZ
	efptoq/tWqzIF9uRVOWMa9BlRH915Zt1mCVcD8WCZEI9gg2AlYdkdi7bnUmhDqTlQdanFyroAhN
	rxiqejFRy0kwaPqwWoCtWmzeNpaI9dO4A0=
X-Google-Smtp-Source: AGHT+IFBcIrODyu5ElS2DkB5XwLAm0Yi8m6vfMTv3g3vNlbCwrZrTFNYjxARMwbJuH0gzP751/Mkg4oUm0Irdkz6hQA=
X-Received: by 2002:a05:651c:154a:b0:32a:7270:5c29 with SMTP id
 38308e7fff4ca-3308f4c5293mr49883741fa.2.1753096340224; Mon, 21 Jul 2025
 04:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250721081459.16278-1-laura.nao@collabora.com> <20250721081459.16278-6-laura.nao@collabora.com>
In-Reply-To: <20250721081459.16278-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Jul 2025 19:12:08 +0800
X-Gm-Features: Ac12FXwjyLsGb66oW3wQunTIZj2TIT6qrKAAeEzwRJZc_WREeNFVgKGeEo3jG4M
Message-ID: <CAGXv+5F9NwJ7uGFPWZM-Dywbbk4f6aiYS5M4m6_VFETVGEwr9A@mail.gmail.com>
Subject: Re: [PATCH 5/9] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw
 variant for positive temp_factor
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nfraprado@collabora.com, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_041222_181129_04E7E503 
X-CRM114-Status: GOOD (  23.39  )
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

On Mon, Jul 21, 2025 at 4:31=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> The current lvts_temp_to_raw() implementation assumes a negative
> temperature-to-raw slope (temp_factor), which holds for the SoCs
> currently supported by the driver. However, this assumption breaks on
> MT8196/MT6991, where the slope is positive.

I don't think that's really a problem. The formula is:

    temp =3D (raw * factor) >> 14 + golden

If we move the terms around we get

    ((temp - golden) << 14) / factor =3D raw

Or

    raw =3D ((golden - temp) << 14) / -factor


The calculations should work regardless of whether the factor is positive
or negative, as long as the intermediate and final values are within
the range of s64.

> Add a variant of the function that inverts the calculation logic
> accordingly. This ensures accurate raw value generation for temperature
> thresholds,avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index db83137c7537..3c34956e37c1 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -296,6 +296,18 @@ static u32 lvts_temp_to_raw(int temperature, int tem=
p_factor)
>         return div_s64(raw_temp, -temp_factor);
>  }
>
> +static u32 lvts_temp_to_raw_v2(int temperature, int temp_factor)
> +{
> +       u32 raw_temp;
> +
> +       if (temp_factor =3D=3D 0)
> +               return temperature;
> +
> +       raw_temp =3D temperature - golden_temp_offset;
> +
> +       return div_s64((s64)temp_factor << 14, raw_temp);
> +}

Here you have

    raw =3D (factor << 14) / (temp - golden)

which, barring integer arithmetic limitations, is actually the
multiplicative inverse of the original version.

So I think the commit message is misleading. It's not negative or
positive that matters, but that the hardware expects the
multiplicative inverse in this version.

(or the downstream code is just botched.)

ChenYu

> +
>  static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>  {
>         struct lvts_sensor *lvts_sensor =3D thermal_zone_device_priv(tz);
> --
> 2.39.5
>
>

