Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02001C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pDXMH2EQyW2omp6T+HBZCfP4i2cSnVMwsotT6o6R7ho=; b=vhcNghvPMhaJlL+QArG9AA+ijF
	OQnmQln6ITVPEzvwXC69hWdsix95TKZSxMKwyNJNwZdSzahXs5B+lx2Vo0To0eeFgeObZhjbbc+d3
	2vnHofcY02X7i+nEtG8FvBCzz1tbal10zCqBBgPyeZ6TzBlKfEw3SLCv5Qd/yd/EulsdcPMtkFGTF
	IPhVSp8IK73VNEswt1ps6fo1MM0fw/z4+zxXV2n52Sk24Ns6q/q1QTmx55g/K66X9suvO4YQoJhVL
	KAv1b8ngROvlYR25NeoCZjkIF7qa8TbmkycAjgbBPh01U7w74GT79Uk+8bR3CxbhX3XnHALHBk1mv
	XjdKmr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyCQ-00000008uED-4AUm;
	Mon, 19 May 2025 10:58:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyAM-00000008thG-0FRY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 10:56:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 704CB1655;
	Mon, 19 May 2025 03:56:01 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 715913F6A8;
	Mon, 19 May 2025 03:56:13 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] perf/arm-cmn: Add CMN S3 ACPI binding
Date: Mon, 19 May 2025 11:56:04 +0100
Message-Id: <7dafe147f186423020af49d7037552ee59c60e97.1747652164.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_035618_137993_D06439EC 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

An ACPI binding for CMN S3 was not yet finalised when the driver support
was originally written, but v1.2 of DEN0093 "ACPI for Arm Components"
has at last been published; support ACPI systems using the proper HID.

Cc: stable@vger.kernel.org
Fixes: 0dc2f4963f7e ("perf/arm-cmn: Support CMN S3")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index e385f187a084..403850b1040d 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2651,6 +2651,7 @@ static const struct acpi_device_id arm_cmn_acpi_match[] = {
 	{ "ARMHC600", PART_CMN600 },
 	{ "ARMHC650" },
 	{ "ARMHC700" },
+	{ "ARMHC003" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);
-- 
2.39.2.101.g768bb238c484.dirty


