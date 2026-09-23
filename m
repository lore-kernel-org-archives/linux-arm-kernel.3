Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD52C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kmJMlLB8mSeYLK8VansymEDb+mP8e8uKfCo5kfNQVE=; b=yav2JakJB82Gk7BVp6WNuQc5Rn
	6eBftEfKl9FwetdUN9C8pIz1kLj3Q01F+FmcRy1X/fbPaGwYlM+8AuRhkxXFoOnUcXZSxbe/zciPu
	FX1MAm8R7FAkJ61xWUiAkYkkPw3JGh2rSa9F37NC2LMyPgtqnK5/tjYnYJ7hcXzkD+el6ZYe8/5DS
	NwW6r7+bPNEwpI0jV7k9x92rLXQaLmPWve0RLGFDbrDo1TJ+stCQ8TcPGPMpbhXMGw6mj3cFApseq
	7LxadxfYfpd+/VCaXLTZDOeuZmfw5La203tX5Oi7VOVMGhHnrM+fXGH2h3kPEmDPzHicpUaH+mDQi
	0w50YxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oo7-00000008iJt-1EEl;
	Wed, 23 Sep 2026 15:22:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Onr-00000008i5n-3LyQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3kmJMlLB8mSeYLK8VansymEDb+mP8e8uKfCo5kfNQVE=; b=Oh3px3GtJriD84BAwKypbTaqGZ
	FQIEXcP9pplIEesIvN3XgI451CBSrTgxysAtqceY6tkhpTG57Tcxy7au9oIyFkqyvyCL8OJAfTTuH
	i6UdHXtQw9nl17I5DgF2ZGW3B+FWFXFRkUmfscbJl/fxUFrDf0Awyf3UsVPBFwOUW08g7nlXu/sHx
	wpZi6nIr3OQ9hsfBQk5lpogxeZr+UWQSSm2UalAk8VzgYjpcTTLGc+PyoDCsxpjcvbcwDUlXMPwDL
	+C6bKg/aU41yhokcCSDfbv+6HTRLm1fCo85Mfe4X4qNCzg0B0BbBQwjc2D9pxflamSqkSETt+yz0U
	hJK+vGkw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ono-0000000Evj0-3PP9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F5631E5E;
	Wed, 23 Sep 2026 08:22:28 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7118C3F86F;
	Wed, 23 Sep 2026 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176951; bh=EMuhC/0lDACH65JGvd017LcTWkEHVrNEuDe6Eoq9Hq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O2PVX6RGsaXYTOIazTUZVn/nRmiznh3pNplutIBqkaPrRzuQXa6IJbwydmzbIYDzf
	 +i0Jol3K7CKipeq07gZDIPAedBkgPm0V0f4JBw+DkV5ssSbVA52LZBjyc7/VLt63DC
	 Z5jxy5wkACxDL/57lXv8azPCS2gCLHAZop+TRofI=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:54 +0100
Subject: [PATCH v2 14/14] perf tests: Check CoreSight emulated instruction
 entry and exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-14-6ab8c07a5455@arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=2055;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=EMuhC/0lDACH65JGvd017LcTWkEHVrNEuDe6Eoq9Hq4=;
 b=y9kz+vj19LRt/+Lorv7jNh5I5cKJ52fcNPewi0j7HJGoPERH3qYF+Ur/mKSEv5FlvsNgycUWe
 COq2yyIsyXVCaBboOiqTIVziJ8f3J63kVe8fhHgS7jTWpxDrg4TbUf/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_162233_251664_576C425D 
X-CRM114-Status: GOOD (  13.79  )
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

Use traploop's EL0 read of ID_AA64ISAR0_EL1 to check an emulated
instruction. The kernel emulates MRS and advances the return PC by four
bytes.

Select MRS entries by instruction encoding because page faults also
appear as int/iret pairs but return to the same PC. Reuse the common FIFO
recorder and pair checker.

For example, an expected int/iret pair is:

  int            5cc808 => ffff800080010c00 insn: 00 06 38 d5
  ...
  iret ffff800080012284 =>           5cc80c insn: e0 03 9f d6

The entry instruction is MRS X0, ID_AA64ISAR0_EL1. After emulating the
read at 0x5cc808, the kernel returns via ERET to the next instruction at
0x5cc80c.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../perf/tests/shell/coresight/trap_entry_exit.sh  | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/trap_entry_exit.sh b/tools/perf/tests/shell/coresight/trap_entry_exit.sh
new file mode 100755
index 0000000000000000000000000000000000000000..3ebd4033b247a1a43e0139868972afd41ba905ba
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/trap_entry_exit.sh
@@ -0,0 +1,24 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight emulated instruction entry and exit (exclusive)
+
+# shellcheck source=../lib/coresight_exception.sh
+. "$(dirname "$0")/../lib/coresight_exception.sh"
+
+test_trap_entry_exit()
+{
+	# traploop reads ID_AA64ISAR0_EL1 from EL0. The kernel emulates MRS and
+	# advances the saved PC, so IRET must resume four bytes after the trap.
+	if ! record_trace traploop 256; then
+		cat "$tmpdir/record.log"
+		echo "Failed to record the traploop workload"
+		return 1
+	fi
+	decode_trace || return 1
+	# Page faults also appear as "int", but retry the same PC. Select MRS
+	# Xt, ID_AA64ISAR0_EL1 by its encoding; the low five bits select Xt.
+	check_exception_pairs "int.*insn: [01][[:xdigit:]] 06 38 d5" "iret" 4 || return 1
+}
+
+setup_exception_test || exit $?
+test_trap_entry_exit

-- 
2.34.1


