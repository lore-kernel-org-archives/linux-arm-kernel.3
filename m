Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D6AC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYxY1VCsepXd4jN+1aJ4CRmIav/53Uiu2Af1XhEZdGE=; b=mOpKDMShBv6bKcH5kFjbcOrUc/
	6zmq/klUtqdfOEsGXJ+0Vd37DTvn0fj6/Wga+Hx34jnaZ0kE+yHOBnwHbShSdMAFO9aSnjvsRiOyG
	+dsdUYvjjLqrjrloU3asXCQ1ckj/PAAkSnBWkfvpmTHqpN0LGRY+EhaEaRbbvZtXGjPUuFssThs9M
	w3dAxKfjHidyHwZ7Fbw3EmkA1WwxrSKRalfhrOQ3lBiz5xCkyS+J0xAHQx/XKVN7t6YX1JvnSGedg
	L3FyqeOxizBeXFE6f3g1mfFar7QaaraLLf5YjO+x+b0jLBke45PqmTmAXLxJC1rvvKd5opmsiX/u2
	1uG8WO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0f1-0000000FBDU-0aTa;
	Wed, 15 Jul 2026 14:32:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0eN-0000000FAaf-03QZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:32:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4133D1576;
	Wed, 15 Jul 2026 07:31:46 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B4FA3F7B4;
	Wed, 15 Jul 2026 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125910; bh=hTHvGHo3aq13/0hCdni+YB/1LbAGuEZAjUd+4tZoURQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AR2vGpGk/pJKe3cSknWcS3UCEVyGMxAWtRMINXoVYuQ5KnoUiu3HircLCLB7+QqRS
	 l3NnR1yUEHGBt1G8I6z0uTusataDJtdw1V5AnjVcCS7dcysd+dq64vL73OVK3VSJOu
	 RelST7tzou4LH3wGD49r4zLAwVpDqy0yuTwKEPTQ=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v15 37/37] KVM: arm64: CCA: Enable realms to be created
Date: Wed, 15 Jul 2026 15:28:39 +0100
Message-ID: <20260715142841.80544-38-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715142841.80544-1-steven.price@arm.com>
References: <20260715142841.80544-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_073151_115792_464912DF 
X-CRM114-Status: UNSURE (   9.35  )
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

All the pieces are now in place, so enable kvm_rmi_is_available when the
RMM is detected.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/rmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 3f1c6351b71a..06cc85fb5092 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -1518,5 +1518,6 @@ void kvm_init_rmi(void)
 	if (rmm_check_features())
 		return;
 
-	/* Future patch will enable static branch kvm_rmi_is_available */
+	kvm_info("Realm guests supported\n");
+	static_branch_enable(&kvm_rmi_is_available);
 }
-- 
2.43.0


