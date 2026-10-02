Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA5CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bUaJiN8b5b5N6PjWyseBVLdTBXfS3Zcx0eaPO3iqSg=; b=IpANy0L/oXK6GgO415wm8IBhHg
	l/1PtmPTXp4wkDi8OGYiGUP5NxyMreVaJfd/BgdmlEcbSU6zSwe9eZqtzA45qcmmg6qQw4v7+Eo+n
	+ig5vVtqXi7MohvC3VF//qF/ODEb11FO/1OGFWgbOzPpXU1ofX37u729ZrEEskAUCLV/s30kpuOXS
	RtUmS3SjGtFgMHTlevzE6dZJwMAh/Jn18WzyIOk3P590ofMfQHwzdvQUE5ErWGWEJ1k7OpEcVM8IZ
	iEw/bxE5l6a0CKkaB84d9x+a09roYmua5AD/FPvPXlF0OtytcDcBHZa7ZCOuRHnW8esN8CelzzaaD
	Fiiofxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiSI-0000000CK98-0zDB;
	Fri, 02 Oct 2026 18:58:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiSE-0000000CK7o-1BfY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 18:58:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E9192F;
	Fri,  2 Oct 2026 11:57:53 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AF3B3F86F;
	Fri,  2 Oct 2026 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967476; bh=On/bTv98PknQPyRTNxo32jmNRXmxsiXN5JBsXtUEmYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=khZZZ961FD0uI1yPU2c+u4AoDHIw2wOf7yU8YDwCXFB4EDN83IFyYsKHTJ4SpWLBh
	 3tjm/U3+lwX0US8T5shdJxg13YnfoaxibaPIu1mldpLDaAH84ibgtPyG6RBiUKoMSV
	 AOuyxggxZpwWQk18ndXmp00GXmVEzRs6KA8st754=
From: Catalin Marinas <catalin.marinas@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	jonathan.cameron@oss.qualcomm.com,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	rafael@kernel.org
Subject: Re: [PATCH v22 00/10] firmware: arm_rmm: Add RMM v2.0 base RMI support
Date: Fri,  2 Oct 2026 19:49:04 +0100
Message-ID: <179096683487.2356212.5555509708136944708.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002061507.1600269-1-suzuki.poulose@arm.com>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115758_412150_ACA90142 
X-CRM114-Status: GOOD (  14.26  )
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

On Fri, 02 Oct 2026 07:14:56 +0100, Suzuki K Poulose wrote:
> This series adds the generic firmware layer for talking to the Realm
> Management Monitor (RMM), as specified by the RMM v2.0-bet3
> specification[1]. It is the first part of the Arm CCA host support that
> was previously posted as part of the larger KVM series.
> 
> The split allows this RMM support to be used as a base for other work,
> including Aneesh's PCI IDE support with Arm CCA RMM as the TSM,
>  without depending on the KVM Realm support that will follow as separate
>  series. (See more on that below)
> 
> [...]

Applied to arm64 (for-next/fw-rmi), thanks!

Rafael, I took the liberty of merging patch 7 below adding an arch
hibernation hook needed for arm64 (I changed the subject as well to
PM: ...).

For now the RMI is default off. We should only make it default y when we
have a deferred activation gated by kvm rmm option (or PCIe?).

There are a few typo fixes, some reordering of the Kconfig and Makefile
entries to preserve a somewhat alphabetical order. No functional change
though.

[01/10] firmware: arm_rmm: Add SMC definitions for calling the RMM
        https://git.kernel.org/arm64/c/9e201043cbd2
[02/10] firmware: arm_rmm: Check for RMI support at init
        https://git.kernel.org/arm64/c/24657f2ce536
[03/10] firmware: arm_rmm: Configure the RMM with the host's page size
        https://git.kernel.org/arm64/c/a0382431a0fe
[04/10] firmware: arm_rmm: Add support for SRO
        https://git.kernel.org/arm64/c/bc1360cabe27
[05/10] firmware: arm_rmm: Activate the RMM
        https://git.kernel.org/arm64/c/fa193c502990
[06/10] firmware: arm_rmm: Ensure the RMM has GPT entries for memory
        https://git.kernel.org/arm64/c/c20b65a03eff
[07/10] kernel: hibernate: Add an arch hook for preventing hiberation
        https://git.kernel.org/arm64/c/5487bff69b85
[08/10] arm64: Block hibernate and kexec while RMM is active
        https://git.kernel.org/arm64/c/fe4a24613bc2
[09/10] firmware: arm_rmm: Add wrappers for Realm related RMI commands
        https://git.kernel.org/arm64/c/c4a16839abb1
[10/10] firmware: arm_rmm: hotplug: Skip memory added to ZONE_MOVABLE
        https://git.kernel.org/arm64/c/06898e5320b5

