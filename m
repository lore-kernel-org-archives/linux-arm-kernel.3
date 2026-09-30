Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AECCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr6JqvYiKd4vRaGkCdc7ynSusqyoLMCPVRGC37iHFa8=; b=K2adjNA3oFIIn31gJ0VpFRCjjc
	JIze8eJGDeSwtGt1+FTPwWMj37pMf79d5SUDbZ847c2gilhxDv7NrhLCpJMmSzQpOTiJ7Gk4xFZFH
	A7bO3r0AoM3tKCIpsbodrkD26WdJA+P0S3zubx/135Y/qTqis5s7M0IsIiFwt9lyp1bhyeU0vpDsY
	dzdGdQa51wKJILcLzTnUaIAP8qRYSnTICd5vT0dn+4hdL9vZshOxzu52ZITElsAkASGgP/05FWjrG
	8YBKZOrcBbD/OMR1TtXEUy7W+NFB7obHRzJh5AR2E41upZUQAo3Q7k49tL5yDUbvLCDdv8RBlWnCW
	OBp3i8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuWn-000000069qY-3Zxm;
	Wed, 30 Sep 2026 13:39:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuWj-000000069oh-2vvJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:39:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08061497;
	Wed, 30 Sep 2026 06:39:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1893F86F;
	Wed, 30 Sep 2026 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790775555; bh=WrLZ5gfj597SIIguCgOUtqlPTHgYb9tcuWrI/gHAH10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pcj3sxhuzrhm1E/ig/tQbFU+vGp68EdZ3hS1A4ER37ixvE4v7iH8lKDH1EWxVDw4P
	 q+VI/Tvjrv3VA4weqNAi0Sk4uHAMzZk+rQoW1zI+4kSSTimnPuEZWd4Op4GrayP4c0
	 6U0s8zjk3oI005UNqWKJnYD8xBQpRrTB5+UdNchM=
Date: Wed, 30 Sep 2026 14:39:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v20 6/9] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <ar0Q-F92FaPEiEbc@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-7-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929221623.1342076-7-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_063918_186768_DF87C2A2 
X-CRM114-Status: GOOD (  17.69  )
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

On Tue, Sep 29, 2026 at 11:16:20PM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM maintains the state of all the granules in the system to make
> sure that the host is abiding by the rules. This state can be maintained
> at different granularity, per page (TRACKING_FINE) or per region
> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> all pages in the region must be of the same state, this implies we need to
> have "fine" tracking for DRAM, so that we can delegate individual pages.
> 
> For now we only support a statically carved out memory for tracking
> granules for the "fine" regions. This can be extended in the future to
> allow modifying the tracking granularity and remove the need for a
> static allocation by the firmware.
> 
> Similarly, the firmware may create L0 GPT entries describing the total
> address space. But if we change the "PAS" (Physical Address Space) of a
> granule, then the firmware may need to create L1 tables to track the PAS
> at a finer granularity. Linux therefore checks if the platform firmware
> manages the PAR region. i.e., the firmware is in charge of managing the
> L1 GPTs (creation and the required memory for the GPT tables - via static
> carveouts) without host intervention. Support for dynamic GPT creation by
> the host will be added later.
> 
> If the firmware requires us to manage the tracking or GPT memory,
> deactivate the RMM and reclaim any memory donated at RMM activation.
> 
> Apply the same checks when hotplugged memory is brought online.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

