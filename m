Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13984CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5DP9lHEHxCZeRxso6ploohANo8ljFzvMmesuroyCAA=; b=a4OFxCjdc0pI4huOt0BVhlkgTj
	kajRqgMqoq9028BMicmbIHFdq4QgSx0VjwMR/6URm2TI9KVTjYdDbyhH3BJZgRsJrV7bEb1+vfkhq
	3E8C7F0sw6tCoefKU6tAGqtqILD+yfouPFkZV0Dzayh2XppNTFNXciyEgVY4qLU172qAid8Zh8kZq
	UJOKqh0Z9kHu55ZOkTSzY/ThfJB1nhyUVAv+yR1FokBa6ohJv+s4kKjhHsl0V1RLO49oa6fD8xVEy
	NdXudmTYgFpL9CKew3oUUIAa/OY8wTVw5Ia25cc1IT34tj+fk3kLekQCqd7Qis8AUm47FDrBZdPZY
	T3rHWvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux53Y-0000000A0Zg-09Km;
	Fri, 12 Sep 2025 14:47:20 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux53V-0000000A0Yl-0pYW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:47:18 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-746d72028e0so1552625a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757688436; x=1758293236; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n5DP9lHEHxCZeRxso6ploohANo8ljFzvMmesuroyCAA=;
        b=kkYHWLlhHvVFY04Hpi2Zj2qBC8g7+uplc7wIJPCrnpx0RGhv6iJ1/L7a1I4fnL8Dol
         4lv0tYpg0guzu//RpuWabCjwU7PWmKZhoUuaunT+uBphruB9osYmzvL0slxSX6DBD42Z
         atDRxvkDglBCH+SLnRVYjl2ArgwWf7JCjNDSa4Q8IxOSwN2c4qZPE90XCCzN85my5fE/
         ge7YPU86tY7V+gbXHdzAbxH7Lg+A4ixIc/XyIwz6GN9hnQ+ADc8ntyEIL1PSnHxrlejv
         CyIMY/2z8mrAvPToxASEk9pXKDkCJe1DK6oxOwpcXFSeeNsfLhmHB1boXGuT15QXB16Z
         Uwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688436; x=1758293236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5DP9lHEHxCZeRxso6ploohANo8ljFzvMmesuroyCAA=;
        b=jwTCl2hEBYbnV756tX19h3vjR34wm8DjgmghtfRuzbXf2mhYrr5cpZ+L+UtsEdca4m
         W7KuhVToBz8suxRnEynl62Sf1/RDqI6ZSG5I0E2ZLw6dNrwqrY/1gvm1zREz2X/JvuWA
         5W9Vt+wqQh8WXHLEmnVX6Ntg7o9aS052zWPogYDJQvYfwEpUjnMZnr8FWdF5tWxazliC
         4yzIZlH5Q/F2TjZRZOAcdeNNChgeEZa6n7IubcTzvW8yBUokF634pmdxgTbbTsDC9YMM
         0ihe7RQfLr5/MLW9rHAemFaDPy4Bl7VSTqwSU9gmb9Unm77ifC6SiEluSlEMJ4OfmSl0
         d0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXEDidNObJivVd6QnsoJqu1zPM9vFSwyLchCjBOuM0z+tT/qFF4gTI0apTSzf2gRyh+DYSGvW69CBU2yDuNaMH@lists.infradead.org
X-Gm-Message-State: AOJu0YzuJVNs6qeoAXLdVRR/TXk4KSR5aqDIOqI0+6vnLLug9LerjwYj
	Nq+kf8V7sdCqFb2KZs31scBTgfhQH/mqVEewUzWF/a819QhYJCaysM+2Cbn8kHXKFT/HlPeNrCj
	X/R1dNfB5ttjw2UyCkp3g41zcdKMOKY/EczZqDudh3Q==
X-Gm-Gg: ASbGnctVVtPXfkktr1f0TQFM36fCfkLZl9kU4LUOMtM78i6tbV84Ncx4b4KjpVh+R4M
	E3CB2TuDxHmhpr5TWINi/2o40PaczDE+8E0G6UHgf0HmLg5FCX8AL+RontiUBewF+/oRjTpLH8S
	chwRWBQMjWeXxoaAim5deZGAr1vvS0Kg7iLqIm9B2zIkd3OU0OaWolORXG5AxE/v3Hrs7f3K0ay
	Hx5QlM=
X-Google-Smtp-Source: AGHT+IGeyQqSFM5GQBH6iCx5tixN2uUYqtRIakzVl52m5pJ6MiMjEL31OlCuxkleyE+f7rCgdWR9L9hwu0O+n0AMn+8=
X-Received: by 2002:a05:6830:2115:b0:746:d4d3:c8b3 with SMTP id
 46e09a7af769-75353b6e84bmr1706635a34.15.1757688436065; Fri, 12 Sep 2025
 07:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
In-Reply-To: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 15:47:04 +0100
X-Gm-Features: Ac12FXyJH7pruBCqQvGbq77_X-ntri0UZ8m2NLg3fLfUFTSIie9VvPVCWn3Vxng
Message-ID: <CADrjBPqb+yw0DS9ZrGhW8XSWosWrczV=nMBG4pBPvCVFDpJQ0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_074717_241540_EFA58F96 
X-CRM114-Status: GOOD (  12.46  )
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

On Wed, 3 Sept 2025 at 15:24, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Define the CPU clocks and OPPs.
>
> Patch #2 has a dependency on the ACPM clock bindings sent at:
> https://lore.kernel.org/linux-samsung-soc/20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org/
>
> The following error will be seen without the bindings patch:
> arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
>    10 | #include <dt-bindings/clock/google,gs101-acpm.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Thanks,
> ta
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole

