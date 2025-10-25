Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3498CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfz2m1EHP+ww/odTjhJF6NfQlFBPLAaWNAEwvqidzMI=; b=gpqpa1hPpNgCOeQi8ifEmKsVX6
	5OnwM1juhhGKllbglf3Xg1ETVeUVspxUhMcH53LvH0lvwFKDoJipw79uPEqd2Zh8S1+Hqa+HjAMf6
	7Qbe4LbH8QLq9kTvoa8fmPj7aknSvLa/tt1CiZEVGP4fxBsNtH7wvcGgCtrR3UZ4nWucGDZl7ff0E
	v4LqnFGZeMJOn6IMd0THP9D4KzCwVGYIA0UjF6k7fvr1wmlCN3rAySTuFc1p9WZHopzsxxjtXbodw
	S1wW2riqwgIA3GJcU1NeJ0JFceiaXFx0RLXzkKexXkT8dwibObBPjI+/0dE+HgjuEWyruL2cUC7Hc
	6fbfTakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6u-0000000BVKV-0MDl;
	Sat, 25 Oct 2025 16:27:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6s-0000000BVJJ-1wG3;
	Sat, 25 Oct 2025 16:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F334D43FD2;
	Sat, 25 Oct 2025 16:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2534C4CEFB;
	Sat, 25 Oct 2025 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409637;
	bh=674ScUfL2y2OnNZx6hSiuHRi3Sb7Jh74ZzdnAu96/C0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FB9FP3Ze/ksaLxYh9WIvnqxymo4lIUHCrh/1Xv4GFd7ZsJHLX9y0g5COqwLvWsS5/
	 +WBF/gMDBMXSlJd9vIeKEQX3mtuzEcRXC0Bn8yF7SZ+9lNw68IlbiEEejLHEMjs2QY
	 nX90j8buf54dEEahRT3cKu1stpEuKLtJFd3CRg+WfhcW3r+JLgSqgJJyQJwQO9Rcjy
	 7+wmnUjht5zIOQ0CRAVb6xfU0Q5FrxwsIusqQPkvlojc6/JkSwuqOrvqC5n2vWVmWq
	 hSL3h3FCL/yLkKlC4jtoApVyd27fc+Kg77x8a+ZkU5O2bkY7a3Dv04rfvL3HdMWLHA
	 fkRjcaxoollzw==
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
Subject: [PATCH AUTOSEL 6.17-6.1] scsi: ufs: host: mediatek: Enhance recovery on resume failure
Date: Sat, 25 Oct 2025 12:00:31 -0400
Message-ID: <20251025160905.3857885-400-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_092718_543958_B49D00E1 
X-CRM114-Status: GOOD (  19.77  )
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

[ Upstream commit 15ef3f5aa822f32524cba1463422a2c9372443f0 ]

Improve the recovery process for failed resume operations. Log the
device's power status and return 0 if both resume and recovery fail to
prevent I/O hang.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation
- What changed (drivers/ufs/host/ufs-mediatek.c: fail path in
  `ufs_mtk_resume()`):
  - Old behavior: on resume failure, jump to `fail:` and return
    `ufshcd_link_recovery(hba)` (propagate error).
  - New behavior: at `fail:` call `ufshcd_link_recovery(hba)` and log
    runtime PM status if it fails; then unconditionally `return 0 /*
    Cannot return a failure, otherwise, the I/O will hang. */`.
  - Code reference: drivers/ufs/host/ufs-mediatek.c:1814 (call to
    `ufshcd_link_recovery(hba)`), followed by the new `dev_err()` that
    prints `hba->dev->power.request`, `runtime_status`, `runtime_error`,
    and the unconditional `return 0`.

- Why this fixes a real bug affecting users (I/O hang):
  - The UFS core resume path calls the vendor resume first and bails out
    immediately if the vops `resume()` returns an error, skipping core
    recovery steps like hibern8 exit or full reset/restore:
    - Code reference: drivers/ufs/core/ufshcd.c:10011 (`ret =
      ufshcd_vops_resume(hba, pm_op); if (ret) goto out;`).
    - If the Mediatek variant previously returned an error from
      `ufs_mtk_resume()`, the core code would not attempt
      `ufshcd_uic_hibern8_exit()` or `ufshcd_reset_and_restore()`,
      leaving the link/device in a bad state and causing I/O to hang.
  - With this patch, the Mediatek driver tries `ufshcd_link_recovery()`
    locally and returns 0, allowing the core resume sequence to proceed:
    - If the link is in Hibern8, the core performs
      `ufshcd_uic_hibern8_exit()` (drivers/ufs/core/ufshcd.c:10025) and
      sets the link active.
    - If the link is off, the core performs `ufshcd_reset_and_restore()`
      (drivers/ufs/core/ufshcd.c:10034).
  - Hence, even if the vendor-specific parts hit an error, the core
    still executes its well-tested recovery and bring-up, which avoids
    the I/O hang scenario the commit message calls out.

- Localized change, minimal risk:
  - The change is confined to one function in the Mediatek UFS host
    driver; no interface or architectural changes.
  - `ufshcd_link_recovery()` is the standard core recovery path for UFS
    (drivers/ufs/core/ufshcd.c:4467), which resets the device and host
    and is safe to invoke on failures.
  - Logging uses existing runtime PM fields for debugging and has no
    functional side effects.

- Side effects considered:
  - Masking the error return from `ufshcd_link_recovery()` at the
    variant level does not hide failures overall: subsequent core steps
    will still return errors if the link/device is not brought back
    correctly, and the resume wrapper will report failure
    (drivers/ufs/core/ufshcd.c:10011+ path).
  - This approach improves robustness by ensuring core recovery always
    runs, which is preferable to aborting early and risking an
    unrecovered link and stuck I/O.

- Stable backport criteria:
  - Fixes a user-visible bug (I/O hang after resume failures).
  - Patch is small, self-contained, and limited to Mediatek UFS host
    driver.
  - No new features or API changes; follows existing error-handling
    patterns (attempt recovery, proceed to core recovery, log details).
  - Low regression risk relative to the severity of the hang it
    prevents.

Conclusion: This is a targeted bug fix that prevents I/O hangs by
ensuring the core resume/recovery sequence runs even if the vendor
resume fails. It is suitable for backporting to stable.

 drivers/ufs/host/ufs-mediatek.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index bb0be6bed1bca..188f90e468c41 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1727,8 +1727,21 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	}
 
 	return 0;
+
 fail:
-	return ufshcd_link_recovery(hba);
+	/*
+	 * Check if the platform (parent) device has resumed, and ensure that
+	 * power, clock, and MTCMOS are all turned on.
+	 */
+	err = ufshcd_link_recovery(hba);
+	if (err) {
+		dev_err(hba->dev, "Device PM: req=%d, status:%d, err:%d\n",
+			hba->dev->power.request,
+			hba->dev->power.runtime_status,
+			hba->dev->power.runtime_error);
+	}
+
+	return 0; /* Cannot return a failure, otherwise, the I/O will hang. */
 }
 
 static void ufs_mtk_dbg_register_dump(struct ufs_hba *hba)
-- 
2.51.0


