Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7018DCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fJ41vja0NswP/cEdRwGZTUAPn6q6WLR2I6G/z6FEQs=; b=zMv5EUnBiPMceTBDshPRUkrvMM
	L+QQRU3/95d0EnGjvFyo9WNuU6zHoh5HUf8k5CUdOqwLPNPC+yTVgikAoTyFKwPDwKK/ZJO3A6LTD
	armp3Ngds226VTtdGOQz3RZatXimG1RRk7hNgZDru3ZEnKU6gUu443IhLqGElFzvmOnbT8/yNxLu2
	49U2O4i2cyICqwIlJ0to0GeQ8Hm/hcxzhkc3Cd+0NOnsg8H+SWucyszFTR0fkmHJtmGLeMu1GuvRY
	7ylPVt1dmaxG2aQQJfJU/yR2I/LFQC+CLjyHOS6FVGOw9WF4i/dtn0wXGf7j/5S3K1QMptLoS6Knj
	jP4YuRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDha-0000000EEme-2MNR;
	Mon, 01 Sep 2025 23:12:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Xk-0000000DJD4-1cI9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F4424358C;
	Mon,  1 Sep 2025 16:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64067C4CEF1;
	Mon,  1 Sep 2025 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756744688;
	bh=8G+3XGg+quEZEXW/fQFez+5wUY0vAqJwQES5pLF72xQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ny/GUxBWZwE4W1umy2rxcrMweeo9RKyZRsJLOg13X3WfmceJw7p0TpnGAA0vUst+i
	 zDQt2MMPOi8Zmlkr4jxd4j1hKfyqWGaTnxpiFmpmGRaPyKCiJ9fFRd8ZEVsdKLDoWu
	 whjRJXANxxKovvZPyx+1agpkPN60AqE8Lbt9tYRu8liNFOmXH8n9o1QT4DTitdgmf+
	 QuzcbdNo1IgRliehimrqSFLHPHg+FgUZcJrdQ/Po0MMR269d7c4BPSMupe+oZs0yj0
	 3XNYhWJuwuAK7UclXFwXI/16WrScUuZ2/VPgBNGDZorm4IAuU1fByO1VRE3EtjyxHU
	 4XKC7YTedG3aQ==
Date: Mon, 1 Sep 2025 17:38:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] iio: adc: samsung: Simplify, cleanup and drop
 S3C2410
Message-ID: <20250901173800.48133c60@jic23-huawei>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_093808_451989_7FCFAF16 
X-CRM114-Status: GOOD (  14.02  )
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

On Sat, 30 Aug 2025 18:48:29 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Changes in v2:
> - Patch #5: Fix S5Pv210 interrupts
> - Patch #3: Drop touchscreen-s3c2410.h
> - Add Rb tags
> - Link to v1: https://lore.kernel.org/r/20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org
> 
> S3C2410 is gone from kernel, so we can drop its support and remaining
> related pieces.

I've queued this up to get some test coverage from zero day.
I'll not push it out for linux-next for a few more days though so happy to
add tags (or drop it if anything comes up!)

Jonathan

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       iio: adc: exynos_adc: Drop S3C2410 support
>       iio: adc: exynos_adc: Drop touchscreen support
>       iio: adc: exynos_adc: Drop platform data support
>       dt-bindings: iio: adc: samsung,exynos: Drop S3C2410
>       dt-bindings: iio: adc: samsung,exynos: Drop touchscreen support
> 
>  .../bindings/iio/adc/samsung,exynos-adc.yaml       |  26 +-
>  drivers/iio/adc/exynos_adc.c                       | 282 +--------------------
>  include/linux/platform_data/touchscreen-s3c2410.h  |  22 --
>  3 files changed, 14 insertions(+), 316 deletions(-)
> ---
> base-commit: 642543fe9a04beda174633dff607429dc1734b2a
> change-id: 20250830-s3c-cleanup-adc-71ac80978520
> 
> Best regards,


