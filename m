Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83946CE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MJgXkpBU+QeqQVCp3VSui56dxwRGtw05hjw74FFd+Q=; b=XXwff2oECkWx0gc7PjfzE2JK9+
	OT3Gdoyn1vIiqFNbZyVfgb5J0MdKi3ZHHPf1Nc0R58ZlWKjL8BHPtoVFPEdnyjtNCnOvz1H6/smnQ
	qAtzkWKZDiip6ugHn6XoUADy4vQyz4QYe/EeUZzko/glXE5G31Zf8XyzVCH1UKTcTdjsvAdCwghwE
	uumm203HghTuxiDo7U6N9pOkTuLVo/p2MlGB9F/Tcj6w24xOwuD00WpzltWHC4O8UoIxMJRXUjeBe
	IXGPcOCQSPNSZL87rqGijmqeXeOKcGcPphCksmVAu8IoUDAviM4l1pedyzRJ3xVtc7GjwnRTNfci6
	kMW9Sxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNs-00000000FuR-0Qlf;
	Thu, 24 Oct 2024 11:52:08 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w1I-00000000D0F-02Lx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:28:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XZ3XF477Wz1T8xQ;
	Thu, 24 Oct 2024 19:26:37 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BD5D1800DB;
	Thu, 24 Oct 2024 19:28:40 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 19:28:39 +0800
Subject: Re: [PATCH] irqchip/gic-v4: Don't allow a VMOVP on a dying VPE
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Kunkun Jiang <jiangkunkun@huawei.com>
References: <20241002204959.2051709-1-maz@kernel.org>
 <aab45cd3-e5ca-58cf-e081-e32a17f5b4e7@huawei.com>
 <87wmhztd9z.wl-maz@kernel.org>
 <bb3a38d9-4eb8-83ff-8b94-dd1bc80d005f@huawei.com>
 <8634km5250.wl-maz@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <5474225b-d4b7-b565-75d6-3d61113caba0@huawei.com>
Date: Thu, 24 Oct 2024 19:28:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <8634km5250.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_042848_236828_C2993261 
X-CRM114-Status: GOOD (  14.26  )
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

On 2024/10/23 22:23, Marc Zyngier wrote:
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index ab597e74ba08e..52f625e07658c 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3810,8 +3810,18 @@ static int its_vpe_set_affinity(struct irq_data *d,
>  	 * Check if we're racing against a VPE being destroyed, for
>  	 * which we don't want to allow a VMOVP.
>  	 */
> -	if (!atomic_read(&vpe->vmapp_count))
> -		return -EINVAL;
> +	if (!atomic_read(&vpe->vmapp_count)) {
> +		if (gic_requires_eager_mapping())
> +			return -EINVAL;
> +
> +		/*
> +		 * If we lazily map the VPEs, this isn't an error and
> +		 * we can exit cleanly.
> +		 */
> +		cpu = cpumask_first(mask_val);
> +		irq_data_update_effective_affinity(d, cpumask_of(cpu));
> +		return IRQ_SET_MASK_OK_DONE;
> +	}
>  
>  	/*
>  	 * Changing affinity is mega expensive, so let's be as lazy as

Looks good, thanks!

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

