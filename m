Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB78D5B87A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 01:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4D2fKjhV+xXooGe5GhIIOsVNBVoSb/WsPEzHiyDzi2s=; b=er/YyfVf84ei7q/osniS+OZhmh
	x7p/tmnE/usIAk6dB166hUHxWg+U5gSJU26XLny1QHpSzP7wZTJ1hDMsIlIuargeRr7wYGmPDsmKS
	gUzpkHgPG3b1957vnEtzo75jVYM94DzzyQQw1ZsRrLy6sVwx2qfnBrDxwUoT8IbNKwFqEMbhAVy+J
	vW5MDr5p9fEem59x9jOVG4jl+KzvGBnBIyXj+bg4lC5KhayU2+YyRY5XTNHTtAM9PW79tzI71tfTM
	U7YunEoiNtfBpGi5QEKmAAZx61oxG6og6eufuKf0Nf8RpuaYSrJdFnD7yfrJhFYdjDGX5Oj/Wzpov
	odop7A6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJjX-00000004UDK-0cCd;
	Tue, 16 Dec 2025 01:20:11 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJjT-00000004UCU-2X32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 01:20:09 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6446704997cso3570856d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 17:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765848006; x=1766452806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4D2fKjhV+xXooGe5GhIIOsVNBVoSb/WsPEzHiyDzi2s=;
        b=Bo5WRxWuq5tKh2hBmQMU3SXJs+URGndI216C2uBs0Kxh0bNSuUkpLobVyoBtHPXE86
         AmyjPRO92oGHYEQfZM3wWr0d1qfE5Pbwl8VQY/cZr2ocmVOYgBRBqzMdHGzNTB2O/fWl
         8auMdWh9cj+d+ABwV6MpICVqh575y1tn8PdOICToVIqGO9A185yL3nB1fkyBA8QPa6Po
         5viosWyLmpBHp7FOX0J8x8F3bneNSSohPXzEHArni14btTyC/lcbEtXerCwBM6znrcdJ
         IMkKcZ8J/A1cNyA33by+7xT/sKcZ6UABQ7BrGr9YNAWXAGcp97AjnE9uDzRoyASqXeNS
         j6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765848006; x=1766452806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4D2fKjhV+xXooGe5GhIIOsVNBVoSb/WsPEzHiyDzi2s=;
        b=Lt1HWv+rT0bUsQaHfkYS4Vs25nkrn/IkaZ7w3gh23W+dOSAELAfmOkcd/kn8zqeC3m
         8w89Rw7eOmJ5Xf4Z0OPCX8df56NDpiQnWF6omT9du4PD+A55232TPRf3UfWwh2JHn3sz
         NNGGoHMPsdS4AH3YMDZySDHQiOiOmEb+TJXqZOaLEjooyP3vbS47EI4TkHnjjgS1FjLr
         37oM60W+NSPINBjDUshONcS9eaSozoFjgqLYv7HMIfarwx4KqESy1DBFjLB3NgSav2/S
         VyqA8X8N/+16+YuMmuC25Q75wN0oQ7uKxiep+n7IKp1ko76/G3mFEc6hH8QqQYdTtT7+
         YxtA==
X-Forwarded-Encrypted: i=1; AJvYcCUkmUyMQbLomk3+Ap8JKMfUA+OnRR7dQERj7lPjbVe+cnkackMjdJAqFa0bLwvcHsWvlQifuJADVoQD4KegqWxU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7TkM78Si5a0tgdWEVIIv91qrKb0qP1ADXPl5bqY0zzZ8+1uEQ
	/yjm4ucXerKmqjlrB8w32m9i5mjTx5iVxfzy4UNVkcra9fxTjsJhoblF
X-Gm-Gg: AY/fxX4/O0v0OI2AxLsf8fBZBUpdwH8TZNL0xEGMjNksM/+T0EYy1jFhZJnr/65ku24
	HLJGF/2wockD+EgiPwcxWhT+vrcPmHoVEpv0L5WwKFkvDn7bqDKeFLMXQ5cOhRxMDOMiPvtvzJC
	BWzjir7wX5YvBucPYnAzhxSLO0lAy0227eurrXQgPZ0rhuUmUJWVeCLL6rQo3tzZHZnydYLgPut
	Hw976ghlQMlhtZxj7A0/w2Y4znhGCbFwp4mXPxOnywFGYDq8cxytZdIGRmJd2HlQ7pvbdaWrQFe
	lDImaM4vHtqxWf9U6wYdM/waL6GduWiKCQBmMUCW+yk8zAZo0ZCK+qKqMj0r9iTvRVNNpBdzw+6
	4MvOSSxUX44xwYRqUnHGr8Fp6cAd6hbDw11niXNoIyIClYxOQ21MrhM/vHOUtVZb2xkGKBm7zV0
	sKfscq7Q==
X-Google-Smtp-Source: AGHT+IFfmvm90rdPTujJGHfPtnqhB1WsV9zGN12cd9dzeHQbXYRNvb06ZpPINTYrYrF+Tfl+/bGheQ==
X-Received: by 2002:a05:690e:1a44:b0:63f:9cef:d5f4 with SMTP id 956f58d0204a3-645555eb79emr7067344d50.36.1765848005823;
        Mon, 15 Dec 2025 17:20:05 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6b0:1f10:bc87:9bd7])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477d58416sm7082747d50.10.2025.12.15.17.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 17:20:05 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH] drivers: perf: use bitmap_empty() where appropriate
Date: Mon, 15 Dec 2025 20:20:03 -0500
Message-ID: <20251216012004.341288-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_172007_695853_ED02E255 
X-CRM114-Status: GOOD (  12.35  )
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

bitmap_empty() is more verbose and efficient, as it stops traversing
bitmaps as soon as the 1st set bit found.

Switch perf code to using bitmap_empty() where appropriate, and
correspondingly use boolean types.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/perf/riscv_pmu_sbi.c         | 2 +-
 drivers/perf/starfive_starlink_pmu.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 7dd282da67ce..9dcc22fd48ef 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1244,7 +1244,7 @@ static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
 {
 	struct riscv_pmu *rvpmu = container_of(b, struct riscv_pmu, riscv_pm_nb);
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
-	int enabled = bitmap_weight(cpuc->used_hw_ctrs, RISCV_MAX_COUNTERS);
+	bool enabled = !bitmap_empty(cpuc->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	struct perf_event *event;
 	int idx;
 
diff --git a/drivers/perf/starfive_starlink_pmu.c b/drivers/perf/starfive_starlink_pmu.c
index 5e5a672b4229..964897c2baa9 100644
--- a/drivers/perf/starfive_starlink_pmu.c
+++ b/drivers/perf/starfive_starlink_pmu.c
@@ -450,8 +450,7 @@ static int starlink_pmu_pm_notify(struct notifier_block *b,
 							 starlink_pmu_pm_nb);
 	struct starlink_hw_events *hw_events =
 					this_cpu_ptr(starlink_pmu->hw_events);
-	int enabled = bitmap_weight(hw_events->used_mask,
-				    STARLINK_PMU_MAX_COUNTERS);
+	bool enabled = !bitmap_empty(hw_events->used_mask, STARLINK_PMU_MAX_COUNTERS);
 	struct perf_event *event;
 	int idx;
 
-- 
2.43.0


