Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE34C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 18:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8MD0rp36QYZVT7+z3LKWNVMtuhh4raSX8/oMMIDdK2I=; b=S8gPmaWed2HZBYPPSYByDhq7Ip
	E5YO/Kmw7uMQQ1TEJkBj7vSCc0R2FEhbsV7ka8UiysJeFrcQuqVUeJloyFlBTBcRBA58bAqarfX4A
	p5YG5razlGtSi5UL0YPQTlQet/uBAU9RcGEC940UUdXj4e915btiwuzdBbxTVbH79cA0jr0Dp7URR
	JHEblvGp/2GRdz+gO0egP397Xby3lNyESLT6Yoi6nlEIZ/Cwu9OAmZXpPZ9UG0goikqJZlHj442PE
	Ymj/l+UOdOiAk+MhGZIbI+dcbVhRcQ5FR3mCE8A5ItEH2bcHjWdBWFcEy+9K+u6V2y7UGGVLVFFec
	XkH2/fHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZZxD-00000004E7K-109m;
	Sun, 19 Jan 2025 18:23:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZZvv-00000004E4F-3Ri3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 18:22:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50JILRLf516649
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 19 Jan 2025 12:21:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737310887;
	bh=8MD0rp36QYZVT7+z3LKWNVMtuhh4raSX8/oMMIDdK2I=;
	h=From:To:CC:Subject:Date;
	b=RrX5+HAN7OPutJKKzxdViLz8me7iZ4DpLEsl0bxkxyVCUmqlww8+8aHiu21rbj4XQ
	 C8u3iW48f4eywqD8Ar5fIRqaZq5abVq6uV20uIGC9n77dPICcD5p3+tsb4zyhdaydH
	 ui4AcRZwYVRT8TGLF8XaoesgCQaXMXJ4yOvKcsIU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50JILRme014578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Jan 2025 12:21:27 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 19
 Jan 2025 12:21:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 19 Jan 2025 12:21:27 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50JILLTD024147;
	Sun, 19 Jan 2025 12:21:22 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <nfrayer@baylibre.com>, <glaroque@baylibre.com>, <tglx@linutronix.de>,
        <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [PATCH] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
Date: Sun, 19 Jan 2025 23:51:21 +0530
Message-ID: <20250119182121.3956546-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_102204_071292_D2DDF069 
X-CRM114-Status: UNSURE (   8.88  )
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

Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
for core functionality like DMA, GPIO Interrupts which is necessary
during boot, thus make them built-in.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---

Previously both of these configs were selected for ARCH_K3 in respective
Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
in linux-next dropped this recently without adding those back in arm64
defconfig, this causes boot failure in all TI K3 platforms.

Passing bootlog with configs enabled:
https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1

In above run I had to revert commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
also to fix an unrelated issue.

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 246a13412bf0..f925d539d406 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1550,6 +1550,8 @@ CONFIG_PWM_VISCONTI=m
 CONFIG_SL28CPLD_INTC=y
 CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
+CONFIG_TI_SCI_INTR_IRQCHIP=y
+CONFIG_TI_SCI_INTA_IRQCHIP=y
 CONFIG_RESET_GPIO=m
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
-- 
2.34.1


