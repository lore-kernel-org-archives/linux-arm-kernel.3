Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F456C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmTubCxhSp75GwebI3stidGSSHfrcux6sjD1ZZ4e/6A=; b=fmzuKKjdSvM9nvMvpO75mwFTHa
	ipa+TTWJ0qdqPrkUksDcRG6SyaKHXUAQfU5tDcogBs4pKaOTdymew3Pc2AH5Y8CPz56F9WuyNOm7Y
	G5wgICGglIzjUVZPwTMQrwdW8cS5ZMlhfFQvR+GbfHXt4DlZh14nrLUQu208CHoVMmeMXidllOBJT
	LuMorVYp5IKNDbk1sodN7+5ImWaxE6KKDA+6V5Pr7T8L3EdIbcgaM37x5v/d6Me3r4USKFQSSDevY
	4fVULTqThPi67qn5YRr4zk1Y/u/GQkZc6N3u3CiN/FAyd5qQxQBpBSAh4vCa2kKgdYMq/Rx7CYDNr
	MZgnMQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1X-00000003MG3-01W7;
	Thu, 09 Jul 2026 19:03:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1A-00000003LMu-47Az;
	Thu, 09 Jul 2026 19:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RVM1jgzwtqQtAXBiMDRV0pxyJYYDBL5K6vAS3yCpxVSFTTootyH2vgTCUBqor/cek
	 XL8dh+L3qHQn3dMZ883MkIDtEOoXc1nlxjzfqmx5RKajukK3+lGtlB1BDxYN4u6whY
	 PVrF7mxYNxed7q2quCUMwJWLQTBIaRCxePZvG7rOgqUqYcRU51O/+nSj8hJ5J9jxF3
	 j7ysuojWmi1ZNhu+nXR57O/DmAMyD1Oc0rVTP7bhwLu0wFN5Jtxm7K9WBf+HXE9RPT
	 dTwXpSC/1BE/FBRPSgiUX8n6BKi6mDXnwoF3EZzLgKyCcOAZs9bGu9lTlZCbVLcl2R
	 I+ZStwsl0pz1g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE33917E101E;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BE81E480065; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:42 +0200
Subject: [PATCH v11 19/36] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-19-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ERrLE1cxL1f0vra7CZ0nbMrlvbHUe2Or
 FUyNz56HfWea4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qawUcP/2vg9O25p5cQ9+EwlLOvStbFON3dr6bfk5F7vo0sGvlVofg9BIsqbi16+37wvw5IoAR
 +xK8v3T5yt1aXgMrOMiFOxz+x6KhcmJ6jvX6mkMCPQyrzN1LJFSRSlkmkCLDlgMu+Mwn7SmgFy3
 1qcEPNlIEQGq+h6HCSGGDnc32FriIgc0ualnv2rKKaoBs3TStUuhxeH3OA+oc+tvUhOp07FbAo8
 FO5NPSTSCvqSfYp8plCmr7iBgvalg5PHNnCE84+Q7CdR68QboU+Rk/EoggRTep/9NNcHAEHImhH
 I8rj+7NcEduZdCT54FgfZv/lOYsJ1g9ht2JeL3BaeLhRY34mp0TPuEDR7Dr3la44TSAKA4NXpMR
 XQ0edRsBmpK77Ulvz3RVnzu5iognFb8WECvEZ5hyp0B1NJkw8tzcCJ4EKqq541Hn4jmjUcQLb76
 R8E8CoyDVy9fSm91Y0Ki9Ac38KUHQCCc0YyMzKkYapD3dlBNcBF1HnUJSoEGM9azx0tqbIBhliU
 vX6A85MhQeJNj2kyADNWHs/7JqlhpVQNtdgWSt17O7hUl+F1AtFPQ5aIwMSmgEygpBjkYBaq3Y7
 Q+iTjGjDMDUsL04qhlBN8itrDuy7DLd8FCm2gvzy6l8nO7vd2oeZ0ST4AryxTR0inrHvgDS1U/9
 HZ2tiYL4b9zY8I+CUW3Im4w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120241_291922_4A17E275 
X-CRM114-Status: GOOD (  10.47  )
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
index e44d19c9d119..4b454798c4ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -620,6 +620,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
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


