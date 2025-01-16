Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9734DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MjvGgCGSCeQvRGRuwkiPIiN1y+2mykr23IUZce21P28=; b=yj1En3SODJP3IZNRfd5pWlrvKX
	vAf6xQ9jgf9SIb/FSmfZwFudhf/2Jm4pRrV67PwF3WEDEOwawfT3nAQwLb5QB9GBpzD5F8epds0hC
	2G3tC8mk5iN9IoxrSUEZlA2zp3LLjYgC0/e3D89OFPIRnLUZZLwvO10sE9i4vufrHec4XTKr/5JkS
	1oRAyu1+1Xa/NoHJE1yLNbsshVJNx6F3gI2Qnnw6PLJviD0AegB/gQa6XeNHV27GeHfRHM0XWG0WS
	P3F+8z0t+vmIO8kwIhxA2nYw5Wtcrj1Mua0/7uXW9+aLOqnTOY6ubfpbwBuV+ez+bha5TJgI4L260
	xfdVfJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGwy-0000000Dl7J-21dm;
	Thu, 16 Jan 2025 03:53:44 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGvh-0000000Dl0q-2oJq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 03:52:27 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50G3qBDE3873040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 21:52:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736999531;
	bh=MjvGgCGSCeQvRGRuwkiPIiN1y+2mykr23IUZce21P28=;
	h=From:To:CC:Subject:Date;
	b=ghfFe12VKIRJrfl8NquWjVn4W44r3WInv1osxv2TN7DdD6HLSQAW9IRKoFCWkwkAz
	 cys/d9YYRbs1XMuTJml2vQjQ/CSX9qsf9D4ID4HW1eoTJC/Nty4Kx9JVBURRWu3Z09
	 v67jCN1nUwaQ1pTwBdCWGw1iPBsxeefiLJXMesKA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50G3qBif008210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jan 2025 21:52:11 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Jan 2025 21:52:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Jan 2025 21:52:10 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50G3q7mq094079;
	Wed, 15 Jan 2025 21:52:08 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <krzk@kernel.org>, <vigneshr@ti.com>, <p-mantena@ti.com>,
        <s-k6@ti.com>
Subject: [PATCH v2] arm64: defconfig: Enable SPI NAND flashes
Date: Thu, 16 Jan 2025 09:21:45 +0530
Message-ID: <20250116035145.370734-1-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_195225_798834_0719B318 
X-CRM114-Status: UNSURE (   9.33  )
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

Add support for SPI NAND flashes on ARM64 boards/EVMs such as:

1. W35N01JW on AM62x LP SK, AM62A7 SK, J721S2 EVM, J784S4 EVM,
   J722S EVM, J742S2 EVM
2. W25N01JW on AM62Lx EVM

by enabling the MTD_SPI_NAND config as a module.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---

Changes in v2:
 - Fix commit message
 - Rebase on next
 - Link to v1: https://lore.kernel.org/linux-arm-kernel/20250102120043.1404843-1-s-k6@ti.com/
 
Repo: https://github.com/santhosh21/linux/tree/uL_next
Test results: https://gist.github.com/santhosh21/71ab6646dccc238a0b3c47c0382f219a

---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e729948b7d69..35f312a39e38 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -283,6 +283,7 @@ CONFIG_MTD_NAND_BRCMNAND=m
 CONFIG_MTD_NAND_FSL_IFC=y
 CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_SPI_NAND=m
 CONFIG_MTD_UBI=m
 CONFIG_MTD_HYPERBUS=m
 CONFIG_HBMC_AM654=m
-- 
2.34.1


