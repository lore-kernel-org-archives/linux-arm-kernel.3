Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B043CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=; b=Nwi2fJR5c/vTUzbD1WjsUUS4sx
	DYq9a0u2gWZ0YWMLThBrmPyc1OxXS6OC3XgJhBfkWoBb/zatyGRCc+35Y9z0/dF2O/V0jbAFlhTO7
	j9v5a/HMV6wtvvXVurZAWHxuBtjg74Y0EndCnCGR8tveVsp9w2Jfy9A2iZI0LZ+BuPhRKhK8D5o6b
	dtNhigI8mOqZ23NT1G4fsVL1i+MdNU45zX+3rKiWXKKom7GNdfSRQyPMjoOJDXgDZeMDs47tTqXvZ
	glJ/bnd4DymIdYiFC0acB4tmafMCnwPLI2vfToPHSX/ijmy0OYFJCSH2yNHGDHSiboU1ZxPvnL5Yf
	QDPNzphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Ed-0000000A4T8-1GKI;
	Fri, 12 Sep 2025 14:58:47 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Eb-0000000A4Sa-0Dlr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:58:46 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-621b965a114so1173657eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689124; x=1758293924; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
        b=pGSKf+zRbTkRoxHrRSBbqO6fiM2cdHybkUUo5GwvRHg4p3DBkhKVzgO7caNL4N20N0
         BCNjPuZt5ibNQDN3TnuZJjK/XlDA75F4MCZYzblh4GEVDoQAejIz5aUBOn9VtS8xZrXH
         CDhhJBWEklucS29uPGA4WmDzSx9UBHpyhzAgDy8mXQnaJWmAFgUZkofTL3VacQVzHWEL
         dPE3slvnQwp5provrVznffJcLRnB2XkSnDk/kVesN9MLfH1jlcIN9jXVpenr7apLb43u
         k2193Pvbicmqqzxsn1glEyK/6M5UZ6YYDzuWKnE99fyRLB/5ayqERQdzdFq0LJ+7I0US
         eJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689124; x=1758293924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
        b=YMp833NNlQ/ofhUtb/5NZYJ1c8kqUPhuWswzwMyVdtbR3bYiccr/BoEmn8/8g9ivmn
         rpSgWmOJtCzPiNGne5hD00S+5GSiGBGUXSzvwHXvybEIq0BnOnG4eCz4FqG+7DokBvSD
         PDKTtPMa1yL4gOsv/kjnm4SphZQpusCdqq6ZAuHS72/uJQhxuPxWRka71o3sHnb4oA8Y
         IwE54nTRQYH/zOBUD9i8kGbv6GRhYAJqK88L7IbNYHlHC4mYdTD2oexYo2CD3FmwutrJ
         wTE4IQJevQJZtlQHuJEoT8ur5wi89EE6Mra3S/afx+Y7v5KL22n5QkxgWyr1cJiPJM7R
         S8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0HqQs5Equ/L8Kgmdofq1X7i+O5f4sT7wGoUnnGSE0iZir/5ImgKdDPMpZRsmUE1EoyJMhdrTuNMcW5zW5l8Il@lists.infradead.org
X-Gm-Message-State: AOJu0YwDaWIJFFgEnO4ugIQhRrsx1YfNe0zw+2ROOrUg2RdORY1r8RHM
	F6BgZDMXv4ucW7MQBEEmdvYDR5xmsYQdKBP8prrANVQGAnhfOICc1gu55VL0pDrOQyI7egomU6N
	uVcBrKf8IsyrWQiUrsq9+EhE1xJEFCkYJ/uGOpk8UZw==
X-Gm-Gg: ASbGnctDyA65eNB985KT7eZ8iCS9u25X8nevV+hKj9o2l+Vc/HtcewwJJ+/HwXUhi/h
	pnrGtvAIbMWqUTTq6nVYfvx9pfMbnrXY9VztiroW8QNlbE/oT9S6COheeMU99Ljx5pwOO7lWi7L
	HHITlJ9UkBLGKL5uZlu5jxn7NF2JHfWgv0pGFy56TUh22aOzjvEC3r1fz3MprEwvQSHSNj+ENcl
	KKmas9zg6dW5mX5uA==
X-Google-Smtp-Source: AGHT+IHAJ42BGc4DV3+A7HRXSgNpI4Ckz1R2zEcxWqCWvdlWoM2kBfvVDgKpueHQzqgzBraygif8YB0P1rDNI9gE4qo=
X-Received: by 2002:a05:6870:b907:b0:315:3ef4:eecd with SMTP id
 586e51a60fabf-32e553a280fmr1618278fac.17.1757689123738; Fri, 12 Sep 2025
 07:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 15:58:32 +0100
X-Gm-Features: Ac12FXwxoqn3zsYfC0T8IDf20S9zDpzsxcpDfKlZfpZdk1czNZgS3-vJNTlzLBQ
Message-ID: <CADrjBPo8L=P2bHKTFvYOj7i0u6pA7vs32d3y+4Ho+82Z1mRE_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] exynos-acpm: add DVFS protocol and clock driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	willmcvicker@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_075845_094127_938F6082 
X-CRM114-Status: GOOD (  17.63  )
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

On Mon, 8 Sept 2025 at 14:13, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Dependencies description:
> All patches should go through the Samsung SoC tree.
> The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
> If the clock subsystem needs to merge the new clock driver, it will
> need an immutable tag with the 2 patches.
> No dependecies for #1, #3, #5.
>
> The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
> are variable and index based. These clocks don't provide an entire range
> of values between the limits but only discrete points within the range.
> The firmware also manages the voltage scaling appropriately with the
> clock scaling. Make the ACPM node a clock provider.
>
> Add support for the ACPM DVFS protocol. It translates clock frequency
> requests to messages that can be interpreted by the ACPM firmware.
> Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.
>
> Thanks,
> ta
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole

