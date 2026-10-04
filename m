Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615FBCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PBvAPhxoqixZMAgWbqzLZ2cN/fsVRLlvnaVCIYg7+g=; b=jXy1Jhwjud6AKg3iVYexVFhNOn
	qvkkUY550ekFptTEZbmli7l9oxxonq8sTIrdjlIBsjTHSI5CEUhslkrhDTKbw9CeZMAmyPJLir/XR
	lesgUvBaAz6C6KeV1haU2QbHvt0NxqaZoEqCd0hURSkwOAfVS9xLxajw5BUQlrc1Kqk2muUKLBXlH
	rJRNQi7dnT0zvL4jrajpMdFFAfjO8tfcKTFoSreKyC1n8dFOmgJ3riHroQKDXnqs5Zaa6y0ejcleJ
	jkSQwbA9JhRtt2qvQQ1Y5T1MVz6UJeudYfE6jfoVM2MqAxoG+KAQO2HtFfT1+g3CVxcsiiVPHaG07
	p0gvMnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPod-0000000F5Y6-0DFY;
	Sun, 04 Oct 2026 17:15:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPob-0000000F5Xd-24h5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 17:15:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01D1E4086A;
	Sun,  4 Oct 2026 17:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EE31F000FF;
	Sun,  4 Oct 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791134156;
	bh=0PBvAPhxoqixZMAgWbqzLZ2cN/fsVRLlvnaVCIYg7+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JCsCQuXBRXIj8RKKQWr2Q9R9dkQd5k1hjTPOYJyNcAKf9cVGT3p3jk0gLw5w5LzuG
	 isgaiDysJSByo6st6nSQLA4H6vCo4UCPfl44oVa1YuoN8qs+e+A7RrLlCHJrgVOBM7
	 FQkosE1qCEtizW5BenCmADomxGBZf0nCQ7/n2iuQv69dwvDUNebAufWR08WSeVd2Y0
	 Dlh0piCsUiRE3ot9iqFuZR1UgCg0sNq20dhJA+MCdkXpjQaDgXEPjEH31nIhYJ7Adi
	 YanMT3TTW0m9H9WuNfvosJErw9UtHmLTQ5NMS3ElxymohuJIa2asoUArEkhH8s2rFy
	 VR6+LD4z9ga5Q==
Date: Sun, 4 Oct 2026 18:15:51 +0100
From: Will Deacon <will@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] perf/dwc_pcie: Fix lockdep warnings in device and
 event setup
Message-ID: <asKJx59SN-NX-ho8@willie-the-truck>
References: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com>
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

On Tue, Aug 11, 2026 at 09:17:12PM +0800, Zhanpeng Zhang wrote:
> The DWC PCIe PMU driver creates a synthetic platform device for each Root
> Port from its PCI bus notifier. If a PCI host bridge is registered during
> late init, platform device registration enters the platform bus notifier
> chain while the PCI bus notifier lock remains held, and lockdep reports
> possible recursive locking. Patch 1 moves platform device reconciliation
> out of the notifier callback.
> 
> The event initialization path has a separate locking issue. It walks a new
> group leader's sibling list even though perf does not hold the event context
> lock required by for_each_sibling_event(). Patch 2 skips those walks for
> group leaders while preserving validation for group members.
> 
> The series was tested on a RISC-V system with CONFIG_KASAN,
> CONFIG_PROVE_LOCKING, CONFIG_DEBUG_LOCK_ALLOC and CONFIG_LOCKDEP enabled.
> Late PCI discovery and a system-wide DWC PCIe PMU perf stat complete without
> lockdep reports, and the kernel remains untainted.
> 
> Zhanpeng Zhang (2):
>   perf/dwc_pcie: Avoid nested bus notifier locking
>   perf/dwc_pcie: Skip sibling walks for new group leaders
> 
>  drivers/perf/dwc_pcie_pmu.c | 161 +++++++++++++++++++++++++++---------
>  1 file changed, 122 insertions(+), 39 deletions(-)

This doesn't seem to apply. Please can you send an updated version?

Will

