Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118E7D277CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 01:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+ExvoWXyfk7B3PZ+QbuMC84j6wcYdimjvcwYA1OVjA=; b=F1GLGoLUtKR/EalWRUs8ywzIYC
	kWqvIYGoO+lg8eEcrdP2vCuYkQ1y8nW9lcBavAODu9oc/OeBlE28hu/knlYk9rebdyRQPbm2LwFHU
	Wwx2vWaDwxiTlyaDkorOehRF5W5oPrv1selQ/L7ZQdnVl6ASHxr2GBRBQxWgMdBz7imJtKIuBzTtK
	AIPA6jB2rWDQqVKhh80Kpy4f/uW7NLe+4Y7lvGgJKgH8x6eaPecm2zyNl/u6guCbXRdQaXyUn89A4
	d5VgjfFGZI3OJhWOAJePyLqcR7dcRgLBfU7WP1HClyah3dFVC7WbNECUA8zCilk7JexZRJUA8E8Og
	ZxOE6ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNS3-0000000392R-31SE;
	Sat, 10 Jan 2026 01:07:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNRz-000000038zH-2IcL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 01:07:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so33542295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 17:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768007250; x=1768612050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+ExvoWXyfk7B3PZ+QbuMC84j6wcYdimjvcwYA1OVjA=;
        b=drt2nKfm58EUhExOSbZv7JiO3aSG/2stwbaZ/nBG+mgEnp/RuWgETfq2KsNWCVswK5
         htNE43pq5IH9Z8Dh9MFoUiwtWupJC42U/TuUuNke3MRyoOCI4a3i1Tzy1if5LVTc3eTs
         EnBSPP7KNr4nnmyViBMUP9i/xsk2GFvgGAKgqOPuB4ZDsAxOX0B302FaaFbfaHFRmEZD
         PuRykSxpwFOKtZemOiKdaSQuOsm3P0pUvjbVEvUjF2jV9VKPQi5yY76Ekn0PvtuW7z4u
         xe3/4pC4JxJLR9F6xQsjvUCUsZe+L3QeEwXnYup6OE9HAwSnXwy3TdAEYLzTycUoP3FG
         yNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768007250; x=1768612050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4+ExvoWXyfk7B3PZ+QbuMC84j6wcYdimjvcwYA1OVjA=;
        b=nRQ90U9MfMGcnze5XRAEc829sNYTR7SnELTlxhuyc6NB7QhnvUBklubBKYzYfTKeTy
         11upJBXGfCXosSNnwLUiZ+dGWm3FpXsjjCrEXsXY1rh9aOiVhDE5C6GfTwkCH1h/bAVS
         nZ/iXN2ygD4+UhQHTgHojIZ2HBFFSOJwiYM0GZqc4Lg56jG9P6Fg6h8fnJ9QSG/SCGAv
         COKxRi4SIArEoB31WhDPP3v9o7eF7vPd9inYw85o7G4Pfd8oAOJ7TEY6a4LJrc/IsaRD
         QzyCZERzxBjctrG/F5zMEWeRzg2MmbVhGYz3gTDnb7gT2l4F9FInb6hKe8cFeVu6ptnX
         x6eg==
X-Forwarded-Encrypted: i=1; AJvYcCXwG/e7plKlC0MRI18ISDeAqHOxCzQ8XK7TmOK8AaA3pn7HpjX9jiUj4CHvTbmZ4IAMZAU9bX1gYRGxUf2JD224@lists.infradead.org
X-Gm-Message-State: AOJu0YxpxjTUQ+sKcxHxqMKLwV7Sxvr5fY7xFiAXFhRng0eN9RHupGR1
	gIteR0SV7vTPPWlGN7uFw24zZrZ/ilJPDrNqgzW9jfexJZt91UQbVIe3AIxrHbJI
X-Gm-Gg: AY/fxX6pmwULT8PEWoYcqtnzBNvcslOfSvKG8PlRAh8kHY/YcsRxmEXRYZk1BldOtm7
	WRTvLQ/cc7bcHgAQP6GvXkKVo8rDwfS98+qOPncdKNnx4LAbbuaLU+PF+g2FVyG3IjZGlJNSy81
	IRZPfLpNC7pGVW+xuuDNEo0ORQPmmehIcZHHIc/rTleksL/KOBINLAZ/3Vn6eqOIJAQ1guGH9DR
	Geds9qTYHq4VS6ToNujRfuL346H9CK5gHX2sunJWOKOEgBrYdwcqEzvtJnJF63zRa3YJ9By/T0T
	W2QpWeAuFqiDrWXWGmnDUaXz0KZ3hhgnU3VelOw3n785Wp7pC/UeX5+oze7EMBqGkA/JLQ3LigU
	bOoZF5RBQtzeCvoXnprSuAwfp6yt/L1eqDHP3vGIBXWQhI8HaAdBMQo9R8fdFEUonBa6JtTCXtZ
	XAqIYHfxoGDtW8Kz/Yy0okP3bCN2mraMu8H84gJvH6PECTpL5PwRzA69LyUCCujAO1abjFtLgrk
	C9vNmImN7PD7KzOQg==
X-Google-Smtp-Source: AGHT+IEelYoC/RfOsLxl9axtfdOf6Cg+r/5BA+2WK9IrH0gt6a4Cep6y3e1I+Dzf8IC+Aozsyrqvjg==
X-Received: by 2002:a05:600c:8b2c:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-47d84b186b4mr120986455e9.7.1768007249488;
        Fri, 09 Jan 2026 17:07:29 -0800 (PST)
Received: from stor1.home.marco.cx (ip-178-202-227-016.um47.pools.vodafone-ip.de. [178.202.227.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8717d9e7sm71779475e9.8.2026.01.09.17.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 17:07:28 -0800 (PST)
From: Marco Schirrmeister <mschirrmeister@gmail.com>
To: heiko@sntech.de,
	ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marco Schirrmeister <mschirrmeister@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: mmc: rockchip-dw-mshc: add rockchip,disable-runtime-pm
Date: Sat, 10 Jan 2026 02:07:13 +0100
Message-ID: <20260110010715.1610159-2-mschirrmeister@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110010715.1610159-1-mschirrmeister@gmail.com>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_170731_596863_3DA2265C 
X-CRM114-Status: GOOD (  10.79  )
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

Add a new 'rockchip,disable-runtime-pm' property to allow boards to
inhibit runtime power management. This is required for boards like the
NanoPi R76S where the bus timing becomes unstable if the controller
is runtime-suspended during idle periods.

Signed-off-by: Marco Schirrmeister <mschirrmeister@gmail.com>
---
 .../devicetree/bindings/mmc/rockchip-dw-mshc.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index acb9fb9a92cd..41f2644ca2ef 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -100,6 +100,14 @@ properties:
       If not specified, the host will do tuning for 360 times,
       namely tuning for each degree.
 
+  rockchip,disable-runtime-pm:
+    type: boolean
+    description:
+      Inhibit runtime power management. This is required for boards
+      where the bus timing becomes unstable if the controller is
+      runtime-suspended.
+
+
 required:
   - compatible
   - reg
-- 
2.52.0


