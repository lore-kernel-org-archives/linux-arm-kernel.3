Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E103C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeiw/igg3VRkIFQpTb1DWvr2tgsyqZV4hPeCuzYTAzA=; b=VkwICRhG29i4QZL/BNBnBViGJj
	wJnF10qZgO6wht4KvUXABpoWSNz/v6AJXb48cf9jMAbqwKYNmQ6IAXzfjJlVpM6/nJMJuCEPR0JOO
	r+keuz/HwMSFc98gxLoSBNQnQ/sJZnpzvcRnWvajVT+5v5GoBQl3aV28OOOM7St4vPWvFV+lW+xgm
	GIV6KHsMvQLF68jHdf3H9xRUgzXiQK8rcJdrkuOmhcpLWYpt7Q5nZVA+6vrD4+o8EXtTgTIUvFVp5
	Dt5AVriIBmlugExvwHMIV89StEtk0cuajmjEwAuxsjPkmLjcJPDl08oQo8JbgViFlpggqIm9tOjEh
	7eSZuTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujivm-0000000G50m-1ZBr;
	Wed, 06 Aug 2025 18:32:06 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiYm-0000000G1lr-3joF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:08:21 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e8ffb1c5f3cso163798276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754503700; x=1755108500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeiw/igg3VRkIFQpTb1DWvr2tgsyqZV4hPeCuzYTAzA=;
        b=JL1qlM5f+PPXpbQe4jY4J6zAd3SfvRLLrW0i38rvWrlKCjYMJrNPc+ldE+Rq9zWidx
         XzOwdUc2tkN98K7qzlYRUlD+eIv72XbJzx/jrCZY4YJs8dUJbM6pTe+rs3Aio3X0Nagg
         Yk8GtKhg2rBNlZk+g2Ecmsg/2qCF1zIbgForZ2y4Wb+QtULXHw7Z61uTK5R8CYcRPvVN
         ZoLe/bQ2rOxHI7wFMiEir0YaOzSQKTVl2NaBGUrj2CzcWco1clr291GojdiDEclyTAh1
         CkbOAPa2KCe+1V9jBZ61S4Xe9lqdqY+wZZehIkfrfzEmtSoVkuJj71az7n6ZLdYrQ9Va
         OtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754503700; x=1755108500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeiw/igg3VRkIFQpTb1DWvr2tgsyqZV4hPeCuzYTAzA=;
        b=u6EmowG3F+7b8HBteh9ASHewa4tgIFKMvq0C4AhWYBH6I9REYW8L5FX1cuYWxpa/T7
         FvY9vsRneweS+loqqqUJOeHZsOLWe9VXaMUzrm8q3MM0umVlk1Uc/MgX3tYR9JIR4Zq4
         o09XcpPlZUsLFEoxL5l7Iohk0C9VzWJwnLXle883mGw14gTd91pXztemPbzQu805x6uc
         O0uEDbH0u95CL2nNK69JmxtwdweFVdjySQOfN1DhLcmcUselvABUBpl7hzdYoGC94lSJ
         Ki9HFFjnSjHSWcZFvp5QtPZfjHVT6DqD9VrmOqwZjxKiFrgIeu0WGsLU1iroDfSHxB/h
         HcNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMDkcvENYsNStWuoIFJmVdC+Z9dpD7di6GOadsDWBhW4qE6/Ac7mpo+v8d9bc0lAoEXwX/UO0DiUJKmdwM6MN9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8r2NnK5Nd3+zls++44HEUqxH0ibkGWZv6zIgp2/hfHR9MeGxU
	FuXyiBijvuI2/nzYJUUs/jsYpAShxXVGnsaMO28pncLyDBmaqJcHVX9BbUVwHagbIc9IbUCD4zY
	4pnL5L+Q4QHGLaS9mDFRdC/9oLpCCnpUjnW7Mag1jxw==
X-Gm-Gg: ASbGncsUcJwoWR9LMEICYW7XuZqqNcY03WlBlapsNVK3KeoktDCNZRaKQ0o20/ht7jQ
	FL4l6cxxCEVI0tfZ972+C2t/XPYSyaetaujwqu4l6DXb8WYT18t7vwr0PW9OxpFKskOq0tCKwXZ
	k3VrkSqhjORzCzd/B8NZCvqZb0q7IDHt5kw4ApBun/l1TPBqP/Gj4gqYX77KMY65PnDIFRPVqME
	ggqFA==
X-Google-Smtp-Source: AGHT+IFljVcbKKiD4Y8odlIXjBBnYAePfAKr/sOc5LqjcBRdGaAhcUOQ5sCog6SPAwBGoi0fdvXwkpzJhgdnQl3q8ms=
X-Received: by 2002:a05:6902:4310:b0:e85:ea52:8b with SMTP id
 3f1490d57ef6-e902abde969mr3799149276.22.1754503699782; Wed, 06 Aug 2025
 11:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250806070030epcas2p3f2b0c36b6c492629e50e76be469b2db3@epcas2p3.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-5-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-5-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 13:08:08 -0500
X-Gm-Features: Ac12FXwS1WG6f5yuQagZd9mQDHAbqfGJ1tb9fpDSgy50MD5AWOvIXyjEOgbaPAg
Message-ID: <CAPLW+4m2S5jAJ4xas_r69AUHFENOrr=4-ZYUgtrqQ5aJgetDng@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_CNT
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110820_927801_A70CE9F3 
X-CRM114-Status: GOOD (  14.42  )
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
> Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit WTCNT.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 673ab6768688..541870b4d01a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -357,7 +357,7 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov920_cl0 =3D {
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_DBGACK_BIT,
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 =3D =
{
> @@ -370,7 +370,7 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov920_cl1 =3D {
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_DBGACK_BIT,
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>
>  static const struct of_device_id s3c2410_wdt_match[] =3D {
> --
> 2.25.1
>

