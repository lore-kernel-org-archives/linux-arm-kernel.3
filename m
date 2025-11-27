Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8A1D116E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 01:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqD764/xYsxDahcoC1aGtQmXnKzmk/gUF12psLzzltQ=; b=JipMe7VA0ZdVYD4+/c5YPHdoOt
	x/27Xw4XWhx01oYvfMgfLI7hdZgsWFW6OG+GzXA3wYJqVvJmUbXAy7/UmkE0eAC4ohXn+jOpaeVqY
	9W4ic1NgFbvuEOWTKv6FzTiioxd2FMBc8JtkI8CcO9CsvpBDFjpLwQA1RK7QX6fCknmppGrgmRFD8
	OTy4v5CmWh4sLg5SXhSTOXR/qoSz9XTdf3iYAJzBdLEenePIkgPoRbmtsXABlFXX5zAsJjNkn8mRV
	lTgOvmo1ovwdcxI8XQCW3bD7a9sYLjD7zoOIYGtNZvwOadpVW2P+naT+LBUFRDSrD+F7U1z3hc5gQ
	9sL2gGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORDx-0000000Fri9-2Ejm;
	Thu, 27 Nov 2025 01:55:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORDt-0000000Frhf-0OI9;
	Thu, 27 Nov 2025 01:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C1B04387C;
	Thu, 27 Nov 2025 01:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68CBC4CEF7;
	Thu, 27 Nov 2025 01:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764208504;
	bh=/NqG17rwpRoq7YYKDty/OdxHUk6Tf8IpKhsClBMsOkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzYiOJa3YR9H6eZ8HCr1KToCFxIEO+ew/BcLqhj57zGekCM/ZK/Pr/eiTyQaXGvgv
	 T5AhkQWLJvlTEBoFbvcJIDxxsmF6ndlEpDBQa/hmxDBJwgIigrTpQ6ZUOYPPt18jo7
	 Kvd50M/qhN6chJCvZYY53aFrtDgpreG0isN+lQBIPAgnmshLUwdbUPoYSQ1au2st5M
	 XXwsiF2q1J6/YoAI/TVrenCyJT3o9zykMk5Ki9Xk4l7s5zZMQDnA7G66aQgLnvVp/I
	 1Xu19QcNEw7OTPqMlsFElD0TE/oyVjCXOQkJBWKAWcEvy0dGi9DPjnF/cVS+mfBIuW
	 9b8HslW/nh5yQ==
Date: Wed, 26 Nov 2025 19:55:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Message-ID: <20251127015502.GA3141507-robh@kernel.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_175505_173936_5E51ED95 
X-CRM114-Status: GOOD (  22.80  )
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

On Wed, Nov 12, 2025 at 11:28:45AM +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Drop cpufreq/ti change: not correct.
> - Drop soc/qcom/qcom_pd_mapper.c - objections from Dmitry and I think
>   better to drop the patch in such case.
> - I did not implement feedback for first patch to make the
>   of_machine_compatible_match() matching machines in arbitrary nodes,
>   because there is no such use case possible and no arguments were provided.
>   I also did not use cleanup.h in first patch because existing code
>   of_device_get_match_data() does not use it and I prefer uniformity.
> 
> - Add Ack/Rb tags.
> - Link to v1: https://patch.msgid.link/20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org
> 
> Dependency/merging
> ==================
> All patches depend on the first patch, thus everything could go via
> Rob's tree with people's acks.
> 
> Description
> ===========
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
> 
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
> 
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>    of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>    associated driver data for found compatible.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (11):
>       of: Add wrappers to match root node with OF device ID tables
>       cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
>       cpufreq: mediatek: Simplify with of_machine_get_match_data()
>       cpufreq: sun50i: Simplify with of_machine_device_match()
>       cpuidle: big_little: Simplify with of_machine_device_match()
>       firmware: qcom: scm: Simplify with of_machine_device_match()
>       irqchip/atmel-aic: Simplify with of_machine_get_match_data()
>       platform: surface: Simplify with of_machine_get_match_data()
>       powercap: dtpm: Simplify with of_machine_get_match_data()
>       soc: qcom: ubwc: Simplify with of_machine_get_match_data()
>       soc: tegra: Simplify with of_machine_device_match()
> 
>  drivers/cpufreq/cpufreq-dt-platdev.c               | 15 ++-----
>  drivers/cpufreq/mediatek-cpufreq.c                 | 12 +-----
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c             | 11 +----
>  drivers/cpuidle/cpuidle-big_little.c               | 11 +----
>  drivers/firmware/qcom/qcom_scm.c                   | 17 +-------
>  drivers/irqchip/irq-atmel-aic-common.c             | 15 ++-----
>  drivers/of/base.c                                  | 47 ++++++++++++++++++++++
>  .../platform/surface/surface_aggregator_registry.c | 13 +-----
>  drivers/powercap/dtpm.c                            | 16 +-------
>  drivers/soc/qcom/ubwc_config.c                     | 14 ++-----
>  drivers/soc/tegra/common.c                         | 12 +-----
>  include/linux/of.h                                 | 13 ++++++
>  12 files changed, 79 insertions(+), 117 deletions(-)

Applied, thanks.

Rob

