Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDCAFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRFJdrOWUvL00hPqVzFVhZ8dRFpST8YI/bEklY1Zjvs=; b=2xaGdqLzwUeb5h5QOPVBaIgA8V
	05Zd4A9rvIZT16xSRP8vV2/HdPiYGeg5URXaqeuV+Fiy5Ro7s5wXBLDGr7xE4BjqCXPcDIQnddaBV
	jzs6iINBkui1wk/F1m0qZxMkpiOIU4Z5QA4l7IesJfKQGCvNm4T+xs9fHRIi3mTet2fhgJWDxPuoN
	cQ86KSXltlVseGznuEgwXNgmVu2rHMCcVTIdolC9KSCtHI4cEYA2ChGgDG/0uNzas9mkYEFgWnVv6
	UHjr/U5s7F0PFWlYwTUqvoB7Q34hVpRqSu2xDHpjBmhTWHytXmKBqK+SOUv9QSSxVPMEMtQOzOx+Q
	kc/tJV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4r-00000001tC0-3GRe;
	Tue, 28 Apr 2026 16:14:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4e-00000001smI-3IKw;
	Tue, 28 Apr 2026 16:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=hm1hwqX12MMmcOcx+mUmnef+Uccffb/i9jFQzzEPLQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U01CRmYcRmVIsSolJHd1twJqHsbhmtWWRlK0ZV+vx8jS5vXHFPjqHJChMZcUk07lr
	 TI1biwMMWOe/J+TH2o2VeAkvCZIjOFLIP8rZ4XFAOKZ5mT8ApTRYYVpFPZSfnvSH/j
	 shNomPytuuz+5ZHTH7L97dWUT+4gH+GcaWgh7JS+qkXkpQLufETX1M6423+Tut+Ffl
	 OOgOyqaNqKsLgZVXFI7J2eVqpJBGF4yDJRNP/i7pFHMy/IbJxvsUD53h7swL8K7VjZ
	 6zurW9x8QdJ4PCyV0mkF+BjV3a63G4XOTzOl9rZBJ91Fp8u+N9K45z4nFUVPVqc5ql
	 Pr2q6QPAthi9w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 56A6217E15A6;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 934EF480061; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:52 +0200
Subject: [PATCH v4 13/16] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-13-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hm1hwqX12MMmcOcx+mUmnef+Uccffb/i9jFQzzEPLQA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MkGqm5aAX1UQ2T9KL1PCkegp2zPPVdsU
 UjQTJC2P0pXyIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaUTIQAJtrmZYeZ2/Ua3NtDTAumruL/6iiTtFdfJIoM9DjN2Z7ZYeqo6g6PREZOHin1HyXJp/
 OkpnqJ+BWr2yja2Xdx2cEaDzxg4iUzxtQ6YHOWyBB+fA+2tTCEf1heWwR/DsL2Dtj0yJbJEEQ6u
 LhAJdHXgGSJ4GmZYoHThlvyEvYm50kDk3ZQWh5wFbB57aKc4YcTkxF3uLNVzr3XjyzCWw/JbuTI
 0cw7V8H1aLxk0u6jHzdZ1RMwjULKjcCW8r0I1nB6uTReiR/csnrzJL4ktIzgBe5T69UN9OlqFq8
 Vu6c+pAfuqTvx2zs32pC3Brwx/MMYC2C3dH3Uhu7owtL6yrvzZhBZgSwUYgFwTHJjo7oIt2TorR
 gID9G2GnCYNkqnKBCMeNNqqLlh4r8uegT2s4lMPdBniIY2tJUDE1H4ND4lAShUDpeHwUVHrHrgf
 AXmFPlh8IrMpvOsrO7dunpdINr4C5vBwm8IFlMs/LYejr61HJGukCdOWFasO2T5opD9jfREUmE+
 3b5R2wPUNX4oym36Ga/FAAZUUoN63I/Ne+6CWSTqgkkyBsP85dJwf5ssiFTPZF9Z/VlPadKc07p
 KYPUczLFpZSqL3S7jpIZLGbitCejt7BtZtX9mZJgmRBVvcxDilczoTxW2BVRIeo1bf34XrNsMrB
 OOhBsZ7FT+7ydBQ2LcSYt3Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_091413_284674_6E2BEA70 
X-CRM114-Status: GOOD (  15.09  )
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

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3f1233f50686..694832cc161e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -172,7 +172,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -582,7 +582,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -970,15 +970,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
-		udphy->mode_change = false;
+	} else if (udphy->phy_needs_reinit) {
+		udphy->phy_needs_reinit = false;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


