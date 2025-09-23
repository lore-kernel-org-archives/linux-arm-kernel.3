Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF4CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeaqGM/dnSt7VQMXlKJMzUPAvYn4X0kFJnsfUt3Memw=; b=r18qtMH35nVGoXtH6ghB+yMMKj
	LKUBIPLyxFlZrjbotBqfQygLddZt4dJebXl9fDAMJdD42JoXE14+DmU5g4Hb03Cf5WkFGoOdZlTrZ
	PXhcopK1pvZC9rn9dXUmO4ZH87ahjcwrgVh3p3DbN+FoQB5vm0S+YO1RsVsOyu7tUVLHcGWimCqHs
	9WfddeaawTnf+g5dWjde3A0RB/A/3qb4i0LvveM1ml8ZPfRuwuwtdKJVHhx2SHbHeEr1Ta+zbcdvw
	WsgYwKfEgFXJUfLqvR6ers1bJsfuYd2X8t3ZUXjY+XaIrYzXjCFEQcwlRbryh4n6We2dWiGnofRQn
	4Creifyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yPa-0000000Cojn-1gPL;
	Tue, 23 Sep 2025 08:30:10 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yPX-0000000Coii-45R3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 08:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758616207; x=1790152207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KeaqGM/dnSt7VQMXlKJMzUPAvYn4X0kFJnsfUt3Memw=;
  b=lOfViCDuQ+z/lANjL6N0tATX4dg+folEWPZ4Ayk0KENTSJxcJuK4Welc
   54F/5mHJ5HfRpxlmoK/CEd6I8CyfLHDtRp10uVEnjvxiSFZXKE5zMwGH1
   1aW4YlNe+rROoUR7HoLLhUPlob+ahMutd8TSqbAPSHg3giMtL1FTaZXC2
   HSFJXCaqGSqiyCq3tigGCjYgNeRFMlIoBNynDbGs6f5zkme1+XECwTIBi
   vfnSKWXnN4cPJq8nhMZKVHYW+1oJmpo8bumeER7/JSbf7mrlgVkDxco6o
   weyPlrF68z1A8M9aFcWYQhPFAq8SABijozS8apY7KMra8rik4BF07a2kh
   Q==;
X-CSE-ConnectionGUID: Y+SxHihJTXaZjG3dAprjYQ==
X-CSE-MsgGUID: xfFWRL0GTsqKazJJtxEOcA==
X-IronPort-AV: E=Sophos;i="6.18,263,1751241600"; 
   d="scan'208";a="3553817"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 08:30:04 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:11530]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.48.21:2525] with esmtp (Farcaster)
 id a2aa504d-997f-4357-87ea-aa2904c81b42; Tue, 23 Sep 2025 08:30:04 +0000 (UTC)
X-Farcaster-Flow-ID: a2aa504d-997f-4357-87ea-aa2904c81b42
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 23 Sep 2025 08:30:02 +0000
Received: from c889f3b3a561.amazon.com (10.106.101.44) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 23 Sep 2025 08:30:01 +0000
From: Priscilla Lam <prl@amazon.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <christoffer.dall@arm.com>, <dwmw@amazon.co.uk>, <graf@amazon.com>,
	<gurugubs@amazon.com>, <jgrall@amazon.co.uk>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prl@amazon.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>
Subject: Re: Re: [PATCH] KVM: arm64: Implement KVM_TRANSLATE ioctl for arm64
Date: Tue, 23 Sep 2025 01:29:55 -0700
Message-ID: <20250923082955.66602-1-prl@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: 86frcd1tp4.wl-maz@kernel.org
References: <86frcd1tp4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.106.101.44]
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_013008_062531_47F79143 
X-CRM114-Status: GOOD (  23.53  )
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

Hi Oliver and Marc,

Thanks for the detailed feedback.

> But at the end of the day, what do you need KVM_TRANSLATE for? This
> interface is an absolute turd that is unable to represent the bare
> minimum of the architecture (writable by whom? physical address in
> which translation regime? what about S2 translations?), and is better
> left in the "utter brain fart" category.

Regarding motivation, this patch is intended to give a userspace vmm
the ability to handle non-ISV guest faults. The Arm Arm (DDI 0487L.b,
section B3.13.6) notes that for load/store pair faults, the syndrome
may not provide the specifics of the access that faulted. In those
cases, the vmm must manually decode the instruction to emulate it. The
introduction of KVM_CAP_ARM_NISV_TO_USER
(https://lore.kernel.org/kvm/20191120164236.29359-2-maz@kernel.org/)
seems to have anticipated that flow by allowing exits to userspace on
trapped NISV instructions. What is still missing is a reliable way for
userspace to query VA->IPA translations in order to complete emulation.

> Please do selftests changes in a separate patch.

Ack, will split the kernel changes and selftests into 1/2 and 2/2.

> So arch/arm64/kvm/at.c exists for this exact purpose: walking guest page
> tables. While it was previously constrained to handling NV-enabled VMs,
> Marc's SEA TTW series opens up the stage-1 walker for general use.

Thanks for the reference, I wasn't aware of this. I'll drop the bespoke 
VHE/NVHE paths and use the shared S1 walker in v2.

> "linear_address" is a delightful x86-ism. I'd prefer naming that was
> either architecture-generic -or- an arm64-specific struct that used our
> architectural terms.

I'll switch internal naming to VA/IPA. For uAPI, I'll retain the field
for compatibility and translate internally.

> Thanks to borken hardware, this needs to go through the write_sysreg_hcr()
> accessor.

Ack, will use write_sysreg_hcr().

> KVM supports both FEAT_S1PIE and FEAT_S1POE, so this is not a complete
> MMU context.

Understood. v2 will rely on the shared walker to avoid missing S1PIE/S1POE.

> The AT instruction can generate an exception, which is why __kvm_at()
> exists.
>
> And this is where reusing the existing translation infrastructure is
> really important. The AT instruction *will* fail if the stage-1
> translation tables are unmapped at stage-2. The only option at that
> point is falling back to a software table walker that potentially faults
> in the missing translation tables.

v2 will use __kvm_at() and the fallback software walk.

> What about permissions besides RW?

I'll add support for the additional bit (execute and EL0) in v2.

> Yet another interesting consideration around this entire infrastructure
> is the guest's view of the translation that the VMM will now use. KVM
> uses a pseudo-TLB for the guest's VNCR page and maintains it just like a
> literal TLB.
>
> How would the guest invalidate the translation fetched by the VMM when
> unmapping/remapping the VA? Doesn't the stage-1 PTW need to set the
> Access flag as this amounts to a TLB fill?
> Understanding what it is you're trying to accomplish would be quite
> helpful. I'm concerned this trivializes some of the gory details of
> participating in the guest's virtual memory.

My intent is for this ioctl to be side-effect free with no AF updates 
and guest-visible TLB fills. I’ll send v2 as two patches with the above
changes.

Thanks,
Priscilla

