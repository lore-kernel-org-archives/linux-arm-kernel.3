Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D61CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKXNGySjUJiX6/3GllpQ7O9YCp87EzXF/WJp8p9p0Qc=; b=3563zADgwl33kw09kdCknCqWxS
	Yx1L0BTnZ2iSdXlvqmp0rIwAAI2tfJL66i2POBudAJybXFd4YaxhN3KpM2B6mg9aQRd9FQXltzbbD
	Q6EEif85+LkvDohGQ+1d32sVLpGGpsGm3djrZf7raQognFALvhPYHOPzU9iqZki96JsELYz1djpwn
	9tskC2W/D0dkZUbK/SZ+yqq1QwUs3ZT0y28SjFOAKm1I1I9hIhMpB/k6I27yt0q5nHgbbzm3B4pdg
	60GRfMz9UzpK5j52uS49r/M8ibs1v34xNlftPpqnaWTLWek/HqAZkg1VBEUrr3Uk1TxFx9Y6epXKk
	Ncct057A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKG-0000000C0uO-16gY;
	Sat, 13 Jun 2026 06:58:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKD-0000000C0qQ-10kj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso14412755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333916; x=1781938716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKXNGySjUJiX6/3GllpQ7O9YCp87EzXF/WJp8p9p0Qc=;
        b=Zmsi/ubZQFYTPbJb8HIapkObnoX4aJ4JnH22fVeab0PmHnzY8l76t8aY4wGQQ7rYWr
         1CnpDqt8w37HsM1kRcZ1KJwgtrqtePLsJlir2P6tcCq7deUMwKYOXXlbTSkeS+cnYALe
         Vp5tQc2UAk1/tsRTlNhSeGVNAZ3/2rKNnrcmtFAggSHF/eAl1yzNyfMXcG0ZbwmMdrHo
         dbxitAfkEaW+GFYNEhteYN0TdhXy7r9bGM2n7ez9hxKPRdeVHDl9TzQEorTCdpNppK3x
         Q68/GSTiy5pWNxQktMfrlhVzNEG7Rof0dqg2li9yHfpjVt6/NaVNCvxG7+8DIVMWPUuU
         XSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333916; x=1781938716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKXNGySjUJiX6/3GllpQ7O9YCp87EzXF/WJp8p9p0Qc=;
        b=DwJlY7EH9zcgBqJI5MlP/X8NVgv2SAw78z4rXK+HbSnWXhwReMGs1x9GRxWlILOIVE
         EQh0YTGk2CI3UG47n65bEh5XUGzfv6U89NjnMXfifwcOGAnQYyJ6G8PLXUV1L/L8aiaA
         ztkQstVId03hVDM3rahE00G8x5YoW/PbKnurByEZcpQj0Q10Mb+9Z8Co5f8LB61dKGo7
         rHkqc8LcMAhgqoIJW690br3F7uZDNL652QYgZpGzPTbBvjfuv+2UiHkAE2hffELBtvo/
         tw2Ho4j5+CgqAyo4w5VAfFS5zkYIAeOS3YFJrAlph76XOvfGIBFZTqMTX+UgEdPDsOU4
         b4XQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IhqOw3VR1Oyn4cRVqCX3JFnqT9mqNW1g0ZcxYxRqwhmmoVrQ/0yUMazynIgWyxKhtiv938Dc0ssRGrZdlV/hm@lists.infradead.org
X-Gm-Message-State: AOJu0YzLUWf7Lc1McpOTfU3ZLI5Poi9s1BQGx0wASPQ6zLFu31QanDpZ
	7xthEN9KoGaaOgidRvAhRuekIFhChWw04dKi4TyKOUcVIUo8XuM56j7S
X-Gm-Gg: Acq92OFvhFlL8w1HWZCIMq5y7Og+etd+fGT+J7MRR84uO6yzjjAmm/3BMpx1QfVmGTm
	S6BxYEHAUOdPZzAHiKQNYazOliNG+UpF7NzLbAKpwcYFe1PD+ijUk72TSiiSyTehq21dsx6fDJO
	zqy7Ev3Z5PvwjuedZYYOTNMPH0dENdbLFF6soYR9EIEODEbU1XriWLf07j/Xd8f/RqXrUFRLtMh
	cHT2GuaGx2RX+ffMzBlb0AIbytwXnq8K+Jd321PBYHGH6WYRgNpd3mirz8NI04RzzTjas5f0bd/
	Xkm6IEKxpUqWL5S80DKBjTbuUbf27lHrfzwi9OoiVEIruLNXYkTQXL78zpcGrUuPI956DWjdLjJ
	T7uwCWUXWO5WcbYnF5xRCM8goZiSoND38+r+CIaX7m3azSwMkiXrhPJTgFqpwykmih4WTfOnIbp
	nhBdLU6DvMGNCUTqQ0zqh+W3L4BdgJE4Zroi7r83Y2+qb3eQzJiJo2
X-Received: by 2002:a05:600c:6287:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-492200516d4mr27804035e9.8.1781333915366;
        Fri, 12 Jun 2026 23:58:35 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:34 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 4/9] accel: rocket: Reset the NPU before detaching the IOMMU on timeout
Date: Sat, 13 Jun 2026 09:01:11 +0200
Message-Id: <20260613070116.438906-5-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235837_299103_23D256EA 
X-CRM114-Status: GOOD (  12.79  )
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

From: Midgy BALON <midgy971@gmail.com>

On a job timeout the NPU AXI master can be left wedged with
outstanding transactions. rocket_reset() detached the IOMMU group
before resetting the hardware, so iommu_detach_group() ->
__iommu_group_set_core_domain() asked the rk_iommu to stall and wait
for the in-flight transactions to drain. They never did, the stall
request timed out (-ETIMEDOUT) and the IOMMU core WARNed:

  WARNING: drivers/iommu/iommu.c:157 __iommu_group_set_core_domain
    iommu_detach_group
    rocket_reset
    rocket_job_timedout

Assert the core reset first: it quiesces the AXI master so the
following IOMMU detach completes cleanly. Move the detach after
rocket_core_reset() and out of the job_lock (it does not touch
in_flight_job).

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_job.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index ac51bff39833f..e25234261536b 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -364,14 +364,20 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 		if (core->in_flight_job)
 			pm_runtime_put_noidle(core->dev);
 
-		iommu_detach_group(NULL, core->iommu_group);
-
 		core->in_flight_job = NULL;
 	}
 
-	/* Proceed with reset now. */
+	/*
+	 * Reset the NPU hardware before detaching the IOMMU. A timed-out job
+	 * leaves the NPU AXI master wedged; detaching the IOMMU then issues a
+	 * stall request that never drains and times out (warning in the IOMMU
+	 * core). Asserting the core reset first quiesces the master so the
+	 * detach completes cleanly.
+	 */
 	rocket_core_reset(core);
 
+	iommu_detach_group(NULL, core->iommu_group);
+
 	/* NPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&core->reset.pending, 0);
 
-- 
2.39.5


