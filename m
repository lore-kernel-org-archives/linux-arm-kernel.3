Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE90C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=; b=gGIa/RnvwSiyOEM87YqszdCoEu
	DcNFcgkXwbcWTjpkg/qIQ057TBAN8ZqNDh6f627Ywst+ZvRfzP/gONkPpa319nIk1VqTfxSnSUXNB
	qo5jP524nNGiLj9ggY7XUO1x4P0P5CZuSygFxnjr2kdDwIu0KOFThFlUWGp3m7lQPL9mGcUW00tzn
	2h0RNIpxlEDp3MB0f9Yl82nlZ0oEO1lQuOuS+uOP2rg+C61Aa/7YPGE/+3w/fw0ORDFfhFQt+oOjv
	W+CYahMw0PQM6WPIdTBAvTmsbSBbaL/uaMe1e/1jlNKsYMCJD3yTtO6xRo3MT7JxsJV0TgUpupDgi
	o9guaiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuJ8-00000005fp0-3CVF;
	Wed, 02 Apr 2025 09:22:50 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuHM-00000005fXk-3xp1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:21:02 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso858307e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743585658; x=1744190458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=;
        b=NyRfCJ5T1o4eAFjiFlUgvw4TysLsmut9hqOBIGv6EcUaAJLjg/WvyYMJXTaWcGubQ5
         FwDRh7N3XsX32NuWv9l0gzzYKEjyJCeeyn4WzviQtKL/ZSnzirHP9h/ADCIHtbHtEhDv
         6SQJtqa44aosywE+bpeLpiSxKQiK3+I3rQ8zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585658; x=1744190458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=;
        b=eY2VG07xBT/XOhgeqVbU0ZoYXQvmiDTJ2rWp7EXqrtGPs7/xLIGH0USMsyI4EtIED/
         Vr7XQ04RRBQMtP+AJg8pwuckpjJHep9OZg+JpVhM92TwQI49u16Ar3jKye9epmitn7JO
         d09DjDF9M++KHHs4kys4k2sGO0gemiFtFfX6Fovt+/DFjx6mfFD4XegKgY+rG/GjWZOL
         VejCcaIy1yNutjRu36bT2VGvaTOyFGgSaxSPC2BoAVRerKhAqBGs3KZBXzQ/rics9LWM
         Zf0tIKSdFSm0EiMI/7Kw8/ZkN0MXCy41Vi4R6T5uElflPGoLEiCec2ulrulUsKmhGoji
         0ucA==
X-Forwarded-Encrypted: i=1; AJvYcCVZe5z9YQSdMxicJH6dFvO3/0uq5Zmg9peA2rPpxL5Zgqk28ctkO3EV8u1djV6IPZ40N6NdwPJTTeWDz+2hmXB4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7K4+ypI320yb5ra741gYPxgzRKxODXKcmzj13+5QbIs6JvTaa
	svjCLfCy1WbhJF43NPcItf/DVp4Of4cB9esMTOBAMQK3qP9lAIY4gGIjstbBH2Ak4G1F+v/wdp/
	BKkEntxUf2AFpHp6nFXvl5oWE9NnkDQ1IJY7O
X-Gm-Gg: ASbGncv55h5Y1/fhKheWEpla3hFZIrsX+ydVOV7CaItY7zbCyVCTNrDSzMHHdgCMr2V
	Dab7Goo5T6ctfiNJGngLL16BsVIfHITzRQ/7fl9ROPkY12xMmcxaUYLPSasInuxiY6Ag3Edckdb
	lkEkaF7ND5TNbskarovuuUE+Uvp5BpmEjxBD2QkwRX47BWHBD6Ab+2
X-Google-Smtp-Source: AGHT+IFNQ8rh8uohCED3FsKCQuotU4QQf82Ifu/wJJpZo0zeWoQri2IhxtJ24b7PrATskKr8lE3tJp/lmcDLayTcKSY=
X-Received: by 2002:a05:6512:1582:b0:53e:39e6:a1c1 with SMTP id
 2adb3069b0e04-54c19c81f80mr468673e87.43.1743585658589; Wed, 02 Apr 2025
 02:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:20:47 +0800
X-Gm-Features: AQ5f1JrBOnaeLpNxIHL0qnzLitrLXH_ivJZiH5ry-mQ9PevMkY1uBQey-dy93ik
Message-ID: <CAGXv+5Fo3-5J1Tyn1JGP0+aTeCnkUJhwxiuLt71MLUp-zVSCkg@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, npitre@baylibre.com, 
	jpanis@baylibre.com, nfraprado@collabora.com, bchihi@baylibre.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_022101_007834_64A62A95 
X-CRM114-Status: GOOD (  12.67  )
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

On Wed, Apr 2, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> When running the probe function for this driver, the function
> lvts_debugfs_init() gets called in lvts_domain_init() which, in
> turn, gets called in lvts_probe() before registering threaded
> interrupt handlers.
>
> Even though it's unlikely, the last call may fail and, if it does,
> there's nothing removing the already created debugfs folder and
> files.
>
> In order to fix that, instead of calling the lvts debugfs cleanup
> function upon failure, register a devm action that will take care
> of calling that upon failure or driver removal.
>
> Since devm was used, also delete the call to lvts_debugfs_exit()
> in the lvts_remove() callback, as now that's done automatically.
>
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Therm=
al Sensor driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

