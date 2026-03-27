Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ECE10F2869
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kyj4TZoak9T/4GP1EXRWWfIfnxtT/bFOsLQ6q/y1WPA=; b=VT3FTQafyHzaB3+JzQFMSeVcz3
	w08lj4ImI138XrP2HlV5LM3httFyMsJZwVDx02GAoHverSgeQUZ1clPYrFZGwWZbiIXW3UG01STbF
	4vlFm80SfJ+6YvUovAVT90x4g3Br4ceXXM8Yf8r4GKhRwqPYAgBTNE9LsgJYcf3w9psUmy1smFa6l
	rDok2rYf0wM5ToZ5RFDuCSi3LUb/DvIi6ZPH12eijMfd7jqnRs8sGJPv6ba+I+SfHceOJe3P1EaQY
	+QaQCW8/fuWfOUyQAf4m/TWK/sYuKlIF88sXGWMCJyTjL1NoiJw+o8xgPZDDSMf7Lj/UA587tegLO
	9rfWgbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cr0-000000086Rg-1x3Q;
	Fri, 27 Mar 2026 19:28:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cqt-000000086Pa-3uQY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 19:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Kyj4TZoak9T/4GP1EXRWWfIfnxtT/bFOsLQ6q/y1WPA=; b=S+gaYxrhqbXWBQDZWijHaypu0N
	Hx2Qzix0Hf8DVi13kE5Hzs2MwDnEOvZBvILWLnSbkEhUkVOX5s1QjWep8lR0TQ+/ED6h3K0sgBo+S
	xBTxAFriWqSOwnkeVrFJqA1FcgYZ0qd6ehQ8YBLrG061oBjE1uctQGFDB9RDtg0EWF5Drd/9NSkXr
	IwZyY90VCX9Vr8/weQ6q6ijn/yts8b5ZUIhQC2qN1gYSilPTl+OcCPJ42W8mLaownWgKNJQ+HSfTu
	ywdtCejKMZywhfGX8q6RQKNOm83G+nOQdFm0RwAgbH17/ALTVBQCNBPMbJRXS6H4KgK6umguIxuoi
	GmhBmMzQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cqq-0000000B8YV-44mq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB65C43866;
	Fri, 27 Mar 2026 19:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F4DC19423;
	Fri, 27 Mar 2026 19:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774639690;
	bh=6fASlMcZDdVsHCTt1uhCxnsHEkKnDO2hrSP4QRWJYyg=;
	h=From:To:Cc:Subject:Date:From;
	b=rWGVw+YoWUmbbep5eMAywEHm9AzG11V3L7cRxNihEX6U/477YCyIBzxc+4By0uX7U
	 PB6hRB0rTW+FCp29KyA6nGvWjNIv0wub463udeoN+U2Aak6hso+DQCc5aXbKOyBHlx
	 M7bhKjGx0bcLWR9os1bcOaELHKLfl+4RxuTysVrnOHu2PbeXwrR7OQM6BUbxH9HCAN
	 13SPKcWRA36CqchBmCot4fAosYofQCtlo+mfoFg8GhTKUJJx+yTWfsP5ktSlD4Bz5o
	 NnXTM5zA2BMHvpYHyrVfBmqItsQi1o7yWlwrmxbEhYa41/MRiIFn3luuJVHIlJBLSR
	 hiGmQNnXC9+iQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/2] KVM: arm64: Tentative fixes for page-table lifetime issues
Date: Fri, 27 Mar 2026 19:27:55 +0000
Message-ID: <20260327192758.21739-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_192813_283539_E181A221 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Hi all,

Sashiko highlighted a couple of potential page-table lifetime issues
in the upstream code while it was reviewing the pKVM protected memory
series. They make sense to me so I've had a crack at fixing them and
writing a better description of the problem in the commit message.

For the second issue, I've tested it by forcing the notifier
registration to fail and then watching the SecPageTables line in
/proc/meminfo after attempting to create VMs.

Cheers,

Will

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>

--->8

Will Deacon (2):
  KVM: arm64: Don't leave mmu->pgt dangling on kvm_init_stage2_mmu()
    error
  KVM: arm64: Destroy stage-2 page-table in kvm_arch_destroy_vm()

 arch/arm64/kvm/arm.c | 1 +
 arch/arm64/kvm/mmu.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.53.0.1018.g2bb0e51243-goog


