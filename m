Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD95C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41B/ekEx4m/gKNRr2HYhyza2JcZwd1YnIux2XMK+KqY=; b=PzLUIIcGpzs8NY6JIaUogi4FJI
	+UXHTPq5UWS4TLIivl5Nru0DvC1rqkV+1/boIjDNCkz0FBFYQjgDEJ51n6ucKwr7Ft+ob7ECo9HyE
	J8J6LHdk22hoYvh3bxPq0UxbDB9FQyPM9kYUjlVaNoDYR2mUhhWSoQbyZAdNq6X9k9SGQoqF70w4W
	1uQhmFHjgpDK/26WU0LiLFCiUxK4cqKe7mfJlwAqY6o3IjwMm1TvDZtoSzCrINL4NDZgGzqOmISRj
	gE2ZipJbKaBiXv+b9cpdun7RM1S1M5iffQA5yjowlhwJeRxwQJfiyJQ6YxCg01iSLrT3wPqGqTni0
	p0Tbta7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7jU-00000001jBk-0P7S;
	Tue, 22 Jul 2025 07:48:16 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7c1-00000001hko-3BeA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 07:40:35 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32b595891d2so40699331fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753170032; x=1753774832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41B/ekEx4m/gKNRr2HYhyza2JcZwd1YnIux2XMK+KqY=;
        b=M+8YFF1q6Xbv0h7CaTemFK1vMOubxWGY+2QFNGfwfA97XGsqSA98iA6XZNm4WuTaQA
         8weI7pZEn1lK3VEbmjgoPwBvV2cjH0vVHLFvI1inWUr7I+0LXB4e3U/Jyujh6O/DNSqi
         sx87M5zvwoB9zHjWqj7jf1RAldZh74SGBNS7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170032; x=1753774832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41B/ekEx4m/gKNRr2HYhyza2JcZwd1YnIux2XMK+KqY=;
        b=RSaqJvosXWs6o8AStIo8dCQS2chgL7SpHRXtbEcbvga7BGKp1/kXiUy3gGiSM/dYHD
         eYpdM5HzYHCB/8snTL+7+ppTrONDvBdLdmuKplwUnEy4sE2JArPrbko4BpY7TErqChhj
         6OCeOoYxmxBHWs3VEhHlEgqnAzyH8UqSJsyUZUi/5C+IXDkMjqvGgR5dWkabNXZE51zl
         GFc1BfLqetQzjBnALajHylVPuz59oGY5b23Airz1jau8uz+/rYABONEl4ABIBFI4NuT/
         ZttmlpQvs9iWvrcs8RnFYQ0aqFN75x9BuJ/Yaij82F3gkrXWgzR+n/f08GI8tdm9LUj4
         zheQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH3iZWjKdWeDX9dXUTqCr7fO4eWxUqWc2vMltXHX6epErFYVF4kyX2r73KEsswf2K7WwgcLklfx8waiLySMMdI@lists.infradead.org
X-Gm-Message-State: AOJu0YzYzvqihdZoo6RVSuk/n4+lopfb37QelS2zrzZ8wPPuQAqVMprl
	0n2OsoX94r0dtjLMl3TWahXzt84PJ+NNAwt78U7izy7LU7MURmd0BTiQcNtTOlgxlD4qiCemtzF
	S7BAKzSa2dowb996L3aWR39rURAQ3Pwa3KVgEkXL0
X-Gm-Gg: ASbGnctGgHCVb/Rqsy9xCoPD1BGK/zXWBjTfhyFy4mEIhuIT8gxnf1FfXd3JJwljvy/
	AIgBo3kBoyQ5LK6/v/210Wu1qx9PtWcut695hcFcpz44j3Q+XpjllYY8+8A0OUXumYWDaTsn+vu
	PrPcC50pfhtqDWSKDcB35X5ur1UPfj6UoVIjM2tYAcvOh8K1b36QquhIPYaTK2bI5KitFRjLK79
	Tl4DcqAUMlkPF4mzO/SivrbyEnVUqPmEWk=
X-Google-Smtp-Source: AGHT+IEQ22SyB/ySXRKt1KC3gl7QbzYcQMLoMwBK32ZhmBBhXQtJp8OUPSRF0MOxntL5QFsaUhmhC/a9dY2DEPGCwaM=
X-Received: by 2002:a2e:a58f:0:b0:32b:34c5:225d with SMTP id
 38308e7fff4ca-330a7ae1057mr36760231fa.1.1753170031911; Tue, 22 Jul 2025
 00:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250721081459.16278-1-laura.nao@collabora.com>
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 15:40:21 +0800
X-Gm-Features: Ac12FXwHVu2xheACj_ug47v0VGmRzFUiGV73WGs8r_Guigs_NEMfWXqCZqRQckQ
Message-ID: <CAGXv+5EmigF=m1zDZ71AMv02XwyYWQxpiRpiwc7YMg=8vc2FZA@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add thermal sensor driver support for Mediatek MT8196
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
X-CRM114-CacheID: sfid-20250722_004033_800541_50241299 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, Jul 21, 2025 at 4:18=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> This patch series extends the MediaTek LVTS thermal driver to support the
> MT8196 SoC.
>
> MT8196 uses a positive temp_factor for temperature conversion, requiring
> slight adjustments in the conversion logic.
>
> To support this, the series introduces:
>
> - A new struct lvts_platform_ops to allow platform-specific
>   conversion logic between raw sensor values and temperature
> - A variant of the lvts_temp_to_raw() implementation for SoCs with positi=
ve
>   temp_factor values
> - Platform data and controller definitions for MT8196

I see the GPU and APU thermal sensors were left out. Was there a reason
for this?

Thanks
ChenYu

> Laura Nao (9):
>   dt-bindings: thermal: mediatek: Add LVTS thermal controller support
>     for MT8196
>   thermal/drivers/mediatek/lvts: Make number of calibration offsets
>     configurable
>   thermal/drivers/mediatek/lvts: Guard against zero temp_factor in
>     lvts_raw_to_temp
>   thermal: mediatek: lvts: Add platform ops to support alternative
>     conversion logic
>   thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant for
>     positive temp_factor
>   thermal/drivers/mediatek/lvts: Add support for ATP mode
>   thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit
>     calibration data
>   thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
>   dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
>
>  .../bindings/nvmem/mediatek,efuse.yaml        |   1 +
>  .../thermal/mediatek,lvts-thermal.yaml        |   2 +
>  drivers/thermal/mediatek/lvts_thermal.c       | 315 ++++++++++++++++--
>  .../thermal/mediatek,lvts-thermal.h           |  26 ++
>  4 files changed, 325 insertions(+), 19 deletions(-)
>
> --
> 2.39.5
>
>

