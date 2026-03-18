Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA72103E167
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wx45oWXVsXCijFw6JpV9byK4G1DkHSDlU0Kw2TwgmiY=; b=ca93LkEtaNs9S4Kum06YH85J4a
	nWLh0uAR1SfipEMjWZEfz3vGiRkMfwXpdxGrbqTDmyoWL9nJCDszsZMHZKWAULyyBODg2AIpAnoV+
	VXtAJzBxeHEO/B5KM+qOZGefBWX1dz3/S5J/lqbcm4g2IGifCyMvdMr3BRYdzHA0NwozSe5zifIU6
	jYOHcfMIsx/+CCpmkuT5gHqmNSALIM1qWYM2FaU4zGxzSpDtLiZYO2X9HO8gv6NyFH7qOfjxhUise
	1pRaqag5a0pQOXSEJNGtTMob+D0wJx6z2+TAYxlFS0rmSX9Bcc1czg21czHLGAW7IKZ170NpIRP42
	XE0vhBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pHv-00000008KMu-3nkv;
	Wed, 18 Mar 2026 11:42:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pHt-00000008KMa-3Bih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:42:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD721E2F;
	Wed, 18 Mar 2026 04:42:01 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA6013F73B;
	Wed, 18 Mar 2026 04:42:05 -0700 (PDT)
Date: Wed, 18 Mar 2026 11:42:00 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/2] KVM: arm64: nv: Expose shadow page tables in
 debugfs
Message-ID: <20260318114200.GA3905508@e124191.cambridge.arm.com>
References: <20260317182638.1592507-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317182638.1592507-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_044209_863564_8ABC64E3 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Mar 17, 2026 at 06:26:36PM +0000, Wei-Lin Chang wrote:
> Hi,
> 
> This is v2 of exposing shadow page tables in debugfs, there are a few
> small improvements, please see below.
> 
> Changes in v2:
>  - move debugfs_nv_dentry also behind CONFIG_PTDUMP_STAGE2_DEBUGFS
>  - use a macro to define the file names of shadow ptdumps, also
>    explicitly spell out the string to get its maximum size
>  - add Reviewed-by tag from Sebastian (thanks!)
>  - Link to v1: https://lore.kernel.org/kvmarm/20260308231829.864983-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (2):
>   KVM: arm64: ptdump: Make KVM ptdump code s2 mmu aware
>   KVM: arm64: nv: Expose shadow page tables in debugfs

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> 
>  arch/arm64/include/asm/kvm_host.h |  9 +++++
>  arch/arm64/include/asm/kvm_mmu.h  |  4 +++
>  arch/arm64/kvm/nested.c           |  6 +++-
>  arch/arm64/kvm/ptdump.c           | 60 ++++++++++++++++++++++---------
>  4 files changed, 62 insertions(+), 17 deletions(-)
> 
> -- 
> 2.43.0
> 

