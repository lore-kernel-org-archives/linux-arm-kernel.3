Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9497FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO19FsrOkyTqyk5fmO2arL61kBUyFj/iNWEiNLbHn98=; b=2ScHZXiEHNcs0DJ3o9uYtXiuSn
	Wb/GYPmwnPFm9W0Kb/hhXKJc5zXqs2Hx70py8m0ZfgEITqUE/VVI7WGmVN6Izl+sbmSBYmqMtq7Zu
	9DdNRPWub6yzDyFTr/wlv3yyIWhzTqvMN20eXZdi75p3W457WRrelfpzEY54s7eh0jbMhw3pTzKlZ
	4+IoIAlNCxvA/QATKqjf4AJiP/eGqD24a56abf5U1iKM1KiLxNTZ66CiuVXfOujiEHHGV3kK8i0Pc
	Ip7bRyZoWfEPgw06QoePJ2isRhTQHgIYW2MpMmZa77MzqKFJ7yUyO9B6bs6wtHilgLCTBT2z8IpBQ
	1Xb8ma+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Ko-0000000BeWU-0QwK;
	Thu, 20 Aug 2026 14:01:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Kf-0000000BeNr-18Jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:01:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4998590d392so20254595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234483; x=1787839283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nO19FsrOkyTqyk5fmO2arL61kBUyFj/iNWEiNLbHn98=;
        b=pg1/5aZEw3CoClYlqjXNxZSx9JugJJJi2L523ym70YO/xnCo83HAk4BAEPRCYYlLfL
         gdGcUVptc2dvoY9/fnngrbXfVbysORf9GCnOfEF9Yo7WGumkZdrMfx6MZ13bIXVB/5JI
         hfVke6Ld81tKGKA+JK1k3f7BLpxAb3jZK0/tdwfOQwfvbwzY2y0PtKh6gZxmkJB5vExj
         jezVnbL5dtJmKk6wVxZQ+9yjoTDrGUo7y1Jq1OgPIWzDzJ+TqHbIMZxQ1v9pMYMz9n8s
         vwyKj7UitR4nHDTN7VRixPrTIm6lMqcShMl7p7wDxbfA98Yf48CRK1fFkyVvoR9fN+jF
         qN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234483; x=1787839283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nO19FsrOkyTqyk5fmO2arL61kBUyFj/iNWEiNLbHn98=;
        b=XDMhx1uWSHkQgq+jCuO6JSwtDM2aFlBFItWcZ2ZwqQ+TKbidxWIr69ztd+dtQrzO2n
         ITVvJfgqjr/vz2En/rPrhp2h7DsnSrJXc7aP67QOwM39rRtGPXhhQqF37v1jeNNdf9tZ
         iV7u75vgAg2h9ixxVWeV7H/FCFbxhXZ+DCtX5lqKEaFBTI1fAYEcM0Vx+MPyIImQb37o
         pH7UjmB1Cb6NakN9bF2z4ApU5Mv3gYIvqbdbOVn1Pfr7RdB0fHqG1V8XvH09C7D4gF4Q
         6hLajbRWHpZLlvI0W7yD4udAmRQRHnNvIGG98ZSDAr4w0Rlc+Ti/4TgjcZ0JlEZe5eCO
         oauw==
X-Forwarded-Encrypted: i=1; AHgh+RoxYvOfGaQYOmViC/jzYhYMI57SwdVMSwAwlUFM7g6zMk+QtgPYJoSQhKVrZe5Lvlb1qqJwa/kLirpMH+K1EUFg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1spARl1kFMAqZebZLUALDgCZhzYO/E4J8PoJLq6+sdXSLSB7J
	x+IJmHzqSUjZ8LvWiJ5m9kCSSohcR8A01s3oFl53hfnKVdFqgZGo86sJ
X-Gm-Gg: AR+sD11mCgiOT6sUpQC6cPE2PzJUAD9nl0mH5Av12ZPrqIcIARDQyM+Ioj0AqT81Ao5
	1bQUfR+twCVYjDn/1gxPD1V2Yh/67m+rFGUQOWWuuiHVyA1/Fdu149WFBe9FL//WnA5vHniTrhT
	1fT2L2Vs05KEtls6on3JW6rJTFW1hNCT5Dir8CmIdpfBZ9DjYG7qLJTPYNF09jWip7p71FHshKU
	JeVz9F86hNaBo6KuIsuYqQo/PUTwFmp9ScRnDzn4z932AFmVzu5kGn4l6N70KMWbm7nu1vMChUK
	flUeJrkYSOuj1eilCfUKszXKbLsAeHx735odjZCH9lMwiCrCqpJYoriE5nl4iOaW7QsxPbRp3Dv
	DaUtXRGC+ykhXkA2vX5Is56CUDGDO51z527x/Ff/+sUo4ogUOzsgKqEAgE13fcS48ykB/++7giG
	XbRT+CYkjkzCWKSHMQBXV/OrYrXqcVtJ+V4/1URxzo65oMRE6XzXTyM9FH5G1x+nsT9UAEr8Gv9
	zSKVpsJLTx96Y8HZ0zaJHweq0SWjAyEkuXBDnsL51Zq7UQ=
X-Received: by 2002:a05:600c:8b32:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-499aa200efcmr247008575e9.14.1787234483139;
        Thu, 20 Aug 2026 07:01:23 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:22 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:08 +0200
Subject: [PATCH 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-1-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=910;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=1F1r7NotkpzJGaZPEdB9UeDk/iA0euzjHAVH6r9N3K0=;
 b=Np7eikFgXwccg4Ti8gJzd+xtDeEZPan62gfovBipj90sdPV2MtJiz/SXhtWw+8fOcZ8ds5+jG
 kJxuBnXeSeqAJT6L09jGvrAaMY7eANAsKn7TqrvSzAgZ4vRkDHTVPOI
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_070125_384799_7755172D 
X-CRM114-Status: UNSURE (   9.62  )
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

Document the syscon compatible for the General Register Files of the
RK3576 MIPI CSI-2 DPHYs.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7bcb4e2f47ec..e94c83d7c138 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -32,6 +32,7 @@ properties:
               - rockchip,rk3568-usb2phy-grf
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-csidphy-grf
               - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-gpu-grf
               - rockchip,rk3576-hdptxphy-grf

-- 
2.43.0


