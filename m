Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AE1C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch+pO3ZHJ7ZMD+bK3haiwVhBtsRIVKh2HD6GA9YCj9k=; b=3926iEUzjEbYd6fwye8oxB48P5
	02W4h2ThxwxeJ/l1zgdTS0tGZDok4eOzfK8+bgGVXHqaiSyWybmn1F3wwiYZ74W0z2hHL17bGnF/D
	G8iIaOkVaoN+ToQ48L+Z5QoftZtlld1z/CorocV8Y5yB8r5VL/+5GG8z0gJDz9cslLDimQhWeDHlP
	FN4Jm+cFbhm0YDdMr/ZkYRyi4oNY0O0+YkMBUZVlKfpH+Xh13u+SgpV2VXwK4SfqtN3o/ENReyWr5
	ho899F6nZcRudmSCUzvNcjgZo9mA7iNKkZGFsZAuExCHHU2HkWQ/9zyhaJRrA7hjrWug0IDK4w70k
	8jeJX0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZ8W-00000004CbA-1yxu;
	Tue, 15 Jul 2025 06:27:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZ64-00000004CMw-3pqn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 06:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 101D5A50053;
	Tue, 15 Jul 2025 06:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1BEC4CEE3;
	Tue, 15 Jul 2025 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752560699;
	bh=abspjSvivLNZ7JqRTXenpI1qgQVpPqZ6Q7QkayAhcco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdOWnfdEMSp1mulN712vPGlM+ixIAfeBjfH7nEE75tvzQLUd49ObJzA6li1btIGyB
	 xKwqrwjkZF6lez18opXcKp3anIO/r4cJXkEJMWwL81DWwmuPJM/uIfBStNk/jLYVIb
	 qNwtJPR8KpIX8kHMpJ1huWEmkhLR0YzCdkzojx+eXZ6zvfIfiAEmsWSMoWLP9M+Wn+
	 3QZAvmqSv6KAaA8wXcmyDp+ugaW4A1QxFg/9RoeSwR9jtRnrpBiGf32BtT8LuI2UBn
	 A+qnmzZj4/N2ueN0bpQbGafSON56WT0PvGZwY43/aDTzUxOn6hQal0az40GHJ1mWgQ
	 t5nZj132Rl6XQ==
Date: Tue, 15 Jul 2025 06:24:58 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	wei.liu@kernel.org, mhklinux@outlook.com, tglx@linutronix.de,
	bhelgaas@google.com, romank@linux.microsoft.com, kys@microsoft.com,
	haiyangz@microsoft.com, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	jinankjain@linux.microsoft.com, skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com, x86@kernel.org
Subject: Re: [PATCH v3 0/3] Nested virtualization fixes for root partition
Message-ID: <aHX0OrqPItroxWaL@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <1752261532-7225-1-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1752261532-7225-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_232501_104633_10F99593 
X-CRM114-Status: GOOD (  15.80  )
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

On Fri, Jul 11, 2025 at 12:18:49PM -0700, Nuno Das Neves wrote:
> Fixes for running as nested root partition on the Microsoft Hypervisor.
> 
> The first patch changes vmbus to make hypercalls to the L0 hypervisor
> instead of the L1. This is needed because L0 hypervisor, not the L1, is
> the one hosting the Windows root partition with the VMM that provides
> vmbus.
> 
> The 2nd and 3rd patches fix interrupt unmasking on nested. In this
> scenario, the L1 (nested) hypervisor does the interrupt mapping to root
> partition cores. The vectors just need to be mapped with
> MAP_DEVICE_INTERRUPT instead of affinitized with RETARGET_INTERRUPT.
> 
> Changes in v3:
> - Remove 3 patches (#1,#3,#4 from v2) which were merged already (Wei Liu)
> - Fix bug in #1 introduced in v2 (Michael Kelley)
> - Improve commit message in #2 (Michael Kelley)
> - Document return value of hv_map_msi_interrupt() in #2 (Michael Kelley)
> 
> Changes in v2:
> - Reword commit messages for clarity (Michael Kelley, Bjorn Helgaas)
> - Open-code nested hypercalls to reduce unnecessary code (Michael Kelley)
> - Add patch (#3) to fix cpu_online_mask issue (Thomas Gleixner)
> - Add patch (#4) to fix error return values (Michael Kelley)
> - Remove several redundant error messages and checks (Michael Kelley)
> 
> Nuno Das Neves (1):
>   Drivers: hv: Use nested hypercall for post message and signal event
> 
> Stanislav Kinsburskii (2):
>   x86/hyperv: Expose hv_map_msi_interrupt()
>   PCI: hv: Use the correct hypercall for unmasking interrupts on nested
> 

Applied. Thanks.

