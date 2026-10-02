Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF375CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c8Z4jtNzNu0aPsK+izRwvARdlBsMbyKzJho4TgtBbU=; b=iNlBz+pzGv42kGgpCdhEvbZKsU
	ZsNaJdF0VFWOprwXhZWd6aih4ie27GBKHGq4abPTEcVMOQw7wPC8r+muy9bYMNuC+cpg+3kG76g7R
	yEiFkWdE7wuVZPCh2hdCQJ123orpeiQNiNjl/unQRd4M1tcm5MXlW6w51vydELOVFb9VHXQNLltqn
	Cjq0IawrmmUQNgrfMrxEqgA6vunabHxhxIoN3T2RNd1JB1gkyHr45AOeLvaqJYw+w0Ppro33KMveD
	EAwmTisIp+pt6W7yNy97gaQzFeh+7LuoDwMrfJUuu7HgQWalbj5/z2/c4GURUIza2ueljPs/zge4S
	+9TQCNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCel0-0000000Bptu-1h9W;
	Fri, 02 Oct 2026 15:01:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeky-0000000Bpro-0h5C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:01:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29CB2497;
	Fri,  2 Oct 2026 08:00:58 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 726F13F86F;
	Fri,  2 Oct 2026 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953261; bh=uxqPygSk0GGwoVEys1yQJfRGBwvr5j1o7nPshoPKQ6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nlONrZvMcFldHDQuNZw6xbP78m/l7Rr3fS5gmVSKT9GNhBSZ67iUUd8XSuFupRMY8
	 weIYqlKl81PU9/oiYsg0oP2Yt0YjKHtKE0JqZ66q+4kCZr+D+b//VczZd+fWJM7xmf
	 66LKfVlqbxte6zMTkwlUXTTvu7iSPd3fGyxaujLY=
Message-ID: <0be46f32-31d1-4f53-af39-db9acbbc1f47@arm.com>
Date: Fri, 2 Oct 2026 16:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] arm_mpam: Restore the error interrupt enable
 from mpam_cpu_online()
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-3-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080104_261141_5749EE28 
X-CRM114-Status: GOOD (  15.67  )
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

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> When all the associated CPUs to an MSC are offline, possibly caused by
> PSCI_CPU_OFF, the power supply to the MSC can be cut off and all the
> registers that are unknown out of reset, including MPAMF_ECR.INTEN, are
> lost.

Surely all the registers lose their value - and what we get back is the
architecture's reset values. MPAMF_ECR doesn't seem to have one, we can assume
its UNKNOWN.

(I've rephrased this)


> Afterwards, we need to explicitly set MPAMF_ECR.INTEN when the first
> associated CPU becomes online and the power supply to the MSC is recovered.
> 
> Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
> of the MSC becomes online.

You won't be surprised to know I didn't have a platform that generated interrupts
when this was written!


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 580d7ed38569..32bde94dfbc3 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1856,8 +1856,14 @@ static int mpam_cpu_online(unsigned int cpu)
>  		if (msc->reenable_error_ppi)
>  			_enable_percpu_irq(&msc->reenable_error_ppi);
>  
> -		if (atomic_fetch_inc(&msc->online_refs) == 0)
> +		if (atomic_fetch_inc(&msc->online_refs) == 0) {
> +			mutex_lock(&msc->error_irq_lock);
> +			if (msc->error_irq_hw_enabled)
> +				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +			mutex_unlock(&msc->error_irq_lock);
> +
>  			mpam_reprogram_msc(msc);
> +		}
>  	}
>  
>  	if (mpam_resctrl_enabled)


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

