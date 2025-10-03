Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF86CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 20:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=; b=iTiRZaT6g5OMv2IlgINW0yAnB6
	jf+iX2NxitWr9tnUjT1zh7Qb6MMRKpC84kWLOTJUqW041fnE3qwy8KCNP9zH0wK4EQfqYymiVgSA0
	ZbT1q9UwtbYNN2DjwR3mv9tIeuBaSUjRgciUIbgzB3ZBv4+DJinEsxhhJJj4yhi+9UlZTC8gzml71
	72c1ODm0ilcQL2fm+An5kSRyIhhOOQ5wL8PeNSpSaeHAPzO0Ii+6iklgcH9gZZLjijs8qWznoIKCG
	xDF/dq5fssyQQxPFS7qx8UZRK9M+BMLwhVFqFSyiz4LCs6i2CeF2Jhurq6MpYnPGfTccHV+5kTkEu
	naad+vXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mh1-0000000D7Be-05dy;
	Fri, 03 Oct 2025 20:47:55 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mgy-0000000D79c-0GTX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 20:47:53 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-71d6051afbfso30556587b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759524471; x=1760129271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=;
        b=mcPZYozbWFVo0pStj0/+1GzChaAOXUEWOYG9V8evrsZSqZ3PiJCvvL50dl7SKbpv7g
         xiW81sbdnwkYXGQvHQw2zmomVrkGlvtm+cY88jHyVvxuAXd3WuidzI+BCEF1UWR4+52T
         lda5LOKsFn2yiq5MDFHYsD7YIUOy/VUSZHtc3o5znSYTRiJKTIIpfUEanT/BGx6ljfTs
         zRINw3EYJpy6q/V2tq7VFmb4RicqshhQTiN5k8mMbqVK/2QKbyR9JCG9AWr/cs+gBE7D
         RptbP+GslQkBEMLITOcZ4p+8l8NEFOvBgfD8niy3gMlFuZnqQ2aot8c1FBZeuVbScmmn
         RBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759524471; x=1760129271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=;
        b=aiSdf6hoONSKlFi4q12KTFyE5YJvCq5cbAqhp9cVQ05JmZnT+LhV4ASHSCa4OiKhnh
         Y5aHVdPAF82xBBygOmHprhj1KlVAoFgBuE904w65trgF5YFYtKstdUMLuT9buh5mU4/V
         h3cinYtFrDeFrWbN1pCIRZhdMnOpLuwe2EeqF5zZ7JFZrBagcsJpjJ5s8rPvoLDKnU6T
         t99ILidfo3lVQj4qG4IIiN8D7dDeIQ+d1olvYQpvKHn0nDW25eKq3VGAb4TObRDFzv8V
         AgavmGcMfjBNLdl3UKFFog7kNeA0yFi2m80hsJAgoYd2k92aNeAn3v/+ZYuCy3A1BJB/
         SGUw==
X-Forwarded-Encrypted: i=1; AJvYcCUwU/5CdczAWH6OAnuyYLlFT4+nLExMPIWat82jP8kaADycIEJLLClxkjjIq+R1XKQGNNOiMtBHH9tcfWxIxqyT@lists.infradead.org
X-Gm-Message-State: AOJu0YzFnf7M/yRFsvUe5FZp6QF/Zc5hkDjOwnxRz0B11gQMz0qi7P0E
	vu8bXdnGWYBLxuey+AHg/F8noGG93GXHE/hMaUUyB6MYPBE+Ai0vtAEgH3kGcGNwuvQq/240eJz
	UwSvpfipJlbl5qYrDsoqxJ/cPafJVcag=
X-Gm-Gg: ASbGnctg3n1AnJYduISuimkpXLsxmYfDkHNPzioZIZixfsI7d21AlkgyvvdkEpzrvUR
	Mw1GLs28wN20xpcl1AV9pAIBPbYGqQjwJ/PBHGf8T3dslJyT0GLVwK+r7qyjXoHnn+ZR3GkzqPs
	OYCxGGq/+x/9Az/xNe/m2tby1nOYYRoe6d4VnKkhcklZHm3cuQn28ToRACXFBRLTc3RAJeXi8WE
	OStZgStGtJ69yRp8pJ30YRfWqcG4fVTU9a4/uAEqtQaHiFRYCKWPNSDfxvnyJxe0vMU5G7BxdsW
	ZV/ULwwX6YH+rdl4rK7o8A==
X-Google-Smtp-Source: AGHT+IGbRtPbh98BClkNFwaUaMJb45w8kt4Jk0KxRGScag36Tw0xGWcnBknxDwxYEhQPRsDsxQjX2aqyBPDcA2KuG7Q=
X-Received: by 2002:a53:8550:0:b0:638:53e9:bab0 with SMTP id
 956f58d0204a3-63b9a0ee753mr3639824d50.24.1759524470895; Fri, 03 Oct 2025
 13:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com> <20251003-mt8196-gpufreq-v6-6-76498ad61d9e@collabora.com>
In-Reply-To: <20251003-mt8196-gpufreq-v6-6-76498ad61d9e@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 13:47:39 -0700
X-Gm-Features: AS18NWBGD0pXXLOymrZv-_f8nOh4HIhBGy-SAER5xKOoIW_DOui92j81TfsOhUs
Message-ID: <CAPaKu7Q==RvuZR-pgJekF++Y4HOdkryEvYV8QGJd_os0_if_vQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] drm/panthor: Use existing OPP table if present
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_134752_127377_E194F9CE 
X-CRM114-Status: GOOD (  22.01  )
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

On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On SoCs where the GPU's power-domain is in charge of setting performance
> levels, the OPP table of the GPU node will have already been populated
> during said power-domain's attach_dev operation.
>
> To avoid initialising an OPP table twice, only set the OPP regulator and
> the OPPs from DT if there's no OPP table present.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 26 ++++++++++++++++---------=
-
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 978f193a2aee561fadd9a976e9b1417118260889..6beb6170d6eea3dd65880dfe6=
4a61abbdd5f08da 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -143,6 +143,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev=
)
>         struct panthor_devfreq *pdevfreq;
>         struct dev_pm_opp *opp;
>         unsigned long cur_freq;
> +       struct opp_table *t;
>         unsigned long freq =3D ULONG_MAX;
>         int ret;
>
> @@ -152,18 +153,23 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
>
>         ptdev->devfreq =3D pdevfreq;
>
> -       ret =3D devm_pm_opp_set_regulators(dev, reg_names);
> -       if (ret) {
> -               if (ret !=3D -EPROBE_DEFER)
> -                       DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n=
");
> -
> -               return ret;
> +       t =3D dev_pm_opp_get_opp_table(dev);
"t" is too short for a long function like this one. We should either
rename it to "opp_table" or refactor this out to a shorter function.

dev_pm_domain_set_performance_state is new to me. It might just be me,
but a short comment explaining that the opp table might have been set
up by the pmdomain can be helpful.

With that, Reviewed-by: Chia-I Wu <olvaffe@gmail.com>.

> +       if (IS_ERR_OR_NULL(t)) {
> +               ret =3D devm_pm_opp_set_regulators(dev, reg_names);
> +               if (ret) {
> +                       if (ret !=3D -EPROBE_DEFER)
> +                               DRM_DEV_ERROR(dev, "Couldn't set OPP regu=
lators\n");
> +
> +                       return ret;
> +               }
> +
> +               ret =3D devm_pm_opp_of_add_table(dev);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               dev_pm_opp_put_opp_table(t);
>         }
>
> -       ret =3D devm_pm_opp_of_add_table(dev);
> -       if (ret)
> -               return ret;
> -
>         spin_lock_init(&pdevfreq->lock);
>
>         panthor_devfreq_reset(pdevfreq);
>
> --
> 2.51.0
>

