Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9859CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7jyshbXG9LoEGUH7fQSM7tr0fzpyoB63Rz2qSbviUo=; b=n7bhw2lhsARYep1dFvnGbsXwyq
	We2TkK/2f9dXzxv/eysYUrkaMbqnTHGCneYh69sERTOPWxJ5+GyafEAkxTeA6MuefTmFFuKyALkpT
	7m27MWcGCStBQfzM/NOAPFx2nv82PeUfE4PaJk1msdT8yCYj4QTpIQgDzDA1QmCXFXuIoy4T0u7pb
	Uw/TLYze/RR+lKHaih1CUO5fI2dTDeZS3Yy81jS9Rp52FhHdvHx31B9NxC3/nO6YXy21/jZWo+qJ9
	xzd/qHT75UemLvBaNJEc+rgNt9cc6iDnD9kDPOXyHsd2/tka3VVs+NPoM0N6UzfTsdRJfz6zaOOmQ
	U2TT24Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofgW-0000000D4xT-3evi;
	Wed, 20 Aug 2025 10:04:48 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeH2-0000000Cl9L-1Dtr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:34:26 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57K8YL8S210364;
	Wed, 20 Aug 2025 03:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755678861;
	bh=Q7jyshbXG9LoEGUH7fQSM7tr0fzpyoB63Rz2qSbviUo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DXb+mwMS0+VDv8vrz1TXLAXIpL3GtqKUuRAvXERyqPzYTWYe7BY0RSaRYr3lkbuIq
	 5wtfkr+S+o5UGY12tEbKk2kLqvIxRu+QErHjyNNuDS0Gar/KiQMCJOrUlckKWftfDi
	 EoUUvdugLiF8J86vWmuOde5ClW4vk5uklR0CpMf0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57K8YL6Q1059099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 03:34:21 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 03:34:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 03:34:20 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57K8YJ1A228554;
	Wed, 20 Aug 2025 03:34:20 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 3/4] cpufreq: dt-platdev: Blacklist ti,am62d2 SoC
Date: Wed, 20 Aug 2025 14:03:30 +0530
Message-ID: <20250820083331.3412378-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820083331.3412378-1-p-bhagat@ti.com>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_013424_378064_3FAD2B3E 
X-CRM114-Status: GOOD (  11.27  )
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

Add ti,am62d2 SoC to the blacklist as the ti-cpufreq driver will handle
creating the cpufreq-dt platform device after it completes and ensure
it is not created twice.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 1a9d9d008002..cd1816a12bb9 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -189,6 +189,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "ti,omap3", },
 	{ .compatible = "ti,am625", },
 	{ .compatible = "ti,am62a7", },
+	{ .compatible = "ti,am62d2", },
 	{ .compatible = "ti,am62p5", },
 
 	{ .compatible = "qcom,ipq5332", },
-- 
2.34.1


