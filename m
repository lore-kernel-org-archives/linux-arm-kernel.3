Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61E1CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XI2ZZStM3cXWCSi8KK5fyFVb5U1Xw6ZX1EuBWF2OM9M=; b=CC3PvAtahu21g24cLEvtC3MDmU
	9gT83ihF9fmvwuiWv1v34xeD8uK7VNkok9cBHIxCSNBoMakz46klbBsq1U7Y+XMvZRTTuI2xx4mv8
	9PNXjIZvBURqvR+3veJgp+A6LTLd+9LATi5Uaf4fRudsuiiOqyZELgPD3tbt4SlJesBZfZvXQ4ecs
	HLelho61kwEGLtqueO5HSMFUaxXHlP8xggq+zPNCIEXon+OlWhHZF2PWqGhAmYhf7a3C65xGfcxEs
	bS6gV54XwrichHDBrX6PTdUAyJt2rZ/H/ivC2Z8jSeK8EDU4BNvIdhD+l6rHlsZTr2xupbh8Nti4Q
	yVBzFNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1Zl-00000008fAN-3cdM;
	Tue, 09 Sep 2025 16:52:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKr-00000006HaH-32zQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XI2ZZStM3cXWCSi8KK5fyFVb5U1Xw6ZX1EuBWF2OM9M=; b=WXrmLKud215E0xCMCzYO9jy180
	sECeXrzBvnPhgMN4K5a4bdeMAVmi15AuQ7/wJUaJgWV+L0rR5BDdM19goEkkOQamU7YEwIoCTJnmt
	DdfzMTwHZw1wZhWGjLoH3OJqroZybC9UwJPS1Tz+PyYEuBYuQ6Q1WMNr6d/iUTaIZQlxCNt6+195g
	VLeKz5w9bRdVGqjN9H/OrXRBGYK75P247bYaTD/o/g19hhGW41oc//AnUIdNsycnMveeN73bUS8cD
	izP3jYr/ui5Oiweq29kad7ZEXrauhRbM7cXRhPL4r0R+T8JO0cbBZboxfiPa4QIyPioVirnLaYft1
	5c6A71Dw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKo-00000005HUQ-4BYn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45de1084868so12925975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412741; x=1758017541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XI2ZZStM3cXWCSi8KK5fyFVb5U1Xw6ZX1EuBWF2OM9M=;
        b=g6L2pG/dXxpPy5cgoaSxXSU8IZU0YgX1r9HP4fscyVCAOJHg4uGQkBD4D2JxosRCi7
         +OAykg5ipR3/wJAWiUkgNo1cvS0lfe1gTdN7AACH3ad0cW8MxumDpLSfqFOYxHn5NoYl
         ZEKwSuzWW7k0SdTzF6F+DL0xni8OjIqP2hp+ci4H5CaQASeMa6ZYDbRlKOohcEvtkkjh
         2AaWU3847PUOsRamv4y1pfd6kIzLw592a/hlUL0dBL84iU4MaB7gNsD3F2SwwF5yYxWb
         20FHhHYG60CQ52VIYGC7vNjvk91/HNI8A3BlhV8WCt5DV6U+zYLmL9jKazUPP6LC0noe
         Sy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412741; x=1758017541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XI2ZZStM3cXWCSi8KK5fyFVb5U1Xw6ZX1EuBWF2OM9M=;
        b=bm1YrC8zfLwnNfDd2+6u7cAocDO953HWfXqd3at7wykh5UjPjZAwlUbFFUkmHeDoD6
         drgrw701L8L1d/FZ+v+dACMSSJl9GvNDR11jrM7eV/WA4AqzaIbAKl2Y4VB6kmfCq5Pb
         exm+3VqGBrn6gc9Do57q0D5/tqG91OLPee/lnljU7K6i4Eaj7hYRcUfiR6lUPz7Lwnii
         NRHWWpyggP2+38GHOeP/qqaHZTmCHp8kcrw7Efi4LhCB01qAeu8xy05fPJXJay6xp0bO
         1m/opzOREca1veYU9ei89D0pkEhN4CJkRAKaF5HX/b1MK8WGf6phBIE9j/j5hiuLilGV
         Rg9g==
X-Forwarded-Encrypted: i=1; AJvYcCXhsUhmie+bfJnKh3P/trsH0J257rZjur8qXCLalM6j7J9kh/eis2Acd/tvs9zx8aDwEi8mN45O12QVg/ZoVkES@lists.infradead.org
X-Gm-Message-State: AOJu0YxhHDY2xJ4tzh/dKDckz841Z9+/sJZrRu+gHHmER4C7MYjouns8
	SPntk+BcCelU6ZnsI184K34l+h/Qr3Fh2p6JgH7eUn5S/GTnyG+PdUZ6
X-Gm-Gg: ASbGncurvsLwihcx+DSV+RYu25NIEBiDC5ckwV/n1eTlgnXc8pzbZI0CG85BOB0eRtm
	Pzhmd/hGwKanh0232wLU/dHf4BkiqVa1IxU21kwbE7pvq4JcwfvewS/cUpI55dcnCluLAW1QIuG
	UB6CrIp518qXmI6tV3pS4cMqKKH2U33WQAZ+aZJzpE1kqGU0PZJr1qNJic5YfyXyA2LXHMWxDhP
	2AqO2HReTEhJLhDWRF+/xMM5Nfjq6tJwosuE7iyQ0VkxPoic3hj5LID6S+7eXQJfNrIjj0DbtZp
	KwwmeTs1RQA/my6pJXuhksGd44ecLyDOHGxSmB07QscGaOVqn5eCsEU5IBb4BnC75KPvsh4EwcV
	CC8+D7uZUU6zKOY2NkTrC0JmWpEBNryfn2EQXNXKfd8p3EfawBibPdH+T7U3u4bv6gJoE/5VVoe
	idZuYKu/HlihhYUJ2fJVQkgpQafg==
X-Google-Smtp-Source: AGHT+IGMq3YRNccUPXUDuQKWqwTrrYGimoWd2y4QrCx0yTnHMLewx8Uj16eSzaAZy993XHeIO/nPgA==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45dddec78d3mr98422505e9.24.1757412741076;
        Tue, 09 Sep 2025 03:12:21 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45c6faad9cfsm304908725e9.0.2025.09.09.03.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:20 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:08 +0200
Subject: [PATCH v6 01/20] bus: firewall: move stm32_firewall header file in
 include folder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111223_167118_DFCB97C2 
X-CRM114-Status: GOOD (  14.29  )
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

Other driver than rifsc and etzpc can implement firewall ops, such as
rcc.
In order for them to have access to the ops and type of this framework,
we need to get the `stm32_firewall.h` file in the include/ folder.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 drivers/bus/stm32_etzpc.c                       | 3 +--
 drivers/bus/stm32_firewall.c                    | 3 +--
 drivers/bus/stm32_rifsc.c                       | 3 +--
 {drivers => include/linux}/bus/stm32_firewall.h | 0
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/stm32_etzpc.c b/drivers/bus/stm32_etzpc.c
index 7fc0f16960be..4918a14e507e 100644
--- a/drivers/bus/stm32_etzpc.c
+++ b/drivers/bus/stm32_etzpc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -16,8 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#include "stm32_firewall.h"
-
 /*
  * ETZPC registers
  */
diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..ef4988054b44 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -18,8 +19,6 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 
-#include "stm32_firewall.h"
-
 /* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
 #define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
 
diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index 4cf1b60014b7..643ddd0a5f54 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -16,8 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#include "stm32_firewall.h"
-
 /*
  * RIFSC offset register
  */
diff --git a/drivers/bus/stm32_firewall.h b/include/linux/bus/stm32_firewall.h
similarity index 100%
rename from drivers/bus/stm32_firewall.h
rename to include/linux/bus/stm32_firewall.h

-- 
2.43.0


