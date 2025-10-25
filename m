Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2273CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NCz/MRoDZJANlRuT0WqhM47Ty0t/8yvMxHgLvN/ybE=; b=EMf0LC1FL1LC/vyGYr3tthFhnI
	PBQ/uh7zRJqE+1MDY2mDrDWrZFSxsrV+k8RsCBkElAx7K2m0xMmSIUZmJ1bhiH/snDZJBLHAg5+BD
	ZVMjmJgU7iDORaWc3wbYrh1Jr0Xpo4Y5ybMy9jyOZ9lKqH6WMPTyWR2I5ODG4j1xBVVEZsww/d46o
	goCnBeyeHksm5jrwMvW5JKPOv+yZlQXldP5G8i5B1WaxYCZgQlZiRlhtvVlGuVho4dji2KAR7nRl1
	v2HmElmBpLsO+ZQMEDWXw4UN2N2gWjTCgqT2+ktT5fyKbLFbjJBPR6im/dhqFkc9AlUninnanPabn
	1WgOkKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCguV-0000000BRey-2YKc;
	Sat, 25 Oct 2025 16:14:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCguS-0000000BRbs-1i7y;
	Sat, 25 Oct 2025 16:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1154244E9A;
	Sat, 25 Oct 2025 16:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C224C113D0;
	Sat, 25 Oct 2025 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408867;
	bh=P1gyEeiylqh/OZ2bOjUOKTj6deI6dCpDKMJw4ri6lQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iAKpuxAo2KPuoWW6EujXwYsM22ikGP0KHBAKzjSJfX4KGdIx5Irt4CBRBWRJ/kJnR
	 s3H6mUribonJo9V0tlMGdGElK0g+4YkMO13a2r/h+WXwsd7cblph+/d+/dSFos0tyW
	 OyjAW4Jf9RTiOkOQNIG6MM2n13ECGPukmDp0OBoZQs19+UsscpHprWrDZW0P24G5am
	 bJI4C3BpPyGtropWpMLgWmYeHs5932z8/siPKNfnyRcqrS+wZ8uPAy6MzbaYhbrdEO
	 tJEoTBEJzZIj5wFgwan4uSOE/Z4UZfviUYOC/UWtJkmohFkUcF7jOkmLsY4ehAKYfP
	 Mef2b70ZSxd2g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alice Chao <alice.chao@mediatek.com>,
	Peter Wang <peter.wang@mediatek.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.1] scsi: ufs: host: mediatek: Fix invalid access in vccqx handling
Date: Sat, 25 Oct 2025 11:55:39 -0400
Message-ID: <20251025160905.3857885-108-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_091428_528288_0730105D 
X-CRM114-Status: GOOD (  16.94  )
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

From: Alice Chao <alice.chao@mediatek.com>

[ Upstream commit 5863638598f5e4f64d2f85b03f376383ca1f2ab7 ]

Add a NULL check before accessing the 'vccqx' pointer to prevent invalid
memory access. This ensures that the function safely handles cases where
'vccq' and 'vccq2' are not initialized, improving the robustness of the
power management code.

Signed-off-by: Alice Chao <alice.chao@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20250811131423.3444014-11-peter.wang@mediatek.com
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Rationale
- The patch adds a defensive NULL guard in `ufs_mtk_vccqx_set_lpm()` so
  it immediately returns if both `vccq` and `vccq2` are absent. This
  prevents a NULL dereference on `vccqx->reg` when neither rail is
  defined in DT or has been released earlier.
- Specifically, the change adds: `if (!hba->vreg_info.vccq &&
  !hba->vreg_info.vccq2) return;` before dereferencing `vccqx` in
  `drivers/ufs/host/ufs-mediatek.c:1506`.
- Without this guard, the function selects `vccqx` from
  `hba->vreg_info.vccq` or `...vccq2` and unconditionally does
  `regulator_set_mode(vccqx->reg, ...)` (drivers/ufs/host/ufs-
  mediatek.c:1515), which is unsafe if both are NULL.
- The UFS core explicitly allows these supplies to be optional, meaning
  NULL is a valid state when a supply is not provided in DT: parsing
  populates `vccq`/`vccq2` optionally (drivers/ufs/host/ufshcd-
  pltfrm.c:168).
- The Mediatek driver also clears the pointer to NULL when it
  deliberately disables a VCCQx rail (e.g., after freeing the vreg in
  `ufs_mtk_vreg_fix_vccqx()`, drivers/ufs/host/ufs-mediatek.c:1072).
  That makes the callee’s NULL-robustness important.

Why this matters despite caller checks
- Today, `ufs_mtk_dev_vreg_set_lpm()` computes `skip_vccqx` and only
  calls `ufs_mtk_vccqx_set_lpm()` when appropriate
  (drivers/ufs/host/ufs-mediatek.c:1537, 1555, 1560). However, this is a
  single call site and relies on all future call paths being equally
  careful.
- The new guard makes `ufs_mtk_vccqx_set_lpm()` itself robust,
  eliminating a class of NULL deref crashes if it is ever called without
  prior checks, or if future refactors change the call sites.

Stable backport criteria
- Bug fix that prevents kernel NULL deref (user-visible reliability
  issue).
- Change is minimal, localized, and has no architectural impact.
- No functional side effects when supplies exist; when both are absent,
  early return is the correct behavior (nothing to configure).
- Touches a specific host driver (MediaTek UFS), keeping risk of
  regression low and scope confined.

Conclusion
- This is a safe, targeted fix to avoid invalid memory access in a power
  management path. It improves robustness with negligible risk and
  should be backported to stable.

 drivers/ufs/host/ufs-mediatek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 82160da8ec71b..bb0be6bed1bca 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1589,6 +1589,9 @@ static void ufs_mtk_vccqx_set_lpm(struct ufs_hba *hba, bool lpm)
 {
 	struct ufs_vreg *vccqx = NULL;
 
+	if (!hba->vreg_info.vccq && !hba->vreg_info.vccq2)
+		return;
+
 	if (hba->vreg_info.vccq)
 		vccqx = hba->vreg_info.vccq;
 	else
-- 
2.51.0


