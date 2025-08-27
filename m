Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB665CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 01:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjy5L+ax6Eexby3DJaghc6K4Ni682VoKDZ03vCQ+F4s=; b=WIAZ99hKZGHJRoYw+jnCHOj7RY
	UMUxu2mwIjjweuDCxhPkAEqeqV7+B6oYPTCXLW6f6q0oFP1N0OsQFZScc9H3xlEBQn/Pqpdh1lRIa
	0N9HF99TcDrieLqZ4WWyyCBIl7zecCfOctEIH95vrcTbsaXnPEllcbAFm1vS4yk1tIpRiSVGaRGs5
	tQyz3dh8j+Gs+s9xQcm5aRSCQryl/qx+kvvRFRV+mt50JbCh6vR4U/I8ZYagVST0EXLXz+TYVO1Mm
	srWXVWpr8iHLYAXr1osML2YTPxcZGMSm2hwC1HKDs0KSB+E9nx32U8ZKWkFe5WXC9YwcPV2MESBAK
	Ji5vjFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5Ln-0000000DaqV-1saV;
	Wed, 27 Aug 2025 01:53:23 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5B9-0000000DZVM-138Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 01:42:24 +0000
Received: from x415ea.. (unknown [101.12.130.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 71E7632EEC;
	Wed, 27 Aug 2025 09:42:15 +0800 (CST)
From: Bill Tsui <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: [PATCH v2 3/3] ARM: ptrace: minimize default bp_len for hw breakpoints to pass check
Date: Wed, 27 Aug 2025 09:41:13 +0800
Message-Id: <20250827014113.5852-4-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827014113.5852-1-b10902118@ntu.edu.tw>
References: <20250824124317.390795-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_184223_424163_40CEA4CA 
X-CRM114-Status: GOOD (  16.31  )
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

PTRACE_SETHBPREGS fails when setting a hardware breakpoint on a
non-4-byte aligned address with a valid length to a 32-bit tracee. The
length should be valid as long as the range started from the address
is within one aligned 4 bytes.

The cause is that ptrace_sethbpregs() can only modify either
addr or ctrl of a breakpoint per call, but always checks alignment in
hw_breakpoint_arch_parse(). If a breakpoint has ctrl.len=4 (the
default), then users cannot set the addr to a non-4-byte aligned
address. Likewise, if the addr was previously set unaligned, users
cannot set ctrl.len to 4.

This patch mitigates the issue by minimizing the default bp_len, so
that any possibly valid address can pass the check with it. However, it
does not solve misaligned addr/len in modifying existing breakpoints;
further work may be needed to remove or relax the alignment check.

Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
---
 arch/arm/kernel/ptrace.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 7951b2c06..920cf77d1 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -415,12 +415,26 @@ static u32 ptrace_get_hbp_resource_info(void)
 static struct perf_event *ptrace_hbp_create(struct task_struct *tsk, int type)
 {
 	struct perf_event_attr attr;
+	int min_len;
+
+	/*
+	 * min_len ensures any possibly valid address can pass alignment
+	 * validation with it.
+	 * In PTRACE_SETHBPREGS, addr and ctrl can only be set one after one. If
+	 * addr is set first, ctrl will remain as initial value.
+	 */
+	if (type == HW_BREAKPOINT_X)
+		min_len = (tsk && is_compat_thread(task_thread_info(tsk))) ?
+				  HW_BREAKPOINT_LEN_2 :
+				  HW_BREAKPOINT_LEN_4;
+	else // watchpoint
+		min_len = HW_BREAKPOINT_LEN_1;
 
 	ptrace_breakpoint_init(&attr);
 
 	/* Initialise fields to sane defaults. */
 	attr.bp_addr	= 0;
-	attr.bp_len	= HW_BREAKPOINT_LEN_4;
+	attr.bp_len	= min_len;
 	attr.bp_type	= type;
 	attr.disabled	= 1;
 
-- 
2.50.1


