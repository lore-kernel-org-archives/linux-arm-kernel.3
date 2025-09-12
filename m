Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB13CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 22:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=; b=T52MR+TVWjr39KhneERoTFxM5i
	M+p4h9jAUphgDxSC3/v+KmiAaSaMR7bk28ilqpqF8qDmYCHWpyHTDvfdBwmSd0CSThYgPYAUMaGvQ
	atr7RdiGb43fipUGIcbpZ0/EVtIE5xnLNnbHvTvJ29v2T0/veVSU+UtBhtJdeqVylA0LMAjotwQWu
	xyFQoSP1lIVWKiVveN8cx4wpDOIDYJkhlLmDzo1oIFTQdF30WNE4ddSNoguuI3kO0i10vQsZ+S7bC
	H7KgUdDZ49kSpsRuUrR+O9mi75PHg9ovvsxOjlG2Hvo1uTPO+z2/8zOJXYvy9QxSINoaKHcHBSzFA
	QvggqFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCeb-0000000Bxdn-1zf8;
	Fri, 12 Sep 2025 22:54:05 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCeY-0000000BxcI-30d4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 22:54:04 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-60170e15cf6so1684686d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 15:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757717641; x=1758322441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=;
        b=GvlGaV3EgZi9mNmw6W92x7+hDJuDUf5bDmj0cyZpj4FNH3AAAKWUeDuYlfG37XM+Bi
         iAG1HVRKWOcnsMUqX2W/bVzoawqz61uIl1IyW5yDfJK/IFxQcQ09juXsaeh0BKtyq3+H
         EY2Y7Fm/8+Ag2AKlzsYCEQR4mcL156kLfbPwFFkPucgWlGi+JMbfgoEmOVUVk8ZyKOzU
         l59lMLvUjGmq6LrAzNUOZkh5suhUr9cvSI2q/pUterMwN6g5hpdktO0eo8jzkTxcbgF3
         qzC/VuF+YabFzs+Ji2wP3De3ugrnm354w/ijACmO9nLlWbAxJZJe9+v5rguQsL5s0qk+
         +p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757717641; x=1758322441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=;
        b=LM3c0Ai50g1kSPrM+lwJ3/p3wkt3gC0WxPrao2I/87rGy7nDJTZ8iH4W4rdp3444KK
         i3MPAD3+hJI+KQUCUWU1NivSZ6waxDrSb8OHH5aFu2jG8ILiW0gkSstO5WYOHExTFvDH
         mzOW9KE/d65DJIJuj8JKBGqq2bvPOi3eiMOYxqg0YeA8ZVKIibsjA9LpBP0ZYKlMwezc
         3/A7/aD97VF4dRxRO3OE590PG7/CU3woDDrzs+bOzYRQI4Ak00BrGAA5q+Icl0JSTxnk
         3nyzJvuG/OE15qkWVDvU3Z3CT1zym9/u/coOOA2q+DdqEEwg8c7Wjq32+X2Xu24Ky4WF
         fCLw==
X-Forwarded-Encrypted: i=1; AJvYcCUkEug138YotvGTMqqkOoseM7ISOyJI9mzOC4nMVVHNyECOUBhD8hvy9QL5vDV3H7dYYLU+luHfrhnjYlShVavk@lists.infradead.org
X-Gm-Message-State: AOJu0YwIN58qWrjAuRuATEKtFdVZYwCE0WqFtbR5z3xVhkFRKYIXOrLk
	MesHUypSCrWCKVw9tLENUOiGnFAN/6ZkTrmaNitwlFKWQO0H24TnARp3UdxqeicHcrBOVmJdSPh
	wsNMNkKe5E5gU7Cx2+JNSb5fve0fCrcedPMMmR4Q=
X-Gm-Gg: ASbGncvIIu6C2b888qLOMeAESGOoaVbTp/SFcHBRuExr0krSlHHhBbmTC/65v5OKSyD
	lQrVXMJcFqrJGBN5SmvYDlVNqi3R+5+ZG5hBaM5oQOodFQpIPnT01XKOUkD1J3O7Wqt++N27nRO
	Zvqf1AyE/C0FnJ1wP74UGu6X/mh8tipImFBWXF189Yy3bcpFnuR/g/HKcxwBMWZuewPdtNMWIDX
	1i1VTFkSm7yqIYR1zajfqTpThlScbqeqHUuBFvQ49rGmRzlt1gCW9dUUpTRpsVrzVQchevKQA+9
	5ykIElM=
X-Google-Smtp-Source: AGHT+IGmrPKfHKqLuLVsedBSU1D7fMJ0SPSt1pUu9IK0SCtyHO6OiaCBaQyBDxty6OWXlqg3nf3oT3Kb2tAQnhUAUk8=
X-Received: by 2002:a53:7101:0:b0:626:842f:818c with SMTP id
 956f58d0204a3-6272297979cmr3570059d50.24.1757717641302; Fri, 12 Sep 2025
 15:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com> <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 12 Sep 2025 15:53:50 -0700
X-Gm-Features: AS18NWAVsbHM7asbGyyRZapaZP5ufrQUasUcMY0V45b2pm9dui9MQp5I0XZOq0k
Message-ID: <CAPaKu7TEN++z8r68k_4-iCyMLMthqJBUX35pgXupAHPdfttrYg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/panthor: devfreq: add pluggable devfreq providers
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_155402_764488_ABE0DD13 
X-CRM114-Status: GOOD (  20.87  )
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

On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
<snipped>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/=
panthor/panthor_devfreq.h
> index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516929e=
db565a1f13443fb 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -8,6 +8,7 @@
>
>  struct devfreq;
>  struct thermal_cooling_device;
> +struct platform_device;
>
>  struct panthor_device;
>
> @@ -43,6 +44,19 @@ struct panthor_devfreq {
>         spinlock_t lock;
>  };
>
> +struct panthor_devfreq_provider {
> +       /** @dev: device pointer to the provider device */
> +       struct device *dev;
> +       /**
> +        * @init: the provider's init callback that allocates a
> +        * &struct panthor_devfreq, adds it to panthor, and adds a devfre=
q
> +        * device to panthor. Will be called during panthor's probe.
> +        */
> +       int (*init)(struct panthor_device *ptdev, struct device *dev);
> +
> +       struct list_head node;
> +};
On mt8196, we have performance-domains to replace several other
properties: clocks, *-supply, power-domains, operating-points-v2.
There are also quirks, such as GPU_SHADER_PRESENT should be masked by
GF_REG_SHADER_PRESENT. It feels like that the scope of
panthor_devfreq_provider is more broader, and at least the naming is
not right.

Another issue is I am not sure if we need to expose panthor_device
internals to the provider. mtk_mfg accesses very few fields of
panthor_device. It seems we can make the two less coupled.

I might change my view as mtk_mfg evolves and requires tigher
integration with panthor. But as is, I might prefer for mtk_mfg to
live under drivers/soc/mediatek and provide a header for panthor to
use in soc-specific path.


> +
>
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>
> @@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *dev,
>
>  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
>
> +int panthor_devfreq_register_provider(struct panthor_devfreq_provider *p=
rov);
> +
>  #endif /* __PANTHOR_DEVFREQ_H__ */
>
> --
> 2.51.0
>

