Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B3EE67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thuT7JPzP6ijGee2PwFI/Fkh7CU0FprxFiOeg3tcdUM=; b=P1LoZLeFoSjE1AMJssvsjZAta4
	M+X0hHLbY4ImFiXsG1FuZZEQulUwO80jTa+vnk1EC2xvUMguF9PDgVPfHpnFA9F+b+RL08gWJ/fyY
	148uVNyxIpZoYhSag14oDKr7NSGIeYpZ/Wv8p9sBnjkDLQ4xW2vXnX5+xYtYq0mkygU1sE7bMKCVm
	clvJHmA/h70hQpmvzTqsu5vduG/+QfvK91TelVGVqhBWK9qHPQwuSZtC5gs4mREy9HQv7b8P5asnV
	L1ccxHjkb6BmCYhXGbBfxY1BsCl2D2NTwykL4i/tH3Reu3XF/cyshoIJ0H+WTnCr6AIE0CXxM4vz1
	Zr4v8fdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXIBD-0000000CQ8p-12TR;
	Sun, 21 Dec 2025 12:04:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXIBA-0000000CQ7U-1djV;
	Sun, 21 Dec 2025 12:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FD3942B10;
	Sun, 21 Dec 2025 12:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B2BC4CEFB;
	Sun, 21 Dec 2025 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766318690;
	bh=7LVQ8OFSH90aBTKeJHbT6h52O5X5Gibty3PLGF89PDw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oqDNeUcywridYkQcEhbD4MFn2rDVLVbge9+UENfHQXADzdMeBATSju97wySENj2Pz
	 d+tUuRRLIJykix21Wv9ZJG0k4s53SmnsutnxtFtp0VFZIs5vft8m2o/J1L5aEvtaOF
	 aFA5GwrQ6lJTn3IS1Top2ShQDW/vlOEBj+NbCfUDh9HUhPwrlkU346ODM9jUH4+sXx
	 6jt72+9OwPTJh3U4HXnoQvVIFc27XFg8FaOeG1A5s9L3t+2fR6KVzhYlVTA+fz/Zkc
	 /tGUuMTQf8qyeR4Jbar9BIkUSnemwSK+KZxq6Dj4Z1zc9YfGxCL7wvZNh8yb+MWc7m
	 p8kgIzemsGaAA==
Date: Sun, 21 Dec 2025 12:04:39 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Heiko
 Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/5] iio: adc: Simplify with dev_err_probe
Message-ID: <20251221120439.3aa841ca@jic23-huawei>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_040452_466698_1978D7E4 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

On Fri, 19 Dec 2025 15:31:49 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use dev_err_probe() to make error code handling simpler and handle
> deferred probe nicely (avoid spamming logs).
> 
> Best regards,
> Krzysztof
Thanks. Series applied.

Jonathan

> 
> ---
> Krzysztof Kozlowski (5):
>       iio: adc: aspeed: Simplify with dev_err_probe
>       iio: adc: exynos: Simplify with dev_err_probe
>       iio: adc: qcom-spmi-rradc: Simplify with dev_err_probe
>       iio: adc: rockchip: Simplify with dev_err_probe
>       iio: adc: sc27xx: Simplify with dev_err_probe
> 
>  drivers/iio/adc/aspeed_adc.c      |  9 ++++---
>  drivers/iio/adc/exynos_adc.c      | 29 ++++++++---------------
>  drivers/iio/adc/qcom-spmi-rradc.c | 20 ++++++----------
>  drivers/iio/adc/rockchip_saradc.c | 13 ++++-------
>  drivers/iio/adc/sc27xx_adc.c      | 49 ++++++++++++++-------------------------
>  5 files changed, 43 insertions(+), 77 deletions(-)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251219-iio-dev-err-probe-59b3104c8d4b
> 
> Best regards,


