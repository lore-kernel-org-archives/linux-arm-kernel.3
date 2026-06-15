Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4204FCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oavtcVs5GMUEYIHSjYOMZmbm65xOw75SXSw2tCo9C/Q=; b=4rZVZ5LxpOHP7wnRjxbXxJzKXF
	6wrrvnbqXqNS34/yrN3KktJ8Ql5CdDUX5k/qbMRSHXB/fLBSuC78LOyeBTnFQjjkp34Kk02QsnBDn
	Pn+4ww8TI+u7KjzUeNHlvEKgYRZST3WX44Iu/sJYXxv60ZXak56fKNhDOpGQ1M+i3+M+296qCjUXz
	eZh8uuVFwfSTB8gq0Dje3tnC4U9eOjAqwEhdJtqySoN8ns031qHiA/tbe8kCHuinAcA8QGv4z6AM7
	MFSyRivPp7tYMQXWt/f5Wx5c/7ZW4GzCMVB/slUknF/MSIhqy7qnRLazakPqsJ8rbQVMRmfcP/LTR
	F2O1XQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9tJ-0000000EXzt-129X;
	Mon, 15 Jun 2026 16:10:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9tI-0000000EXzT-0Bc5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:10:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAC1441A7F;
	Mon, 15 Jun 2026 16:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7051F00A3D;
	Mon, 15 Jun 2026 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539823;
	bh=oavtcVs5GMUEYIHSjYOMZmbm65xOw75SXSw2tCo9C/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ImWjuFDPO6Xe+bOe18Xx7H8FSwtJc2F8hOBS98xRCMXBXkpzCz/lPIN8oY0vJkH9A
	 h0jSfVJThF7ChGDW9k1EMfif+1OwATGLyDnRvRKbYdU491SJHdaFZn7XTwNpLKHnlO
	 if7h6jeFFp0EMeUKOomAVxsYo4fJw/z4wQcqopTD1XG42oBfRHV1r2NXEs+TBmzyQy
	 L8jWtwbITndX7YRP6tonb8C2ofQD01OUobSqj/MPogQRH9uBWU1A1XDkZ/H8eB8kT4
	 tJ1EMQPyp3xzhe+4a380wJH4IT/jL/NsPrkPF8ZARnMs/tWAW/PBdSHbqXOpRXVsY+
	 w8N0QtWoE97cg==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Mon, 15 Jun 2026 18:09:00 +0200
Subject: [PATCH 04/19] arm: define DPS root partition type UUID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-discoverable-root_partitions-v1-4-39c78fac42e2@kernel.org>
References: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
In-Reply-To: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=buQA0OLsJoBfvfUeMOaxxlJAmvEFctKXcDw8iTDomJw=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFkGylfu1+2t5847cU6x5rmgPENA1clQbvVX/pcec0hPe
 HzL9Mf2joksDGJcDJZiiizLyjm5FToKvcMO/bWEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 gQwdIwYuTgGY6v13GRnOXLGy+qLWd9aTZ6KNhelUtX/iP7jCUoMrw6v83oqeVPJj+KeQ/2yqyMa
 cZ0/k2IvYJ76beSFWZfPdsyePrZ+74//i8CcsAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

DPS [1] assigns GPT partition type UUIDs to operating system partitions.
Root partitions use architecture-specific type UUIDs so the OS can
discover the intended root filesystem without relying on a root= cmdline
option.

Define DPS_ROOT_PARTITION_TYPE_UUID in asm/dps_root.h for ARM and select
ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID.

[1] The Discoverable Partitions Specification (DPS)
Link: https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/arm/Kconfig                | 1 +
 arch/arm/include/asm/dps_root.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 73e6647bea46..deedb5d808fb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM
 	select ARCH_HAS_DMA_ALLOC if MMU
 	select ARCH_HAS_DMA_OPS
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
+	select ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KEEPINITRD
diff --git a/arch/arm/include/asm/dps_root.h b/arch/arm/include/asm/dps_root.h
new file mode 100644
index 000000000000..e9f0f24bcac2
--- /dev/null
+++ b/arch/arm/include/asm/dps_root.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_ARM_DPS_ROOT_H
+#define _ASM_ARM_DPS_ROOT_H
+
+#define DPS_ROOT_PARTITION_TYPE_UUID "69dad710-2ce4-4e3c-b16c-21a1d49abed3"
+
+#endif /* _ASM_ARM_DPS_ROOT_H */

-- 
2.53.0


