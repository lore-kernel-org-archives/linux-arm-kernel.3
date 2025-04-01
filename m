Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AADC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 02:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6n0YSq4cXGo+IEVfs1JjId/2WK5BU6RFp34EqdU2m8=; b=FTQSr7i201mEEer/PUsdLfN3ML
	Toq7QOo+1rylIWnlm0hYWKSycbcg9iLapVfXSBDrX4THe5t7Zu96vIetVhh7zNxSHuJXNasJXezAh
	UJ9euOdO2rU/ip/PRctRpTFzU6LLjnnwXbcur3677TlSra2PSEQ6KdSKbhAA/M2OpEsB1sr5RzYwD
	ZnZP6uWrdVURiilTyJAF4QL6mvURlcnoySJZs1nk4+hjPldsaBofGGPcLLrGFOz9ZX11Zqwj4N4Pn
	/owMy9DkUnzAL335++es0Hx3MCicaARh/+BLVUUg8wZB4V+WDC7GDB6VvhIyAgAK3GDqpWZKni7GU
	DEgokeag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRPw-00000001nRe-1TYc;
	Tue, 01 Apr 2025 02:31:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRO8-00000001nDz-1Ar6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 02:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 719F35C5AAC;
	Tue,  1 Apr 2025 02:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0571C4CEE3;
	Tue,  1 Apr 2025 02:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743474603;
	bh=e7umfimSSpUyu6Gb9PAWxVviQ1Pyx2Rlh5oL4MRf/MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMg+dAsCMyIG3q3zTMQGZIr/r9WudOZIbydWtIAvOeYe0VQ2UiJZgKRYjEN2vyasu
	 XFB40wN4HzTTLmykZwxdPRCgJRNkUcVB3f46fscBYHJgHmc/btgzZ01zdh2jyaWMOv
	 RWe7vbEXNw9Cq6GocTz7m5DNqWC3LlCiPDhnp9y+sVZ8NushvPWjdxnJlaa87d9ig4
	 SnK/IVbSUlX8Sgq3D96XI9yFrhgTrFgI4Mm8pvDZDPgBwiBN9GgaqHt1uzEVjynojh
	 WEkAwHmSIZ3+rBgp5swmuKjgs0z3189hLjuB4IV2lXLdaNKQdo1aiG0MDsCMlOM2TE
	 3h/T8R9xFBmWg==
Date: Mon, 31 Mar 2025 21:30:01 -0500
From: Rob Herring <robh@kernel.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <20250401023001.GA3186122-robh@kernel.org>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-6-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331230034.806124-6-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_193004_474081_95D594C1 
X-CRM114-Status: GOOD (  18.19  )
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

On Mon, Mar 31, 2025 at 04:00:27PM -0700, Will McVicker wrote:
> From: Donghoon Yu <hoony.yu@samsung.com>
> 
> On Arm64 platforms the Exynos MCT driver can be built as a module. On
> boot (and even after boot) the arch_timer is used as the clocksource and
> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> source for the arch_timer.
> 
> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/Kconfig      |  3 +-
>  drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
>  2 files changed, 42 insertions(+), 8 deletions(-)

[...]

> +#ifdef MODULE
> +static int exynos4_mct_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	if (of_machine_is_compatible("samsung,exynos4412-mct"))

Your root node compatible has "samsung,exynos4412-mct"!?

In any case, add a data ptr to of_device_id table and then use the match 
data rather than comparing compatible strings again.

> +		return mct_init_ppi(np);
> +
> +	return mct_init_spi(np);
> +}
> +
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct" },
> +	{ .compatible = "samsung,exynos4412-mct" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);

