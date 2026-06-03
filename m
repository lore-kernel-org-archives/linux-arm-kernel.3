Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44AFCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfa0xqifL6vDOGACfxfGJ3JF4SFfMplxwiS2lFwtPkg=; b=uSf7fBMNTGejKURtwti6wCqpuN
	ZuSYMUTTJHSB5gvcs5Ca26Y7NHz0W1jEvSjD9cbkEqvmUJx8W9Qouu7pgOmJvOAHUQ+8oFTocjPpY
	cJ4IgWqnHOm2Z8P/s5a02h+LC2ArGeblGz/K/MGBtRAguCYE61i+fqZauqC4gvkdlra4eqQKuD+S4
	KaG3B0Xvgg1aH7CdqEtvByEi/lK4aYBo4AX2xuMSfEbocg3+zocK5qSaZV+OWBt+u5b5gDrcpppXw
	S9bS2nJw4PJa1czcMUCC5gKyfgQ2eFAzZPsJIHcqZxExpLY8Ku8HmTf5NkiC/tig+pRB+xp58SSaL
	QLLraMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa9B-0000000E1mw-0Abf;
	Wed, 03 Jun 2026 01:11:53 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa98-0000000E1lI-12pX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:11:51 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c859878eb48so1302252a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780449109; x=1781053909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wfa0xqifL6vDOGACfxfGJ3JF4SFfMplxwiS2lFwtPkg=;
        b=PID7lL92qRk3KyHCIWK+APkZH1VIxH4uY90I0X/HJs7AaUS0CXesFUou7LOXnPrpep
         y/DxT9QSPL26Zj7zyxpt0Yey2eWYEpIHYCdEOy+2LroYMlZvJxfKx8wL/8JV5Q31srFY
         GfWKoN2IPz+NEUzlPGZZw5S2JfNmw7HCYiyqQXTPy5YC6/Wi7BfMq0Is7nFKfnWgBF4w
         P1OFJlHZm/IZZKKGsBvIvQlLK4h7+Cre7/8Wcc3vdZpVyc9aXVsFeoyxO5mfv69jhgUJ
         tV888XtZ7c2YxR6vwfoiBRwzVvuNT5IIeCrHWrr4BkeivRaaw8yo+aOTLkK0UjUo+xaz
         Y4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449109; x=1781053909;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfa0xqifL6vDOGACfxfGJ3JF4SFfMplxwiS2lFwtPkg=;
        b=cMapKzuvMpWnXMCET7zamw5h2Jb6jpamRNwnBGUSeuK/n1OfKLBEvx+E+R1n9zIOz6
         mjpNUIAR7Cdhvuk4VaiwOHu3rqGk7/LysosHH/ZzTPRUIgkv8SIyfCmcZ5HHWIKrwK74
         fhLDkYYnUIUcgX50+t5ACJygYrZW+RuzvqdGKaltXzHOK6HrvoT/TgILI71SBrzEnOTl
         VJ9Ankx85dI7VCaVrsLNjEDNpeWvfvhaBgoQ6JxOq60riz30RY8vAkuTTePUwXFvsfgN
         OKPiNj4KBQEHyUwBDvAhb1Ha0hZwHmjTMWNRTTjotXZl9liouiMBjjjqs51w8emVqmlz
         +fkg==
X-Forwarded-Encrypted: i=1; AFNElJ/RK4F7arSG3PllcfXGbt8EMwR7CFdfim3zLSaw9fsdF1479M4oKLK2JlZ/Xznj2DFJ2JbgLiJYU4Fe/54bU8Lh@lists.infradead.org
X-Gm-Message-State: AOJu0YzHEBEA5ST9etqq8fZJuQlhVoX1Ce2QhtAas4EV0hbAnhLZbNvq
	75tdED/Uu7xcqN7KcsM/zhqb55T5TvpYLmbQnLZH6U2qS+a+1FbLQg6A
X-Gm-Gg: Acq92OFLiEMhQNBXt7cSVq75sF7AL+oaTLBstFd0HEzasQjyFCUNH/N9qGK4bx+h/E0
	7E0BPRb2pwf4iJzOX8u0dFL3xg1B887Hq2xlebsbv5HsdoALdHhsYGgLmb9XyDhOKPXr4GYXT7K
	PVtNyXXpSrU8cLYiAPJCBpV2xPJZdfVCC/ndGw25l29b0M47sJW83KmwwEVvzkG6MvqHTSUyD9I
	kIqXo0ilLJ72jCFrNAuBtE5fdtMa6yZ61vfrntL4BVnXRx6KyskmYCsUd4sRhQTbev6f6c3XyYi
	rtPf91cq3um/mAh3L8WrmHU+qrQmbvYZ5mqWv/6iGkNH0xigYRF4Cq8c+k3O3O0ke51I90LFv08
	or0e2xAJuJtwU6Iu88Hkk8rJbcQ0Qx0wXq7Pov3SuaDrWDOH240q+XbKHq/VMOB0bPqFIFLQ4TQ
	LZlBgkrBAzRBPCAIHLGKtoH3kuMKCwxQohRvCSc/uv3aIdaHHoalIKgCusVA==
X-Received: by 2002:a05:6a00:1f06:b0:83c:928:6e5a with SMTP id d2e1a72fcca58-84284e22fd8mr1087363b3a.13.1780449108782;
        Tue, 02 Jun 2026 18:11:48 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:8899:fcac:9fd7:3b2f:a800:e88c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm1081497b3a.51.2026.06.02.18.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 18:11:48 -0700 (PDT)
Date: Wed, 03 Jun 2026 06:41:43 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: rva333@protonmail.com,
 Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>
CC: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Roman Vivchar <rva333@protonmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_iio=3A_adc=3A_mt6323-au?=
 =?US-ASCII?Q?xadc=3A_add_mt6323_PMIC_AUXADC_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com> <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
Message-ID: <1F6728A6-BD73-4159-AAC9-82370212EF04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_181150_283878_C7619C6F 
X-CRM114-Status: GOOD (  11.85  )
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



On 2 June 2026 6:16:55=E2=80=AFpm IST, Roman Vivchar via B4 Relay <devnull=
+rva333=2Eprotonmail=2Ecom@kernel=2Eorg> wrote:
>From: Roman Vivchar <rva333@protonmail=2Ecom>
>
>The mt6323 AUXADC is a 15-bit ADC used for system monitoring=2E This driv=
er
>provides support for reading various channels including battery and
>charger voltages, battery and chip temperature, current sensing and
>accessory detection=2E
>
>Add a driver for the AUXADC found in the MediaTek mt6323 PMIC=2E
>
>Tested-by: Ben Grisdale <bengris32@protonmail=2Ech> # Amazon Echo Dot (2n=
d Generation)
>Signed-off-by: Roman Vivchar <rva333@protonmail=2Ecom>
Hi Roman,
Thank you for the patch=2E
>---
> MAINTAINERS                     |   8 ++
> drivers/iio/adc/Kconfig         |  11 ++
> drivers/iio/adc/Makefile        |   1 +
> drivers/iio/adc/mt6323-auxadc=2Ec | 299 ++++++++++++++++++++++++++++++++=
++++++++
> 4 files changed, 319 insertions(+)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index d1cc0e12fe1f=2E=2Ec9ad2417a3ef 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -16256,6 +16256,14 @@ S:	Maintained
> F:	Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml
> F:	drivers/mmc/host/mtk-sd=2Ec
>=20
>+MEDIATEK MT6323 PMIC AUXADC DRIVER
>+M:	Roman Vivchar <rva333@protonmail=2Ecom>
>+L:	linux-iio@vger=2Ekernel=2Eorg

No need to add explicit iio list for driver=2E
Top level entry covers this driver=2E

>+L:	linux-mediatek@lists=2Einfradead=2Eorg (moderated for non-subscribers=
)
>+S:	Maintained
>+F:	drivers/iio/adc/mt6323-auxadc=2Ec
>+F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc=2Eh
>+
> MEDIATEK MT6735 CLOCK & RESET DRIVERS
> M:	Yassine Oudjana <y=2Eoudjana@protonmail=2Ecom>
> L:	linux-clk@vger=2Ekernel=2Eorg
=2E=2E=2E
Thanks, Sanjay
>+MODULE_DESCRIPTION("MediaTek MT6323 PMIC AUXADC Driver");
>

