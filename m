Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E606DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNFO665DUBeSWttsJFLf965I+6TtRATHadEAYUdNEaU=; b=kck7oJ7pHAgWGxvwfxAGPz+0Rm
	gP05ah2ujUwc/FHudKdDn9EvA1J8/MztW3G4sME0f3mjqolQVzyZHeWAfemPc1eOwbP9D4/sHvQyD
	wb8mpZWy/6vP1N1j7WTt9/f1bf9584x6XBXtaspkHCJuZdHIikNErLZJhdV0edj6Lk2vmFtcEDtQ+
	+hRuhYOlTDmTl+hr2aVQL1jVNZ8lk1LqKcy/kZnC45YqtXTHfr2PGMio2rzzkiHKqQ9cE96OIbL22
	lKUzkIudTqoO5RU63Jft69Omby55sCO7KlWjg3pgyCpkP427PD5+JDD6eDV6k/l5w2I6azOvEsyPr
	dwV7R23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIW5-0000000GwT3-0XWr;
	Fri, 07 Nov 2025 09:12:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIW2-0000000GwRN-3Pns;
	Fri, 07 Nov 2025 09:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762506735;
	bh=i8bcLE32FSf57bRwMIQrvB0FS0CV25f/s7GHzJcLydY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZV4g5enhu7yMNXiqcYlHi5Uh8Ct+jfotnXthdw+buHcJBzmP79S01Qv14L4479JWS
	 chqM3FT3ErebbYQ+XTWXCIK94+/zh40V7IRctnfNG+One7TnwGU9NbOjNfFRhbKc4w
	 bB1VEhGgtS/Iqp5ripBmfz32PRC7ggxC6ax1NQ8kk28jIi4a2+MnIcBogtW5Vverum
	 G6HcJHqBmyati/8X3w4V6TU6i2dIm/igLgYc2LhC8bKO3rWf7oqahRte1Lpc94d1qz
	 lhZoLf26ODR+ipMc/Xsl8yUmLmWN1N69Y//kNWC7Pk4hU+CgU9yXX18OIKyqql2lbn
	 wTlXeJc6o9IIw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7211717E12D5;
	Fri,  7 Nov 2025 10:12:14 +0100 (CET)
Message-ID: <7642d2bb-f246-41f9-bea8-6211fc2ad176@collabora.com>
Date: Fri, 7 Nov 2025 10:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] of: Add wrappers to match root node with OF device
 ID tables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_011219_018439_9080D4CE 
X-CRM114-Status: GOOD (  15.90  )
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

Il 06/11/25 20:07, Krzysztof Kozlowski ha scritto:
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
>     of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>     associated driver data for found compatible.
> 
> Best regards,
> Krzysztof
> 

Makes sense. Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

> ---
> Krzysztof Kozlowski (13):
>        of: Add wrappers to match root node with OF device ID tables
>        cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
>        cpufreq: mediatek: Simplify with of_machine_get_match_data()
>        cpufreq: sun50i: Simplify with of_machine_device_match()
>        cpufreq: ti: Simplify with of_machine_device_match()
>        cpuidle: big_little: Simplify with of_machine_device_match()
>        firmware: qcom: scm: Simplify with of_machine_device_match()
>        irqchip/atmel-aic: Simplify with of_machine_get_match_data()
>        platform: surface: Simplify with of_machine_get_match_data()
>        powercap: dtpm: Simplify with of_machine_get_match_data()
>        soc: qcom: Simplify with of_machine_get_match_data()
>        soc: qcom: ubwc: Simplify with of_machine_get_match_data()
>        soc: tegra: Simplify with of_machine_device_match()
> 
>   drivers/cpufreq/cpufreq-dt-platdev.c               | 15 ++-----
>   drivers/cpufreq/mediatek-cpufreq.c                 | 12 +-----
>   drivers/cpufreq/sun50i-cpufreq-nvmem.c             | 11 +----
>   drivers/cpufreq/ti-cpufreq.c                       | 13 +-----
>   drivers/cpuidle/cpuidle-big_little.c               | 11 +----
>   drivers/firmware/qcom/qcom_scm.c                   | 17 +-------
>   drivers/irqchip/irq-atmel-aic-common.c             | 15 ++-----
>   drivers/of/base.c                                  | 47 ++++++++++++++++++++++
>   .../platform/surface/surface_aggregator_registry.c | 13 +-----
>   drivers/powercap/dtpm.c                            | 16 +-------
>   drivers/soc/qcom/qcom_pd_mapper.c                  | 17 +-------
>   drivers/soc/qcom/ubwc_config.c                     | 14 ++-----
>   drivers/soc/tegra/common.c                         | 12 +-----
>   include/linux/of.h                                 | 13 ++++++
>   14 files changed, 82 insertions(+), 144 deletions(-)
> ---
> base-commit: e5efebeef746a24f45b98dbdfcf334285848b32a
> change-id: 20251106-b4-of-match-matchine-data-4a64bf046814
> 
> Best regards,



