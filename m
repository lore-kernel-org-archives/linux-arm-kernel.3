Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29B0CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFTsAOv1hKm4xZTbT6xMW++1uFPeFFAKMUDBgYxH4Gw=; b=whFTfGG1IBGwyOdmSg3TZuKZ4c
	9wlcmsGr8nC/vu+DHE9fgYpUaObPxyPyRNVI0tO0Q4bQk36IhX4c7iJLJHw5k7ChLqa8QgHYw7OZ2
	S66BjlOSfAvyhWRgFkJn7lpWL1ilrz/QEDchHmJPDzI1DdioZ8M2/v9cY06CJ4L1vylYJvMMIGncI
	YKYL7cB40smPx+LqMzmGIWLHCpW/v1OGAdwx+P3srS4z9I+kJL5nczUI5/AN6Bsy4sx8536bjbsuI
	Pli8Neto6apTTooqOW4/8eCn64xFuyFl343vQbeIOAT58f+GRbyoqvqXUIsB2SpsQ9Rd+Kt5k3zyB
	hTw7dykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrfn-000000052xA-0t4U;
	Tue, 09 Jun 2026 08:18:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrfk-000000052vV-2YrR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:18:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso15315735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993134; x=1781597934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFTsAOv1hKm4xZTbT6xMW++1uFPeFFAKMUDBgYxH4Gw=;
        b=WmaFlIXZokL0r9Ssh+i7mAzourDUvRYtAcuhRVZ17tggN/Z345WK8ywDR4szw2Zo6U
         7tgiZQHq8uvE6ZjcYXwqM2NpqwsjiiZir+9yL1QhGrT/VPdISqEMqqdXukTi3AjL1fqc
         0bgG+OqsvHD06uxpfxYGCXOXHmSixIfKFw001rSCMWnSwkHH5o7LsB8hwsO9HC/vVeV1
         ZVrHcnPd8s8NGlwrNINQYWFJtlOw2NQZlAzYQ3uoe4yoEAbvT5q5v1/hFhoKxo+vPTXx
         365MW0qjUrgawnnWYJll9lkPSNQRLYJZDBTcudrPgHab0kp4dQLEsrrXGWe8/fF+PE/I
         QtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993134; x=1781597934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFTsAOv1hKm4xZTbT6xMW++1uFPeFFAKMUDBgYxH4Gw=;
        b=nAjFJbMRwv5TCMZAUR9UPSm35p3FMeqcbvleWi7MNAmHmvBlLs7lKbdhb29xnFgVXP
         +jMHEEIDz/91I86d4EEoHjGmc0IO8aq7oPCYsRwGpivtGbpBk8nVTXFaNJJZG5ztbT9T
         zAqq42Bq9LW6svkfNNU1/pGhubjc2GnHB1/2NlfPfzp6M1KVohrxh/fCDV7wiItST2S+
         H8BvGcEdrSBt4Ogpq4w6zMP/I2anRFoJYthZQ5sPfcDsEL43cjqaUtzGfKegIHeGj8yV
         jYOoxV2Y5nmZV8o2r+F4ihX/shBIDvdanpM5fdy0sLr8eSiTsxnlT2/6AoUJx63DR2VH
         P/Zg==
X-Forwarded-Encrypted: i=1; AFNElJ8m3TGakDMPopQbV9ogRkDrKnYupjZwdWc5Pvqptf0RCYI65LGyEOgyfS5F4PLgMe5NW7wRUIamrY/hw1buW/Xb@lists.infradead.org
X-Gm-Message-State: AOJu0YyvFj/jI/X2iQoVxpf6Cwv1Zur5VGtSRi2MsgFAQQnrclGjqf00
	iMFXhaAEk3DTQwnQIBZyfOULUTyfQX77ejYxuGhG0pDhAR28nDDgoJzp
X-Gm-Gg: Acq92OHK2bsiNC1mmi3jp0iar67jqlC/AJ8zuVofFbDEOMKK+lHtJpTLUt5SjB+jj58
	Ws1y5muvwVkb8oYnDw8FtESKrKyYByympfgn3xonFrTNqV0pJycZRkDVUYLFIcZ2zRt7BtnwsgT
	1z803K88t4A5f8x6aP3ZZtfKwXg423fNyX3jZeT1XHmSpA0PApgV/ctnsGWytdEbU7IY7HrxpUe
	zeqsMb9SkR/1BaKsxLvSmzIhMlraPq7Vlf8+BO8Rrm6R/qSHu+62+thXTE64R4UIllxXobyPake
	T0z5CURoLHDHphm+uEjJzuYTAqeGX0zX2we2gMTNyasxF2l/wZDopwoR0jRPO4B/3Gwcj2HNfh/
	/OLUAjRiG8BGBQm0DRs+l84mhrV1LShBDhMEzf5HJTn/Oo095KoUvRVG910aMu6QI5K360db9i7
	94iNbXzEeN4QjzBYueVdV5+paH1NdVLxUBgvut8UqDM/oqaOYCaDuUCc8rhFzJwt8efeNqPHG4X
	yGDE5Ew3dMK4bzPYqsOkdHXFQYc
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-490c25b09a2mr318781815e9.16.1780993134354;
        Tue, 09 Jun 2026 01:18:54 -0700 (PDT)
Received: from thinkpad-l14-ju.lan (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d60a7csm43053615e9.2.2026.06.09.01.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:18:53 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: stable@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: fix emmc reset polarity on px30-cobra
Date: Tue,  9 Jun 2026 10:17:25 +0200
Message-ID: <20260609081728.30616-2-jakobunt@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_011856_655178_430C6542 
X-CRM114-Status: GOOD (  12.75  )
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

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Technically, the reset signal is active low - it's called RST_n after all.

But it is ignored completely unless RST_n_FUNCTION=1 (byte 162 in extcsd)
is set in the emmc. It is 0 per default.

For emmcs that have RST_n_FUNCTION=1 we failed like this:

	[    3.074480] mmc1: Failed to initialize a non-removable card

With this change they work normally.

Cc: stable@vger.kernel.org
Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
v2: Add correct "From: " line

 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
index b7e669d8ba4d..90751b04f95c 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
@@ -35,7 +35,7 @@ emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		pinctrl-0 = <&emmc_reset>;
 		pinctrl-names = "default";
-		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_LOW>;
 	};
 
 	gpio-leds {
-- 
2.47.3


