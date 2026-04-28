Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ADDFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7rtABauihl9wqOFgiCGqnWThUeSwi+O3wmTvtqfHCw=; b=ztdjmNVgdJ8hO9bNj57H1lvjX6
	FiGqA8p7vS+2Cd615Ub/O46JQkPBTcAfyzMHt4YaHQB6znRtW3dB7IGdqeGdH9PO3SO8xxZkNGPYQ
	BmpVfttMi2sFWjFo9yLKrNNPA6Kd2LYMBV7WYsdc1I1oprZL4nx2os5xYZzA5z0TnddyNt8ISjxz6
	yIFUKw4NqUol5bI9LpaGShrvXV3Ockn4UMm1/jKXO9V426lIMcdhIm0a2yYVIjdLwCEged3ZAg2sf
	DPmuAahM09y4y+cwa75ML6ED8lhHEYsXF/yx4Do5J3K3vNQUGBY5RfWPh4U2qThaKvDDmpxxnTk6H
	QUh/IZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmOg-000000022H1-3glG;
	Tue, 28 Apr 2026 17:38:58 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmOf-000000022GR-0AE1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:38:58 +0000
Received: from [192.168.201.246] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 24E8C20B7187;
	Tue, 28 Apr 2026 10:38:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 24E8C20B7187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1777397928;
	bh=O7rtABauihl9wqOFgiCGqnWThUeSwi+O3wmTvtqfHCw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=prKSpqA0nu5bbJsq8pUmLz0rl5TpIfeRd8x/wvD7jk7ib4btICCWyBme71PDyQGNI
	 QssSaXo8RDoZwoRQrqbtNPEawUAR854/AmU12bfQgSxZjaGKNHSqUSx/4F/lzdH49R
	 r1lxgHSY1G4VgBwaC431Tdj5kxVZ19Y48hdU1WsQ=
Message-ID: <e9de1b01-d075-487d-a00a-e2420b909f69@linux.microsoft.com>
Date: Tue, 28 Apr 2026 10:38:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
 easwar.hariharan@linux.microsoft.com, jgg@ziepe.ca, nicolinc@nvidia.com,
 praan@google.com, kees@kernel.org, amhetre@nvidia.com,
 Alexander.Grest@microsoft.com, baolu.lu@linux.intel.com,
 smostafa@google.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
To: Joonwon Kang <joonwonkang@google.com>
References: <20260424085339.3503582-1-joonwonkang@google.com>
From: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <20260424085339.3503582-1-joonwonkang@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_103857_125752_8D38AE6E 
X-CRM114-Status: GOOD (  23.03  )
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

On 4/24/2026 1:53 AM, Joonwon Kang wrote:
> For SVA, the IOMMU core always allocates PASID from the global PASID
> space. The use of this global PASID space comes from the limitation of
> the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
> from IA32_PASID, which is per-task.
> 
> Due to this nature, SVA with ARM SMMU v3 has been found not working in
> our environment when other modules/devices compete for PASID. The
> environment looks as follows:
> 
> - The device is not a PCIe device.
> - The device is to use SVA.
> - The supported SSID/PASID space is very small for the device; only 1 to
>   3 SSIDs are supported.
> - There is a custom way of transmitting the SSID from the kernel to the
>   device.
> 
> With this setup, when other modules have allocated all the PASIDs that
> our device is expected to use from the global PASID space via APIs like
> iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
> our device fails due to the lack of available PASIDs.
> 
> Since SSID/PASID is supported per-SID in ARM SMMU v3, this commit
> leverages the fact and lifts the use of the global PASID space if
> possible. What it does includes:
> 
> - Introduce a new IOMMU capability IOMMU_CAP_PER_DEV_PASID_SPACE, which
>   represents whether the IOMMU supports an independent PASID space per-
>   device, not shared across devices. ARM SMMU v3 is the case.
> - Open a new API iommu_attach_device_pasid_any() to allocate any
>   available PASID and attach an IOMMU domain to it.
> - Opt out the use of the global PASID space for SVA if the IOMMU has
>   that capability, and use the new API to allocate a PASID in that case.
> 
> Signed-off-by: Joonwon Kang <joonwonkang@google.com>
> ---
> v1: Request comments for this approach, other possible approaches and/or
>   other aspects to consider more. Code is not sanitized and commits are
>   not separated appropriately in this version.
> 
<snip>

This may be a a basic question, but how does this reconcile with the fact
that the process ID space is global? Even with PID namespacing, I understand
that each process in a PID namespace has a "parent" PID in the parent namespace,
unless I'm grossly mistaken.

Also, with the per-device PASID space, different SVA-capable devices
being used by the same process would have different PASIDs referring to the same
process address space, and would break the DSA<->IAA kind of interaction where the
device drivers can communicate the PASID among each other to operate on the same
process address space. Is that a scenario that does not matter to your use case?

Thanks,
Easwar (he/him)



