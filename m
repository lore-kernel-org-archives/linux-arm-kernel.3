Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE11C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sjX+tO2Pkybis8N/p9WpJQ8YymWnX6z/Zza9cSgrmoc=; b=cKyoemdIxCaM6NnGGcFiTQUU1v
	zCQlbOxnDHrISQTUv/V8Si0XVEhfWyw9Dpv3y0dURtywepL89f1Vg8362/Mxfxw64JqMNYhrU96IE
	QlZVDyvFJdXVAqUaBwEzlA/TAVJOvHFVt7UcYZThrbi9kicpMlWZB52tw9NbMpGOCqD3RivG+HI2d
	41Q2eo76lT8uPvXm7JsVHMsRoZv+lf5IZTmVuozR1EOF3LY7tU1rZI7ZQf/TGMW9wDOTY1jNmrKqK
	rF6YuPrOsqj7RD9hpyMF64BT6yVMvRCSueelacu/xl6T6y2kDLUC5139JUc01SAdBKvPu2l+81Pe/
	LEpXzYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFMp-00000003RwV-18Zy;
	Wed, 26 Feb 2025 11:14:19 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEv6-00000003Ldv-2N3l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:45:41 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QAjN2r1525492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:45:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740566723;
	bh=sjX+tO2Pkybis8N/p9WpJQ8YymWnX6z/Zza9cSgrmoc=;
	h=From:To:CC:Subject:Date;
	b=YcUOE5w5qKcTrnKoP7Up9bzMlwYEtkiQBaR2vB/iRa59e0vTsmjT27bvFTFuI/NRV
	 4FLc5Uu9eYke/d+3c0d26geY+qRJm4Ljc/6aMYJrUlpgajaKMgNe0tk7AiRe+8sPNT
	 S+qsR6i117OMzkBzw3nhIZ43kQ7V0bSTMknClct4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QAjNxg024798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 04:45:23 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 04:45:22 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 04:45:23 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QAjNrv075701;
	Wed, 26 Feb 2025 04:45:23 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51QAjMY3014137;
	Wed, 26 Feb 2025 04:45:22 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
CC: <elinor.montmasson@savoirfairelinux.com>, <javier.carrasco@wolfvision.net>,
        <ebiggers@google.com>, <biju.das.jz@bp.renesas.com>,
        <quic_tdas@quicinc.com>, <nfraprado@collabora.com>, <arnd@arndb.de>,
        <dmitry.baryshkov@linaro.org>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <quic_bjorande@quicinc.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>, Ravi Gunasekaran <r-gunasekaran@ti.com>
Subject: [PATCH v2] arm64: defconfig: Enable HSR driver
Date: Wed, 26 Feb 2025 16:15:17 +0530
Message-ID: <20250226104517.1746190-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_024540_697374_3F7EC9FD 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Ravi Gunasekaran <r-gunasekaran@ti.com>

HSR is a redundancy protocol that can be realized with any
two port ethernet controller.

Many of TI's K3 SoCs support multi port ethernet controller.
So enable HSR driver inorder to support this protocol on
such SoCs.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v1: https://lore.kernel.org/all/20240419060013.14909-1-r-gunasekaran@ti.com/

v2-v1:
- Rebase to the latest tip
- Included TI specific maintainers in 'to'

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c3df5120b23d..f3afc0ec68f0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -177,6 +177,7 @@ CONFIG_NET_CLS_FLOWER=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_GACT=m
 CONFIG_NET_ACT_MIRRED=m
+CONFIG_HSR=m
 CONFIG_NET_ACT_GATE=m
 CONFIG_QRTR_SMD=m
 CONFIG_QRTR_TUN=m

base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
-- 
2.43.0


