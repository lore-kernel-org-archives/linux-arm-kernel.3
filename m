Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524C6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kz8t+h/h/0n0QXBXq+nhgUGC9ql7IeTr95ekPgWAy9w=; b=xe5nDSqdLoXB6S
	/NaDlyB6o33ssxJ/rjntMLyuCGbTayrK9N13LG2snuuhM9CGKgFEpi2/9r8aWHO9xmP6d5dNECkMA
	mFeFHbYSGN5bJ7ooLjsLBEVjGyIHvPBE/AqviUvuidMgW+vqfnB/GH0LorQY3IXrWCqBhQh2tPckl
	hWCl8nQQbPNAcsfyxqbiy0nvj4DDalb8/TRRbSIsWxY6ECfSg+VKCorqcxLjVcaKz3qvi3/DD/b9u
	es/a9zxE/OlEq051T738BVUcX9Q5ZYFU9rOA91xH+JGFXZkpd/XnZ1gUHVNnFSYCtNEbFMHSwmi/G
	OQ1SDbxecVPigbrgjnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoct9-0000000CYwb-1Pv9;
	Wed, 20 Aug 2025 07:05:39 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocqR-0000000CYWJ-3913
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:02:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb7322aa0so85578466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755673370; x=1756278170; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz8t+h/h/0n0QXBXq+nhgUGC9ql7IeTr95ekPgWAy9w=;
        b=vfd8Su8G+t6Eyvzq3ynD2H1FErwrC1Cl4bo0mm7tlYbWV+8YzIpKAt4EkJiDHN7xYl
         rV44vpDC1LvNZeH4D0XpSBsKWBrlAbXC8Xqke8XFAOQt5z4Hr2c/VF3v73E/m6O78ba8
         jKmGLzrfzuep1bb4UYV3DfXPS7rt7ALXsA8qeddXS+9CBoYOw3+33BHmgVq07WQ2ErjW
         x682Mz922IOfFr3F4RkHpsbQa0bG6TB+79MwHzscFfFfyVGCGe9ZqlJfsshGtuqdWkyM
         d3G7DDNthEKnCIon+cIeYVJmWFlWnQvp7gsgoiHkXcMyZQOf+6vuiQ2C3ENsT45aGgmK
         mXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673370; x=1756278170;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz8t+h/h/0n0QXBXq+nhgUGC9ql7IeTr95ekPgWAy9w=;
        b=GbL+oqS1S9OVoyy6uxsk96qeWKhFsS9a+5PhZP06tWxtP1XCKYebyJNrP2tU+uZ7g0
         2o09Jh7WQCK4B9CD0nrRCb6WaZJb5ihJndyhjZZuxHn8XoVR3eL2Z3Cb5f3pk2LG2Qj+
         OzL65I2eDwq5uH5yOGCXvM9rJZvjeu5Bpnby5hzUcOyySU/ryfkJeEBpLiOlVVxDpLJj
         QtJUfAUtl97pmjkKQdnyv41tDLlbxeCXU4tAhuwaAkvTiqAcPNCCaQyEe286romaAV97
         QHxqw1itiAtN49GdXwT7kHfRnCR9x7mUtL9pT8jOJ5FeOGPvR/5HNVmUIAOWRJ2Ljgbc
         Z2uA==
X-Forwarded-Encrypted: i=1; AJvYcCVnrg819z7kLuuBkNqff9ll3T5rpqevASM0pY1E4lrwpC2f320KjRDKUmyFMtv6Ck1FBAKugXcPGB4bkrYJUhT+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3/tS4+yv2WJcGnwyvPvV/9HYe+jZHU6B/Xoe/cl0Pu+CuDfrX
	fmfNH6WYHxogM4UAnn3DPaT64CUnAlE/n7RR62BTFyGG8JYkZuizESJHt760ut/fhOA=
X-Gm-Gg: ASbGnctYjBoLkFP4vMAlivb3x4k0Uj54VlcDMYYSMdyjM3cVbsv7TV9qMm8NNGbik92
	/5T2IoqOUHY1WWq6M0ErddaE3B06iq9MwvluCB/DnhnH1x8eUc6BJGFjN7RI9ZvUuKT1qPnlfi5
	0E6niPWKXyrIOjwphtZpAHDjWCBugSwHDx/Ey7MyMCMkUamsLnLgPlpWBifz/GloS8pG62IEWYc
	pHpzFEbvJpg3NRxWDU5m22LgL7qOjMu2fdSAx/Pvcit8+gRNR9Oa2sFeDcK6bOgyfA1d0pqw78j
	CBISJmBqskOq3mrnNh9jZNG3PzOC0APRK4KCiiCYvBHF6XArHSzD+vwgD69Au4rqAD1zgPqGMef
	JfVgRjJqNFIYbrtk/ou9A42zcM+duYa3496IgQ1eQq7YUCiOMeA==
X-Google-Smtp-Source: AGHT+IEUJtY9T7M3w+t6NgODZP2UMBO1bB6yUNgABbdBlZ++2gMxl+ZFtQKIgu4nmM7A4aFMOc3sVQ==
X-Received: by 2002:a17:907:6094:b0:af9:3d0a:f383 with SMTP id a640c23a62f3a-afdf019afd1mr77479066b.6.1755673370012;
        Wed, 20 Aug 2025 00:02:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf6ff14f8sm37756466b.67.2025.08.20.00.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 00:02:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] dt-bindings: display: Few cleanups
Date: Wed, 20 Aug 2025 09:02:39 +0200
Message-Id: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9zpWgC/x3M3QpAQBBA4VfRXJta6ye8ilwsM5jS0o5E8u42l
 9/FOQ8oB2GFNnkg8Ckqm4/I0gTGxfmZUSgarLGlqa1BOnAQT+JnRRLdV3dj01QuK/KxrhxBLPf
 Ak1z/tevf9wMZuMYIZQAAAA==
X-Change-ID: 20250820-dt-bindings-display-996a143c86ad
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x6AMMrfKmpsnt80qI/jaePh0x1MxD2M+8h0kme5S3Q4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopXMRGm342NsJMwTGBeIUU3aEDsSSJNSmaCf3z
 2hb1+uhE/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKVzEQAKCRDBN2bmhouD
 18bZD/91yp/iNgPOT/8uepdf/zbiG/DGKC1+o61nNJG7BV5sIXxSsdSZ1foiLkHXibtjcNRwQ/s
 x+wbb+LGT8rwNihSQTbClhlnGpXKGOb5kIJQ9z3T+PIKGYN6CIV3o4p6hfvnGiiew5aADThPKJ9
 8NFQigShv/pzBXx/7yRzb4UyRxhkvfSjxBXf76ppaLwyvUh3Tcf5awj8aHfTVb9kR2jVBM21gAD
 SRTfGiqhC9yWvPJP16o9c3sdHOf8Pak2qnpJyfXj8yXGv3+EpcwZ4oJj55lq0mjIBoTlHaedT8L
 CwM/STq7YsVkiQHD2Yd6bln07WWyUdQtXiVUbm/JBKJgSAyysh1/E7VRbp17BQ2yvsl8AuRzi1X
 qVjHurkILLCLqiOGWuyYBYbr+Oddhxx3w3ZDR47yvJGMmXlHwfzTab5U5IW8OfiXHiSgAP0STuS
 zfMQFCqSeskPBGzRZm3FMVw6Cmlt4kZSgBff7JbYb6rD7dQZF1Z185+7beNhzP7mkFdtVplBT6B
 ueg1Uhz/o51bOZgNc3s2Jf/nBPRDEFwXdw5iSS63VO+LfPJsFJmg98MoUMEpkCbz4oMfag2Ig6Z
 Tl/wWTVLi9tC3Z4XuYkUHpUtHbUGghMGsxPnlZ+gCDNEYcdQN30wBgZOxKPet6HCgmghz8FDqla
 d+DIIriSdXsoRwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_000251_809085_BF47F327 
X-CRM114-Status: UNSURE (   8.57  )
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

Few minor issues fixed.
Rob, can you take them directly? Display bindings are pretty often not
picked up.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: display: ingenic,jz4780-hdmi: Add missing clock-names
      dt-bindings: display: ti,tdp158: Add missing reg constraint
      dt-bindings: display: rockchip,dw-mipi-ds: Narrow clocks for rockchip,rk3288-mipi-dsi

 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml        | 1 +
 .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml     | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: c2a1a5ede4717e6f12d49fe5177a66d40cbf4847
change-id: 20250820-dt-bindings-display-996a143c86ad

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


