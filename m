Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E59C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xb8gow27XZB8mMI82InhQ+4PI5DXkeTP3ZBLLO0PSos=; b=U95H0wBnQCT8vY7pu7d+JD8M4t
	1ua1E4+lXBRkls/CwO7gK4v6A1zPl9oaneNZVIUO5szLgZrGISolM6G2jdhX+lzco1TlYM/hf+bIe
	tDL0HntkiCDPWUSuy8cucp/kv05nDs1rXrL0iNpPAY/xbkRhMCj2VgrEGXQEhTA6X/xzfAXVBxtBK
	e8SURQKHYgQSLQsdxN3q6awch+BDhUBm/VJUKm9c0Qu7VdtCJrJ5JSLMtMYX1nRYMtx03okQma0yE
	+68GiPuUNMyOfgCzqQ3hnI8VEMA1IKa0qh2vg4BdwpLRYI78BgMum+WqPPwSjDuyI1FIA7shje2CE
	gp5sLGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFhs-00000002zx0-3cTX;
	Tue, 22 Jul 2025 16:19:08 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEZY-00000002ohV-4BUd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:06:30 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bmgY56zWsz6H7X6;
	Tue, 22 Jul 2025 23:04:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 08056140446;
	Tue, 22 Jul 2025 23:06:22 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Jul
 2025 17:06:20 +0200
Date: Tue, 22 Jul 2025 16:06:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, Rohit
 Mathew <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	"Zeng Heng" <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
	"Carl Worth" <carl@os.amperecomputing.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>
Subject: Re: [RFC PATCH 25/36] arm_mpam: Register and enable IRQs
Message-ID: <20250722160618.0000598f@huawei.com>
In-Reply-To: <20250711183648.30766-26-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-26-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_080629_322648_A0EDDF57 
X-CRM114-Status: GOOD (  19.76  )
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

On Fri, 11 Jul 2025 18:36:37 +0000
James Morse <james.morse@arm.com> wrote:

> Register and enable error IRQs. All the MPAM error interrupts indicate a
> software bug, e.g. out of range partid. If the error interrupt is ever
> signalled, attempt to disable MPAM.
> 
> Only the irq handler accesses the ESR register, so no locking is needed.
> The work to disable MPAM after an error needs to happen at process
> context, use a threaded interrupt.
> 
> There is no support for percpu threaded interrupts, for now schedule
> the work to be done from the irq handler.
> 
> Enabling the IRQs in the MSC may involve cross calling to a CPU that
> can access the MSC.
> 
> CC: Rohit Mathew <rohit.mathew@arm.com>
> Tested-by: Rohit Mathew <rohit.mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
Sparse gives an imbalance warning in mpam_register_irqs()

> +static int mpam_register_irqs(void)
> +{
> +	int err, irq, idx;
> +	struct mpam_msc *msc;
> +
> +	lockdep_assert_cpus_held();
> +
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_srcu(msc, &mpam_all_msc, glbl_list, srcu_read_lock_held(&mpam_srcu)) {
> +		irq = platform_get_irq_byname_optional(msc->pdev, "error");
> +		if (irq <= 0)
> +			continue;
> +
> +		/* The MPAM spec says the interrupt can be SPI, PPI or LPI */
> +		/* We anticipate sharing the interrupt with other MSCs */
> +		if (irq_is_percpu(irq)) {
> +			err = request_percpu_irq(irq, &mpam_ppi_handler,
> +						 "mpam:msc:error",
> +						 msc->error_dev_id);
> +			if (err)
> +				return err;

Looks like the srcu_read_lock is still held.

There is a DEFINE_LOCK_GUARD_1() in srcu.h so you can do

	guard(srcu)(&mpam_srcu, idx);

I think and not worry about releasing it in errors or the good path.

> +
> +			msc->reenable_error_ppi = irq;
> +			smp_call_function_many(&msc->accessibility,
> +					       &_enable_percpu_irq, &irq,
> +					       true);
> +		} else {
> +			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
> +							&mpam_spi_handler,
> +							&mpam_disable_thread,
> +							IRQF_SHARED,
> +							"mpam:msc:error", msc);
> +			if (err)
> +				return err;
> +		}
> +
> +		msc->error_irq_requested = true;
> +		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +		msc->error_irq_hw_enabled = true;
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +
> +	return 0;
> +}

