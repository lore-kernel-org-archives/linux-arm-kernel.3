Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCBFEF586E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5plnKFyC/vjHQ7I0zGiL3OzcbdKlPLy8GxWgUJXlcQ=; b=4Qr13RjnUB/h6Uw7SlrZjqBP41
	msrhyRo+bD/7elCkgwixWzdTq4dhvFSNphKc3KKCmkXY/ddW6RehItq2VadudDDhXw4YlbMQctemd
	ph4ASuYKurDJ8lgkvSGq8fseGsl4sMcK+B8XP7KDOh5IYn6b8s8KrExcSmOdsPXNPelhLByUEUOcD
	9FPEUTJxoCM/rosHZUu9JB6GXVMg/JbCUhYk40OmbkS3TIwlqdQiicALc1O5+RVtbF+hrm/9wGRzu
	hGdByBq8zzboIubz581NP+qMVqPGEklMEfbW4B0j7Bq+slhzwAuTEfMTE3Gmp1aN6/x/3tGn9o2bg
	4qSs11Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrdev-00000005SBt-3iid;
	Sun, 15 Feb 2026 15:03:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrdet-00000005SBb-3LE0;
	Sun, 15 Feb 2026 15:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77FF560008;
	Sun, 15 Feb 2026 15:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36BAC4CEF7;
	Sun, 15 Feb 2026 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771167818;
	bh=ALJQ6v0jihErAld2wDaIVC7Dc1Pu90VzccUmQjBo3qE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SnD4l3f95hoKZ/Qa9q6GeL+aHkkQKVGQWYcFSumWEgq764zoOJ+SDty/oFEzQOMYl
	 lSM3cEflzIPYKNXUptUEOm3DlLfAonrrD6hxii/Vz95CXvLTu//U46YAHR2Vc9Cls5
	 4n6DrSkRYbsSpscFIsDngHW/KOAxCoy9GBRWHFezHLSJrjnfzAnoEaIppTare5prrM
	 57vm27zFvAnmjZx/0eH/CbGKvSPqpcbSy4DaVWwVXj3q57LZF4LpkjDG4JL8mFJonC
	 FbPDZj8zapFhj9fzpbEYFua19kRVE8XXhciHFMChAQAWHAzjjJ0N4HHJvVw9uM8fg6
	 JTwGGwMHJgF0A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Keita Morisaki <keita.morisaki@tier4.jp>,
	Peter Wang <peter.wang@mediatek.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	chaotian.jing@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.12] scsi: ufs: mediatek: Fix page faults in ufs_mtk_clk_scale() trace event
Date: Sun, 15 Feb 2026 10:03:19 -0500
Message-ID: <20260215150333.2150455-2-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215150333.2150455-1-sashal@kernel.org>
References: <20260215150333.2150455-1-sashal@kernel.org>
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

From: Keita Morisaki <keita.morisaki@tier4.jp>

[ Upstream commit 9672ed3de7d772ceddd713c769c05e832fc69bae ]

The ufs_mtk_clk_scale() trace event currently stores the address of the
name string directly via __field(const char *, name). This pointer may
become invalid after the module is unloaded, causing page faults when the
trace buffer is subsequently accessed.

This can occur because the MediaTek UFS driver can be configured as a
loadable module (tristate in Kconfig), meaning the name string passed to
the trace event may reside in module memory that becomes invalid after
module unload.

Fix this by using __string() and __assign_str() to copy the string contents
into the ring buffer instead of storing the pointer. This ensures the trace
data remains valid regardless of module state.

This change increases the memory usage for each ftrace entry by a few bytes
(clock names are typically 7-15 characters like "ufs_sel" or
"ufs_sel_max_src") compared to storing an 8-byte pointer.

Note that this change does not affect anything unless all of the following
conditions are met:

 - CONFIG_SCSI_UFS_MEDIATEK is enabled

 - ftrace tracing is enabled

 - The ufs_mtk_clk_scale event is enabled in ftrace

Signed-off-by: Keita Morisaki <keita.morisaki@tier4.jp>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Link: https://patch.msgid.link/20260202024526.122515-1-keita.morisaki@tier4.jp
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The `ufs_mtk_clk_scale` trace event was introduced in August 2022
(kernel 6.1 era), so this buggy code exists in multiple stable trees
(6.1.y, 6.6.y, and later).

### 8. CONCLUSION

This is a textbook stable backport candidate:
- **Fixes a real crash** (page fault / use-after-free on dangling
  pointer)
- **Extremely small and contained** (4-line change in one file)
- **Uses well-established patterns**
  (`__string()/__assign_str()/__get_str()`) that are the correct and
  standard approach
- **Zero risk of regression** — this is strictly more correct than the
  original code
- **Affected code exists in stable trees** dating back to at least 6.1
- **Reviewed and accepted** by the relevant maintainers
- **Self-contained** — no dependencies on other patches

The fix is small, surgical, and meets all stable kernel criteria.

**YES**

 drivers/ufs/host/ufs-mediatek-trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek-trace.h b/drivers/ufs/host/ufs-mediatek-trace.h
index b5f2ec3140748..0df8ac843379a 100644
--- a/drivers/ufs/host/ufs-mediatek-trace.h
+++ b/drivers/ufs/host/ufs-mediatek-trace.h
@@ -33,19 +33,19 @@ TRACE_EVENT(ufs_mtk_clk_scale,
 	TP_ARGS(name, scale_up, clk_rate),
 
 	TP_STRUCT__entry(
-		__field(const char*, name)
+		__string(name, name)
 		__field(bool, scale_up)
 		__field(unsigned long, clk_rate)
 	),
 
 	TP_fast_assign(
-		__entry->name = name;
+		__assign_str(name);
 		__entry->scale_up = scale_up;
 		__entry->clk_rate = clk_rate;
 	),
 
 	TP_printk("ufs: clk (%s) scaled %s @ %lu",
-		  __entry->name,
+		  __get_str(name),
 		  __entry->scale_up ? "up" : "down",
 		  __entry->clk_rate)
 );
-- 
2.51.0


