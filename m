Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912BDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 01:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4YM72d+3vvKBX33LqPIYVwG7wT+BSBvsVhOQN9wlUw=; b=di8EtxRCAdd7nx599GEI42HKsN
	bzTXbj9QD2800AhZRizC9igqVYdrVXil+US7BkBo1RhfIl1aUx3Ft6VJ2oo+/JOQbQA4a/CX01z1M
	DLsy7f9c1+5eCUwOPwJwPdaOWjrtPg9T7pf/Fh/5eqO+wjCB99Ecw57K5fQ48OvEbWcLK+vxxd8ar
	VpWkFgI8fTSRfC5Te+1PQYSfso/7WuoOrK73MhkH14ajHyKpF+jv/lgKxIAtgYnt+x/sbO73LzDSj
	7QDkRlwoYqrQdX26Z5NAhU/VIl9fYW2KNSUuGfa28k5Xn/JVbdYB9iwb2BOOduIHHBX2FoyndGxuP
	yV9ZMZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLtgT-00000006RMu-43ol;
	Mon, 02 Jun 2025 01:09:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLsKj-000000069v7-3X13;
	Sun, 01 Jun 2025 23:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U4YM72d+3vvKBX33LqPIYVwG7wT+BSBvsVhOQN9wlUw=; b=RavcnwDbzuPesL/0V/ViFc/Aa8
	NoPGDYzOgFnu60u6oXiIS/dbSfzVgYEjBEpNYjVahYk9D+NUpgxtbLZea+YV2Yiv+K+xMV+hZ/zdx
	GVyDsAvFv4+Nrnlxpp2bIfBpDQRMrvADlqTpwQ/DcbI+oCKQ9QJqRUiPYBnCP8hcwH0ejI+a5MJy+
	MGxLY1btxwrWeQSCbgkTAmzWKcpv/2GpFlIRlyHUYb1aTayQ3DMkABAbC9Y1QOGoeoqaQHoD/XgrO
	UHZwctgsaY9Jr9lyQJIDgoh/9/kI4h6ajSAAhWGiLaxMsFZUhyzbtMWZPf6f07gZWIuA3dcX31RTA
	gyohx3dA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLsKf-00000000Yfw-3GVB;
	Sun, 01 Jun 2025 23:43:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AB5D5C4AA3;
	Sun,  1 Jun 2025 23:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377D0C4CEEE;
	Sun,  1 Jun 2025 23:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821392;
	bh=8uGsla5TvHMV3zZ2Wv57F0Ctt5dM81m+Wcig2EZrqLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFQ+7SZLTLjg9djpOSHgdw1oQApKJ4fvAHPxhQIJZZa0EXR/y3KFBl8hDTQbnyRXZ
	 QHAMmGWQHXeZDMuWC4NKzgPjC2clkvk0yjBok8ADjBAbazHJwOBEgGTv0yCdsdmWdC
	 FtVZXLMui1xKvNeOfBl32zoo5JKQD0k47V390AdW7W68R2/5zHFs4YdJRyOWy5att6
	 6Wc9VgzJ7blntdrEAe3+/bLPX6XR/auapamiR/KA5n5PdDwTuTrcV3AHvqrBiscc0N
	 jEkGhTpW5Z8k5t6lfahL6b/clWDnyinyvuanm5s38KUiJN1QBUY7XAHGm0Whj64DKa
	 mGOb7LKcB0SzQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 20/43] media: rkvdec: h264: Use bytesperline and buffer height as virstride
Date: Sun,  1 Jun 2025 19:42:00 -0400
Message-Id: <20250601234224.3517599-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234224.3517599-1-sashal@kernel.org>
References: <20250601234224.3517599-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_004315_145931_8423154A 
X-CRM114-Status: GOOD (  14.30  )
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

From: Jonas Karlman <jonas@kwiboo.se>

[ Upstream commit d5e0aa61470c48ddc04d433a00e79cef8716377a ]

Use bytesperline and buffer height to calculate the strides configured.

This does not really change anything other than ensuring the
bytesperline that is signaled to userspace matches what is configured
in HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

### Key Reasons for NO Backport: 1. **Not a Bug Fix**: The commit
message explicitly states "This does not really change anything other
than ensuring the bytesperline that is signaled to userspace matches
what is configured in HW." This is not fixing a functional bug but
rather improving consistency between userspace and hardware
configuration. 2. **Code Quality/Consistency Improvement**: The changes
are primarily about code correctness and consistency rather than fixing
a critical issue that affects users. This aligns with similar commits
#1, #2, and #4 which were marked as NO for backporting. 3. **Staging
Driver**: The rkvdec driver is in `drivers/staging/media/`, which
indicates it's still under development and not considered stable.
Staging drivers typically have more relaxed backporting requirements. 4.
**Specific Code Changes Analysis**: - **Before**: `hor_virstride =
(sps->bit_depth_luma_minus8 + 8) 0001-Fix-Clippy-warnings.patch
0002-Enhance-inference-prompt-to-utilize-CVEKERNELDIR-whe.patch
0003-Update-to-latest-version-of-clap.patch Cargo.lock Cargo.toml
LICENSE README.md adreno_acd_support_analysis.md
amd_display_ips_sequential_ono_backport_analysis.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
drm_bridge_analysis.txt drm_format_helper_24bit_analysis.md
drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md
intel_ipu6_constify_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt verisilicon_av1_4k_analysis.md dst_fmt->width / 8;` -
**After**: `hor_virstride = dst_fmt->plane_fmt[0].bytesperline;` -
**Before**: `ver_virstride = round_up(dst_fmt->height, 16);` -
**After**: `ver_virstride = dst_fmt->height;` 5. **No Risk Indication**:
The changes don't indicate they're fixing crashes, data corruption,
security issues, or other critical problems that would warrant stable
backporting. 6. **Pattern Match with Similar Commits**: Looking at the
provided examples: - Similar commits #1, #2, #4, and #5 that make
stride/calculation improvements were marked as NO - Only commit #3 that
increased max supported height (a clear functional limitation fix) was
marked as YES 7. **No Stable Tree Mention**: The commit message contains
no indication of stable tree inclusion via Fixes: tags or explicit
stable tree requests. ### Conclusion: This commit improves code
consistency by using the actual bytesperline values from userspace
instead of calculating them from SPS parameters, but it doesn't fix a
user-impacting bug. It's a code quality improvement that follows the
pattern of other NO-backport commits in the provided examples.

 drivers/staging/media/rkvdec/rkvdec-h264.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 438252fa19441..46e01037b7112 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -907,9 +907,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	dma_addr_t rlc_addr;
 	dma_addr_t refer_addr;
 	u32 rlc_len;
-	u32 hor_virstride = 0;
-	u32 ver_virstride = 0;
-	u32 y_virstride = 0;
+	u32 hor_virstride;
+	u32 ver_virstride;
+	u32 y_virstride;
 	u32 yuv_virstride = 0;
 	u32 offset;
 	dma_addr_t dst_addr;
@@ -920,16 +920,16 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	f = &ctx->decoded_fmt;
 	dst_fmt = &f->fmt.pix_mp;
-	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
-	ver_virstride = round_up(dst_fmt->height, 16);
+	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
+	ver_virstride = dst_fmt->height;
 	y_virstride = hor_virstride * ver_virstride;
 
 	if (sps->chroma_format_idc == 0)
 		yuv_virstride = y_virstride;
 	else if (sps->chroma_format_idc == 1)
-		yuv_virstride += y_virstride + y_virstride / 2;
+		yuv_virstride = y_virstride + y_virstride / 2;
 	else if (sps->chroma_format_idc == 2)
-		yuv_virstride += 2 * y_virstride;
+		yuv_virstride = 2 * y_virstride;
 
 	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
 	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |
-- 
2.39.5


