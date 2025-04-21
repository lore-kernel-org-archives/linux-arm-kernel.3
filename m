Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDD1C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lAfZiqKSWhX8157fzjfmS1p8uv8d5TT2GTALmg3z73Q=; b=uCrj8gEyKnpTjHgj30F03V8rQE
	nqlegx8XFnKoP/vWJrXdA5fCrWwXc7HZd54I/uiaQEwGTKMeiR7voUQ3vY7W+DP1T3+MH93yH9O1C
	QpvpwN7cre6MheikwW6obpye+PJhAgmi8OyWwWvQvnqcrHra11++OQJ+KeRVje0ZUWXsEyDrYr/z2
	vOPeMwbUTs1q/DyuiJHa3KnsPJeLhZNO4JHoeJL8z8l2eXilI+99ZDmhQDVCu7txBvjbu2W/tkRU8
	JwBehopdLTQ4lAYZ3qjEIYotHxEpQlXEcYhZO0HzV45YxuGnEUYbarHJ6BMI6nYrkASzZjgsfpWyv
	yFVIg8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xVy-000000054b7-1MXa;
	Mon, 21 Apr 2025 20:13:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xU6-000000054U6-1Mgq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 20:11:19 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LKAuxM995915
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 15:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745266256;
	bh=lAfZiqKSWhX8157fzjfmS1p8uv8d5TT2GTALmg3z73Q=;
	h=From:To:CC:Subject:Date;
	b=ZyPVERNzJJOtDfVpuBNX0Wq7W7oqRdqdzauTppwN1dAR0n0x+X7P2MY8qg3QwY0Ce
	 Jkjz+kG0t2K/0LmRdKfdugLPJyX9gAIB/Bx8uGB7qkihnrwpSrYWB6PEKY+LwJHvVm
	 0e8FSHii2NG066nbCuDXItux8O5ek9X88VRhNHWU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LKAucN020393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 15:10:56 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 15:10:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 15:10:55 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LKAtGA067946;
	Mon, 21 Apr 2025 15:10:55 -0500
From: Judith Mendez <jm@ti.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Judith Mendez <jm@ti.com>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Date: Mon, 21 Apr 2025 15:10:55 -0500
Message-ID: <20250421201055.3889680-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_131118_576328_52FCF2BA 
X-CRM114-Status: UNSURE (   8.92  )
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

Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
default on am64x SK board.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e2..1f7b97ff46a7e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1415,6 +1415,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_OMAP=m
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
@@ -1676,6 +1677,7 @@ CONFIG_INTERCONNECT_QCOM_SM8650=y
 CONFIG_INTERCONNECT_QCOM_SM8750=y
 CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
+CONFIG_TI_EQEP=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_HTE=y
 CONFIG_HTE_TEGRA194=y
-- 
2.49.0


