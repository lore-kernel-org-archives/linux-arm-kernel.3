Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287C5FEEF49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+cdWjFRGGCUtT7db0Yc9yE9Y+uOP1xmZtEBhcktato=; b=J/J4lINx69JHxmZsL/LANqyYGF
	RlOCvMEybkeEnJP2exv8osIKAfFEXeQeu8ckna3bAgHYBaQE/nl//1yoRPsR1obfXsPpf7O8MAzb1
	Ui+MRKV6AmexvadoJpd4NZGvm3VmBcIz75APW5XoEs7DWXaWBFqIyDm8prJbvIJRw1ymkCpxhi1Bs
	ZB6KA5aHZ/kPHulLwychbnwFBXsgEVwlsUWZseIf7Mz8iqXpTv3vXWApvOKpzzWK6To1vqufPQR6w
	lVfQNUep46ae1RjegY1CiHKTtCbYje6egONjTSsjqkccTSE4BYSdBdoRkmhAqVCWb4fC4fu2NirxJ
	TDHaxrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RW-00000006bgx-3yAS;
	Tue, 07 Apr 2026 14:30:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RT-00000006bfl-3RsB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1788E43607;
	Tue,  7 Apr 2026 14:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D1AC2BCB0;
	Tue,  7 Apr 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572211;
	bh=H/ZjhYgrW3VND0oifQK7yUnQ24qHMPGKHi0BUoEY5sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LvCt7trhYrin7vmw0KGlxThv1JqXPC/SnLO0rfKa8S1mowBnzeXYbGqNm+DGZDIPm
	 Ve+KHt7WItbaxsfYzUsa6aVYZw8eMMZYEM7p/t86J88d+81PryhHYYUzpz84r3DqKb
	 6lyviNyMOSHm4QrUDAhsaAqeDpx0R1kfs5RohacPgzLpQ4szxwJX05DuAZIxDQTfbn
	 KMG0XZhgn9y+5R94Tmw2lrWVdH00wkMbO9Iltfgg+x72Ny6RrYmb2sB11vAzkRdab0
	 0p9I3pwQ72lkrxInh1wj80M+GVT/mesFaizqDmEJlGlWs8DfR0uf2wHtOYbWa2SBI9
	 hZXx36JxqEvyA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Apr 2026 09:29:43 -0500
Subject: [PATCH v4 1/6] arm64: hw_breakpoint: Disallow breakpoints in no
 kprobe code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-arm-debug-8-9-v4-1-a4864e69b0ea@kernel.org>
References: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
In-Reply-To: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_073011_906960_F264DC1F 
X-CRM114-Status: GOOD (  11.36  )
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

Taking debug exceptions while manipulating the breakpoints is likely to
be unsafe. The setting kprobes in the breakpoint code is already
forbidden, but the setting of h/w breakpoints is not. Copy what x86 does
and exclude breakpoints that fall within the kprobe section.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/kernel/hw_breakpoint.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce82..38fbd67b2a6e 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -418,6 +418,16 @@ static int arch_build_bp_info(struct perf_event *bp,
 	/* Type */
 	switch (attr->bp_type) {
 	case HW_BREAKPOINT_X:
+		/*
+		 * We don't allow kernel breakpoints in places that are not
+		 * acceptable for kprobes.  On non-kprobes kernels, we don't
+		 * allow kernel breakpoints at all.
+		 */
+		if (attr->bp_addr >= TASK_SIZE_MAX) {
+			if (within_kprobe_blacklist(attr->bp_addr))
+				return -EINVAL;
+		}
+
 		hw->ctrl.type = ARM_BREAKPOINT_EXECUTE;
 		break;
 	case HW_BREAKPOINT_R:

-- 
2.53.0


