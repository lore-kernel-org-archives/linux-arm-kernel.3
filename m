Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF46EBFD2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mVVdXbB6YFbogHcED9JQf+metfl9LxIdePoajPfcT4A=; b=uD0ZXn4KAKOrAE9BljKcBvZjom
	PiDTXu0n0ZAUmArE8mDcwAVgbkpI/w7qS1/xJsrIIOyADi9jfXICBn0H1UDnrsqTAIBmFUZZd+KrF
	OgQTubMfSBhthpiOyeaTnEDZbnRzSCgN/Dr+tcdXmZdW75/EieVUPE50fu6vmmxcOZ7s7PazAoRzL
	lOiOQY/Op87HEeyxK129Ymd+1X9W7NocV6lLBkXzG6HQbvdt2u+yM0qngmWYWc7Jxr5ayMXyXsEiD
	JRC0pKdrPcAJs9XhCc4Ub1JQCBXBWpK4pWx63SQQazdCglLztTfNGWZUsy5fls/t7fMotSsM+4EW3
	+tgMwZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCE2Y-0000000FOpm-3pDT;
	Mon, 13 Apr 2026 09:57:10 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCE2V-0000000FOo1-2H4C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 09:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1776074184;
	bh=mVVdXbB6YFbogHcED9JQf+metfl9LxIdePoajPfcT4A=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=XCvVBp5sasXx3jIiZKm2s6tyOZqTu57WxqEWHi24GT5EznYKy0D1HAnV9uvVfJVog
	 kBR14GygROlJH6ttrHCaxW/0u7zOFIF61fCMStBNeeQRNAIekbQudszXWlQIY9lc1j
	 6PtguoUXpoiRAoerUGPYwpTXUaLxdmvL6gsAX8/Q=
X-QQ-mid: zesmtpip3t1776074166t4d35053d
X-QQ-Originating-IP: OpJz0VuGHnoZKqstHD3DOHEdrfEkDti3o0+O4jdd0ho=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Apr 2026 17:56:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9950462555277513804
EX-QQ-RecipientCnt: 6
From: Wentao Guan <guanwentao@uniontech.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	hello@peppergray.xyz,
	linux-kernel@vger.kernel.org,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH RFC] arm64/scs: Fix potential sign extension issue of advance_loc4
Date: Mon, 13 Apr 2026 17:54:59 +0800
Message-Id: <20260413095459.2470584-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MFZ9kh0LMtuHaoRA+4WTHtc7uCO2fKFVaSPzsvnko9FqJTsSXZ0VXx4v
	VjVFylbRAiJsbb09psBTSKsiopwcCMS1ZkHroUNQA6byo0OwuCwJv+8/hsJ9X0NlEisjfjf
	oDrmaD3omOiIAbiRVolHfv/Iq4m5OG6t5d5epnPPChlcyespKbFOMo6jI4BlyF3FdfzFd3C
	q1HAOAF5at6bvnKa5YLFThERJMfPoAKE58gGeoo7qdVQwIw69DIFQ6wFRZAGJSwJ8ylbR7a
	gliLmoU4GoobPdtgkdMJkzimIumFe6n9CCQJUFw9erzt8DgbMs7pXgeDJN8yambBByDe6tU
	FUAonk8w5XiBn9P1aOWnpSFapmzYxBC1uayXHKKtMVPY2wH+LXokfcSvdRpq9RcI/ctwUz4
	89a01XLFUQr5cyjQjjv96TN38JvoQenJNqwfyj6GqG0DqJMGVfM66IoNohCfLOc1MoNHB2k
	vMRKnhFKVAsMDR5DM1Wf8UuovV5VNb14p3fkaFJlyCPxq3cgMPFHosVWPebvZKRXM/Ja1Ov
	A6u/r2Kv2yl4D+mR/B8DVxs0AXBIoaZB+/g4dKF3C9W3wRaM/Tk2gXih0bUOxmOcjovnfeF
	KJcYVMjdLs2aPZdLjk5WMYAj3xjvwnY1keQPYn3pN9+dlLRPMMwNT9VY+KDyTyDwJWwfaU6
	joFndMmMj1xxONpikj6kpozE4EOE2O5+OhOEDW8ctbd5VZy+xx57fHY1gg+o79hTUZqBEkK
	m9ow5e/KjVo1QMhZbv3WCakEbrIjrqzQt2z246hXta9OvyEYxdpqJqC9CLt2CZSjw7lRFbD
	a8lUI43rK4gBKhXm7CLUuXG2M9lHHR1RdTvO81sRGIh3YxIDtpFTN46rVAE02AIcg5MJJfg
	4yCvKsgPU7gW7+BB/bLgvVM3lHNOdkNeNrrQc64e9Dh0iDYRk018vAKl5i1MPY+n62j4tgX
	DFjkhHl9NijmFznwhFZmYZMFi8sU0aoxpJCHRCUqFhHGWRzYByJ/mldx6RDOikTdoBSnXBv
	ULQc1t6VDWE/XMkt1ksyoo85lR2NvZ5vgoeEDmtps9MD3r6sCmqvkuoimyQ1Y=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_025708_328552_49654B06 
X-CRM114-Status: GOOD (  10.21  )
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

The expression (*opcode++ << 24) and exp * code_alignment_factor
may overflow signed int and becomes negative.

Fix this by casting each byte to u64 before shifting. Also fix
the misaligned break statement while we are here.

Example of the result can be seen here:
Link: https://godbolt.org/z/zhY8d3595

It maybe not a real problem, but could be a issue in future.

Fixes: d499e9627d70 ("arm64/scs: Fix handling of advance_loc4")
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 arch/arm64/kernel/pi/patch-scs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
index dac568e4a54f2..3944ad899021c 100644
--- a/arch/arm64/kernel/pi/patch-scs.c
+++ b/arch/arm64/kernel/pi/patch-scs.c
@@ -196,9 +196,9 @@ static int scs_handle_fde_frame(const struct eh_frame *frame,
 			loc += *opcode++ * code_alignment_factor;
 			loc += (*opcode++ << 8) * code_alignment_factor;
 			loc += (*opcode++ << 16) * code_alignment_factor;
-			loc += (*opcode++ << 24) * code_alignment_factor;
+			loc += ((u64)*opcode++ << 24) * code_alignment_factor;
 			size -= 4;
-		break;
+			break;
 
 		case DW_CFA_def_cfa:
 		case DW_CFA_offset_extended:
-- 
2.30.2


