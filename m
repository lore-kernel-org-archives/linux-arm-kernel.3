Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFDBCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RRWgy0Ebg/irtHAQ9mOC914LUpOb0oSS66yOoljTza8=; b=ekoJqnqys6lBal
	D14RXKOcPAnzbRdmtS32rnEP/H4RaEvb1/TlhtTb0/7ebo/5grYt+c7rsGisP0SSBo/Nk7T8XfWgP
	99WGr8w1g2cLIPGTcb+TuVENbUdomnW0CW+/Uqdy/ZQk6SNQiV9BeNPEhv+uGGygOXJKAz4s5dcld
	CPa5kOUUOSlH+JygY7E1eB3RMmnxY8rpsgcZiCL/X0dzrx0+FFsL8wDXskRqDETObYmEBhgfhfzUb
	uLaO5CadQMqJ/mSTcSBXCUAhCWJBbVWFcwR+xBkLKmKO5s107VaGmPfILlM17m8h66arPcPr4Osl5
	Wz0zNHLRS2bPE5lTJrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaUn-0000000BJ60-3yBU;
	Fri, 02 Oct 2026 10:28:05 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaUk-0000000BJ4k-3fsZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790936887; x=1822472887;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=kdP8Y85+YAlHHNn6trn0SUbhnmJE4tAcNHP5fu0/54w=;
  b=cwnlhjADEtT6J1B4xr1lKtM2jAImQM887pvrNH46+V+N8h2kwbED396k
   bil78/Lv6FOrE9+dBZmv8JtYTxT1QXTZMHLisFMeQ/RDiahMYk/FU+hvh
   4xuwtsvTZDvo8N58ABDo2yPOZsd+/2A0gl8+ZqS+qZ4A0CfyenNf2AfTz
   ASG44VPVD+JD00SEPtelLepWI+x8rrRgUR5oucdpMFEzMx4UGGUdHGwd9
   ajMGpbtDjjTxYo0RBPZt8EhujG/f5C49vk7pL0fFa3eVxfMkfCMqpJjO4
   PBgTvdSe+bW3uMRTDWVMwYqrMOL44MCoUkxhC1fb32J3gnb8DSH56uBXV
   w==;
X-CSE-ConnectionGUID: ATY3xjGuSh+Fw7xFAv8Uyw==
X-CSE-MsgGUID: xdqAkSqnQXOFDBK8kJL9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="244925543"
X-IronPort-AV: E=Sophos;i="6.27,136,1786978800"; 
   d="scan'208";a="244925543"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 19:28:04 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0E1648398
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:27:59 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AE5FF1C00CF5
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:27:58 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8EC86201F381;
	Fri,  2 Oct 2026 10:27:53 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Subject: [PATCH 0/4] arm64: Add workarounds for FUJITSU-MONAKA CPU
Date: Fri, 02 Oct 2026 19:26:48 +0900
Message-Id: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOiGv2oC/x2MQQqEMAwAvyI5G0h7EPUrsoegqQaxlXQVQfy7x
 ePAzNyQxVQy9NUNJqdmTbGAqysYF46zoE6FwZNvHJHHLUVeGYNeGJLhsee/CW/YtNSSm4Q7H6D
 Uu0lxvvPwe54XQNQKVmkAAAA=
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790936872; l=1846;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=kdP8Y85+YAlHHNn6trn0SUbhnmJE4tAcNHP5fu0/54w=;
 b=sMutH7OhtOq9k8VTtMz1y5NNO9KUJbCPf4Nd0TQrXpxEWC6mWnCE+o/3Ek4YSISS8eN23cuDP
 2UTe6+Jim/LBwZPXzq96h44pnE+cODni8I5OEpQSzWxKYPPMkAV+7Ui
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032803_432628_32F9EE8C 
X-CRM114-Status: GOOD (  12.11  )
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

This series adds three workarounds for the FUJITSU-MONAKA CPU.
 - Patch 1 ... Add the FUJITSU-MONAKA CPU type definition
 - Patch 2 ... Add a workaround for TLBI operation on 64k page size
 - Patch 3 ... Add a workaround for perf operation
 - Patch 4 ... Add a workaround for GIC operation

Although the three workarounds do not depend on each other functionally,
I have combined them into one series because patch 2 and 3
use the CPU type definition added by the first patch, and
all the workarounds update silicon-errata.rst.

If preferred, I will resend them as separate patches.

This series is based on v7.3-rc5.

Best Regards,
Tomohiro Misono

Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>
---
Kohei Enju (1):
      irqchip/gicv3: Add workaround for FUJITSU-MONAKA erratum E#030003

Tomohiro Misono (3):
      arm64: cputype: Add FUJITSU MONAKA definition
      arm64: tlb: Add tlbi workaround for FUJITSU-MONAKA Erratum E#030001
      perf: arm_pmu: Add workaround for FUJITSU-MONAKA Erratum E#030002

 Documentation/arch/arm64/silicon-errata.rst |  6 ++++
 arch/arm64/Kconfig                          | 36 ++++++++++++++++++++++
 arch/arm64/include/asm/cpucaps.h            |  4 +++
 arch/arm64/include/asm/cputype.h            |  2 ++
 arch/arm64/include/asm/tlbflush.h           | 33 ++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 20 ++++++++++++
 arch/arm64/tools/cpucaps                    |  2 ++
 drivers/irqchip/irq-gic-v3.c                | 48 +++++++++++++++++++++++++++++
 drivers/perf/arm_pmu.c                      | 13 ++++++++
 9 files changed, 164 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261002-monaka-fix-for-upstream-680801dea92f

Best regards,
-- 
Tomohiro Misono <misono.tomohiro@fujitsu.com>


