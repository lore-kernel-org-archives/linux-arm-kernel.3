Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D8ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kvOQXhZjl3Riu3Bp8W5at5u0uo3ZABQvzRMmv52jOg=; b=wxSyQBCUNVIrssxoFizmMnj8nz
	NinDFsDnnjDh24cLx9XOA2mpOXXES00jqgnE81A/90zlA5FacxC1t8TMvhk7pbma+VWWXGO9yB5ML
	WXR76WEZxEba1IeDNn6z3UhxL3uYA2Og1DPPFg1BT5fKh8pg+N9by6Fgl4t7eAj485FPql60xgw2q
	ril14eTbqpZypB5UIVUTAz+L9fQVqgx/bsyA1Tv9UYDIfdW0PA6qhSSefJF0ZwcuuJoI0ZvcHLEia
	jLy+AkwUcvqYJzjFnqPXCDe7+r4I9VucJAXV347cfQi+M6+DeKvgDKRZJ70PeWjzutPkuBn2xzwvS
	bBki0eRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosRN-0000000FEH9-0Cql;
	Wed, 20 Aug 2025 23:42:01 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolyl-0000000ERbl-2lbS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:48:05 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57KGlgCv3240046;
	Wed, 20 Aug 2025 11:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755708462;
	bh=1kvOQXhZjl3Riu3Bp8W5at5u0uo3ZABQvzRMmv52jOg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lYNof3uNzL6Q59bWj6aZOuMleWm9WqbNqSmV8L5pMTlj86O3vIbFuUIMZX0kE93li
	 x5y/DRvN6hY9zYIQAkbNddOG7vYOFACGjzO8O7zznij3js3p7zRbHNou553XLkaP69
	 QpeaacRHHVRqFKQTuMAbDWxFRk8psQ3TtLwnYqFs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57KGlfQq2186756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 11:47:41 -0500
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 11:47:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.55; Wed, 20 Aug
 2025 11:47:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 11:47:41 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57KGlfsw526664;
	Wed, 20 Aug 2025 11:47:41 -0500
Message-ID: <9315875c-3358-4f56-b99e-a530baa8ca0e@ti.com>
Date: Wed, 20 Aug 2025 11:47:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/arm_global_timer: Add auto-detection
 for initial prescaler values
To: Markus Schneider-Pargmann <msp@baylibre.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Patrice
 Chotard" <patrice.chotard@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Kevin Hilman <khilman@baylibre.com>
References: <20250808-topic-am43-arm-global-timer-v6-16-v1-1-82067d327580@baylibre.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250808-topic-am43-arm-global-timer-v6-16-v1-1-82067d327580@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_094803_889342_A3452048 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Markus,

On 8/8/25 5:35 AM, Markus Schneider-Pargmann wrote:
> am43xx has a clock tree where the global timer clock is an indirect child
> of the CPU clock used for frequency scaling:
> 
>    dpll_mpu_ck -- CPU/cpufreq
>          |
>          v
>    dpll_mpu_m2_ck -- divider
>          |
>          v
>    mpu_periphclk -- fixed divider by 2 used for global timer
> 
> When CPU frequency changes, the global timer's clock notifier rejects
> the change because the hardcoded prescaler (1 or 2) cannot accommodate
> the frequency range across all CPU OPPs (300, 600, 720, 800, 1000 MHz).
> 
> Add platform-specific prescaler auto-detection to solve this issue:
> 
> - am43xx: prescaler = 50 (calculated as initial_freq/GCD of all OPP
>    freqs) This allows the timer to work across all CPU frequencies after
>    the fixed divider by 2. Tested on am4372-idk-evm.
> 
> - zynq-7000: prescaler = 2 (preserves previous Kconfig default)
> 
> - Other platforms: prescaler = 1 (previous default)
> 
> The Kconfig option now defaults to 0 (auto-detection) but can still
> override the auto-detected value when set to a non-zero value,
> preserving existing customization workflows.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Tested-by: Judith Mendez <jm@ti.com>


Thanks for you patch, it also cleared the noise on my end
on am437x board.

~ Judith





