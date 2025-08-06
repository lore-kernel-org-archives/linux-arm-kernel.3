Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3111BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e64dYOpRvHmbbrtWNTSj9g3tc82tVKc7j0umGWHc75Q=; b=knnu2fyHouyI79WzRsg3Tk9PLp
	UtP+8nebkGsfm6v9t7UWgDBc6ttK08Kgysus6fWXq3d1fX7mBqtkrnCLECFAoPvjy/29p0AKDjnFP
	O0DPFoAsIwRzhYouAL7sJE3zzF4HjD86pZSneCczK4smxYHFMh04Z+5OszxfYHgoMj05qU/cVxfvT
	3VEepT5/RfMnEhzn2/6ZY27LV1dRb67X3qeaC+zPr4qi0bxlPsw0kaDKH9FB6Ljt534+43VDm3ELO
	+aDnNYx3e/OnDNR/axfB5zKZto3Udkht/Z/HqgIGTYOUT39b5VzaHXUa0ASZHSHjkFSTiwp7jz/N4
	Rfh/lQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujitF-0000000G4Wo-0CHw;
	Wed, 06 Aug 2025 18:29:29 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiYF-0000000G1h3-2ho3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:07:48 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-710e344bbf9so1040377b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754503667; x=1755108467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e64dYOpRvHmbbrtWNTSj9g3tc82tVKc7j0umGWHc75Q=;
        b=wWNdUHXhgXuLZ+9tu/kzUxKr11+55w5w+cdEE/Lx6GPkDOTM1oBqL4UZxiSeHh9fT0
         lY2PPAcoSkHQNebLMoUbFEwEzuF+MgLWpMRTboayD1iORmqKBlLjzxOSejRkEQnovoSq
         wTOYZ6WzqXc5uKJNZMD0SY7mgOotDVFCr3b2Z/CN/XcEVEefzRRdF7oYO8b7MKnE84Of
         rMsNhGreQYP7b6uZwyvqi70AYaBSJhsIBTdqt6y1NZdYVb9XzaskWJSbShe/VA1Lbzih
         JvbU7apnh8Q8Rpm5nzDAWocWkP46oYXPSa4U9LOkQGtnq7J3ueXH2WIHXx5WKREvt7yw
         ReoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754503667; x=1755108467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e64dYOpRvHmbbrtWNTSj9g3tc82tVKc7j0umGWHc75Q=;
        b=I1Nv6nihNEm3JdGcVvr6RydP2jhb4xWCUH5DzNuwopaoqydisBCcFk2ZkGb7GsSlOB
         /thh8mNRTe+QNzMcM5abecyha0JuGWKs6rLVho5dqQ41sX4+YdLBrsRemB5kJmbPMhvf
         lHfuo/APHvEZ3zpHM1Xbfmafne7XYWnDPTjSD6OCX+A7Yl7MLUcemNLx5so4dsNUdI7Z
         sIJryx3ZujLOOhcUsGcjZfbCMU62fVs5M+jcPWi0bd59mzqW3LP1s7Is7+l36vvq8orX
         XUcRAuKvmwNswnwElmGHH3ziaBQvCNJiFo3TX0nso/snAHqa7QlEH/1s4GDRmfSMfuAZ
         iDGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRl+7gKOcJkpASSMbqv++iYVw0OIHMCKhzq0MX7ovs1EXwBvcLI9dhjTA18f1Ugy0aJ2qhRiAmIrKKn0IPTnzu@lists.infradead.org
X-Gm-Message-State: AOJu0YyA2RPp0N01Q5vM//kHyhdUfhJVy7r7BLZTAb1T9PxdxrH0pKIN
	o1/1yk4iEOFaGzj8ZZDNmj+aVZ3BD6ftrACQOzRawuSHYTHRnHQS2aYCDZxfPoGR4DErNz7EWOJ
	c37hDDOb8OBYjkQjwxlBg0n7QFthwiHjdWPDlLDo4qw==
X-Gm-Gg: ASbGncsNSqL/9higNfxNvVVa6Edf19Em5BYxoOMdSZXvuqailhMS0rUtlCdtNs91zsR
	6wgfFmdFFRIsshl4obz/gj4mI+KjNWHpRJFi5NTNNiWNgxydIznRTTWaUhwpGBglrlz8LUo38jH
	n2MAYbVQFhAG5902I/yPQKzJlcfkYqiHfcXEX7sdfycbz2TrWw1jDdHflu3aJWor2XOGrTJ6Tku
	Loosq59GL7LhzPV
X-Google-Smtp-Source: AGHT+IGzVNInSABQDNnUNPgx22fnkoQK29xlj80Xhm92+720xF5zbG7euyqOftdTJkmT4Ecukdgi7FOxbvVqX2U7ToY=
X-Received: by 2002:a05:690c:317:b0:71a:26cd:6d18 with SMTP id
 00721157ae682-71bcc920fc0mr43203327b3.40.1754503666653; Wed, 06 Aug 2025
 11:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250806070030epcas2p4f9b779bd9fde57b4bfea958efdf62cf4@epcas2p4.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-6-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-6-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 13:07:35 -0500
X-Gm-Features: Ac12FXz1wG21J0FHFOEmb1_vYpGiG5VXTvwnDLd5jOWOoXjCI9NbzNvCVoOhnfQ
Message-ID: <CAPLW+4m42-8QEEcQgqm93=Ar44-Gmwu5fiLy66SXEMes6J=zUA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110747_682221_17B18F6C 
X-CRM114-Status: GOOD (  14.33  )
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

On Wed, Aug 6, 2025 at 2:00=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.co=
m> wrote:
>
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_CNT
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 541870b4d01a..f25563585983 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -306,7 +306,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl0 =3D {
>         .cnt_en_reg =3D EXYNOS850_CLUSTER0_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 =3D {
> @@ -318,7 +319,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl1 =3D {
>         .cnt_en_reg =3D EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> --
> 2.25.1
>

