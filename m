Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PnhKc8g8H0kWfIoMnf2P/Giz7+/dSwkw4FZNG9iIes4=; b=BMpO79h4dV3zdDSiqlX5fmDpDP
	Xuh21kJH6KV3etM7E1JgUdFXbl6YQiryDP18Hc4Q+jrR08PkpkImizeU0Jm1t7XaBCK8zKAge7moJ
	O+wTHVRcKEM+wckN8fIS6PifT0Wq4hqtbfXYUbxvAHGTSxpxkqPOTQA57HgAPzG0kLs5cnQYAuM18
	1N5w8Rou/r6L3qVF3TLoYIwQMQMMwYCfigPprqRJrzUeAT9u5Stb11nZGlpt3ZrkZfC8aezmn7/P+
	a4F+NpjCmmFZ3twXEScOY8pXOmbS4uOyyNK53gtCzAg/0rju7Jha9p1D+ttK5sJPASp1jIOyCF3rZ
	TvP8zu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofYr-0000000D3R1-2Uqn;
	Wed, 20 Aug 2025 09:56:53 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeGj-0000000Cl3K-0Roe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:34:06 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57K8Xx3P3154182;
	Wed, 20 Aug 2025 03:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755678839;
	bh=PnhKc8g8H0kWfIoMnf2P/Giz7+/dSwkw4FZNG9iIes4=;
	h=From:To:CC:Subject:Date;
	b=Km6Cim3AdlaexZ7iEUPrWAEzfAlC2vTcPFUXnEtQxEPhDIeOnGIX+p6pz12dSSZVP
	 1S0M7KomD0YNN8QAhXAa9pWf3iQx0pi150ccUvRPHBWvZVPp//s+hfrJROI7lHkLC8
	 3pKoqCCYADtvK/YfpVxmuWJmhUau51AhX3Yi8cV4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57K8XxC91919840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 03:33:59 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 03:33:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 03:33:59 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57K8Xvku4133408;
	Wed, 20 Aug 2025 03:33:58 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/4] Add cpufreq and USB support for AM62D2
Date: Wed, 20 Aug 2025 14:03:27 +0530
Message-ID: <20250820083331.3412378-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_013405_187376_0767112A 
X-CRM114-Status: GOOD (  12.05  )
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

This patch series introduces following changes:

* Patch 1 fixes the register length in main_pmx/padconfig for AM62D
 and AM62A.

* Patch 2 enables USB support for AM62D2-EVM by adding pinmux and device
 tree nodes.

* Patch 3 adds AM62D2 SoC to cpufreq-dt-platdev blacklist so that
 cpufreq is handled by the ti-cpufreq driver instead of the
 generic cpufreq-dt driver.

* Patch 4 extends ti-cpufreq to register AM62D2 SoC support by
 reusing the am62a7_soc_data.

Boot Logs-
https://gist.github.com/paresh-bhagat12/e29d33c3fd92ff17580edf1441ece9f9

Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Paresh Bhagat (3):
  arm64: dts: ti: k3-am62d2-evm: Enable USB support
  cpufreq: dt-platdev: Blacklist ti,am62d2 SoC
  cpufreq: ti: Add support for AM62D2

Vibhore Vardhan (1):
  arm64: dts: ti: k3-am62a-main: Fix pinctrl properties

 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts  | 21 +++++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c      |  1 +
 drivers/cpufreq/ti-cpufreq.c              |  2 ++
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.34.1


