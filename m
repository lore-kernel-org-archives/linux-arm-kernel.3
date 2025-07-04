Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D5C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kM65gUyDV8Nq6O0X5HePJHOOeCngpBNSIlUrnpmpZME=; b=rJq8ScRuw2AnzbvF+R3+eKi9tw
	hMz34sL2BMNjbElAytjEdMTXG2fQmd3TB2ZPWyimDT1M17WfUHW0KKaQ8zkdHioiJBTGIg5omyTNB
	c/5fd9XXrxZ5k8RVlWSldmYZ4kinKjkf3+30/xmzZtvhCDC+tNFWjxIsmDIpB4QZUzyW6KQI8S9HZ
	Pdz7+Pv68AyaJrVwm73ZAQk61T8WoVUeLDvyK9zQFu6POWHCHLXX9E6C62AxHuZeeBObXQx07s655
	sACjqiwoNhHekoCefvf5wPh25+md57O7yJyi4Z2hCsap6WgHkM8YuDGBDLvS166Me7NDR6mDGHsxi
	ce9PPMoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgpA-0000000Ea56-3hLG;
	Fri, 04 Jul 2025 13:51:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfhk-0000000EPQI-1ezy;
	Fri, 04 Jul 2025 12:39:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so648254f8f.0;
        Fri, 04 Jul 2025 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751632786; x=1752237586; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kM65gUyDV8Nq6O0X5HePJHOOeCngpBNSIlUrnpmpZME=;
        b=mpFM41RmcdAKRFWkI4gb5g8MQ/bE3qI7+2SdbZr+Qic49ej2bspr0UxGvQ/eK6r0K2
         S+TS+oNiEmL5Lb2HSa9Qab2L2WLQirsrXJ6byzYe3LFvLi23i4wrWVZjWMC9p69XveTz
         pHpTBAtkukwCQEg0vULhTvB9AVpEAgMtPivglTqLbdLKDKmO3Fp3OrQmlhmRRkTXNUu7
         H2PAgMt1aMy5Y6IjeIvdd+qe/2JKEP/U8W7ATbQFwWs+Y6FSDaFk0V19YalsDw6pxPOE
         wtukSMyZj6Kc3f8EvK6L2fEY289ByrHGVNiwg2flLF/NCG3MSVB40ERBM+mR8f2BPPwA
         sKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632786; x=1752237586;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kM65gUyDV8Nq6O0X5HePJHOOeCngpBNSIlUrnpmpZME=;
        b=ItwHFLPJYNSAzN8vWou6h2I04gERG1vPfBWmjNtYM5aOE3WTuxikPF3KvwRc3xeSQS
         /9SIKSo+gUkaIsZ09+/tMuRchKzW92AyNUCo7JqhipJaVekb/XgzDEA44XxBm4YCnTea
         FGAEBp5LqkhIJWuUbz3dCgpo95YEMlyMPQ8dfi3Ro4iM9Vusi+HokTY1BPHqiNUkRhP0
         8pKegookSlBUEbIgATNT4aiRsJIScIa5jpsMVc0ofw4HGir2sZLnkCYNxys1icJQWBVJ
         3Em6wgD46AONKh7kA7Lx/vogIU5m81hT274sKDWBqHxtg1SSuGeLNrE+56/ySZb1BToa
         yOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Z1Si9AeJj8fqQYxlsO1KbVvMWbr+65Pso8m3qnBqdB2fWIzFrIARczGLQWXkcOHwchKxMyfyYs7rOT1GCAD3@lists.infradead.org, AJvYcCVYnfLbhh4wBeehMSMeZz0j0IjbHn7DRmJ+rA+rxLXpoTksjolTXUszFZIUv5buFsPestOlYRAW/qRpewP/3p0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPgjM1wJ4gYGwuAb2CxyfZR5dH6VPCMKclfe49kp69FahS8LBA
	s02oCNkhdk7tI5kCk6FvkJmE7sa71HgILvndzWvHclvv2Msbqlr/keGEIqlj6WFEKcI=
X-Gm-Gg: ASbGnctW/lyH/W5YKQXWIAsdqd/gnnSn0gdeVPrkOWGPvZT6ziWB2egEiUsJc6TeaZD
	rT3ec35g+oXevZT7QF2MbqQDajGLOPyCrwR3vYY11SxPJCUd5b0I3KueLDcfEvxeVJ9glwxAbnl
	BA/pJi7XChYrcAyt40PGs7Hoh+oL+bWgY7r7RFhHAUAKNXXfrqwvYCNBe0P8wxs7RXzQxHhlf41
	YOIN0/SsiWhfy5L+OXZiLooXaX/XCm8IQ5C4GRwf8HPevmy/IZjT4uV5yaD9fATK40st4Uzb32U
	Eu/k+KBiwsZTa871J2m7cjzsxBccdseDh2SDGheX3v+6UDzeyOo/g/3yD0n5XxzNKaH55g==
X-Google-Smtp-Source: AGHT+IGEZQqooZXYhGVoWPdBr2vTu84V+4w3rPWYqllSwEygO+t6NPXOBmMzmHVAtMjkZ8S2Ox0sXg==
X-Received: by 2002:a05:6000:4911:b0:3a5:2915:ed68 with SMTP id ffacd0b85a97d-3b495ccbb9emr2195447f8f.28.1751632786152;
        Fri, 04 Jul 2025 05:39:46 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030b4f6sm2467772f8f.10.2025.07.04.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:39:45 -0700 (PDT)
Message-ID: <ab0a407412c705e409d9d26591543713a092c13f.camel@gmail.com>
Subject: Re: [PATCH v2 0/6] iio: Add support for MT6363/6373 Auxiliary ADC
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Date: Fri, 04 Jul 2025 13:39:56 +0100
In-Reply-To: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_053948_432184_E87F1DDA 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, 2025-07-03 at 16:11 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v2:
> =C2=A0- Added error checks to all regmap r/w operations
> =C2=A0- Moved adc_vref addition to different commit
> =C2=A0- Various other fixes
>=20
> This series adds support for the Auxiliary ADC IP found on the new
> MediaTek MT6363 and MT6373 PMICs, found on board designs featuring
> the MT8196 Chromebook SoC or the MT6991 Dimensity 9400 Smartphone SoC.
>=20
> AngeloGioacchino Del Regno (6):
> =C2=A0 dt-bindings: iio: adc: mt6359: Add MT6363 PMIC AuxADC
> =C2=A0 dt-bindings: iio: adc: mt6359: Add MT6373 PMIC AuxADC
> =C2=A0 iio: adc: mt6359: Add ready register index and mask to channel dat=
a
> =C2=A0 iio: adc: mt6359: Move reference voltage to platform data
> =C2=A0 iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC
> =C2=A0 iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC
>=20
> =C2=A0.../iio/adc/mediatek,mt6359-auxadc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/iio/adc/mt6359-auxadc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 440 +++++++++++++++---
> =C2=A0.../iio/adc/mediatek,mt6363-auxadc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +
> =C2=A0.../iio/adc/mediatek,mt6373-auxadc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +
> =C2=A04 files changed, 416 insertions(+), 69 deletions(-)
> =C2=A0create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6363-auxa=
dc.h
> =C2=A0create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-auxa=
dc.h


LGTM,

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

