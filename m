Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA30DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8AKj2YObR4Taah/FaOEohXDrkw5jSSBe3cYaXaS8YA=; b=DvB0nxz9z/BhpK9CE4V+ioTlnw
	/vFJ5+4y+k7YdEm0fz4fRcBtxbY/o7lIM59ekmg6nfkEdA+x035eV52+rGQbwUk2yPwSE70JQDsZf
	b6IpRbYF9xSv+Kx+i2Ur5GW5uTnOtAO4ZVUnDMhLYGEINp3AsuhUQTDYXfRJz6MeldhUuiOMvQKhx
	IdyslA7QwuCHaWuRVIzbttP/YPQqeS8MMEzthR2kIQVUK8Df/cLaniQqIoy1wPbtWpFECcVPiLnbd
	t5oMdrjtNioUaTHw2fYIBaSdOgBDVRMsAwJoX1Yo+lvlfzuMln/F+BDKvuMSDWHgVInoks+3jj0or
	J8gDl5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sLF-00000004U3n-0Fxl;
	Mon, 21 Apr 2025 14:41:49 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sJN-00000004Tvp-1D4B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 14:39:54 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEdfEW1580299
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745246381;
	bh=F8AKj2YObR4Taah/FaOEohXDrkw5jSSBe3cYaXaS8YA=;
	h=From:To:CC:Subject:Date;
	b=MrGJmc0Z3SlDfI3zymsMjwivlMHAy/4XjR1j6duLPMbbc+uDX8g8m662o2hmC9Y8n
	 /E2QkBWvavNX5j2sTaiEwyPYC4BVv9Zuz2XHw38XKQqT+iTE12/9WZJe4SCXBP0lXB
	 o6Ev/+Cd8KQJq3vhQaBm1xAj7Y+bRpXZIjyf8ruI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEdfS1005847
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 09:39:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 09:39:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 09:39:40 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LEdfFR077828;
	Mon, 21 Apr 2025 09:39:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Ross Burton <ross.burton@arm.com>, Eric Biggers <ebiggers@google.com>,
        Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
	<nfraprado@collabora.com>,
        Taniya Das <quic_tdas@quicinc.com>, Nishanth Menon
	<nm@ti.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: defconfig: Enable TPIC2810 GPIO expander
Date: Mon, 21 Apr 2025 09:39:26 -0500
Message-ID: <20250421143926.2009535-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_073953_378628_3F932FC0 
X-CRM114-Status: UNSURE (   8.95  )
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

AM642-SK uses TPIC2810 I2C GPIO expander for LEDs.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..49a98275fa3d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -672,6 +672,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_ADP5585=m
 CONFIG_GPIO_PCF857X=m
+CONFIG_GPIO_TPIC2810=m
 CONFIG_GPIO_BD9571MWV=m
 CONFIG_GPIO_MAX77620=y
 CONFIG_GPIO_SL28CPLD=m
-- 
2.47.0


