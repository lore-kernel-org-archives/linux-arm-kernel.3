Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A966DE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/s2J2uP1S2DeK+z8is7/wq5MKo71r/0dbDPfzgrU8s=; b=cy7G+da5a1Aw9Th0L24j9dhw5X
	OD85y+t/PaLGC1AAZPOU8+3MqrkqXAZw8FzX/jzGX1YcaXkz1ECC5rVebkevuPyfWtfRQtg3Wtn/v
	o1CdHOz9MCHP3GU3x0KvUsRIZcbCBqju9D1CVZkE9HSe+15aQf4M4s2KHg/2w+1MuRwKURUvRuADa
	fRPNwurweU/PkAS6CA3LdbZbAj+FrySShzlA63QeqtldrTQUSyo0cNvtHCO8Q5aIH2s6Z2c7Tlg7D
	Q3qAhqxmbwbLSR3gqkcPQj7cw0+k3QvxXQfAH7+dFLGxyrbaN6ub3Z5aPjUXQA/W/JO8X91Zm0ekk
	wKBizsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIr8f-0000000CyDr-0xFI;
	Wed, 04 Dec 2024 15:18:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIr7g-0000000Cy6O-1OSR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Dec 2024 15:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O/s2J2uP1S2DeK+z8is7/wq5MKo71r/0dbDPfzgrU8s=; b=heOqSF4l3+mFlZWj/FVwMhmVTj
	r7Z2Rnl/me+foPMj4fzC9HeNlAq/HJ5lyiXbh1edZr8lvzh0bgse2nPmXEAEKxRBMR9erQe5z1vGh
	TZNqqDWQBpBjcvZYyunaTdtvETq3pUEKOlXWLrkK6xfN6AjI06O8BFbIErLjcm230961VgTJ/YCm+
	Qo3oA/AfAYnhpCCdNX7DfmX0Fh9dCD+732Wp6PK8xjJBhDiEiTrI4tm6F4qfx+GdZ/cDbL4aE8cvg
	kCjbm5Q3NbRzkBZGgHrvwDi9bs01R7zhHWHQegQdkQMTT1j/o5VIt9PuFu2Wx1PC87n6JOC9aaIaY
	lQUpPgog==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIr7c-00000002eCe-3tuR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:17:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC8961063;
	Wed,  4 Dec 2024 07:17:24 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 582A83F5A1;
	Wed,  4 Dec 2024 07:16:56 -0800 (PST)
Date: Wed, 4 Dec 2024 15:16:50 +0000
From: Leo Yan <leo.yan@arm.com>
To: yuanfang zhang <quic_yuanfang@quicinc.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight-etm4x: add isb() before reading the TRCSTATR
Message-ID: <20241204151650.GA1976757@e132581.arm.com>
References: <20241204112332.3706137-1-quic_yuanfang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241204112332.3706137-1-quic_yuanfang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_151701_343767_DF2AEA56 
X-CRM114-Status: GOOD (  23.05  )
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

Hi Yuanfang,

Recently I just acrossed this part, so some comments.

On Wed, Dec 04, 2024 at 07:23:32PM +0800, yuanfang zhang wrote:
> 
> From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> As recommended by section 4.3.7 ("Synchronization when using system
> instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> self-hosted trace analyzer must perform a Context synchronization
> event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> 
> Fixes: ebddaad09e10 ("coresight: etm4x: Add missing single-shot control API to sysfs")
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Change in V2:
> Added comments in the code.
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 66d44a404ad0..decb3a87e27e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -906,6 +906,13 @@ static void etm4_disable_hw(void *info)
>         tsb_csync();
>         etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
> 
> +       /*
> +        * As recommended by section 4.3.7 ("Synchronization when using system
> +        * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> +        * self-hosted trace analyzer must perform a Context synchronization
> +        * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> +        */
> +       isb();

As described in the doc, the "isb" is only required for system
instructions case.  It is good to only apply the ISB on system
register case:

        if (!csa->io_mem)
                isb();

>         /* wait for TRCSTATR.PMSTABLE to go to '1' */
>         if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
>                 dev_err(etm_dev,

As mentioned in system register case: "Arm recommends that the
self-hosted trace analyzer always executes an ISB instruction after
programming the trace unit registers, to ensure that all updates are
committed to the trace unit before normal code execution resumes."

And for MMIO case:

"When the memory is marked as Device-nGnRE or stronger.
 ...
 - Poll TRCSTATR to ensure the previous write has completed.
 — Execute an ISB operation."

Thus we need to add an ISB after polling.

        isb();

For consistent behaviour, a relevant thing is the dsb(sy) in
etm4_enable_hw().  I do not think the dsb(sy) is necessary, as the
driver uses the sequence "write TRCPRGCTLR + polling TRCSTATR" to
ensure the data has been populated to trace unit, the polling
operations somehow act as a read back.  And the ETM manual does not
mention the requirement for DSB when enabling trace unit.  Thus, we
should remove dsb(sy) (maybe use a separte patch).

Mike / Suzuki / James, please confirm if my conclusions are valid.

Thanks,
Leo

