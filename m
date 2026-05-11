Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A0ECD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:To:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kx7fIF1LEjA7aOIeJZf85aT2a1T0HRNePgWRsIQwNJA=; b=vgtOZr1Xu+yI4uFX7JJkmekOqc
	vy6xe8m9Rt2zisNy/IThJjwtZtfSJGnfnetfKxSpB+fQ6s4BqBehXZYShNTYFLVAmA9zwupj2vS49
	hr8buTcGS5qO/1MRtb4drF9I44JdQQ9f+q+wckiH23/40NLyxeWsfzYCzFZuDrOQQm9dcJ1EAXlwg
	KdRXOtQmEhskpN8nwJIy+F0ehumgnwhzK2NSF7E8fj2bPSmHg4EmoFFH6UE2T3xplBAKfNkbdVRIw
	l8qwO/j6aMyA/+kLSdH+HqDruWgGtUqbQoViatg0ZFBUsA5tFQEGOEzwHXhWVikSInuxraTi4e/BW
	F7x98sUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSuv-0000000E6y7-1DE6;
	Mon, 11 May 2026 15:51:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSus-0000000E6xJ-1xP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:51:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35F4516F3;
	Mon, 11 May 2026 08:51:27 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617C13F836;
	Mon, 11 May 2026 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778514692; bh=59D2L516N9XT0eGE8EqGlqo7ArzVSf/bKNF4d/jh4tw=;
	h=Date:Subject:Cc:References:To:From:In-Reply-To:From;
	b=Pe0UUCSAk9BbAHb4Perpr2VC0UvWg+IJcpDpp2ujgq1OeRuM19fi1/O+P+mMgxf9l
	 RzrUTqvDmxKm9w6nVbc49K87DVyxvLw8he5hRnDkH7kCyyRXmjp2FK9vhY2a+1Ad4I
	 J0o9qzOWMFKjgi+c5Y7siN8gIadQyQZf9pp4Tn+s=
Message-ID: <9fb14e0e-5dc4-4d64-883f-6fab93f46195@arm.com>
Date: Mon, 11 May 2026 16:51:28 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org
References: <20260511154147.557481-1-ben.horgan@arm.com>
Content-Language: en-US
To: ben.horgan@arm.com
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260511154147.557481-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_085134_567796_5C9E8F5B 
X-CRM114-Status: GOOD (  13.97  )
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

I forgot to say, the code can be found at:

https://gitlab.arm.com/linux-arm/linux-bh.git mpam_abmc_v3

On 5/11/26 16:41, Ben Horgan wrote:
> Removing the rfc tag as the resctrl precursors [1] have been queued in tip
> x86/cache. Due to that dependency, it would be good for this to also go through
> x86/cache.
> 
> This series adds support for memory bandwidth monitoring.
> 
> Please review and test.
> 
> Changelogs in patches.
> 
> [1] https://lore.kernel.org/all/20260506082855.3694761-1-ben.horgan@arm.com/
> 
> Description from the initial cover letter:
> 
> The MPAM counter assignment (ABMC emulation) changes that were dropped from
> the resctrl glue series due to some missing precursors in resctrl. Counter
> assignment enables bandwidth monitoring in systems that have fewer
> monitors than resctrl monitor groups.
> 
> rfc v1: https://lore.kernel.org/lkml/20260225205436.3571756-1-ben.horgan@arm.com/
> rfc v2: https://lore.kernel.org/lkml/20260319165540.381410-1-ben.horgan@arm.com/
> 
> Ben Horgan (2):
>   arm_mpam: resctrl: Pre-allocate assignable monitors
>   arm64: mpam: Add memory bandwidth usage (MBWU) documentation
> 
> James Morse (3):
>   arm_mpam: resctrl: Pick classes for use as mbm counters
>   arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
>   arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
>     resctrl_arch_reset_cntr()
> 
>  Documentation/arch/arm64/mpam.rst |  17 ++
>  drivers/resctrl/mpam_internal.h   |   6 +-
>  drivers/resctrl/mpam_resctrl.c    | 306 +++++++++++++++++++++++++++---
>  3 files changed, 306 insertions(+), 23 deletions(-)
> 


