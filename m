Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E8C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U+cJ54sadwbAEEQ1XMnFeXEpukGhrX3NXgbMiqSEdc=; b=ABqMcukKHo8KeEX76OKOQ+45uQ
	W/mRFsAOCmtj7lLU/+PQ7w2Y8ONB9hBwC1xGsY+Htks/4B1nNwTPZrXV3yd8D/a2EiucyT7nOdhwy
	pw/C0TKrvwIz6BJZEyEFpcwDaMfelt+mvSvaRgpXIR7kziAqYRxmUWr1PFT88cHwpmjFwuMGSSFFl
	1fNbjipnCDGtnOTNGxoblpINbjUD0w2Hn07ysK1/wPeq8V6vDi+++8jNkuBu5Dq3mhnoWuNZOz3W1
	BPLTbL+sx/ztYQRxHLF8WrfXVhR+iWvw9joEv7OTArRDKjYQEWQDzlWeqMnVk0//ilIuxYe184o/N
	ThNXj22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUXL-000000005ay-21Ci;
	Mon, 10 Feb 2025 14:13:23 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUVv-000000005Ji-0IiU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:11:57 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so6047743a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 06:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1739196714; x=1739801514; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+U+cJ54sadwbAEEQ1XMnFeXEpukGhrX3NXgbMiqSEdc=;
        b=faQdOe9VFq6AnbmBoAHHHphU+ICfXJAimgeWeZhHp5WdPppci1evYgA+5ZA3urRA2d
         /PpfLS+wg5Ao2pMjWv6sWvd1WBL5z8p+cIPfLvfa+cIbZ+1gT9LlvAQKJ0su0xY5BsEo
         Q2HoAJMpNSsWMXTfr8e/zLJtIF+BT2x9j/t/dsojjD9guQbDMxJFClxGKuRGgdg50ClM
         ewu31YeJCCtn3ewE4CECbQPM9THMrcniWugRcRzN6+f3K2YTKbWyEcHkukBMhzZQJwCV
         yHwga2coWOta8mHaaRwtPFCPzpudQHjR9cRIfJe168Nc27g0Ec/1qZVCqboklb1Tlwzd
         ADzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196714; x=1739801514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+U+cJ54sadwbAEEQ1XMnFeXEpukGhrX3NXgbMiqSEdc=;
        b=jfLQoymcE3eRgxVhAZK1ydXEh2jN/J86RRtSzO3L/cLr3rAsX8FP0Pu74LdGyliSkl
         yvox87wkAW8sla7gPK7NRS5TdOG1ogUeZxEjnPgfBL18wOwPkLA5ygetP70Z9oFWoKJG
         AXDzSXWA7+3S4VqvCPIrtr/jR4e9e/UphGo/fcjV+/GUdEn4BCXlB8x9RyUqQV3umI6q
         MWCkHOEsdvl4xWwJz6yQ0bMlC+UWJj2J/tYxYqjhNoCgRkz8c4MfsQ13ld9NRcu2hHU9
         QahHWdhalWoispbBGIA1QLswgYiLPhwJmaEbFhIc+fsMsipOr/ebMuRD/pmzCVjeshoA
         DevQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQs/oFsU1glTcrjYZ7h1V4MO8aLPPV0qewSRa/Mzy0DEuTVYKJEhkh7mMsZR3zgPoQAgQa62KQGagO1FdK6Pqa@lists.infradead.org
X-Gm-Message-State: AOJu0YzeRUYc0SoqlFJ18zBhljRZ408bLUXylpT87WUdAYG/O/3PH3js
	BaigcF782jYD9mzDCLUoojq49ZReOC2mvaEALayV2iX2Mtx2SkxgFF1IhrpAktUdjggWTgsrNIL
	SuKseuQZIBwfgc34As/wMpkzNVqTdm8U21WkuMQ==
X-Gm-Gg: ASbGncs1A6HcJauTKvtbVrPFBhN7SmnAcN7zEIvMZOdxF2zHXqXohH/vAsqy4qCjAcG
	/8SO5umqtdlkIk038OQLWNCb6pS+Pgrm4BBKZQuknCdTbuElOdDctNdXz9saE4nYOG4B6SFU=
X-Google-Smtp-Source: AGHT+IF1+dEqoORyKXu66dB2Rg8beCQhSwmnjjgQuD2ZBI10xzxpJ4Y1Rzbu+lgFq2AzogQw2HBplK2cVN2+wBMuIPk=
X-Received: by 2002:a17:90b:368c:b0:2ee:ee77:227c with SMTP id
 98e67ed59e1d1-2fa23f55e0cmr18756882a91.3.1739196714411; Mon, 10 Feb 2025
 06:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de> <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
In-Reply-To: <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
From: Jagan Teki <jagan@edgeble.ai>
Date: Mon, 10 Feb 2025 19:41:43 +0530
X-Gm-Features: AWEUYZk9JtE8zrOo2lYnBOq7Su2RsFQcHGdiZcrSSTPxmQcqmii1TNFikv1yH9o
Message-ID: <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble NCM6A
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>, 
	Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_061155_297437_69CA434D 
X-CRM114-Status: GOOD (  17.39  )
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

On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The Edgeble NCM6A can have WiFi modules connected and this is handled
> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
> NCM6A WiFi6 Overlay")).
>
> In order to make sure the overlay is still valid in the future, let's
> add a validation test by applying the overlay on top of the main base
> at build time.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
>  rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
>         rk3568-wolfvision-pf5-display-vz.dtbo \
>         rk3568-wolfvision-pf5-io-expander.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
> +       rk3588-edgeble-neu6a-wifi.dtbo

Please add neu6b-io as well, wifi dtbo is similar for it as well.

Thanks,
Jagan.

