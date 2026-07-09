Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD711C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOGzjDjSGv2rOBgOAR8vSGhS0pwmQcF+24mcL4l+cCU=; b=Pg47CK1fZ/kMoaqbdYWFKhbVqj
	dbaI4NDDzpnhBVOJi/cOrFKweFq9K34QS2H+Yx79o7xhXuNn73rvjLXQrK7mog7JVibUvTtJstt3F
	8XFDR5zXxbbkIGZs4qmN2wZTgAOozYeSHTj2zlE2RUDy8xBU8Bz7Ja8q2a0thLOwC0wPHilLnruim
	CioPI33vn835ZaDIU+8MA575aarYr98FfomXpk00oRa+Z19QtL7ZEfvZVrxCmtL5whU2mTW+yZMl4
	uvwfs82fsI8oRYDv7ukUOU+3LO4852GVRPygngsBsBpRY7boHthPTLceLNyKcbIDcokQ6XqPe+qHw
	uCDlFFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpv9-00000002nly-3PYx;
	Thu, 09 Jul 2026 14:40:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpv7-00000002nkV-2N5k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:40:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AD56152B;
	Thu,  9 Jul 2026 07:40:04 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47FC43F66F;
	Thu,  9 Jul 2026 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783608008; bh=6tXjr5QO/6YpXAvLeEr0jkgC5AsB7mddypUG7wFuDXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NI6w7jDQxpdSmGIVoj1i5//Y0khHktxUQkccnY6MwIR5wPUQOSz303ROQdY8GLuzg
	 FHfN4uazbZXOMbTCY8H/1R9SYC26BKRW3cZnVXlSGXIDemLkmdaoIyKGqATXutcD+Z
	 l7C6Rw36CM2h2m49Pr871KAufRsX/FNEfbmkFnro=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 1/4] ACPI/APMT: Use stable device ID
Date: Thu,  9 Jul 2026 15:39:53 +0100
Message-ID: <c113eff51124250fc5798589ce905052046b43b3.1783605641.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1783605641.git.robin.murphy@arm.com>
References: <cover.1783605641.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074009_653877_146CB951 
X-CRM114-Status: GOOD (  12.04  )
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

The APMT node format includes a unique identifier, so we can use this as
the platform device ID to give userspace stable and identifiable device
names, rather than auto numbering dependent on how the table is parsed.

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/acpi/arm64/apmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
index bb010f6164e5..ba48fcb26d52 100644
--- a/drivers/acpi/arm64/apmt.c
+++ b/drivers/acpi/arm64/apmt.c
@@ -79,7 +79,7 @@ static int __init apmt_add_platform_device(struct acpi_apmt_node *node,
 	int ret, count;
 	struct resource res[DEV_MAX_RESOURCE_COUNT];
 
-	pdev = platform_device_alloc(DEV_NAME, PLATFORM_DEVID_AUTO);
+	pdev = platform_device_alloc(DEV_NAME, node->id);
 	if (!pdev)
 		return -ENOMEM;
 
-- 
2.54.0.dirty


