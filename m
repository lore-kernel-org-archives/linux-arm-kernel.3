Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D52DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 23:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuSjtX7RqaQsP9IR8t8kf+jNZl5aY0Yd7DEgrOoMc/Y=; b=eVo7zJJ5zZ/iYmaVv2HpXH9O1e
	c4pu25WcKzJci68nIvWq3PYmerSMpwkn8K3akYlGFTsYW9bCuB4oejHifE3LnSDTykn2MaQroUs8K
	urUcQeyk/s7b6HKTR0JGXqrg9rmrCuPCQZiBnyUBYIN4ajL92HTP5M4etgKcYOL1l8HyltYrjHTLQ
	lvCfxaALWePhHDcGNFwaMAMvmde6SLX2z24NVFC+UXWmY/iGRjXPsMbiFeeRvCUcStWk7vk6LDD1k
	AAEzjyAklKOugVWg1JflMtYSVuDS4Zk2v2XIkuWKvuS4dojqptrIh1yTIZB/9JIejrsuWmVyDZ8NB
	GEoSCW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLsHg-000000068z9-1vdb;
	Sun, 01 Jun 2025 23:40:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLs58-0000000661E-2xvs;
	Sun, 01 Jun 2025 23:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cuSjtX7RqaQsP9IR8t8kf+jNZl5aY0Yd7DEgrOoMc/Y=; b=ZAlq83xuqfcwwvt4cFmd3O7WdF
	DTOaXECebGPRZHnx6Aiv/GGR4dItzvNN9XNzq0zrLU51RkMI1LThTRQ9HwFxZt3auFev0MVSUiRSM
	YMU4XNxLvgh7EbBwV7ohtf1pmW2OSipGiG0iuBvtPGp40G4PSJ3rp+UDb7mOhoJVGB9SAAk2Kn/ct
	plVXvhOXI6wVEkV9j23WFzx98Y9cRkojfVJ53EpMxW2V4t9v7X/pbQpzfwYBdvvvFtWJN5er7U2/m
	macqIvE2PIdisJ+bWr5tU1Sx1GQuS38/xnVoBVNuiJJc6YYm7zjFQb0codRz+HsR8Iw+ZmKkxfM5H
	xMDyJtwQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLs52-00000000XKp-2FKw;
	Sun, 01 Jun 2025 23:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47F925C4D46;
	Sun,  1 Jun 2025 23:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA53C4CEE7;
	Sun,  1 Jun 2025 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820422;
	bh=XYrRtZuOVTeI0fAa5/NfJJQDvr7rpN7tbXz6hxJSzwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fLtWAp+GzUKmCqwKUPel/MWvXfrGz/8HpR8rMlCvpMSKtfOrGGMn9p1COBr1JGdnK
	 anznK1BQXrCUscJz7OK9UrKKeI+xDWpHrT3o8Glj6zLPIV8Tar+SVtUCm9uIKmKa9x
	 pd4ktvqxTbtqyx6QSlgEUxAbiohruyuzB9qG4Mt7VXcK0xsdluQ49FI9YCIK1EZ0FE
	 wvxMzq4jPUEXwFszXDzMqwM6DKw7f0p/YQDXiDhj1mFCFTlL9HxSC4T+PoJMBUfL5d
	 Qo3fHXjgCGNFYPl1VSoRGP3FhPbQL0UtUOxUOyatHXIROX9mYixh/MsEPuqWPismkr
	 uRMChrckUtfeA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 053/110] media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
Date: Sun,  1 Jun 2025 19:23:35 -0400
Message-Id: <20250601232435.3507697-53-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_002704_939973_C20E1FEE 
X-CRM114-Status: GOOD (  16.04  )
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

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit 5edc9b560f60c40e658af0b8e98ae2dfadc438d8 ]

Fix gcc8 warning:

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Resizing the 'buf' and 'cmd' arrays fixed the warning.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

NO This commit should not be backported to stable kernel trees for the
following reasons: 1. **Non-critical compiler warning fix**: This commit
addresses a `-Wformat-truncation` compiler warning, which is a build-
time warning and not a runtime bug that affects users. The warning
indicates potential string truncation, but looking at the code, there's
no evidence this causes actual runtime failures or security
vulnerabilities. 2. **Consistent with similar commit patterns**: Looking
at the reference commits, all the similar format-truncation warning
fixes (commits #1, #2, #3, and #5) were marked as "Backport Status: NO".
Only commit #4 was marked "YES", but that one explicitly included "Cc:
stable@vger.kernel.org" in the commit message and had a "Fixes:" tag,
which this commit lacks. 3. **Missing stable tree indicators**: The
commit message contains no "Cc: stable@vger.kernel.org" tag and no
"Fixes:" tag pointing to a specific problematic commit that introduced a
user-facing issue. 4. **Minor code quality improvement**: The changes
are purely preventive: - `char buf[CEC_MAX_MSG_SIZE 0001-Fix-Clippy-
warnings.patch 0002-Enhance-inference-prompt-to-utilize-CVEKERNELDIR-
whe.patch 0003-Update-to-latest-version-of-clap.patch Cargo.lock
Cargo.toml LICENSE README.md adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md 3 + 1];` becomes `char
buf[(CEC_MAX_MSG_SIZE - 1) 0001-Fix-Clippy-warnings.patch 0002-Enhance-
inference-prompt-to-utilize-CVEKERNELDIR-whe.patch 0003-Update-to-
latest-version-of-clap.patch Cargo.lock Cargo.toml LICENSE README.md
adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md 3 + 1];` - `char
cmd[CEC_MAX_MSG_SIZE 0001-Fix-Clippy-warnings.patch 0002-Enhance-
inference-prompt-to-utilize-CVEKERNELDIR-whe.patch 0003-Update-to-
latest-version-of-clap.patch Cargo.lock Cargo.toml LICENSE README.md
adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md 3 + 13];` becomes `char
cmd[sizeof(buf) + 14];` These changes slightly reduce buffer sizes to
better match actual usage patterns, but there's no indication the
original sizes caused buffer overflows or other runtime problems. 5.
**Media subsystem and driver-specific**: This affects a specific USB CEC
adapter driver (`extron-da-hd-4k-plus`), making it a relatively isolated
change that doesn't impact core kernel functionality or multiple
subsystems. 6. **No user-reported issues**: There's no mention of user
reports, bug fixes, or functional improvements - only compiler warning
suppression. The stable kernel tree rules prioritize important bug fixes
with minimal regression risk. This commit, while technically correct,
falls into the category of code quality improvements rather than
critical fixes that users would benefit from in stable releases.

 .../media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67..41d019b01ec09 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1002,8 +1002,8 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				    u32 signal_free_time, struct cec_msg *msg)
 {
 	struct extron_port *port = cec_get_drvdata(adap);
-	char buf[CEC_MAX_MSG_SIZE * 3 + 1];
-	char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
+	char buf[(CEC_MAX_MSG_SIZE - 1) * 3 + 1];
+	char cmd[sizeof(buf) + 14];
 	unsigned int i;
 
 	if (port->disconnected)
-- 
2.39.5


