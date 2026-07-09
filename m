Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBB5C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01sbm6fVaYiiHHkJ7k1n3+ePoevqsPaJoT53HbHV54E=; b=CCtILX1Z9h3o/b
	o0r3Aw049hEpDDLm4GEzSxAeYgoQaj57BZKRo8OnNzaEoaOYcapVVdcnLmHomgOMSXxp3KEQfN8NI
	yKZIlKBkC0AVFkbVIDtBRh9Fb2mgGK0CNvh6OjGdCLjsDJeo8pt1Z/D8yoHt5vfxCpqHir+0owzIk
	VsbRKbVfmj3oLFBVpI78YP5tgCDW11rVPe0t+l3y0xTcKMj9GyY/WWrQywNoQimZQI/qgxw3UJYpd
	wrU1D/wsND5/vbaF8gt0koGfEapnHuk/ECLQ5j6oO5n6k4CBI4VAJDksL1tw37EP4ONhTQxEPq3ci
	2dTQ0F7koTR/w9lbhxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoey-00000002WvG-3zYV;
	Thu, 09 Jul 2026 13:19:24 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoeu-00000002Wu2-25Ok
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:19:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=01sbm6fVaYiiHHkJ7k1n3+ePoevqsPaJoT53HbHV54E=;
	b=5O5fmDEaomiQ+EJyla6QRBz082huhFYV38AWcOlauQHnWVZ38T+ZKsG6w2AGgt351KjsgboqZ
	rmGqSNFzo/mdm+rEeQ2TFQsNyyKQj+o5ClBb8Ndrk0lKbWo3MP0yFZjdnHRRLfKq9cJaIbpwt12
	Ixu2nf+1848XJ4bO1htVDD4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gwwKm6L2kz1prLD;
	Thu,  9 Jul 2026 21:09:48 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AF3240561;
	Thu,  9 Jul 2026 21:19:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 21:19:04 +0800
Message-ID: <cd801ce1-7326-49c2-a6d2-218f9e3bd670@huawei.com>
Date: Thu, 9 Jul 2026 21:19:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/36] arm64: hibernate: mask DAIF before restoring
 hibernated kernel
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-4-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-4-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_061921_199142_CDA26E1B 
X-CRM114-Status: GOOD (  23.18  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> The arm64 hibernate code manages the exception masking in an unsound
> way, leading to potential crashes and/or warnings during resume.
> 
> When a hibernation image is saved in `swsusp_arch_suspend()`, all DAIF
> exceptions are masked (by virtue of `local_daif_save()`), and the
> suspended image is saved assuming that all DAIF exceptions will remain
> masked when the image is restored.
> 
> When a hibernation image is resumed by `swsusp_arch_resume()`, only
> interrupts are masked (by virtue of `local_irq_save()` in

local_irq_disable()?

> `resume_target_kernel()`). When pseudo-NMI is enabled the DAIF.IF bits
> will be clear, and regardless of pseudo-NMI the DAIF.DA bits will be
> clear.
> 
> This means that there are two problems:
> 
> (1) It is possible to take Debug, SError, or pseudo-NMI exceptions
>     during the resume process. This is unsafe, as during the resume
>     process both the old ane new kernels will tranisently be in an
>     inconsistent state, and swsusp_arch_suspend_exit() won't retain
>     an executable mapping of any exception vectors.
> 
>     Any exception taken here will be fatal and silent.
> 
> (2) When re-entering the resumed kernel, some DAIF bits will be clear
>     unexpectedly. This permits Debug, SError, or pseudo-NMI exceptions
>     to be taken for a short period while the resumed kernel is not yet
>     in a consistent state.
> 
>     This is detected by CONFIG_ARM64_DEBUG_PRIORITY_MASKING.
> 
> Avoid these issues by masking all DAIF exceptions during resume.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/hibernate.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 9717568518ba..d0d9bd91e639 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -405,6 +405,7 @@ int swsusp_arch_suspend(void)
>  int __nocfi swsusp_arch_resume(void)
>  {
>  	int rc;
> +	unsigned long flags;
>  	void *zero_page;
>  	size_t exit_size;
>  	pgd_t *tmp_pg_dir;
> @@ -465,9 +466,21 @@ int __nocfi swsusp_arch_resume(void)
>  	if (el2_reset_needed())
>  		__hyp_set_vectors(el2_vectors);
>  
> +	/*
> +	 * It is necessary to mask all DAIF exceptions here as:
> +	 *
> +	 * - The copy of swsusp_arch_suspend_exit() in the hibernation
> +	 *   text cannot handle taking any exceptions.
> +	 *
> +	 * - The suspended kernel masked all DAIF exceptions in
> +	 *   swsusp_arch_resume(), and expects to be re-entered in the
> +	 *   same state : with all DAIF exceptions masked.
> +	 */
> +	flags = local_daif_save();
>  	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
>  		       resume_hdr.reenter_kernel, restore_pblist,
>  		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
> +	local_daif_restore(flags);
>  
>  	return 0;
>  }


