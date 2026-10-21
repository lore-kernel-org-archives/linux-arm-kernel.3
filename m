Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7560A260C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SIuh/FvJ;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dH24piyD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yq9LVAN5JxUV1XxpBBUTYSSSlaYw6zxP+Mv8Wu6YgDk=; b=SIuh/FvJ225gQSi6OPdgODzpVZ
	3MvdE382xqjGtEDKeFN5QnKu+KngsYLBY46CMG1+PlNz/pI+ItjMnPm4dxFK8fxpqX1fbmyXssBwI
	t6ou/6ozmvxSM1ly15Ogg8j2uGlvt6dW0/939ZFqjmzVVDXqCpiW5fkTQt4AWDTK4T7xZjTsk2rsD
	W4QHY9ZlqIKd30d2qpfbEgP3wRF9hHewjW/plB+jFAoBNlhdO0WGLiI309u4oeUt9pjfqUgAO7UXj
	5RIMaYIdT1poNdiQgH1STpRt6VD+Gvh7RuNAR/avxiuT6UxtAsMmG/ktbLFKWAEtNorglpfIhyK5D
	MpMmyIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahO-0000000CcAm-0zHO;
	Wed, 21 Oct 2026 18:06:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJah9-0000000Cc1F-2W8n;
	Wed, 21 Oct 2026 18:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=NvsnwJPFAW5v0kVCPBz6237a7VHJ/RsQIoGbPMllOlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dH24piyDiAAm3TGtO4bOQXcA7c+LmoWVFx7TBMqDLwMdnB/Lc1UTCE/N1oBpvZnc0
	 vDDv1Xf+O3XKprAwBfdmTl/2lko65dXfjew0KV4gXcU8tl3tZZVwJAGvutjmV8FVrm
	 c53lyNwBg2PNTtSiQ81/HBwMTyQhjHUFiVKeUUIFG6USn123GAYcYDSXMRNJhF0vq+
	 cAbPB9cHuq0oMkVN/sEYSg6Bzx+gZUfybACowMnJGc3spNtAfS58mU2E1jRcbbyn5Q
	 a3JwyguGmAqrB4lF/PW6ykby2VVPu6DV6D2My6Id+Ss/8OldEyHypZqhB2yO4XWNOL
	 K+wE9sdNqZbMg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D49C17E05F1;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 61F70480027; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:26 +0200
Subject: [PATCH v18 1/7] phy: rockchip: usbdp: Track PHY power state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=NvsnwJPFAW5v0kVCPBz6237a7VHJ/RsQIoGbPMllOlA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vdY08luJUkIGee10Mu50u+NdhJaFusvP
 6auT8IGbtXxsYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaykMQAKfAg0/BAbn4DP0dFWAjAc4cJ2c2PToW8+xKtdSX1GExIVfyWTctPVhWM4a3vjDXXBU
 DSTCmrrBlgeMSOdekQXDq5bMKnSWFOfYC+7qPe3atLoxnr1vvo82HJdQY8Ybsnkv6RrGqVdfu9Z
 gh0yYrZi1L3avy+mx57WHC0mjcFNR0P0Ufa7AyaVgWGiYvjIJFzpm0ClMkEe/62Q1lrUMqN63fP
 hQ4Azn46pKo8puwoEt4Yb/Heg4woJ2Bpbmc/PFmEDznksfSre/y9aCQ3nrFSGo6vcr+AlYnFLoF
 hXTBMbOmOUTbfhFimvvHFsZDErCgRQlKOACD64v7slzxm717u9Gv9wPRbVXt6ZUSZvdP3RFxl02
 LtYFzmHoMQXYvTHC+wuHS2MrnyjMZE9tV2Hp+4BCe9ele1NzhoxoDn9/H2XgS1gK6irRR275RIK
 SUGEilCnIkvUj7Q9uhL+cBvOd/RV1zDMsBINKOFYJCKYXg3CQ+/7pT45OAbqNqyxdN2sHNrPjYg
 spMQLdYdggKO9NKEkFXtYk8a6+zFKOUvnvSvIARFMJMuA3a2qH3i8zQOGBa2BMo8x7xXYJQPnrs
 ZcLPKX1YIDAVg79pmTtGy3H1Nr36YSFaFor6GPC5Wdvttt0lq1sxlC2nuEftLafDpyW4OzZ1iur
 xUXOUP3IwauUIZmK09ek1cg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_110547_822495_AC0C24C1 
X-CRM114-Status: GOOD (  13.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Track PHY state requested by software for DP and USB3 individually
in preparation to rework and fix up power state handling.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e748acdd2d31..cb1f455accf8 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -175,6 +175,7 @@ struct rk_udphy {
 	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
+	u8 sw_mode; /* modes currently requested */
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -1051,11 +1052,15 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	int ret;
 
 	scoped_guard(mutex, &udphy->mutex) {
+		udphy->sw_mode |= UDPHY_MODE_DP;
+
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
 		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-		if (ret)
+		if (ret) {
+			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
+		}
 
 		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
@@ -1078,6 +1083,8 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
+
 	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 
@@ -1286,16 +1293,25 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode |= UDPHY_MODE_USB;
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret) {
+		udphy->sw_mode &= ~UDPHY_MODE_USB;
+		return ret;
+	}
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1304,6 +1320,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;

-- 
2.53.0


