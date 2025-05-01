Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FA9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n5wAXG/I+C+J43Riw5cAi4Hbwoq7zCPkXRDxBob5AHQ=; b=yzl6gxrl5uhF6DzrGgBnagdcC4
	O6GXy3etOWMq9XRh6lfSwMjgIhOUpnJ52MBW8OJY4t7T2qi3zELhIE9J8vFAZS8s62g+4gg7EkEHf
	t4YHA89tKVLBNZBY/rMQOMQA48xHS7sBkZBYobd8OUVi/WLdo/R/6wm+MADYZOuuFEl1itAbdjP7M
	Fn3EkrazOG57t59kHkH6DzuVdLP1dBqI4SFF7oJqMOp3TAmMO/EKdT30XyYfbuV0pl1WXctWzZDse
	3jgaHFwT20O5BX6mjww9Uuw6Nkbrh0wdA7oyE8VIjmGokiKVW+vkOBiS04t3nhl6kMhHVAcw/UQkt
	OEZxVroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARWX-0000000FE6E-2aUe;
	Thu, 01 May 2025 10:52:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARSW-0000000FDnu-1qr8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07FA95C572E;
	Thu,  1 May 2025 10:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D42C4CEE4;
	Thu,  1 May 2025 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746096483;
	bh=Rb2aNkVmSbcINAAk7g9qdS1IfEW+sRPHcABPa8OtZP4=;
	h=From:To:Cc:Subject:Date:From;
	b=tYqVtYEQIIiSkWJES8k/Rjb/RjdXyL4tuaWNsrnFXPkfGfnDyOxG0oD4nkrqvufJ9
	 yU33wNitNos62hQBrd1wdyy9Sej+2I53U+N4PeKNusTmT813dJhn1s0B9Jxu8aJqBG
	 EUPrJBc7WLkpocKakT3kB+Rg5jknoM5fSTmCPVUf7xqUUN9ZukIwhIN3FCaqaHt+Yj
	 ur/39uJmK/bdzi239mm+IGJ+bsRQl9nKg5FFQ6z9VLOFxylo+9GeWfmOR+4W4tGgKo
	 l7ictkvjQHFb4uzW5apYu6nng23GK2pxnZmCpRT9KuQMiWrAEIJlCh6bGJJSU+Ct8C
	 ChN6NXdN14iVA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Lee Jones <lee@kernel.org>,
	James Morse <james.morse@arm.com>,
	Doug Anderson <dianders@chromium.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
Date: Thu,  1 May 2025 11:47:47 +0100
Message-Id: <20250501104747.28431-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_034804_532866_596CD8C5 
X-CRM114-Status: GOOD (  13.18  )
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

Commit a5951389e58d ("arm64: errata: Add newer ARM cores to the
spectre_bhb_loop_affected() lists") added some additional CPUs to the
Spectre-BHB workaround, including some new arrays for designs that
require new 'k' values for the workaround to be effective.

Unfortunately, the new arrays omitted the sentinel entry and so
is_midr_in_range_list() will walk off the end when it doesn't find a
match. With UBSAN enabled, this leads to a crash during boot when
is_midr_in_range_list() is inlined (which was more common prior to
c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported
function")):

 |  Internal error: aarch64 BRK: 00000000f2000001 [#1] PREEMPT SMP
 |  pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 |  pc : spectre_bhb_loop_affected+0x28/0x30
 |  lr : is_spectre_bhb_affected+0x170/0x190
 | [...]
 |  Call trace:
 |   spectre_bhb_loop_affected+0x28/0x30
 |   update_cpu_capabilities+0xc0/0x184
 |   init_cpu_features+0x188/0x1a4
 |   cpuinfo_store_boot_cpu+0x4c/0x60
 |   smp_prepare_boot_cpu+0x38/0x54
 |   start_kernel+0x8c/0x478
 |   __primary_switched+0xc8/0xd4
 |  Code: 6b09011f 54000061 52801080 d65f03c0 (d4200020)
 |  ---[ end trace 0000000000000000 ]---
 |  Kernel panic - not syncing: aarch64 BRK: Fatal exception

Add the missing sentinel entries.

Cc: Lee Jones <lee@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Fixes: a5951389e58d ("arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/proton-pack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index b198dde79e59..b607f6dfc5e6 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -879,10 +879,12 @@ static u8 spectre_bhb_loop_affected(void)
 	static const struct midr_range spectre_bhb_k132_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+		{},
 	};
 	static const struct midr_range spectre_bhb_k38_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+		{},
 	};
 	static const struct midr_range spectre_bhb_k32_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
-- 
2.49.0.906.g1f30a19c02-goog


