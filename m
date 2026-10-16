Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB82CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UMtLt1a+Rop7wLnCT9FX3ZVGUEzKhFG4TgCHb2pl1Y=; b=j5Ii/HuAoWsiDhC+srVJm5ymyX
	p7nYn6QaGrrH4l2i+takcppwOfKqfuiS2I4rxWO69CkBfOv8LPmxuGG5V2OAi7yexIYgrD/eJazyx
	wLGGKcS14xA9DgUSfujbKf1XJQKnek1+X2+n/lSBLLnA/tY3sCfUeWjWhxSY8jQCW/Q5ngvkxjw/4
	T2AdZvjRtnR3Tk1ptCp8PqsNhni6/fbvjF79NDznlNcPa0fct6LJRn4IwHh5Z7ClzizZXh4EuPHvO
	wJnTNMIfqReeulSeniZ4eIA77VETbmBZBjRE9SBeRk+zATEcpiKqHVzNiIgC1RDTOqpsQ4lYycdPl
	QMVGVqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDC-00000003Tf7-1qQN;
	Fri, 16 Oct 2026 16:55:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDA-00000003TdO-1GxU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FD251516;
	Fri, 16 Oct 2026 09:55:10 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4824D3F7B4;
	Fri, 16 Oct 2026 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169713; bh=nuMYLWsXSkVj59xCivvGswe2XeIr4HgV4fiUDKr9Amk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=prkYZVcsGewFBMtpbCXuSyCClwdZ8guDXkRa1jd9jRckR3nCeBP/BaLl4Ws1K7YxP
	 NHy0eBgDm60RCdpGSCshxoK79CnzYP9QBcnVDYTmjYJkpzuFnW6NGF0NBSQ9n9tXAy
	 5Dq32tnL6O4vz3u4glw+YbT8tNPysiiFwPjT0vVU=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:54:59 +0100
Subject: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1134;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=nuMYLWsXSkVj59xCivvGswe2XeIr4HgV4fiUDKr9Amk=;
 b=pqsdx0G+FRiKYCNN5GLVRb+kDXvwgJ+qMyyx2cmgePesg3gnlBt+ZfzIT3fy/xnvMYmRbgYUy
 dEnIPBkMcWEDwPwq0faa3+0CbbY4s2fd1xe3LhPu9/68pCUywcpV7N2
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095516_382492_D4CA1CC0 
X-CRM114-Status: UNSURE (   8.65  )
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

TRBSR_EL1.EC identifies the cause of a trace buffer management event,
but the sysreg description does not name its architected values. Define
the five encodings as an unsigned enum so TRBE status handling can
refer to each cause by name.

The values cover other events, Granule Protection Check faults,
implementation-defined events, and stage 1 and stage 2 Data Aborts on
writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/tools/sysreg | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 94bf065c8ac71f20f482c91a5147cb6e001dfba2..f68c23dd4e83ee4d00610e097d9188d3a2c9ed15 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -5834,7 +5834,13 @@ EndSysreg
 Sysreg	TRBSR_EL1	3	0	9	11	3
 Res0	63:56
 Field	55:32	MSS2
-Field	31:26	EC
+UnsignedEnum	31:26	EC
+	0b000000	OTHER
+	0b011110	FAULT_GPC
+	0b011111	IMP_DEF
+	0b100100	FAULT_WRITE_S1
+	0b100101	FAULT_WRITE_S2
+EndEnum
 Res0	25:24
 Field	23	DAT
 Field	22	IRQ

-- 
2.34.1


