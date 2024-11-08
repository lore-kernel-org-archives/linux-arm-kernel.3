Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F341D5E12A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=von0VATUbmkAXtyUIAh4ZopKLVWbRkOEeG8Zx0qdBUQ=; b=tqEEVSWy8/LTXdCwI5kk+Md849
	8oaxM0oFRIdS+EjGdeKFVVkm2USgArxXlvGDyQ1ILbDNJmz8foM0ty4XadmUXtqvXA2hRQ1pBEP22
	Aztk2gLYzj/xcsj2ud9/WhmyxXh3czNYuBrYzT/y2kNFH98eW+fhnWdxNYHDUKGn/0aDlCpaWJqhw
	RU+7Dg9/0HA/bVH0rGimZ26n653mNydNRmo2blz/u7hPS6sNcWGNIK2AIhyhAlazbyRrJaAM0RFll
	ub5AOLlwMrzFMlMHroRqBIJ2vOhfJzcZ3L0lr2bunfFcBo1adoM/jWAqfsQXpvssjQBozbfPZig8E
	7HrczOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HFw-00000009MA8-354T;
	Fri, 08 Nov 2024 05:10:00 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HEB-00000009Lxf-2Mpf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:08:13 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea863ecfe9so35473247b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 21:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731042489; x=1731647289; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=von0VATUbmkAXtyUIAh4ZopKLVWbRkOEeG8Zx0qdBUQ=;
        b=PJwkbsYm4W/v4x3Qwtx+a5J2kz/egIsCAnbCeOgw0G1sQ/dCr01DJzTfI+EyQmzXkM
         u/gqQeFXn0W2Cc/GHjXhtfIN+HTYfldVrVmbCNMj5+svH4wIYhXjZpktWu+gJgwJuXGr
         zMvzrMUOKMfDofHNKopQ61q0IabZpU+sH1q9qIxI5pb51MkzVdtcQLgo7XTKYHileuRD
         zK6tcekLaKH1g0R89jtWgHks4Viww1LHJmco772wmRKow3OuWAIUXNYd9s9g7FKKTlff
         8gUABS7o/rpmsWbtMMzAL9gFImseI5NtH5sa6IeLg774tjn8ksU9Lxw1lE53G0D4MqXC
         qxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731042489; x=1731647289;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=von0VATUbmkAXtyUIAh4ZopKLVWbRkOEeG8Zx0qdBUQ=;
        b=LzDzzKw2BKDm+kSS+d7+fjGQg1js/0qu54XhQDkqUz40x+3595+RgD7gTfbjec1lDp
         UkkG53YFoCaXWHsAvKda9QpwUSOdUTQlMctfWRp5pZ80GeiFJqCLTFvWC+xvRjhkRUzP
         MX6N4ANAM9khmhvuogtWbovJOJAaCdjLLzjxGXWfBKFGagzUery6/DxkyyzEClGcyaYv
         +O2CDxudyUp4GP9F4ZaGwos230e183JO7YU/eS8yXB4+GSD5pION1qFFeB6jbsfpM532
         wV8cnUB3TXwWr31to7IpjDEbo33C1m+J7ywL1OlAP723Jop6jUgL1fHxVEMaF/RCLtZz
         k5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHlPs9j+T8TN97cT83h4R7Mi6J8CIcyfAQ5/HF0WcmbLaY5gPvIjCpk/UpSZ0EYj0yM5Rr8HwFFHGqh5SMaurf@lists.infradead.org
X-Gm-Message-State: AOJu0YyOU2KOrUX8XCIbYtkZ7TLjrjdd/bgJl81PL/QnmP2lBva43bRX
	A2mNYvAmMMrsrhRqkyM3fnJa1bW9RgpB4D5LBz49HQAgYTKLJMyCOOkNjlO8M9UhDKwSzYBkBhe
	LJw==
X-Google-Smtp-Source: AGHT+IHf1OGIq7/pvMGuOdBfBHjFf/WXAEr9CNSUYS3G1/Tm9SGTNY03PZ4oy45jtL7gQWDxy/rglOLQzS4=
X-Received: from colette.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:ce7])
 (user=ctshao job=sendgmr) by 2002:a05:690c:200f:b0:6ea:34c3:742b with SMTP id
 00721157ae682-6eaddfad76amr150937b3.6.1731042488912; Thu, 07 Nov 2024
 21:08:08 -0800 (PST)
Date: Fri,  8 Nov 2024 05:08:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108050806.3730811-1-ctshao@google.com>
Subject: [PATCH v2] perf/arm-smmuv3: Fix lockdep assert in ->event_init()
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, Greg Thelen <gthelen@google.com>, 
	Namhyung Kim <namhyung@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Tuan Phan <tuanphan@os.amperecomputing.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_210811_631134_1B7893E8 
X-CRM114-Status: GOOD (  14.94  )
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

Same as
https://lore.kernel.org/all/20240514180050.182454-1-namhyung@kernel.org/,
we should skip `for_each_sibling_event()` for group leader since it
doesn't have the ctx yet.

Fixes: f3c0eba28704 ("perf: Add a few assertions")
Reported-by: Greg Thelen <gthelen@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Tuan Phan <tuanphan@os.amperecomputing.com>
Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 drivers/perf/arm_smmuv3_pmu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index d5fa92ba8373..dabdb9f7bb82 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -431,6 +431,17 @@ static int smmu_pmu_event_init(struct perf_event *event)
 			return -EINVAL;
 	}
 
+	/*
+	 * Ensure all events are on the same cpu so all events are in the
+	 * same cpu context, to avoid races on pmu_enable etc.
+	 */
+	event->cpu = smmu_pmu->on_cpu;
+
+	hwc->idx = -1;
+
+	if (event->group_leader == event)
+		return 0;
+
 	for_each_sibling_event(sibling, event->group_leader) {
 		if (is_software_event(sibling))
 			continue;
@@ -442,14 +453,6 @@ static int smmu_pmu_event_init(struct perf_event *event)
 			return -EINVAL;
 	}
 
-	hwc->idx = -1;
-
-	/*
-	 * Ensure all events are on the same cpu so all events are in the
-	 * same cpu context, to avoid races on pmu_enable etc.
-	 */
-	event->cpu = smmu_pmu->on_cpu;
-
 	return 0;
 }
 
-- 
2.47.0.277.g8800431eea-goog


