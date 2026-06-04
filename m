Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5130ECD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=; b=I7bS4MLoPUAcLHguiP/Dkj56dq
	rlGlJEQU2vBI28pqr/KHc62HKMne7luaJfzdnusUPsMjh9rSj9ZqHL5AVULbmbHuRttcDZN4+vO4j
	g/VoGeJmbx/jpLrs9NzxAGMgWrIOdfJgiFmJBP6pQcePiongacsIsTf8r6ftS8fMYfVCv7uzziLxe
	WTrMaWRWgAih+cYqqUwSm8NNmPYdUH5dvpiKbPbqoCMV2HjXwPGJ9ed4tjF7ifC3WH/DRFS39nyDT
	gQ0ZH2GfanVxO8jDOKcasTKLzyuhD923CQ1aandDwR9nVmYnnQhsiBSM1lY+e6eoAmStXelBjfIdC
	5gyz9izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV78n-0000000GiK6-2gwp;
	Thu, 04 Jun 2026 12:25:41 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV78k-0000000GiJh-24Ok
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:25:40 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso724551a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780575936; cv=none;
        d=google.com; s=arc-20240605;
        b=OCKfxrAgb/DDsPEICuRJYosXhf9YN/OMvUTZNJBsekS3whxbV9coFAMXMgRVFUyyt7
         JwWP1lMml49renp3ePjdERP0aZOH2D6BPMVmAyRVrWdiHZmle/x99hB9Y4PFa75yKAEa
         o59rFqthmjWZ+Hfy75+XZg0wXKHTcO9qJgqPFMNi6VSUhKG8o58z4dN0Fgax+JHasP8+
         PEA9dwySQDaUWitoHboMvvOBmzsAKM3HHn+aqUs988ckQfS0bh0RZq83yAPXyCNBopdR
         oBzJPhcw6iqEaZa4UwsNV/1sVarj/zAswPwsrOIWb75MCC9vdb9uP9hMbtUsY4Ki+wXw
         Yo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        fh=i9nuuJGBHpD5r7cMLRBdWN+Bt7YrZroWZadyuDGgCo0=;
        b=L2W/OCcItLMHE/ZqMMXa7nLF+wmfmOm2Gu5mVLLJH9RFDN3VybYH7mH7pHbDGXWHoV
         cXrv2k3ojcjOx+3xtVT8vBiZzkjYeviY+ZCPRpKGmETHLtaSvavG4gvaZJzRT0H6oc92
         bOvHqG++P78S1XYuXabpHXm9XxH8zBknd9nY6z1QywsrApZF3K8PZy3+N966eAaiFWKr
         y7zvsCBen1wGy4GVU23iZBgV0nrVQRiHMcqWMRtErTLAXENoIn686Ur/hB03oi0wnCfv
         aZ0P8srtWdEvRxyL2FRDuN2sbA7JxC4PUx6pWJF7ZU3+GY6lsDSp86/yFpHAROXHlv47
         +96Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780575936; x=1781180736; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        b=vGp/wpqQxQVY0o1bzJ2k742J7hGwIoSSOteKzp3O0Ixz/pgTzkeecZDcGm0HB+l5lA
         3ch7umofuzqWerUfCL0YFBPAGkaNwhTaaMOviM6l+VKJv9BUlCQ/vsVzmxbDnp4YpHHv
         dM1SIm455K/y3dnrt/353Nnr1PGfFhvCViSSHfPRVSfzAF7hBKdpM7YQcJfh0dzan0ym
         MYvyK67NXvxzL/765cUM52wRprsIJOASpTh7NisWsbGVxouqTmnvnykZ7Ji8QkmusxI+
         93CeKXfO6eojrx6Ta4ucpq3VqwTeY/jSNJF6vKXb7HDxqTfehTGaCDaU4+VVX1GhesRj
         2ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575936; x=1781180736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        b=GSUmoaLCLmviaNVKT2s/XzLU7rwp19feWhDH7NnEBj7khAwW6SQkAfqiImleMzJ9V8
         br2lPziJUm1Ll7ubiwrDVWwGGoHNcugZhoTVtbY6vhcHwcurlNQz5/vWBdvP7r9/50/a
         4UyBa5zhm8EEox8ExuMTNMk3jaa0DWslvG0B5a7JfipAsNRAI2r2X69TEDRJP0I8GxQO
         PWNx7kbqUmxbKCXUC31+nIMtZ9n/xv1KMfZ/5PkUBxsTTGitdjfjbml5txYeMLFagdIk
         mEeFnjLSNAeP9HuT4x48ihcFvMGtUorx1LxPOSQScOzYySRZdLIX/d+q9IkzPO0nJKk9
         Iktw==
X-Forwarded-Encrypted: i=1; AFNElJ8KLQBkHon9XQHErKlz+jGxRktRs3tjUbJNpK0J3P9vIgreE0/sn3QgOr03XPfJp/o7yxU5QfjQ9KhEa4jtmq6x@lists.infradead.org
X-Gm-Message-State: AOJu0YyCx++zQZ0TT382Uz9w7BJ4JYhfYuHkOjlV1PSYyDsGClfhB8+2
	L81VWaSA8yiYOBhlgWFKcMFMrh0dLX/F716xg7GjVS7aXqEYCEJpapEjj1P83fWKtXj2JpaLOXP
	kxnkJbGQ6B0spz1UyS74ApYwkjfuB1uKgeL2onBvenQ==
X-Gm-Gg: Acq92OFHF4uHBLYvrENMHEpCknfL8MncUudzGsLlvn69QgQaHowwSgHe1cAQCGqmYYh
	aIXoOZKJcl90Wss1ZIH6PpK43bytWZ/XbB0ypSEHMpwAHNnHhZvRhyUl+5wFqjfI6eR++QPdST6
	Gljhy+3uqC4kME9MYMuShdMjMCIseqHHGBx0dBnQKNDV/P4TXa+jzucSBTzi80TqXJUW1znjgvi
	PWu65ajERr2qSpv2cka1IKwSVr0ai2KNNh51vwSUx5B6XvKKBNn3yuFouH2bBAVyQUzztwyFv4T
	0vuiCwaD+ML9JDU7rrAaSu2RhBQPJG8pqFHepZ98VRp8BSGE
X-Received: by 2002:aa7:c3d8:0:b0:68c:3439:945f with SMTP id
 4fb4d7f45d1cf-68f0f3ef6c9mr1109192a12.12.1780575936462; Thu, 04 Jun 2026
 05:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 13:25:23 +0100
X-Gm-Features: AVHnY4J8PoxEVn9YHkIV62f2JcL-eq6_poQLFyumkGxMP4pQHp8fyUwqwpP8j1s
Message-ID: <CADrjBPqXnv97XX2y-_YKi4=NCJw5CcaBd5b9ibQEHLZ5N6ZYkQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] arm64: defconfig: enable Exynos ACPM thermal support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_052538_552275_CAFA409A 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
> to allow temperature monitoring and thermal management on Samsung
> Exynos SoCs (like Google GS101), used on pixel phones.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f93..3fe76a4c2633 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
>  CONFIG_BCM2835_THERMAL=m
>  CONFIG_BRCMSTB_THERMAL=m
>  CONFIG_EXYNOS_THERMAL=y
> +CONFIG_EXYNOS_ACPM_THERMAL=m
>  CONFIG_TEGRA_SOCTHERM=m
>  CONFIG_TEGRA_BPMP_THERMAL=m
>  CONFIG_GENERIC_ADC_THERMAL=m
>
> --
> 2.54.0.1013.g208068f2d8-goog
>

