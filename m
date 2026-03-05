Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C379CF3092B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpDGoNTeUbLo5qNnUXtmn5WcyLsn0LZyW45R9KvHHfg=; b=d+sYNdWTqmwmH2xhPitg2EOJxR
	YanTHrzs+qRhg6So3N8L6wlHfSp/OFvq79iOLvx1HwE/hmT0oKgyFULItmZcqzLb25+TBtJLBz5qK
	pZPHaXcm0Ule0fBgIDDnoNmMs1fEiX4MEgxoyrJm/oaiq9VqE3jzUaLxNAijQ/+EO/Mqniig00s+W
	0a/pfxvHgwyfdNOKahwquOFwdt1GvPG8+HQk/nQNWv2232Ie2mr5OF9GsU4g6KYZq331z5UOMdJgm
	eK2A+4gM2OkHkzrJtsSbr+3XgIVuxDSeZSQxpfURz1v2P/P6xUfT/i9ZMSS9Ne33bDWsQ7z2ZFfwb
	E7axYtWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mk-00000001YK7-40sf;
	Thu, 05 Mar 2026 10:18:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mh-00000001YCT-1FR7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CpDGoNTeUbLo5qNnUXtmn5WcyLsn0LZyW45R9KvHHfg=; b=LGujBsh8S/d5inlb7noiMOdyvr
	TWj+bsLO6sg6GhmfRRPLz3S04gJYk68Ae5Ys6pM+CI7r1ishLW0C1xCi4d9lEICy7yikk5CxeMEGn
	sV2Nlh1r2jujKJhEh0Pkk78/MGtvu8Cinsb7IID4CeopCVBgGCsiCbt2qdla9zrcVPF4y7F4YpGLd
	n2qFyu1jSksSIwn6Woolgikf9EahJCb5zuF6vOIJeO8VvjH0E46JZjtt45xADtE7eg5logYAkOxFS
	OAphYGeyjT8h3lfbqufgNK+7VK2i+II2+3WHSa56mo+Z1VTm+zYaxH7WtA+HOZzcjvqZCCjMjzukm
	r0tqiI+A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5md-00000006SnB-2v37
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90466339;
	Thu,  5 Mar 2026 02:18:12 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF34E3F694;
	Thu,  5 Mar 2026 02:18:16 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:46 +0000
Subject: [PATCH v6 15/19] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-15-eff765d211a9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=2305;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CN/AHGebiMtJBSr1f59iKUlX2Or9kv6d3wDvjiCt76M=;
 b=vsbiIhBA7eLHN65rcFoDcew3GSFciMZ8U4sMSzhz+EA/x8Fu8wPM1/lKSJPDbHQMXzw92zvla
 LfHfWe27e5AC+AHB1+hQ0x4GilZqjpK7Srrf6WvJuno/vUOQbc9Z7EG
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_101820_079514_2B10973C 
X-CRM114-Status: GOOD (  10.97  )
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

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states. Currently, this refers specifically to TRBE as the sink.

This commit registers save and restore callbacks for the sink via the PM
notifier.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8763ca1d81674efa3dea9479a6a6c4025b652559..25ed45129375d83adb2e1b30664aef15535e8164 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1727,6 +1727,22 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
 	return coresight_ops(csdev)->pm_is_needed(csdev);
 }
 
+static int coresight_pm_sink_save(struct coresight_device *sink)
+{
+	if (!sink || !coresight_ops(sink)->pm_save_disable)
+		return 0;
+
+	return coresight_ops(sink)->pm_save_disable(sink);
+}
+
+static void coresight_pm_sink_restore(struct coresight_device *sink)
+{
+	if (!sink || !coresight_ops(sink)->pm_restore_enable)
+		return;
+
+	coresight_ops(sink)->pm_restore_enable(sink);
+}
+
 static int coresight_pm_save(struct coresight_device *csdev)
 {
 	int ret;
@@ -1745,7 +1761,18 @@ static int coresight_pm_save(struct coresight_device *csdev)
 
 	coresight_disable_helpers(csdev, csdev->path);
 	coresight_disable_path(csdev->path);
+
+	ret = coresight_pm_sink_save(coresight_get_sink(csdev->path));
+	if (ret)
+		goto failed_out;
+
 	return 0;
+
+failed_out:
+	coresight_enable_path(csdev->path, coresight_get_mode(csdev));
+	coresight_ops(csdev)->pm_restore_enable(csdev);
+	csdev->path->in_idle = false;
+	return ret;
 }
 
 static void coresight_pm_restore(struct coresight_device *csdev)
@@ -1753,6 +1780,7 @@ static void coresight_pm_restore(struct coresight_device *csdev)
 	if (WARN_ON(!csdev->path))
 		return;
 
+	coresight_pm_sink_restore(coresight_get_sink(csdev->path));
 	coresight_enable_path(csdev->path, coresight_get_mode(csdev));
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 	csdev->path->in_idle = false;

-- 
2.34.1


