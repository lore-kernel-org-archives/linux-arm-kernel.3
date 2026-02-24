Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE62E9B24B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR70ky397ZCdtIiwYppG76bGV1m8t1k87LPHY2WPml4=; b=Gcjg3a5dbsF+b81dRZhQTcqAP3
	FIbMvDDMV847C279+NcCdi/u4bhdcdbs/WK4g31lVbPcQr4pCCgsdZPSY/i1T3s59ZpEMjg12PLcG
	UMZovtC6ATpz5NnX188uv4O6B1s96WrPeH/ZCWzlNSIZAOn4Lb9OxsyMEBRC2Ziiyo4cAr8DX8cf5
	1oOuMjVDqc0ScY8qEYodenzmfxm5Q0UpIg5/pZS2BZGl/RlCVQE+Uo7WhzdoAr7jV+3BbsbvI04BI
	VhMsO5wNImXYfLZvxi3Iz4bcDtm5KPfCxUr23NCVI7/mPsV4vZumR0nyLdAZcn4elAMBxtFYfleuR
	4pnpyH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupKm-00000001p2j-1Cvs;
	Tue, 24 Feb 2026 10:08:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupKj-00000001p2H-0avS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:08:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F776339;
	Tue, 24 Feb 2026 02:07:53 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 628B03F62B;
	Tue, 24 Feb 2026 02:07:58 -0800 (PST)
Message-ID: <10f10659-448c-404e-87cd-0c110f895b11@arm.com>
Date: Tue, 24 Feb 2026 10:07:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Stop claiming entire iomem region
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, ilkka@os.amperecomputing.com,
 James Morse <james.morse@arm.com>
References: <b6275655818f5af7e5fb07a9e18d1451b08b7e05.1771522073.git.robin.murphy@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <b6275655818f5af7e5fb07a9e18d1451b08b7e05.1771522073.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_020801_241189_E13BB85C 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Hi Robin,

On 2/19/26 17:27, Robin Murphy wrote:
> So far, the PMU has been the only thing of interest in the vast mass
> of CMN registers, so we've gotten away with simply claiming the entire
> iomem region. However, now that we can support other features like MPAM
> controllers for the system caches, the PMU driver needs to stop being
> selfish and learn to share. Similarly to arm-ni, requesting just the
> DTC node(s) should suffice for staking our exclusive claim to the PMU>
features, as requesting hundreds of tiny regions for all the individual
> pmu_event_sel registers is definitely not worth the considerable bother.
> 
> As a consequence, we can also streamline the annoying CMN-600 special
> cases even more. The ACPI binding has in fact always specified a strict
> order for all resources, so we can reasonably drop the ancient pretence
> of swapping base and cfg, which IIRC was more just a moment of doubt on
> my part than anything else.
> 
> Cc: James Morse <james.morse@arm.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Without this patch applied and with mpam enabled cmn fails to probe:
dmesg | grep cmn
[   17.409588] arm-cmn ARMHC700:00: error -EBUSY: can't request region
for resource [mem 0x140000000-0x17fffffff]
[   17.409601] arm-cmn ARMHC700:00: probe with driver arm-cmn failed
with error -16

With the patch I don't see any cmn errors and it probes.

$ tree -L 1 /sys/devices/platform/ARMHC700\:00/
/sys/devices/platform/ARMHC700:00/
├── arm_cmn_0
├── driver -> ../../../bus/platform/drivers/arm-cmn
├── driver_override
├── firmware_node -> ../../LNXSYSTM:00/LNXSYBUS:00/ARMHC700:00
├── modalias
├── power
├── subsystem -> ../../../bus/platform
└── uevent

Tested-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


