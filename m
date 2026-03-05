Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6031F30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNFNTQsjW7TanYYeq+qX1AMPKNP12R4RI9aV79tx23E=; b=dfHjPcPUFSm4OrEF3N4XWs4Rja
	O7c0KMf4JElJTrKX2rgayDPaex8sOasURf+aHS62xOk5UZJb+7LLcrkReH1zKzyFI8Dh4rxoqqsZ7
	wl7qzc6MImxEiXg0zAD6HXClTdhz8sBtscH/JyVb7vesCtbSea3Qf0UKxcYQhM7L5YdFz07XyOSmj
	ICUYoBuHTlxNj+ukRMo/jSMTgCYM/M63L9W+VvsnLmM1Pq1OgaV0t5Pom3MbMkmhVs6F824Lx6nnh
	VWd4NG9doozjtFq4d134V8HT1LecryD9wI9PrKnE12qpJZRP1kYAN8PqgZS5fovpk2tMhDg67Diwo
	5VjGwsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mh-00000001YEy-455L;
	Thu, 05 Mar 2026 10:18:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5me-00000001Y9Z-2gbV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LNFNTQsjW7TanYYeq+qX1AMPKNP12R4RI9aV79tx23E=; b=kcuDaOvHUcJXPrtzvJCWlFBPBr
	owcVOd5lc8eBK4iw2co9ds/pO8OtK59WXPnvBV2Yg0UvUmKYrbTjmr681Rt6ThM7r8a0EvTqV4VGM
	hQ/AQGz8ilzd4t1QMDeDqfbbbKO6HuCP2n4Qop4tZ0uasX3/KCMmryOQLseaakWa0ReU9p+okjPkv
	LLBjLoYaVAy53XxRVCyHAyg2Wf1rw2d5Q7BC88OpeK2DzI8Tv28fcuEUto83+pON4Bf+myncG1Hg/
	LajPxnOgF00nrBOYOJrezfLXoyTGTeZ8Rj3gpXX+WFHcnznNft4D8sgr5jElJ/3vjSr9bfFl/vQtL
	SD7isaNQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mb-00000006SmX-1Yl4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B364497;
	Thu,  5 Mar 2026 02:18:10 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA9E93F694;
	Thu,  5 Mar 2026 02:18:14 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:45 +0000
Subject: [PATCH v6 14/19] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-14-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=1838;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Rj5YjG3a9FUnXd46ldIB7MbWVhCz6DwCoNjK9OT3uCo=;
 b=kh4409ClrUL0wxNcd/39KTeOcqxkF34JcrGZ8eHGOffl5zdiBioVib/bfdJxzxiXXaUYleTuf
 jvoL5QVITg3Be9b6E1zRXC/vwvlMXOWtJjVTg3jOFCXddeYDEdAdcvX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_101817_646072_2212C87A 
X-CRM114-Status: GOOD (  11.44  )
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

Control links and helpers on an activated path during CPU idle.  Set the
"path->in_idle" flag to true during idle to guide path control.

Since coresight_disable_path() doesn't handle a source device's helpers,
explicitly disable them alongside the source device.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 420e5a9cf38e64f133aa6780987d2d7c2804feb4..8763ca1d81674efa3dea9479a6a6c4025b652559 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1729,12 +1729,33 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
 
 static int coresight_pm_save(struct coresight_device *csdev)
 {
-	return coresight_ops(csdev)->pm_save_disable(csdev);
+	int ret;
+
+	if (WARN_ON(!csdev->path))
+		return -EINVAL;
+
+	/* in_idle flag will be used for path controlling */
+	csdev->path->in_idle = true;
+
+	ret = coresight_ops(csdev)->pm_save_disable(csdev);
+	if (ret) {
+		csdev->path->in_idle = false;
+		return ret;
+	}
+
+	coresight_disable_helpers(csdev, csdev->path);
+	coresight_disable_path(csdev->path);
+	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_device *csdev)
 {
+	if (WARN_ON(!csdev->path))
+		return;
+
+	coresight_enable_path(csdev->path, coresight_get_mode(csdev));
 	coresight_ops(csdev)->pm_restore_enable(csdev);
+	csdev->path->in_idle = false;
 }
 
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,

-- 
2.34.1


