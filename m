Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA00FCA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:Message-Id:To:
	Content-Type:Mime-Version:From:Subject:Content-Transfer-Encoding:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hy1eyWOTseZ82z5E7nGJ2+53iQ77tmb6cEWZz/WiuzA=; b=SPzlrEHsvPPHjuEz5xTC7sOXjN
	TZ7HDmRK7lki+s1ZxzgP8sfrHB3rcVcykcJ9og6jizb8YZ+e1a3QT6+Os4LJnahNTS0GnfVmxSMNz
	wRzTJiIRXMjc83aAG4S04R1VwBnuKeH5SLbXCW3VwfhlaEc1ZM1mYwPdsdlvIKR+kLzHAHmOuL6sv
	oEFk1lIgs9O5Z+lG9r0Mu5/l0pCV3BVrqxa6y4CJmtt4T1JPqk3BUnhG4JB1cWhmzA7aDUG3MfLxj
	SptfmHbiNJlrSOsouGolgMG2Kfd6plwo2Z7hAHIl3TEZjmJca2XzXFiq0MszvKFBF/cYcSVC2GF+w
	asAUcv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSkE-00000007hgk-3Pxj;
	Sat, 10 Oct 2026 08:47:54 +0000
Received: from va-2-114.ptr.blmpb.com ([209.127.231.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSkC-00000007hfY-0ryW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 08:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791622056; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Hy1eyWOTseZ82z5E7nGJ2+53iQ77tmb6cEWZz/WiuzA=;
 b=FTCKS6PujMKYvM2dPEXCZsYJMIUYp+dWEq9Frvj0lpttWdPG5r/7kWE6cTz/XfgOSV9sTH
 crvXy4klvZd8AGc7UCSshbU8UcQtg6R89QoJjx/jq3hO60pQ0Na1n7tAVyOTtIJxk605od
 tj/Yk2TvKI3GJzXEFyLwpIFEzW9uHHsLJbGixfwNgLVxdZuappfocpNsmmUmrV+g+mUn/o
 KnoKEqUr19KVC3qd4MAdMb9lPMkP2uqpMmrqbmztZB/sODDhE9xPsL/ajlbpjUKIOanLzN
 sB5aEK0tzWQr9fi5z5v/9jvkzmfvHkM5YcT4Lfbvg6aItR5T8dr6q7ryp6F8XQ==
X-Lms-Return-Path: <lba+26ac9fba6+379bfa+lists.infradead.org+qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Subject: [PATCH 0/3] arm64: Fix text-poke byte-order and late PLT/veneer ROX handling
From: "Rui Qi" <qirui.001@bytedance.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: <catalin.marinas@arm.com>, <will@kernel.org>
Message-Id: <20261010084721.2197683-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Date: Sat, 10 Oct 2026 16:47:18 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_014752_327632_9B3A77EB 
X-CRM114-Status: GOOD (  10.76  )
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

This series fixes three bugs in the arm64 text-poke / module relocation
path, all introduced by the recent text-poke rework (451c3cab9a65
"arm64: patching: implement text_poke API" and 91b89a634487
"arm64/module: Use text-poke API for late relocations.").  The first
two are big-endian byte-order issues; the third is a panic when
livepatch emits PLT entries into read-only executable memory.

Patch 1 fixes big-endian breakage in late data relocations.  The
WRITE_PLACE() macro declared its temporary with the type of the source
argument (s64), but aarch64_insn_copy() copies only sizeof(*place)
bytes from the start of that temporary.  On a big-endian kernel the
most significant bytes sit at the lowest address, so a 16- or 32-bit
relocation copies the sign-extension upper half instead of the
computed value.  Typing the temporary after the destination element
fixes this.

Patch 2 fixes big-endian breakage in aarch64_insn_set().  The
instruction is passed to text_poke_memset() in host byte order, but
A64 instructions must be little-endian in memory.  On a big-endian
kernel the written bytes are reversed and the CPU takes an UNDEFINED
instruction exception when fetching them.  This is reachable in-tree:
bpf_arch_text_invalidate() fills freed JIT regions with
AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64 selects
HAVE_EBPF_JIT without a big-endian guard.  Converting to little-endian
before the memset, mirroring aarch64_insn_write(), fixes this.

Patch 3 (the main fix) routes PLT/veneer emission through the
text-poke API.  module_emit_plt_entry() and module_emit_veneer_for_adrp()
wrote PLT entries into the .plt section by direct assignment, but once
a module is fully formed its .plt is read-only/executable.  A late
(livepatch) relocation that falls back to PLT emission -- an
out-of-range R_AARCH64_CALL26/JUMP26, or an ADRP under
CONFIG_ARM64_ERRATUM_843419 -- triggers a synchronous Data Abort and
panics.  Routing through the text-poke API (mirroring WRITE_PLACE())
maps the page through the fixmap, avoiding the fault.

All three are tagged for stable.

Base-commit: next-20261008

Rui Qi (3):
  arm64/module: Fix big-endian breakage in late data relocations
  arm64: patching: Fix instruction byte order in aarch64_insn_set()
  arm64: module: Use text-poke for late PLT/veneer emission

 arch/arm64/kernel/module-plts.c | 35 ++++++++++++++++++++++++++++++---
 arch/arm64/kernel/module.c      |  2 +-
 arch/arm64/kernel/patching.c    |  4 +++-
 3 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.20.1

