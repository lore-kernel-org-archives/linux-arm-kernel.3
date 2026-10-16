Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C548ECC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4hUNvzUm+i/fvb3rIFA3gDriyPT42ImnXZwFydw5ffQ=; b=FNVlJTM0ETUXIr
	TRKiE3qp5HPc+oKhOZk/w0HYoYnIleY3p7rn/vZ5PFrG3BrwpBguYpHsu/O4AYERDn/5wrCwzTMe2
	n8rcuPEi8a3hNO9QK0hJkbHYU9mX0C175Qd10fCte+C13e7rWQEBcfvcVdNvwyWGj96oFf4WhWd7U
	EMKW8pUDaLVhHSxgpcpBrtIwyGOLVDbfZYrE9p3HeWLkPgQ9Mzbhm4vGtWZw6OK3MwkB+HfYzGrvC
	H1TYxKwqyfy+J4MebuJCEhWMSLV8R+Lw5WAzDGEvCj3vsWT9UVjzFSLobJSrEtA9iid5W7gk2ZHYX
	HjnZFS/cu5FGCnTjoWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDH-00000003ThF-2Ogp;
	Fri, 16 Oct 2026 16:55:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDA-00000003TdF-0Eiv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4231477;
	Fri, 16 Oct 2026 09:55:08 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F36A3F7B4;
	Fri, 16 Oct 2026 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169712; bh=uNbBU/EY9WXBUNkGG0itsEkzVgBaX+yaH0M52uUwmFg=;
	h=From:Subject:Date:To:Cc:From;
	b=RoGf6tzMTOFAIheS9Av7Qpk1ycv7xrTNG/TLOnfGLq2UCY/KFb1twwh3dPIeRV5zO
	 5+ggGpf1quan/BmBv0S7CSXmB+UVXNibwkFRQE0MY1cNcoQLYG4w1HzEGoflryLauD
	 VdudypJsjmsb5WNiHNaIxqlf0xRjcuDPI5mfY9S8=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/23] coresight: trbe: Refactor buffer and IRQ handling
Date: Fri, 16 Oct 2026 17:54:58 +0100
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJW0moC/x2NXQqEMAyEryJ53kJs/QGvsiyl2qgBqW4qIoh3N
 /g08zHDzAWZhClDV1wgdHDmNSnYTwHDHNJEhqMyWLRNiWVjdunJUwr9Qj5yfpXl77Uc1QqNYdh
 XMRhcVeOIrmod6NqmCZ/v0/d33w8NUt8EeQAAAA==
X-Change-ID: 20261016-trbe_enable_disable_irq_handle_refactor-0a3450f03473
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3375;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uNbBU/EY9WXBUNkGG0itsEkzVgBaX+yaH0M52uUwmFg=;
 b=S+gfnRqM3iuzcg6PNNIY1km7seugr627QKpCGxWjlpn1gBUIRtG3376n6jmPSj1q9lWwl6PAA
 oUd0bCVc24iC9XR5J/ULjUo2UegnPTQtxnQBGTavEWm4mpIJbnk8UHz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095516_191359_52A4EE8D 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

This series follows the earlier TRBE buffer refactoring posting [1].
The work is now split into two parts. This first part contains fixes
and refactoring in preparation for wrap and trigger mode support.
Support for those modes will be sent separately.

The patches are grouped as follows for easier review:

  Patches 1-5: Minor fixes
    Add register definitions, fix the watermark range check, and
    improve erratum checks and perf handle validation.

  Patches 6-11: Enable/disable lifecycle fixes
    Clean up session setup, status clearing and IRQ handle ownership.

  Patches 12-17: Refine status classification
    Decode stop reasons, report truncation on errors and improve
    trace-size accounting.

  Patches 18-23: Improve IRQ and overflow handling
    Keep the handle in per-CPU data, stabilize status reads, and
    improve AUX restarts and trace-gap reporting.

A race also remains between TRBE interrupt handling and AUX pause/resume
from a sampling NMI. This should be resolved as part of the state
machine refactoring in the CoreSight AUX sampling series [2].

[1] https://lore.kernel.org/linux-arm-kernel/20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com/T/#t

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (23):
      arm64/sysreg: Define TRBSR_EL1.EC event classes
      coresight: trbe: Make watermark range check overflow safe in __trbe_normal_offset()
      coresight: trbe: Use helpers for checking errata
      coresight: trbe: Check the buffer association before IRQ validation
      coresight: trbe: Validate perf handle before using sink data
      coresight: trbe: Drop redundant disable from enable path
      coresight: trbe: Publish the session after successful enable
      coresight: trbe: Clear stale external abort status
      coresight: trbe: Clear TRBSR status at stop sites
      coresight: trbe: Drop redundant disables
      coresight: trbe: Assign the perf handle in enable and disable
      coresight: trbe: Decode TRBSR status codes
      coresight: trbe: Simplify wrap status handling
      coresight: trbe: Treat access not allowed stops as fatal
      coresight: trbe: Report truncated trace on buffer update errors
      coresight: trbe: Always classify TRBSR when updating buffer
      coresight: trbe: Calculate trace size across buffer wrap
      coresight: trbe: Keep the perf handle in per-CPU data
      coresight: trbe: Reload the AUX buffer on overflow restart
      coresight: trbe: Add fault action argument to trbe_handle_overflow()
      coresight: trbe: Read TRBSR after prohibiting and flushing trace
      coresight: trbe: Restart trace source for stopped buffers
      coresight: trbe: Report trace gaps with PARTIAL instead of COLLISION

 arch/arm64/include/asm/sysreg.h              |   6 +
 arch/arm64/tools/sysreg                      |   8 +-
 drivers/hwtracing/coresight/coresight-trbe.c | 481 ++++++++++++++++++---------
 drivers/hwtracing/coresight/coresight-trbe.h |   8 -
 4 files changed, 345 insertions(+), 158 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20261016-trbe_enable_disable_irq_handle_refactor-0a3450f03473

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


