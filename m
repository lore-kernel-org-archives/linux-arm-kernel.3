Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59360C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YojF4QfnKMR3dDmrpuJUH9Oc76V6pfYrEerAmaRhlJo=; b=jtSlOO2k5biwd3idb9PhLjFj9X
	1xDh/1ZRlKTNhH9auyQkja4jjQs4TwDdBkEwnWjWFt2ZNK9plKEL3nQqbd9/AN+uw6cOeuRa1fzaP
	SxA7bOh07uh4kK2pn99gjK8jJFWnMAUP265WrvC1SFgLlbcCcjN1NSIfSN5loIePmDtqxHjswDCW0
	Os8cJYamHe0iFaHSCwtpdYrjxil9HKUREsjLaeKB2yas5HN9tEoutwHAFhcyPF5Azt6I2x1EQEhSW
	toQMHblOLrnKiBuhMZkoFln/gCFwYGVMYCXo2xChJ8OBRyI5X+rWMRrgvWJGTunr2GAQ8De4/pkB3
	k70uSh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdonh-0000000ASFa-2eB5;
	Fri, 31 Jan 2025 11:03:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdomN-0000000ASB9-2Aep
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:01:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C83E497;
	Fri, 31 Jan 2025 03:02:08 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24B813F63F;
	Fri, 31 Jan 2025 03:01:41 -0800 (PST)
Date: Fri, 31 Jan 2025 11:01:38 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	joey.gouly@arm.com, kvmarm@lists.linux.dev, maz@kernel.org,
	suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of
 firmware mitigation
Message-ID: <Z5ytkrfzphlio2Ow@J2N7QTR9R3>
References: <20250128155428.210645-1-mark.rutland@arm.com>
 <Z5vzxWX4AY-JY4TV@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5vzxWX4AY-JY4TV@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_030143_603131_B0797A84 
X-CRM114-Status: GOOD (  23.18  )
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

On Thu, Jan 30, 2025 at 01:48:53PM -0800, Oliver Upton wrote:
> Hi Mark,
> 
> On Tue, Jan 28, 2025 at 03:54:24PM +0000, Mark Rutland wrote:
> > On some CPUs from Arm Ltd, it is possible for unprivileged code to cause
> > a hardware prefetcher to form an address using the contents of a memory
> > location which is accessible by privileged accesses in the active
> > translation regime, potentially leaking the contents of this memory
> > location via a side channel. This has been assigned CVE-2024-7881:
> > 
> >   https://developer.arm.com/Arm%20Security%20Center/Arm%20CPU%20Vulnerability%20CVE-2024-7881
> > 
> > Arm's recommended mitigation is that firmware configures an
> > IMPLEMENTATION DEFINED control bit (CPUACTLR6_EL1[41]) to disable the
> > affected prefetcher, and updates to Trusted Firmware-A are available to
> > do this. For systems which have not yet recevied a firmware update, KPTI
> > can help to mitigate the issue.
> > 
> > These patches enable KPTI for affected parts when the firmware
> > mitigation is not present. The presence of the mitigation is identified
> > by the presence of the SMCCC_ARCH_WORKAROUND_4 SMCCC call, which was
> > deployed with the mitigation. This is documented in the SMCCC 1.6 G BET0
> > specification:
> > 
> >   https://developer.arm.com/documentation/den0028/gbet0/?lang=en
> > 
> > I have tested this on a few configurations of virtual platforms. I'd
> > appreciate any feedback, especially on the KVM changes.
> 
> The KVM changes look reasonable and follow the usual model for this
> crud. It would be nice to report the mitigation state to userspace
> somehow as I would like to have a KVM selftest for all of the hardware
> vulnerabilities.

Lemme go figure that out. Just to check, do you mean exposed through a
KVM mechanism, or under /sys/devices/system/cpu/vulnerabilities/ ? I
assume the latter.

> But anyway,
> 
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks; much appreciated!

Mark.

