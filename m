Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9950ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fGb/DBgzMdYPrR58mCFwPhHuJtGwABvWLMjhmJdkkaY=; b=iHpSmc6bfCAGzob3m6Te2qlkuv
	/SipWrJj/yWGtRILJNJj2sAVXsa25dhKQq3AK7Gi34YpnRr8Je0anJmRVetKOTXSxlSr0Dktrciuo
	QjXLrep/8rEzKIbSnLU1h395hah6NktplKUEjHNsgXXuMz6pRer4scG6aXdl7PiLskkvYcz1komRl
	8/iZSyHiPgQubuO7YGgMIe9bOscsk8wWFqG3xAf8+mDGaKfAvRkoG0sNRn3DI19e5A0aLyGVWmEk2
	l4g8+1QfXKlYo+d6/WwD7v67/Fm7uXfRzreSdrI4FFCiIw87ghlSJr/VrOb+gRCas6MD8RZZSh7ux
	VvHeVWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cfo-00000009rN7-17ur;
	Mon, 22 Sep 2025 09:17:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cfm-00000009rMR-0Ih8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:17:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2445824dc27so44028215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758532645; x=1759137445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fGb/DBgzMdYPrR58mCFwPhHuJtGwABvWLMjhmJdkkaY=;
        b=S13NmXYHEaKzp4sUxmxo5u9eaLdT5VQBZNoKoTYnNqTJc8Axc4QzAJRHk8LAlo0eS5
         IRFlBR/aQQKoJIbKLVjbpK3bi39+sLASjsbKgXQQlciKi6vlK38wY7sGxDA+T/Irj8lH
         xNhKmnujWZG1+uOl705uinzMF7ijqrYqor0H5nwNaonzA05fyUs03PT/OwxIRmierNR/
         acKJb0vpzgYE4jpWY10NQOJOpR9Q8spMbzmUxEwefz8cypUPw6izYmdcNW45EY36JRu3
         qzZYgEfclJEqWE9L3huoc+PUeCsGnYSTyAvfjXHCgcHnCqPSUcXT5zoLDe2i5KDxV/D4
         6rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758532645; x=1759137445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGb/DBgzMdYPrR58mCFwPhHuJtGwABvWLMjhmJdkkaY=;
        b=q2Zwwiio5syBbgt2+vr+ykwZnXKdQx/S2JV27FWScwl8p2BPjL1aO5seMTmBAaENYG
         Y8E5C4EG5h8ejdJMOWYVgGa3SJAc5LGU5QSMRLrCmzNPDpjjyEn6Pjl6vcq0qwEVIs8n
         l8Wu6fDoKnxhdPIMG4uql+FsOFQYkOJwTF527KQxhBbEHehPYcxtna68Vhx+aMWcnBcf
         Ep+GBA+X5qPzEl0AunkdI1LcJJf4VxQpEiDZ8jIl1X05HVtvww018HXAQKZ/j96o54sp
         d6Ictg8UB1Bto6y4fB1JiRv8WWRKqVEyatJ1K8yHyxyR95THUsIvXUxYQ1tXtbFmMbff
         nj/g==
X-Forwarded-Encrypted: i=1; AJvYcCX4RRBQJaPJnouWxmOXtRdbV0oemY5sLUWLvAzV3k+saBGfCLh+lBSveYL97AaOA7gcswmo0Rzs9NEeArZNoLnP@lists.infradead.org
X-Gm-Message-State: AOJu0YwssDHUlzkRsPZcO8XUwmTRicG6cQCJKHvfksYfa18JdXtrsWyv
	vYbi6OsKyIunbgVM4jJaNalAQILjrK/bbJexTp4Fl2tA6Pze/S3W9e2s
X-Gm-Gg: ASbGncuODTkawjfn89bAF5ARr8ccReg6MZYDNIrYe8maW5oUDQuFnn2QZrRNEos0/Tb
	NPg9tgNl6ZXtrfOuQR+NEO1vCj6tW0mx4AW2xz6W/IijPrfAB/AU4C45cLl9MhNb2dyNbiMNTPC
	eJdz8Pig1W/wnEVWMtUpilVwQbADzA0zmyWBUAQYD3FSYc5j+U0uM/GLoIoy+OfMDGBJLSGazNb
	As9laR+RtTbh5CRVDwspGkAjq0W4uLW9P1upD9MEvsCwQgELr/p+rsJFDpUn7s6lHJbZPQf0FV6
	ET3UqjwmiCfyOiiaB6RKHKxP4cld9REPOBZiFCGH6RMNA6sBwYDKDLwUVvYOfu0T1dTc867XVBt
	9IDdsDZRqTMpFvXMqB9lcuEf7xXYkA+/B
X-Google-Smtp-Source: AGHT+IHpQUnDxqtshyNYZwoifi0+JfQ4lWp5zNwj1YOtKACLv1wuYj4WHK6vgRUMTUwuv7Y9Eq6txA==
X-Received: by 2002:a17:903:1aee:b0:269:96db:958 with SMTP id d9443c01a7336-269ba52872bmr156749785ad.43.1758532644418;
        Mon, 22 Sep 2025 02:17:24 -0700 (PDT)
Received: from CNSZTL-DEB.lan ([211.158.26.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802deb48sm124126865ad.70.2025.09.22.02.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:17:24 -0700 (PDT)
From: Tianling Shen <cnsztl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Tianling Shen <cnsztl@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R76S
Date: Mon, 22 Sep 2025 17:15:08 +0800
Message-ID: <20250922091509.2695565-1-cnsztl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_021726_104544_1BEFC36A 
X-CRM114-Status: GOOD (  10.32  )
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

The NanoPi R76S (as "R76S") is an open-sourced mini IoT gateway
device with two 2.5G, designed and developed by FriendlyElec.

Add devicetree binding documentation for the FriendlyElec NanoPi R76S
board.

Signed-off-by: Tianling Shen <cnsztl@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..e8185344c6f0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -330,6 +330,11 @@ properties:
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s
 
+      - description: FriendlyElec NanoPi R76S
+        items:
+          - const: friendlyarm,nanopi-r76s
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi Zero2
         items:
           - const: friendlyarm,nanopi-zero2
-- 
2.51.0


