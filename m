Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5830F01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9tE6SYwSgsJrr2u3o4fxvU0+ZPS0+ntS2T2Xm0Ak0I=; b=pgIBoI0gTo2lQe5P8p0SFPF1H2
	hTshB2W/8AtNsJvihE8ZrusV5oempift612IZhIK7mbQbTJNG3kOXGWOK+WrAZIk58Ef37HnmOki3
	lWvelzLntE2CoyrccAA2SOrLN5TV2w1rhUy4TFiS2EEgAsBH6SCQa3kffcwW/KBtcuLpOjyK+YczX
	HhPdGki+j8uaT3GOjJI4KUhU9qpJRKIUQLfdOZtA4epv+2xZLpnaiOlwKhxjSe0cehEqG4NvoAr+v
	wzMjt7TtSLENIOhGn06ws+5CnMsWAluwjDQxVjYjcLR7cY/SwddHPSIyBnC6wJA2O6w5vmtKvKJ9r
	Xj/by9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVU4-00000003ou3-0YjO;
	Fri, 06 Mar 2026 13:44:52 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVU1-00000003otf-3ESr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:44:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-661be3380adso552690a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 05:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772804687; cv=none;
        d=google.com; s=arc-20240605;
        b=EaYzSyfV8nG3QlP3aGk+szNHWS7O/l+tjie9455fOECs2AuxY9xUznWMO2v4jQeUVx
         Vi4eJm3x0rynYUwwSLuqUVyd2pJX6Lmtl+JSVniJf4cQIzL0HuZq7zOBAA278oFtDtRY
         f9CuvSMFffnTdC9jgN+4ULPT6t4YFVCflM99yazaP03ICtFMs7vJLOzr14S3AkeKRGbE
         RVjVK5xb7Jmc8TByToM99jQS6hdWPup4rNGYwACmL9SBFJHRpYYO1iv5RuXNG96xYVRK
         LN1uVWB+kJhIWrfSpgLk4gGo5OHOAx/lZ1Jdy6AjLPiVxnZKZ6FR+picu5RudhxpHj3z
         0epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d9tE6SYwSgsJrr2u3o4fxvU0+ZPS0+ntS2T2Xm0Ak0I=;
        fh=PpaETdVKscLhL6jAgRSVwlKHHnySqvjsvBKF7ZpsTmg=;
        b=bTAeIRev9isJmBgFQO4bw9yZcIXJN+5KSqnjGCTkU3Iqf3DUu9625+v5U7Opd/8ZuF
         ov/DmPEr/HmfdFG4vEc1EpIwyxboHFr7DPyho5cuG/oCFlr6DyGZaXhCQ4Sz4OxxPeOX
         mZsK5hqe6VdSqIRtPZg0F/N2xFWbKzkgNNmNb1nBRqGdkoyEGk5SMNqXSSY8ksroN9fY
         w9k1QsZ5xmhF3FQd4EwIGkzOZ1Xjd7zbtvcgf5hKrHnpCBLMnS8Mn5YtYeIIbGMhF5Ao
         YBwLs6nVvvdc+gmk7Y5MK6C2HjSkDtMVLA7pjXRhE3k5/3kFPyCj6MqbcgW5kUs9xyW2
         HWiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772804687; x=1773409487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9tE6SYwSgsJrr2u3o4fxvU0+ZPS0+ntS2T2Xm0Ak0I=;
        b=Usa+XHwCyPkC1J/4MKpAG6iqqwsm6ALQjlXNRrbmkHYj4GIIxn8X4OVsJuZa3Mg53y
         cGz+5UNzP0jXD9+lcdlJu28ajAB8aviZbWiVrcOFVvI6n9pqRCNP+pIF/QMvy6tPDajI
         U2M5C5mx6bN79N9EJOvHx7J1QFZGnwjvIP2EhyvT/5dol19g/idPGPGDL7ei2iE4M31L
         KJ7Bw1JtTpzbMklDtSS5A6L2qcBqLHKbewQcvnhrDNpsoc7cqgmJZ6cBTTaCC/YRMEMW
         C01P2p61Gt0ejlwWzixhmiyIQ7xsRa1s3WHUD5BZF5YZdEueTeI0ipwSRRu9eNn8WW6U
         OLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804687; x=1773409487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9tE6SYwSgsJrr2u3o4fxvU0+ZPS0+ntS2T2Xm0Ak0I=;
        b=bNULMo1VSRXuQfYqhCYuk5gSExz0ESNW8bQgUd4L9YSryhDLEL03kWenR4t9VjdNW+
         UgGqc+2M2GRa572WQ9HknrCuPu9x2sPc4ibLxnf9eeGKphgrRpF5FUiVCMLPi4U462jg
         Abej/EWxycF0dnkwGOX0rQQ1nwRlD7kf1clytRiGaEVAEDS51uxrcefl7Ivs7rVZ8lAw
         L7clE3Q8/I4yGQ8pN5ARLm5+fTq58CGjfIcPpJsYpSuU1w8ZoL1JBYhr5Sv4U2TEn8Jx
         vLWjbvMNU6kZKr8gQfPmqirjWHM6RYpuBlxcpeTOGBJs7sY/yGVWrNwjQczABaHRADod
         bJsw==
X-Forwarded-Encrypted: i=1; AJvYcCWWfgFBzxQa2tieAQXm7OqUssRA7wQ2Z4prhLszoJibYBDWTdPNPVIKUg2DS2zbkFcgH3wAcRiQCxyjv/n8qFpi@lists.infradead.org
X-Gm-Message-State: AOJu0YyCqMCErxF5JKnx0VNE0G1RCBhH15sCl6VqWXN/CmCWZO9rUenn
	x+SbRjf0eBAUimBqFH/DwbYF3LIQw8H+6LdEyI009pCHRAWeZ7zfX/2znrCmaKi4MW+1Kw5Hhmc
	wy+OS2zaFpYA3Md7B3vgloChla90Jd1SIkuiNtlD72w==
X-Gm-Gg: ATEYQzwHelvaBIz+DT2H8l0TffnUVqqOr3eDzzdwF7Gx9l3R9FEBqf4EZypocbvd5hl
	q1RJX5G75TT9i/JuAhG2fnQpyGjhCo9yUUaD/ukLhgzbDdOWWjf5/32iB6rMy47egNmwu5DMI7o
	G0sciPK9+QfzmYwc5nnh/QxSsQAT4F5NSfZ7bQ6xCWMLwioznx732y2uS5rXp+XYlN/G0F6ih6G
	WS0ekBXa+G0liCUZl4SOldEW02WMNFvNaIWdrn0CDEymDv/nSpDhZQSvmPqtCRM7N7ir4hEGSgv
	ac3hAz/bxgbRbQNxu2cr3GPCtEQlCtUk3Ycv+UsHZA==
X-Received: by 2002:a05:6402:270a:b0:661:3f3c:400d with SMTP id
 4fb4d7f45d1cf-6619d518a9amr1086790a12.26.1772804687337; Fri, 06 Mar 2026
 05:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org> <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 13:44:35 +0000
X-Gm-Features: AaiRm51h_tbggsegFnRWczT_UoE9IcJIFd8TaOFwY8gKX5lWJfUXchYtPyM6aB8
Message-ID: <CADrjBPrC43gaRZw8289a15PLBN8ideWvO9jJwPr5beRJ=x4Rbw@mail.gmail.com>
Subject: Re: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_054449_840219_02A62707 
X-CRM114-Status: GOOD (  16.12  )
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

Hi Alexey,

On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index cb55015c8dce..e3f4fe6ee118 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
>                                                  IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };

This should be ordered by unit address (so in this case placed after
the pmu_system_controller node). Refer to
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Peter

