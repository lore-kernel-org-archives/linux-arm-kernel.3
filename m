Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618B5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeNLwaFo16zfbUMvLDVk5OOLd3X39XkqYnX5zvlPNF0=; b=d/PPzEUOSP9xMul8PiY2Mqiwau
	D3houb8Pj0q0ZDKY/rbDgGOF0781J+Hyj34lRdIfNpBAnjVNR5qMiJE864/0UEaVjbTC098wTJ+x4
	FAXxLa98pUIXG9X2XTjSQqFo9GNwAo4CBobhgYzVGCPZwccyw+OsiNcvF2z+oq/z4BwDHmXiro+dV
	PVQx3gg6h5+VUtf+/qUhHwQOt+nQ5Seirq5MRxmf1gqxxC4VzN91Kb5bTZFmxqOT56NRSprJaTKO4
	/5Jz0MGZ7x2J+K53KPW+mSRLo/vE7YxYM5sGmg8gxaZ5oPv12HttRZF3mT98aTtJJ+HzwTz5gV3L0
	Cyuk4MVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprDl-00000008bS7-1lkA;
	Wed, 05 Mar 2025 16:03:45 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq8L-00000008Ql3-3fmz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:54:07 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6f4434b5305so61454087b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 06:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741186445; x=1741791245; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VeNLwaFo16zfbUMvLDVk5OOLd3X39XkqYnX5zvlPNF0=;
        b=cv8P0dV3jNnmoS8motO1S7t8kB3faNffTXuS9rLLIQoredbffOZGR+ya1AoSAbiOhP
         3jbMCIr9xd2rbvXpTMT0PsQ+Rp7n0SuNlj8Yb3XRwVWqGfF4gnh9fnSQYYvzTECszYLa
         AyPol4xD/TlX+1xqUJg82qqvyY/mzH26fxcxFQnZQ1q0UrS27z3QqTURgVrFisaKhycV
         G4uL86CvgihB92zK7l4WOe/GMKtuDitRHVrbCz92Z3tIowxukOjvMCUB/vsDihCmne/d
         7QEaN17qG6Jr/M9z/q+wAXKB6UjhUOWlAMcmYNNCstabpfE0+FknrbpDGoUtz/6GgMaI
         BanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186445; x=1741791245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeNLwaFo16zfbUMvLDVk5OOLd3X39XkqYnX5zvlPNF0=;
        b=nLBgsBrsk2G7hc/6bRHkD4CIm1K8qzacg3gRLikWC04XJ45sT0LUoIdIpCs9/5W3FL
         D2zVOCX5HQbnXybGE90bc6I1tNu9b92hPDXu1wol965VFVQjkmfQuJHWmpHVgcBoUqxO
         NpzuPCPrX1sj79/61q2h/9MCdDUIbTKc+NP2t87vkmiXtuZK76P+UpYeWXXjT/gUxXaE
         sfsTEMR+J7jgutDcUVxb8GexSISPT8FYp5pxdQWEYcOEaPSMCOEKFenUWSncTExwtL1m
         hhIS9R2ofQaCWklZ0EMYk5CNvFb4lZ5UKZnKgiLq8DabMw6BlR3zvG4AfSylanXB03I8
         J7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7GrPYwGF5nLKbv7odsdNzhjEd/WJVUEOYclwTA6Mw6D9WzCTUpVvhS68pDtemR2cJcNsmVoEl9/wjjhGEryk@lists.infradead.org
X-Gm-Message-State: AOJu0YxvQEzf+ls7VwmP+gMshJzPZM8ZVADjtHwSdJpuJLqwru5PAGLe
	qjcDgzX1BexI9GpNh6rIjczeeMxReIKc6jiNaO0Jy2tr08wRxQzFp4EwEurb+UAzRksfLK2CvCG
	GzP2R8Dh7eooT8HRnQYs1P/3EFHBJARGy1Y7PQg==
X-Gm-Gg: ASbGncvZDn1cbo/SfWRaHCuDXJ0GSBqJnZ2oZNNTzysTYPk3WH8RU7x0VCmGsOy1y9D
	v355cYX13BkhzzTwTVahTzv21trL9IzUin2YN8jZ5CX+BBl19l7/USOHTX2OGVw1/6MuPNu0VUa
	xa6nc2qIrLOmDLEet8Zn0lWQVbzR4=
X-Google-Smtp-Source: AGHT+IHaRzLfs4e0s/mjCkKbOX/Qq8AuRys4/xKKYjDcoyyp0XIFqNuIteg7ybYGY5j3p+l87FS/VuOkxSFDK6iD0FQ=
X-Received: by 2002:a05:690c:3749:b0:6fb:b78a:c0e5 with SMTP id
 00721157ae682-6fda310bbf6mr42777697b3.28.1741186444835; Wed, 05 Mar 2025
 06:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20250303-fix-t7-pwrc-v1-1-b563612bcd86@amlogic.com>
In-Reply-To: <20250303-fix-t7-pwrc-v1-1-b563612bcd86@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Mar 2025 15:53:29 +0100
X-Gm-Features: AQ5f1JpdUfHmjKXFkOL_14EaaLzX4OU9jP-SAbgoA1LHg0Ze3bkxnPXr7Krf_aI
Message-ID: <CAPDyKFoTBt4g=M1rHrZEPLO1y61csy3_cHfJDANPbvV+bH+YXw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: fix T7 ISP secpower
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_065405_917185_79AEFA0C 
X-CRM114-Status: GOOD (  17.37  )
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

On Mon, 3 Mar 2025 at 10:06, Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> ISP and MIPI_ISP, these two have a parent-child relationship,
> ISP depends on MIPI_ISP.
>
> Fixes: ca75e4b214c6 ("pmdomain: amlogic: Add support for T7 power domains controller")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 42ce41a2fe3a..ff76ea36835e 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -221,7 +221,7 @@ static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
>         SEC_PD(T7_VI_CLK2,      0),
>         /* ETH is for ethernet online wakeup, and should be always on */
>         SEC_PD(T7_ETH,          GENPD_FLAG_ALWAYS_ON),
> -       SEC_PD(T7_ISP,          0),
> +       TOP_PD(T7_ISP,          0, PWRC_T7_MIPI_ISP_ID),
>         SEC_PD(T7_MIPI_ISP,     0),
>         TOP_PD(T7_GDC,          0, PWRC_T7_NIC3_ID),
>         TOP_PD(T7_DEWARP,       0, PWRC_T7_NIC3_ID),
>
> ---
> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
> change-id: 20250303-fix-t7-pwrc-f33650b190ef
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>

