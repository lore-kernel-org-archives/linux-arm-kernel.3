Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA3AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=; b=ZX0u0Ho1Xs5j8CW5qGuYl7CQZj
	HY7UrWFVb6OarpssFlCsgxhq3zyZi6uMxpTvJCQGlz8nGKyn//fV4whvZc3fy2VXAlktBsOkQxrX5
	o8vvk7P5M9uE8JD231ifoLX0oLNVkwxLXoEZQCfZkTm4rqmqPgRbA497ob/bp0jONBZ5+VR+aBI6+
	E2ywF3fNjr87AKUARt2uvSX17+Fwy9iO4MXYhGXJApnbLAjq1IWaEEk5iaLp+eoQBElH7t1CwK9bR
	iKGJtBTRdld1IVvESke6vxQD9BIE4uB+DmlYRK8Vs0SO8QV6R/HVsUGYCv5G4REPnneLHUp3TLB/j
	aK/NmJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPf3-0000000CLUL-3tQ4;
	Sat, 27 Jun 2026 09:49:17 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPf1-0000000CLT0-2fCW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 09:49:16 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30c52f96f60so3729293eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 02:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553755; x=1783158555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=ArZjdB6rUWzzc4wU0KsLQ5EWWFuGBm78CQQK30eVZV3BhCketz48Ygt3n4qCIgj2YW
         6lIYuANHYpxPL9EhhbDEh89vmQuTWDPkleSiNRs50DvWZj4rM+9Y2kiZY2CpzIQQbctM
         dx7x1hHASCQxsfurdxGcMKZFYsE6I9Upjm6fcZy7PPNuk0yUyTL4ht4RX2yIhzZwnHRu
         y96my9C4lOCEJMShhZfDrqBJSxldaj6wyeuUWDEaS17B0fwf+DyDtphKFxvZvg0w3ooL
         9irCtG54ZQGI65fwf3GVsZyjlD7SEtQIT44C1+FTozDwL4Lq4OuLd4g7V/ma7ec0ksEV
         jmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553755; x=1783158555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=T0MDkBYDuffLP/aUUwrjHlzU6tSUeLA29wVbwniuMuBwgwrI8dXU0lqts+KdNdkM6Y
         QzvZTlbKXQQ7rpFrFs4GTcWn2vEGdMXIZsrqhK+0YaoZaha6tyOkAVfz3v9oblYITZoT
         2z3peBZiAHmpWpbPXfU2al3wRCQDtBdmoN5pIYKWbZUDMBrtm6k2XhmfQz2MBpTjW2FB
         P9NlvVOTqqEQZlU59FjCMdcsmmV9XQu35rMGljKFfNM0+/HHpsAn3szbx6hqyGZ2uElk
         vLYddijCYIinyHXUtrMwMa8w4hS02z4GbN1Qo1H8UftcitQJO9JuDLd/3/bQXYF9kyBu
         lC9g==
X-Forwarded-Encrypted: i=1; AHgh+RqjHsya41li8HM+Dd+Ro2hjCDPRMH5+UgxL6hgK1KHFPhf/+Hmx4rN/ZuY1Ik1Dbfw7KBQE7yqpUEwf821ZTTlG@lists.infradead.org
X-Gm-Message-State: AOJu0YzBfJC5nzSDRuqozTxzLD1lftFJQKb+1/IegIoMBBSvbWGVHBGO
	tgOXCSbg9uBHwORhSaBva2pxrsgyXBKBCOryBVAkFrfUMK4lJTqfwPjk
X-Gm-Gg: AfdE7cmhuJ0NxoBDQhdG/Zi337RbOwMz3WHkqXL1k0B1CxpDvo+5e77GRP8CVLwT94Y
	jMH3T5lDIlMLLOsxbZDPEizzVYZ0HemkfqKeOAvkZPrBA3qdxeiLjQtHDb5WSu+6AyiQ5Z652lM
	71XboOzCiI6vzUjhtrmogsEPbyfk4a65MeZdh0QwHdKcvosf3+L4OJOmUpYirswA8WcfRtkSWtu
	F9bAz25SsnWh38YP98dbjPu9w3ZoE/ie3JNaB68ngft2zHhAkZ8CU5lTIRU+CPvjXI1tSdUIVTr
	dXu5jyQfAxcIdWki0qmmmcXigGWqdzc4ryoAItBR1yPbKKjSAEWMvXfX4XEY4Yavgo0jYkKSaKL
	rvRaeo5BzBmexcLcVAGSD91m3MVuyp9IQ0UyWOyFZv1Xsx0nYsedsxk5q/YGMrBfjraaydm7Gw2
	IUQiiZHTchUkb/FWMW6Dg=
X-Received: by 2002:a05:7300:818a:b0:30c:7ccb:189e with SMTP id 5a478bee46e88-30caae2d7d4mr3651598eec.6.1782553754624;
        Sat, 27 Jun 2026 02:49:14 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca8b918sm28854789eec.28.2026.06.27.02.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:49:14 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Sat, 27 Jun 2026 15:18:53 +0530
Message-ID: <20260627094854.81564-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627094854.81564-1-hrushirajg23@gmail.com>
References: <20260627094854.81564-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_024915_670639_4332F3DD 
X-CRM114-Status: UNSURE (   9.59  )
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

Add device tree binding documentation for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index b023d4cc9842..b5a43fd5e546 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1311,6 +1311,11 @@ properties:
           - const: vicharak,axon
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman2
+        items:
+          - const: vicharak,vaaman2
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


