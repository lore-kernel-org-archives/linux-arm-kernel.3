Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAFAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UW2pOwkbH9qywFjpGyXOZOZ9pND4BWky6zorOt3kqK4=; b=mTSptCrPP4c5IwnUIxpQuVn9uG
	CFhfVGgW8oWhDda2QAbk46YL34fSjK1hwXQAXC4yJj09Z4PzrNJitGeK0CA627xIOUiMiRac4KDmD
	eBwxGYW0zP7Dv1TyVST54jQfhLHAXE24QewnxRItACHgTIxq10rWC0aW+vXLVysP4pdDsVi5zLpbj
	4dvdfJdg6IWsZcK5mLuq6ArzSWj0NaG8flRhqsw+FUgq2Z5Z7ePWaAAMHp2jBAH5FIiA+mfLavCFL
	QLMigmsKWway8pzsikSQ1bZ4cyonv6+wt7B2l/afH/wX41gS9qWswKHFC5bccxCajid9VfxdrjlQc
	Iy4qmGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKOv-000000051qm-1Kc1;
	Thu, 02 Jul 2026 16:36:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKOt-000000051qM-09ha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:36:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4384359D;
	Thu,  2 Jul 2026 09:36:25 -0700 (PDT)
Received: from e140010.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22C503F673;
	Thu,  2 Jul 2026 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783010190; bh=78NieMts7dNfZ0Fpn7sdTLpybzQQCzx3zTLO2Xi93mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsG4M3zRo/pRDPVrznxhOeGH7mnfay08nXoqAV9EAACSLkAt/mwAdMCg/XxSWuyKO
	 Mvwkp4z0ddTz9gfGJ9Fx2/4Q3hbumtjlKl0epHHgpJ8Mju/rbIFQrxrt32nRVuun/P
	 FWRkY9Z1PxE/DYSLdZ3rJNyzxeTBrXK2TF4YUKTg=
Date: Thu, 2 Jul 2026 17:36:24 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
Subject: Re: [PATCH v5 0/5] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Message-ID: <akaTiGMBM2Ega_Sm@e140010.arm.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com_quarantine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612162354.73378-1-jackabt.amazon@gmail.com_quarantine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_093631_138732_4EC4FD02 
X-CRM114-Status: GOOD (  11.54  )
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

Hi,

On Fri, Jun 12, 2026 at 05:23:48PM +0100, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> Hi,
> 
> This series adds arm64 support for KVM_PRE_FAULT_MEMORY, which was added
> for x86 in [1]. The ioctl allows userspace to populate stage-2 mappings
> before running a vCPU, reducing the number of stage-2 faults taken in
> the run path. This is useful for post-copy migration, where stage-2
> fault latency shows up directly in memory-intensive workloads.
>
> ..
> 
> base-commit: 98f826f3c500fda08d51fca434b7aefa6a2f7076

I want to review and test the series, but I cannot seem to find the base
commit in the master branch:

$ git show --oneline
87320be9f0d2 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'net-7.2-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net

$ git show 98f826f3c500fda08d51fca434b7aefa6a2
fatal: ambiguous argument '98f826f3c500fda08d51fca434b7aefa6a2': unknown revision or path not in the working tree.

Thanks,
Alex

