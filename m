Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2A3F53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gXDh9ieZ9Fz7jrfE+D6W88KlicM3e2Oc7VEZ2MhZTcE=; b=t9AhUF0lyyCWI41e7tlswS5dvO
	1HW4t+3B7fJ8u9CmQyxhb1sWJ/nWIH8nebQPYpUoTRQyN5jtdQJM6lUXDTU24SUkdXz0yHaOadVeI
	zEHU+hinuovbcITqzqKsh1Le2iSJISal/vsyJyRapZYGcgL3bkogzeiL8zvYb92cmLqN43RpCSzV2
	rZCuIs6pofIhZbtOfPvSgYZck0E5gOJM+rhKVFY2Zynr9op0fXkmX4cvDTSfswpP1+VDvYH2rW4Qc
	1ZYxuw6tMNdimYqVkXiI9yqOnvIRezYUP9eCZ8O2swIasArjxyV1SnDccsGi003bU8Yxj20DnAH1f
	0xZFsUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9o-00000004ctD-3hce;
	Mon, 16 Mar 2026 17:55:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9k-00000004cnw-3tZO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gXDh9ieZ9Fz7jrfE+D6W88KlicM3e2Oc7VEZ2MhZTcE=; b=bFYS+zLjVZbsWzGrUiTVJUmJel
	hNUpiNazXblijmGzr6bkvFlH06rBubmm/Mg2Oym4X8IHp4xZsXV7DRD+4KLx4Txh4w6plACuLqUXg
	leEWtuN36A0yOSqIcqn7XbmmoDK3jelYIElSCjgMobYI4qQjtamRwxUacFtV99GD3YYm+Tz+t3hqv
	DsuxoSOYQOyaoThfnMhD+Kxe+wVVLY59labz1Tn3t+kvMwq8NVYxK6GFbN9ReY4KjQy0oeH/f96cb
	IWejDZAo93T5qL44f73XqP1ImjoTGiLkXdpOSpJnIzcfwodRS9905/NQZz+Qny6n78pHSWu6c0wwd
	qWs25oQw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9h-00000007OU1-0mY8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5D824174A;
	Mon, 16 Mar 2026 17:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79090C19421;
	Mon, 16 Mar 2026 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683701;
	bh=kc0QYskUhZvvSika4c/oWQOSCjo1FOrm8FnMBYmgaGk=;
	h=From:To:Cc:Subject:Date:From;
	b=VM+hZqNqMeIMprcqWH+yzUbjxk3Aah5zCrGlLlifh2U7RBw58lADXoNtjCkOWsnDa
	 NeU6Yw5vrEdyeRxfiZNzPk3KRVoMBlUzyHHar/K4B6sxBOC+03Obf/Cfqb9iTRO9E4
	 SFQwBqbDBNGzobJeCGbj3haW9WagTHt+X/xPvRe35jPROatarVR8/YnHiIIABG4VRY
	 qX06XiQWhS4RrIy64sKYwAXKS8HZ1kVaTp6vFLiJrAnok6vq/I+GWcupPlw6T7tWiw
	 z2crxDsxG8M9NyZ2j+9VjQrhntAj7Kz9yHGDMGKIbr4NhIN660jmWmfdVpBt32KYs3
	 ucvo6mM39uNvg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9b-00000002XDx-077g;
	Mon, 16 Mar 2026 17:54:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 00/17] KVM: arm64: More user_mem_abort() rework
Date: Mon, 16 Mar 2026 17:54:33 +0000
Message-ID: <20260316175451.1866175-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_175505_604624_4C894D06 
X-CRM114-Status: UNSURE (   9.54  )
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

Piqued by Fuad's initial set of patches[1] splitting user_mem_abort()
into more "edible" functions, I've added my on take on top of it with
a few goals in mind:

- contextualise the state by splitting kvm_s2_fault into more granular
  structures

- reduce the amount of state that is visible and/or mutable by any
  single function

- reduce the number of variable that simply cache state that is
  already implicitly available (and often only a helper away)

I find the result reasonably attractive, and throwing it at a couple
of machines didn't result in anything out of the ordinary.

For those interested, I have stashed a branch at [2], and I'd
appreciate some feedback on the outcome.

[1] https://lore.kernel.org/all/20260306140232.2193802-1-tabba@google.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=hack/user_mem_abort-rework

Marc Zyngier (17):
  KVM: arm64: Kill fault->ipa
  KVM: arm64: Make fault_ipa immutable
  KVM: arm64: Move fault context to const structure
  KVM: arm64: Replace fault_is_perm with a helper
  KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
  KVM: arm64: Kill write_fault from kvm_s2_fault
  KVM: arm64: Kill exec_fault from kvm_s2_fault
  KVM: arm64: Kill topup_memcache from kvm_s2_fault
  KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
  KVM: arm64: Kill logging_active from kvm_s2_fault
  KVM: arm64: Restrict the scope of the 'writable' attribute
  KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
  KVM: arm64: Replace force_pte with a max_map_size attribute
  KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
  KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
  KVM: arm64: Simplify integration of adjust_nested_*_perms()
  KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc

 arch/arm64/kvm/mmu.c | 428 ++++++++++++++++++++++---------------------
 1 file changed, 223 insertions(+), 205 deletions(-)

-- 
2.47.3


