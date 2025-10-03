Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBD5CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ey2hQl2GChdmjWekqgYe2FevyryAIx9lLcUl4a62x24=; b=196tGJa9VESi8aVY4mouu9n7+a
	ITbu/OR+8aih4vpqmELtZIc3Piq+fnuZ9E2alon2Q5G4Lc5Omdb3trVXnYbhOF/qzcyBoO6QNhK6y
	VWah9oGSZx8DQCHOcUC/GFHYnSkQCnvC3aIa9/r/xl/Xt1PSAQGvFOJfwnZ5C7t/RSnf+/d6t7VPa
	su7ootszQYKkM/UhnHgMw26KP+MIV+NDwnRGsxpQCBjxLhWo5X/omi3XX/QN1VnW2OhInY26QmA1L
	vbwY9UbCUrfUoP085RtBW/FUVqYv/Ee1cjtP+FqHkz0N9obhndoUy2V59WIwAQEkjGCFlQDwQ80IO
	ZAIwVB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4j7v-0000000CmhB-4Aih;
	Fri, 03 Oct 2025 16:59:27 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4j7t-0000000Cmgn-0ZRl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 16:59:26 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71d603a9cfaso27247947b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759510764; x=1760115564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey2hQl2GChdmjWekqgYe2FevyryAIx9lLcUl4a62x24=;
        b=qkdNxxFHJ+SKwEdXJ6lYF/NIX9rwpJS6/KnDOLBphkPp9VqaPenOfVyBBKKWTUqYWE
         Wql1m7NWUPfCRJ9iRDSlxu1ZCk1Rt7y9sI+17HIma5hUCC9tSiUXLcRKeWeCoGo31bba
         gPF5MKQREzDW49TmhkIgY9rXsU+zJ7OQM1dJnKbXJxbQFDYVpcbFCLEKIjgfCp4xMRdS
         ErpsiJbao2IAfU8ruS9gwdx4oWsnx9ekTk1d9/iHDWethPPLuCcsxC6lJKGUm/blMxKx
         iKr6A5zjQJ8hOpT/OI+xeRE8fcNfrtnAF8dJlZmnAwXoUKnZwoKdjxmaxRqNC/erORCR
         hSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510764; x=1760115564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey2hQl2GChdmjWekqgYe2FevyryAIx9lLcUl4a62x24=;
        b=pOBvQcSAu5oAOiN9AqxFNcPJeE4u506EhugkxT8GVaDxfZTkcqrG22e7oj0Gyu3X6N
         to7UTvfUYYuZeMWX9Qdhgx1b4NohWkI5ogGiDX+e2eq2vLOc7BakwzgotiO2ehdMjtn6
         52/94ZySl4hnX4GLzwVF2XIFsR7YzZ0az3Lri8fEyv3nsnUimCFu1P1eCjEhUTf38F7W
         uUA8hu0zqZAeyviKdKph0aS/YYtOfvguUrtkXJJyBj3yfjLmh/Nd5phNBj2INhg/bZPU
         R7fXv90jcnynYG0/xaCjwRBMi0sFYrl7r2dTmZODj1CYaLeOU5UZd8OZrWituNdBskhX
         J7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4JgJq7+8X0xOKZAIYs8FWbxqiNRO3hxvgEXdQQV4wa8MDsqggwIzzySCVf+bgfp9nDvBA+LaqxMSxfChhZIyc@lists.infradead.org
X-Gm-Message-State: AOJu0YyM7Uqmha4oUms8iWfzv8X3UytclWfB7NYjWHLrpZ7Noq/I0xSn
	XFzcpBioxlUSIhbRCqq6TmX6EBoQnZLX337EWkCA0qt2sPD2zfmWlPyA3csqTvYV4IQniBKwwPC
	gEHPeGvX6PcIfsvEzF/k5EdG3uJMYf72Q19DqlffhEg==
X-Gm-Gg: ASbGncuEeyhcLY/7ewnaLrUB3pVP6/qxPGRy5MW9SIX5ZsIaQHTq6t2nO8fKvDSqqTU
	dSKLkisC0LmKaGqw7WaamLtlvsQ7MVMhHwc3ZDqccWn+DSHtvHklhZ+1r2IMkOL1SWxHbuU/Aj2
	XKmstSpzXKuE1jLxCMezHHRKgPQ97taoBMjZhWMw6YXChRqNFgma/edE9Muwr5xexO65XPKxA7D
	DoECDgaXn6Tp6dZ0A4QaegGF8/o8B8jaw==
X-Google-Smtp-Source: AGHT+IHOSCaya5j1WrgfD13q7VBprpuwNz0wIhGHOie5nbBRnqRTXp3Veun2JVFCeXU/wA/r4XvdbDN8sLUyI69MuWU=
X-Received: by 2002:a05:690e:5c2:b0:635:4ecd:75a4 with SMTP id
 956f58d0204a3-63b9a107887mr2589211d50.50.1759510763543; Fri, 03 Oct 2025
 09:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Oct 2025 11:59:12 -0500
X-Gm-Features: AS18NWAFV0JyqToeLM3t4qinDcAm8LWFKJnGlvlSB4Xv1Ko_x1ir3nxFWFGI1Xk
Message-ID: <CAPLW+4kAzXmd7mv279wMJCT0gVP5A+2Xe0q3MgX1OENH5PC2dQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_095925_190337_18BF4252 
X-CRM114-Status: GOOD (  23.94  )
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

Hi Andre,

On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Accessing non-existent PMU registers causes an SError, halting the
> system and rendering it unuseable.
>

I wonder if this issue you describe here is similar to what I'm seeing
on E850-96. When I'm trying to read these files

    /sys/kernel/debug/regmap/dummy-syscon@0x0000000010020000/registers
    /sys/kernel/debug/regmap/dummy-chipid@0x0000000010000000/registers
    /sys/kernel/debug/regmap/dummy-system-controller@0x0000000011860000/reg=
isters

I'm seeing "synchronous external abort" during regmap operations
(judging from the backtrace). Do you think this series fixes the same
issue on gs101? If so, I'd probably want to adapt it for Exynos850
later.

> For gs101, we can avoid that by creating the underlying PMU regmap with
> the read- and writable register ranges in place, because on gs101 this
> driver controls creation of the regmap.
>
> This series updates the Exynos PMU driver and gs101 in particular to do
> just that. For gs101 this is easy, as the exynos-pmu driver creates a
> regmap and we can update the regmap config to pass in the registers.
> For other SoCs it's not as straight forward, as syscon_node_to_regmap()
> is used which doesn't allow passing a custom regmap config - those SoCs
> are out of scope for this series.
>
> With this in place, invalid registers (by drivers, or even plain
> debugfs), are now simply skipped by regmap, leaving the system useable
> in that case.
>
> Cheers,
> Andre'
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Andr=C3=A9 Draszik (3):
>       soc: samsung: exynos-pmu: allow specifying read & write access tabl=
es for secure regmap
>       soc: samsung: exynos-pmu: move some gs101 related code into new fil=
e
>       soc: samsung: gs101-pmu: implement access tables for read and write
>
>  MAINTAINERS                                 |   1 +
>  drivers/soc/samsung/Makefile                |   3 +-
>  drivers/soc/samsung/exynos-pmu.c            | 136 +--------
>  drivers/soc/samsung/exynos-pmu.h            |  11 +
>  drivers/soc/samsung/gs101-pmu.c             | 445 ++++++++++++++++++++++=
++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++++-
>  6 files changed, 797 insertions(+), 142 deletions(-)
> ---
> base-commit: 5eb97efbe6a375944984e7fb69bb632d2879c841
> change-id: 20251001-gs101-pmu-regmap-tables-8726ac9f853e
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
>

