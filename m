Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E34C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vQD/WhCxyH0Pz7Ah/hR/OulljU5ehS2EmXyCHZ+BQM=; b=Ea30hBgobFbZJlMsMmWuvc4mBY
	cAIAL3DzvdKBPaqKR/jy18cl7ngmRUFe70M0jNbIsV5RgxxNiBDeejgEtEBU9QjBa7ke4fH4OTcec
	CDmRmmlCWCbDrGYh81fOjiRsyKTqz0spWI4B198gy7ZkyjqJAdyVXWqcK1K7ZGOcimBqBDoadiqrZ
	STjvgMvI26lGWs48ero9pxeVuHjpHGUYHFHynfECplJxmps6wqFgj5/1ary2deJBcmfFnjqHy3s4n
	iCGGr6on0kHqR8QesaP018WY2fwZp+64bXwVPnwamqLHbAmCzGQueufJSJejYCGkBaAKdTVqJKxR5
	OlVOXlaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xr-000000005HZ-0mmN;
	Thu, 03 Sep 2026 16:06:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xp-000000005Es-0BWl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E8531650;
	Thu,  3 Sep 2026 09:06:52 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62C543F673;
	Thu,  3 Sep 2026 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451616; bh=J7TA+zV8kmgZt4wrJnZbQsqLDsJ8zbM7UZBpwa76m/c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YvcxaEaqUu7xOg2JVbn6D6bN36ItxpJ68KGeHRUloC90DnMx3E7N8V+rcB3cDiuRd
	 +No+xpPZO2lgW2+Og5j9N8K3A2Ixoi0d/lHnapen+RfIiA5TNpAR3/Ez/Ac6NhDI3n
	 6nyns/D1mk0yrzClcL40VXoB2GLQxNwJ3hjsW+3I=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 10/28] HACK! KVM: arm64: Disable SPE virtualization if nested virt is enabled
Date: Thu,  3 Sep 2026 17:06:05 +0100
Message-ID: <20260903160623.315525-11-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090657_124481_22B22346 
X-CRM114-Status: UNSURE (   9.05  )
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

For RFC only.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/arm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b9cee4cf293d..763b102dc51f 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1640,6 +1640,11 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 	    !test_bit(KVM_ARM_VCPU_PMU_V3, &features))
 		return -EINVAL;
 
+	/* TODO: NV support */
+	if (test_bit(KVM_ARM_VCPU_SPE, &features) &&
+	    test_bit(KVM_ARM_VCPU_HAS_EL2, &features))
+		return -EINVAL;
+
 	if (!test_bit(KVM_ARM_VCPU_EL1_32BIT, &features))
 		return 0;
 
-- 
2.43.0


