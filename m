Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED149CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=; b=h6QG7nOB9WHfAtCa+o43WycS82
	E4NJL7G2i0ekOx0dgYmqbyvahzS7qVXiNMdJZ5j2m2fpU+SRHH1Vt0QYzwhtv4usH9Tph1CiKZapW
	MpBuD/DRcHjNltL0Jxs+qOVwRJH65tg2C8s++0SyYsG4TRFvHsJgJah2cWnSKznoPjM11LbLvgOaq
	XiedI8g+lydlNGxR21zdwjo5dNGKTEfa5LRLrMjV/CopgwJHWhYXVX7JxZ4S0xVNTRAUd5cIwpNpw
	7hAGM3Zkug7kf5dcMTBGuTROdVZVpWjNRcW5SoV1nOfKTPLLZu9lXyiHLpXr+R7S71woGpZ9VT/Of
	q2jQ5zeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolF1-0000000EKSP-3OdP;
	Wed, 20 Aug 2025 16:00:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojdQ-0000000Dzum-17Ab
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:17:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afdf4bb0e5cso11576066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755699471; x=1756304271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
        b=NIXR/K1HfbUwtrV7NPXcPmMx1hrBPRw/n0eg+Ki04mLpOCYsgTwJ8voX7HYnTZw0oh
         jFKiNWilCKhcN2xmuh8raBho9TwC579+hSm/QbtDCH0kR+d5HsgC4duGwhjhweJXfqX8
         5pqGddAJQztLkTapecntkn8cOuKKd0MO93af+pUZaEvplUmplTLng/RARn6T9Dp1+Dz5
         SS2POSg/aYzA/ZzU/l/LJd2+cG7mOVus3HDVPnCZjqo7om7vJpSksN+pJKwQQBn8nC6X
         odUyGR8QCw9Ak9EbDrhagywDxVr1UTJ4Uh7rOMuHCOBPrex8oR1Bt9KaANbHaMeokQhe
         4+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755699471; x=1756304271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
        b=DDPKsUUa1i2B7bOVuOMvY9xo+Z38LtjUWSgCzS90c4gvQiUU2LHYcL+DXJ/SXC2dbL
         xeOhPnokMn/nQ3APIMOIyfOF6CFcvmbjDWmsALAktzlFNvfi1Bhqn8ZgIt7O+cDWbgma
         Jg0WG7hTXc9gvW1hFv5lvAQRrMVAaIVJ5xVm0iPKhpnpn0gMAkpStaqHKsOU4om1vYte
         dtV4f48H4C3tCoKJWZlaMHBRlVW7F0GQbVD4dY0nDbndmFfXZD2iP4xAtAgKIkwMuv0+
         /+KbCZUY8tgtOtsg2/qDTUz8q/TEw1kueUsjTJRQioEvBj1cx+PEdZv+Ehezx5wRxWKy
         Xm+g==
X-Forwarded-Encrypted: i=1; AJvYcCV+f0SyCbrZqEy4i4tReilQ3+nOkrxwDBvcGeUh/TdjvLjBG6YKpOwGLmaYiRL3XEW5ZrXWz96w+SmCFY6J3PYg@lists.infradead.org
X-Gm-Message-State: AOJu0YxDbptY2q1Oebj/X0298Bn5sondjEgWkGR219gNRuj9U3dQVswj
	nGR5BZGG53caIw81di/C897YLara28IOfY6deI+pM5Mjc7uzAAqCGSLH631tMSUxMZw=
X-Gm-Gg: ASbGncvu/a/RLRsZ1WMeAGIuwKDfAIGo5p9ZJhKK8Ov+N7G/fRjYTzNxhVBjZiy4HWA
	45FYbmoxjIQJR/dOWRZb0M4BdxVjlbzRo2ilGfScaTf+NzctRhtXFJSxyvEdUkqtDWSymkdvyaI
	0L0ddas6XILu1M0BIe8F9tcEdTp2E99X6+JxJ0U95o++QtNXylJqLin9wbKSdeDwyGkglJDsm7h
	F1+M6ouoHwLpoi5oqZxZEeNLD7XjKiyKKeh16Vkb/DvguR4cWvFeTVclaZlDkU/JZ9SyC44mayq
	gwXiQwSSnMWEd6qn15uiA3DL9oyY1YJxK3AMjrhlhPe4XuSwEq6E1dq+4euAM2KIv/amW14dy4L
	0aENFhr8ZHZdPKIvEa3wCFsAtgI0uql5DVt74Fzc=
X-Google-Smtp-Source: AGHT+IEmrLUelKKUOono3ov9GvjFbcW6q4Zw0ULLzvLJYEr2I6DZLLZrvFrkswdj/bNZgbWEgb8PUg==
X-Received: by 2002:a17:907:1c12:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-afdf0256674mr142702866b.11.1755699470561;
        Wed, 20 Aug 2025 07:17:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:17:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 16:17:37 +0200
Subject: [PATCH v2 2/3] dt-bindings: display: ti,tdp158: Add missing reg
 constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v2-2-91e2ccba3d4e@linaro.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AkV3VRQfJAkPuyGMV3zApyjndBmAsTYMa/X+l+hz0eY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkHTLdBz/9upwUfV9iV1nnV0fegXMDVGScJS
 +323M0dU0aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBwAKCRDBN2bmhouD
 12rlEACGX4EZLaWfGRRN8ipoGBIacbdpDdtXYFRu0zv6iVQbYo/Um8r7PYFUZQM/dehtOi6wewV
 Q7+E7dUwXKMF3wuZGjwQ0m2nXcHr7i8EXzrKcN27rlX5w/2qp2+9GMlwsZJp8YgMsUVs78qZ3dx
 f71D/9101SWQN6XQU/m5OF2Ar4lzohcm2vb4Lkl4nSf0j2t/oxG27/aZFBDvrRxFFFKS4HwCii1
 yxrYrkwvvrTjXvTxsawafd6ESN5uWS3lsAEBkFc/1SaarnsKPmznKyyapyv2hiX6OqeYEmdgvj9
 32QnIY2KF39R5Y5eq/950VSdt078I36aG1vljAwfAPg0bnHx4zjksF3ToHCEGfaBhffoonrjPPE
 GA91+7wy1+262Ue8Dp70IEfYnPDB8byAmj2rZOTwQ7/uiZK2BkS/vXAHqm5FFXersWKWhhVgdAZ
 7i8Vdf8NMJiwABhUKwH1HgqLLqtT+JvY/JDOLDDm6XJLwpbQMRHD5SqA1E6aMq6zgfPhU9hdLLj
 i60X6KTKsgXASFkbZfNR5zwJGyZLaOQWwsIR4EO86n7d4HYFJpHdIM/Z2F68KTezqAIJKi55v6P
 /e2J9tF+gLqLSjo2KD93r2bVnlCFTlBwzOpGT7rJlzdNy6w/4/zWTu/20KJaORbwEOX5apcLqy4
 ydTdZieF1pfoKyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_071752_298322_6F4FBCC8 
X-CRM114-Status: GOOD (  11.19  )
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

Device can be used over I2C bus, so it documents 'reg' property, however
it misses to constrain it to actual I2C address.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
index 1c522f72c4bae3313930b5c76dd04dde1aef5151..721da44054e19ff04fe9d8c1dc31a9168e8f79f5 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
@@ -17,6 +17,7 @@ properties:
 # The reg property is required if and only if the device is connected
 # to an I2C bus. In pin strap mode, reg must not be specified.
   reg:
+    maxItems: 1
     description: I2C address of the device
 
 # Pin 36 = Operation Enable / Reset Pin

-- 
2.48.1


