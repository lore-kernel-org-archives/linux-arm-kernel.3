Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16201C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIBMHVOpQGLb5fWk6PviQUaRHxA5UzjPJbyRntLyIQ8=; b=ArydnGfUcEPrbeXJCK94RLljOT
	csp15S7ZNBWrenK2NJ7WcDD3UfsMnMNOcVpq74bGKa+tUH6CuWgk6SgmY2EzdWItFiBNcm/6U97gA
	AklcQfdqysFgog9yy8vfBtfc0WqnAnqt7Wr1eSG3db34sXC2a/4+cq3wqd/zyDOs/deQTqRZrCSp5
	QHLCTaLRYGIdo5VGrW47ETa36qfFjr/qhyym6HksEQBFkIKKSwJXE29n2HYuh6u651j0dEWpjz2sD
	WQiPcvzYJdXfb3cBnyMrgGgsec/4Nc2BOK3ihJ8QzEpGdd+utNr9JfNmwqyjj25SNcOBkNI9CZOBy
	i1yDEKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPY1-000000044H0-3dMw;
	Fri, 09 May 2025 15:22:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOCE-00000003quB-0VfX;
	Fri, 09 May 2025 13:55:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 621EEA4C10C;
	Fri,  9 May 2025 13:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89330C4CEE4;
	Fri,  9 May 2025 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746798925;
	bh=zanW3F7mAvO6XEkfAZFP2dkzUCWKBlIKWgmDrP6XeXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AOa5gyxdyb4ttC0XaFpejwQesSEz++BrhTXJIKtRWZDmMFGZmLOb8w0IYwHX6Ikvg
	 QYc+l0/chwr0HxfOgefWGLgqEOHPPzWKxZ37htmcnyEpLIKWsI0LJa+yJIXTS+W0R/
	 BZwNb2tKLhCuDR/5WakQLxrB3f28gglb4Yn4Yxbc4ga+N3b4fRJyvS2VU90sDnSCSm
	 MzePJ0HSMkIgu3bsRTrO2ZOxNG/igIL0RGLaDw7O+WQ8dc2gt3fdml3Ei4VkFu8yk/
	 a8NeKOXAWFzJWt1mOPTVUH0y7THs72r5KAiOGOip2f1cGNZ4qIIVmfwCwPqKVPL/Bs
	 KMdrP1xRtRGaQ==
From: Will Deacon <will@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1] perf/amlogic: Replace smp_processor_id() with raw_smp_processor_id() in meson_ddr_pmu_create()
Date: Fri,  9 May 2025 14:55:16 +0100
Message-Id: <174678939181.1772809.16015906779534499401.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250407063206.5211-1-linux.amoon@gmail.com>
References: <20250407063206.5211-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065526_289657_07A95C79 
X-CRM114-Status: UNSURE (   8.50  )
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

On Mon, 07 Apr 2025 12:02:03 +0530, Anand Moon wrote:
> The Amlogic DDR PMU driver meson_ddr_pmu_create() function incorrectly uses
> smp_processor_id(), which assumes disabled preemption. This leads to kernel
> warnings during module loading because meson_ddr_pmu_create() can be called
> in a preemptible context.
> 
> Following kernel warning and stack trace:
> [   31.745138] [   T2289] BUG: using smp_processor_id() in preemptible [00000000] code: (udev-worker)/2289
> [   31.745154] [   T2289] caller is debug_smp_processor_id+0x28/0x38
> [   31.745172] [   T2289] CPU: 4 UID: 0 PID: 2289 Comm: (udev-worker) Tainted: GW 6.14.0-0-MANJARO-ARM #1 59519addcbca6ba8de735e151fd7b9e97aac7ff0
> [   31.745181] [   T2289] Tainted: [W]=WARN
> [   31.745183] [   T2289] Hardware name: Hardkernel ODROID-N2Plus (DT)
> [   31.745188] [   T2289] Call trace:
> [   31.745191] [   T2289]  show_stack+0x28/0x40 (C)
> [   31.745199] [   T2289]  dump_stack_lvl+0x4c/0x198
> [   31.745205] [   T2289]  dump_stack+0x20/0x50
> [   31.745209] [   T2289]  check_preemption_disabled+0xec/0xf0
> [   31.745213] [   T2289]  debug_smp_processor_id+0x28/0x38
> [   31.745216] [   T2289]  meson_ddr_pmu_create+0x200/0x560 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
> [   31.745237] [   T2289]  g12_ddr_pmu_probe+0x20/0x38 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
> [   31.745246] [   T2289]  platform_probe+0x98/0xe0
> [   31.745254] [   T2289]  really_probe+0x144/0x3f8
> [   31.745258] [   T2289]  __driver_probe_device+0xb8/0x180
> [   31.745261] [   T2289]  driver_probe_device+0x54/0x268
> [   31.745264] [   T2289]  __driver_attach+0x11c/0x288
> [   31.745267] [   T2289]  bus_for_each_dev+0xfc/0x160
> [   31.745274] [   T2289]  driver_attach+0x34/0x50
> [   31.745277] [   T2289]  bus_add_driver+0x160/0x2b0
> [   31.745281] [   T2289]  driver_register+0x78/0x120
> [   31.745285] [   T2289]  __platform_driver_register+0x30/0x48
> [   31.745288] [   T2289]  init_module+0x30/0xfe0 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
> [   31.745298] [   T2289]  do_one_initcall+0x11c/0x438
> [   31.745303] [   T2289]  do_init_module+0x68/0x228
> [   31.745311] [   T2289]  load_module+0x118c/0x13a8
> [   31.745315] [   T2289]  __arm64_sys_finit_module+0x274/0x390
> [   31.745320] [   T2289]  invoke_syscall+0x74/0x108
> [   31.745326] [   T2289]  el0_svc_common+0x90/0xf8
> [   31.745330] [   T2289]  do_el0_svc+0x2c/0x48
> [   31.745333] [   T2289]  el0_svc+0x60/0x150
> [   31.745337] [   T2289]  el0t_64_sync_handler+0x80/0x118
> [   31.745341] [   T2289]  el0t_64_sync+0x1b8/0x1c0
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/amlogic: Replace smp_processor_id() with raw_smp_processor_id() in meson_ddr_pmu_create()
      https://git.kernel.org/will/c/097469a2b0f1

Hopefully we can fix this properly when Robin moves the hotplug logic
into perf core...

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

