Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8752ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=idm/KKu2Ca8SRF7L+P8XLw2Sm8cV7IELEUwwZ+skCzo=; b=w/M0OZ6VRV+Iur
	UNmsd95/rS2YR/DIgQuohDlgIgt2TuFA64JLl9QjZtP5Bfe1zoC6HNbgCLGCM8JUY0C37A7pGoJPl
	iw7u5rBfs/F/Nj3C0ZEFyqNSinmw+jsK52i105gi6NY3EElspAR82DwTwLRfCjRGLeo2wVJIAFLVm
	vF8fbV41qQLOw7l3nzm1edPQxTC2s90ecNnefW6qsF/8uuX54ZnA3CIFLwIStM1vKprl9It30HnXj
	TLkiJtITcJ+DLFRGVaGx1BPLbvzLWQmXLh5avTyGjcZgn3hlzeK8ik598wQdJm2kwEHm9AyDoWJT1
	QpVlOBvJa9NVvlkC++zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uol9s-0000000EJdV-1fAq;
	Wed, 20 Aug 2025 15:55:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojdM-0000000DzsD-2ZKK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:17:49 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb736dc8cso84774266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755699467; x=1756304267; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idm/KKu2Ca8SRF7L+P8XLw2Sm8cV7IELEUwwZ+skCzo=;
        b=Qxws8Zb2zCfFOzA26tqbjPHCbp3MpAm5YJMz8PTQJ5L+Dnfl6xXyHaQSRGOiGG07jI
         6Rcttmm/j9GuMGXsRIQtr/bkqV7wnlfsIyvYloRrQoexyEC1ZklDkFxJnxHGQ5sLvYz5
         HO4BYIZvr8vbiQzdFmA7lBTS2FWzQeXYFBAHEN4O5dJm62E4eTdnwvI1dtn62f9+z8mf
         ThLkBp7GScIrXNU3F7aEEBSdC6eVicRrmXhXFuHJbjzWUAJCZYrPMoNfBWxwnJohz0kC
         7lQzI/YDN+e7WNL3tIC7X+7HdQ8HBOtSuoAC4XXzSqzCJ19Y8Ce/pcz4AX+W+gHg2hiv
         RjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755699467; x=1756304267;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idm/KKu2Ca8SRF7L+P8XLw2Sm8cV7IELEUwwZ+skCzo=;
        b=XY5K5PuqDTsCegwYN8bd2bXGYGbHu6I9bhJ51tKwraj0NJBJbFZcOkHWd4NUnxMXEn
         urJ4WMZ2s9Hu0ocBSuU/eWM0dH1gQikTbJHOf6+eW4DlObOVo9dLC6KXUbDSWEes3idN
         Pf2TVOY/f3PE9k5SxA8kzItlUk8tmDoIMb/ISnmtJascO43eCVxKgOFMvkGzpMWn46Qi
         7aB5EqyFj6pdSe3xl277LyY5ZXX75NrH0q9TPi/GvQU/qhCqgiDYvbkNBfacB6WWPb3A
         N+nkZzGd77ZbXa9sotckIsMpRyz0PiZ0C220dR4w+8QRhGA67e+1xPDndbb+T3C2s0en
         Js1g==
X-Forwarded-Encrypted: i=1; AJvYcCVVML4s7BKHaec1IotXx0YHdo3HOE8KNfGT+Tu59xAOXUp2lkg7EhINcZdl1MOz9tafQlmOmaeVWwn/y2JNmVAF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh0VhacYUcJEPJpGJEnROUYLxC83e0bvR8Bta8mIJDg0vIL7jt
	Txy9CscuwtjN03QDzJX28jfeF0GRckFBNGlJkM2i7xu4xyU3zEd9ATgNlUsry/BLirw=
X-Gm-Gg: ASbGncu+nzG/95XGJ2sE0uOX07IhzPA8JZCML8VZPiHhMgl8VYzdc5qoyW6yJ07GyXP
	igo6NTqmV4i4pf0zn1zC4e5XyQ3pEi/boGoTQ7If5bpheJXLZLhjSVlT18lvhKqj8+llqqVnnp1
	eD4eVG/AnXkabU37YZlX2Dt218q0I2aph932fU/EcR7jXTNGBt7zx5egdlCZ9jSDHCyOFdDEGUw
	+ijyzoN8/w5ycEM1R3b0Mndzq8SVG2NwfmO9C9LE1bejo1EeKe+pd9b/qMQnEwf7z8iXHXOQJ5W
	oi0fDzcaAi8g39VyRtVSouCA5i6Z1vv8zpyw11BLl/IeGWNhXGHBeMW3KqgrmeP5Mt0XzzwGUW0
	EIkvsWeu2U+78oU2vjvGqYnZQEmIci6fSL4vWZeFL/zQJ3MnjFQ==
X-Google-Smtp-Source: AGHT+IHaPUVFcc04OVpsf0ZuU3+RTTx10mue8NcUtiq8d0XqEJtDgxMexyu56RdMDeLF78O4BSmLNw==
X-Received: by 2002:a17:907:6d0b:b0:af9:6666:4acb with SMTP id a640c23a62f3a-afdf0284f7amr121034966b.10.1755699466673;
        Wed, 20 Aug 2025 07:17:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:17:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] dt-bindings: display: Few cleanups
Date: Wed, 20 Aug 2025 16:17:35 +0200
Message-Id: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/YpWgC/32NQQ6DIBREr2L+ujRAi9GuvEfjAv2APzFgwJAaw
 91LPUCXbybz5oRkIpkEr+aEaDIlCr6CvDUwL9o7wwgrg+RS8U5yhjubyCN5lxhS2lZ9sL5vtXg
 +5q7VCHW5RWPpc1nfY+WF0h7icZ1k8Uv/+7JgtVCTVEqhVcIOK3kdwz1EB2Mp5QummM8ktwAAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oB8dIVv772U3FjyT8hwtDeOa1n4Kz8C5WHwIQxNF56Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkFFX9cVJd6R5kRcdJyWNeW8phvfrUFyZvky
 c7O0B46Z76JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBQAKCRDBN2bmhouD
 14V/EACaWKZnwFKpJN9lLx5+T8AvWwAzgkOcpXvf56f5kFn2bPSGrQBlnke++fV4S4LaZeLKD+j
 RNS/SKkb1UrH8ApcexnLjnJ8wXNsFb2ezwUx4ZfPNNq9xTrexoH0ucdW7PxWO3+fEUi1VI+Merk
 V513f1Bq0galRpDcsLCVjiT4vxTjtQmBfUayw2FIijw11JgpNq8l75sepw9rO3UdUjR8uidIwxd
 90FazyGUdtQA7oSWKaH4p0OchouEApC24D8fHRo1SSR66d7aiKNfty5gFEqWc3seDnsG+CbdSv0
 OCRm8NY3QuvoYiGGQCLb944NQYv+A5Jf9mMUhz1yTRbIyzus7gaywh5xCEJbhu1N1Qv6LmsOESi
 pCoGYnFfrWEszEexkxl45XNeqd7gtkvVUQAfD+m/It/RfHE1GsQw4IT9mz9PSVOqtmGKpVMCkgE
 DAQ+mM3bahogaj2Zjcnj7RUOeOTc2BfLl9Dq4B161jRwKsSZEJcdIqM/U+Nsk7AFfIQ9+tXQbcv
 q6fmAeAu1Sq03EjLmTdsPokNT+wkTBob4sDeg08VO1xDDBWZ9iPDQbzp8EnlGkkdn1Trm1g5W4j
 nyvYDMDoiXYNg6W5c9auHrqzpiD/RLXXOE1SbDLRk2WSab6M+LNAVxCZDiR+/e8Oud6RLdMu24P
 Btij8qdVePtogvw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_071748_668569_A248E098 
X-CRM114-Status: UNSURE (   9.10  )
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

Changes in v2:
- See individual changelogs
- Link to v1: https://lore.kernel.org/r/20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org

Few minor issues fixed.
Rob, can you take them directly? Display bindings are pretty often not
picked up.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: display: ingenic,jz4780-hdmi: Add missing clock-names
      dt-bindings: display: ti,tdp158: Add missing reg constraint
      dt-bindings: display: rockchip,dw-mipi-dsi: Narrow clocks for rockchip,rk3288-mipi-dsi

 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml        | 1 +
 .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml     | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: d5b9a4f227e7d13a60f7704cc0d8e16be4bed157
change-id: 20250820-dt-bindings-display-996a143c86ad

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


