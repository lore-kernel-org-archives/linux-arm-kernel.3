Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2072BFD0055
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 03:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGUtErtO1WheKt0/0USuDzWLghEWqZdNvFs6ivnvkR0=; b=u5pGIWhCL/ICe7Fnl2yXAUVois
	79qfYrBpwTpP0N5vPZCiJSncnA1hikTpWuYcaSlzXqSkA89geBaFFTsAp/yVc77/zZ8u07EdU4L3C
	Di5ziMq+h8hC6owOg5uvL8W46asSqumAs8pWc4CrHp0UYTm9H2faz31F0cv5tzaT7AziDMfL1MtV6
	W0ewm1MMGxu+nDKfJozEjIi4Ne7gR2mA5i1JqEDAkk3MNmnvKRBwDJo/nOqXHWrkhA/3QP2RMV6af
	RmhhJE6A79VYoQmjVS1lBPs/KOHLr7ohNRRfogscoAVyKWOBGn/XA8piGRNT2LS0EkmbLp2FvTm3E
	KdC1SPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwXYf-0000000AnQZ-2Lhs;
	Sun, 01 Mar 2026 03:33:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwXYc-0000000AnQ4-2wO8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 03:33:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4398f8403edso2655226f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 19:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772336004; x=1772940804; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGUtErtO1WheKt0/0USuDzWLghEWqZdNvFs6ivnvkR0=;
        b=pinmUeizQiDdMg3euGgmIMtwRkRaQo10UAxpx8tjkMXm68nUfc1wgYJhUZTjcDrocp
         G6EFJr7+lzAgkETlRrllRHwisvDMv1+KRh7OoTv+mMxVPxiROKMi+B/zaCuLf9s9GGIO
         40zlutF+oRAL+kLBTjfELnFCZZcfu8p1LMXxb+S2/6QCk1b2d1+ucztFe7xRthEw2IaG
         ye0wzTbNjv0lqBExwqRMCRcedmTcgKkaZrr1+1+YjS7/W7HHcCGYTFdSHW7oYXspya4F
         akleQgLZlyDpE39IL0kC5pjfLziu115978dFvlEnUnEY/zjT46l3PxJJ9uBQbT9AFIvK
         DyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772336004; x=1772940804;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGUtErtO1WheKt0/0USuDzWLghEWqZdNvFs6ivnvkR0=;
        b=SIr/U0m7IPQnXi5Eh35syJ7dtFg5bpL2NxzXUwkLdSjU5P65xZCF2H55Z6ik8TdKr/
         fh7aCD5czVIzZ+XY8hlPIrR+jE0a+v6odiQbwR8Gt40zuiLeR7ftk+EZOqwlWXsZ2HvS
         eV2fX+G+irzddCpeTwi/5mFs0L5jZbmo5KXQKDbxlomaQ5qXEvhz1xCF197HREdWHIKi
         ouX+EEY2pNI1krKP/PJAQOMzYeVB3auffYG5R5wWBLNCosNQRx6uaq0GtTntQOVola8d
         4OqJ9CRnm2zOqEEO4G++WsWPa38LAnYc391727+x3LPzoj6LtjiP11n9jEAMWJxbNYaX
         PmSA==
X-Forwarded-Encrypted: i=1; AJvYcCXPFK+peLW27pdY3uaY7jL0RKQfvzBh1sJPKykP2PRJRczTQtSiGbJvqNO+Bkvun8ScqQXXvvTUWc0qZRiN+z3A@lists.infradead.org
X-Gm-Message-State: AOJu0YwpSbAlecb2V7BZa2Ny0cvN1SB5Jd7jb8ef2P0JER2V54OW95bx
	olRO+kXP1T09/MO3cdHJufvuTIUWxhOGC8CD2GuceklLAGCLX1s51/fmrXRjQSpqui0=
X-Gm-Gg: ATEYQzxWPwrZpnd0hrp+6mKdSeNqcuy380TubzMGUpOGGFXv9z3n/Ls7yfNaT8Fod0Y
	GIJOedBsY0s7VsTSOzIrySKngiHZpt4UB0kJMjLEZNEahezhCHefYAR/45yy6PBxgx2YsUU5fCD
	s+ntv+g8bZGyNtCF8AckY9HpdszGjWHZd/e5crPUpW07z+9pCNg7RhUKbtGVUVNAdF0ZAvSbZqC
	yMqMiB+Y3xdzWaKi3vn6MmVp+H59iC6ixV1feFZascmKEbVLGCahHKPg7EL+eNv4Gu+mn+YXv4H
	bMH2SZiFlPWq8yZ7ijvcpouV7nOOLYXIL3sce8MeFGJuDK8ZN+ccbFx+TP3+LJ/30JiWbQQq2Cn
	TVdT9vqezqz+NAiexd2Hbfz4pKDQXw1WisUzxNS1GTcNufYOyhjNhNf2Iy+iIkqh92U5rnD9LuY
	9Zz1mjB0DDKoDfJBUxqOUw1csJJ1KpCWq7OPlkxvxVkUm4D4IhGa5c1toMjXIQ8OKB0pd4q8NQg
	Ztf1rs8Z/Sjj9mmaw==
X-Received: by 2002:a05:6000:2dc6:b0:437:6963:a115 with SMTP id ffacd0b85a97d-4399de2ca49mr12536069f8f.42.1772336004517;
        Sat, 28 Feb 2026 19:33:24 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6ece:b3d1:ab81:6eaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm2970858f8f.18.2026.02.28.19.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 19:33:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 03:33:23 +0000
Message-Id: <DGR4OFNJXOI2.3QACIHMM1V429@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] thermal: samsung: Add support for GS101 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Bartlomiej
 Zolnierkiewicz" <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <20260119-acpm-tmu-v2-4-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-4-e02a834f04c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_193326_789417_75C8C0F8 
X-CRM114-Status: GOOD (  22.47  )
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

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Add the thermal driver for the Google GS101 SoC.

Is this driver for GS101 platforms only or for all Exynos-based
platforms where we have deal with thermal unit via ACPM?

> The GS101 TMU utilizes a hybrid management model shared between the
> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
> firmware. The driver maintains direct memory-mapped access to the TMU
> interrupt pending registers to identify thermal events, while delegating
> functional tasks - such as sensor initialization, threshold configuration=
,
> and temperature acquisition - to the ACPM firmware via the ACPM IPC
> protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/thermal/samsung/Kconfig    |  16 +
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 643 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 661 insertions(+)
>
> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kc=
onfig
> index f4eff5a41a84ce02b12abb85d6a0f8818031d0dc..5679dfa85f4079c7d40317ac2=
31bd6a1af93c7e7 100644
> --- a/drivers/thermal/samsung/Kconfig
> +++ b/drivers/thermal/samsung/Kconfig
> @@ -9,3 +9,19 @@ config EXYNOS_THERMAL
>  	  the TMU, reports temperature and handles cooling action if defined.
>  	  This driver uses the Exynos core thermal APIs and TMU configuration
>  	  data from the supported SoCs.
> +
> +config EXYNOS_ACPM_THERMAL
> +	tristate "Exynos ACPM thermal management unit driver"
> +	depends on THERMAL_OF
> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOC=
OL)
> +	help
> +	  Support for the Thermal Management Unit (TMU) on Google GS101 SoC.
> +
> +	  The TMU on GS101 is managed through a hybrid architecture. This drive=
r
> +	  handles direct register access for thermal interrupt status monitorin=
g
> +	  and communicates with the Alive Clock and Power Manager (ACPM)
> +	  firmware via the ACPM IPC protocol for functional sensor control and
> +	  configuration.
> +
> +	  Select this if you want to monitor device temperature and enable
> +	  thermal mitigation on GS101 based devices.

I don't understand this. What this driver actually supports/implements?
Dealing with TMU over ACPM firmware is not exclusive to Google GS101 SoC,
some other Exynos-based systems has this as well. However, it names
the config option EXYNOS_ACPM_THERMAL but a lot of other things say that
it is only for GS101, isn't it?
Does it implement the generic layer dealing with TMU via ACPM (hence the na=
me)
and adds specific things to support gs101?

Should it be something like this (feel free to correct):
Support for the Thermal Management Unit (TMU) exported via ACPM.

This driver handles direct register access for thermal interrupt
status monitoring and communicates with the Alive Clock and Power
Manager (ACPM) firmware via the ACPM IPC protocol for functional
sensor control and configuration.

Select this if you want to monitor device temperature and enable
thermal mitigation on Exynos-based devices that implement dealing
with TMU via ACPM, for instance, GS101-based devices.

?

[...]
Best regards,
Alexey

