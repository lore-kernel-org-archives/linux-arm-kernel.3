Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A24C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6RHMJs7PqkrNK9Y/YAwxZLPAZtSgRd9y+M0g8dXsWI=; b=h/l2qKI08lp8Ef+4tDGHhKw9Js
	OAY6UgtiJN4SInOWnPtoHWuN4Sq3aOQrfymskWyWG6mTHTI+jrrst/JWsaWMg2/eX36nT4Zten6wG
	TnRkyghmLFUhb+kQRVUuj1WUcOlHtWTYZDQjv0TI65wdHVq1uCnNFieOtTDG+isZqJ0vVU77LynxF
	Ej7J+T4S/7k+4n+HUZNvmlSACQfvswE2+COfQHAfjpqp+9O4j2LdZm5Z0kYTIkK/Lf6vGJ7//+1NA
	Az4X4WnCbG9NUWWOQPROMiZEchZy0Xn4gCk47ioyV1JPHOjZxhSVfc+xR4y/7aLId1+yoJnC+cksQ
	gWQ93wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmEbL-0000000BNZF-2k1y;
	Sun, 23 Feb 2025 16:13:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmEZo-0000000BNQz-2532
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 16:11:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aaeec07b705so579672666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 08:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740327089; x=1740931889; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h6RHMJs7PqkrNK9Y/YAwxZLPAZtSgRd9y+M0g8dXsWI=;
        b=eDmLOB1KXS2WV6QT6UgVkI1F1XEoo058ALnJO5fWtE2R/BQWclOCrzm/KAvxu4CK90
         fzHWGCZfsPr1sXH10C+ePHkxal5+fwy4CMqvrNZvUjUXZfuGvrxoikBDqs/VsQXpLPGK
         BQ85IVOMZsqcz3BDO11bJ+Ce5mVcThmfkthgsOSbouCeTBqv+Gjv+svSWH/Tv+7ccj//
         aERA8/UoGpLO7OkWTDcoQtEAcfvkvmjk5lrpHBHCGPW9bgxHYiqB1UZiYY5gOAoVrr/U
         SIOHCegA+AaUtCU4OywlKvZ17fAV6QiTNNYyCFRLnP/K4jHRo5NbhxygfKD0EvyG/K9j
         u/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740327089; x=1740931889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6RHMJs7PqkrNK9Y/YAwxZLPAZtSgRd9y+M0g8dXsWI=;
        b=o021t3SaB1tffkbnScQHBMhpV7ghZvLAx9sh+KRLU9iFnG9pwsLeRyrTCu31lrfrfB
         Fi6zcgahdmhNlf0+schSUsEKkj1kYYDwcr7vdEIS4bbVd3OJ7I652Gwp9z0rLqVUB4lQ
         0+hWiOPvVBaFqr+KD7sTZeQb/alAvm3wPm0joRuiVHylp//cavWovgSqG0BIh4tQrMB4
         Jhf1b1BMYZ/hlFPlu5KrfkgtIMhffKdiUDqkPeUHXatBosJzlF1EvKAJOZGvnLNpOx1a
         uvxv8G3c9mteHsRU0bCH8UVK0n/KNUDsI+5H05L4+NYoS6X/lN7MHIdCGqQPkUZpqLWm
         SgNA==
X-Forwarded-Encrypted: i=1; AJvYcCVX9xeBV8nGBAs4dg/wzPJJqvzmViBLyyLG9wQsmgqq/ZweeJnCo707tATmfIS5CMgtx9L/7x/q2kjvk+VYxh7i@lists.infradead.org
X-Gm-Message-State: AOJu0YyUm5l7yuQ0NC6pWyy9CsNkEnr0LB8T8IBclDpLQZE1OUft65lP
	QoiHQESXEeJKVLBowyMr+HeJX5A/HaDAUFShxUJ5OSBHrMlAFCanQVH+r9hTp5lZBXu0zCz29VJ
	xRzg8h45Omw9xJGo2hcs7YwIn/PJixqwnTEF7zCa/NH2GRfUHMx4=
X-Gm-Gg: ASbGncsqZUFDXR4JtUM3n2YpGPBwkjrc0zyGal2Vs9FLc+XR48L2JCeU5yVkAVgPo9S
	VSZcw3fdQ0N4WqBEwEUug+2/cMXSJM/wIsME9rkbEGZbmokRnVqDWVkmEhmBXliykl64OLfSG7u
	Renp8MCf8=
X-Google-Smtp-Source: AGHT+IFIDZJr6Jur/hwIghGQ2Qq9i/9D/BgAwgxNvwuLBG06ES9xqEPe80nvc5cmXe6MC221B1H3UO7JvZ3cGAzb6AU=
X-Received: by 2002:a17:907:8688:b0:ab2:faed:f180 with SMTP id
 a640c23a62f3a-abc0da33a30mr1190754766b.33.1740327089277; Sun, 23 Feb 2025
 08:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20250222094113.48198-1-wahrenst@gmx.net> <5ab95f85-9a91-4bbc-8eef-299376ab46f2@kernel.org>
In-Reply-To: <5ab95f85-9a91-4bbc-8eef-299376ab46f2@kernel.org>
From: Phil Elwell <phil@raspberrypi.com>
Date: Sun, 23 Feb 2025 16:11:18 +0000
X-Gm-Features: AWEUYZmkjkeF07rULr98ZcLeKWQEtabmSV1J-NMRHam6ld1g-hvY8YToBNU7zvM
Message-ID: <CAMEGJJ04D-LJ5=NdYYu=8Dfsy+mb0sQpL6n_pT+DAcyKAiPyvw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm2711: Don't mark timer regs unconfigured
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_081132_622628_F3863802 
X-CRM114-Status: GOOD (  11.32  )
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

On Sat, 22 Feb 2025 at 10:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 22/02/2025 10:41, Stefan Wahren wrote:
> > From: Phil Elwell <phil@raspberrypi.com>
> >
> > During upstream process of Raspberry Pi 4 back in 2019 the ARMv7 stubs
> > didn't configured the ARM architectural timer. This firmware issue has
> > been fixed in 2020, which gave users enough time to update their system.
> >
> > So drop this property to allow the use of the vDSO version of
> > clock_gettime.
> >
> > Link: https://github.com/raspberrypi/tools/pull/113
> > Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

FYI, although the patch was written by me, the commit message has been
completely rewritten.

Phil

