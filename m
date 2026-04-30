Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009BAFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gyc9RYbLfZX65HhctB5vMYt8uQboQJxO3yiTxtN7nVc=; b=WcdFMpCe0GnA+iUOxXGkWzpMuB
	Qu/ZEsNe5GtrVre39vKigIm1Mcg0Ul41714+aHFGaPiFZ7WMc/khyw/D21LoUgFOl/Lm3qesl/+/m
	yAGbx7FYSB0M0mcd9fp5zwiHmzqevZpeDjyL/W8W3DFiZtTdrWYGEbSSiUQxEDKUNLLajNoRBE5vs
	X7RV3mEfzDcgXc3nOlGPcLWOW+v0P9Sdky//7PynjX679AoFGFM2PheubPvvKyB5SiVZ4ma+NhWFv
	5A7ntqQLW9Q28mqQW/wvf6MFk0vj5q3IgvOcLQPlkrv3niu82Dt7/dNbz4JzmZESlCX4I7VJQwfn9
	ZpI+Y7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINsq-000000056hV-1R5T;
	Thu, 30 Apr 2026 09:40:36 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINso-000000056gv-0jB8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 09:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=Gyc9RYbLfZX65HhctB5vMYt8uQboQJxO3yiTxtN7nVc=; b=AAx9dq4/SZQziuBwrwOmmdJbxp
	WRPQfpFQ8PYiuEV8Bn/0WGFbaOxsUv7Jb2PYlLCdSKmnEWBDE4S6X+LTGj2AEobcwFnbQvcMC2Ubi
	AeIXU/AzRwvxchEbVhh3Yaje9kLuVsunHvK6/xe4IqzGE678nbEnMmHfL58OU3P0h/HABQZSZY89w
	Y7k6WdurgpGDWQv56SrlBPhW+Ob+6aDAbDIBxeLeommwRAENi8GHQAIpUe9rY1I7mZ6qUsmNyGlsx
	LgMU+s6iRXzMxqsRNuUsRDZN4VYBhEtA/n+NyARJ0LCAsVIgAty4pgU2ItjXMmvHsLep/vqD5/4nw
	2g3pRPfQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wINsd-007hPV-0T;
	Thu, 30 Apr 2026 09:40:23 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 30 Apr 2026 02:40:10 -0700
Subject: [PATCH] arm64/hw_breakpoint: reject unaligned watchpoints that
 would truncate BAS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-arm64_bas-v1-1-c6ab2b15aec0@debian.org>
X-B4-Tracking: v=1; b=H4sIAHkj82kC/yXMTQqDMBAG0KsM39pAmkhSchURiTptR/CHjC0F8
 e6l7fJt3gHlIqxIdKDwS1TWBYkuFWF45OXORkYkgrMu2Npbk8sc6q7PamJkH8ert84FVISt8E3
 ev6tp/9ZnP/GwfwOc5weJ7VNNbQAAAA==
X-Change-ID: 20260430-arm64_bas-77e37d830226
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Pratyush Anand <panand@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, clm@meta.com, leo.bras@arm.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943; i=leitao@debian.org;
 h=from:subject:message-id; bh=viMJdaQKnJpPSLVttk1P5mppEN4n7BVIiNF65MS4KBQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp8yODgMluI4SVJ+b0hRU85ToWOMb60uHOcdbRX
 mV0f24qDOWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCafMjgwAKCRA1o5Of/Hh3
 bQUWEACUa+h8kB1BCjISTYNwwF38x0gwdjSbanCGawZOBdilCnSz6qkBw4weQTOBJh0HlnLdAFc
 ZXshD7npAibp9z1LWgBGN9kqwQ7IfNIW2cchqb+zKih+0Slhv86R1QlrzYOS5C16lrCqmDdQG+H
 4BqE0dty04wnagUBY3zVLP8LFmxHpaE7256D/Xj6zHsiOvlzqjcu/aZOY5BEf0pbqqY9r6LUles
 UvWnLzNHYoSJrXoaBoKVI+z9v0vpWZXEfW3ZqvzqZQD0Ls8dbcDnSJ0XUxUcIiIHAsBVGiOxvfD
 3APyM7dmpdICI59nv0G7KaS92/ZcNSjZxmFysWi3Yrm7O1ra+haqVWNtJ5NIjquScWRDcju525r
 foXlAzDsgkZQ2DuIpeI1XRQE6NtUw2wvuFAcy3UvK2T6HzEvZf2BoKP/agglDCI2o6kAeXPKckK
 ETONskEo5jPFIglrDSwcYrRvRt+NgMC3IwjrC19uhA7h7CZjZngb61CDYLl5QfLOw/7IZIDNYhs
 1i/ckKZcAdg4OrG4NhXsQGxeNwS/3MIb3pYbmuWn4Xxp9G5R89rR3ovODH7eoN0+Z/gEq6+mRVp
 nDv8GSpshl9+f3zn0448E6UogyCzNasLj2b8W6YxmJk7Y4ouLPuD7dPNyWlSvqDmGr+8RUO+dOd
 neKV8W3Jv0RQGYw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_024034_242874_1D2D3E1F 
X-CRM114-Status: GOOD (  13.50  )
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

Signed-off-by: Breno Leitao <leitao@debian.org>
Fixes: b08fb180bb88 ("arm64: Allow hw watchpoint at varied offset from base address")
---
 arch/arm64/kernel/hw_breakpoint.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce820..b8a1402119f3a 100644
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
+		if (((u32)hw->ctrl.len << offset) > 0xff)
+			return -EINVAL;
 	}
 
 	hw->address &= ~alignment_mask;

---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-arm64_bas-77e37d830226

Best regards,
--  
Breno Leitao <leitao@debian.org>


