Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA19m5mJxvj4iNvYKPsmZqE3Y8QU1E/dPU41DhUPbUM=; b=tiP5HLot9cocxJ0oqhac+7Qj9+
	o0QK+PUn78mdXdV/8IzNodOXCWqgSuJcWxxY60J5TSmInoW8LZ0wAFxCllL4c6/XgJiDLK3gOiQwa
	bFNiinv7bf5Akd8MdqP2m/1TTBGxcSaBMG/333BvlOAOqwpGIj7Wbd7dc+mQVm92lsoZ1ouDpAVws
	ZwnUHrkRrASnbGZu6ivqc/HQKRco+dpKiMw1psJBn69vWetPzxwGmrz1V48djxoR3urT19zyS0CfS
	+mwaYEhkOfWJ4YhOuAV1oOEuzMniswUScEtb55069EtEbD3tcx2GEzoayr0x6lxKkkYfL2cqqP06a
	ZF9OAEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Te-00000003ArE-22Nv;
	Wed, 01 Jul 2026 23:36:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TJ-000000039ss-1pCO;
	Wed, 01 Jul 2026 23:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=nnGI5Llfx315OSkr3KF85F4G29O47I0rAPMmwlSB0jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fA5gwduv4R6PCj6Ok4lDpi6RVT1C3/7Uu/Lw1NASH9nRtG8pqN4lnk0vZ7S2RmBZt
	 20rFSvjQVW6NHCbweNAHvZcQKrQHnpZO3PpICDPYfYwCjMmdln9MT3G/0XTohHpatE
	 BDHk6wl6Xs8IwjZ3dbrkEeUo7m/hr+tx8uSIubtxDCJY2IIDVnU6IFHxoSc5WIij7U
	 vJHG78Z0YHy6YgzHk3zb7aenRptWDzwb74lgouFfDDenojzQkwKpEVR4/igxDa6fKN
	 eXUk2ffd2h0rX+1jt+trsW9F3cFZCcFMsvqDed0IT654Q1+oCo+GK8u75oKY2HmPgK
	 tck9usm8/7wvg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C25C017E35D6;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CA3A9480066; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:58 +0200
Subject: [PATCH v9 20/38] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-20-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nnGI5Llfx315OSkr3KF85F4G29O47I0rAPMmwlSB0jg=;
 b=kA0DAAoB2O7X88g7+poByyZiAGpFpFPInzjXhLNL4pI3uR+HYQuPhnN6adGQreWXl1Kh076J7
 okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PIO/qaoxMP/16M
 cEZhplt5kwN1JyGbK2tJIrSl0vOFds5VTRuaJj+JL+sT2Mkjf8D1URyLZCGjGrflfXuhm+0q21Y
 1ALF9hDW2OB8KewwAmnpqiiQpyng8C4FUxmOgK/1sxoVbLpD2Ynn0HX6rfQX+AcSK3DL6Bxrw1Q
 trDWka1EE5c5TypxhhjjePEappHGkixSRyUTM3Sc71kC/7TcmQQOau7OLVEyw1muJeRkAzhmbTt
 zKSis51m7N+fbAmiDdUJyVbKrlcnq+1EVOug7Xiv4sV4rrb/Ze4C0J6ghw+7WXvZ/B8IFyBJmk2
 zJVDnrJ1XpFZ7+vyj5frByLbOOdAAD60dtQnblDhveeTp/qXLcCQgag5gy+XRc6WAQKdUYyU1yB
 hXLieBJEN2PgsXu9sB6tNzochL4zcV6Q+e7nRbzrzKRxQhriX2bGSBu0MPw+cVwDwzYySjvXf+n
 z9/Uoo62joG3JCYz25aqiXDL5V0chfHUQSTHtKQuL533TjqOQOMZoLAytR/VsRNmK7QckHDd4mA
 eQ2lxrPdwh7AWV+1/rRhlOLBKqPuwnjaqa7ffkX6hzk1q40xigeGT4I8HIenMtc20R4+rL7FSnC
 ZxHk5jblixl1xEl+G23XiAbhKL3l0QOWRlAE5opNarIj3kwXDbhSjH3WXu0I6yU7IFLDG4Q8Fyx
 CfDWx
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163601_734048_238878CA 
X-CRM114-Status: GOOD (  11.01  )
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
index 8f06bb9b1fcb..eab9e82dbfe4 100644
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


