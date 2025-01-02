Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56575E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PlyBZfExEvkhoQt1gX0M1GJlJo7DHqgYf5VfKbzFXbw=; b=BY/SBzH6ZUlAvTe3WTgfjpwbp4
	nvHhOkG2GDmJfFb4vhtdkA9bp37UE+RxVEtRXqL4iVQtNE7dth2izvglPf0iM1wUVqPyBe3EGhNL7
	uvnzQVfkmsmCvw6SuqjeB9kR9vCyJ3AzWiGlWRM2Yuj6qd6Xg2G9aZmHdziFHbj9djvKB+GJG++dM
	xKy9unU4JsR6hwLXTZLo90TMc9oVpkI49hKSRF2UECOw0KUi7jhRg4aero+8U4R/1/KqMOTjy0A5n
	dAcozXXecEA/kkNRKuWhMbRbsA1yyGs8SPDzZwHI5EUTz9Ff745mGXre4K824++xGbEX/n8pocoUK
	7IHA0nww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJu9-0000000AJBa-0COU;
	Thu, 02 Jan 2025 12:02:21 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJsw-0000000AIyE-3IJd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 12:01:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502C0xWW1883392
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 06:00:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735819259;
	bh=PlyBZfExEvkhoQt1gX0M1GJlJo7DHqgYf5VfKbzFXbw=;
	h=From:To:CC:Subject:Date;
	b=Bb9/ORPNjZRn9pDP+NwCFmqqbX7ce0g/wG3VuE8PHzNezys33CYYlDk27fXALwpj2
	 yq3TfQaEhgAFL2LdwSpRmXdDDtNlyLt86jn4vWOyD0GMWJ8NRTP2Kzw3Njd9JoT1D0
	 VVi/6/ERUolKLnE1C4LxbuHgOuS+wU9lCQzAUYsA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502C0xrV015420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 06:00:59 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 06:00:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 06:00:59 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502C0u3O040379;
	Thu, 2 Jan 2025 06:00:57 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <vigneshr@ti.com>, <p-mantena@ti.com>, <s-k6@ti.com>
Subject: [PATCH] arm64: defconfig: Enable SPI NAND flashes
Date: Thu, 2 Jan 2025 17:30:43 +0530
Message-ID: <20250102120043.1404843-1-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_040106_900435_64236C4D 
X-CRM114-Status: UNSURE (   9.00  )
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

1. W35N01JW on AM62x LP SK, AM62Ax SK, J721S2 EVM, J784S4 EVM,
   J722S EVM, J742S2 EVM
2. W25N01JW on AM62Lx EVM

by enabling the MTD_SPI_NAND config as a module.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---

Repo: https://github.com/santhosh21/linux/tree/uL_next
Test results: https://gist.github.com/santhosh21/71ab6646dccc238a0b3c47c0382f219a

Regards,
Santhosh.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b658..69e0c458c763 100644
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


