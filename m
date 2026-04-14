Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0EFF9D0FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=; b=rf2oD7OEv9Rq/CPWmCpbmYE9yy
	xcHSVpAPUPlbFOFDKyY3HeFbsdN16iJGRMceB292oaQoPKiqOBXLIGZB4cO1QkNwk98GPt7wW1az5
	SFVN5tyAne0PMbZBPuOreYfbBtFsWHoHMH6TLqDnCvdmM3ZnVdDtEvJnntArLbZdDka/oaWsRK+la
	e39uZagTMjgF4dNtAQFRp83B/SRvDzKR7SBe8IJIc3Eq0HeDqcj+1v+zkYxyDWlVUMemtvRQ00oH0
	R699xfxnNRtW+S8VghrfbaaSTBkSG7eJldUxDjGbbIw5QK7ssspFUErbR6OcMFBJBGumIffQIoWAK
	LdPV1C1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVT-00000000FeC-1TF8;
	Tue, 14 Apr 2026 21:41:15 +0000
Received: from mail-ua1-x964.google.com ([2607:f8b0:4864:20::964])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVP-00000000FaO-1Lxf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:41:12 +0000
Received: by mail-ua1-x964.google.com with SMTP id a1e0cc1a2514c-9568159ee07so1694587241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202870; x=1776807670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=;
        b=iCRN/+3vOpt94JJB7griFob7oJbc+UTNnr5EGLedoGECr1+85Bwew4y2iB1WBV3lL5
         mENs2O1fRWbWy/dgixfdImzxcU1RNJUDs6cHK43RJwbgBMRAsKiLKNd7/Wxh4A0tpUnp
         6XG5kkWcDy42d9S1hLx1KPhDY9CeY6M3MZESm9AQfQ8HkJbEKHqYIa/0fJF/fsho6Qk7
         WyytfVt1O5L+w4HeUiZYKTxD9U9HEgKl/pOdM63ygII+u4/XVQZxApl9tRZHgKBYjpY+
         wM2X874xX1cGW9TsX8+GO/U/uAsNNOX8RKYHOam8bSbN3f/bAK8hwf6u85LiVGfqxTmG
         ffew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202870; x=1776807670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=;
        b=rFBx02P3pt7uYZbRcAE7t4UZ62Odj5aSYfe9WWc1YSONCbi0K8qxj0+k4cKLtrwrOX
         UoyByinfYIeXFLfiiynqm3KFlcRTokn532gURLkGn+tmjCc0z2XEPm9IBwHIYqbyNzfG
         XlKOGpcupJcJEeqT9Z/oCD/cQTjTi9YatsX3bRtshgOVWrVAwyjKmXs6k+jbvn0sNSyQ
         wRxHjRS3atiyVk++tssNZxhxBzCUQvYWuPRJ86k5Rxmfr1/QJSpPd4wdYhy+7gyozGGh
         KdHmvFY8PylWMGgk31m/QHzcLCxzZBAyD0Jy9ROK74wDKwc+HlqDWLw+K/U4R2wkBHzU
         KZ3A==
X-Forwarded-Encrypted: i=1; AFNElJ+kzfNm1wP40K2HI4Cz8tjO9SayyEZD/pujZ/YxDeTzOJPn75W0AfShqbzgzyV+9l2FrXVGytj8UsLpvKGaqlwD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/VeOGYKuAE95YAFJFVdmfC7pkpN8JZJD7hDcCSgWdQZtfXs1
	80A86V6nRSt/MhAjJshwfHcqadsEmnltfagMbq9kBOcY+LV3Ww/QHrWOW8Ci0vm09PI+EawFtKh
	EBTjNoN+BPVHmEH4axti3RFNGdJIDnAoed4m/
X-Gm-Gg: AeBDieshW/yNxkj/KdsFHYB/75sMfyYUG1/gr31whQPitMGAdtTfBIOD/Syzbfy3ymq
	GSNS6/XB39DpzgQO3rAcJFtHlZnc/Qz9gZmokzSvsa4DeitUt1IcxUR/U9J3xbmIViwXvMx7j4B
	502sQegqTyI0QJ7A7tx2X2ggCbFX8OlUQVqN8NHM8t9eHl9S7JPWfmrwzvNRrOgef+EdGXqXhTL
	EYxG88SY1sLecG50Hbi9c3vMQsvhCDQN3y9cQus3L9xwzcoTl45xShLo7tyjakZu7e4MsbSKdU7
	OKSS3pF2GcbJAjOdNkvtSspAz5ILD2l8AqzYvyjWuQ97ZbpmVWriBEhDTDVdh94Nbu6PwjA9vIb
	dcVqpHLza/jQiA2046uuVUKixOI9twjU1kPO5kY9R/3Y/Ik4LwnY+b28=
X-Received: by 2002:a05:6102:c0c:b0:608:9c0:4908 with SMTP id ada2fe7eead31-60a01271472mr9236374137.32.1776202869938;
        Tue, 14 Apr 2026 14:41:09 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:09 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: 
Cc: Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/6] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Tue, 14 Apr 2026 16:40:52 -0500
Message-ID: <20260414214104.1363987-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414214104.1363987-1-dennis@ausil.us>
References: <20260414214104.1363987-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_144111_360303_D8D34A7A 
X-CRM114-Status: UNSURE (   8.93  )
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

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..3c6b83a84463 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1320,6 +1320,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.53.0


