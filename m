Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB3BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8cLuyWmZFg55rtghMzlXx/PsTMcGUsqAxp6eT7P6kc=; b=aEbqU4+aLOVrPIMVE2lXqiu/KZ
	9MtXcbPrypAYOyggobVuI/hLhvMYg37clrE5Vclavy+z38HO2UU43Wp0DdXkYfoc/yKosOupVk8Vu
	9hvacvr8PQW7SPle/it7F3QWiXCZvAL6E2TidPWI5U1E4TAFeTn7pxNG3VQ4bNP3zVvESnFCCnGQL
	gbunBp26kiIC9xLwBGz5wfQTDm59wAIvtHsFdo7ubuvH5uLBVDNOjXSpk7zh8QTKYsEFUoUz8jfWt
	HUleOybAeIGpoQWJw4845+ezFeWyjsC3I3K8uUzgvP6ne0nrubw/YSUZPZSF9nhFa4XuIuOsciz5I
	Oq4B3XWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAxr-0000000EX9j-3zCe;
	Mon, 29 Jun 2026 12:19:51 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAxp-0000000EX8T-1RwU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:19:50 +0000
Message-ID: <0547a4b7-8f6a-4516-8cdd-a308ae9bf579@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782735583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8cLuyWmZFg55rtghMzlXx/PsTMcGUsqAxp6eT7P6kc=;
	b=nRn8h3199GxH9T6i12cljJrbAln/J7kN2oA6l5oUAAzQi/9unjBPViP36wPfDXcowo3pEQ
	+vrxRhRtw8ee27MCIBywBkw1NttS7yBkMebIecqf8g9e3wHnWqEFCrtfk8b9Wx+8zkqL1d
	IQ5VJbyDc3SyQ99XfsDxGzvULZZ0FjI=
Date: Mon, 29 Jun 2026 20:19:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Fix OF node reference leak
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20260628220723.1699972-1-dbgh9129@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260628220723.1699972-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_051949_689728_99066A0A 
X-CRM114-Status: GOOD (  16.82  )
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

On 6/29/26 6:07 AM, Yuho Choi wrote:
> of_get_cpu_node() returns a referenced device node. In
> its_cpu_init_collection(), the Cavium 23144 workaround only uses the
> node to compare the CPU NUMA node, but the reference is never dropped.
> 
> Use the device_node cleanup helper for the CPU node reference so it is
> released when leaving the workaround block, including the NUMA mismatch
> return path.
> 
> Fixes: fbf8f40e1658 ("irqchip/gicv3-its: numa: Enable workaround for Cavium thunderx erratum 23144")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> Acked-by: Marc Zyngier <maz@kernel.org>
> ---
> Changes in v3:
> - Keep the __free(device_node) assignment on a single line.
> - Fix indentation in the Cavium 23144 workaround block.
> - Add Marc's Acked-by.
> Changes in v2:
> - Use __free(device_node) for the CPU node reference.
> - Correct the Fixes tag to fbf8f40e1658.
>  drivers/irqchip/irq-gic-v3-its.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index b57d81ad33a0..6f5811aae59c 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3290,11 +3290,9 @@ static void its_cpu_init_collection(struct its_node *its)
>  
>  	/* avoid cross node collections and its mapping */
>  	if (its->flags & ITS_FLAGS_WORKAROUND_CAVIUM_23144) {
> -		struct device_node *cpu_node;
> +		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
>  
> -		cpu_node = of_get_cpu_node(cpu, NULL);
> -		if (its->numa_node != NUMA_NO_NODE &&
> -			its->numa_node != of_node_to_nid(cpu_node))
> +		if (its->numa_node != NUMA_NO_NODE && its->numa_node != of_node_to_nid(cpu_node))
>  			return;
>  	}

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui

