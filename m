Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CD9CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 20:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LESoFZ3sjnNgjQODSouywqTG6UHJOI9DT0ddkuNcF5g=; b=3pwLZuVKBLCh90B1Pd1kUSBXDV
	OnRcXoOA5nQESlAr7ZpP7JXN4/bf3LmqadJzhztnXdtRq06T3zSRCssOcjvYX+M16SekPJ0LzGzOr
	Ex3QdTHh9lu+iMtVGYByiJHdm6mXLUGg+RuxZhG8tQT/yH9yLAV/0nfr9Y+jkI/+rsUpf+59xiwcc
	yENBor4vH3fNIQpRfG4NCH1f8AHc9+wKgVwNro6LdbsUWCGBiLG5VFEr0NWuVNSQwoqIWJONeWihe
	3ScWt3rsGcVeUdviTY9/ph/zIUX+81p+nG1jDyFiOCMQZU9mWfdfkOQfTuJV1Set1NJ0gICV58hd7
	Ph2LIYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX3VL-00000006N8S-1BZ6;
	Tue, 09 Jun 2026 20:56:59 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX3VI-00000006N7Z-384q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 20:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1781038616; x=1812574616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LESoFZ3sjnNgjQODSouywqTG6UHJOI9DT0ddkuNcF5g=;
  b=TftPkCLa41cX14rqjjNPcKSwFNTHvuzmcADB9fD6e4TfERsSSydFNCmT
   6HoV3IZaDa2Txxs2iJ7Bd09dsol1/9q/+4yBPngNia9YEfOumSVB3bbhT
   g6qOIj8trY+YajK9X6tq/0jcTZr6rdPrZ1XE8Dts8GCPK6lc+mTrW69p0
   6ma1lxszexskuAi2lxZ2R5LqbkIskq/X3+zq6ONjYpFsn4sjroR6JmmYD
   2s4hIttm7RX1F2o/sA4JRL7yUEddIKys5QdXLB4373/BDVUF+H12kZH0y
   x84xDluEOV+yhxaYci0r3qkGrGac0m8CNTx6pFRgCyEjuRTld6KfbUHvB
   w==;
X-CSE-ConnectionGUID: 7m59Ayi0ROC+I+wdQ0n6uA==
X-CSE-MsgGUID: W4y/ImxzQyCm1T/AImIcGQ==
X-IronPort-AV: E=Sophos;i="6.24,196,1774310400"; 
   d="scan'208";a="21208045"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:56:52 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:18031]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.253:2525] with esmtp (Farcaster)
 id 03f7cd46-cc75-49bf-99db-d82e40443859; Tue, 9 Jun 2026 20:56:52 +0000 (UTC)
X-Farcaster-Flow-ID: 03f7cd46-cc75-49bf-99db-d82e40443859
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 9 Jun 2026 20:56:52 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Tue, 9 Jun 2026
 20:56:51 +0000
From: Congkai Tan <congkai@amazon.com>
To: <oupton@kernel.org>
CC: <blakgeof@amazon.com>, <catalin.marinas@arm.com>, <congkai@amazon.com>,
	<harisokn@amazon.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<mark.rutland@arm.com>, <maz@kernel.org>, <suzuki.poulose@arm.com>,
	<will@kernel.org>, <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Date: Tue, 9 Jun 2026 20:56:21 +0000
Message-ID: <20260609205621.2327622-1-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aieclTmL1op0AYfS@kernel.org>
References: <aieclTmL1op0AYfS@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_135656_853866_BCCB4FEF 
X-CRM114-Status: GOOD (  16.43  )
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

On Mon, Jun 08, 2026 at 09:54:45PM -0700, Oliver Upton wrote:
> >   - set_pmmir() writes pmmir_slots to 0 if the user input is 0;
> >     otherwise it no-ops or rejects.
>
> Reject is always better heh :)

For sure. Just to see what happens when migrating a guest onto a PMU
with different SLOTS - after pmmir_slots is set to the new value, the VMM
tries to restore the original non-zero SLOTS via SET_ONE_REG and gets the
error. I think it's a good design to force VMMs to be aware of SLOTS
changes?

> So I was previously under the impression that we already expose PMMIR_EL1
> to userspace but we actually don't. Grr.
>
> The UAPI around PMUv3 is crappy enough that we should just add a new
> vCPU feature flag. When that flag is set:
>
>  - KVM will not create a 'default' PMU, userspace must select a PMU
>    implementation to init the vCPU
>
>  - PMMIR_EL1 becomes a user-visible register with the behavior that you
>    outline above
>
>  - No PMCEID masking for STALL_SLOT* events
>
> There's a couple larger PMU features underway (e.g. Colton's partitioned
> PMU, Akihiko's fixed counters PMU) that we can also condition on the new
> feature flag.

It makes sense to guard everything behind a flag. Just to confirm my
understanding, by "a new vCPU feature flag" are you referring to
extending the features set through KVM_ARM_VCPU_INIT? If so,
since the flag may guard more PMU features later, do you have a preferred
name in mind that best reflects its planned usage?

For v2 I'll work on 3 patches:

  - Patch 1 adds the flag, skips the default PMU selection behind it, and
    checks for/rejects absent PMU

  - Patch 2 implements the new PMMIR_EL1 behavior

  - Patch 3 implements the new PMCEID1 behavior

Thanks,
Congkai

