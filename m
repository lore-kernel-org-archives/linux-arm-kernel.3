Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF9BD730AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqnTFhR30A/TR4noz6Hyn5T24eQZrxW2/g5X6NMsOb0=; b=BI5WxQFpS1trKBTZKjr8EMulDT
	0Ap0KWXv3asAQDntwN8LLlJHc1Bru3CEs+5kbxVHLfwY6hVydDegHGdhbZVjWrafvwPPC8FOQc2ka
	FLuUv9caHYnnJcQm+uNZHDB8+3p/aP7H8IaKFnkbICpOUU1XLz1u+iIokMTjVveecQN+tJOwmLW6O
	26hDG6S/rtVlvGXJ59EUZEs+8NUa67aBX1mAT/Tuid84rnqDo7SYMJsEiVUjvXA+O4RHsw4XahlHZ
	djiGW9XNeVOQq46m8IlYauvuOY8YAs0P+DcmxTj015LBt8rwT8+5zpQvRCHegP/ua9IzKgDxje1ZP
	Kc8j8iUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YZL-00000001Rmz-2nG0;
	Fri, 03 Apr 2026 07:03:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YZI-00000001RlT-4842
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:03:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so14281925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199827; x=1775804627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqnTFhR30A/TR4noz6Hyn5T24eQZrxW2/g5X6NMsOb0=;
        b=XcgUI7faDAgJqJjHwZRUOAYgsHoXIfMeeNtNN+C0KSVm8iBdzqIRpNSdNOOrbjekv/
         l0TKCM++PjRqMYPIXDGtya1wxcXLpw/AYry9C9zNBkxcEZQAAMhmFRo9+ofD6hvNcbOq
         oyNN6BYuSH8B7WCzy7KDtGNFbQ/M/XVfBXQXU2fcOqr+SP/xGcer3W6OydzHPsh4MIF8
         dMJlTZPPwUNahOgGm9QTbxKxOxGjCfd+E3SY+zRJ5PXK6xbugpAdXsa88WSa79u9IRGj
         qlrgPOs17otEWb4ReKoyZx3uS+dDA/4hUu++KPOHAc/wcWu676xVcoT7qt9W3ayTht4d
         T2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199827; x=1775804627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqnTFhR30A/TR4noz6Hyn5T24eQZrxW2/g5X6NMsOb0=;
        b=VbhzCSv1qHsJgHPsodQgxEVnqKOziJsyn0t2YoNqr3gqHTGCFptyA65PMAM0YfxPhr
         kYOcUN9ttR7mDn3os+tCluSVKJhn/9o5HcVtd0JbKlnaTL9L7DbCnk+pRyo1mqGfG2nr
         bystKj0ztNBl00f6fEVeZ/te7efZuK12wH75+BFQhB6aHnGzfJKGULEFzizsPMbRSBDo
         jFfsQOCKph2VkB3itaJednTdWfjRL2Cijt/UUywX90m11p9QZqIn/UsoXqkAy6ECADIx
         yJE/8x5eSZL1N/BpdhnWZob6N9uFT0eJc2WoehFy9vwhjfqAQcrPQaUd7BjE3Lio7Fdh
         VAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV6CEnzfIfBHw9u4OvUFLu5Olj3wJVp9lJAET2mC6qEd5S0N8clJ5EG5RjKIzeFM+cjhAXcjouyRNN1jqcwiB3@lists.infradead.org
X-Gm-Message-State: AOJu0YxTDbDT60AKNvKykcqiTlIjzrQ4v+aZ7sMiZpL3m3DIRjjqrelM
	/OtNtqr9gRZsDCBKNHNdbqZrKP0EXH96jhPCwHXTcpq+CWteOAyqkWqAsvQqovD6QYyvU1WVfUp
	2LmOP
X-Gm-Gg: ATEYQzzKU+rb5G/MsqU9ytlAW/w03s9Hw+1yqOQEjbrfxPweGZnXnimdJo/IzNOBNV3
	bNKw5GEJXFUapDDtva7tCzZv6MVNRg1JQZOsUhHrMhQaoMpJrUIzHEY0izRQQm7McAZbOG9BJsO
	yUgxh/HhDRlgPohQIg9AiWoiGRPHRHBd8XQYIt01dAeKWu5EtuMCDZ8UL+HJqoG4/FrCvtEI84Y
	xmGqoZG8WudGbnloOk93VaHmrb8/8P7ObvvN8ZQVa2lY6BqtXa2EIFq9pZuGKGxWc1m/mNvrBSx
	Nx2//OnfzsGfwDgcXkGx2h+n/FedpSsTOCKSCMPoM2Z6zDuUq0mfSrzPcaD2KUEtYPiI7yHMx5n
	B4DIYe19PUSUlygQEwwW7V4FuLGqXA9LPowTLO4fBak0tdFZRcEmwwKCBvCGauqDOLbsDwAAEaI
	TQ1Ocjn6kX0IqPOOSkPFLIHzBCowx5bScJOQKaAV5FCzhadOxuF9Oz
X-Received: by 2002:a05:600c:3544:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48899735bb2mr25152895e9.13.1775199825786;
        Fri, 03 Apr 2026 00:03:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e967badsm323261125e9.14.2026.04.03.00.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:03:45 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v7.1
Date: Fri,  3 Apr 2026 10:03:44 +0300
Message-ID: <20260403070344.2553018-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000349_043201_A8A6502D 
X-CRM114-Status: UNSURE (   8.11  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-7.1

for you to fetch changes up to f3ae0049ff8a3d2cbd8c05857705744435629d0c:

  dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema (2026-03-07 16:41:03 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v7.1

This update includes:
- device tree bindings conversion to DT schema for CHIPID, RAM
  controller and PIT, PIT64b, ST timers

----------------------------------------------------------------
Akhila YS (5):
      dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
      dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
      dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema

 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 66 +++++++++++++++++++++
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 69 ++++++++++++++++++++++
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 +++++++++++++++++++++
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
 6 files changed, 293 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/atmel-sysregs.txt
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml

