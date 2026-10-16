Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A92CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFtUlM31un+5my/BJKk0R8h7m3ui30NM7M56Ek7eJu8=; b=kt2vSuDGMrGbrTnQntNAiRAZ+x
	cKk30PvvsHWojWANZIs5XdpUkUDmZkh5W9gfVuj4onAtqerKnluOGHpZyHxhrgJ0X5NFxnzRmYNv4
	P66T6gfA5U1AzysLWEeAZtaNKYa3r1d0LIDk31O4WZoqQi/LmbfskbdX6FBrlPSaApX3vt9yRlEfN
	fpjFfnFla3+X0LYZPxw8h+Q2xtNzuB1skQ1wRAb4ozzxm3imRJAUwVGWNWhQCe+6UsU7Sk+YA6g01
	nTnA6ZgeBodEfdB4uV3jGr9IynIrVODQY6Ol+dmZpSKAJ1DiwmsZ1NKO+drwViSq/NRlC8cIVZEeQ
	yy/MkJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDX-00000003TuS-1nnQ;
	Fri, 16 Oct 2026 16:55:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDH-00000003ThD-2Hyz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC30F175A;
	Fri, 16 Oct 2026 09:55:19 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754C53F7B4;
	Fri, 16 Oct 2026 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169723; bh=2mWM0NIrrr+JQA1RmHKfyU3uP0bXY9WQf31AeWam5BY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C7FT4xOO7CQbAFjHHN0XGHiJl1kFLLAEXy4KgqyFz7Br7YLlFZ5fTjgq1xvdd7dgq
	 9MyixdjJ9GJjNT1doqlp+SjtOp7bEWKO72Sqv7rC5wY/LqlalG9JoKKSuYjzKUX5s5
	 0h39BgzNaynzvpi2B2kDRTuugR99lPKBBQYKGbHQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:04 +0100
Subject: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1810;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=2mWM0NIrrr+JQA1RmHKfyU3uP0bXY9WQf31AeWam5BY=;
 b=qHU4MHw/WoIADWQQAWk+I8IpdL+muDzbXHo+rQ3Jz3ObeU7ucks4ACybmP4MCJdF4WCuF1XGc
 KucRVzeP3mbADIgh53GvTDRvgsFXUsX3uDE7aeQtaNMOQ3aNnU/sGzq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095523_658099_F78DE1BF 
X-CRM114-Status: GOOD (  10.09  )
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

The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:

 | When the following conditions apply, the PE might ignore a direct or
 | external write to any of certain Trace Buffer Unit registers, other
 | than a direct write or external write to TRBLIMITR_EL1 that clears
 | the conditions:
 | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
 |   or the Trace Buffer Unit is using Self-hosted mode.

trbe_enable_hw() calls set_trbe_disabled() first to ensure TRBE has
already been disabled before programming any other TRBE registers.

However, TRBE is already expected to be disabled before trbe_enable_hw()
runs:

 1. CPU probe resets TRBLIMITR_EL1 via trbe_reset_local();
 2. Interrupt handling disables the buffer before re-enabling it;
 3. The normal disable path clears TRBLIMITR_EL1.E.

Calling set_trbe_disabled() from the enable path is therefore redundant.
Drop the call from trbe_enable_hw(), which only needs to program a
known-disabled TRBE.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index a7c1037a048f5236598f8f3a7cc4f47bff9d329c..979d0fa84c1c7b448c1ce5cd7a37dff8845795ef 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -652,7 +652,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
 	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
 	WARN_ON(buf->trbe_write >= buf->trbe_limit);
-	set_trbe_disabled(buf->cpudata);
 	clr_trbe_status();
 	set_trbe_base_pointer(buf->trbe_hw_base);
 	set_trbe_write_pointer(buf->trbe_write);

-- 
2.34.1


