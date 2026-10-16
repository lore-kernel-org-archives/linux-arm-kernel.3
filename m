Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE88CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/+aeuq10lahFxV4sPbqMVgugB6iAyCbfMnZjrybFR8=; b=e7LM/aw/isqTEH8kAwu83+1tUp
	kKwpDLFbrJDlvzO1fLY0dCL6QBowLw9DRLFdZbkVpToIjgLmliAontI0nIQ/impbJL25TGgAp80Ys
	ct4QqvkKQc+4G/iQzzNZKd0TRDN/oN02dlZZ8ghnt6WpKCu78uyazKfAKd6dZ1vHHW9P5CLhcOcVK
	nCUUfEX02/IS3xRnbDr6au4QvIBn5EAvvL0r7Q6UYQXOI8uSTUJLVIdt3IOAHx3WHoRXO6gdeMXmU
	ACM+DLQWh2zqb0NofhdCzZUsk84fpKi7Iq4uDttUlEH77GMNmAYBPjuIQ1LexqoKvrCt1CBTSTbcZ
	lUStOTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDy-00000003UOP-3qaR;
	Fri, 16 Oct 2026 16:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDb-00000003U1F-20k7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p/+aeuq10lahFxV4sPbqMVgugB6iAyCbfMnZjrybFR8=; b=kErh0do2+RtB6EgxmbjmGmOv8C
	Fgg8mjycLFUB+o3Qhy5zZSP9mi7ACptkmTK83Qyc/+laVymaI+1HVzijMB7isMUMNEVhOH+emdk2H
	mnC5N+1uEAHVfwUQRaIAOuNxynEQ4bousBIOZhxoNWsjPn0sW2EeubAF93BBSqVt5IAofPHVh1oH0
	FdLzwejBQBeU7Y6/jW+IPTGXSKjoTHKB/aCo3PqX64x6As/ry1SvPuo63svcN2LPSuRrQnaejrBXB
	AfbIXt4PaV6TdDin46oLqvhkR9jO+1yXEd7Y4L12mAM1IVRZSCyirmCpOFCPT3GBNhayjQAKCSrVQ
	+g4tnXvw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDY-00000001lL7-2zKY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49EC01691;
	Fri, 16 Oct 2026 09:55:36 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F41013F7B4;
	Fri, 16 Oct 2026 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169739; bh=i8NvbVpuzfjMiO2TYqnvpJ+XUXrLAwhczqa0ubO6Urw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vFbivNU214iNvGciB4ZiTH/AcVgosJp3nYP4qO6naTtG0r7vQX2Y4XDSiaaYT2aej
	 jNDPlr2SMPW4zKHorMNaVCrKCgg8jItAJuax6CGhOolcXk33ukrHALVJeWE4E28RH2
	 oYUBbkLcAFpWk8PPlKQe0Gy0VwnLLLJSuFJWRnWE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:13 +0100
Subject: [PATCH v2 15/23] coresight: trbe: Report truncated trace on buffer
 update errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1077;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=i8NvbVpuzfjMiO2TYqnvpJ+XUXrLAwhczqa0ubO6Urw=;
 b=/o5/cCMcND1q+Zxgjbp/2XyQGRR9Qmn4+kmWPIxpvOQnMD1CVZGIpIKd9+hsNPkXc/yUm6yrk
 X5s8CeLKMCGBBI4Ppz0FGwfUN8ou9YEBR1gus12JiBUAG+OAkhF1L15
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175540_983317_2DCB5DB4 
X-CRM114-Status: GOOD (  10.34  )
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

When arm_trbe_update_buffer() handles a pending interrupt that is
not a wrap event, it discards the buffer by returning zero. The AUX
output is not marked as truncated, so userspace is not informed of
the lost trace.

Set PERF_AUX_FLAG_TRUNCATED before returning zero so perf reports
the trace loss when closing the AUX output.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 1c585b6123df2f20d08747678d836742ce9564cc..ac49098aa08412a23a20d32f84c2e1977ee4a223 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		 * errors and as such buffer is empty.
 		 */
 		if (act != TRBE_FAULT_ACT_WRAP) {
+			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 			size = 0;
 			goto done;
 		}

-- 
2.34.1


