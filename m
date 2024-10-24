Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A436CDDE69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qJR+LlZqEjXQUEsEVlCBbw1OKooGVUi95ip7b5HqgHg=; b=jdwHr9e9ubAGZB31qQ8h/o3hLN
	p5JQwplkr+M+lRNFmZ+Ugg/E/aGSAevd9kHHQTXa4+a6oQvBmz7TT0VCcsujJMilYyMuSpR/0s9RA
	LObLCoM4IgR0N2kobSi7bNrVVbzyrMJC/NPRjopeLLa0ZhnSGZKW2kNXxJyyfCL7HgkKfRvVP5hxn
	br2z7mtKSqPfEQyqy8eJaN7ywo7cuQY9kuymhOdWoaImmmNtKBOTs1TIXrDt6xyWfV/9CCWWb41hI
	+B85CuEBnGOqr6MlusIEmiPfSRsuv5R8BpIvUfcJCKW5fBCSnZsgF8J21mMC0ialherhLgOyUirWw
	7UXddGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uaa-0000000HZfo-0t3a;
	Thu, 24 Oct 2024 09:57:08 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uKg-0000000HVpr-1JQv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:40:46 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XZ14R4V3Cz6LDBr;
	Thu, 24 Oct 2024 17:35:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 46297140B2F;
	Thu, 24 Oct 2024 17:40:33 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 11:40:26 +0200
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 0/3] KVM: arm64: Errata management for VM Live migration
Date: Thu, 24 Oct 2024 10:40:09 +0100
Message-ID: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_024042_698581_B324FD16 
X-CRM114-Status: GOOD (  15.46  )
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

This is another attempt on this based on the feedback received
for RFC v1. Thanks for all the discussions and suggestions.

Changes from RFC v1[0]:
 -Introduced hypercalls to retrieve target CPUs info from user space VMM.
  see patch #1 for details.
 -Patch #2 uses the hypercall to retrieve the target CPU info if any.
 -Use the target CPUs MIDR/REVIDR in errata enablement. See patch #3.

Sanity tested on a HiSilicon ARM64 platform using a hacked Qemu that can
handle the above-mentioned hypercalls.

Please take a look and let me know if this is in the right direction or
not.

Also TBD:
1. Do we need some way of notifying the userspace VMM in case the Guest
   fails to update target CPUs?
2. Usage of synthetic MIDR mentioned in RFC v1 discussion. How do we
   envision the synthetic MIDR to be used/supported?
   1. VMM writes synthetic MIDR to KVM(SET_ONE_REG)
   2. Uses Guest hypercall to update the target CPUs info.

   If this is the case what happens if an old Guest (without hypercall
   support) is used?  VMM will abort the Guest if no hypercall is 
   received but a synthetic MIDR is set?

Thanks,
Shameer

[0]https://lore.kernel.org/kvmarm/20241011075053.80540-1-shameerali.kolothum.thodi@huawei.com/

Background from v1:

On ARM64 platforms most of the errata workarounds are based on CPU
MIDR/REVIDR values and a number of these workarounds need to be
implemented by the Guest kernel as well. This creates a problem when
Guest needs to be migrated to a platform that differs in these
MIDR/REVIDR values even if the VMM can come up with a common minimum
feature list for the Guest using the recently introduced "Writable
ID registers" support.

(This is roughly based on a discussion I had with Marc and Oliver
at KVM forum. Marc outlined his idea for a solution and this is an
attempt to implement it. Thanks to both and I take all the blame
if this is nowhere near what is intended/required)

Shameer Kolothum (3):
  KVM: arm64: Add hypercall support for retrieving migration targets
  KVM: arm64: Use hypercall to retrieve any migration targets
  KVM: arm64: Enable errata based on migration target CPUs

 Documentation/virt/kvm/arm/hypercalls.rst | 77 +++++++++++++++++++++++
 arch/arm64/include/asm/cpufeature.h       |  7 +++
 arch/arm64/include/asm/paravirt.h         |  3 +
 arch/arm64/kernel/cpu_errata.c            | 49 ++++++++++++---
 arch/arm64/kernel/cpufeature.c            |  3 +
 arch/arm64/kernel/paravirt.c              | 48 ++++++++++++++
 include/linux/arm-smccc.h                 | 13 ++++
 7 files changed, 190 insertions(+), 10 deletions(-)

-- 
2.45.2


