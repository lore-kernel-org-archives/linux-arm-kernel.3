Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB0FCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EFxhJHv9HjGyOP1OMAlDgu656m8oqAANw+tk4wbYE8=; b=Hq4/18qAlmz/hHx5m76/su7L8K
	c9tnZMOICOgaW4PyTzHIZ/wpm8ExLo6CcBhDJz0P7FZTUUG0O9SWV2WobTPCNAu4ArhoStjk8W/CD
	Ke9Fd366MvjJEWkslBpGvc6JSvHuEcxFbeNP1tm/3e0WuTTFE6xt/s4UEqxfScopBzrRhj5fWN6aa
	iBdm3XS3rNqX5l4HnYd74RHHC8rDNRCU6QDktY8seCTRMF65NOeWcpnWA2AC0aT2q6WvfuZw3Wu7V
	Uj7+9m0EN30ORC8ap+5W99xq2ldmo5Fu3NRzt8YMYc4BGxXiiOw3mDmQAC0gvBWnzy8eHDbHqmqgw
	NfMoOMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25qa-00000000TcY-0Eeb;
	Fri, 26 Sep 2025 10:38:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25qY-00000000Taj-0biI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:38:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C746168F;
	Fri, 26 Sep 2025 03:38:27 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F14293F5A1;
	Fri, 26 Sep 2025 03:38:32 -0700 (PDT)
Date: Fri, 26 Sep 2025 11:38:30 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v3 00/26] genirq: Add support for percpu_devid IRQ
 affinity
Message-ID: <aNZtJoFrOv8dHlkV@raptor>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_033838_226897_C82B3BE9 
X-CRM114-Status: GOOD (  17.62  )
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

Hi,

Tested this on a rockpro64 - 4xA53 + 2xA72.

On kernel v6.17-rc5, using perf to profile iperf3 for 10 seconds, the top
overhead symbol was _raw_spinlock_irq_restore() and the PMU wasn't using NMIs
(checked by printing has_nmi after armpmu_request_irq()).

With this series, same test, *irq_restore() overhead dropped to about 1% on the
little core, below 1% on the big core, and the PMU was using NMIs.

Thanks,
Alex

On Mon, Sep 22, 2025 at 09:28:07AM +0100, Marc Zyngier wrote:
> This is the third version of this series, originally posted at [1],
> which aims at allowing percpu_devid interrupt requests on the basis of
> an affinity mask. See the original submission for the details of why
> this is a desirable outcome.
> 
> From v2, we have some tidying up, thanks to Jonathan's review -- see
> changelog for details.
> 
> FWIW, I've pushed a branch at [3].
> 
> * From v2 [2]:
> 
>   - Turned of_node_to_fwnode() usage to of_fwnode_handle() (Jonathan)
> 
>   - Added a patch to finally kill of_node_to_fwnode()
> 
>   - Tidied-up documentation, comments and formatting (Jonathan)
> 
>   - Collected ABs and Rbs, with thanks (Jonathan, Suzuki, Sven)
> 
> * From v1 [1]:
> 
>   - Fixed NMI handling by getting rid of the NMI-specific flow
>     handler, which was pretty useless anyway (Will)
> 
>   - As a result, killed a metric buttload worth of GICv3 code
> 
>   - Moved irq_fwspec out of irq_fwspec_info, and passed it as a
>     parameter to irq_get_fwspec_info(), renamed from irq_get_info(),
>     and applied some generous sanitisation of the structure (Thomas)
> 
>   - Dropped the rather useless fwspec validity flag (Thomas)
> 
>   - Rejigged the PMU per-CPU handling to better deal with the DT/ACPI
>     differences, and drop some now useless patches (Will)
> 
>   - Plenty of cosmetic rework (Raphael, Thomas)
> 
> [1] https://lore.kernel.org/r/20250908163127.2462948-1-maz@kernel.org
> [2] https://lore.kernel.org/r/20250915085702.519996-1-maz@kernel.org
> [3] git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/ppi-affinity

