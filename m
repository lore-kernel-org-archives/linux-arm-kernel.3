Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ABCCC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MZ97wBggcb4AZnAp8JyxdnSo+z3EENDs+SXWKghbgJM=; b=0qJ1rKZdTly+TQsgp34F/NkcpW
	vF8bd2i2609qH6aITM87kQS/vaht9m5IIuBK83oLAoUM+m+dfUlaZxWZwMiARlLC+oNGl52DrOJWq
	SYVxDIXAcnUOMpXOF5qphTN4GYtQFrS84D3PTc+A8o6c4hXBnJw7CA7q6ktgz1HF2HOr19BPYb31F
	R+xAfd2OTlYJhTghYMp4xnVynG/p2JS4SzElHkUDZXDj9U5ZXvZHFPQb395l6gTqVwBgAg6wnQ7Xl
	Glg75v3oJWfBHieO2bneBsm3U/LC2jMTl15zg6qMAIrrQo6bvnABWHudlqk0t0mYGrk3b/Zd/v3I7
	DvxsNEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJmg-0000000HalW-2ony;
	Thu, 15 Oct 2026 11:38:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJmd-0000000Hakm-3U3Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792064281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MZ97wBggcb4AZnAp8JyxdnSo+z3EENDs+SXWKghbgJM=;
	b=AlQr6XVABaM/qkbhYi6ATinGT5ytJwcRtUOGx41BBePAZeLc1BNqOGul66x4cp2VqyyOeQ
	o1hQA+khS2HFJrB0hQhRnoyEzQUwybwShhZaayP6IMAzyjH01XxQv5gHsrpCW9IZgb8KEC
	Y8jy4ekTi/AKw1kLpZ/eIQ8uv6pTbag=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-498-P3_sEh9lMb2egh4ePKniRw-1; Thu,
 15 Oct 2026 11:37:55 +0000
X-MC-Unique: P3_sEh9lMb2egh4ePKniRw-1
X-Mimecast-MFC-AGG-ID: P3_sEh9lMb2egh4ePKniRw_1792064274
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D8E6C1956060;
	Thu, 15 Oct 2026 11:37:53 +0000 (UTC)
Received: from F43 (unknown [10.64.240.22])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8CA1C7D5;
	Thu, 15 Oct 2026 11:37:49 +0000 (UTC)
From: Juhee Kang <juhee.kang@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Dustin Black <dblack@redhat.com>,
	stable@vger.kernel.org,
	Juhee Kang <juhee.kang@redhat.com>
Subject: [PATCH v2] clocksource/drivers/nxp-stm: Register sched_clock once
Date: Thu, 15 Oct 2026 20:37:38 +0900
Message-ID: <20261015113738.435986-1-juhee.kang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: KVstnfCA0JE0PtvG3Cjz2rCnQLu7iet0_IPXsQvKmV0_1792064274
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_043803_947483_08C8E985 
X-CRM114-Status: GOOD (  13.90  )
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

Each probe updates stm_sched_clock before calling sched_clock_register()
again. The call then subtracts the counter value saved during the
previous registration from the new STM's counter. If the new counter is
smaller, the subtraction wraps and the timestamp jumps forward.
(e.g. from 0.4 to 32.9 seconds below)

  [    0.403653] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps every 16243448316ns
  [    0.404056] clocksource: timer@40120000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 14456668980 ns
  [   32.890509] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps every 16243448316ns
  [   32.890882] clocksource: timer@40124000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 14456668980 ns

To fix this, register sched_clock once at the end of the first
successful probe. Clocksource and per-CPU clockevent registration
remain unchanged.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
Reported-by: Dustin Black <dblack@redhat.com>
Signed-off-by: Juhee Kang <juhee.kang@redhat.com>
Reviewed-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
---
Changes in v2:
  - add the comment
---
 drivers/clocksource/timer-nxp-stm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 6fe098a4a33f..23b2d44e4b78 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -211,10 +211,6 @@ static int nxp_stm_clocksource_init(struct device *dev, struct stm_timer *stm_ti
 	if (ret)
 		return ret;
 
-	stm_sched_clock = stm_timer;
-
-	sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
-
 	dev_dbg(dev, "Registered clocksource %s\n", name);
 
 	return 0;
@@ -473,6 +469,15 @@ static int nxp_stm_timer_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * STM counters run independently at the same rate. Use the first
+	 * probed instance for sched_clock to avoid timestamp jumps.
+	 */
+	if (!stm_sched_clock) {
+		stm_sched_clock = stm_timer;
+		sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
+	}
+
 	return 0;
 }
 
-- 
2.55.0


