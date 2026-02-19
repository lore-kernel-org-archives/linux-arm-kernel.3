Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439F2E9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 02:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fWIkZsYXiegVBb1NPWO9Ab0us+EA8y5OqTz9gKtK3k=; b=TgjltcxkW8rjlhbC/gWJ0wP4f4
	+4naBMEBo9oDe5mtaBag6TRGYa8R+0ftKdteBvSZ6U6zpUtz6/H4SENIR7eXiIEfBou/0paRzITvw
	Ilvmf44iQVJl0BI98tN3DNVYAFJxp3cyXGAZ6Fmh+2HaAHAZtcTj8hz8wYrSm3whBksmhUeNocrK2
	kMZ0zP8/2+LaNgQEWA7zzGXYQuXzevIMP6x8ilIkEyG77lyBWgVgntqfxCyShIM/KQXYH1BDUtGYs
	m87omyM6C1PrdPJxIT2GMDIyihwgrBwuCD1erXCuwEz2lxoe0T4u83AB+PJ4PGoljsfSjlDgFccAS
	CgOjBc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPP-0000000Aj6H-414G;
	Thu, 19 Feb 2026 02:04:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPO-0000000Aj5j-2o6g;
	Thu, 19 Feb 2026 02:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8E5A61850;
	Thu, 19 Feb 2026 02:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D82C116D0;
	Thu, 19 Feb 2026 02:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466689;
	bh=gHtcNRF3wMm1yv55zf4VRgDNe+lRp+wHBTVMtvKLo/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3+Q8RSkcfOzGQcxkTtIhRD1twFLCYdW3OKzEp0IU9D8X4DrqUMGTMiSrd1xtW2tt
	 8tpFXxxDrOEEBZ6ilcLFV5bCrSwnpVBr5RUImJa7hw7/NyhcOim5l63Tu34QkCojer
	 Ldj5ut/t/1kOdgt5kV6BXDmM8IFT1FfMk5VnmvCs06CTykY13cTTZHFEYFGW/hCZyd
	 Yt2/D6h/B7/5lW/AlunfziGzP3mOKM0iD2hqzzA5ak052vPJcSc5K0/sFqYTi9/BJ8
	 HHTz5EKlTPys/iG3pX6YQCQ66anAAu6jdXbd7SzlUAnr/eM5ruzcudhsKX3yDPdBvZ
	 xrxPpyQeGc7rw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Liang Jie <liangjie@lixiang.com>,
	fanggeng <fanggeng@lixiang.com>,
	Linus Walleij <linusw@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	sean.wang@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.18] pinctrl: mediatek: make devm allocations safer and clearer in mtk_eint_do_init()
Date: Wed, 18 Feb 2026 21:03:56 -0500
Message-ID: <20260219020422.1539798-20-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
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

From: Liang Jie <liangjie@lixiang.com>

[ Upstream commit 255b721c96046d4c57fa2268e4c72607868ce91f ]

mtk_eint_do_init() allocates several pointer arrays which are then
populated in a per-instance loop and freed on error. The arrays are
currently allocated with devm_kmalloc(), so their entries are left
uninitialised until the per-instance allocations succeed.

On a failure in the middle of the loop, the error path iterates over
the full nbase range and calls devm_kfree() on each element. For
indices which were never initialised, the corresponding array entries
contain stack garbage. If any of those happen to be non-zero,
devm_kfree() will pass them to devres_destroy(), which will WARN
because there is no matching devm_kmalloc() resource for such bogus
pointers.

Improve the robustness and readability by:

  - Using devm_kcalloc() for the pointer arrays so that all entries
    start as NULL, ensuring that only genuinely initialised elements
    may be freed and preventing spurious WARN_ON()s in the error path.
  - Switching the allocations to sizeof(*ptr) / sizeof(**ptr) forms,
    avoiding hard-coded element types and making the code more resilient
    to future type changes.
  - Dropping the redundant NULL checks before devm_kfree(), as
    devm_kfree() safely handles NULL pointers.

The functional behaviour in the successful initialisation path remains
unchanged, while the error handling becomes simpler and less
error-prone.

Reviewed-by: fanggeng <fanggeng@lixiang.com>
Signed-off-by: Liang Jie <liangjie@lixiang.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

So the buggy code is NOT in 6.12 or older LTS trees (as expected, since
it was added in 6.15). This fix is only relevant for 6.15+ stable trees.

### 7. Verification Summary

**Verification:**
- Read the current file (`mtk-eint.c` lines 520-622) — confirmed the
  buggy `devm_kmalloc()` calls at lines 547, 551, 555 and the error path
  at lines 598-606 that iterates over uninitialized entries.
- `git log` confirmed `3ef9f710efcb5` ("Add EINT support for multiple
  addresses") introduced the multi-base code with `nbase`, the loop, and
  the error path — landed in v6.15.
- `git tag --contains 3ef9f710efcb5` confirmed it's in `p-6.15`,
  `p-6.16`, `p-6.17`.
- `git log --oneline v6.18.12` confirmed the buggy commit is present in
  the 6.18.y stable tree.
- `git log --oneline v6.12` confirmed the buggy code is NOT in 6.12 or
  older LTS trees (not applicable for those).
- Verified the error path: loop at line 599 iterates `0..nbase-1`, but
  if allocation fails at index `k`, indices `k+1..nbase-1` have
  uninitialized pointer entries — confirmed in pre-patch code.
- `devm_kfree(NULL)` is safe (no-op) — confirmed by kernel API
  convention.
- The patch is self-contained; no other patches are needed as
  dependencies.

### 8. Conclusion

This commit fixes a real bug: **use of uninitialized memory in the error
path** of `mtk_eint_do_init()`. When memory allocation fails partway
through a loop, the cleanup code passes uninitialized (garbage) pointer
values to `devm_kfree()`, which can trigger `WARN_ON()` in
`devres_destroy()` and potentially cause memory corruption.

The fix is small, surgical (3 `devm_kmalloc` → `devm_kcalloc` changes +
removal of now-redundant NULL checks), well-understood, reviewed by a
maintainer, and carries minimal risk. It only affects the error path —
the successful path is functionally unchanged. The buggy code exists in
stable trees 6.15+.

**YES**

 drivers/pinctrl/mediatek/mtk-eint.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index c8c5097c11c4d..2a3c04eedc5f3 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -544,24 +544,32 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 		}
 	}
 
-	eint->pin_list = devm_kmalloc(eint->dev, eint->nbase * sizeof(u16 *), GFP_KERNEL);
+	eint->pin_list = devm_kcalloc(eint->dev, eint->nbase,
+				      sizeof(*eint->pin_list), GFP_KERNEL);
 	if (!eint->pin_list)
 		goto err_pin_list;
 
-	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	eint->wake_mask = devm_kcalloc(eint->dev, eint->nbase,
+				       sizeof(*eint->wake_mask), GFP_KERNEL);
 	if (!eint->wake_mask)
 		goto err_wake_mask;
 
-	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	eint->cur_mask = devm_kcalloc(eint->dev, eint->nbase,
+				      sizeof(*eint->cur_mask), GFP_KERNEL);
 	if (!eint->cur_mask)
 		goto err_cur_mask;
 
 	for (i = 0; i < eint->nbase; i++) {
-		eint->pin_list[i] = devm_kzalloc(eint->dev, eint->base_pin_num[i] * sizeof(u16),
+		eint->pin_list[i] = devm_kzalloc(eint->dev,
+						 eint->base_pin_num[i] * sizeof(**eint->pin_list),
 						 GFP_KERNEL);
 		port = DIV_ROUND_UP(eint->base_pin_num[i], 32);
-		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
-		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
+		eint->wake_mask[i] = devm_kzalloc(eint->dev,
+						  port * sizeof(**eint->wake_mask),
+						  GFP_KERNEL);
+		eint->cur_mask[i] = devm_kzalloc(eint->dev,
+						 port * sizeof(**eint->cur_mask),
+						 GFP_KERNEL);
 		if (!eint->pin_list[i] || !eint->wake_mask[i] || !eint->cur_mask[i])
 			goto err_eint;
 	}
@@ -597,12 +605,9 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 
 err_eint:
 	for (i = 0; i < eint->nbase; i++) {
-		if (eint->cur_mask[i])
-			devm_kfree(eint->dev, eint->cur_mask[i]);
-		if (eint->wake_mask[i])
-			devm_kfree(eint->dev, eint->wake_mask[i]);
-		if (eint->pin_list[i])
-			devm_kfree(eint->dev, eint->pin_list[i]);
+		devm_kfree(eint->dev, eint->cur_mask[i]);
+		devm_kfree(eint->dev, eint->wake_mask[i]);
+		devm_kfree(eint->dev, eint->pin_list[i]);
 	}
 	devm_kfree(eint->dev, eint->cur_mask);
 err_cur_mask:
-- 
2.51.0


