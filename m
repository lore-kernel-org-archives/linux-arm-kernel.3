Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E2EC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6FU1s8LJBHHJ0p8ilv5u3weiOc352REXCKOeToXOPQ=; b=feowWGGjQcx3tiUEIGB1oNUnik
	f6LuoxWuCWwTQ8yzDuHHDovri22tygEAi4utWt198JOo2muB21dwwZlO24Vf3vJwuqsBt6y/la6D+
	r2j36+D4vhrzTVJebpsIcsGjMMu9dZcNWRvQpLspYXlxRO62m8DwPQhvWNMY2qXCa5Amj9LTatTML
	t4cIZCNv79C4646XdmKEAwxMjJScGUgQXXKAt7GEYt63O1twWWUifo6HI1hmh4gdUHZzenoOTHoh8
	lFxbWl9ClWeO3Le5Rs/sUFLayHsuaTKKarrWGdZeNA2Mmsmk+1vjP5OZvmoW2jfa4pt7Yap1fw7Mg
	lQuCdXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUNp-0000000Dlfe-2wxo;
	Fri, 07 Mar 2025 09:52:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqULk-0000000DlLn-122P;
	Fri, 07 Mar 2025 09:50:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A661150C;
	Fri,  7 Mar 2025 01:50:45 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCEF93F66E;
	Fri,  7 Mar 2025 01:50:29 -0800 (PST)
Date: Fri, 7 Mar 2025 09:50:26 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<lpieralisi@kernel.org>, <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <james.morse@arm.com>,
	<d-gole@ti.com>, <anup@brainfault.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<imx@lists.linux.dev>, <khilman@baylibre.com>,
	<quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
Message-ID: <Z8rBYuDiIyo8y6HT@bogus>
References: <20250307080303.2660506-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307080303.2660506-1-ping.bai@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_015036_330884_A399F6FD 
X-CRM114-Status: GOOD (  16.43  )
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

On Fri, Mar 07, 2025 at 04:03:03PM +0800, Jacky Bai wrote:
> for_each_possible_cpu() is currently used to initialize cpuidle
> in below cpuidle drivers:
>   drivers/cpuidle/cpuidle-arm.c
>   drivers/cpuidle/cpuidle-big_little.c
>   drivers/cpuidle/cpuidle-psci.c
>   drivers/cpuidle/cpuidle-riscv-sbi.c
> 
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
> 
> With nosmp or maxcpus=0, only the boot CPU is present, lead
> to the failure:
> 
>   |  Failed to register cpuidle device for cpu1
> 
> Then rollback to cancel all CPUs' cpuidle registration.
> 
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> above cpuidle drivers to ensure it only registers cpuidle devices
> for CPUs that are actually present.
> 
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v4 changes:
>   - add changes for other cpuidle driver that has the similar issue
>     as cpuidle-pcsi driver.
> 
>  - v3 changes:
>   - improve the changelog as suggested by Sudeep
> ---
>  drivers/cpuidle/cpuidle-arm.c        | 8 ++++----
>  drivers/cpuidle/cpuidle-big_little.c | 2 +-
>  drivers/cpuidle/cpuidle-psci.c       | 4 ++--
>  drivers/cpuidle/cpuidle-riscv-sbi.c  | 4 ++--


Why have you spared drivers/cpuidle/cpuidle-qcom-spm.c ? IIUC the issue
exists there as well.

-- 
Regards,
Sudeep

