Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7312DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx7pR0XD6MdYI//7sjDhp+ITUUaPYsnAtZeB6vCSpNI=; b=xRGu3FfX/Sa5e2zJYw4bA0zeVN
	oZQJ5EU9jMX81I/oGccBc/+/t+59dtlOBvWjX4e8ICc7Z7pw3X5dR8t6P/5DTo1A/oTVIpJFOaOiL
	ruBfW1kxKhW7vrvf7hdJcae3COBtLxqckkhRFZDi+xb4K/AciB9uJNDC1SnJp3oURy3V+wEh1XEMd
	8HdVLwWkTc55pdQLPDAJX5pF86F/OAMnVY/O2RTs0B0NhXQNP+V29q9TklaLbsASMdjQLn8TBV/Dk
	Sh2vQWVXHudmYGYbxbbzVCGqf02f1E2kTGOZU3B79ycs2cJB/CD1Fv9QrPBXTJajBAzwwOYY1gg3K
	FA/9Lovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpvG-00000002nq7-11ho;
	Thu, 09 Jul 2026 14:40:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpvC-00000002nmm-2um1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:40:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A0DC3594;
	Thu,  9 Jul 2026 07:40:09 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 60CBA3F66F;
	Thu,  9 Jul 2026 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783608013; bh=2mFo3OE2eaYUGoIdVv0wuVIiddazCtiGJ1VldpM6fWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VnBr708xZMN2uPoV5cQtPu5NX3MIy7JgCBJGeQvfz57Nmf+Zy1bD9k5OXOH5GCQDY
	 F1QkI4RK3OMz5IX4MVI0lEkqcZv95NKi2z0i4RCQA+uA/RJ71DC9fNqBHa+dJj1thW
	 DVQ9lDXNOqm3gcJwi7zq1Jv20DPLsC2XPF9dKJpw=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 4/4] perf/arm_cspmu: Make IRQ more optional
Date: Thu,  9 Jul 2026 15:39:56 +0100
Message-ID: <fb2cab05c714f24f703b242c8f8b8e9e4df938f8.1783605641.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1783605641.git.robin.murphy@arm.com>
References: <cover.1783605641.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074014_781234_0F8619C5 
X-CRM114-Status: GOOD (  11.97  )
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

If we have 64-bit counters, we can reasonably assume we'll never have to
handle an overflow before the end of the universe (since we're a system
PMU with no sampling). Thus even if firmware does specify an IRQ, we can
still continue in the event of being unable to request it. This can help
systems where IRQs cannot be claimed exclusively, or are broken in other
ways.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 0b26a1588eba..4ba47bccc99c 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -1257,8 +1257,11 @@ static int arm_cspmu_device_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = arm_cspmu_request_irq(cspmu);
-	if (ret)
-		return ret;
+	if (ret) {
+		if (counter_size(cspmu) < 64)
+			return ret;
+		dev_info(cspmu->dev, "Continuing without IRQ\n");
+	}
 
 	ret = arm_cspmu_get_cpus(cspmu);
 	if (ret)
-- 
2.54.0.dirty


