Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BEDC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+0mVVTD+8jbOYhRni3eMYpPPyMSTl6buSo4ApyAJz0=; b=nIRjpR+PowUIAXHV+n23qsC/eK
	uCpm3vcrvtRfLrgpvCBOzq/cZivRtscT8+F3cO6AEcMRjncNL0PBUjhCWY1QovpHfoAqnKEknfZIh
	QWOBq82e52sPT5n+a4zFWobdFzEW+3GV+kIZ/af3TSQ/7gTqiyBu72PRd7ZuzKN/59KxQ/9u7IGA8
	dPHR3VRowDKvyvAmgWTf053Rf1K8j5MFYvYEvVwFmSvtTmCG56yIUFVE/a2vQrj+mje8lOB1kE7lP
	YAl/Wu0VpT3JDPed+oY2kPT72DxqG24cjVzmc1dnd9F8D3IMamKxZWFe5Cjdai20r8ncLL11BN0Ek
	jaemOjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ujr-000000074tn-0PVq;
	Tue, 15 Sep 2026 15:06:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ujl-000000074qi-14BA;
	Tue, 15 Sep 2026 15:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484778;
	bh=aDjYZwERGTJiJG4ozumjnc6hne3xhMzRv8ABZSNpd+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VkrYVeqWo8xcdS7DPv+ReRGnTo0+loU8wEfrNe/42p83Z3a0G1oT2dOlq/LYWJAB3
	 9/ultUtjQhwb1zG8zfN+ffJEGgtHPGbFNgQCLnVGj3pVA3fJr9FpeKg4ZCZXCgRj68
	 hadCqEL3JL9N6+fZ4aWDi9HR5ssbL3SfgyEHEHGOljm+BxVZoNF7SIUmtetcf1C+U/
	 QCtudrPIW2GJ/6WycLIiECOL0SqTHlBCY7mMtDuXvp0VzMvt8Y2rDxwH3598pnbKv/
	 Dj9nnyQMzHogOm5eyk60uauxI7BwJgnzMj2f7Tw4WN58bdj1r5QNQgqB+CIgtarjtc
	 XKXSpHXzoL7JQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D79E17E01C5;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6075A48002F; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:05 +0200
Subject: [PATCH v15 02/11] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-2-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aDjYZwERGTJiJG4ozumjnc6hne3xhMzRv8ABZSNpd+E=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXunL0OwZnhXEJ2biylrCBLOC7K3FRHWM0
 I+Z9WYxol3B+YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7pAAoJENju1/PI
 O/qaDsoP/02ITRUoEU5gveI7bfsRZ54Xa29vbsuez8djEwL8rwF+/++fxMkJwI+93p30UBnYFRK
 th6Mat5lX8L0iZX2kBB+etY9Z3Q00DlLpSC4M0wjeVF1ddj+X167aX23e6OMCBCjb7ZK705yRvF
 QFGzCG7CL/OZJ8Tu97AkOG7BYH3s/qH0BAiHgSn4Gn/L7B6qu57U5OtOjVgciEW+EkRgU3VAuo7
 Qxsa9c/hu7KCLvNjyoXleqPHHGtCpwi3fM3Kvkt5upEEhKYFqp1OADwfo4OedmR+8gfSNykz9XP
 oD31Y6iQethfbkuPau+t1Wg0Bk6Sk9/rqXpx8CrfvJEp8jM34198RnVqSjypSxEwJzaX3b1YdLg
 S/knPL9qhXIQ9M6bEnt1p9vxXFRmppkcXvN7WaeodgAbtI6KqDd539gix6s22XApNowx64MvLTy
 u1/Umi1cPYPHOP8dL7AhG6Opn+Lrkwr8TytzRHe7bJkk45KO5ab28i0XQqTZ3eLwFhsUNqhh1vP
 pqWj4bddjuoHjtDXihGYryDEN06luLokp9RQrfJpo+F7pZ7ReQZWE6X3GwdozKGtyVQ7Rmu/m8v
 M7ifVGd45Dqba1ZBMACISXwBmeIKa2QtA6todFK0DBYdNjCFuniP82uCyUOQa08LSpo3uYwyzUr
 VLuFmhNq8f9uyc5uiWZkwzA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080621_450502_AD7E6882 
X-CRM114-Status: GOOD (  14.97  )
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

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 03a276c08fa8..9767fba23660 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -170,7 +170,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -577,7 +577,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -950,15 +950,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


