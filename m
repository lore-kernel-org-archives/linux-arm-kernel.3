Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F671C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63bm5QlbWbVAPDVqevehzHykHR7elZXRHg2xLSVhba0=; b=Fkd6BzqNxSts0bVCBJN8FGHiWY
	L1nbhNN7lQqkS+zqcwjcovK1uTL0U3ebLJGSquKuaMbUzUjBfS3ODdarHykp3hd9B80Lyn/7Fkmjb
	QOEKZYrdfaPwf0qx+nsZBmEARoGrMI7kD8P/ZuOep4OWhELjrQCflpS4PS0OFHfQ/X7vWxH2FclXb
	yGBu2/G8uFLFTtUIET0OLasB19QkU7QaPef1cA2EJt6jgKGtXih3iLNX9zNQLaKlzaRbeo0BxW1oH
	y0ZDPYvJDNXPUKaaOj0wka2xa3Sk7VUUg+pKMdY6M2J4Mydg8NYguurNvTHzOxUEqOH12MHQoZ7TI
	jVrGRJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVvp-0000000DBXh-1LFG;
	Mon, 24 Feb 2025 10:43:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVuK-0000000DBFR-3HWf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:41:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07D9D1FCD;
	Mon, 24 Feb 2025 02:42:07 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB8713F673;
	Mon, 24 Feb 2025 02:41:49 -0800 (PST)
Date: Mon, 24 Feb 2025 10:41:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v20 10/11] KVM: arm64: nvhe: Disable branch generation in
 nVHE guests
Message-ID: <20250224104147.GD8144@e132581.arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-10-4e9922fc2e8e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-arm-brbe-v19-v20-10-4e9922fc2e8e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_024152_886761_7F71A78C 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, Feb 18, 2025 at 02:40:05PM -0600, Rob Herring (Arm) wrote:
> 
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> While BRBE can record branches within guests, the host recording
> branches in guests is not supported by perf (though events are).
> Support for BRBE in guests will supported by providing direct access
> to BRBE within the guests. That is how x86 LBR works for guests.
> Therefore, BRBE needs to be disabled on guest entry and restored on
> exit.
> 
> For nVHE, this requires explicit handling for guests. Before
> entering a guest, save the BRBE state and disable the it. When
> returning to the host, restore the state.
> 
> For VHE, it is not necessary. We initialize
> BRBCR_EL1.{E1BRE,E0BRE}=={0,0} at boot time, and HCR_EL2.TGE==1 while
> running in the host. We configure BRBCR_EL2.{E2BRE,E0HBRE} to enable
> branch recording in the host. When entering the guest, we set
> HCR_EL2.TGE==0 which means BRBCR_EL1 is used instead of BRBCR_EL2.
> Consequently for VHE, BRBE recording is disabled at EL1 and EL0 when
> running a guest.
> 
> Should recording in guests (by the host) ever be desired, the perf ABI
> will need to be extended to distinguish guest addresses (struct
> perf_branch_entry.priv) for starters. BRBE records would also need to be
> invalidated on guest entry/exit as guest/host EL1 and EL0 records can't
> be distinguished.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

