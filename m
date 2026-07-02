Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1B0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYGMlfq+GfXXzZc3hVZ9rsCaJpaLl9f+A3Em9EwRMIA=; b=QBBdDGdplbSEN0jhW6zLSTU5zJ
	4+5GpjV0amO3N+af09e3kHe1OYomC9MjFhyPNFCkCC6aFq3hOrwj8lN/FzCO5B9V3Ya4vwR+29Ony
	EZTwuJclLuVzvWNxszMbeeme2BcWCGFNtWQc2yGONSM1mVIZVBfliVDYFzlTFgMAq2+Hi6x0qNFQH
	NuEB3hzmOp3Zkf6tPVqoKzxT+t1vSQGPXavwt3dWLHqXEvYcecLVNDjR+HD4wR9RgTCUpDs8i3Tvm
	jxsie/r0o7HNJh0JqKDya+dbAuA9DucyXv8ffb3UmX1tBrDm3W3RkUQvmu7PU17+TWXzRrSUnStm4
	cgeSGN2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVW-00000003oB5-287M;
	Thu, 02 Jul 2026 08:10:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVT-00000003oA7-3Me0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:10:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-46ed4f66256so1283309f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979846; x=1783584646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYGMlfq+GfXXzZc3hVZ9rsCaJpaLl9f+A3Em9EwRMIA=;
        b=WVtahDJcsv5melqhIp4dHhwkO7IzJqTmZvNh5ochASkpI9K6rGm7ZG8rigIZ86KUZN
         MLc2b896S2Axqt1Evb0Tm9DA1WSzOlMeDKLaaCFstoxMQHtjKaTL7mNgjVxT9zpOsQMr
         lCjkQKhEzvpwT+JOpS8QK7FpbE7UkWLFPTcVDDTGlR5arnFCUE6xvKwhstfrlFuHi9fq
         DN49s5kv7T6kLD1o7UHjjMcLEcFJeWC+X26t83KPDFrdS2ww8AXwurjyvliAjb7I7/Lq
         dxQg7N8y8a63j16bPlh6yj0DBQXUd7zi/EqffzaxBy/F/2W0bopEFaJcRhb2JfUDDb5L
         C+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979846; x=1783584646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TYGMlfq+GfXXzZc3hVZ9rsCaJpaLl9f+A3Em9EwRMIA=;
        b=jlqoIttysxS+KOrE5WVW6K5FBdu8vkdHoTGRtS2an5K0yPdngSqxZW23bozicHoZfr
         X1ALjTLdwZI9oI8dND1g/UTAKUdz+KFc0UGYbkkl3qbXC6IV7XOPN4PuhlDFWM3RXx3r
         eOoYi/HIRlEoAg7vspizXD3Fs5eq5vcV68iGzJwpOBAAsjHVaTahzRSTdAlfes1ht+3R
         QV51Ryp8ZZiIYo/EMaux/rDEsKCAiyD4vzKJjUUMiRcGSjP2qb2rul5NMvqOMDZAnID1
         p8gODCy2Gdo6CoK6tZHJRmqRcNNlxo2Lkw/f5bvR1tTGBUyptJXX7ys0OtEisZOgStOe
         tRyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Rguux2lLTXcNw6lQBC5unZjCZTX1mQE9rg51yP1ntTqStwAAxDVRQ1oG0gmEoAZ18EhDykRBzEMeyD3BBHhi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr1PqXifUJzp1Ok5vM0tHudZ4y806SP+0yHv+OfqtpmhIdPDX5
	jHQ2XsFPRGEDFm57sMkfpe7uycufrdVDTQx0wGo4XuH/VlShyjt3rZCpELZ3qKDnI18=
X-Gm-Gg: AfdE7cmorlZHywWiKOaZr2UMeQvk6FnniCFZQwrV+9ZnJyWwfBIGlvLm9tKOqFxHUBH
	z+5AXhALHeYtDEec44GUhzGLAlca8Ukc+thDO7EcRUfPIc75aGq2zZNWnWrRZXn/+LiWLnx2mRj
	kZ1DfRKHfa2QqjxgrwcDR+lqLqh79ZUCDm+/k0Mxk4oEkrE0PPJlracL1/BghykbRjoYzhYBRfQ
	dUY2BhSgzdwBK7x+bgWurf+MpWNTjVnc8raQNkOFEE9FXhsc0Id1ePRPknVYP4WUYeLB7H0gltf
	sDOd3X6XHfLUYbI/Is/0jQDVavrGbAk33E1VwCT7S9MthfjmvRLU3Y17w3WRIGxPYrhTpFESkBd
	blPsn/FWLg3WWEJFANUqOfHI0X1jrUDU29VvfbD5xh6A2zmzMz82nxI9vTlPGNxKbYXsont+rNx
	s0drYFBOFqoweTXv493r2Pzw==
X-Received: by 2002:a05:6000:601:b0:475:c578:b619 with SMTP id ffacd0b85a97d-4775bd0ecf9mr6698699f8f.30.1782979845774;
        Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477de3dd46asm6536252f8f.36.2026.07.02.01.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:00 +0200
Subject: [PATCH v3 1/8] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0RrokHtYa2cUv4xV/HjfdQdge3X2ED1AmM/T8cwvnI4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz2fMF2sbd/orrOrcVKsxCiTA6ndgnw6zaG9
 gF/0t0uH8eJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc9gAKCRDm/A8cN/La
 hZHKD/9Ta2ZnK32lHMVoKaep+EmFCig9bncFhk9h9fFDao10aAE8gADLH1+PGGugqeUWMjQqMEm
 AC+KCbuiAbunDWvJy7SFsEIg24VljmT1jCYsb1Pb2zIcNCvmIevcWSEG1mHYPZFLVvtNC0FGaE4
 U8dfpLU8EVw4V9CYpYOHJL5h+m7OQuj3XmhOCrt9m9h5AQ3bJ0CjHhZ9G7vnXcmI075jZl9PctP
 nhj1RCC+Fn9VPOEGBdBuM/ck8l6KKzu64UCJ67YTWch2/STBZMvdhjhLpr7JQgOih9K7ZQbX3QC
 b0Re9Wxuy6HqmKb+cCBASAuFEnOUEXW8ErKD9/GDdH7KIKcZy8PNlgrtcbicP31Rx8EDCme0ndR
 TzuPFzT6iuVJ4+WyIJHLwypT4Q/VKl/3iOrB6EJ07PC81E4GSHAvUQ1xhAYs7HuTUMjviDnu4lG
 iHRlgi9rKfnXjQRwH4ZMI7cd4oF4w24b0bZW4gdb023lqmtml5TVHGw51QgShFWaNYsIaNV33Rf
 b4h7ldNt1wZrf2lynVLBMs4iVD+Z8k8902KQ5sNQpgwpxFxWqmBYsHjN71NSY4OCh9gTk/GKT2+
 WFefYnLwMEdOO6L4A3LXeoY/1UCryjYoOPm7YzQz/2FB9t+z8CHv015xBiQZkqVtedcPcujP+a2
 xRBrmiLz4T9INZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011047_860664_1A96E05B 
X-CRM114-Status: GOOD (  10.06  )
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

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..959a012c626f 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -175,6 +175,18 @@ allOf:
         interrupts:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
+
+    then:
+      properties:
+        clock-output-names: false
+
 required:
   - "#clock-cells"
   - compatible

-- 
2.47.3


