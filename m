Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F31FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=; b=waSgGNH4OsuFl5CBAdDKr6CtJz
	2aoPGFPKdqo/X4E++HiZui93ipnPFeGZwrc+E+2RRpHCQMrO/Dg9JHKcmeuOGbsBkqN21tkJPEadD
	hMAI/Mfo1ggv/N68ftKYrUYamBzFHtW3XVXnY1oxJa2XsGi270XvQTnxpLlcguwkB3zZNpLcexS4F
	ZOxKu9UyVRoylV7H4Laj4UC5pTttrZyrsJhiHwxqsX9uJd7fErJJOTo0MqGw8z0yht2Lk+smT3mZN
	ra2MXkAC3wwU+K8Tv8K117Naw0uwzidjbhq2nSyFpzxzD7qIlEnj46gWYJxBkQ00oJZHJ9c8HQ0ao
	+cEzSPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocyJ-0000000CZSs-2loF;
	Wed, 20 Aug 2025 07:10:59 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocqW-0000000CYYo-1GsZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:02:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7aecf92so81694266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755673375; x=1756278175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
        b=riGkfRIrcw2WsOaAkNgGIV5Do0j3nqhY51A008cIhJNf3pG1Pp43fVeq9m9r+joLqr
         R8uATjpBaP9AtjS9OOqdW3vpEXFTvqihfpCQsOJVp8LcPVuuUjLetgzROFbckC1kh5Qj
         pVyzD8pUJG5QtBhhqmbsjNybr3WnBSZ0FV1EgtCWV70Bk59VSGP2wKCRBZwFie88KO1Q
         mHOquMXlEq8nEO0JrBLbXq/1xRE8WVX4ybd7QH7wnYkk69Vvzj15fVViKoBKSCK7mCen
         mBIznLTseX22ncyhWiTs433sv99u9wytupG4P5koi+ibMPRfiZI+3Uc1RIypU1cX6yXm
         j7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673375; x=1756278175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
        b=VmO63nY5nFTuVpHg2HKbgNzrSOEc3BcqsarcRcJ967tSfF3aPRI9+twBgBAV00ityp
         gJ2qyRTve4mP1e4PRoTD5E3Wo2hsK0UTo9fk9Le5AHJ3ofIt5oDro/8c+hJrElD/l5/Y
         kx/VvaUvgy0FKhprYf548AqW0i30NfF0SOyv3izdij9wGv5Kc6y14HEM/L9lZG2R2LaT
         xqdUgVM+O/UmpVkN+mTsM/yfkyrLwTXCg3gExhOgOFuAeDFYbIN2vW6PqUvqs+1OQcG/
         pUxZxJmEiZSGMJsUVtg1hS+z4noPF5W3Kl1hauMPgKzLB+joxpE8/C8GBcZ4q5b++jKh
         HRZg==
X-Forwarded-Encrypted: i=1; AJvYcCX7ghnYPy+ALxfc2YM1XjjKplnqJnd61Pqt0o5W9CePI0tS+tH9mdDPpXd2hEsAO7R79kyElStl3ABDE8YN0IXV@lists.infradead.org
X-Gm-Message-State: AOJu0YxXFTPk/9x49qalGZWUJi0H+/39VPdstrXLpG8qOnA7m2SMuEYI
	qz8u5t61O+lGm8kk0WzGsN+6YSddGHvJSVD/9DUl50unNBPxsSWpS+VpL3lRQaGG0VU=
X-Gm-Gg: ASbGncv0Vw2oFcaCxVRIZMa7wWzwq84bi1FLN8Y106k2V3sP20YmNmi58Dmu/jmDHYn
	hcev/aNQjfrovgNwVTCX9hqj1xU4+esb4sURu8frm/9BxEFo4Oe4hQRCEqpfZtLczyRng0MumIw
	Yve9NTv/vcxuQO8Q3heNayn9L7mjFvejqKvZc2sc7reqs1G294FE/ZvYuuaWlHHWMfAJm6W0TRX
	y4eLaKav24ElFuciakwH0HvE+Uacosl+8eyNzfICR5UIky9aSiNU1EhwRaNj7zs9nN6UrkPEu0I
	REMkleiHR4FrF/ssOYn45JMmBB1zM/29Fzal0MZ6E9DbbHyQCkqPOym9sk+07eqCINFpoB8t/O1
	VR2ZovvNjRXNeNsNHvAG4X7V/ys047RG4gFsXJ44=
X-Google-Smtp-Source: AGHT+IHJRyotiUitRQlmcmuPpwvWkmkIG5BFx79tKET0/ZCpVsB1kmI1FDM/O1dsctY74CZHdQJyWg==
X-Received: by 2002:a17:907:869e:b0:af9:8a71:e090 with SMTP id a640c23a62f3a-afdf0280436mr79978266b.9.1755673374003;
        Wed, 20 Aug 2025 00:02:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf6ff14f8sm37756466b.67.2025.08.20.00.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 00:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 09:02:41 +0200
Subject: [PATCH 2/3] dt-bindings: display: ti,tdp158: Add missing reg
 constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v1-2-d5b2555df51f@linaro.org>
References: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopXMW9wkV4htcYjEWNJWdk1zKtmlcN5CE41MJX
 1lvlVHNyB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKVzFgAKCRDBN2bmhouD
 10A2D/9nQCtB+BeS3a1GcRicjBMuO4BkqDJ5fzrjdybep856QeJGH+n5b1OlnWduayCgJ6pf6Dl
 LypCyElXEf/lACJADLNxNjsYmPhmf1xM6Pcn8rUiaRjTWzL5kuaKrt8ebYHsWZLGMPLPjWAInos
 ehCcXGVg0K+9/wGg+Ktof4C42Apwde031SvjTDqRFovXzfZiMksOvKip8EqCLBP0Q7I2ATk/HMo
 YNb5TZuVXvQei+SPOlGiDyjSE/lrv2u6zX/8Cgs4bgm8+lgw2vhnoLu6FCSssgBpspHM8XdK4mi
 7RVZ7+AejZe9/NrCUiby/iwRcz7r9GZBpbYj4AgyEMwchWysCpt/DeGaKJl8wFIUvCVHtQlInvQ
 u/+ww52Wz5tbPFYypkn8DeAl8xTQvvBB+tdGFPq6HedhtRQpF5e3TI/f19j7CO7XbFvdc7L+Ij2
 AaU9Z2GXgTdcvBI7CQn68hNqcoGYQm8dmxaObXAHIRncTbasCU41dBaRlDqGBxwIpW+8mzxHOZ+
 mxP5i8qdMzLlDOb3upooTdHnHYdpxv+4rHyKsOa0BR3VtvCISQUHiIlfo44ZFT5KnxqQrJQPqXY
 QmdKI43hwtGaOR0OnRZzVR/elstxfWt1N+1ovS6R0pbZnNLTFD73gtuL9gYcz84OOUd1K4qOkvk
 Uj/DMPJ6az2a7Nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_000256_359081_F7E8CC6A 
X-CRM114-Status: GOOD (  11.35  )
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


