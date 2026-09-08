Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F99C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUieaY6CyZIkKzDEK46ImoDWCyB+ASDnm0IUxLv65GM=; b=uadojPU9MK/8CY8Dhh7szZB6im
	IEKHdh3u+OhtvIC1UwQyjKEP+qRtuUDyg/O+w68QsFBjewc8jkKDCjDaLg4ujnw/9OhAZ27/3KyXg
	S/biiIPPdZOcpcpjQyEjWftVz+nQGvR36jjrj9yGEVlP7HMZ9VVZvPZJO5V9AlqBok4slliHrj/YU
	wadyRjZiLBtIFcqwav5cSy8xHTuOiM9GWUUcurGJaTbw7Dvl6FlQcQFQ/ZUru7sNOlMlWNs7mhrYL
	JiUrGi2gVtjKaBiVeqoHcGLbQC7MRm0vbVwpHHmYTDFk5EkoBrQaTKkEJr1FeyUHb9C9e/vNGWm9o
	D18R4Onw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qMo-00000008HqH-3GvI;
	Tue, 08 Sep 2026 07:35:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qMn-00000008Hpe-1IiO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 07:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xUieaY6CyZIkKzDEK46ImoDWCyB+ASDnm0IUxLv65GM=; b=XCR5qLwqBQzwXHJ1p3iMTTAECE
	A1iu3WM/LTx4z6rsKhfnZdtuyudycFvVJ75QMLkeFJSz+KxJqAwCShMvuCZ4mrq3kUw8zQVzBfz52
	FnqmFihj4wtgPH2eF9Jy+uqsPjUC0+c9ybiU36MULkZZhq8VTdqcvh01mCkYl7QQdJKpVHUrcOdsJ
	qdd/5qWQB15UKoU13pol/iPhi+a5r4n6QDWX/BbrmsRDHDXb//qnUZF81FXvhFvGOJ7BYILuFchyK
	B0265nNBrMCwdv41wCVoCc9Lklp1p2+vuH7ycdV+BzSLFeNd71DOOnFU/epxpgkP8ykgmLoeeF9H5
	/9URG5QQ==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3qMj-0000000H3oD-03ga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:35:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xUieaY6CyZIkKzDEK46ImoDWCyB+ASDnm0IUxLv65GM=;
	b=r49i6fTWYp2ORiSYHCDJjBfP7WhUVxj17ju5MGiMdkbF8zq1rqufJkZQpLFI2InZ2Cke1fj4g
	AFLAcTWsybZtU+QBLdDscqgfvzdY1WyCMGbJl3icP5lsfey+hjQrA6S6xg15ENcm0n1dI64Mjvs
	bvO9f/x+v6d4khrHXSPpHOQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfFnH2rl7z1cyPY;
	Tue,  8 Sep 2026 15:24:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 670F040588;
	Tue,  8 Sep 2026 15:35:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 15:35:27 +0800
Message-ID: <f7567703-9718-416d-99f6-9364b54d935c@huawei.com>
Date: Tue, 8 Sep 2026 15:35:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] arm64: smp: Tidy up smp_prepare_cpus()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-6-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-6-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_083538_032244_A7A6CE4A 
X-CRM114-Status: GOOD (  15.97  )
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
> smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
> to great lengths to support running on a CPU where smp_processor_id()

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> is non-zero.
> 
> Clean up the code a little by hardcoding zero for the boot CPU ID.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/smp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a11..ff045080ca1b 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -779,16 +779,14 @@ void __init smp_init_cpus(void)
>  void __init smp_prepare_cpus(unsigned int max_cpus)
>  {
>  	const struct cpu_operations *ops;
> -	int err;
>  	unsigned int cpu;
> -	unsigned int this_cpu;
> +	int err;
>  
>  	init_cpu_topology();
>  
> -	this_cpu = smp_processor_id();
> -	store_cpu_topology(this_cpu);
> -	numa_store_cpu_info(this_cpu);
> -	numa_add_cpu(this_cpu);
> +	store_cpu_topology(0);
> +	numa_store_cpu_info(0);
> +	numa_add_cpu(0);
>  
>  	/*
>  	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
> @@ -803,8 +801,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	 * secondaries from the bootloader.
>  	 */
>  	for_each_possible_cpu(cpu) {
> -
> -		if (cpu == smp_processor_id())
> +		if (cpu == 0)
>  			continue;
>  
>  		ops = get_cpu_ops(cpu);


