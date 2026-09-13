Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEF0C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NWO1Hub6RBRUSQmKYFmH/2juClvSCDZCkaUOtzmRRo=; b=hQ9E6MZQUqjdt3xZhBcCr2KDIG
	OGIB53XcERPm+GPObrUCdKNA+tOh18QIZg5HL3fuPVzeeo6Klp0n/ToMqu0b2TJPQ168890+pasvv
	D8BO48XUYhIPJg1A92zOw2wn7mNsiUVn1gcJ4c0TymeO3hKgATu3wj9jU0GH0riF2GYyANuDQPT9W
	zTXrh6UclXwZXqfMDtJIouNEpB7SyTUy5rb2eNeUPKfSN+2q/tO5/BcDtbwGdp5ryW6odAdJkkh1N
	Ks/BftXW9c18EsYdl+yVhbpycIbWmeP+IQRTUTdbnhgBiAaemPu8sizeRmek0peWIuHu70TbXREgc
	oWMgTy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5kQF-00000001hDr-0vxm;
	Sun, 13 Sep 2026 13:39:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5kQB-00000001hD9-44x2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 13:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789306742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+NWO1Hub6RBRUSQmKYFmH/2juClvSCDZCkaUOtzmRRo=;
	b=GtvClwykDCdunRoZQk3c6bB18g/Z7NynasxYD06J8o2OfZ5Moh15o0URi00WOWku2WBk9k
	dOB0ld597toBRN/Qo57/X+g5Oa876LNlm+1WDyg6T06gwJBEFZFss19MaAFiTEnz7fm/kM
	jfmR3C8eg+CTgUIpU5QrP8mbPorOJQQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-TX1bL66jPCuDfPA-yerwnA-1; Sun,
 13 Sep 2026 09:37:19 -0400
X-MC-Unique: TX1bL66jPCuDfPA-yerwnA-1
X-Mimecast-MFC-AGG-ID: TX1bL66jPCuDfPA-yerwnA_1789306637
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17026195423D;
	Sun, 13 Sep 2026 13:37:17 +0000 (UTC)
Received: from F43 (unknown [10.64.240.27])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8DC82180049F;
	Sun, 13 Sep 2026 13:37:12 +0000 (UTC)
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
Subject: [PATCH] clocksource/drivers/nxp-stm: Register sched_clock once
Date: Sun, 13 Sep 2026 22:36:45 +0900
Message-ID: <20260913133645.1102997-1-juhee.kang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: aYMngoxGSZqcefhWVLB0zc8h2nkntPJKxiT79EPdPxA_1789306637
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_063904_090329_47418017 
X-CRM114-Status: GOOD (  11.98  )
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
---
 drivers/clocksource/timer-nxp-stm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 6fe098a4a33f..7572cd20732f 100644
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
@@ -473,6 +469,11 @@ static int nxp_stm_timer_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (!stm_sched_clock) {
+		stm_sched_clock = stm_timer;
+		sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
+	}
+
 	return 0;
 }
 
-- 
2.55.0


