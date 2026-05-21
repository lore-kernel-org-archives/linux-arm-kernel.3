Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8126BCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsZ8aDIVQOhkLMcIt92qlAZ0ISFPwApT1fZqqK+Da84=; b=WhA0QKSJ4nem9xShgJSxPm1yn5
	bJ9iHwS9X6ZwTqXs7noZ142MpkcnWGoZp6NWDuVwsi0KF3qIVEZLw8TMudIvXRT+RGeeFbI0bz0L0
	thYvfO0lugWApfxm1geH1uR1kNR1luSnLpqIkDsYOOjFkJuriQrTOrB7mZSxM1/Zm6NYsWfqEF97T
	A5fNmqfL90vrfEjUcxWThfnqF+eyBCJHF9c6seZaxocAQ+6NQGpkgg7mi7gKjic9mb+I++ZU9Vz/p
	F5SZ1guFfGA10Jl56WLlmSBVNe7K+B5DiiQx6Iph5uAWiznb0iQb4gFJRq2NbGiR2He42NAJkFUA0
	Lx1+XgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tu-00000008DdZ-0gvV;
	Thu, 21 May 2026 15:01:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tc-00000008DPh-0omx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488d2079582so59853145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375670; x=1779980470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsZ8aDIVQOhkLMcIt92qlAZ0ISFPwApT1fZqqK+Da84=;
        b=NzMuM63Hi6K7w1QTn8qih3kesjK4Ao1aqSZerDJYy73kbErM6cJQjjVm3uA/+8EP5H
         LKxj/HTN7AioEyX3tbrXiL56VEBNDM5+37ue0C7epbTeuJlVJVIC//dk90RPurNw60TW
         mAr+midMVffBzqFZech10bFNVxXljDuQqrbul5M4j8pPg6Xa3vT4z5xTEM+zHKITDYcq
         fhVH7DmYGLj34JRf0E9b20zttupIGd3uX2YaqhZtziOQuAsUy9lG+6lvaM5NEgvgQ3PF
         r0wlTmFlSDLzB+JzSZR2Xhq/Fbvz3MH0HfcrPcQc/+o2E3VP/3m07gpS4/+q3aoPo8Sy
         in0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375670; x=1779980470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gsZ8aDIVQOhkLMcIt92qlAZ0ISFPwApT1fZqqK+Da84=;
        b=Zxj0nYu1V2ytlMlGtYOA/icrfDzrQyH/6E4eLtAwKkLFUcZzvA7vvvvhJB2o6hAwLk
         1EfZboiffBDaN6+g7YvXr76kNE4cnHspjzmMDtStWQ2WXN6RR985aWpE7s+bYuvSYafn
         1V6K4nJUSAJYdIW8xcqsOORZk2Yy8kVi/FXjGxRK+boHvQnJ/gpUBtspbLdNETyCqESY
         VdUknCrrl9vJbSxDC+GGHa87PsSppFkFbgR7kN1FP9wbKiQgY4zX91fLFYdwWchaWAxH
         ELLGLK9cZd3vd9LVc634x4/t4PsbQK5F433rZQG9U81p2wUtH7dLeMkFZMvJucM1CaWC
         cloA==
X-Forwarded-Encrypted: i=1; AFNElJ89932s9W6EXC3sQjPjXJZJ7gp4HEWWjqXUjHNeMiDXO0qx4Ig4kRp8KyW23hyciRgte2UWZe18GoSH144IyIQM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1GXAjJdV+Igyqrjbwt5D6PPovNtEgLlPbl3Cs4K7SPnfo8m1Z
	95nj+iRgf6JdStPSfrouw5+SAe1uymG43c5LQB3d4AJBdRGjx6w4MpgR
X-Gm-Gg: Acq92OEYlCGIIIWnJYsZk/0DP7I+h+xfVlz1qJnXiCA8GsCTtsA9W6Npp+q7g7kHHnP
	5dSoB7H3Lud4IUWk10Nn+J5VBlvbOqyHis194h0ViNNP9rJJvakzCEoLs5xQRem1sIZN/31dCI1
	c668dm9/w5jS83JjM9yWsbNfRbRPGVm5xT1FJdTMjyOTYLN1Db7E9XETFCDR94VPaTyQ2gKMCCe
	TSfLtxGn3unotjD0thYwAVRdrXZLMcayYF1539VPA3GkZDPsKiXs7FOXfHTln6P6pJCzKM4E6sW
	fMVDsR72hwne3CxcsdoHUEu7vdEJ7Y/hDcQt6SYvdErfhuz01mT2WqSslSHHUYNXgGvzvJ4aJBC
	NFVtI/N0QZ/fDN21mlY2eeB/l4fADO398Pe41ey5kdlUa/5QBkf2LmxQMxULaHkUB0Gv4yE3tTj
	u8WpTS0aI9yMQCSqF0Wx3aW16Nom4hWTYM9fcz+/qK/P7avEghU3Lg
X-Received: by 2002:a05:600c:8b34:b0:490:3d27:94f4 with SMTP id 5b1f17b1804b1-4903d2797c3mr26603645e9.7.1779375669985;
        Thu, 21 May 2026 08:01:09 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:09 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 05/15] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
Date: Thu, 21 May 2026 16:00:41 +0100
Message-ID: <20260521150038.103538-22-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080112_268130_84F95DF4 
X-CRM114-Status: GOOD (  10.01  )
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

From: Vitor Soares <vitor.soares@toradex.com>

The Riverdi RVT70HSLNWCA0 is a 7.0" WSVGA (1024x600) IPS TFT LCD LVDS
panel used in the Riverdi RVT70HSDNWCA0 display module.

The Riverdi RVT101HVLNWC00 is a 10.1" WXGA (1280x800) IPS TFT LCD LVDS
panel used in the Riverdi RVT101HVDNWC00 display module.

Link: https://download.riverdi.com/RVT70HSLNWCA0/DS_RVT70HSLNWCA0_Rev.1.4.pdf
Link: https://download.riverdi.com/RVT101HVLNWC00/DS_RVT101HVLNWC00_Rev.1.4.pdf
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 9db96dd724b2..7ed0c486870b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -60,6 +60,10 @@ properties:
           - jenson,bl-jt60050-01a
           # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
           - logictechno,lt170410-2whc
+          # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
+          - riverdi,rvt101hvlnwc00
+          # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - riverdi,rvt70hslnwca0
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
           # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
-- 
2.54.0


