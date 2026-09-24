Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88898C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E24KocCs4exzyUY4TekKcvjVXmknh9uB8Op0Sge/fXc=; b=fFqtLbDvWsF2tcaE0t9H54OUkN
	m9G+eSp2c8Nnb884TfrVUlKrhYnhhNndwYbeiFIFitvHx0Bpx4m4vWYIXyTB8PolDFUu0j1s1/afC
	dp8pLLbpPutyXGalQl1G18eU3wIjF5wHXcXART8FDIMm43IXfhLVEayvnxupaNtvTnaXMSjwScxd/
	f2ileUZjM9tjUkuCVbDeiQlPjUBKKt2lD5bLYrTNjsfPn8RW5Qs5s0kv7fylYE/7sCU01Wnd2l6d5
	amI6yQHbVWy15cNxZcJeHE9D7yRsJiCn/0JMmNxwAEUy8T3lqyPEJZyp/o4nYyl5bDYn8iM+OBbV1
	nWrephSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g67-0000000AdK9-3ygN;
	Thu, 24 Sep 2026 09:50:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g65-0000000AdIn-1YgT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:50:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9011516;
	Thu, 24 Sep 2026 02:50:26 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDA4B3F86F;
	Thu, 24 Sep 2026 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790243430; bh=mi5Wn3XblNBZBdzwFD0WPka+R8QrTCI4hMJ2QLpSJKc=;
	h=From:To:Cc:Subject:Date:From;
	b=OrtdVcaA0ELnCObfDLlNBy3QZD8DKR+WXofPdq4ZtXOxCsx9815P5JHazuM5gerAK
	 GLHDdNOBALmRZd0SmIxEdxxNKzAahbqhsCHopWavBXEwlqZAFQnQbO9Vr0zPVPyCig
	 xbigpkydr2nnNx8nht1izSUp0kbFW/1qpLr8PqxA=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v4 0/2] KVM: arm64: ptdump: Shadow ptdump fixes
Date: Thu, 24 Sep 2026 10:49:49 +0100
Message-ID: <20260924094951.727352-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_025033_455819_86A65EF0 
X-CRM114-Status: GOOD (  12.92  )
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

This is v4 of fixing the sleep-in-atomic problem of the shadow ptdump.
This version relaxes a few write_lock to read_lock, and collected tags.
Please see the details below.

* Changes from v3 [1]:

  - Take read_lock instead of write_lock when getting pgt metadata.
    (Vincent)

  - Collected Tested-bys and Reviewed-by from Vincent and Itaru.
    (Thanks!)

Below is mostly the same content from the v3 cover letter:

The approach taken now is simply creating a file for each nested mmu.

The ptdump files are created alongside the nested mmus in
kvm_vcpu_init_nested(), in a sleepable context, and removed when the VM
is destroyed (kvm_destroy_vm_debugfs(), before the nested mmus are freed
in kvm_destroy_nested()). This allows us to store the kvm_s2_mmu pointers
in the ptdump code, after Marc's nested mmu lifecycle fixes [2].

For the shadow ptdump, for valid nested mmus the first line will show
the nested context's VTTBR and VTCR values, and whether s2 is enabled or
not. The ptdump then follows.

The first patch fixes mmu->pgt accesses after the VM MMU teardown in
ptdump.c, the second patch switches from per nested context ptdumps to
per nested mmu ptdumps.

Tested with CONFIG_PROVE_LOCKING, CONFIG_DEBUG_ATOMIC_SLEEP, and
CONFIG_KASAN.

Series based on kvmarm/fixes.

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260916230337.4162485-1-weilin.chang@arm.com/
[2]: https://lore.kernel.org/kvmarm/20260911162203.1919330-1-maz@kernel.org/

Wei-Lin Chang (2):
  KVM: arm64: ptdump: Check the page tables aren't freed when accessing
  KVM: arm64: ptdump: Fix shadow ptdump sleep-in-atomic-context problem

 arch/arm64/include/asm/kvm_host.h |  4 --
 arch/arm64/include/asm/kvm_mmu.h  |  6 +--
 arch/arm64/kvm/nested.c           |  9 ++--
 arch/arm64/kvm/ptdump.c           | 75 ++++++++++++++++++++-----------
 4 files changed, 54 insertions(+), 40 deletions(-)

-- 
2.43.0


