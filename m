Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6A4C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7EDY00WFf/8gOXkbgMLtyV480qFg0Dd2/qI7SdTnM5A=; b=OBlxNGy96njGBpnfIK5VR0J5Ax
	Mf1Tj9XMTkdIUpnwg1y716vEis7NdVpoFtJG6jMa/3XG/6vsDYDb7TcJBeh+XjDQTt2TFOoqypL30
	2M+PT2QvqMQBvmSy8hL4gKVySMq/zLbvFWKRPXTfkEe1iDWj9XCKGJAtQ9B4kExPW5JKDoRDRjjsK
	G6eiQLhvals90Z7yk5fboTCpVg6+UaIh6/KaR1/1NeQbwD98B2Fo+FpKS2mJiADCk0cPW4b2LUydY
	A8rZzBbeLVbn4a/zAjOXz526UxQwRTX0qI1BSw1t4TL/1JEbIDAz98zw8p0aQpAESoo7D+CXaa4rS
	XOp/BN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ygY-0000000ADj2-44P6;
	Wed, 16 Sep 2026 23:05:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ygU-0000000ADhZ-2fNu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:05:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 654061476;
	Wed, 16 Sep 2026 16:04:51 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02F613F7B4;
	Wed, 16 Sep 2026 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789599895; bh=wkNpSDNZfRTYlKzv+KDudj0npKw1I5FMQNwmEMqYQ0k=;
	h=From:To:Cc:Subject:Date:From;
	b=OKTwVo/AQtdupYUE7FDpC+F6hT5YJ8C57ltsT+Id1mdnhxzjsPryo26VDsUaJeZ/8
	 tnZokvPCEo8M4rz3l1d0MnAe+p1lRLygmQvfQ1KNs6pWQdalxTzGGt18yIS/0UWIqU
	 bhIEYllbYnrKDdwak8rnkifXwsENxkBdO6ElIi0g=
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
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 0/2] KVM: arm64: ptdump: Shadow ptdump fixes
Date: Thu, 17 Sep 2026 00:03:35 +0100
Message-ID: <20260916230337.4162485-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_160458_796545_17D801B7 
X-CRM114-Status: GOOD (  12.48  )
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

This is v3 of fixing the sleep-in-atomic problem of the shadow ptdump.
The approach taken this time is simply creating a file for each nested
mmu.

The ptdump files are created alongside the nested mmus in
kvm_vcpu_init_nested(), in a sleepable context, and removed when the VM
is destroyed (kvm_destroy_vm_debugfs(), before the nested mmus are freed
in kvm_destroy_nested()). This allows us to store the kvm_s2_mmu pointers
in the ptdump code, after Marc's nested mmu lifecycle fixes [1].

For the shadow ptdump, for valid nested mmus the first line will show
the nested context's VTTBR and VTCR values, and whether s2 is enabled or
not. The ptdump then follows.

The first patch fixes mmu->pgt accesses after the VM MMU teardown in
ptdump.c, the second patch switches from per nested context ptdumps to
per nested mmu ptdumps.

Tested with CONFIG_PROVE_LOCKING, CONFIG_DEBUG_ATOMIC_SLEEP, and
CONFIG_KASAN.

Series based on kvmarm/fixes.

* Changes from v2 [2]:

  - Changed from creating a file that contains all nested mmus to
    creating one file for each nested mmu.

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260911162203.1919330-1-maz@kernel.org/
[2]: https://lore.kernel.org/kvmarm/20260630121005.1130996-1-weilin.chang@arm.com/

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


