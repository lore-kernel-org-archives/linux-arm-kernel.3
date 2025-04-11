Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E317C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OUXsKYr4L8cuuHUPZZv3opOZe1U/R9+5ovmxBvfKK0=; b=f0ZTpu0Qv7/hx4azbxLByu+bG5
	W8kER1Ef5FVeZsFohTAwQou7fBu8C8KqoeIkKleKkEVlgn2uHgOijODh3Jqr4+bUGczIOk84o6joi
	xDetvIUwVwmBL/zVE+sBwliJmCQs6pgACfJcS2aLtQI5bxGb1UytU1yilc6L+ZOD0Xs+KCkl5RL6j
	nS7JSzYMSo2+uSxxoDLOqWAefHcogqH8o2S384ErhPdZgngP7MG+tjxADVTD5xDzQbTNbczQJ/Ko+
	TXdLg8cEt6WcMIy3Spg+5aKrB4u3iKqkel0yAgWAgWixaqA7igNMDzXgpx0qW1VFmhsdCg00W89P4
	HNatZlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BN2-0000000DKjx-2H7F;
	Fri, 11 Apr 2025 10:12:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3B2I-0000000DFe8-3oXr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:51:00 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B9ojbZ1538872
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 04:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744365045;
	bh=9OUXsKYr4L8cuuHUPZZv3opOZe1U/R9+5ovmxBvfKK0=;
	h=From:To:CC:Subject:Date;
	b=rNvdBvhtHct0DEJBrhbtzrrcRyvGfUPNa3Q7m4AZ1q1I+B3WqtBNN4CYrFznkmhkT
	 0CdkIuuJMCOHHTUnvvQQWYR6hNT2z49vt3y8OrClasGNqdmJK58d4+DRkFzlJt4iL9
	 6Y4Yz63IW6GmdajvVFPjvyWxvbrN0aeQ7ytT3uwg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B9oj0C036392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 04:50:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 04:50:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 04:50:45 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B9oiQX104055;
	Fri, 11 Apr 2025 04:50:44 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <nm@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <bjorn.andersson@oss.qualcomm.com>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <lumag@kernel.org>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
Date: Fri, 11 Apr 2025 15:20:43 +0530
Message-ID: <20250411095043.272488-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_025058_998019_40A18EF8 
X-CRM114-Status: UNSURE (   8.53  )
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

Enable configs for cdns-dsi and cdns-dphy. (dsi wrapper for
j721e is enabled by default if cdns-dsi config is enabled)

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c85e5da152f..4c0eb2711bbe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -938,6 +938,7 @@ CONFIG_DRM_TI_SN65DSI86=m
 CONFIG_DRM_ANALOGIX_ANX7625=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_DRM_CDNS_DSI=m
 CONFIG_DRM_CDNS_MHDP8546=m
 CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
@@ -1579,6 +1580,7 @@ CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_CADENCE_TORRENT=m
+CONFIG_PHY_CADENCE_DPHY=m
 CONFIG_PHY_CADENCE_DPHY_RX=m
 CONFIG_PHY_CADENCE_SIERRA=m
 CONFIG_PHY_CADENCE_SALVO=m
-- 
2.34.1


