Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A0ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz7tDcEfNdGY8Xrx2AqN43DRNa140ah4pz0kIb9Ai/w=; b=uNzZ0AvP1TYt837QbBuMymHkYE
	cxSmJ0t13MVc2odZPdfkgIBJM73T0fjvHgn9e8kJWym3YHQgSfDATyLl79c4RRhrPT7md0FaZDOjK
	5MsM7cbeBC3mlL11c8DITu5DPVbxYpSezWxAYr+7uMNF2jFWuJsHS2eRMFhu16e7osxM8ggn10CX1
	uPuOKUy46s8trv62Ds6rk5WrHCKvWuBhxyvvmKutRyjnsGiw6cO0gwe9YQ/Cll5gkUHHwNwXsGfiR
	4m824lumIyDZdm9PgsJN9YZwQWhU5Ts+idJePJ32h3lFxSh4YcD02WUn1hNqu0lAHlTn4+yqroYIT
	glNrnAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6W-0000000BV65-0mbL;
	Sat, 25 Oct 2025 16:26:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6P-0000000BV34-17H5;
	Sat, 25 Oct 2025 16:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFC3C6033C;
	Sat, 25 Oct 2025 16:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAFAC4CEF5;
	Sat, 25 Oct 2025 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409608;
	bh=cvWUBD/FCgrQNuYv0W7OchRUtrorq/v9H+SVgEfr2tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N3QOaGdeaghICJXujgECPSkl5AwLqkbNX/06ZhFba2XzK9mK733rZ1nz1zSSQgrvL
	 BYJtYmLnwIy4TJ3YmraHlZ3HWwykcrE4RLuhCA5yLOnKbeQiPFJpZG+rNQfaPirGnl
	 9InQr6cu5xvUCi9UYqlrD8qv2Vnzj5EhbdPg3F3Y1RST3K9J/zvqxKAPP6K1vYwpYY
	 nRb3iX+scyo3+VnmGtQkbxqyXOqyCvVesTONB8+2VwriTepWT++6A6g9EfKxA6Vyt7
	 eAwOE75OjbKruDa91uw/vzN5j6+pWf9+ViXJWWdAI/6IRFk2fqtKqmSvjUjTpuwf5y
	 WzU5SkWTkDe8Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peter Wang <peter.wang@mediatek.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.12] scsi: ufs: host: mediatek: Fix unbalanced IRQ enable issue
Date: Sat, 25 Oct 2025 12:00:21 -0400
Message-ID: <20251025160905.3857885-390-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Peter Wang <peter.wang@mediatek.com>

[ Upstream commit 91cad911edd1612ed28f5cfb2d4c53a8824951a5 ]

Resolve the issue of unbalanced IRQ enablement by setting the
'is_mcq_intr_enabled' flag after the first successful IRQ enablement.
Ensure proper tracking of the IRQ state and prevent potential mismatches
in IRQ handling.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Prevents unbalanced IRQ enable calls in the Mediatek UFS MCQ path by
    ensuring the driver’s internal state flag matches the real IRQ state
    immediately after the IRQs are requested (and thus enabled by
    default). Without this, subsequent enable paths may re-enable
    already-enabled IRQs, triggering “unbalanced enable” warnings and
    mismatched IRQ depth accounting.

- Precise change
  - Adds `host->is_mcq_intr_enabled = true;` at the end of
    `ufs_mtk_config_mcq_irq()` after all IRQ handlers have been
    successfully registered with `devm_request_irq()`
    (drivers/ufs/host/ufs-mediatek.c:2193).
    - This reflects that IRQs are enabled as a result of `request_irq()`
      and aligns the state flag with reality.

- Why it’s correct
  - `devm_request_irq()` attaches the handler and leaves the IRQ enabled
    by default. If the state flag remains false, the first call into the
    driver’s “enable MCQ IRQs” helper will re-enable an already-enabled
    IRQ, causing an unbalanced enable.
  - The driver already guards enable/disable with this flag:
    - Disable path: sets the flag false after disabling
      (drivers/ufs/host/ufs-mediatek.c:741).
    - Enable path: bails out if already enabled and sets the flag true
      only after enabling (drivers/ufs/host/ufs-mediatek.c:755 and
      drivers/ufs/host/ufs-mediatek.c:762).
  - With the new line in `ufs_mtk_config_mcq_irq()`
    (drivers/ufs/host/ufs-mediatek.c:2193), the initial state is
    correct, so `ufs_mtk_mcq_enable_irq()` will correctly no-op on the
    first enable attempt when IRQs are already enabled.

- How the bug manifested
  - `ufs_mtk_setup_clocks()`’s POST_CHANGE flow calls
    `ufs_mtk_mcq_enable_irq()` (drivers/ufs/host/ufs-mediatek.c:817).
    Before this patch, after `devm_request_irq()` the IRQs were already
    enabled but `is_mcq_intr_enabled` was still false, so the enable
    path would call `enable_irq()` again, risking “unbalanced IRQ
    enable” warnings.
  - The disable path is already consistent: `ufs_mtk_mcq_disable_irq()`
    uses the list of IRQs and flips the flag to false
    (drivers/ufs/host/ufs-mediatek.c:741), so subsequent enables are
    properly balanced.

- Scope and risk
  - Change is a single-line state fix in one driver function, confined
    to the Mediatek UFS host driver.
  - No API, ABI, or architectural changes; no behavioral changes beyond
    preventing an incorrect extra `enable_irq()`.
  - The flag is set only after all IRQ requests succeed; if any
    `devm_request_irq()` fails, the function returns early and does not
    set the flag, preserving prior behavior.

- Stable backport criteria
  - Fixes a real correctness issue that can lead to warnings and IRQ
    depth mismatches.
  - Small, contained, and low risk.
  - No feature addition; clear bug fix in a specific subsystem (SCSI UFS
    Mediatek host).

Given the above, this is a good candidate for stable backporting
wherever the Mediatek UFS MCQ driver and `is_mcq_intr_enabled` field
exist.

 drivers/ufs/host/ufs-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 188f90e468c41..055b24758ca3d 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2111,6 +2111,7 @@ static int ufs_mtk_config_mcq_irq(struct ufs_hba *hba)
 			return ret;
 		}
 	}
+	host->is_mcq_intr_enabled = true;
 
 	return 0;
 }
-- 
2.51.0


