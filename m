Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFA4C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 00:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuSjtX7RqaQsP9IR8t8kf+jNZl5aY0Yd7DEgrOoMc/Y=; b=vzg7YSdf3vrv3No0yk4gVDQj0H
	tmBWSYQdnAMrbo2XarHlw3GUb2lFRrv9KtBFQr5KwcAIUgNCXXe9lTJOkZT1zk7PfsCoT8BbZDU7k
	fxmy231cMs8Aj3h0vBNRcjDtMrd6p2Jn7eVmZdGgzHRcDRA5BR2mihgfsHhDp6A5zlznw5wYyluOk
	wnBeYKAVe838zX0w6UE9CdFOqvCZxDHxq3kkquNLzDphqNaH52t1TrVaGab6/seDKKcagVXlVx25i
	z6e56WdbTvoW00IQuW/2sZrzm5UhS9O9PKAyXTTey8MuNklzXuQwNOFVbinnp/rw09OSONHJ+g5Sx
	Oli399Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLsh2-00000006ELW-2FD7;
	Mon, 02 Jun 2025 00:06:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLs9d-000000066xF-2Or9;
	Sun, 01 Jun 2025 23:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cuSjtX7RqaQsP9IR8t8kf+jNZl5aY0Yd7DEgrOoMc/Y=; b=BmCegw0foVlmFX4H2hQY09wxUs
	GOl//6OogaW1A3hDBFWyE4c/shaNhBObqifp1pHGZMembf5tQf66RnmN0lWu3v98hmkGundePCs89
	it+NCpw0okWy/xsZlGWlaPTabpsRdasHiS85D9iAkqRzDLDE2vORWHc+vDIt88aHaxHNk4AEUgJ5N
	D6l0OVk0cjBQWWL7PbGvtf3nQeoUpyLsU0Ixgj4Veg/VNg8zRETIqvlnIRnMKQvawkTjCeqMbNZ1a
	8dFkdnocVjs0l4hI7fZUwTNJRNK/7ZnA0QBBCGLjv61EPbuVol6yiBoeuNeZGW9RDohsZJS42V7Wr
	C7ITFSqg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLs9Z-00000000XuD-3rEH;
	Sun, 01 Jun 2025 23:31:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F09B5C5705;
	Sun,  1 Jun 2025 23:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD329C4CEE7;
	Sun,  1 Jun 2025 23:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820704;
	bh=XYrRtZuOVTeI0fAa5/NfJJQDvr7rpN7tbXz6hxJSzwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rEkxfPr0250cf2O0FJK+m8nZTOYnAhlC5J5r+yfJGMWzWW1fSb59Tt0RDv7two/mX
	 +pC5Vf6Q65x0kK1+n4QgS6fOdjPKKzyyXfQPVc+K5/PmQhz6aCXe61EvjWwySg2L1F
	 dLPI7sjYmcYJUMUcwxtJVRyBtYMRyoj+1mIl63vB5DlAeeeOE0uJxam7Gm7HHk2oqd
	 xwHKhxeWfuBOc9pccz8/VW5JhTJypWVWhpiV9l5WkJiIbgNvvHeNv3WF2KlG68NBh8
	 NmtOmFXXkPrEOaq7CZhtyPL4BR6e+vrgFLnypJvzftlF9t2TFAu4A8jOk31olWpdY2
	 SAoYF6lOzHgxA==
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
Subject: [PATCH AUTOSEL 6.14 049/102] media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
Date: Sun,  1 Jun 2025 19:28:41 -0400
Message-Id: <20250601232937.3510379-49-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_003146_793701_08CD02DD 
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


