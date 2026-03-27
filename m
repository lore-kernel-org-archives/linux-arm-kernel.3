Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056B710ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQKEy6PO9GpwRDCUPcoECr1Fer1iG++n/lEH3AX1heM=; b=01uGUQBrKgJVui3AdisQXnKsF8
	R+a62bsUE+KILOQfoHHLpfeRc/BE99ZwpF0KSGTIduqXRlGvCXPX4TlC+icVYcINUdxNnVTYwSAvX
	uMNqhUUO1PBYF9vfe3rJvAqeTQx8UjUd4809ubtbXgSVooXTrvUVeMxWOBIfn3oMh4CLWFarKV+Br
	UcbY+IKmYz/ywjcNXSyHMhJ0nzgbxfBbXhWADn4T8oqav92D6eNQQiImFDTQD4UvwzuGDKBHJV6A4
	kthlfYnNiYGZu8BAUY/fkPIQRNMttgcgSYtTvniMWzPxI2v/XJbeu8g7YEkoNYq9W/JF4YTY1Xd5b
	x9pOYYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kB-00000007VS3-0HcB;
	Fri, 27 Mar 2026 14:00:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67k6-00000007VQq-3R6g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7428441997;
	Fri, 27 Mar 2026 14:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC75C19423;
	Fri, 27 Mar 2026 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620054;
	bh=zaq6YWBuf/G29uBrxElDsX0t4jQ0Z/DxDtNSaiYqz6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HdYADp1C2s9y8ZX+6HCIb/Sa2pehpf4QRKaShe7CvFGt9e7fMWavkCL2hUSIboPsQ
	 wUYYQ8p2/gbPUj5UssdIzaXRtTAg10hwx5bVgfCD1A2IlLz5KsJmXkAaGMvhWghlC9
	 FLmuvBDTJMwmxUpmDWS4CzWIQp8Pl1jCwwU7Ee8nyE79dfEkxghtGylSeCitD22Sbn
	 eMsLfz2bAz1XQUdApAnqinLSop4LfCSLJFRXGnyUkQFd9LunFJAS1wdDvQ5FP20qHU
	 zMH82D93eINCq66vwozlL0LVXFCoZNoQGr01t+gRJQdOgAGHQMCI5s453IIXPY8Kmt
	 6Bq3s6Eu2xoBw==
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
Subject: [PATCH v4 01/38] KVM: arm64: Remove unused PKVM_ID_FFA definition
Date: Fri, 27 Mar 2026 14:00:00 +0000
Message-ID: <20260327140039.21228-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070054_874765_7F909726 
X-CRM114-Status: UNSURE (   8.42  )
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


