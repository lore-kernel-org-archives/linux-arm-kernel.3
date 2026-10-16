Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655FACCF2C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c79mCn/1nYurBgODztRRbDvLhY3Vw34PrjUiu+4Lp4M=; b=bZd0rR6xiCbTLUdXtsxpEWALwT
	w8NEfO3KgSzF0rch19FxxYj8xnze4qGOunJWyMVqbjjmBhfW+5Bdnav3i52rHc5vRsgy5nRRFsORe
	xh5BcWnP7DqjhCYPhdtN7lxVP+JUfzEHtRy2f+A/UvCuVmoENBa9SRFO5lZjdrEbWlJPA3iUSfrnn
	uc0yRisv/JlIcTjKuUsLZpSBG8m/ctZ8KA2ATs6ZZsygBDCybrKiAelCbvGnVsnNNwe49X5Oxam9+
	JyArjoW7dAKqMm+x2maWRf3P8taTPcHgKJAEBtAX4kw+odLaQ4OElDOoRqFoQD2K9Yfosl9XOHVe+
	cAZh8jxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDY-00000003TwQ-1BGh;
	Fri, 16 Oct 2026 16:55:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDR-00000003Tq7-2L0u
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c79mCn/1nYurBgODztRRbDvLhY3Vw34PrjUiu+4Lp4M=; b=p4nMZopSaBSWUcel9W3JdArBuv
	fnZmPKnmpTZOgDhYEQugdm/ckLk/RyjMm9YclvcYgNAUMwrbS5MVkD//vjjTMK2HEpZyqa5LuA4Sj
	u1QZL7jLZJkwu0OUVSMLarHgQ0kCiUSZp5e86Fxd3skUYMnXVXFJKbE9jpVXUJ1N7PSltvtClHwS+
	3ySlGiiGLewxGp1pN7TKTG0ERgs9DnxmpXmSdyVzno/8JXrNEZXJd7EZ/pHQaGHsK/CJBx+2dBZnE
	D0Q/CsWj+dyC7W2pN5MV01FjNXyxbfUhXYAfRWsY+kXG1h2Jx8WFmeoKsg+Tl0aDP4G1d5Kamvzh3
	41tcddzA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDO-00000001lJZ-0JRo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 435691516;
	Fri, 16 Oct 2026 09:55:25 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F00133F7B4;
	Fri, 16 Oct 2026 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169728; bh=7a5LM0omtRuxo1GY+8/etcO0DB5cgJyVFb0k9uB3eCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TAHb/taJYqC/Yzsg/GaktFpDrYnFaTOMGfQau9gLqS8pONtIjMLuHG/26sw4IdvaZ
	 /tRVvzC+EGR4UjB3htGmHnc6OOJoXMCMGU1F3pEZHkVmIsA6aEJGB3ktnXduBnSDm/
	 4ArO3I5g4ynKNMx7qZBzBuPOu0DzmOLTO5hmuC9k=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:07 +0100
Subject: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop sites
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2109;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7a5LM0omtRuxo1GY+8/etcO0DB5cgJyVFb0k9uB3eCM=;
 b=ry8ADQrujTTFdEbFxyecPPqDjhNg7eET/vbVKpX+EPc6vBXJ9jKOsQ2foozk6MhEfBwdUjTZU
 VJwoW6ObtIzCTZ82mdUuDCtbc8QlakBH0U1WFWBzpUsNZUQ6TrnvRpw
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175530_748048_88BE5B86 
X-CRM114-Status: GOOD (  13.08  )
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

TRBSR_EL1 records the status of the buffer that just stopped. Clearing
it in trbe_enable_hw() postpones cleanup until another run starts. If
AUX output cannot restart, for example when AUX space is exhausted,
that clear never executes. Clear the status in arm_trbe_disable()
after disabling TRBE instead.

trbe_handle_overflow() can start the next run without calling
arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
while TRBE is disabled, before attempting the AUX restart. This also
leaves the status clean when the restart fails.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
 	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
 	WARN_ON(buf->trbe_write >= buf->trbe_limit);
-	clr_trbe_status();
 	set_trbe_base_pointer(buf->trbe_hw_base);
 	set_trbe_write_pointer(buf->trbe_write);
 
@@ -1069,6 +1068,8 @@ static int arm_trbe_disable(struct coresight_device *csdev)
 		return -EINVAL;
 
 	trbe_drain_and_disable_local(cpudata);
+	clr_trbe_status();
+
 	buf->cpudata = NULL;
 	cpudata->buf = NULL;
 	cpudata->mode = CS_MODE_DISABLED;
@@ -1095,6 +1096,13 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 	unsigned long size;
 	struct etm_event_data *event_data;
 
+	/*
+	 * Clear the status. No context synchronization is required here,
+	 * since context synchronization will be performed before TRBE is
+	 * re-enabled (see trbe_enable_hw()).
+	 */
+	clr_trbe_status();
+
 	size = trbe_get_trace_size(handle, buf, true);
 	if (buf->snapshot)
 		handle->head += size;

-- 
2.34.1


