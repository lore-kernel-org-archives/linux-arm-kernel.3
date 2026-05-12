Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3C7CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sAdDbkVb3j85DnxAF/9SufGIt1MdwCwgX5eCI4wM93o=; b=nc+TFOQO5iLS/rZfwtQfxWwess
	YTrqcoZ1KQaAZXJpmJ8ez3yFJsb5nZX7ItzR7Xy0009cuFoilKplpcN8GiN6B3fqBhubtgTYBnVbV
	dI6W/Ad0zqg+26XH8BcKN5OGLVsJUEUBYSe62dIY9KsC6hYxcpJUpqkL0Y4XOdh/xGaDokloYm+zX
	Go5OONzvSSu5mC1IdzUQ8FuPIbbsXfqOemMDOTB8QYlEDgulTfFB2Wn39N7cOMRKcjzTfBdD8QWQc
	wqLflqZ9hB3hnrGEr22PbdWsfO/LFjYnppPZQYvKVKu8WItBLTVWIIlZNxIgzjOfuDhnDmBN2fglK
	au0Sv5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnmN-0000000Gxmm-3NF6;
	Tue, 12 May 2026 14:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnmH-0000000Gxjz-1Geu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC766449C3;
	Tue, 12 May 2026 14:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B27C4AF0B;
	Tue, 12 May 2026 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594884;
	bh=2z0QUbRfd7RQy2VdTzINQY27ivTVVpTJV9yTHwNGfXQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ZZxpbcZbuxxboPRxAOcWEUUjyEggALZMoAkjgheNjXj3ATYmpjl55r6kScF4HCLYh
	 lhbkpBkLbRuVsgQZ1FOnoy4dy7++6VqebjJql+nLaf5rOI9hEvgi02H6/67rSmIiyz
	 kHpnoOrtPg2ZbXnUgToqjNqYdsb1NwwzUZOc6K5KmlvxD9Ias3mo4ocN0cHvOC84WA
	 I9ySauTnCuxU6fIDA4HmG7K1s7NyUW1bQoSQv8VVNsX/U/L2EmPpHaokMUs/mOvamg
	 48lZQkhRLvDFbuoJW3eBarqzctog8hLhTFNaGfwh0jzb4GAcDq1mOfUjrcUAgjpwio
	 dA/D/4rWNiKqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wMnmE-00000001Zsc-0q45;
	Tue, 12 May 2026 14:08:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/2] KVM: arm64: nv: Reduce FP/SVE overhead on exception/exception return
Date: Tue, 12 May 2026 15:07:53 +0100
Message-ID: <20260512140755.3676306-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, mark.rutland@arm.com, will@kernel.org, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_070805_380593_0D46E1A4 
X-CRM114-Status: GOOD (  14.99  )
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

Staring at NV traces has shown that there is a substantial amount of
overhead being triggered when a guest switches between EL1 and EL2 (or
the reverse). This is caused by the naive put/load mechanism we use to
multiplex EL1 and EL2 onto EL1 only, and the FP handling appears as a
prime candidate for optimisation. More precisely, there are two
distinct sources of overhead here:

- the FP/SVE registers are saved, and potentially the host userspace
  state restored when doing put()

- the FP traps are reinstated as part of load(), as the state is now
  the host's

These two things mean that we end-up with a lot of work during this
switch, and that we are 100% guaranteed to get a FP/SVE trap very
quickly, as the guest keeps using the FP registers. These traps
themselves result in some horrible trap amplification in even moderate
levels of nesting, which we could trivially avoid. A bit of thinking
indicates that it should be entirely valid to elide this stuff in the
context of a nested exception/exception return.

The first patch in this small series just add a new vcpu state flag
indicating that put() and load() are done in the context of a nested
exception from L2 to L1. This is the exact pendent of IN_NESTED_ERET,
which tracks an ERET from L1 to L2.

The second patch uses these two flags to abruptly elide FP/SVE
save/restore when any of them is set, sidestepping the overhead
entirely.

Performance-wise, this is rather impressive. I get a 10%-20%
improvement on running the Debian installed as an L3 on my QC
platform. Combined with the use of the EL2 virtual timer, it almost
makes L3 usable.

But of course, nothing is simple with this stuff, which is why I'm
cc'ing Mark here, as he's done a lot of work tracking funny bugs in
our FP handling. Hopefully I haven't subtly broken anything, but let's
see!

Marc Zyngier (2):
  KVM: arm64: nv: Track L2 to L1 exception emulation
  KVM: arm64: nv: Don't save/restore FP register during a nested ERET or
    exception

 arch/arm64/include/asm/kvm_host.h | 3 ++-
 arch/arm64/kvm/emulate-nested.c   | 4 ++++
 arch/arm64/kvm/fpsimd.c           | 8 ++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.47.3


