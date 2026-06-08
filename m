Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACE7CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ7fi7G4wG/VICbBP425q7BvhHSQM4WDDJd2mZZW7Mo=; b=mi6bHwxa1PQaMI+2pRA7extdIv
	3MFiWrNFkr6SEIWEoQeh/46zNWceMmy2AMc7V44fs241N0acXYVqPFOgIQHU0kVyTmcFBjZ5faOLN
	RQKTP04r/PCfhrdfy/6uPFZRUhYrTO8+zOMTtblZr7XzYTkxM+HUi9me89yNRqh56dRHAfy+eZjNH
	vFigvBprDdRXgGQpZzIARTKZvKG0k61a6h7W93LS8FYjpecxSIBWxhDxkB8mUVWAX0TpEbiJne3Da
	Yx84Wubcc+HEkf33qZn0XBAT7EIiqel2CS6zV5B1PnmRDOw6n1HUod7CraCU3NqkpkYbBLC3zBLhE
	rmRsgPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh9L-00000004PRZ-2noq;
	Mon, 08 Jun 2026 21:04:47 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh9J-00000004PR0-2yic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 21:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1780952685; x=1812488685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UZ7fi7G4wG/VICbBP425q7BvhHSQM4WDDJd2mZZW7Mo=;
  b=lzHjH+DN2NnLKJC0OPOA0Lv7d7oazqvq+sYUYhUxuGeCdgBtl8KeDLmm
   j36e0EWQhEE4zf7CELb3RrVhClruDT1PKgVeLHUz122+dS3IfyxnXW0Zh
   Hp5tJRdg2L+SG49DP4aBlYJ0tq1KSnPUohYqXR9W6TmJ/Fr6NlxsNCyZI
   iI1lRIiwPK225itP3Jj8TOXr2/QNWTfga5A9iFNr52aF4kUpsFwAIa1AR
   zHYL1Hzsuqus0h6SBQ3cat/jEo16zCmu6B8VaPcnYZthulgELhZSokRQ0
   EpR7NFHiJ6D7L84bieXgu44SzLSUY8czAy3Bx7W2kiFYTTScMJDna6o5s
   A==;
X-CSE-ConnectionGUID: 5ZKbgY3QT1yv7tc8A9BTLg==
X-CSE-MsgGUID: OUNhnm5qR0ag07ym5ofabg==
X-IronPort-AV: E=Sophos;i="6.24,195,1774310400"; 
   d="scan'208";a="21376921"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 21:04:42 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:7913]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.143:2525] with esmtp (Farcaster)
 id 86900df2-f338-4972-80ae-43ba72e810f2; Mon, 8 Jun 2026 21:04:41 +0000 (UTC)
X-Farcaster-Flow-ID: 86900df2-f338-4972-80ae-43ba72e810f2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 8 Jun 2026 21:04:41 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Mon, 8 Jun 2026
 21:04:41 +0000
From: Congkai Tan <congkai@amazon.com>
To: <oupton@kernel.org>
CC: <blakgeof@amazon.com>, <catalin.marinas@arm.com>, <congkai@amazon.com>,
	<harisokn@amazon.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<mark.rutland@arm.com>, <maz@kernel.org>, <suzuki.poulose@arm.com>,
	<will@kernel.org>, <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Date: Mon, 8 Jun 2026 21:03:59 +0000
Message-ID: <20260608210359.1757125-1-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ah3mObchzwb80_3S@kernel.org>
References: <ah3mObchzwb80_3S@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_140445_864931_9F368E5E 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Jun 01, 2026 at 01:06:17PM -0700, Oliver Upton wrote:
> We can't change the value of PMMIR_EL1 unconditionally since older KVM
> treated this register as RAZ/WI. This also mixes poorly with the default
> PMU garbage that we have since as the value of the register can change
> based on where KVM_ARM_VCPU_INIT gets called...
>
> Considering everything, I'd like to see this wired up where:
>
>  - PMMIR_EL1.SLOTS takes the value of the underlying hardware PMU only
>    if the VMM explicitly selects a particular PMU implementation
>
>  - KVM allows userspace to set PMMIR_EL1.SLOTS=0 for backwards
>    compatibility

Thanks a lot for the review! Makes sense. We'll work on v2, and here is
the high-level design we plan to follow:

  - Introduce a new VM-wide field, e.g. kvm->arch.pmmir_slots.

  - Seed it from the underlying hardware value only when handling
    KVM_ARM_VCPU_PMU_V3_SET_PMU; otherwise it stays 0.

  - access_pmmir() returns whatever is in pmmir_slots.
  
  - set_pmmir() writes pmmir_slots to 0 if the user input is 0;
    otherwise it no-ops or rejects.

This way the guest only sees the underlying hardware value if the VMM
selects a PMU via KVM_ARM_VCPU_PMU_V3_SET_PMU, and userspace can pin
SLOTS = 0 through KVM_SET_ONE_REG for backwards compatibility.

Please let me know if there are any concerns. I'll send v2 once it's
ready.

Thanks,
Congkai

