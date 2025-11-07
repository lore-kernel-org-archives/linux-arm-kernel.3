Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F23ACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zya9CDjAWwz/YQhtW3O1MV9PxrsdkYyA1iOu9tElgJc=; b=xIZd6JxsXd0lPJ0OnSLTolcbxM
	hE1/ftt+hrHhrkVr2MP9h3dXXdRq8GrpGiTEhgJObSejORojiuY8QFRIU4OltVSrh07l6hE7vXyPR
	Xlicn6W7v+cbnXuD0zHLvh4dJSgfQDPztKsUeQgOj+PktYDUVo2jPyh7/apyjuRkuHOrHt83ndI6v
	Cuml/S3n+OpS1chz8Uy6iPjeVJ56SLEVtqKr+pgcC0f7YdX18jdcMs2x88iYNFHyhY6Cxq6EvvemV
	34O5qHykpNXIzmm1ffyQMRcVRDA8cNQlZ3F0Wva/1e+ooMIhoV82M5Ao9l7fa3g2vazYa8CZikx6A
	IzU6l7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNDG-0000000HS9y-3tUA;
	Fri, 07 Nov 2025 14:13:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNDE-0000000HS9D-052k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:13:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-471b80b994bso8532825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762524790; x=1763129590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zya9CDjAWwz/YQhtW3O1MV9PxrsdkYyA1iOu9tElgJc=;
        b=FUdnK2qY79aF2BCMPWkTDtBlkbWD5c8unKObqqJ+P1leOhPan/LzSK33+tQy5gJeHW
         n4RmTHJwEhkNkSchVUd5ZFq9I/IEI+M/fXNkp5aTEa9+VdXJR+2KlcqDEosO8JcVpSMa
         jvdNZBfOwU680vukM1E5K3ljOpvt/cQVeKRhvRch0BNLpLpURXDjNgbTbnXSReX2TvVL
         T7qn/UXWOqLrXGHBuhBEvDOf8BKRUG18oq5BoC2wYYttM3Z+42UW0JTwCTj2ywxaqc+f
         eZbD0YC18PelnkvRHvHXXRmJnxJyQBGN3Yel4Xm2UuDGUoeLnXe7ySnZIPPckC+OGH1Y
         uo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762524790; x=1763129590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zya9CDjAWwz/YQhtW3O1MV9PxrsdkYyA1iOu9tElgJc=;
        b=mumN0eHTjCXgQAxp4/iluT8d+TAOu6szQVh9kxlr0oSwuP24YDKmpyosi2WIdErtFV
         OGLdYjIElaDVM0CPQRh0eal9HiA/PPavi+TiPaJmOkcy8Mxjd1vnijuz+UQmpsUqAPdE
         DfxOXzCY4zf+4D11rEB9CCBcDgpXFm+st4HXdM5px8OitFr/DGkFoHW1SE1ehNiSxYaK
         lMsQ4lHsWWBtBsJAlO5WAG4WdJo04Rv+nlZjmIZms0GukDtaOUQsG1B8+HeaO8G2Up8h
         Ox/5qOwsoOcjk/wv8+G1440iUvNgCE9oj1kvHBRoBUjFqogy+pDyYtF6kcCTIVvA9MLg
         sXRw==
X-Forwarded-Encrypted: i=1; AJvYcCV7rDVL0v2WdFHA8pALiG6v039QM2Dg73hbxr8m+rhxTJ67+4oF0ZMHMOp7l01EbwB8bzXxcmuYxwCjajbfZH3E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6fWB47PZYdpCvKCE/ZwWPa9KIm6DpQanCxqix84h+EFsdXa07
	i2+wTF3IoFBFEF2SN1he35xoj9iNz+3g59nKvpyLPGb9UsJVeHayatr0QJ3S+IrbNaM=
X-Gm-Gg: ASbGncsxzSHF2vaiuvOgULDpQ4NYLmmha2JirW9x16dup+3o8YayBMrC7DFPhzf3AQE
	zumspIx8y7D+PVg3efyDuARaE0iwf+wiS+y27quT2J+hpBWrY7lF41oAqD85ybPNThNAamHWHj3
	7+0STwapzIF+mQdVFfcU1X/zT167rP3xmnTZ4WWaPkcquC7cZF+9C8ewF77pfsdKH5uPjYvY24m
	mQsGyuNcc/DxARGfIrdyTi22lymCYPV5VNmw9nVk8GMjJlDc01WLjxguxa1rv3rAphx3fqAwqjN
	NvpLV8wy5XOfRXahqYbqAxL4FgVmOE1J5q4NNKpyQH9kfk6PHGzdqYtS/M8bEWTLXTpzkNmOmST
	h0ZG8PLTZyJZskKFYfxXHP/lZFkK7nbXuyYCANU95KNu9AquVl/h8UHyc0T98hlTIbQAD5m5VZ8
	D05at06lCeqBapOkpDZl1uBOgE2RPPABwwiKk=
X-Google-Smtp-Source: AGHT+IGp7Uv+Rz0H0a9Tbxc8WVcxFYh+xPnB3f9zZgNkWgNSCruoFQ5+kEx67gRvEzujnx6ZhHmG0g==
X-Received: by 2002:a05:600c:1f10:b0:475:dbb5:23a2 with SMTP id 5b1f17b1804b1-4776bc904efmr24244345e9.16.1762524790118;
        Fri, 07 Nov 2025 06:13:10 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477641b622asm42998605e9.4.2025.11.07.06.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:13:09 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 15:13:03 +0100
Message-ID: <20251107141303.223254-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_061312_096939_FDE68A35 
X-CRM114-Status: GOOD (  16.88  )
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

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 6559d72d5d42..9083367ae2e4 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -255,14 +255,16 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_free_mutex;
 	}
 
-	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
+	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME,
+				      WQ_FREEZABLE | WQ_PERCPU, 0);
 	if (!mdp->job_wq) {
 		dev_err(dev, "Unable to create job workqueue\n");
 		ret = -ENOMEM;
 		goto err_deinit_comp;
 	}
 
-	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
+	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock",
+					WQ_FREEZABLE | WQ_PERCPU,
 					0);
 	if (!mdp->clock_wq) {
 		dev_err(dev, "Unable to create clock workqueue\n");
-- 
2.51.1


