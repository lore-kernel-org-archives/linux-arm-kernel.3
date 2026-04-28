Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2593FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7z+e9b5EAA+4GDvW35J011HaPbEj0Xjf/f7NBCM+jg=; b=UcMou6+4qVbLbTvleDUO4DksI4
	01Sa4ajf2XLzcZwVzG/PXfCbDtQaoMgXJaqp9TBBf+zO+PvtHwx4Ldir20EwaqO9wDGbo1STjROUD
	Pebsqt4d1eLCp/M+iAhjscgpf30Omqgbx4L5Du6XjYXhyLf4taF5mQ0RDtbJczj6oebYJYmMiZGg8
	rT0wT+pRtNimYwRUdVAt3AyeDd1f5sH+h8EzcwinybCwucJ0+LCZ/uNBUMC2C1RYFOOO9kdqjCEwI
	FDwFRmeVauq93FlJMFQXNqT2t7tAfWvWk1cT53GCXSFwBaIiYIibGueHxzRbuX5ZR1dR9hq/Zlb+x
	ZHrcE9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnG1-000000025JT-0a98;
	Tue, 28 Apr 2026 18:34:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFt-000000025Ez-0hAJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A6F261146;
	Tue, 28 Apr 2026 18:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965CAC2BCB8;
	Tue, 28 Apr 2026 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401236;
	bh=uKgrQnOZus6OAzZhiHvILH5M6NPJd7sMeaofGDLCLAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qoVxNJ2d1Y90lQnZQX5s83RqE4eoHf4cu5jK6DiDnGcjR/Sb/1QkOMBcCr89uhpV3
	 czWRQyyTsPHOgWwGyyx5vNIOlPjAK2nJpMsEmXWOgfRYPb0Hz91SKYFPuGFstycjNa
	 AH3fCOTJLxOzeXRbitSZvfexKjPnZKrnUsmW3JCVh7QSGJYyQXGbGb2jhEQHVLFJMa
	 0/+Z3FjH56SJHB/RrQXl09iQInF8QI6sKazRk6PFvWlb4kF8GP/EHOubZ8NWdUFnRE
	 l3FM3xjpI5iHHvGqBTzw61nPJ+D+KBxSaYFw+ep+sCtzPfLxQyOX7muT2z5afIBVl7
	 EV29an1LxaPbg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:30 +0100
Subject: [PATCH v2 06/11] firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS
 copies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-6-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
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

The register-based PARTITION_INFO_GET path trusted the firmware-provided
indices when copying partition descriptors into the caller buffer.
Reject inconsistent counts or index progressions so the copy loop cannot
write past the allocated array.

Fixes: ba85c644ac8d ("firmware: arm_ffa: Add support for FFA_PARTITION_INFO_GET_REGS")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index a122814eb6d7..ed502486eb35 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -323,6 +323,12 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 #define PART_INFO_ID_MASK	GENMASK(15, 0)
 #define PART_INFO_EXEC_CXT_MASK	GENMASK(31, 16)
 #define PART_INFO_PROPS_MASK	GENMASK(63, 32)
+#define FFA_PART_INFO_GET_REGS_FIRST_REG	3
+#define FFA_PART_INFO_GET_REGS_REGS_PER_DESC	3
+#define FFA_PART_INFO_GET_REGS_MAX_DESC \
+	(((sizeof(ffa_value_t) / sizeof_field(ffa_value_t, a0)) - \
+	  FFA_PART_INFO_GET_REGS_FIRST_REG) / \
+	 FFA_PART_INFO_GET_REGS_REGS_PER_DESC)
 #define PART_INFO_ID(x)		((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
 #define PART_INFO_EXEC_CXT(x)	((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
 #define PART_INFO_PROPERTIES(x)	((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
@@ -336,7 +342,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 
 	do {
 		__le64 *regs;
-		int idx;
+		int idx, nr_desc, buf_idx;
 
 		start_idx = prev_idx ? prev_idx + 1 : 0;
 
@@ -354,15 +360,28 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			count = PARTITION_COUNT(partition_info.a2);
 		if (!buffer || !num_parts) /* count only */
 			return count;
+		if (count > num_parts)
+			return -EINVAL;
 
 		cur_idx = CURRENT_INDEX(partition_info.a2);
+		if (cur_idx < start_idx || cur_idx >= count)
+			return -EINVAL;
+
+		nr_desc = cur_idx - start_idx + 1;
+		if (nr_desc > FFA_PART_INFO_GET_REGS_MAX_DESC)
+			return -EINVAL;
+
+		buf_idx = buf - buffer;
+		if (buf_idx + nr_desc > num_parts)
+			return -EINVAL;
+
 		tag = UUID_INFO_TAG(partition_info.a2);
 		buf_sz = PARTITION_INFO_SZ(partition_info.a2);
 		if (buf_sz > sizeof(*buffer))
 			buf_sz = sizeof(*buffer);
 
 		regs = (void *)&partition_info.a3;
-		for (idx = 0; idx < cur_idx - start_idx + 1; idx++, buf++) {
+		for (idx = 0; idx < nr_desc; idx++, buf++) {
 			union {
 				uuid_t uuid;
 				u64 regs[2];

-- 
2.43.0


