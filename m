Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48333C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 04:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwedNykX1uMkjq1G07l2poxKV3lFWdGMwyK077ctHSU=; b=tMiMFVMiSxwXQZegtDOckqdThG
	y34+JiQDw2JwS5m4Dc3075Z9f1cbMyBOByjfF1rBii7YmNc+/a1IGYVnv04260rcCntbib1pMueI2
	BMkJPOiKJvUbQJWz+OMm+PS1uuVOOAsbeQkrQQRXv2AYuXyAD+z2mGxhiQDNBO7bWT+GUAxqhu7KV
	o3pxO1/cbOTzju4vSOliko4jPMwVb4ZUy3Fkn9KqL6F9qfhOmCn9BgmY6GBUBJEtlwiLgoXivvch+
	BfWo+YBn1KNhGuN3qjf/xzI+gCx4sFUp9MN6AM1JuSn/wFAIYjIpGj2J86K+CcE35OwVlhcX/6LGn
	TBnCQ8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui44W-00000007Bgo-0lTB;
	Sat, 02 Aug 2025 04:42:16 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui41p-00000007BT6-2kb3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 04:39:30 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71a27d982f1so24188707b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754109569; x=1754714369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwedNykX1uMkjq1G07l2poxKV3lFWdGMwyK077ctHSU=;
        b=oOq/MD7ipPexPU4El5IL591XDi+p90qBRelYe8z7sYSi5XrxIYF6xIkHKanbub9YXe
         H/71lk0fxybjQSAZNW0jzJPe5AxWLhNsasNF8oHvj3E/xlduQwWFhVuc4NCwOAqPw+FZ
         0+WJLU5FtOxf2CxZDIWeVLERPFLf4bbXdxypsB6aS37O10nc9TeXLfymNLCdhjPfO8Sy
         OaVmi/8IU+2hdrEU+THlcT8HYSmWZfn+xbrau2+pym8bU//IyrTtOf86TvbIvzevqXrx
         DU42GtyCFgCuy6vL/RtpXDOYBwCN63elhkyyFTmBxeiScqDf2/1QIEGJnvUjsEtYQfxx
         zogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754109569; x=1754714369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwedNykX1uMkjq1G07l2poxKV3lFWdGMwyK077ctHSU=;
        b=pd0z1hHZFXqQzzMKmH5OjhR0mEDf4DvV4ovljRLHTCGkP0XZo0S8ErRAW8CONhIVV6
         IvSs8mNrRliULNPkWlfHlbOmgGYB1Msy/wUpujTVVDQlDVzEycjx6KFim1mX+C5GV3xl
         KiXBmKvftMGWgSMwlKSexFZPAQWhGhNaxr/tBowi6eaTB4Qq/28YCGK8Wq3lbutoRG0n
         KIT9sN1uAEHMenQxPZBac53e/eLjC0CJ85/awnHZdshDo8xMwgx3D2w1flR/hSJGilIj
         hGTuzFFBh1S5AWOVEaOe3hEZvJMs4WMKIEkOxt+x+BTwltCNzFN5XKENXfvHMsDs4qZz
         VMIg==
X-Forwarded-Encrypted: i=1; AJvYcCUQY/8IXZ9/zl10KjW3qQABPsAaxsXatEIRwna3bZQg1JuWKqGcdvSl8D2Rm1kvACPvnSPGufnXT77jHhp6aLK7@lists.infradead.org
X-Gm-Message-State: AOJu0YzylUOOHKDEkx//Zp+zHJjSP2ZvEuzHJ7yhRt4HxxyCN8+Cr7UK
	WWFtPRSTal+44toGtHCkEIucP3cuaaCF1fIm30VcI+9KEO0yQv1551fhLhbIe7M7rKNyeuvJ0+R
	wyDVRUR/JXh035jIYXJJKbV3QmPAZ1Esz2X+orqllVA==
X-Gm-Gg: ASbGncuVvmlrpGQJAE1vv0DNUJfZZLksTQc4HfhvxZQX+AEXCEM5tXj1qpyKinjO2ar
	7QzNeUeVGmwlvzI5QfWNV6LpUnHLiaTHSXdKvqxpTNaZPnci47BG/Pt6ysso33ktyMFt19zXCdY
	GxCjSDXhI41jq5s0cPfhXJ5tzOgG4lL/VKzd6xx/Y9d+eH3yU+ktJRfWwV5TOkIQdaSBf+TKmzR
	YPOS/6uOkshZHiw
X-Google-Smtp-Source: AGHT+IEHE4XW/c08xnfJpKw584beuzxAr7sJRcO6jVJsJ6rlMG13mbhm7ts+7ePCLEPAybkCbOBp1u2oY29yCQQpE9E=
X-Received: by 2002:a05:690c:d92:b0:710:f46d:cec3 with SMTP id
 00721157ae682-71b7f5bc0cemr24750957b3.5.1754109568692; Fri, 01 Aug 2025
 21:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45@epcas2p4.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-5-sw617.shin@samsung.com>
In-Reply-To: <20250724080854.3866566-5-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 23:39:16 -0500
X-Gm-Features: Ac12FXzXiIgqxqB3CLv0jhcuQWL0uuYoB3Fa71uV_JWyZNdu94J92BGrpnV5cXk
Message-ID: <CAPLW+4=CZ=VsWerWEXGyXkomsAUJkd8eYycCRktKZjsTi-RVgg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_213929_702834_A0AF7125 
X-CRM114-Status: GOOD (  14.31  )
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

On Thu, Jul 24, 2025 at 3:13=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
>
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_MAXCNT
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 184b1ad46ca6..16a845f41e74 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -305,7 +305,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl0 =3D {
>         .cnt_en_reg =3D EXYNOS850_CLUSTER0_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 =3D {
> @@ -317,7 +318,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl1 =3D {
>         .cnt_en_reg =3D EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> --
> 2.25.1
>

