Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D781061B02
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQKEy6PO9GpwRDCUPcoECr1Fer1iG++n/lEH3AX1heM=; b=a6+T4rLXuLgyzHCA1Z7M/3iIxm
	B/j9W/jpC2nbYjgedHnB5MrdWmXgZctDqBLQtKJLL+fR/XPU5opmFbMQJFtrBe0eCLTznJZ2FpK7O
	Oa2+faZcah7oF2hZNK5b/2Or+D8BdtlrYlD4KVvSzz+eZbnnHtJm8a4VS3SdvGfWK7kPyyuBEY+H8
	90ruOXDpxUyWUGi/1zacCjHjKYBj3iUPIYgywrXbiYIpINoyQkeofXOWWyeBwUsv5ccDlXex5N6WI
	sY1Ia7R8vEmz5Tn6NP59jWaBU5f9hVPGVqV+KU3gGjKjh3IpNx3/qKuqrF/uerAvQlhOJlIl7xlBG
	jzHLBEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DvI-0000000BSpH-1qbB;
	Mon, 30 Mar 2026 14:49:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DvD-0000000BSnb-1M9W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFA7B6011F;
	Mon, 30 Mar 2026 14:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79D6C4CEF7;
	Mon, 30 Mar 2026 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882134;
	bh=zaq6YWBuf/G29uBrxElDsX0t4jQ0Z/DxDtNSaiYqz6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jNMfl0DHdiwlQ6kj/P1bPaq0ytCwdnMpGQ+Kp1D4Lfq6X6TVpIsr3kthiV9x8hvqL
	 RNXd1A+wUAHosSxf9iS+zqApBBAsPeLA4sFcNx+TfXKP1+m36Is9w4pWBOZzNUnFE4
	 iSRqL0epuhfJaDecikynI3ywsMMqmuDs3xx8Ejgn3KH8D1R6tOQheBFLpYmIrSFekT
	 JR8Ze4bp1/dQEv8no039rsIA8jdHicsBA7/JyUgHhlyRYySOieMrwbx6BLClo3i37h
	 7Y1hEHNS0Ji+sG05bpwQx6p3R7zAAd6vH2gre3H+Gf01b3/1oQ3RKU5ifz8FiIcR73
	 Ub/eBcuHI1Z9g==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 01/38] KVM: arm64: Remove unused PKVM_ID_FFA definition
Date: Mon, 30 Mar 2026 15:48:02 +0100
Message-ID: <20260330144841.26181-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit 7cbf7c37718e ("KVM: arm64: Drop pkvm_mem_transition for host/hyp
sharing") removed the last users of PKVM_ID_FFA, so drop the definition
altogether.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 5f9d56754e39..7f25f2bca90c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -27,7 +27,6 @@ extern struct host_mmu host_mmu;
 enum pkvm_component_id {
 	PKVM_ID_HOST,
 	PKVM_ID_HYP,
-	PKVM_ID_FFA,
 };
 
 extern unsigned long hyp_nr_cpus;
-- 
2.53.0.1018.g2bb0e51243-goog


