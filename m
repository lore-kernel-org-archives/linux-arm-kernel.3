Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E06C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ohGWWpD116snjUxSs4ZCD48LRlSx0GG5NLOulK124xU=; b=dnt4fx+POOGB+GLsO5CmzUm4Sf
	hUidOkgJxuSd1pbb1YaDe8jZT0YQYc6/1vZ7DhIzE6RzTKhKSvkbdk2fWMKBw51a+oiJ5lAgTJWhl
	BnTdN9dznLtcdyw0K5GpITtOJO62GMkZZhxM5LUmEIzf2OpmfPS38BYZ87WjaB1Yp1ft9VhtVGLxd
	QozOe9gBh/XQleKFx+RCaDa6L9Tp8NKI57SaF825FzFOmwqP7c5oewtQzs9RGlPkZr1hzmA4QjFcj
	nwniZiWf9Y8SEriiflqtpykcBFKtd9q9Dke967w1ZnJNwN2bfZP2PuPw0+Two/URrI26qGAGcMqvb
	lje7WY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57en-0000000AaFI-2YAL;
	Wed, 16 Apr 2025 18:38:45 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57W8-0000000AZ4j-0XhK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:29:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GITWmk424417
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744828173;
	bh=ohGWWpD116snjUxSs4ZCD48LRlSx0GG5NLOulK124xU=;
	h=From:To:CC:Subject:Date;
	b=C8fRAjiDtw0rsM7nktmmuDvBZqdNc3MgfEumLAKf9J8MSRqVaH5r6pWloqooghK85
	 Tsa1p53Bl2yyvojzvlIhg7CHuujxuVn7KYfvBzfvusUT25Btjy6xuX77KURx5r3KVg
	 lSfnSidvUOXzz3X+aO7coe/geLvVZKhOEKo4pgvI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GITWak054757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 13:29:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 13:29:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 13:29:32 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GITVlq086303;
	Wed, 16 Apr 2025 13:29:32 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <nm@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <bjorn.andersson@oss.qualcomm.com>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <lumag@kernel.org>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
Date: Wed, 16 Apr 2025 23:59:30 +0530
Message-ID: <20250416182930.32132-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_112948_256315_22C80054 
X-CRM114-Status: UNSURE (   9.46  )
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

Enable configs for cdns-dsi and cdns-dphy drivers required for DSI
display on the following TI platforms:
J721E-EVM, J721E-BeagleBone-AI64, J721S2-EVM, AM68-SK, J722S-EVM,
BeagleY-AI, AM62P5-SK, J784S4-EVM and J742S2-EVM

The dsi wrapper driver used by all the above mentioned platforms,
cdns-dsi-j721e is enabled by default if cdns-dsi config is enabled.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Changelog v1->v2:
- Change commit message to add the platforms that needs cadence dsi
  and dphy driver enabled.

Link to v1 patch:
<https://lore.kernel.org/linux-arm-kernel/20250411095043.272488-1-j-choudhary@ti.com/>

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


