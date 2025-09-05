Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB15CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDWWjIXOSxGRHy+tBfG1SIJJzopZWzVU2iLfASaCYWI=; b=CVHJaFpnIg6w2YP76LiWhKEZDI
	NJrW9OU6u+OjX6mjtG6O0rMJW9fvu3OfRKHYvMyQQssHdJ8W5uA4M5vFofW4j4g4Ovx3l74m6iQX7
	Zd/a6bL2U56fnP0Jw6MVytbRCU7/mi63rTbeqvNx+yc58X/TtlOMlWHgq3N7M/53i1vc4VHcK1zfJ
	odEfHTPYW+75BajAlns7T7ZpR0xM8xZP1fyBgW46q7abmJC5a4M4uaci+Pkum00F1fwPXszqOl72J
	qj9O9Vq/s2SyJ9jJ6YKD7yczduPPHULR32e7OFRprzH5GQ+uFaj+jH2mLgMIWUhM2Hb2rA3Bk0q6d
	g83UwKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVX-00000005ROt-1BTW;
	Sat, 06 Sep 2025 00:10:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZw3-00000003Mqk-0ziF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 17:09:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 142584419D;
	Fri,  5 Sep 2025 17:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC8FC4CEF1;
	Fri,  5 Sep 2025 17:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757092152;
	bh=ME+O+YFbMDjp7U+c6erbrYwdtB8NRRagz9bddBc3ht0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f1GwfO24g8/BA7J5X7EymxZUDtCpAi/JicfJ5VvXdB8Ygw5RsuwqSKdW6SJK8IOm+
	 EAtGwRRygwp8VQqDdsgPrKhOl4TvuSRcEiXQhVWYUakzgIasF7icRytU8Qz6neKS5B
	 jgwSzHegUPLJrYKEMDGgBH0a0EADDRFypMMh5lW3HEhrcMh2X+GEP0P63jH4S9DdQn
	 eGHDV6nqKAxoYT7bSb21hlM/Xgmzpl2JeRwuVwCTp4BRhIxHhUfZhqYN0JphWCzo16
	 nWWRJ5Hebm9T5m8vjj9FT5k8eB2U0yK7ffu7EbK3V/h1awO9i+B3AjRbMJLASSfbcC
	 5FlDvpCEY3Cxg==
Message-ID: <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
Date: Fri, 5 Sep 2025 19:09:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
To: Mostafa Saleh <smostafa@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20250905162446.88987-1-smostafa@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250905162446.88987-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_100915_321676_BA34BCDC 
X-CRM114-Status: GOOD (  15.54  )
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

On 05/09/2025 18:24, Mostafa Saleh wrote:
> Booting the kernel on Pixel-6 with `CONFIG_DEBUG_PREEMPT` prints the
> following WARN:
> 
> [    0.784187][    T1] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> [    0.784328][    T1] caller is debug_smp_processor_id+0x20/0x30
> [    0.784433][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc4-gd69eb204c255 #1 PREEMPT
> [    0.784439][    T1] Hardware name: Oriole (DT)
> [    0.784441][    T1] Call trace:
> [    0.784443][    T1]  show_stack+0x34/0xa0 (C)
> [    0.784453][    T1]  dump_stack_lvl+0x7c/0xb0
> [    0.784460][    T1]  dump_stack+0x18/0x24
> [    0.784464][    T1]  check_preemption_disabled+0xf8/0x100
> [    0.784470][    T1]  debug_smp_processor_id+0x20/0x30
> [    0.784476][    T1]  gs101_cpuhp_pmu_online+0x40/0x108
> [    0.784483][    T1]  cpuhp_invoke_callback+0x188/0x2d8
> [    0.784490][    T1]  cpuhp_issue_call+0xec/0x240
> [    0.784494][    T1]  __cpuhp_setup_state_cpuslocked+0x140/0x2c0
> [    0.784499][    T1]  __cpuhp_setup_state+0x58/0x88
> [    0.784504][    T1]  exynos_pmu_probe+0x2a4/0x380
> [    0.784508][    T1]  platform_probe+0x64/0xd0
> [    0.784516][    T1]  really_probe+0xd0/0x3b0
> [    0.784520][    T1]  __driver_probe_device+0x8c/0x170
> [    0.784524][    T1]  driver_probe_device+0x44/0x140
> [    0.784528][    T1]  __device_attach_driver+0xd8/0x180
> [    0.784532][    T1]  bus_for_each_drv+0x90/0xf8
> [    0.784536][    T1]  __device_attach+0xa8/0x1d0
> [    0.784540][    T1]  device_initial_probe+0x1c/0x30
> [    0.784544][    T1]  bus_probe_device+0xb4/0xc0
> [    0.784547][    T1]  device_add+0x4d0/0x700
> [    0.784550][    T1]  of_device_add+0x4c/0x78
> [    0.784556][    T1]  of_platform_device_create_pdata+0x9c/0x148
> [    0.784560][    T1]  of_platform_bus_create+0x1d0/0x370
> [    0.784563][    T1]  of_platform_bus_create+0x234/0x370
> [    0.784567][    T1]  of_platform_populate+0x84/0x178
> [    0.784571][    T1]  of_platform_default_populate_init+0xf0/0x120
> [    0.784579][    T1]  do_one_initcall+0x68/0x2d0
> [    0.784585][    T1]  kernel_init_freeable+0x2d8/0x358
> [    0.784589][    T1]  kernel_init+0x28/0x168
> [    0.784595][    T1]  ret_from_fork+0x10/0x20

Please trim from unnecessary parts - [time].

> 
> As this value is only read once, it doesn't require to be stable, so

Why it does not need to be stable? Onlining wrong CPU number is not
desired...

> just use "raw_smp_processor_id" instead.

You might be just hiding some other real issue, because above stacktrace
is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
disabled. Provide analysis of the warning, instead of just making it
disappear.

> 
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: André Draszik <andre.draszik@linaro.org>
> 

No blank lines between tags.

Missing Fixes tag... and then Cc is not necessary. Please follow
standard kernel process.

> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index a77288f49d24..338f4758a089 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -338,7 +338,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  


Best regards,
Krzysztof

