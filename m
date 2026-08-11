Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D042AC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCz0YHuViuBY7u6bH/PtQQQ8c7S/xgDkr5juavEWHHA=; b=icWxAOssoGBSwcOg0VjxLNh3EA
	X71zFmS6SFE0d5ATVu6Z+N1CzHAu64giodqj4Pj3pM3hbKmhmnjpUSCgrvelfOYuzrXtKVcrj1SKC
	kjicHNDj/z0O9sBUb+MlPnPadAmvGwZNxLM4IyPiKcmDMMOYF6cGvQqtQhJj9Q1GBereR4OSf+yIl
	LS6HWNahEe3SvvmjwZOfE9l/62bZHQ3EMUvR5tm9As6VHPMuqKt36IKuUTJBZj1iSV1oYcWBr+iHM
	x/JrPCxjsfUZZ5dq0c5OpzKCKVZaBfB/5JQQuxAzRwEgL/tJT0FoEdAlh4Z62KDqRIJfPVT3buDZI
	ROkBQP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp0p-0000000ERBe-2nxm;
	Tue, 11 Aug 2026 16:07:35 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp0n-0000000ERAw-2BBH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:07:34 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2850743a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786464453; x=1787069253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCz0YHuViuBY7u6bH/PtQQQ8c7S/xgDkr5juavEWHHA=;
        b=RcjW9z86//mqTMxI8erXj0ZzzLitpA22BmFtjyolyEMX/HaV8vI53WM489wgyrVtwm
         hULGufEL14aLzL0xTFsuLT6f1mlIRjnGJuTpgQdjtwP0lyAvlUne/F/LTFCRXwtR86+u
         OnlBqdVwPxh3sBIfzF/yvJtQLa6or2OJ59n+OuzfuP8XhJUBXQ0QesBcZhv5h2eBs77K
         p0wiwakhveyEB7e1Q/USZQiV/0BFSVdhpAftdMkhw9ZcpzoBuNwoOCmrg6GIZVULzQF/
         suveMGG/09A1lo6/egT3ZwOimUSJCQOuEm5wXsB1qAyJZa6JJ4BLzBFuh8CceE9Y0s+n
         mLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464453; x=1787069253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCz0YHuViuBY7u6bH/PtQQQ8c7S/xgDkr5juavEWHHA=;
        b=OU1JwrfFD+/9pz9nxZgIigg++1LFvYICdFJKLxv7IOh8UX9OFv63AJxKNy/VZk5DgN
         JahbDo22zo+gw/jRH4+F0OJ1Pe3/65D+GCi7fUok+Q/0PVPYgBd6cq+ck1RjskTpwJoQ
         6EIys0KQxaya7MsVNDXmU7Y4ecgv0Yf+2pnfCbfuXXcmk7OD7zVrOmsQKzLMqipsBZqP
         d/bNcA0Y2rthYVyQU+q5Wwn0iIFGpK553dmtOlsl5tBmSfIy2b2BgcHvE+gaYU1IaVb6
         JszQCRPU2kUwNkC26J5Q0TS06RluCnFCgE3BQxtqsn/ObjgZXLAf2G7sDS/nAyYoWTP5
         2FuA==
X-Forwarded-Encrypted: i=1; AHgh+RrGGJB0tqcUunGcz/9jga6JV7qEbqfej637zNo4ght4sLmSQIDpHVAWdcFGM/vOQV67VBvnwunom3S8V/xxRgOh@lists.infradead.org
X-Gm-Message-State: AOJu0YyHlO8MUVzOwjOQMFCuAUhNNEZgSi7rI0EcCL+bW73Qq9MXy+Lq
	lWGMmQT9D5XC1Y2lu5INR+MS7Kw9/4x2LrGEvSE/OXqPvIv3cXWP6pklYq8hxytemNg=
X-Gm-Gg: AR+sD1381Oshi2u7QGqLSV+eZTmIk0Fs04dLB/u68lCaEgupL8eCgsv+aU3aa0xjybc
	5VLKdN6Ru8y50aF24WzScT8TBaIrZUY8d9dNecDOchtQ5qLSyYlnsXQFqRA64ACRh4mSHiZQQq4
	54d2ml7VbfePBdYhGKxYdl8Kl9ie/dlf8fcSkx9UMBqIRzUMC+TMwbYLxkAEXx2ENbqejdZF+bN
	nm6cDCHUSemqTI9Vzx2YwhexQUMCMo0ofUVi5tTwotb3kxc9lbHbZXWxdskbPOFf/GXYHilg5oh
	0C4Fjry877ur7amZn2R+5xvJH0atYKewBaDbPqpAlmmzInHv5BPDglALyQ6FOfgKLP5N0FnotRB
	oTsdwlLGRtXtCo2bhcESpN4sHycWwHo9X+Ft6y05Y2VMkzC7vRKBFigNfqODLlaR5J4ARiy8ueD
	JvZ2b6+VgA19jv0fyy8xpSCdTUXA2FVcBN90FUYVq06y3GTfQ62ZfgDyHWpiKnuYEee+3k+tfgc
	7wSBdGmvuAupUX3234=
X-Received: by 2002:a05:6a21:6497:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cc2bb05975mr6307163637.33.1786464452412;
        Tue, 11 Aug 2026 09:07:32 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3d0517csm893108eec.9.2026.08.11.09.07.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 09:07:31 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v2 2/2] perf/dwc_pcie: Skip sibling walks for new group leaders
Date: Wed, 12 Aug 2026 00:07:20 +0800
Message-ID: <20260811160720.28580-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_090733_563241_5792FE5A 
X-CRM114-Status: GOOD (  15.61  )
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

for_each_sibling_event() requires the event context lock to be held.
perf_try_init_event() only takes that lock when initializing a group
member.
The DWC PCIe PMU walks the sibling list twice for every event, including a
new group leader whose event_init() method runs without the lock. Although
the leader cannot have siblings yet, the lock assertion is evaluated before
the empty list is walked and produces two lockdep warnings.

Skip both sibling walks while initializing a group leader. Group member
validation is unchanged and continues to run with the event context mutex
held.

Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
A system-wide DWC PCIe PMU perf stat completed successfully with the same
debug configuration, without lockdep reports or kernel taint.

 drivers/perf/dwc_pcie_pmu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 7b2e28aade73..a6667ac19a99 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -417,6 +417,10 @@ static int dwc_pcie_pmu_validate_group(struct perf_event *event)
 		if (dwc_pcie_pmu_validate_add_lane_event(leader, val_lane_events))
 			return -ENOSPC;
 
+	/* A new group leader cannot have any siblings yet. */
+	if (event == leader)
+		return 0;
+
 	for_each_sibling_event(sibling, leader) {
 		type = DWC_PCIE_EVENT_TYPE(sibling);
 		if (type == DWC_PCIE_TIME_BASE_EVENT) {
@@ -452,9 +456,11 @@ static int dwc_pcie_pmu_event_init(struct perf_event *event)
 	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK)
 		return -EINVAL;
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu && !is_software_event(sibling))
-			return -EINVAL;
+	if (event != event->group_leader) {
+		for_each_sibling_event(sibling, event->group_leader) {
+			if (sibling->pmu != event->pmu && !is_software_event(sibling))
+				return -EINVAL;
+		}
 	}
 
 	if (type < 0 || type >= DWC_PCIE_EVENT_TYPE_MAX)
-- 
2.50.1 (Apple Git-155)

