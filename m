Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B412C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=; b=j0j0tyZ+Nz15yDMdexgztrRKMi
	RhiQYWrwmTNRQzQ3bx5JkRoX1aMi3FP0grylTHdf09MMt/9LxjsVWF7W7Y1LIX/5oZRY57z7quSW/
	HtKkhSO0u1IK3PeUuQUs0isnikBLSKMc1IU2+wx7MDO+kcX1hXH9IL/9fQQ+gMU7oF58oDh/mZW1J
	i5MMP5cLKEhKCgOOyOToeDg41PL6xyaz0+T08+6nsmeFAIja3fbNuJCccVutJYJP3AkSbHhx1C6Bi
	1NzN4ggIZj1XvxtcxPP9X6sSGcQkXtuLu4zuUPc33TpkA7I8cg3+86lWcu0w97CBNkViiv0AxtDP0
	UWtb9vtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wpu-0000000381t-2jdp;
	Sun, 27 Apr 2025 07:54:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgR-000000037E7-2drn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso36044005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739854; x=1746344654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
        b=BkHBaYw4XosuiVCy9wH+xnZ6HESrkLZGP4Dtgw8ZF3p+etGadwzKjRgLwEOhZ55OHG
         x9y0vHHuBLu2Bar3bl4ivPKrSJRCz06OvS+2yNRPPgp+LKGk8VPbjEQhLXf0Q0LqeU6M
         4yhCYevY9T/YNF6wrrxJBn2q/kp9W/9Id6/qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739854; x=1746344654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
        b=thPerYeVifZi6wc2EZh4wbCe7Tq9tWSq8h7PFbuqEVc2GX2N53RIGbaiDXKTlSon0O
         sTGYTak4D+RuYiW4FmZwfQl0usfGYR817FujZbsYhb2W7+0ronw6OaYp+vfPg0eAZbqf
         iZlgBzwocqZYflNJTjarCNr5v1GnImLI4iLP/xqmAk3FAMg8us0iIkFg9jQR1UuYp33m
         PgNt+cU4CI7Mc8M6LQWwdppCtTo8UyeTjjPYtwBb/4RM+ghg6c0B/8ig72S1KVtGLWXI
         MvO85cOZRiue2MxCNIJ538cDx66Sr5Re+ouuffXB6VRdGnBwjVQ2iRBX8LYGfe4p3M/M
         RmOw==
X-Forwarded-Encrypted: i=1; AJvYcCVjELixHpTXpdp91bF3BOcfS+qPrTdEsiipW7tPzvrVWyfCMTHFHjW+lMMpJePwEnIIH3BcVyUg66veBVEtzNBQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzKSIsV7MhRRlA//lm1jqc/cLtCiJFjZX4HeTBt8qLIpTezzs6e
	Vu1a1nEmOZfSDi4ekBY6GaFJgBo0tp7iWEP5yGvwiURijQCbaAZfA+VUm/RbPd80rORY/ThRkWC
	M
X-Gm-Gg: ASbGncs7XIXsdDde/ivQuPZB6xf75RSQwvd+C9F3CjoGjcWmFuUr+DBj/abHINKpYxw
	8GCW0owpuRmCk3t93EwjBCqAdyqaCT7SFKN6rqYsE4qraERLD6CXnvUGoMHG4HEPzNrAXItJEPZ
	6UY4Yr98VCxigtLVC6KxViAf0ohWKrLV3DVvZQs+d1hqOU1o7oFyw4WtqKZEa9YWhSxoNx7Zq/v
	C7BA1y8K5uyssqWI1ibgqvyBJml0AMK6lLP4Z7HySrgSlKqF5/m7ODRhH8XQfp8PqjhjN3UXGLT
	4evj/0Xz1QwryLA1ZDGtPn9nGYkvu4t5+VZe4eMQG+aIr/mOQuE6f7FH+a8MI7/n5fQ/uqFglG3
	2cdbsDg==
X-Google-Smtp-Source: AGHT+IFmKdlug3XBTeQtHBTWufSsMQj6wGtrXk30tYDh/x80OEhGe1hDn/XAFAGgsIRKs0/u6QDg0Q==
X-Received: by 2002:a05:600c:a02:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-440ab76b5e2mr33817675e9.1.1745739853968;
        Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/8] clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
Date: Sun, 27 Apr 2025 09:43:23 +0200
Message-ID: <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004415_667900_5A2C20CC 
X-CRM114-Status: GOOD (  11.81  )
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

As stated in the reference manual RM0433, the STM32H743 MCU has
USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
macros for the serial ports consistent with the documentation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/clock/stm32h7-clks.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/stm32h7-clks.h b/include/dt-bindings/clock/stm32h7-clks.h
index 6637272b3242..330b39c2c303 100644
--- a/include/dt-bindings/clock/stm32h7-clks.h
+++ b/include/dt-bindings/clock/stm32h7-clks.h
@@ -126,8 +126,8 @@
 #define ADC3_CK 128
 #define DSI_CK 129
 #define LTDC_CK 130
-#define USART8_CK 131
-#define USART7_CK 132
+#define UART8_CK 131
+#define UART7_CK 132
 #define HDMICEC_CK 133
 #define I2C3_CK 134
 #define I2C2_CK 135
-- 
2.43.0


