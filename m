Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E7FC5919
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2NyDWOK+eHx4xT/gJyPNx6GY2DrrurOqAMbsCwAius=; b=FrzCWNIJyqcwiYuJxyVUg7MJzj
	gg3jHSqNSJrwV3AarfEzr7ysBy6M2m+BxkddTLe/QeXyp0CPf5qzoddfWvOq2Gg48g+KYf8IQ0ZIa
	idFKwmLHLRJGvKNnMg8f8dGJjjClWqXHw/eeYihvU9Mxp//bj+ZfEXLLyiFzjGF3YK9wfxrP3xd/j
	j3hi8yvLGHq+FGBYJABKIDBqfJ0Gwzd3tXs/sffkfvpcZG0giJ4WstMwOsRpCmZBJr6AzcogSDEKQ
	0B1hh7/KMgPzoHBiPk+Bjw4fALaOXwOrDhD2uEi1/pVrWU7oKjcWqaNQdO1i3YBsnYeU+RGRboS4j
	s4Gkks8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbe-00000005n7F-0xxX;
	Thu, 26 Feb 2026 09:24:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbY-00000005n2e-1IHr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=t2NyDWOK+eHx4xT/gJyPNx6GY2DrrurOqAMbsCwAius=; b=pBkGVYg3CdfGeu389StWpbC8rd
	j8fO+2mbDjJboqYZRIbuTccWkeGDXVfIl06yMFsjs5ka3GImwYOxKemOd9ZsGI+hqf8GDLqacTA/P
	ttJDT/jY4VFq0tN9X8Gdepjsf7TQ/Es0132Pp0/30A3ez1ZSKVg59rVWCMICKvtITUge3H/ee1a8b
	5PZPSJ1o3/+g2S0ccDUDIrJCl+cDq+Q3d07svsAp/an0SUQDV1Zneg5OFKeP2/y/DrlISDYTNkCZq
	k850o1BWLV6pnbs52eE8p5rBova7sNY9UP4l9SFYc0FrMNg6k5ZdD5TFYsXPN3xDmA2iRt2Cd5rqi
	Eonyd47Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbV-0000000AbTs-1VQA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72C61153B;
	Thu, 26 Feb 2026 01:24:10 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05003F62B;
	Thu, 26 Feb 2026 01:24:14 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:56 +0000
Subject: [PATCH v2 8/8] coresight: cti: Properly handle negative offsets in
 cti_reg32_{show|store}()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-8-b30fada3cfec@arm.com>
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=1566;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ye21p2Z8xpYMwCHdRE3woYwpjNxaruoyhn86mQr557I=;
 b=EKYiu4kRhBuqL+Uo0b2d48MeSRDH0H4DurSO6lej+Cw/AkGUN4wa+c0nsR4rjs/34IaolNNxN
 nfRLdjrlhf8B4c4FuZ+hfvm4sHJgqhlQ/iVdZQ7IH74dW6BNj+EXvSX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092417_684229_15B0F0A2 
X-CRM114-Status: GOOD (  12.12  )
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

Return an error when the offset is negative.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 9ef44956ebdc7781717d773fa014165989df2048..4c0a60840efb9ecc47850c1eb5a7abb41b49c5cc 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -252,8 +252,11 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
 
+	if (reg_offset < 0)
+		return -EINVAL;
+
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
-		if ((reg_offset >= 0) && cti_is_active(config)) {
+		if (cti_is_active(config)) {
 			val = cti_read_single_reg(drvdata, reg_offset);
 			if (pcached_val)
 				*pcached_val = val;
@@ -280,13 +283,16 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
+	if (reg_offset < 0)
+		return -EINVAL;
+
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
 		/* local store */
 		if (pcached_val)
 			*pcached_val = (u32)val;
 
 		/* write through if offset and enabled */
-		if ((reg_offset >= 0) && cti_is_active(config))
+		if (cti_is_active(config))
 			cti_write_single_reg(drvdata, reg_offset, val);
 	}
 

-- 
2.34.1


