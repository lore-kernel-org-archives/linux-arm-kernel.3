Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A65C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZrzveV3yJfkPYl/HtQGv60ZGdyQJcVgInP4M19o5eMg=; b=y4Pi8aLTEnLB+G8D/q4dBQzmSy
	IDUnK3wrTe7/aBWEq7YLC0tE4bIHo74f7UQ3RRNQpkAu+4s6KviEKurJ0xnZHar2jnBgzR0m1YMlZ
	PZXDs0qTSnLxfZ/SyUrRl0IU0f9maE1SpCf8UbjTYSFIb83lgxbs2Z/6YygqCmMNN2QZohoj/cGV4
	JmHNABtp3zxeHMlqsOpbDYrhtsnkV0ZhqhfPAqUrp594v07Ir7SMCy6SF+gbTWss+Ws3ug+cMelcL
	xIOPOQch6YCVo7F9EdH/fMAWJOUd7HG7uKh4MmCF/8Fe7haOBQKwBrz+iOsCPqMTPQERePdwMUoai
	w0f3QUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0G3-00000004SMm-2EmO;
	Mon, 17 Feb 2025 12:29:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzXF-00000004M2p-06ya
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:43:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4396a4d5e3bso27236715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1739792615; x=1740397415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrzveV3yJfkPYl/HtQGv60ZGdyQJcVgInP4M19o5eMg=;
        b=Ro3gOFqEIgnmubTrkSfjNQfEh9vNsTooA5q7YtfB7NljyHyKo+M3w6Zrg9pql3lv9X
         Lfp6hTXxE39aIJV5gwDmN8vGlCyq/kb5So8tRZsIUp99QqpMID8DWk2nHTzZw4swJ8b1
         GM4X35iLkl8g1Hzxx6lDZIrlwBdpFEUgBGaiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739792615; x=1740397415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrzveV3yJfkPYl/HtQGv60ZGdyQJcVgInP4M19o5eMg=;
        b=rMtBtljdXr88umQxTW32/Mn1GN6YFsKLnzBP1ZuT7FtTljY6n5cF687BJoEKWrey3V
         g7XRHgpu5V7D8hUmObTkrRQOaIB5cDfnqBNBUH1tzg4MJ4WlCn6LxxloTp/4/hzAc+7W
         BzanN1O2AVs1Jq74vpBVzj0ODDgLhknjXGJXy4ZuON7C4rDW5ttoo6V0AqQRjCf9Fk4C
         15GS/T8VBun+Bekpp5NiYadPLf7WCciMvyrLZQ54WCf7j2a3dgE/+ylO/8v5u4GibfrP
         +/Ee+tLsMqVJIHXq2E3AtXbUl+fVsWw2rNbDkBnJcoyLLtrB/+1fty2LJ2u/4h8tWE9C
         /WjA==
X-Forwarded-Encrypted: i=1; AJvYcCVeS5slxlvTfOgMbCECoIn4v072GoQM1Kxm//gYfKMyEVv1vERmfnjbXFut81NlTJTAJFt9jgyh48zuB+2vwt0+@lists.infradead.org
X-Gm-Message-State: AOJu0YzPkx14mOkjJGfA7AD406AlvAaznGLwbsqL9gclqjMoGH1wYLMc
	qtDYGU9EBM9hczRJDqbv26mJH2F/a9KV3VB5fK3q1sYAd+Bpyv7H6m7H2KpZ5Qk=
X-Gm-Gg: ASbGncvJLM5jlGmpkVJpU7Pgokpl1ugslRWSmoZ40wmf6k1iShxIxEbeLFLeeMLsvhn
	XKjVOsObFLMkdhtahnQ9dsSHzAstWaLwfstANkwPTPDHjkwlAIv3DZb2OgXJleNHziBqmy3PJwV
	/tLQRe5VYB601Esvurcq5C7BxObGmXa4fBC8/7fsMuowIfJNchmENP8JFAhVSCTSgtRPVEC+FKw
	MAjJYFEhOoNpKSjV+06guOFGHYMj35jkD0qGmkXPDvBq8Q+vlO2r3OSdkGH5a6O+pTkfpA/xQ2v
	dyRdpPo8NUX8oOjoyys2iAEVRk+F3Uiv85a/7mf7g0p+FckKWbE2YJxRZk9G7mdDzqgBN6lp6Cw
	qe/pb9UjoYxs=
X-Google-Smtp-Source: AGHT+IF609P3CALKCKzz+rtZjz9vss0xU2nv7oly2Unvy2CCr8jtqlkrTWn26An774F51BMNCDUg9g==
X-Received: by 2002:a05:600d:1b:b0:439:7c0b:13f6 with SMTP id 5b1f17b1804b1-4397c0b19fbmr45089825e9.31.1739792615169;
        Mon, 17 Feb 2025 03:43:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43987088ecbsm18918465e9.31.2025.02.17.03.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:43:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] ARM: dts: stm32: add led to stm32f746 Discovery board
Date: Mon, 17 Feb 2025 12:43:22 +0100
Message-ID: <20250217114332.1098482-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_034337_077774_E4352FFA 
X-CRM114-Status: GOOD (  10.35  )
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

Add node for the user led.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746-disco.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 087de6f09629..8bdd10644bf1 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -78,6 +78,14 @@ aliases {
 		serial0 = &usart1;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		led-usr {
+			gpios = <&gpioi 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
-- 
2.43.0


