Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F34FCD343C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HchmBEL73/x0nkhHlnFKQS69bu+lLK3nviThBJ+BgQ=; b=WX/mjEWkAJneTcFyER26MNb8Oj
	sXKPNSUs+gY3oWCqckyaXypiLAOJXCZisQ/Tv0ul3D9M/VD82rgzmRBr3++XsecaKajBvftEC6Ve5
	j6R4uooA7jxO/Kn9chmt9GjMaU0FCJDnnms0/cUGsnv2mG7QF6g/GQfi7O5rUo6Atex5TjjYRnWSR
	VQ0iSxeDx0GHey0GHuMsNuH2B0n47klsaBtXXjIKobUGNA5/QBjyb0ZJybBIr6sx0G7NmumFN09zM
	xwi2IRCOEupbXQrvaiC1Cx1stk528VTsXKLgPcTx2ZqdBhQ/5VmYXJ/3MWm8nLirkmsM6siQhDQkC
	BSOFpUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFLZ-00000009ImE-42tK;
	Wed, 12 Nov 2025 18:13:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFLX-00000009Ilc-1AKx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:13:32 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6BMg65WmzJ46bC;
	Thu, 13 Nov 2025 02:12:47 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id ADCDA1400D9;
	Thu, 13 Nov 2025 02:13:20 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 12 Nov
 2025 18:13:19 +0000
Date: Wed, 12 Nov 2025 18:13:18 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Mark
 Rutland" <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
	<j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
	<james.clark@linaro.org>, Jinjie Ruan <ruanjinjie@huawei.com>, "Alexandru
 Elisei" <alexandru.elisei@arm.com>
Subject: Re: [PATCH v4 14/26] genirq: Add affinity to percpu_devid interrupt
 requests
Message-ID: <20251112181318.000064be@huawei.com>
In-Reply-To: <20251020122944.3074811-15-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
	<20251020122944.3074811-15-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_101331_465449_A1F8BCCE 
X-CRM114-Status: GOOD (  15.26  )
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

On Mon, 20 Oct 2025 13:29:31 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Add an affinity field to both the irqaction structure and the interrupt
> request primitives. Nothing is making use of it yet, and the only value
> used it NULL, which is used as a shorthand for cpu_possible_mask.

used is NULL

> 
> This will shortly get used with actual affinities.
> 
> Tested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

With trivial bit of documentation added
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  include/linux/interrupt.h |  5 +++--
>  kernel/irq/manage.c       | 14 ++++++++++----
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> index 0ec1a71ab4e84..52147d5f432b3 100644
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -125,6 +125,7 @@ struct irqaction {
>  		void		*dev_id;
>  		void __percpu	*percpu_dev_id;
>  	};
> +	const struct cpumask	*affinity;

This structure has kernel-doc that needs an update.

>  	struct irqaction	*next;
>  	irq_handler_t		thread_fn;
>  	struct task_struct	*thread;



