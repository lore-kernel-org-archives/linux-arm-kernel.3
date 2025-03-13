Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C43C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 10:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNbbqeHoDPt7k8hD93XF4WARB2PnI7whAsDobeRau8o=; b=dUeABfZYCSNul2HhloO58evdry
	N+aK/3OHKqCBoLphcfjxvyBlOfg8P7URaUzC978S2/rwDPJ0P++YCnBcw1nvkS6LAAuPDgQ8cxAxf
	4cEYG0RE5Umo1WjQBUs8ieuUgaXkx+mgmmx1kGRZqR0iX1I38lwvd4aQTzg4CvHYu2ezrB4rTRdO5
	YzkQZ+qQ3tXYS7+8zAdKd2qBG9YkS/scYWyMqM0/kZhYbAexXUfZ7W57MVWkbzCwSL0x0qz4iaOio
	kybUrCDZT1peHMud4xFnSzyMCjJ5wO43ExsXl9pJ7KxI06yQq2x1wpbsBW5wFUxzdRnG06NpVoQaw
	vfr2CTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfwH-0000000AtYU-3fMt;
	Thu, 13 Mar 2025 10:37:21 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfuc-0000000AtMW-25Y0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 10:35:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso125265766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741862136; x=1742466936; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNbbqeHoDPt7k8hD93XF4WARB2PnI7whAsDobeRau8o=;
        b=IJzEa6arAtjp7h03jgtX/iQAxB6dIrJ1gqSatQf8CazirrlRPvFj53a/e5f7y7bXP0
         SnGFZPLP5F7jY4rYHMWDpFxLlwT5SeWFnX1d7mLGlGCC7dJcCPNpaABtSTVCH2cE1rY5
         zOQEpSdFQfC3m2wnS4j5vasEgKInRE0qA/omfPvOZCc/rYncqK35qPkEFt4z+j6r4WOc
         ctGF9ZOFYfhAi4LtoBA5zqV2L2tlpzLA3tVLzJVgr7nRuTQsYJvxyDLZUDGoYJVgfq7Z
         7l2ACiGSaVe1j1aeeSp6p675USY4PYwe3nHnTNmr0WGhxpGB7YmR8Ls1ICy1jkEftcS7
         okWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741862136; x=1742466936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNbbqeHoDPt7k8hD93XF4WARB2PnI7whAsDobeRau8o=;
        b=lkCQ8ilWsfOFUIAgVTdGClu1u7ruAfTA/HPFtf3hY+KcO5rgxsiq9E9BigUsSluO7Q
         XlWlLF9EKzBh9Zmy/JtTYgiotVy0AiJ5cptBkrh2wgmmEaPwgMSobCeT+dDj9hAbBNQB
         xTeGKPv4Jqh1n9JFadUGtKu5VfpYkKJeX0Dt9QQhDtptXQa4fk5KiS3zY+6GaHtYtN+P
         Td376/FjGkvrEhTRZt+LltMpr6+TiqAnJKSnrS3MLBXwm40soYWGtMkCQgLY92TAABCg
         h8eS+FxZQDoWofTTgZKXBdo0cr63yGprIAPSN1dlAcEZmVQR0D6OE1+kFDlyaUG4MUwl
         88Dg==
X-Forwarded-Encrypted: i=1; AJvYcCW3LeB23vhOjMFh4aby1ixbE1ngE4sR/qcW++ewwHieVTbrIjl8wZD4FxlG48lIcLCTu3fEsyet6fB3tjQB9mTS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0HclcGZWTrsTZzGDhCwQcQGprJ3iI5K80xPEgU1yxVGzOrwjK
	8ef2uM0uv8W3SYMcS4qx3nteS1++morx73q9O9V0qpxwwus8x6TAUL0Ke+KzPK5P81hAxSfGQuC
	CxWXndv24Jwonf3wFcXMs5eVldj0=
X-Gm-Gg: ASbGncs2YMW6Ty5O/y7HhRKoHPGctUvKXUIejfKNVL15F5pENqK8AMRAXh212UvHIbw
	5IKaQFxalA4kdRrFmsFd+JIL8loJ6kpuRym4BcfWLNsR4OskyRQ/B/8Pl5oafpR7+8N6ZcU0as5
	McjrvD+RWA2ZosspTd+biH8ztimw==
X-Google-Smtp-Source: AGHT+IGVDv1pE4BCE3Na+yhBb8R0foRSsykxpcDNkCfJpVC2H375ipT8Y9+Iaqn+hyKEC5XYMz497CWVlxAo0aZojpo=
X-Received: by 2002:a17:907:890:b0:abf:768f:9a1f with SMTP id
 a640c23a62f3a-ac252f5ad70mr2132021166b.42.1741862135398; Thu, 13 Mar 2025
 03:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250310143450.8276-1-linux.amoon@gmail.com> <20250310143450.8276-5-linux.amoon@gmail.com>
 <25fa661b-98e4-468b-bb4d-4a2c95f32b71@kernel.org> <CANAwSgTeZ83oqatrsWQxT+4RYwEtEqma=R4XX_iGrP2N=phz9Q@mail.gmail.com>
 <43506f83-13d7-46c5-b022-473ac78f0cab@kernel.org>
In-Reply-To: <43506f83-13d7-46c5-b022-473ac78f0cab@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 13 Mar 2025 16:05:18 +0530
X-Gm-Features: AQ5f1JogTFqIfMNUkGXZqHbmGpfdP1dSo4ev8vVzdcAwRmde2Tjv4RErgvCNJmA
Message-ID: <CANAwSgQeE0NQp_xwWcYBgZVQnm1N4PaQbaoMXGyFK4KKWAzxNw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drivers/thermal/exymos: Use guard notation when
 acquiring mutex
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_033538_538195_B96A0483 
X-CRM114-Status: GOOD (  16.24  )
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

Hi Krzysztof,

On Thu, 13 Mar 2025 at 13:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/03/2025 15:59, Anand Moon wrote:
> >>
> >>> +          mutex_lock(&_T->lock), mutex_unlock(&_T->lock))
> >>> +
> >>>  /*
> >>>   * TMU treats temperature as a mapped temperature code.
> >>>   * The temperature is converted differently depending on the calibration type.
> >>> @@ -256,7 +260,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> >>>       unsigned int status;
> >>>       int ret = 0;
> >>>
> >>> -     mutex_lock(&data->lock);
> >>> +     guard(mutex)(&data->lock);
> >>
> >> Which you do not use... Please don't use cleanup.h if you do not know
> >> it. It leads to bugs.
> >>
> > Ok, I will drop this include of cleanup.h.
>
> So the guards as well...
>
Ok I will drop this patch thanks.

> Best regards,
> Krzysztof

Thanks
-Anand

