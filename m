Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA89BCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YQ5he7palU0iuQesPKQhSZchF/iTrQ8dluhTUT90Vac=; b=CYpTmzrz9lJ1vX0NL5KNDGLJxm
	LLMHBY5L3g1/jfPEkTbqbifxfLNYmpUSTeAh/mlPyqKeyEPCwlPhqE/+enLdw5OtcKOs7qI9YthcU
	PJ4d0unAbv0dOUA+8p7/0pVVauC728SLTQzGnrPhGKjsn49PZ8dAU7OVMJm/ZC54HBJHOl8dyks13
	xr1Jrf0l3uPIfA5+SemiceZINXOPchdgRwmn0Z0vD3YeCTJOb0VDDK3Onj8D87vdnUevBZ//6Xd/T
	4CYwjexlpUsmBE3XSq+k0TF6mezZ1QEGzUvtI7EgH7N4UCjW8C3WEhwhU01J4rCsCIIsBjfKfVC3o
	Z7Ho+Sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzF-0000000E0tR-044X;
	Thu, 04 Sep 2025 19:51:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAj0-0000000C8SI-1sAc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:14:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 654551596;
	Thu,  4 Sep 2025 07:13:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E33D3F63F;
	Thu,  4 Sep 2025 07:14:03 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 04 Sep 2025 15:13:52 +0100
Subject: [PATCH v2] coresight: trbe: Return NULL pointer for allocation
 failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-cs_etm_auxsetup_fix_error_handling-v2-1-a502d0bafb95@arm.com>
X-B4-Tracking: v=1; b=H4sIAJ+euWgC/5WNQQqDMBBFryKzbkoMDdaueg+RkCajDlQjEw0W8
 e5NvUGX7/N5b4eITBjhUezAmChSmDKoSwFusFOPgnxmUFJpWcubcNHgMhq7bhGXdTYdbQaZA5t
 892+aeuFeFcoKfW19B1k0M+bXGWnazAPFJfDnbKbyt/6lT6UoBTqn0Xfqrqx+Wh6vLozQHsfxB
 T5ZpvLSAAAA
X-Change-ID: 20250904-cs_etm_auxsetup_fix_error_handling-cb7e07ed9adf
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756995243; l=2077;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=g1Fb62DfXIZHZG4UIGOigbgf49jhagB+MS0+w+reNYs=;
 b=JTCG2rHM8KtlbUkkR4xcwj0A9r4Rl+TvqXelMpCDRjaREDVAI7DSqz+13qxsXNE7eUoVsSt1D
 rvOHYrBkxSjArip8+dGvDw1sowHALm2LC8rKm+uXXFOWy76w6ROdW7J
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_071406_528655_57D3DE77 
X-CRM114-Status: GOOD (  13.06  )
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

When the TRBE driver fails to allocate a buffer, it currently returns
the error code "-ENOMEM". However, the caller etm_setup_aux() only
checks for a NULL pointer, so it misses the error. As a result, the
driver continues and eventually causes a kernel panic.

Fix this by returning a NULL pointer from arm_trbe_alloc_buffer() on
allocation failures. This allows that the callers can properly handle
the failure.

Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Fix TRBE driver instead of changing coresight-etm-perf.c.
- Link to v1: https://lore.kernel.org/r/20250904-cs_etm_auxsetup_fix_error_handling-v1-1-ecc5edf282a5@arm.com
---
 drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 10f3fb401edf6a00b24b38cdaa7c2865e7a191ac..8f9bbef71f236b327d35a288689df9b0dd8ff3f4 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -748,12 +748,12 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
 
 	buf = kzalloc_node(sizeof(*buf), GFP_KERNEL, trbe_alloc_node(event));
 	if (!buf)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	pglist = kcalloc(nr_pages, sizeof(*pglist), GFP_KERNEL);
 	if (!pglist) {
 		kfree(buf);
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 	}
 
 	for (i = 0; i < nr_pages; i++)
@@ -763,7 +763,7 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
 	if (!buf->trbe_base) {
 		kfree(pglist);
 		kfree(buf);
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 	}
 	buf->trbe_limit = buf->trbe_base + nr_pages * PAGE_SIZE;
 	buf->trbe_write = buf->trbe_base;

---
base-commit: fa71e9cb4cfa59abb196229667ec84929bdc18fe
change-id: 20250904-cs_etm_auxsetup_fix_error_handling-cb7e07ed9adf

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


