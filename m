Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50859CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=; b=CTrpePPZl3lf5fTr5vONgD8A6T
	QlcT51OwsF2g8eoJhhR/yJDKCleIdUWgNnIgFo9nUEuLc7BXAe4XWD5QmcfHfcWVivXPfKgr1xr1T
	ct8ePvhIA/KxiXOoCZCgmsys0tO9Q05Hkscy2pD12v+kHU/NQJ0Gde1bfy6B48/Ewj0zxC6h3Klxs
	7hDM2AOqxStm6qxh5T9RwTVPoWPW0jbK4dSUwlfetS2edW3QQKOMiUhgEga8xLdkSwMX/Rv/465im
	HTr63iDnplCC2lA8ZnUanfwyWJ47xW+IofVToyfd2canYqSwjvfFWuf4KYMJzGUEHwgKcGtYa36W6
	jr5lCXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bf6-00000009dSH-0eho;
	Mon, 22 Sep 2025 08:12:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bez-00000009dO0-0C8R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:12:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso25530435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528751; x=1759133551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=cuGvfe6R7lNvSiR7JPctFa0aK2tEspTJLv21p9kLlzGIMXQ9nHqIfMg9ZZsb+wcX8C
         UuFfzIF8w6pU8fTKy3rj+2/xXRP2jVl5CcUiksOM3rJm5NAmtkxyptmP8c6jwsZ38w4v
         oPIoIiPI922lbssLrzIDasZSb/O5QA+zzmaMQKjLuYwZ11T2wXnIF0XNA0rnypnjdl7/
         ujavHLKuAsYneXyFzqJtHhOayUePRaKHuAD56pNx1kew9n/JeDZmq6w0nuhuL1AM2Tbh
         M1pqGfL9DfTtWyr1Xmv8oA5T+a0rD36QwMCleBu6HS611Gbv6B5fq+5928m+B8pVyAVe
         nWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528751; x=1759133551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=KNtR/2j1oF6xDI5WwSkrJEQZgVCalwOe6k6pIbswnjN2owxKKM7TFW7Fe+lJiGVX1j
         oNkzZdTwEdWWm4j1RWWeyYVKOMp5rUpZI8Whfajij+F+xeK/quW82BTlDTspl6Pxk3eE
         sVhQor/EkAcxflszQaUYp6wbldlisFF913exPcswFYYjTTs49L8td4zkeCiCU5N1Y7yO
         6PFND5iH3c7RGOGpQfPkeiLXNnSR4tvabLlTYA2RQismhjy1bZ6OdhCk63VUkj9Le6tb
         KkLJBC+TF3+J85rXIKsyBMl4m2UsZ9t9CEg4wLOaKe6OzDSXbT0gUlY1od2dGZONnwGM
         YrYw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ONL8gIByDDZtipx+RtfXkpsBBG3Zsx8JFPoQrVz9Wj6LsGHLmBb7oqjsrS9lHyQHuA6ifhOX36kZUXIbRYfk@lists.infradead.org
X-Gm-Message-State: AOJu0YzjmzxnpTlMgIJBsXaHj2qvvmXHS65uMGQVMnul7XkWGyPv41Mq
	qtN8IDEx4rNbCAG6dFJslVaEYM5hg1hi6LUYUxlIGOiDonh1gHkkYUyG
X-Gm-Gg: ASbGncvnMAq1yv5gR3Hd4dM7kWz8s9LKGM0f6f7MDmEIytTvAPh5jlCgX6tbefw2CN8
	mIRtFLZAxk3VO3I6ieYcSGN56AiAoTEHz8rqa9A2SNlXlI5xs7jgpqlg+GchSDk6KB99oZSC6ho
	BynsqNhfJNj4MPM7U8Dk4EU1Dvg9SuDqQBLH7XVz5OmC9A+p6mmAsXVggDTP9BQM41vx/K0F6y4
	tavrbEEH+dDyuqkSWIVdZJWgwxRDNJYDPJGMtK7dhZGoBI19+N5a3VFcLIF5liIzGtI1m2bhsCw
	f5M3F4MsAd8QP+GO1MbM7G3GlmMkh3IsS2p0NXb66jiDviwZKARk5WURg3cqXuahYWRc8RQO/Y8
	Xdru8LNH/9H7hgRT06FObFqlPhx5/ZDRKWWMihjTGKatpHz39px1S/soHGFgQ0rJ+ktoFJdsrdF
	jB9dPZcD+oUyAIodmA
X-Google-Smtp-Source: AGHT+IHIVtfPSrHin4y9JkfBQxIDF6jMfONQa4rDA8eGnaJ0DC6uDJwECPyzN7tfzI8/ktqkL/ZedA==
X-Received: by 2002:a05:6000:40cc:b0:3ec:d78d:8fde with SMTP id ffacd0b85a97d-3ee8585e38dmr9724920f8f.44.1758528751149;
        Mon, 22 Sep 2025 01:12:31 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3f00cc58b91sm12911883f8f.1.2025.09.22.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:30 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:18 +0200
Subject: [PATCH v7 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-rcc-upstream-v7-1-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_011233_100191_8463AE03 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC is able to check the availability of a clock.
Allow to query the RCC with a firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 88e52f10d1ec..4d471e3d89bc 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -31,6 +31,11 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#access-controller-cells':
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
   clocks:
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
@@ -123,6 +128,7 @@ required:
   - reg
   - '#clock-cells'
   - '#reset-cells'
+  - '#access-controller-cells'
   - clocks
 
 additionalProperties: false
@@ -136,6 +142,7 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+        #access-controller-cells = <1>;
         clocks =  <&scmi_clk CK_SCMI_HSE>,
                   <&scmi_clk CK_SCMI_HSI>,
                   <&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0


