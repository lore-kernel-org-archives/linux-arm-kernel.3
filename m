Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA76C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6yQabqKzBtID9dtyYYCPez/kIoO+uT8Kjhe0fHsNup4=; b=DHk5NCqhT3yRgwM+fZaKMA46AZ
	+6l8YgDtSZFdzD7j5THdtWQy6/BidwCTvmaYPDrfSefa/xlCAQ38FQK06PKqoAXdREzGProh9w+2N
	p/lWVrnXcihpxEmxKMckLJ3cSyh8Z1nM2kWu8ap27KkxQOQNoTiNXnh8cnqVW0teukPD6eMm6MCiy
	6WKSirBEKL5ATdM2qAecxbx7H3OXzTbWWZcdV588BxsT2D6PDtGvZ40K/lYbvk6N4rB8nYTUYqyxP
	BOjJdFb9rUZVK/I1V750+gUXJi5A/bM6TG1HqmSwn+EIxllfA51akSexPYxvP292pp/cn+5ykCMDg
	7aHP1fWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Cv-00000008vwq-0g6v;
	Wed, 02 Jul 2025 16:21:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWy8J-00000008a6l-3ug3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:08:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C96C22D9;
	Wed,  2 Jul 2025 07:08:03 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C82003F6A8;
	Wed,  2 Jul 2025 07:08:17 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf/arm: Add missing .suppress_bind_attrs
Date: Wed,  2 Jul 2025 15:08:13 +0100
Message-Id: <acd48c341b33b96804a3969ee00b355d40c546e2.1751465293.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_070820_012240_3E8510F0 
X-CRM114-Status: GOOD (  10.40  )
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

PMU drivers should set .suppress_bind_attrs so that userspace is denied
the opportunity to pull the driver out from underneath an in-use PMU
(with predictably unpleasant consequences). Somehow both the CMN and NI
drivers have managed to miss this; put that right.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 1 +
 drivers/perf/arm-ni.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 031d45d0fe3d..d1df2f3adbc5 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2655,6 +2655,7 @@ static struct platform_driver arm_cmn_driver = {
 		.name = "arm-cmn",
 		.of_match_table = of_match_ptr(arm_cmn_of_match),
 		.acpi_match_table = ACPI_PTR(arm_cmn_acpi_match),
+		.suppress_bind_attrs = true,
 	},
 	.probe = arm_cmn_probe,
 	.remove = arm_cmn_remove,
diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index de7b6cce4d68..5f20baf59024 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -707,6 +707,7 @@ static struct platform_driver arm_ni_driver = {
 		.name = "arm-ni",
 		.of_match_table = of_match_ptr(arm_ni_of_match),
 		.acpi_match_table = ACPI_PTR(arm_ni_acpi_match),
+		.suppress_bind_attrs = true,
 	},
 	.probe = arm_ni_probe,
 	.remove = arm_ni_remove,
-- 
2.39.2.101.g768bb238c484.dirty


