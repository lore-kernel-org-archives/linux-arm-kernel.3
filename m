Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEC8CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=; b=TQx/9e66W/TjYTp/pxfzMQPDhd
	C96BBqjQ1+AxwM0zwPMr74UAvLGQwLjSpodHkb+3CbjSBy3ktfzih3Z5mqRjG+BzHwnsUBPBjWhK9
	huG02S7IkQMAbtU6GwaP4GTzhoYvC0wYfz+2UWzZhAQjRy9ntezpmLDeb83Ww+y7jON5MdA8GfpeM
	1Wm+2mXUmZMQX0DCU2tmB+obNw0J78MIw1Tt+ZjgF1qyic1AE0IrEw9QVE4wdgIQBSm64SS7cEb91
	FVucBZ03mIiKWtjSJMsYnyyT6LVLvQh0snqyQjHgT2h3zQSv/PIp6vVds6MNPsY76ttob6DKyX3fA
	LNzjqroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3U-0000000GABH-1AZZ;
	Wed, 24 Sep 2025 09:44:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3O-0000000GA4D-3FrR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:44:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso7376626f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707089; x=1759311889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=j0GaORW6P4WHmh7RDgbqQb9LM+29GVqndcCRzEQcx8+6KCvehtqPdup2m+HEzayxyy
         aMnVEM0rYOJBi+SdWsmSpyWVtOkVlgHJ2woYPSdzOvIcpLmxx5LYSvlvhBX4hGPnEDAM
         SVNktRXGOKRDj7nTK97tgpF3fdGGKZX6GhgwHZMqGzC6VuxruBqw3Kq8mk4/fg5zFJvC
         gZs0vcpUfmL6YQdecUYxtCnMLxkUamxX1nK+lCmWLMT5N4RWfUS30+u3q1iQoCt32TaH
         mY8j9UNicyEGNzLhBDy2EiD6PvFB2WVDVNhe+V5CWwKOfMKv3ya5axiqW9OLIFcQi0mH
         zAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707089; x=1759311889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=EczY3/SsXftAXMK1uDvviUEP401zaqGjzbhAmQ9QrrUuPdic3s8T6a8+D5RPaH7PLa
         VuRftX+LGjtzUXeBiCNz5vJ9bvHEWP2fpsmcU7svLGGH42af6ikEz1c1aRf88pG6l0yV
         m7RIjxBa53XL/Ucg5NiWAKI9Eelz1tokk9PDNZz3MmlceFJe9VTpRurm7faAN41tSZo9
         LSdl82+ElyaddS1xR9n1zcNem88gldKixDLEPkWGjUznfb4u4MxDNSPcwGHSsAiZFQ1f
         RdLU7k2AUvnvnPvl+0apB/lMmcmvunGxXGbSJ7vGvq67LRL/xmj+XBwIbP+h7CuGlG/b
         vwCw==
X-Forwarded-Encrypted: i=1; AJvYcCWre24N8xUfiALIV+FyyvaZf1D/tHpQehyueDFbJEV4s6NHhsHCmd9BCgfFqiownFHMqFv/2WhL09G2QYYKuUSD@lists.infradead.org
X-Gm-Message-State: AOJu0YyZp4V/nXprEgMSqXvEB20zM6lmKaMNgRAgNvUh44yfp1rLwpIF
	8rTq/vAd/DcASx2rmzKb2sah7MR5rSqXreCHYE/z/8Ng7NRTRtlqDGYx
X-Gm-Gg: ASbGncs0HXJO5XbUBQDj67jUS0a0hJ3++JAPFhTg/EtXWyX+PZBflg1L0xB6q+41agS
	4d4tAYjBVgT+LLxLE4XnZahkN0uvxOK/AqgYlFmpaM9Fw4aYBEN3LPSKAxWjEl6DfK1I3XoTXCp
	49di1GLqym9y9cn2LSiTVK9zrrDdMHlZIELYppM2F4TfNOdzpntI1s418FZVqrYbLtXz63kZ2Ce
	UVtzdOM9KHEvXaN+IL7r2vhJnRFFCFm8dWb9zCD04eCqOLn1J5v2hN4ITxbbp9Lcg4s9C75zV3I
	4h1GJ+BbgQX4bb3gVx4vcqGKdFbNe1XlgOO5dEWbyay48j7HagLRMAsbLWjyk5UWbb/lnPUp1Mv
	SQcQ/yxeOKGHqghHush3ebxstPSYTzDJgBmxaLApxsSSx9x0sjl+tu6jCyMGSkLSzq+YscjgfRf
	GnfvyVziSVMevlxw==
X-Google-Smtp-Source: AGHT+IFDGC5gILr6xmz9HYWmbPGf7fv1JpRWluY5ULikXOKvBqLdmUKtTk3mYXekw57q/HwxxJNkVQ==
X-Received: by 2002:a05:6000:186c:b0:3f0:9bf0:a369 with SMTP id ffacd0b85a97d-405c6d1024dmr5131775f8f.14.1758707088783;
        Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm27213765f8f.12.2025.09.24.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:42 +0200
Subject: [PATCH v8 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-b4-rcc-upstream-v8-1-b32d46f71a38@gmail.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
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
X-CRM114-CacheID: sfid-20250924_024450_835255_E4B5161A 
X-CRM114-Status: GOOD (  10.22  )
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


