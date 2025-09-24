Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EB1CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIYU8qrKCG63qfESQqAYHq2vCT+r9zxfWJIkv0fUrK4=; b=w9PgnIw1jO+RJ0omnEbQbvZhWb
	3pLvBupm5DWDT4kvFJ5kaya8LvSv+BSHIfQcic2ubz7XdJD5GAq7EvL6ItxBpiE3Fh4vMaWPrYxUs
	JncTYEwLZAMcPP4jVFJeKjy04hCGujbiYZu4ygP1pPLEmB80YLZ4vYoQGsQXRAnowW1aAGvrH7hd9
	cQ704ZrT5sO9ZbA8O0CrFBymejIsvOyHjr7wn9hB/eVa5/HwDkE7N3qwNbEKEtym1OR2We9xIHsg+
	UrNkoM5yrN7CWESSuGUJ4Ndy7lRNxg182+l6RmKil7ydK9r5NBtC4Xk+n4Pd/ovO2K0XEFDKVpyHh
	Ws47gmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Rv6-00000001Vr7-10lT;
	Wed, 24 Sep 2025 16:00:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Rv1-00000001VpJ-3ajy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:00:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3eebc513678so39225f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758729634; x=1759334434; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LIYU8qrKCG63qfESQqAYHq2vCT+r9zxfWJIkv0fUrK4=;
        b=Wb/Ks/QpCo9hqaqKuNzK3B1tobNpY9xZPm6w/7kEkaJ8vOoyLBQNQriPo16KqGGEC3
         OqPrLbp9z+6/Vh9+y2d49FI5DoLbfc5+yfNpk6DMV+/TjFpXYdtoMoaAxo2TwfH0Smov
         zF9Z90zUDGMNo9nYnNNxz+Fuyd1jMueOsTpc2gq4EzNVctYCqKCmI/X6Tb5FoDK9gYRx
         OeUYwESwlQoJuBsLx2Stum0kcNHr0O47Pr2rW4i19G9MaR8bX9V7JqQclgOpHunvCXhb
         zq9y8RrnXASGMmm5X7gbK8VqxVscqeFOORUcy0R48PFR/qgpShObs4f/XPI+I34molsu
         NjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729634; x=1759334434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIYU8qrKCG63qfESQqAYHq2vCT+r9zxfWJIkv0fUrK4=;
        b=YTfZMicxptKBjm/knjOJcZxEZvEN22e9BHMwRpGWOb/RKxq8qgRWuAqL/rx4RW8c4T
         N6FHhI8ECVsy8xgDbtbZsg4qAXuQMRoOMqI807npb7LD/B9FkTnUocRBlfM8JsnGt/h6
         2dm1UVZlnPFF6lK+iQgnPRVEOoeLHt9IFUzwgmh2Ul/ia0rOtPHusOaDek7EAunhHB5C
         JcvM3BRSzghk/QdPUOhgJY9ymAexxMt1M5qVBq8+fewXNoBCDJcHMFkXv287HMPRwKum
         6PBxEIIyRuTcCNECQE2YtUFCWb0qG41srRFy9pYFHMTr460x/qCrsSVlw9PurOTIPaBW
         wiWA==
X-Forwarded-Encrypted: i=1; AJvYcCUluIWnFBwPFYU2ROxHKVJkzVEEyPII7qtv363DDUOxW1pg3Q+10zN9aL5tdOfZaaUGmKQx/cPEXuAJTRPME45U@lists.infradead.org
X-Gm-Message-State: AOJu0YwIk5z7umgPUZVoxZlXTA1tJ1s4WyP3sZQ2fF1M6/PngHwIwghp
	PEkRHIlvTR3zUioQ4+D6ktxBOCNlGBuR/CXjw9Jqv5cdb78GkalEuZ6uTuQqVMpkXvc=
X-Gm-Gg: ASbGncswYvkEgTXmLiqjmh6uwuhfLpr1P+GrTXaGYOEqyiyVhP97Opbt0iKZCRaDkwl
	6sWrGZSEDTIwbfogvJ29UR4FGIgjJ3zSU9/tLYdIetGh8Pw0GIphr7Dcl1BRE+oH/LfhINygblj
	DSEDQs18QhWlmxz3uQMC9B6K7XO+GKsWS/cmzTkl4SRA++S1U62FWiJivD1d2JOFH88te0+DNAd
	BTKp3wIP0gFnN6BNGxyx3LJkOlxKpU6U22aBm70Ar95EoTNagc4Hf4ISzORDvB9I80lFTWoL+bM
	gZ6hppAhiegLLhjCOPYQb1tFAcjdatEybeHlJl4Ds9XjZ5mbvcPe3xoE5t9z+jQAmjZ5ZjhozOv
	OKKCRRtjNHaU84jo6/GrjlJ7dUA==
X-Google-Smtp-Source: AGHT+IEr/xCPYlRIQOGy0m52/J9vkL4EaMZaXgIFMjJ6l8pxzmajhf9oWnQ5HbRALQAcj/6nHTpS4w==
X-Received: by 2002:a05:6000:1a85:b0:406:5e66:ae65 with SMTP id ffacd0b85a97d-40e4d9c9f20mr466144f8f.60.1758729633869;
        Wed, 24 Sep 2025 09:00:33 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32bf95f6sm549345e9.2.2025.09.24.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:00:33 -0700 (PDT)
Message-ID: <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Subject: Re: [PATCH v5 4/5] clk: samsung: add Exynos ACPM clock driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
Date: Wed, 24 Sep 2025 17:00:31 +0100
In-Reply-To: <20250924-acpm-clk-v5-4-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
	 <20250924-acpm-clk-v5-4-4cca1fadd00d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_090035_927228_6A0FDBC6 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Tudor,

On Wed, 2025-09-24 at 15:11 +0000, Tudor Ambarus wrote:
> Add the Exynos ACPM clock driver. It provides support for clocks that
> are controlled by firmware that implements the ACPM interface.

[...]

> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acp=
m.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e8354168a63b1427c2f3faf1=
5e4e7955e924dc8
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Samsung Exynos ACPM protocol based clock driver.
> + *
> + * Copyright 2025 Linaro Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/device/devres.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +struct acpm_clk {
> +	u32 id;
> +	struct clk_hw hw;
> +	unsigned int mbox_chan_id;
> +	const struct acpm_handle *handle;
> +};
> +
> +struct acpm_clk_variant {
> +	const char *name;
> +};
> +
> +struct acpm_clk_driver_data {
> +	const struct acpm_clk_variant *clks;
> +	unsigned int nr_clks;
> +	unsigned int mbox_chan_id;
> +};
> +
> +#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
> +
> +#define ACPM_CLK(cname)					\
> +	{						\
> +		.name		=3D cname,		\
> +	}
> +
> +static const struct acpm_clk_variant gs101_acpm_clks[] =3D {
> +	ACPM_CLK("mif"),
> +	ACPM_CLK("int"),
> +	ACPM_CLK("cpucl0"),
> +	ACPM_CLK("cpucl1"),
> +	ACPM_CLK("cpucl2"),
> +	ACPM_CLK("g3d"),
> +	ACPM_CLK("g3dl2"),
> +	ACPM_CLK("tpu"),
> +	ACPM_CLK("intcam"),
> +	ACPM_CLK("tnr"),
> +	ACPM_CLK("cam"),
> +	ACPM_CLK("mfc"),
> +	ACPM_CLK("disp"),
> +	ACPM_CLK("b0"),

The last one should be 'bo' (bigocean), not b0.

Cheers,
Andre'

