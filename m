Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACCBC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 05:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3ggSja/+ZeMiNzjpRTGTbGSIDPT9w5x7SxjnKYWPRs=; b=R+/nnnHzH8AZ3NoCepRO4XFEJP
	MfrLS/WLktYKWzRtTb5sb4HgvMZnocDMVKD5PCQRaiJCovp6NJyZACLo7rPzEwKaucpC+fTmrXBcZ
	PDmAHrADA+Dni0Q35PFW2Y8xvjncZOMWNC5eLcKsuNbRIJpCsCT+NW+LtpKcqjasNFGe0ijCTWve2
	sh91D10CGauFSGwerBI7F9E40hBbOteafmbeBX+052/kTaDHttEma9jIYFTwJW49ETV66KQu3gX+C
	1jzaAnxEAm3RuYRCASTztk0NMh7yLWnR5ZROoWOrarPUg88FWu8CmSBpHnq61m8P/TReEuNI3DTug
	szMAx60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DB0-00000007oLb-34nJ;
	Thu, 03 Apr 2025 05:31:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0D8Z-00000007o6H-2Lr1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 05:29:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A11FF106F;
	Wed,  2 Apr 2025 22:29:10 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.46.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF28C3F694;
	Wed,  2 Apr 2025 22:29:02 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: gshan@redhat.com,
	rppt@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn,
	ardb@kernel.org,
	david@redhat.com,
	ryan.roberts@arm.com,
	urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
Date: Thu,  3 Apr 2025 10:58:44 +0530
Message-Id: <20250403052844.61818-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_222911_639363_E70D998E 
X-CRM114-Status: GOOD (  12.45  )
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

arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
which does not support changing permissions for block mappings. This function
will change permissions until it encounters a block mapping, and will bail
out with a warning. Since there are no reports of this triggering, it
implies that there are currently no cases of code doing a vmalloc_huge()
followed by partial permission change. But this is a footgun waiting to
go off, so let's detect it early and avoid the possibility of permissions
in an intermediate state. So,  explicitly disallow changing permissions
for VM_ALLOW_HUGE_VMAP mappings.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
v1->v2:
 - Improve changelog, keep mention of page mappings in comment

 arch/arm64/mm/pageattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..04d4a8f676db 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 * we are operating on does not result in such splitting.
 	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Those are guaranteed to consist entirely of page mappings, and
-	 * splitting is never needed.
+	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
+	 * mappings are updated and splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
 	 * covered by precisely one VM area that has the VM_ALLOC flag set.
@@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	area = find_vm_area((void *)addr);
 	if (!area ||
 	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
-	    !(area->flags & VM_ALLOC))
+	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
 		return -EINVAL;
 
 	if (!numpages)
-- 
2.30.2


