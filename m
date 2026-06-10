Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F37CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWV3gyw56Ulgx2p+gLwcu93RcsU/hG1SRLvtq0yfuV4=; b=lj7seWq2oOXO0+7mnP4kiRhbzU
	zs22uNgF0skuKSmE1w2T6n4RSdE7RCYH6unI1XUFVZ+JtIUQL3d5fCnvqaegtjtuYIoDsS7niyg1t
	P55pZHpudIpTjWBQ1MOyuG+Ev+qq74il3zmwSdl6qh9ETQ9UIyz0VCvoYY1Z8Zey8SRBNVSf7w23a
	bsTtC1eSpdvqyBhu3JaPh2e+CDn34COCHSmq5tR5XzaiaQCxwNO9QxCc20iuou+WVLH3y4Y8Y3eZe
	or1QS5kT63jP+3OpCW2q5ZSPfUJbDKwnHV97PV+r/iYC+ciuHtHVKhKhlIecBUfSa73Pd2mdpwxOT
	rypQHxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHGV-00000007YR1-3eE2;
	Wed, 10 Jun 2026 11:38:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHGS-00000007YQe-2wBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:38:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7480125E3;
	Wed, 10 Jun 2026 04:38:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0923FD88;
	Wed, 10 Jun 2026 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781091510; bh=IX6LtUMmsf2vlnGeHD/63983rh0Y9HBJ2QJ31uk5kmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXTfeNQqSRNFjUTSHZpgYIIQlFGsLLyXII67TjUaJHzh4VW0XA+pPOcbymtdDCuac
	 1emh1qFB4U3M7OLirkhEwwYRU44hhKygV7pU4bGjbJ741RO//JZBdAV7ktUlxQU8rL
	 4jjw9yOmmm9i/AHV5QjmSCCz8pUbsZJIN28z2B/M=
Date: Wed, 10 Jun 2026 12:38:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, mrigendra.chaubey@gmail.com,
	suzuki.poulose@arm.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, arnd@arndb.de, gshan@redhat.com,
	jic23@kernel.org, dietmar.eggemann@arm.com, sudeep.holla@kernel.org,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] arm64: smp: Fix hot-unplug tearing by forcing
 unregistration
Message-ID: <ailMrGQv1LQ0xmXe@arm.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
 <20260610075202.3597031-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610075202.3597031-2-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_043832_803486_044C4F78 
X-CRM114-Status: GOOD (  13.60  )
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

On Wed, Jun 10, 2026 at 03:52:01PM +0800, Jinjie Ruan wrote:
> Sashiko review pointed out the following issue[1].
> 
> Commit eba4675008a6 ("arm64: arch_register_cpu() variant to check if
> an ACPI handle is now available.") introduced architectural safety
> blocks inside arch_unregister_cpu(). If a hot-unplug operation is
> determined to be a physical hardware removal (where _STA evaluates to
> !ACPI_STA_DEVICE_PRESENT), or if firmware evaluation fails, it aborts
> the unregistration transaction early to protect unreadied arm64
> infrastructure.
> 
> However, returning early from arch_unregister_cpu() causes a catastrophic
> state tearing because the generic ACPI layer (acpi_processor_post_eject())
> unconditionally continues its cleanup flow. This leaves the stale sysfs
> device leaked in the memory, deadlocking any subsequent hot-add attempts
> on the same CPU.
> 
> Fix it by simplifying arch_unregister_cpu() to always proceed with
> the unregistration, as a pr_err_once() warning is sufficient to make
> it more visible for currently not supported physical CPU removal.
> Also remove the redundant NULL check on acpi_handle as it cannot be
> NULL when calling arch_unregister_cpu().
> 
> [1]: https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: James Morse <james.morse@arm.com>
> Cc: stable@vger.kernel.org
> Fixes: eba4675008a6e ("arm64: arch_register_cpu() variant to check if an ACPI handle is now available.")
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

