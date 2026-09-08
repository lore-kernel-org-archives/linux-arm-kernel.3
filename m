Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6FDC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiOkVi5r17HJzqo+ZKCuE14GzZhfmieEcsQeSDY87Tw=; b=pX2mOQhDizXgjgs2JmsRIHJneJ
	j4QG7X52wBrvhvFsn3tzGVfLq00Vdy8QUTQk6/ydIOdWRB4/AkBzepVhskwgZLdy/3l6q218eXpjk
	vKCKwekoejRihaNoExZ8LIioDxqGvYmuMV2UwrW8rj4QOF9pUg+aghAMlBOwd99GpIwRrfZBnuXUU
	KAPl6EgB/yKqq854opG9ZjxSP/0Aok+tPVyPIv6s7xjczOLkbVByLHkItQDCyxzeeGPcvUglZdaKe
	QNZPtLM3rbBZ8YfQ5Z/HhhZrHjed25sHsmWJygaf2vA1rvqVDoOv8Js9KYnzkIEODDtKfhCTYaAPt
	zrTWFv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rGl-00000008PzD-3Oxz;
	Tue, 08 Sep 2026 08:33:31 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rGf-00000008Pxm-43tj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:33:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kiOkVi5r17HJzqo+ZKCuE14GzZhfmieEcsQeSDY87Tw=;
	b=bqQ/Rhj5fj26Bld/IPvQ6yOxC5/5HVhRfOQdpNeboKvmgMQkoYQYQGzOvqQRl4FzeRvxPFJoV
	Pukw3gi3ZiX73vgr0p+pOl/9i/WywBGADxa3MaW+q+f1lD5+TR1liO7n1m/Jbdbe3xRYlA81TGl
	81NVH+ONEZYfh17LEJRj6Uk=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfH4311Ypz1cyV9;
	Tue,  8 Sep 2026 16:22:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C12F4055B;
	Tue,  8 Sep 2026 16:33:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 16:33:19 +0800
Message-ID: <87672067-8822-4f76-8e52-8b8767a28e6f@huawei.com>
Date: Tue, 8 Sep 2026 16:33:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/19] arm64: smp: Don't bother printing the I-cache
 policy for each CPU
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-9-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-9-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_013326_477582_2F1BDE68 
X-CRM114-Status: GOOD (  13.81  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> The I-cache policy isn't particularly interesting but printing it early
> can result in unnecessary serialisation of onlining CPUs.
> 
> Remove the pointless print.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/cpuinfo.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index b423301a13cc..6dbea3a8bb23 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -31,19 +31,6 @@
>   * values depending on configuration at or after reset.
>   */
>  DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
> -
> -static inline const char *icache_policy_str(int l1ip)
> -{
> -	switch (l1ip) {
> -	case CTR_EL0_L1Ip_VIPT:
> -		return "VIPT";
> -	case CTR_EL0_L1Ip_PIPT:
> -		return "PIPT";
> -	default:
> -		return "RESERVED/UNKNOWN";
> -	}
> -}
> -
>  unsigned long __icache_flags;
>  
>  static const char *const hwcap_str[] = {
> @@ -424,7 +411,6 @@ device_initcall(cpuinfo_regs_init);
>  
>  static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
>  {
> -	unsigned int cpu = smp_processor_id();
>  	u32 l1ip = CTR_L1IP(info->reg_ctr);
>  
>  	switch (l1ip) {
> @@ -436,8 +422,6 @@ static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
>  		set_bit(ICACHEF_ALIASING, &__icache_flags);
>  		break;
>  	}
> -
> -	pr_info("Detected %s I-cache on CPU%d\n", icache_policy_str(l1ip), cpu);

As we need to defer RCU registration during secondary CPU bringup, so we
should avoid unnecessary early print during secondary CPU bringup, which
will trigger a false-positive lockdep"suspicious RCU usage" splat during
early lock acquisitions as commit ce3d31ad3cac ("arm64/smp: Move
rcu_cpu_starting() earlier") pointed out.

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  static void __cpuinfo_store_cpu_32bit(struct cpuinfo_32bit *info)


