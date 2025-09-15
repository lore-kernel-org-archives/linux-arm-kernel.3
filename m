Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05B0CAC59C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lauvs8peGBn0YP9TosJ3PNmGH1VXP0j63UV88dGvsU4=; b=17pFKUSouNlR47ZtLtOvFY5IDs
	pG0P5JZIRtFIbh2UJo8g2R3p45CewV4JTTvjRMHpb6ECImNjIbwb4lCczw+FWFrLWlE4fvVtCFb3T
	9M+8apXDgPP+9IDgDqr1QyHjQIIdb8Yd1AJ8HQvzv0lfnGFXHOh9GS5evQYxFHuKyJ86WtanL9c1E
	dNr3QW8yVW5umg3ZRTJsouxdi92RqY8FbORClSpU54WyOikYH46+J5YNNCTBlMmFnKNWROnR4omNP
	ZZaSNvBP7kzWZzW8sm3UdMesA2mN5TuK6pe2pbuRenH97wITIKI80IcKunJD2pnt7y97kr4ABTch1
	0xUWDRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xn-00000003gUi-1clu;
	Mon, 15 Sep 2025 10:34:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XO-00000003fxA-0vWL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Lauvs8peGBn0YP9TosJ3PNmGH1VXP0j63UV88dGvsU4=; b=SeCglR5guFhcc5f0CJpzkhO10v
	yqyx+kb5gRtD/0Eyw3R03ZbuIohqgCVr4vKkINLuiX88eZAWuWv32IdYw4t1XUVjK6Tml/X7EbEKh
	334kzxi+XSGyDn2R1yDcHEQ23ZCKAwK9uFczW8sdO+OpWj7X9fBFoOdB3Y52LLJdRZmkBudZS06eu
	hwOExmVmgiQugGYii67G/6cwI57P+vAf1w6RjAo3w8twvTUWLyScb5g16w+h3Ej3zkEFYjlsdx7Gi
	/vPUCqAFmiP8ixya90aBb9IlUB2+PvyeiWp1O5f3I3TXB8ynUxJyOmu/i3sT6xa4rzKKP0MIXPk6x
	ustJjYLw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XL-00000006vYe-0YSV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 166ED1BF7;
	Mon, 15 Sep 2025 03:34:10 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD64F3F66E;
	Mon, 15 Sep 2025 03:34:16 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:42 +0100
Subject: [PATCH v3 19/31] coresight: cti: Introduce CS_MODE_DEBUG mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-19-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3360;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xbCyzFdSyKdW/Boxy/g0UeeFtjRy9qtZnZ+88gjnYOk=;
 b=1ngft4VAC9ScXYlRn+FH8g3Ar/vFLt6VPC8uOqEMEB2+62PA2bLnB6mVCKFaKm2acq8ROdZUE
 HlBKkK74RCiCSbWWyKpekDi/qtnWNQgoZh22XZsIrAMp1lZno7RDeEB
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113419_615035_2241740A 
X-CRM114-Status: GOOD (  14.73  )
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

Introduce a new CS_MODE_DEBUG mode to indicate that a device is being
used for debugging purposes, e.g, if a system enables CTI for debugging
but not for hardware trace

Update ETM4x driver to mute compiler warnings for the newly added mode.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
 include/linux/coresight.h                          | 9 +++++----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fbf18ec8cf9abc30d109a676dfbc5d..3e0039f75f5aad104cb86561bf37971c7dc4e408 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -112,7 +112,7 @@ static ssize_t enable_store(struct device *dev,
 		ret = pm_runtime_resume_and_get(dev->parent);
 		if (ret)
 			return ret;
-		ret = cti_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
+		ret = cti_enable(drvdata->csdev, CS_MODE_DEBUG, NULL);
 		if (ret)
 			pm_runtime_put(dev->parent);
 	} else {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b63433e80d305588c18b084408496690480a7af0..4218cefca63d7b2f3b102e74d7f007ebc7b08861 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -934,6 +934,7 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 	case CS_MODE_PERF:
 		ret = etm4_enable_perf(csdev, event, path);
 		break;
+	case CS_MODE_DEBUG:
 	default:
 		ret = -EINVAL;
 	}
@@ -1132,6 +1133,7 @@ static void etm4_disable(struct coresight_device *csdev,
 	mode = coresight_get_mode(csdev);
 
 	switch (mode) {
+	case CS_MODE_DEBUG:
 	case CS_MODE_DISABLED:
 		break;
 	case CS_MODE_SYSFS:
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 39781ba24ee2ad9f3065770409aafb0e5af57fa8..462876b5a870f3e93ad2a1807a9045d5eb115ccd 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -253,10 +253,10 @@ struct coresight_trace_id_map {
  *		by @coresight_ops.
  * @access:	Device i/o access abstraction for this device.
  * @dev:	The device entity associated to this component.
- * @mode:	The device mode, i.e sysFS, Perf or disabled. This is actually
- *		an 'enum cs_mode' but stored in an atomic type. Access is always
- *		through atomic APIs, ensuring SMP-safe synchronisation between
- *		racing from sysFS and Perf mode. A compare-and-exchange
+ * @mode:	The device mode, i.e sysFS, Perf, debug or disabled. This is
+ *		actually an 'enum cs_mode' but stored in an atomic type. Access
+ *		is always through atomic APIs, ensuring SMP-safe synchronisation
+ *		between racing from sysFS and Perf mode. A compare-and-exchange
  *		operation is done to atomically claim one mode or the other.
  * @refcnt:	keep track of what is in use. Only access this outside of the
  *		device's spinlock when the coresight_mutex held and mode ==
@@ -344,6 +344,7 @@ enum cs_mode {
 	CS_MODE_DISABLED,
 	CS_MODE_SYSFS,
 	CS_MODE_PERF,
+	CS_MODE_DEBUG,
 };
 
 #define coresight_ops(csdev)	csdev->ops

-- 
2.34.1


