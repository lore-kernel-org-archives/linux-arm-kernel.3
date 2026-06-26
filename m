Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64EAC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTPx7qMwTKiDJ8vMooTcMrZLqzUjrgk3/j5WZD1fNzY=; b=nL0TNnhvEdjBlLhS+ZZ1FByHyb
	8uVq6i8cEc6rwEO6ekHh2whJ7BYk1N9QL9n/zwUBYa1FRzAeoJzMrfKhrkOToLeNYUiGbZrUTwfW5
	dBcSUxQs5Qf4ckHMcwMGmSJb3Yz8sHIZfdmAf2bbNCbEL1ZcmiDUDlWGfpZ/o1HVE1M6Ny83dF/no
	/gh+xtybDTygWb6Hry8FNX0QgeZE4cD4fDuyRqBpTMi6LDY7D3aSBIZ3YiGbhoQ9pxxmN19gjKjL7
	T4Y/WZfeupK04tdV+BFf1nhnFfDRyxAOhEn9jPHxHpK08a+D71+IHQK+omZDG/vpV4ugH0Jp++6YR
	H7xLcb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDbN-0000000BrBw-0t3J;
	Fri, 26 Jun 2026 20:56:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZz-0000000BpfY-0ceG;
	Fri, 26 Jun 2026 20:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=Cw/4rw1Cp+0oCGwZrjhNlCIDyiVvrfzYYV8gu2/mrJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKmLHQ8B98fPHbybxKXUi5vV4jiHhrpUQt7JRk5aD67M1Is9Qk38/sb0DvYr573no
	 nUR9FYBtz612dyB0qp0JmKTS3qnyKdZShH9l6onuvIo53dCXDSxogB4iSQHIBSn7y1
	 /2XShNzQ/iCVrOQdNYA5DR9oyR+DuHeGoroy6b6v7jMXas+hM0Yni6+wKKAc44ApZa
	 Bg84W1/5oySAYBSv72VLDn7la9j1U3gRh78rGMdwUVFeVghRCO6Z3ffvk5Y//XhJ1P
	 yPRFGfn6y9n3nQYz4hOY4UnD6PTLhz8+5dquq+chwawcbtBRYt5qPFs5vgQS2Qq6yu
	 ixlpQ0TD7qS1w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CD8517E15A6;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 28B34480065; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:13 +0200
Subject: [PATCH v8 20/29] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-20-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Cw/4rw1Cp+0oCGwZrjhNlCIDyiVvrfzYYV8gu2/mrJk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVjQ2QKwubYcxpG7Zs9XKhu3VhCOvNZ0
 2AN2cr4bkdCqYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qayGkP+weDk5k2Ry2pbJONHl0C/yFqmBFcICf+UNH6b+i6VPpj1HmIGTu2sCTmvt6F3VBcTxN
 XD6i9t9j2bP1XGJ58alNgctiKLxD6tzDPjSx801XbhkcWl7Eo0C5772Qd0MGojTBnq1Xbd5CAqH
 YPrMMl+8UVj3LSIbyp7lDvwaE2dCGSnd7pNknFFUnHDZxNpLN1SbHCzUt7dAjY0CY1mP8qBP92q
 g0W5fpPtN6ZPZlp7GMEZavgSfFU3HLb7aLltsd2NbK8t87hA+2dG9NXHSNkkSdAs5jquGIeHfjQ
 u0vd2RbfHJh8SHtOyNR/LNmqz5/IutZdq638A8YAazd/xgSG1mQbJx32PbSBGyqQKSO/wvJKEqm
 IBP/u+qGEMklVVClE74nvybBjPAX+LLyQCpH9pNTCm+oXQSx/Xsht763cFjZ9ANWPpbQg9rERTu
 T/b3mW9DxnTO1KX9vv+gspaf9Zk0GJZpe26VUSFi2LkLe3hCrnNyVJaHJoTYevZrxfkeS250nQ2
 PZofPLBXxJAMw4f0KMRq0gb/7dFb3N2JjmrJAQFaoWsulQ8/amJhMTuAUCpzvRc8QURQtenG3Or
 KASduVzCTPOhYcEg9xdilz1FoYnHnMtSu4+2au75FhntBPhFVtFpZDiPN4WGkNYNPPFywejVh0P
 +S6Q8lnL2/Unc61M8Pcs2xQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135515_362574_2C09247F 
X-CRM114-Status: GOOD (  10.03  )
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

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1bb22fc18c9f..3d222768dc3c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -626,6 +626,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -637,7 +638,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0


