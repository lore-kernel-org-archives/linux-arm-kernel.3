Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E31DE7C719
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oxX/gLAM7vPDixCI0FGPNHMkP2SivAHPQt+ss8O1P6A=; b=cNcOaOjcf/5esI
	boB4h8N/aHvzxX/cx2b95X4IMjeJF64VrqVqqGrMLJknCh/DZHW8bTqMZW6kUb057EFyoT8uirEs3
	n8g2FIH5QO/H9vzfrHYhiT/vJRZrEAuljAvNQuRHTeK3+NBOTxi+BOa8XZYq5S4Pa+BBi9r0N5puP
	Z6al29f2hNroTS32Q6Nt5yqJlQPBjgdU+JUHkInWz0mGWca2K7w8XjqJbidXgDUApb4oKqUmo8OTi
	S4eAMc/dx5CDc6/mC6u7PcteinvJNsvTgaEODImLH2wr4aef0dbGt0IPZgRkkVXJc6eJ2s3BjYsza
	8ULe19AKG9h46rRqDmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjG-00000003T8e-2EJD;
	Sun, 01 Feb 2026 11:34:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjE-00000003T8G-2jG0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 11:34:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35338b3dd31so1634707a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 03:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945695; x=1770550495; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxX/gLAM7vPDixCI0FGPNHMkP2SivAHPQt+ss8O1P6A=;
        b=Mc66JG9FF+DC77/QH+TxSR04dGjzDDantm3AiabnOAwtxvD44oaOyplTAFXJaDyYQI
         zAZM0FwYS8LXb9/h4/TPS3OzL7HzxTvm5Sxitjs1gLE39uOnO1GZGhpxRRCnfXEvXHQp
         JGwmMJWA8QEqaJE7AdA/i5iVrRr7SykdvHnHny5HwcaIMJDnY/74jMaVoU4wJ3jBZIwh
         wN+FVF32djlhIFQnEZ5rSAfPpC2n/3pJHLXZII4jJHmf8DxW3owN10g3tegITcAdyEz1
         KyigRtzxKPe/b+3WSZRrV+lCpKr4qB9rMbl1hQwlA7t/jl7W1UXZtX329e5Ey/XQw8qk
         nceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945695; x=1770550495;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxX/gLAM7vPDixCI0FGPNHMkP2SivAHPQt+ss8O1P6A=;
        b=eEyRB6jpRY0A6SQX1Bx8klrMur3awyJ4KyRnGS8Z6c6g5yjiSU3HgJkEh2NXUq5ERP
         9lfAc1njStfy1kq/30+hVjy04TMHE+zY/Qp9GyIg09y9acV6eAwF+r0r+RW6F1WoGxaU
         et9XdKQPkKT+GmsohlIkqCrdkk2wyB5tElFHFPnUO1EfYqH8lxhHl4OpM8u0iDpimaSs
         VjDiY7sO0RHI4fwmAIn5IKHNmrlPcDdRbSg6yJPDs59m2A3myOISODgVXxczFBvCtXpY
         OCgnra2tz/nTvWNaHIdUBxTkmreFIfoERLD/OmNOcxkfDQbKpsWaiMGATs4zFIdzJ9mO
         yMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcpWp3J/DE/epPsWi6qhl+SOcnnXZUXona4xHUWKZybcyuMxLgFjy/se147msKRwS/fA6yWDZo75KEtOOX/DDO@lists.infradead.org
X-Gm-Message-State: AOJu0Yygr7Lb5ZzA33QmiNVU67m/f2U2I/teudy2nmdyzTA/qCwT6Q1P
	T5VxAiQNG7gLFJMVvXPy4MPE5E4ZQvqQRYHZ1ULAnMhXY2w8qO69E0KE
X-Gm-Gg: AZuq6aIlrVyjccR7YUbRDBE5O783jEbWI042FA1ksaBeZ6J2iX/gLcXMtkhAmFzIjjD
	DCH0ohpifjHL3Gy5z9APaWstG5KfK3/e13T1bV9hlEqi8WqKph7virYfTvT05ryXQC7kvtQgNo7
	tCbBtF4hXYU0yNGIvBFdYjsgjBo34wM6UTcIhkGM6SVkS/N95MOFH2b0rKI9W+XxV6190QxwAEx
	Z7VSA3/Wl68bE3VnuOC0kSgPGYb5UReFN5royrkZVmue1r6Xz4iejJC5hs4GAxk1uSkJXcDZjZh
	P3OA/9GcuEsSMe6REivN0ig8jSRe6wgxWMasfhvr74zsIbwhselirZJo2I+RyVDs06aYssNiCMy
	5wM3UjeJKv3h1OeIYkjR3oeN/RDSpbBfFtoT+MQ4r6oJ3iFXM2gs1UhL87MvgZGZ4n/Le+ssYhe
	JBZzLjFPo20amFcP8fK0Qm/gSyy6M9MAXc6AXTosV+8ky3
X-Received: by 2002:a17:90b:3dcb:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3543b3ad361mr7794468a91.31.1769945694901;
        Sun, 01 Feb 2026 03:34:54 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.252.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm12994728b3a.55.2026.02.01.03.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:34:54 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH 0/4] dt-bindings: usb: atmel: Convert Atmel USB controller
 bindings to YAML
Date: Sun, 01 Feb 2026 11:34:19 +0000
Message-Id: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADs6f2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNL3cSS3NQc3dLiJF1j8zQLy0RDE8NUEwsloPqCotS0zAqwWdGxtbU
 ACmhXsVsAAAA=
X-Change-ID: 20260129-atmel-usb-37f89a141e48
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_033456_795453_B58DCF35 
X-CRM114-Status: UNSURE (   9.43  )
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

This patch series converts the legacy text-based Device Tree bindings for
Atmel/Microchip USB controllers to DT schema (YAML) format.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Charan Pedumuru (4):
      dt-bindings: usb: atmel,at91rm9200-ohci: convert to DT schema
      dt-bindings: usb: atmel,at91sam9g45-ehci: convert to DT schema
      dt-bindings: usb: atmel,at91rm9200-udc: convert to DT schema
      dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema

 .../bindings/usb/atmel,at91rm9200-ohci.yaml        |  85 ++++++++++++++
 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  77 +++++++++++++
 .../bindings/usb/atmel,at91sam9g45-ehci.yaml       |  71 ++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  81 +++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 5 files changed, 314 insertions(+), 125 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


