Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FACF34C5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YAr51HsDOk9toblksqsCZ7gf8wOdtMxxYgTG9gq0Nk=; b=0fnDaDh/iGj3ExbtFIHzoV47d6
	SkFwXq9ZFqJdQYLqrYb2MZy+VqRnrcDoC1U7vb6aEZ7+gzhagQwRCXXewV8oqRBrN8EeLWTl1DE2x
	9BCfLFtEYBR5F3PV18LWqZS6dnWiLwc+zaKcAu/o9dOeq2czMF9lD9W934tz9BJxRtCksT2fuibK4
	U+JzGbCj8VtYU3JvY7AQtgjgBV3sPXTdBmH8rRaH8+IJPr5hgQt71m2RdZI7DAf9mE3N+5XZ7W+eV
	S7nXq/Z4m0SOHjtcdg/e7/WIDeiR+UqTIr6sKJp3y2XY7gFv0EFcHjflHBKN7ukD6jGaxdDpo5oSg
	syAqzYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIUM-0000000Fsn5-0bTx;
	Mon, 13 Apr 2026 14:42:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIUJ-0000000Fsmd-0SKW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:42:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72055357A;
	Mon, 13 Apr 2026 07:41:59 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B13E63F641;
	Mon, 13 Apr 2026 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776091325; bh=Vnrz228eSk/mptycnXQRjUy58RSHNsaULpU2FASTdWU=;
	h=Date:Subject:Cc:References:From:In-Reply-To:From;
	b=Ox4XFWgTjz8OIRvYE2TPsgObpjTSWquTbGbtfyBurAHNFusQmwooU6ij0WBXa7ssY
	 GnGPNXrGAkuHQvNgAPIjjezUioQbP/LC8CiCugXqLSvDv2GCQUvKx5oWqo/z7e6M+5
	 Fm8LZpzkjKkkAhAny3/DQ/+SL7TkOWMlVPTepHMQ=
Message-ID: <fa463a9a-2dff-4f2b-931e-9e0a9ac3f9c9@arm.com>
Date: Mon, 13 Apr 2026 15:41:59 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_074207_199256_869AE7CC 
X-CRM114-Status: GOOD (  19.72  )
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



On 3/13/26 14:45, Ben Horgan wrote:
> This version of the mpam missing pieces series sees a couple of things
> dropped or hidden. Memory bandwith utilization with free-running counters
> is dropped in preference of just always using 'mbm_event' mode (ABMC
> emulation) which simplifies the code and allows for, in the future,
> filtering by read/write traffic. So, for the interim, there is no memory
> bandwidth utilization support. CDP is hidden behind config expert as
> remount of resctrl fs could potentially lead to out of range PARTIDs being
> used and the fix requires a change in fs/resctrl. The setting of MPAM2_EL2
> (for pkvm/nvhe) is dropped as too expensive a write for not much value.
> 
> There are a couple of 'fixes' at the start of the series which address
> problems in the base driver but are only user visible due to this series.
> 
> Changelogs in patches
> 
> Thanks for all the reviewing and testing so far. Just a bit more to get this
> over the line.
> 
> There is a small build conflict with the MPAM abmc precursors series [1], which
> alters some of the resctrl arch hooks. I will shortly be posting a respin
> of that too.
> 
> [1] https://lore.kernel.org/lkml/20260225201905.3568624-1-ben.horgan@arm.com/
> 
> From James' cover letter:
> 
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
> 
Thanks for all the help testing and reviewing. James has now sent a pull request to Catalin and he has picked it up.

Pull request:
https://lore.kernel.org/linux-arm-kernel/01f76011-f3c2-4dcb-b3bc-37c7d4de342e@arm.com/

branch in arm64:
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/mpam

Ben

