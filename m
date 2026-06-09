Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AD2CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rg6Uwn3qcv35IqK5mO+5MuTecRwPgI2mpMh7ThDFKtQ=; b=PCsVhPmAyyWS3wFnI34xJDQ9gF
	4xDfcAXRrppEo1V3nRUGNuKpYoOpx4DU+pCr8JTGiARkkeo3yiCphhub+GBGH1WKOkGxoR2nOpRnx
	w97+nPxCL9dJi27bp8Sfkpb7oLfUWvZgwA5qKWsUbQyx7G6xHId9papd5ByAHJSGXxSDYFIeksZmN
	kT+msf5D2dWJpvMZRqe27HyHE3ujBSTmFYRj8tI714EzANacPnoo4I+q18cyKdl97S+rJ+0GZR4nI
	6HpI8qVk82QWv4GeyZeqQhWEa6DhJa+ztYefCp/Hvs3sF3R06/cAYNlxLmaVs+4LVI/Zipo/JxGed
	6x4ytD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwJW-00000005da2-2sn8;
	Tue, 09 Jun 2026 13:16:18 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwJS-00000005dZd-454b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=Rg6Uwn3qcv35IqK5mO+5MuTecRwPgI2mpMh7ThDFKtQ=; b=slKC5uQp8RpItbg43LgsfFS66j
	5+UEJ9NQCJD1uUsXJFPHIE+x3pxdM0TQkE+tUXg6/LrxVJyhk/LvlxuJ2KVjH9pGnHhXfW8k8VmDW
	Va+dxcG/ZOeB/byAJII33oByLOwhMgNI2l7AGmE3f6C/yCN2xZB5fN797Hz9ftP0YvQ5uG8A/Npt0
	JI1Ro6YkzsPmgdD/uRE0gquxryfW1vHWdW2XrROjTfgTjyMpjrbPeJTYbmUS3Z0Ph+4sZgULTHtJS
	VDpPscY+wZ7V4MaE3oRZ3sNTJbTk+UuKpp7xQGierJRadUfGaHl1cBPl8OVVKOx9agDTXlR4wnTlC
	k8sLrceg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWwJK-008QXf-2e;
	Tue, 09 Jun 2026 13:16:07 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 09 Jun 2026 06:15:53 -0700
Subject: [PATCH v2] arm64/hw_breakpoint: reject unaligned watchpoints that
 would truncate BAS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-arm64_bas-v2-1-9f34dbbded88@debian.org>
X-B4-Tracking: v=1; b=H4sIAAgSKGoC/23NSwrCMBSF4a2EO24kSWsiGbkPKZLHtb2CiSS1K
 KV7l9apwwM/31mgYiGsYNkCBWeqlBNYphoGYXRpQE4RLAMllBZdK7grD91dvavcGGxNPLVCKQ0
 Ng2fBG71369L/dn35O4ZpA7ZipDrl8tnPZrl1/9xZcsmDdl55eXQYxDmiJ5cOuQzQr+v6BSOQI
 oy1AAAA
X-Change-ID: 20260430-arm64_bas-77e37d830226
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Pratyush Anand <panand@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, clm@meta.com, leo.bras@arm.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791; i=leitao@debian.org;
 h=from:subject:message-id; bh=60Hz5+3eEkrBAnUhEtk9VB5qfD8DLzTUtlgK14Fe8II=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqKBIS+Gi5xCr81tProuji531Z+NisZK4+78aq7
 +5uy5lUJJCJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaigSEgAKCRA1o5Of/Hh3
 bcJ+D/4raj8CmXOiWXwdIcfpOWG1UBX+93rbwV1W3Bco7TxtN5Q19MtVB3OdrwFH6MD2cA4luDR
 hJzP9cvGuhPBLOLae7PVBohiA+w21izjHYsIvBFLZwD70pi2IJCgAdsQwI1egwRpmXU2bQQtO0Z
 dreS8LMBlQT3xNGc4fpVanTUWmRuEiQlyG/dGWL5FxcI+VdtUhf1s3jT/+EKubJsuFnCepAs8oD
 bAy1or+v1BZzRSwCxcdJcuPJblznVdGueec0sJ0O+ZPN1GTMJvplGUHt56uxtEZsP/dzW0LmHpK
 I+ZVulkkJJo2pQPh5WLIJllw2BBEzJVzIV5fpGBE9N+XtPgfCWEFXWImk2nBf9TdxXwzjQIJZ3a
 UintXDHWjpfvB6BLr2m+S4kZSFgG7GbQMPa23ItEJwXnZGUsFMgI7SGWpPRahRz8vWAN+vcKBEy
 sHYV5UjREU/1RTbqDd29rW5U2asIu28wkv2ZHKDmp0ZwbzmjUYzNVjbylANMzaOpZZ+OQGE55ri
 dsGinJGdgsqhpAeGc6Es8gS9YlK/QtrsFzCicfOxJhXpafajyQts4SZYdxMLIobKf3eN52gVCcI
 6/6VRB7w2meF0FFuHj+/F0mMwXdS8sv2EWonHTgjWemPaX1hRQ/HuMlOE6Zu6j/oEBgClsMF1HK
 8/TlgAGpZVv2uYg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_061615_925125_1FDF3421 
X-CRM114-Status: GOOD (  16.18  )
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

hw_breakpoint_arch_parse() positions the BAS bit pattern in
hw->ctrl.len with

	offset = hw->address & alignment_mask;	/* 0..7 */
	hw->ctrl.len <<= offset;

ctrl.len is an 8-bit bitfield (struct arch_hw_breakpoint_ctrl::len is
u32 :8), so the shift silently drops any bits past bit 7.  For
non-compat AArch64 watchpoints the offset is unbounded relative to
ctrl.len: a perf_event_open(PERF_TYPE_BREAKPOINT) caller asking for
HW_BREAKPOINT_W with bp_addr=page+1 and bp_len=HW_BREAKPOINT_LEN_8
ends up with 0xff << 1 = 0x1fe, stored as 0xfe.  The kernel programs
WCR.BAS=0xfe and the hardware watches bytes [1..7] instead of the
requested [1..8] -- the eighth byte is silently dropped.  The
syscall still returns success, leaving userspace to discover the
gap by empirical probing.

The same class affects HW_BREAKPOINT_LEN_{2,4} when offset pushes the
high BAS bit past bit 7 (e.g. LEN_4 with offset=5 yields 0xe0
instead of 0x1e0).  No memory-safety impact -- the value is masked
into 8 bits before encoding -- but debuggers and perf users observe
missed events on bytes they thought they were watching.

The AArch32 branch immediately above already rejects unrepresentable
(offset, len) combinations via an explicit switch.  Mirror that for
the non-compat branch by checking that the shifted pattern fits in
the BAS field, returning -EINVAL when it does not.

GDB and similar debuggers are unaffected by the stricter check.
aarch64_linux_set_debug_regs() already treats EINVAL on
NT_ARM_HW_WATCH as a downgrade signal: it clears
kernel_supports_any_contiguous_range, calls aarch64_downgrade_regs()
to round the BAS up to a legacy 0x01/03/0f/ff mask with an aligned
base, and retries -- the same fallback path that PR-20207 introduced.
The new -EINVAL is therefore reachable only from a raw
perf_event_open() that pairs an unaligned base with an oversized
bp_len, which is precisely the bug.

Reproducer:

  struct perf_event_attr a = {
      .type = PERF_TYPE_BREAKPOINT, .size = sizeof(a),
      .bp_type = HW_BREAKPOINT_W,
      .bp_addr = (uintptr_t)(buf + 1),
      .bp_len = HW_BREAKPOINT_LEN_8,
      .exclude_kernel = 1, .exclude_hv = 1,
  };
  int fd = perf_event_open(&a, 0, -1, -1, 0);
  /* before this fix: succeeds, watches 7 bytes (buf+1..buf+7)   */
  /* after  this fix: fails with EINVAL                          */

Fixes: b08fb180bb88 ("arm64: Allow hw watchpoint at varied offset from base address")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Use ARM_BREAKPOINT_LEN_8 instead of the 0xff magic number (Will).
- Checked and Expand the commit log to explain why GDB and similar
  debuggers are unaffected by the new -EINVAL
- Link to v1: https://patch.msgid.link/20260430-arm64_bas-v1-1-c6ab2b15aec0@debian.org
---
 arch/arm64/kernel/hw_breakpoint.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce82..73cce8ac8368 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -559,6 +559,15 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 		else
 			alignment_mask = 0x7;
 		offset = hw->address & alignment_mask;
+
+		/*
+		 * BAS is an 8-bit field in WCR/BCR; the shift below would
+		 * silently drop the high bits of ctrl.len when offset + len
+		 * exceeds 8, programming hardware to watch fewer bytes than
+		 * the user requested.
+		 */
+		if (((u32)hw->ctrl.len << offset) > ARM_BREAKPOINT_LEN_8)
+			return -EINVAL;
 	}
 
 	hw->address &= ~alignment_mask;

---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-arm64_bas-77e37d830226

Best regards,
-- 
Breno Leitao <leitao@debian.org>


