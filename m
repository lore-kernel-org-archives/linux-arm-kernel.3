Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008CCC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i/zN+BCB9PDyNDE9R4NEw3s0veUZFcpZLCmrjf9UE/w=; b=XTQDNMfUWkPP3RSUiTMCKxvUdv
	wbjo2gLFgdMzP+2EvxXfjLZDmkZbU4p82hvUojHc1sUbmcucJedWWgyG4FgIr/+LvpG69VChO44k2
	F9tGKGYBz+d582JneQ2DK6JLh10eKY+OGOYn8tGxT1k0HZ5F3AxstZpKilo2dW36JN8thRuq5bpTv
	Z2WnGMVwXwym5gBrYtketJWfbvhdPBQ279aPV+bC2Np5PNaEfYv1aIYNFatcWKW0EJpGOUk5R60CQ
	ZAvIECZm5ND20uY+N1SDo6DaoWoB2Lq98bN5kmi2jgF9lrDIkdNMmUGynB+nUYZBkCqqivBCPdpeA
	7SC8BK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBrH-00000002OIW-2t1E;
	Tue, 22 Jul 2025 12:12:35 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBnt-00000002NhS-0vU6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:09:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ae360b6249fso840403966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186143; x=1753790943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/zN+BCB9PDyNDE9R4NEw3s0veUZFcpZLCmrjf9UE/w=;
        b=I84lvE0an1k9nS7fjm+86oVEyTRS7OMsHxtoGfCcGIvgD5XfGmv5NPdb6Jbp4gDqv0
         vujXzgfKg1YU+les2Yv6H9DD9cS2Btkp3YJFNUOST9KbetwH4Yghoz87bCO0rmuvbx4I
         UW3duCMUOCFVoI4fuSJkXQB/KLWkIEtwM1sIz5lMfxDqI5lISDrq36VjMMxZmKcCKGwg
         xswiadFsoyQ7cE1rwAySZhJ3e7tX732vJY9hyCkJpgLl0MSDwp9FIdZCAlsjl/twmRq0
         yl520iZfYZQgoYNHmXZxHxhUUOi2c7zup+RQ7teW14Zub5v6K+iiyEdE2GwGrVvYFHKG
         kD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186143; x=1753790943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/zN+BCB9PDyNDE9R4NEw3s0veUZFcpZLCmrjf9UE/w=;
        b=MnizUh/Lxk1cCsI4g6zpxVaUUBnJNUeOdUj3p3QZAwHgbRwlWcnZL7RQK+RNhPRrip
         9bFSyxQOUKrsVEC29kCOWm5LjyKj0Xg5Q79iwqx9xLod7vtL1fVvZ9BqzZHmuODXZ7gu
         xXTNBAS25Y4L/0ZmSJ78owWYVLfmI2dg6X+qhoShfv26xu325mU/QQ6jMwjJ2CkD+BzC
         42VJd77GHRMMdv3CloK4tU+xYfVcdiF/JKYy2BUsCAh2g8WHofHPb+QANAy3eHnvJ7yr
         YeBH+KaZ0TkdMbVc79SG+AgrdDB1IujzZEkMX5gaTwJbi+OvTXd/HfMLi0u4cCxYW/x0
         SHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDnHpfLxRwhaGHIoSk4A8AJzg+ED1kb6kP4A8xhXRF9K9Kv/XXsb8wUfapNxcnRBuaTWFmcY7ftxmWPeLirAyz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqd1pxeT3rqdOdkHC3sGfHhguYnvqgqJx9wk64JeV/JEGBUvQi
	YzyymgfAEWD8vcCgE79Bl8jWPsDyoVSGmmuwrnd+Hi0MYVTSO75M69OB
X-Gm-Gg: ASbGncueP+SzJ4C7JJ+Wk4XZoUgq1TnHhAkfR9c0tZLkoXthHC7c1xBV+9Z9gZKo7ql
	z0pERk0n4vg3q6oOEXFuvBuFXzDVOJIh9E9NJClgCAi8Y6ag9MaWzE2F1qS8hY8pPJZAHMLvIPI
	4kCzS11oQVt4hsvABwJJwgv/ZFTxTuhWN1K3nf3qSoSyAQLCUz3T6Uof7nvy1qYRTVZ1/6Ig6fc
	uv81oGfa6hWZem0tygtEuDGQDtO61tBuxr8q+t01sMTaxP/rmBWuiEOsfMuh/J+oxLX4l0Qi0+u
	kYAYXHXBSdyULuUKQTzOCYfWANaDrVMy3G9alXBeEzBFwpv5Q0ImMObuRrWtteWO3a/KnCvn980
	gqimETzXmq9sMxYguD0x34qisjwVRtp/vYNfDyDPyBt7GSpsth6M/BUV/OmRdHte39Oo8BdJ90w
	==
X-Google-Smtp-Source: AGHT+IELdo3U27oOgtv6Kv6ED6xgavO/dGRHioarTGley0NsAKeI8rQbhsUM6DVDUWHgEzZ0n6rdvw==
X-Received: by 2002:a17:907:3e9f:b0:ae3:a812:a780 with SMTP id a640c23a62f3a-ae9c9ba7b98mr2301348066b.61.1753186142732;
        Tue, 22 Jul 2025 05:09:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79551esm850878566b.4.2025.07.22.05.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:09:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: serial: samsung: add samsung,exynos2200-uart compatible
Date: Tue, 22 Jul 2025 15:08:59 +0300
Message-ID: <20250722120859.443283-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_050905_258175_F7109B88 
X-CRM114-Status: GOOD (  10.15  )
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

Add dedicated samsung,exynos2200-uart compatible to the dt-schema for
representing uart of the exynos2200.

Like GS101, it has a required DT property samsung,uart-fifosize and
exhibits the 32 bit register access limit, so reuse support for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 83d9986d8..1a1f991d5 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -28,6 +28,10 @@ properties:
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
           - samsung,exynos8895-uart
+      - items:
+          - enum:
+              - samsung,exynos2200-uart
+          - const: google,gs101-uart
       - items:
           - enum:
               - samsung,exynos7-uart
-- 
2.43.0


