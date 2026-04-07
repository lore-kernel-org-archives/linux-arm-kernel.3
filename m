Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DACFF5108
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OZl1gUjzSqN2xdnb1IjDd6m8c+BqATTz2eJ6uGhJ2lU=; b=u6AsWYg+OkSmPJ6BSZGjCgqaBH
	ef7AFN/iSoVZdmi/HmRXZeGICZB6zXMTvq6sWdpqFgkr9OyTj3Xqtr0xcrc71Mt98hidBUizIXJfr
	fIgAiV7UQMe/kNTweNCzslPo+/Vo6LXSYraNF7HVCS28k7z2kiLzIRICf4acrSBz0iEx37vQ6g6Bb
	n1XRPMLawYqv8dtFblfEhisICI9679PsaK4/y0n7c8s+v+wkxC+dfJJlkVhVg3nX+4UPFBVFDQFlc
	0QT+0TyZLcEwb1YBmlJ8qhROJFDJqtEuE52D/vgNLPpedoZzlMImyfTEIOnNfZLyCGJEc4OHhZKSE
	x8vOaj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Ml-00000006hfz-2ikN;
	Tue, 07 Apr 2026 15:29:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Mj-00000006hfI-0kju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1229D43F61;
	Tue,  7 Apr 2026 15:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18F9C116C6;
	Tue,  7 Apr 2026 15:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775575759;
	bh=uIhIdZLZ5hlz4N22TCntanIRfx8ojw1qhm3OsUrpWeY=;
	h=From:To:Cc:Subject:Date:From;
	b=rt08gB/pYh7ggAIc3BfgQhWJdvwpABmMc7TP6Kchi0fa+AB5vsRs388bhi/GWRED9
	 vLj9H9vIe6Nn3RTOVAtGulB4XoJqL/0UpRONaB5CcwBrQ3PNDB42rldvcFbKbukh41
	 NQ/87kvEMmAb67K+I2DhJ3iJQOz63s3AIVAfsLYk/Dq13CtLeR8E078Mtb62E0zbTI
	 Ew8QUQ3CSBgof3TpOu4F1IpNDZD5LPoXqqODPdYi+Prf2rwhiAlQB4mjQDBaB/1vLa
	 AjmkGQVpo3V/SuoVJ3W9GMKZqmKjyvwgB+Z60GRqKuelDibISNYSqI/yfb2Vp3G9Ly
	 Lb4pg/bDD+plA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH] arm64: rsi: use linear-map alias for realm config buffer
Date: Tue,  7 Apr 2026 20:59:00 +0530
Message-ID: <20260407152900.396431-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_082921_234989_143A9602 
X-CRM114-Status: GOOD (  12.20  )
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

rsi_get_realm_config() passes its argument to virt_to_phys(), but
&config is a kernel image address and not a linear-map alias.
On arm64 this triggers the below warning:

 virt_to_phys used for non-linear address: (____ptrval____) (config+0x0/0x1000)
 WARNING: arch/arm64/mm/physaddr.c:15 at __virt_to_phys+0x50/0x70, CPU#0: swapper/0
 Modules linked in:
 .....
 Hardware name: linux,dummy-virt (DT)
 pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : __virt_to_phys+0x50/0x70
 lr : __virt_to_phys+0x4c/0x70
 .....
 ......
 Call trace:
  __virt_to_phys+0x50/0x70 (P)
  arm64_rsi_init+0xa0/0x1b8
  setup_arch+0x13c/0x1a0
  start_kernel+0x68/0x398
  __primary_switched+0x88/0x90

Pass lm_alias(&config) instead so the RSI call uses the linear-map
alias of the same buffer and avoids the boot-time warning.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/kernel/rsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 9e846ce4ef9c..92160f2e57ff 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -145,7 +145,7 @@ void __init arm64_rsi_init(void)
 		return;
 	if (!rsi_version_matches())
 		return;
-	if (WARN_ON(rsi_get_realm_config(&config)))
+	if (WARN_ON(rsi_get_realm_config(lm_alias(&config))))
 		return;
 	prot_ns_shared = __phys_to_pte_val(BIT(config.ipa_bits - 1));
 
-- 
2.43.0


