Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DE8CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/6U30xhVv6V/OllWka10lpmVdIsxk7KF/mWNRD7vXBM=; b=GULwbQRrc2pVQFPtx4jDAMdnEI
	MIUgTikHiMD3qB5yBCRVY87QDQtdPJaOBdcdA+RbZzQZnNQbMzQVJd6T8N92r13TmqA4UjAraXDzf
	fg2+7I+BVMkT3/i4asyycGMVe2xR6TmWGxkSx3K1bIZdLud2QN2XHlt8dV69y+dhCTd5KANQGgKE9
	MMbR/zIBGssEH/PfPv5ywpBYC0iGHq+J1vTlWMkqFXY40hbkWm9kSiZVd/erpWV+r/2NgxLNfadUc
	Ms8zvbHMP4xzCHt1MmKl2qV+HT1srKZcdd/WcJP8R0zU0VB+079hebsUeqno0fQ/HhG+/mYqq1VNO
	SyiUFd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFEM-0000000BiW3-4BJu;
	Tue, 04 Nov 2025 11:29:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFEJ-0000000BiVF-1fon
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 11:29:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64034284521so9334313a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762255777; x=1762860577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6U30xhVv6V/OllWka10lpmVdIsxk7KF/mWNRD7vXBM=;
        b=K3PQgr6elxgrxHM0hUv66XZA+puYMnJ4sOOtS/TSe62E6L0zQMsok0Opry3CMBrYnM
         zfuuAla8cSWObq6i6QPsS0ZJ9qSnzFn6W0QzNlpqpYg/FCLMSbEXyq8gthLYKBTpc79V
         8T1KeLG7qk3kZTFqTk5EioxC4wB++u5UMWp9Jww18BoQEGzmXIMwOCn11FCAUORxokpE
         dXeuUFD41CSUTS7c8/19hiroB1jtRFQOVYv0+aYckCQilVrMdrc02d9ByiUTcgpo1Nrp
         i1zlSqmVWowK3vNWNzicnkIPeLSiCuDaZpmUqj9zCS1tL3njiWe/F81I9WaYCDRhrJyj
         bslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762255777; x=1762860577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6U30xhVv6V/OllWka10lpmVdIsxk7KF/mWNRD7vXBM=;
        b=T4kaTFzqfxrsQWWEg0pfDI0j9G0lZmlilmIJNjl4SsnmX+xR7ehGRqna/zXkxtuikQ
         gC3nVlln6yC/OEGGgKd0RcPuDL6srfuIbpLOwPZEOx0rqwb4jPZepQrkcJKvBRh9fC6c
         kelAwBcURiL9ZQ8fs67JqvJWQCRU9/708+7LVSNg/mnXaV4+IAxoclJVeBxYnFU64Hgh
         ybsEDe9fnxg+RBLeQZCy9w9zAAnFx7T/6tU/VM2lrpPYnLj0S+qhdxva8q1MQlAVAUxA
         2WEf8/wLfEgSabJPbKYtZNa1xJkDlQcKFseOsYnrZdmBs4JCRxrxTZOng+LiyrQrsIad
         7V5w==
X-Forwarded-Encrypted: i=1; AJvYcCWzrYYl1CDD9m0Hjofw58P+Hutd1n3JBn27TEpEsyf+WDShw1mqEqS+Z/74SZLN9D/PMIwpqE/NJGnSDMAAZosf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx7BiQWzFVUmNHAsC6+F3fXLaZiViA0TFp4zn4f/HrxElTXLQa
	znKnc2uGvjkfOSeXSuDBDRDDf8ngS3Jq0e88zDNQDSxYJKHbnbZ8JamKp8ksUG04Tr8=
X-Gm-Gg: ASbGncs7PWKX41A5v1QjFKc/2j1BxN1mzmL7Bx6Ypmbtnm/y3gyc7BnbbKwrWdZDnaz
	PUAXR4gMzC4ok2GmV/9YYZaRtTDZJOVOfc4t087J+wZVV0XFOzoAmERyCMzQDU98WZYqH1lJWTG
	xcxFh9EvUnt8B9pOkDQouQXjpjvLP+fnz8fwKFZL1jpkOA0cCSfyL0fZLOdfXrT4ae6vQiYC0CC
	3W+OAhqGXej67qbALj85gxRMxOK7mXfn1byDFli4xz6QgsfPB+9x4IBwVvwxZczhWNR6R1RgapB
	KYsEDMcS/OhY1ZUSZYYdYO52shSDOiMKSLB4Ep4Bb87inK1Zsp9++lSP1oVv8UU+5q9N9gXiDp5
	T2McuvQEaEzas0tpMQT7csb3PmWNYiot+gRlCdEbkhiyRb3/mb9b0NUlUlBvEks+JwJZuVHk0/8
	7an5E=
X-Google-Smtp-Source: AGHT+IEH6YLnLzKBUaOBrPF+gt/Vwu3vr6ZVwfIBKjg5lysKKReAoUvEVvkYcdEX36hZw8BRX3tIXQ==
X-Received: by 2002:a05:6402:26d6:b0:640:a356:e78b with SMTP id 4fb4d7f45d1cf-640a356f0e2mr8579226a12.7.1762255777493;
        Tue, 04 Nov 2025 03:29:37 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e680578esm1820370a12.10.2025.11.04.03.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 03:29:37 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
Date: Tue,  4 Nov 2025 12:29:23 +0100
Message-ID: <20251104112923.143408-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_032939_690353_F54C78A9 
X-CRM114-Status: GOOD (  16.05  )
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 01813e11e6c6..8e76ac8ee4e2 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1692,7 +1692,7 @@ static irqreturn_t hdmi_irq_thread(int irq, void *arg)
 {
 	struct hdmi_context *hdata = arg;
 
-	mod_delayed_work(system_wq, &hdata->hotplug_work,
+	mod_delayed_work(system_percpu_wq, &hdata->hotplug_work,
 			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	return IRQ_HANDLED;
-- 
2.51.1


