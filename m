Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EACAD5D693
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 22:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gtY+hQlMOB+auZZ9MVGgAKHoK8XC+h0pobgnTF7y3AY=; b=zQ1CrW+cdC9OqFD8znRqjYoB0E
	RUDtJrRp0FMYrCqthRov+gGXYwc8jUQIKGsZAX5JbC6+1cfr5Q2GLvYELHbz3nbIBK/yrCYv9VAB4
	Jph3vkNeIpbeCfAVCPSJbSrxFNK81iHXfoVkjeLRZx2pb8xqavcA/rQwmIV8RwH5ufEeeA4dxbIs4
	aoj7Uc5THhAISunIMmCRd6yO8GQI08tTVdgGawpc8nkB5OwodU6XdSot2iHmvBCDwSo1dsAqANapp
	6txfTFdG58bOXcTpmJU4XwUgs4H1VXLy8mN7Br0C1R/kJ7QeLovk3qo+wW9aphXwEqVwGL7/+lbnV
	wBwBDSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AZZ-00000008Upt-3cdO;
	Thu, 07 Nov 2024 22:01:49 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AXp-00000008UhJ-1j9K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 22:00:03 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e36cfed818so22893027b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 14:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731016799; x=1731621599; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gtY+hQlMOB+auZZ9MVGgAKHoK8XC+h0pobgnTF7y3AY=;
        b=Zz5fXfSAO90Jdh63igESEhxX5vQkZl9J29FTH5FGxq1mMWlBsDPD88Mck+Q1PNGpqy
         ZAvaFszYMSk2JjK/WEf8MQ5TV/rm5FCZRHPAvlrPX8yRdklt0fJVh5E+POiTnLQwj7Q6
         PjIMxBbAkpSv61brgkaA7bWPN+c8ulPvg+WmKUXi3ck1n7KJOBrft4uAu1dClzSVBCfi
         SCn42uhbLUvDF/zrihTf9K97Y16ifAdophkSGe2mK8maoSNGcgJ5pdTUJ6PECWjRa9WI
         zYLbjgeLZhfU2b8fFKM59qig+dL9n6YfPzksdV75L4pNOaf0duk3X4lF7aEUE5D8w+t1
         kHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731016799; x=1731621599;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtY+hQlMOB+auZZ9MVGgAKHoK8XC+h0pobgnTF7y3AY=;
        b=tRASjpMQ+JmUk9DeyKdzYv0EWRUx/FVv/9KR3o70ocl0ACYpEUKleNvZ//IoJeDFe0
         VqUTQPbbpcLsFK6bvAFHJnot+pKWN+bYtS02ux+ieSX7XZycrF9Id07jC1/pE2khXAAA
         JobF939Lim1WuBAuUhCDkFoXgm//PF9pBUye30NCen1W4/+7DuV5iUAV2BaW+dIj0X0a
         fXH+lr0++lTBkqtRYtgRujpjyFKKTAOCdk58N29wfpnBc7Q761TcFpMNbc/zIjdstwLU
         M702bOnE2oYOJlyQFbRJbJX6vmYqt2A5kBtnBZfNdjEyHyADFD61BDaBOLdChjOJYDj8
         8KaA==
X-Forwarded-Encrypted: i=1; AJvYcCUn4dK8OAPUbM1FNGxGCxlbazJgY9Jj7LmsMgB+iUaSCVl1Uo2yVnIJFdHGEkvFGzCXElcv70af6x0TwJnCV+Dq@lists.infradead.org
X-Gm-Message-State: AOJu0YymPQylxpzCqTfjXu4SuY/YtiEWCHSjktECyLL1PxZ0iKBsFRjX
	E0DyFo3NFSyqyG0Qs0sj985tZulDd9dmkc7advzy5AZphkjdsh9MS2ZKOe+fTnDMu8Vk0Ej9qjs
	9wg==
X-Google-Smtp-Source: AGHT+IEBoD/+PLidUWzTFlXIEkUGdpqIY92WXMs23wir0KWmLxUl/0R1hyGSqpFepm1jXlRwU0nKDc6bsIk=
X-Received: from colette.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:ce7])
 (user=ctshao job=sendgmr) by 2002:a05:690c:d19:b0:6e3:eab:18b1 with SMTP id
 00721157ae682-6eaddd6378fmr47907b3.1.1731016799454; Thu, 07 Nov 2024 13:59:59
 -0800 (PST)
Date: Thu,  7 Nov 2024 21:59:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107215921.3518636-1-ctshao@google.com>
Subject: [PATCH] perf/arm-smmuv3: Fix lockdep assert in ->event_init()
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, Greg Thelen <gthelen@google.com>, 
	Namhyung Kim <namhyung@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Tuan Phan <tuanphan@os.amperecomputing.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_140001_689414_DB05BBB7 
X-CRM114-Status: GOOD (  13.70  )
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
 drivers/perf/arm_smmuv3_pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index d5fa92ba8373..09789599fccc 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -431,6 +431,11 @@ static int smmu_pmu_event_init(struct perf_event *event)
 			return -EINVAL;
 	}
 
+	hwc->idx = -1;
+
+	if (event->group_leader == event)
+		return 0;
+
 	for_each_sibling_event(sibling, event->group_leader) {
 		if (is_software_event(sibling))
 			continue;
@@ -442,8 +447,6 @@ static int smmu_pmu_event_init(struct perf_event *event)
 			return -EINVAL;
 	}
 
-	hwc->idx = -1;
-
 	/*
 	 * Ensure all events are on the same cpu so all events are in the
 	 * same cpu context, to avoid races on pmu_enable etc.
-- 
2.47.0.277.g8800431eea-goog


