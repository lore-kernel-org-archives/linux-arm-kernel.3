Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB0E63F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9/A3nm8ebwk0hpiOjk0HmpMPgkuqBHPXXmOMKSTbeo=; b=q7rAQCozTYfQMEOEXrhOE5wU+5
	re/9RjooCWokz5ygKMrIwRhwRm4u1QWu2j9U0HD/kEc68gwsIP0IWa3sghGNWlLIDLCnnFTZ5SSEt
	VZpz4j6WzOSM6ioLhpPx+DSIcIATHaQKwWoOLBdxCTk2vuVQjO+qRhfkuPCkJ3UMSk6Yc5lfrFv9A
	HP03TdYYRr4gaxJxZHNXro59H1mHoZNyMLumQDwVuTYnFwseSXbYskqOW+Cdg+OiUaYJXMCljlxnO
	0n0ndjpNVTmIEXalSTsKxEc0o+21vQE2eD54lSFzr3eFlT9ZUKhaaPfwFB4g0WTkG1jGVlZpv4299
	BUgieYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrg7d-00000005Yl3-1Iy6;
	Sun, 15 Feb 2026 17:41:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrg7b-00000005Ykn-3yv9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 17:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F413A60146;
	Sun, 15 Feb 2026 17:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B274AC4CEF7;
	Sun, 15 Feb 2026 17:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771177286;
	bh=Onj3uK0+DVYfeYgAG9nSvweyD5qgloOkVKT5YJbRa88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PaCVE5xq+92K01+7EwCkIRF+/yWgvGM0mI3lN3csy2e+BVpuIg0Rz6V+CIBohWFNX
	 1N69IBrN+cgcPcjLKEPj0/sv2IWsNNYoMT/Akz228fze4o5HCAtqSpPlHi+mFo64Hk
	 uCpGITm3IsQ3Ko01DonmGKiSbVrnen1hPYToU1VBLdZnmUI1W3Bse8nG6KpM15wUBP
	 sLbV+ri1twVD/goNf3gd8X8KfieW6AxvRv2qNODjuWjvUaRsQib6aIRlK8E+lFBSL4
	 reqtbCNSWL6Dpp4xPQ1HZ9wEhQICRZlaJUWDG9WInRBn5Yn2WCEq6RHeC7o7VjcjRb
	 u2KgBz301B98w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	Frank.Li@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.1] mailbox: imx: Skip the suspend flag for i.MX7ULP
Date: Sun, 15 Feb 2026 12:41:12 -0500
Message-ID: <20260215174120.2390402-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215174120.2390402-1-sashal@kernel.org>
References: <20260215174120.2390402-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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

From: Jacky Bai <ping.bai@nxp.com>

[ Upstream commit 673b570825ace0dcb2ac0c676080559d505c6f40 ]

In current imx-mailbox driver, the MU IRQ is configured with
'IRQF_NO_SUSPEND' flag set. So during linux suspend/resume flow,
the MU IRQ is always enabled. With commit 892cb524ae8a ("mailbox: imx:
fix wakeup failure from freeze mode"), if the MU IRQ is triggered after
the priv->suspended flag has been set, the system suspend will be
aborted.

On i.MX7ULP platform, certain drivers that depend on rpmsg may need
to send rpmsg request and receive an acknowledgment from the remote
core during the late_suspend stage. Early suspend abort is not
expected, and the i.MX7ULP already has additional hardware and
software to make sure the system can be wakeup from freeze mode
correctly when MU IRQ is trigger.

Skip the 'suspend' flag handling logic on i.MX7ULP to avoid the
early abort when doing suspend.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I understand the full picture:

1. Commit 892cb524ae8a added `priv->suspend` flag and
   `pm_system_wakeup()` call in the ISR to handle freeze mode wakeup.
2. `pm_system_wakeup()` aborts the ongoing suspend process.
3. On i.MX7ULP, during `late_suspend`, drivers send rpmsg to the remote
   core and expect a response. This triggers the MU IRQ, which in turn
   calls `pm_system_wakeup()` and aborts suspend — an undesirable
   behavior on this platform.
4. The fix adds a per-platform flag `skip_suspend_flag` to skip the
   suspend flag logic for i.MX7ULP, which has its own hardware
   mechanisms for handling wakeup.

### Stable Kernel Assessment

**Bug severity**: This is a **suspend failure** on i.MX7ULP — the system
cannot properly enter suspend/freeze mode. This is a significant
functional regression for i.MX7ULP users caused by commit 892cb524ae8a.

**Fix quality**:
- Small, contained (adds 1 bool field + 1 config line + 2 conditional
  checks)
- Platform-specific — only affects i.MX7ULP; all other platforms are
  unchanged
- Low regression risk — it simply disables a feature that was causing
  problems on this specific platform
- Reviewed by Peng Fan (NXP maintainer)

**Fits stable criteria**:
- Fixes a real bug (suspend failure)
- Small and contained
- Obviously correct
- Platform-specific quirk/workaround — this falls squarely in the
  "hardware quirk" category

**Dependencies**: Requires commit 892cb524ae8a ("mailbox: imx: fix
wakeup failure from freeze mode") to be present. That commit is in
v5.18+, so applicable stable trees (6.1.y, 6.6.y, 6.12.y) all have it.

**Risk**: Very low. The change only affects the i.MX7ULP platform and
simply skips suspend flag logic that was causing problems. If the bool
field is false (default for all other platforms), behavior is completely
unchanged.

### Verification

- **git show 892cb524ae8a**: Verified that commit introduced the
  `priv->suspend` flag and `pm_system_wakeup()` call in `imx_mu_isr()`,
  confirming the mechanism described in the commit message.
- **git tag --contains 892cb524ae8a**: Confirmed the prerequisite commit
  is in v5.18+, so all active LTS trees (6.1.y, 6.6.y, 6.12.y) contain
  it.
- **git tag --contains 673b570825ace**: Confirmed the commit under
  review is post-v6.19 (in development tree).
- **Grep for `priv->suspend`**: Verified the ISR check at line 564 —
  when suspend flag is set and MU IRQ fires, `pm_system_wakeup()` is
  called, which aborts suspend.
- **Code review of diff**: Verified only i.MX7ULP config gets
  `skip_suspend_flag = true`; all other platform configs default to
  false (zero-initialized), so behavior is unchanged for non-i.MX7ULP
  platforms.
- **Unverified**: Cannot directly verify user reports of suspend failure
  on i.MX7ULP, but the commit message clearly describes the mechanism
  and the author is from NXP (the SoC vendor).

### Conclusion

This is a platform-specific hardware workaround that fixes suspend
failure on i.MX7ULP. It's small, well-scoped, reviewed by the subsystem
maintainer, and has essentially zero regression risk for other
platforms. It fits the "hardware quirk" exception category for stable
backports. The prerequisite commit exists in all active LTS trees.

**YES**

 drivers/mailbox/imx-mailbox.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 6778afc64a048..003f9236c35e0 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -122,6 +122,7 @@ struct imx_mu_dcfg {
 	u32	xRR;		/* Receive Register0 */
 	u32	xSR[IMX_MU_xSR_MAX];	/* Status Registers */
 	u32	xCR[IMX_MU_xCR_MAX];	/* Control Registers */
+	bool	skip_suspend_flag;
 };
 
 #define IMX_MU_xSR_GIPn(type, x) (type & IMX_MU_V2 ? BIT(x) : BIT(28 + (3 - (x))))
@@ -988,6 +989,7 @@ static const struct imx_mu_dcfg imx_mu_cfg_imx7ulp = {
 	.xRR	= 0x40,
 	.xSR	= {0x60, 0x60, 0x60, 0x60},
 	.xCR	= {0x64, 0x64, 0x64, 0x64, 0x64},
+	.skip_suspend_flag = true,
 };
 
 static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp = {
@@ -1071,7 +1073,8 @@ static int __maybe_unused imx_mu_suspend_noirq(struct device *dev)
 			priv->xcr[i] = imx_mu_read(priv, priv->dcfg->xCR[i]);
 	}
 
-	priv->suspend = true;
+	if (!priv->dcfg->skip_suspend_flag)
+		priv->suspend = true;
 
 	return 0;
 }
@@ -1094,7 +1097,8 @@ static int __maybe_unused imx_mu_resume_noirq(struct device *dev)
 			imx_mu_write(priv, priv->xcr[i], priv->dcfg->xCR[i]);
 	}
 
-	priv->suspend = false;
+	if (!priv->dcfg->skip_suspend_flag)
+		priv->suspend = false;
 
 	return 0;
 }
-- 
2.51.0


