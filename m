Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0803CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0AbO84hZjW14Lbl5aei9qWkHXX8f1YDrWxIY9FYFGQ=; b=FWqCmxeVM5/wVC7g8qNs8pUU8q
	YOsIMZGZuCcFXfE5sgZ4JUc1+76icegmV/P0jHXKwmfDkjwwPtpASJ+/mq6JPuCP6xalpralEmo0y
	BB1NbjMez56PhmHvH8+lU2gDVotOoZgcBUc+9lqs5k7M5MdAktu5awWoRb/C3ry7GeQVxXAkZgPvP
	ebyE2Ut9kECygRpqtrW6YAFWfTxp1X87/e9PXAQmeXBG9Fwx46hBcFhC8FA5pf7cLfsGbDwtu3I/K
	GSxY472O8mK2cU2HHaT7T8K/WJz/VHODQ/tGayvg5r71+uA7yUkQ45eOCHeRJ6gkiPx8ovSday3OL
	oBwimOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Ny-00000008i6v-0yey;
	Mon, 18 Aug 2025 21:27:22 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5V9-00000008VlA-48DC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:41 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IJQXuk3147282;
	Mon, 18 Aug 2025 14:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755545193;
	bh=c0AbO84hZjW14Lbl5aei9qWkHXX8f1YDrWxIY9FYFGQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X8pqcuQ/ugEyTyfesAmTyosbJdqjoo2nFd+3AIK8OPXWyhm9riVCN1Qm/9a3+xigZ
	 G61KYB6BgJVvUjqL1cX1uXptmVoaZeMP2rsMyl7g6sPXBJw4CB04OML4JHG+sqGcHi
	 wSCCVTUC7WBEnnLUH/sha1uhfFiSw1F99xX9+CQc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IJQXeb4032550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 14:26:33 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 14:26:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 14:26:33 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IJQWxW1525949;
	Mon, 18 Aug 2025 14:26:32 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Bryan
 Brattlof <bb@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: [PATCH 1/3] cpufreq: ti: Support more speed grades on AM62Px SoC
Date: Mon, 18 Aug 2025 14:26:30 -0500
Message-ID: <20250818192632.2982223-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250818192632.2982223-1-jm@ti.com>
References: <20250818192632.2982223-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122640_066975_A8343AD4 
X-CRM114-Status: UNSURE (   9.42  )
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

As the AM62Px SoC family matures more speed grades are being defined.
Add support for speed grades U and T which both support all currently
established OPPs.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/cpufreq/ti-cpufreq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 5a5147277cd0..f7be09dc63e3 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -72,7 +72,9 @@ enum {
 
 #define AM62P5_EFUSE_O_MPU_OPP			15
 #define AM62P5_EFUSE_S_MPU_OPP			19
+#define AM62P5_EFUSE_T_MPU_OPP			20
 #define AM62P5_EFUSE_U_MPU_OPP			21
+#define AM62P5_EFUSE_V_MPU_OPP			22
 
 #define AM62P5_SUPPORT_O_MPU_OPP		BIT(0)
 #define AM62P5_SUPPORT_U_MPU_OPP		BIT(2)
@@ -153,7 +155,9 @@ static unsigned long am62p5_efuse_xlate(struct ti_cpufreq_data *opp_data,
 	unsigned long calculated_efuse = AM62P5_SUPPORT_O_MPU_OPP;
 
 	switch (efuse) {
+	case AM62P5_EFUSE_V_MPU_OPP:
 	case AM62P5_EFUSE_U_MPU_OPP:
+	case AM62P5_EFUSE_T_MPU_OPP:
 	case AM62P5_EFUSE_S_MPU_OPP:
 		calculated_efuse |= AM62P5_SUPPORT_U_MPU_OPP;
 		fallthrough;
-- 
2.49.0


