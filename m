Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB915C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=; b=ydTaq3Fj7VV+xicRjukH5ftAtL
	23F6kvI2cVKk0nLr7fswVh7gMnJ4uImbPmChDrKjDUiAmSP19nHRnFmwHEoViAWm697h9LWdIxCLN
	+MUivdlYW+h0eqcYypiC4BsxFhiwWA7kbbd2M+XGi9wlDLdJAvX5VDgK8xdgfTildBYsRA//1lta9
	ZatpXReUTpyul1e11aC88VdB3yl+KeYvOqv4O3jIW65Z3F1ONzA8Zf/1rnNJVcR4YdrGUvEvy080k
	MIJC0DTuxS4T0uBRNoWL9+pSkANO7vks/q+SOfKX6ImnHsYBL30/oi07FDq8tEPhF/p4vhCo/jzrL
	I4WtyPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6eo-00000001cqY-3yKf;
	Thu, 08 May 2025 19:11:46 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6Z2-00000001cJm-17aF;
	Thu, 08 May 2025 19:05:49 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6f548a4ea4dso13532956d6.1;
        Thu, 08 May 2025 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731147; x=1747335947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=;
        b=YTDcWJRTEiIeNmRl/CsxyvLrYnbZh99TBk222oMshgkmsLA+6YivB/DG6ovsMx1lAw
         4t4oJtqXGW4xlMfTp9JJpS2qQ2slM9qv7qZYowQB8VtwcUFLzVZ/sQDnW2xwCd620Tyw
         9s2L43+Jpof/AhxC+Ixn5O3Gz1SaO1JFrTCQAu6uUmQjNLZqL1Y15b/dnQcU8a/yqQI0
         C4DxBqAcDK1ETc/IjcT+VOBxidlAQFWNP7I4/FvhTypZPyvIPUtflacAO8+zGcr/N2rz
         AJYApkorsHAzoFC4wrF0gEnj/tE7T+VijJGQ8KxUqcc2dOKyQOEfid9S1Bt0JfgGBNT6
         8fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731147; x=1747335947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=;
        b=dozFTjKA8rwS/qP4Ya43d+6f8WYs0MhQEgDv8oJlsg+SRfnHYXXqFSgNDwoT3p0yvm
         Sh11WMSzItrfEXxnxaGqmYqXIrD7qdbaP3vbIwO1TzzMyuiwopkU5tuiQh3UJVy/K0Fu
         6+aMsG3rXRPNIkVogWt0qhdw67M1rPbKQOv2lN2PCg4UHyJTjw9dE/aAELvTrrEGbp5+
         MmGq9/FvWXtgkCWzMitVU/EmrRFERWLLylhjnLaqMMIfK2RyFUwJ4jPwmBeD6jgvALIq
         bp3Gg92c77+8/qPRJc/VTIzBGZm1G7K5uGKFjkuup74dDd1lW+wVmNJWwegoZkffvQcz
         tRVw==
X-Forwarded-Encrypted: i=1; AJvYcCVVnjjumLMjLWHTDDm0+UcA6PmIFHjeUu/2vhf/bsMJKargtbxT4hq7S/zfhk6obile6wK1+VTMvSc7SjoRLpA=@lists.infradead.org, AJvYcCVlciQoauob5IBLfMhD3BJwoDXKdLclq/Bg4jOpRxxMF3PjWtCRHDDrov2kWBU2A21PORhOitPjc9HYWqT5tEsU@lists.infradead.org
X-Gm-Message-State: AOJu0YxNCTrCBWiL73rE/IQj1H9blzXQwZwPywq1hjiwOqT9OuMzie++
	515CxqfjdAWpH5DMYuFtimZR0qWQAGYYw6/sVvMjHqWmX+t9Xg1u
X-Gm-Gg: ASbGncvVwOQbXEgdonSqnsglTwjjGSqtKWckM7SsWsysijU1qRrQwzCn6nxNfZU6P+E
	8j8q4010ARx3VeWdSmr/2D+H3zwxVuq0XqSj3Ct4iS+K1x1KkksYr/L5H7b5Kxh/JDN63FS0D03
	3OSqgdbohl5sP0KbkbyB+KmFGdDYGu5fnPbVmRiTb4eZPQGan2EeXNi7t0cSkSWhv6cf/YIoRmG
	efUUeb8+CoxmT2tnykl2c70CkkMGdoHl3+HkojdRTy7ekK+Vi990dqu0cxBWPw9Sc7UPWQ6xVQq
	UI6ltG3iH1eh6yU/MlOHWjeR0rIU2ZD6Fa+2UGlFOgtepg9O1mM9
X-Google-Smtp-Source: AGHT+IEeACegYp/zt9e/FFMq/KRD4iSWd+tG/DCi5H9Na48vpvCi4H7JTTkAlcSv1ADtMOYmaFNKjA==
X-Received: by 2002:ad4:5bc9:0:b0:6f5:35fe:6a80 with SMTP id 6a1803df08f44-6f6e47aa726mr6887056d6.11.1746731147100;
        Thu, 08 May 2025 12:05:47 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a0bee8sm3148216d6.54.2025.05.08.12.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:05:46 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
Date: Thu,  8 May 2025 15:05:37 -0400
Message-Id: <20250508190538.22295-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250508190538.22295-1-inindev@gmail.com>
References: <20250508190538.22295-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_120548_303160_E8CAB37D 
X-CRM114-Status: UNSURE (   8.88  )
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

This patch adds device tree binding support for Luckfox Core3576 Module
based boards, specifically the Luckfox Omni3576, with compatibility for the
Rockchip RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..92f494bae3bf 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,13 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Core3576 Module based boards
+        items:
+          - enum:
+              - luckfox,omni3576
+          - const: luckfox,core3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5


