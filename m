Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0666EC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wabejZpAhNXZ4/gZ6Mz5z7QPUdV1DRKOqhima9IvQnA=; b=AmLnOLgRg4pGzYELrL3K5VwrT8
	fTgnt+4cOFBSUGkPoggI+IyO41K01kZa3K0jHmeDuZ3pVdrJ8y+u4gmM39HxS/s7j/5CmcoOfhfFo
	xsdAsbYgANyBYqTNblArSW/7bezTAIRICMvgUOwkxPsiPXR0fEgFI9qokLkO8CSTx8/NbTPk6g/6x
	SScTH4Ca0URw50FEVkTXEMJ/VzZffdBS2/1m129awTaQT3+FOzVe79QgFbkp0CLpgWXJAohzpjsDM
	LPisUgksqTG1IrUv3CbqxR9IsWQv+mNFRlFqpB1hDWYdv3IVefNUlPgyzwWQochiotALnUuvtqKVr
	/UVBza+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaQF-0000000EeF2-1ZQy;
	Fri, 21 Mar 2025 11:20:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaOY-0000000Ee01-0TTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:18:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so304382566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 04:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742555912; x=1743160712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wabejZpAhNXZ4/gZ6Mz5z7QPUdV1DRKOqhima9IvQnA=;
        b=nMEou+dj89d8jh5nqklQFz+VfVT9pTuX/gCZZ1eSFO5wr7+nJi3b6DBdaYFf8Y8hqn
         c3dRTz4BKFBxW0o4UptltWTQ55OKHmHJbKixG0Us1xuJSpPYeVKyDdbbKhQFtIvEyddm
         4xy0lTaP4Er5tM0ohRO/IR5QGeL7cOUypM7B3EWGwTvXcu9jOi+6xqctIhyS38MNVoCW
         2MApnTsaBE8I6ilNVdxZfb8mcZmB55c9PV8GzRtRL96DjiFW16SH9d4NWGVlJP+Rhuha
         0RiMceusb3BZGve3RmI81Wx29uU/XCJrVfqGc7iYs4Efl30BEPTPQe2iHCwP8KQvmkAp
         K76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555912; x=1743160712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wabejZpAhNXZ4/gZ6Mz5z7QPUdV1DRKOqhima9IvQnA=;
        b=Od+6lxyZCLu+70B/lJ5OzpDmcnOGoxE1MVPue9vrwmR9OMohT6rnnZk9jVyXa1iSME
         /nhhELBub1bx/+aTbJ/+yvONdfwbC1yLOaOJh/514BXFg7SLswSDYBf1SHLYsMr0CCFK
         bVlksA4fGVbwOUw/EhVklrSRht4l3t+Dn4RjX7pVFYRyuorPAMMvToqrsF4IXwHdo2JK
         dkPDDBHX1o73IlRHLBTZTZ0QxOS+xQh5O7mwhRrup2bYctAKaFqiCBw8HFJcDT2eb7NB
         zW/Va9RUQym0Onwn/iqLRIvvvYpnKPqohc0RJZ5gb/AFgGlO+SHOfdqLDjKmQJAqhTyk
         QCEg==
X-Forwarded-Encrypted: i=1; AJvYcCV+u0TZCeeBx57o/nEvaKgoUO+oUkzqckmF5wMo9hE8IjUoEATGq6KYKTNCK8EFpnvGOOF/TBtTw58MeuNZEEno@lists.infradead.org
X-Gm-Message-State: AOJu0YwPE/8oJlzA2Ho25v9MXJ15xmlN/ngorx+2QjYpOWkbr+cdxHMj
	ZTjhRnPWOfc7gx/UDlci2pGlgePaUOF9LiiAUoiiSQWA8o21X7ev
X-Gm-Gg: ASbGncs+gdvUvvqL6GGXsodME28iebE9BjzmAdvqc06bfuVvnxcl4QUtwSgljcZQOCE
	ViXq10lUxKBqNPoyrrIcUOn5Wu6MjZMXVWEZZEPuk43EICVitvF/ZAQbDC4VKHs9u4HEzyVkTsy
	SyoG4ADjWOeqperAzkN95KLZNSeS235cWyOpN7mUMI8PhNywiTNxsL4HHsOSqLQnVqItARoMdbJ
	QbLkq2cBfxC4F8E3O3WGMkz8dODZWtu8qkAG9KSLNUpNDnl8VQi+lsKUhRSyte5TGsVadoqe82/
	6Gf+aoxaSwv5xuQPxK14lgdVOmEqRhxDn+IUVFj1L0BPqBuJ
X-Google-Smtp-Source: AGHT+IHMumxU+/ISFAj+iAHmIZdUWCL4jaCPHJzJ+2s0QvWW8i+j2WLpKz/19GnwzdojwRlGDakcKQ==
X-Received: by 2002:a17:907:da0c:b0:ac3:ed4c:6a17 with SMTP id a640c23a62f3a-ac3f224dab8mr322426666b.24.1742555911781;
        Fri, 21 Mar 2025 04:18:31 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd569f3sm134228866b.171.2025.03.21.04.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:18:31 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <gradenovic@ultratronik.de>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Fri, 21 Mar 2025 12:18:18 +0100
Message-ID: <20250321111821.361419-4-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321111821.361419-1-goran.radni@gmail.com>
References: <20250321111821.361419-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_041834_148881_3CC3C8D4 
X-CRM114-Status: UNSURE (   9.29  )
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

From: Goran Rađenović <gradenovic@ultratronik.de>

This commit documents ultra-fly-sbc devicetree binding based on
STM32MP157 SoC.

Signed-off-by: Goran Rađenović <gradenovic@ultratronik.de>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index b6c56d4ce6b9..c1cb54ffb210 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -175,6 +175,11 @@ properties:
           - const: phytec,phycore-stm32mp157c-som
           - const: st,stm32mp157
 
+      - description: Ultratronik STM32MP1 SBC based Boards
+        items:
+          - const: ultratronik,stm32mp157c-ultra-fly-sbc
+          - const: st,stm32mp157
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
-- 
2.43.0


