Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BC1FDEE35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtrpquAwtsrsvtTa3d3BBjidZ+2a5SpOPKVQyVq0bEc=; b=LE9cjOafE7ERXDp5HwM72rfgNf
	Wosv7TL+tFRnvd0QaLwLIx6io20+A94L2wjDGdU6hmyITsZODcrCZVmyM+c8Tbwi2EGfExcijvk2B
	e9NT9gvvQwnF4q1hlsOuEOFUZ1gpz4BhYPjz4sqk2mSj/Y+CEMjLBIYVjNXFDMXPg6YA3J8BDaZPP
	U6mAqSjmntewU6Z5wD5KYOts/UVH6ExmTOXfslRjVezjVbJErPfPbJ5HIfdVXb4fprwtApWqleGVY
	kqVcZD7fKXFIyiZeMdItAnHSrgVYBSf6JYPwza/kKXth6Negg6C8dVc3LLQv6YEli4vKWtUnouDWw
	oiCD0F8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmT-0000000C2R5-0nud;
	Thu, 23 Apr 2026 17:24:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmQ-0000000C2OI-379U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33E7761119;
	Thu, 23 Apr 2026 17:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3892BC2BCB4;
	Thu, 23 Apr 2026 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965037;
	bh=opSPYP8vrEcfC+ep0LCq7BxX+8CG6gyOiB90BHHWtWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tYfsUpPTQkS3+AvZMTyXpSb5X0BnxIuTVqgw3TuZhQrNB+AcjNIe8THmB9w76FwK1
	 255MCs1y5iLIiarhivH1t0rlHbvxUzXWPl5PIkXjV6Uxixl7NBBAOFD6glnrD3sv29
	 2zx6M4omFLg8axTsvFs6f33aT+uJSVotkZk+KucSeEthsMj7z7QJBFvF0fMUFSTDzL
	 IikkI5V4PbIVF7xj6clTEt56lQwnihoJ8dyIAVupDv796MzXie8urYVqx9EN3l7/Zr
	 zGhvwyC6uqIbsr58txQEBiXX92laYk6JH3Q9F9ZS1sFE7+4C3p50Dcbtd3CKO+58+H
	 aQ3m/LJZ64WyA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 23 Apr 2026 18:22:58 +0100
Subject: [PATCH 8/8] firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS
 copies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-ffa_fixes-v1-8-61189661affe@kernel.org>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
In-Reply-To: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
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
 drivers/firmware/arm_ffa/driver.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 40ade6edcf33..4bb86eb721cd 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -336,7 +336,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 
 	do {
 		__le64 *regs;
-		int idx;
+		int idx, nr_desc, buf_idx;
 
 		start_idx = prev_idx ? prev_idx + 1 : 0;
 
@@ -354,15 +354,25 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
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


