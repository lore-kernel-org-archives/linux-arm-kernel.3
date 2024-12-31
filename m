Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB53E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TfpchHbExO0XW754q8DbjVQ1byQNlSKH4QhxgnPxvYU=; b=3tLqcP4P9EI+k1kyRfSWJIvyND
	v4gZ1CUb4EL2SsOtpOyxQjVok3Hq0rxE5dPs7r06a0vldlFjk4JEZY3ed5KQvLLwVYnhE8WoLDEb8
	nu8Bwp1RTwGJnQkqHy9OvAZS/NJp5g6W+VVKGmxVJnTWcGIzvL2b1hTedu0pAowt9NQpdeY3KDlbk
	WosZ/0iZ8Bt9irSsFOl0If/AWwAhEDXHx3INwQrpJEHNH81DiHDBBC2uULQDJ9av4pAiR3s7AQyAY
	C65kxWernSc/8OtW//T8zoGADHpkenoNX7PNO279aiFNbI6j4/LvTix88MfV7wql/CnnboNG1IilQ
	k6Tc41IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdlz-00000007LqX-2Qs1;
	Tue, 31 Dec 2024 15:03:07 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdkk-00000007Lgd-1hNF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 15:01:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaee0b309adso1020904866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735657308; x=1736262108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfpchHbExO0XW754q8DbjVQ1byQNlSKH4QhxgnPxvYU=;
        b=VioJJXDVslutu9s42yklTZ4ty7xxOPr7Cqn13F1hbhpxX8IwFydsQol080YmC2XhpS
         Qd2mauNn569/oNTZHyBJYPMBbsWsfJNGmanhsXKYzodEOijs2CAdkUdkcF/hdd6yLDfq
         OptczpKH94B94JI7cGtKVnBK4m0IAYGhvjg1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657308; x=1736262108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfpchHbExO0XW754q8DbjVQ1byQNlSKH4QhxgnPxvYU=;
        b=rg20g4knyxCr9TXySVAcGadiLB2MmfIheUbUkobu64sT3XWZhRhmzPt2aP4ti09XwJ
         PN0sugQT5tV6hW8l6OczZVQPxO9lqOi4j6fYKgH52bi2rhi1Pjt3+27aRb7VbgcNjH1v
         dIc+mizyMVVSh5EIhcVww/IGVN6pqdSQFjzf5UjKoxDLa5uoKQOSh/8sNxKE49snY9Ev
         B4G8B/O3JUrVzwZDL2+5QLvBRTXad/zOFvTleRryvdkCBDEVwwk8o2lkolN7PBmsvXHC
         dDbs4nzBYWfSrp5a3lzxl4jjo3r+HujlA/3Zo5o3GPSkT2kLbjm8q6aMQF2Eol0y+TSw
         Vvkw==
X-Forwarded-Encrypted: i=1; AJvYcCVh8nk9OE1avaOd3CcIQBzKkQ4B7yGjvYEBynrDHMbIa11NGrwmW4OiNSS6JsZCvwlIggssgur8CXbBBwZETQnU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+HpYVQxYd2jcZe4LMZ5AmZ2cdWvFd3VDehlxW+RMNBn//1nx/
	NWJo5SU2jL/nyOpX1L6lGt84LObshA5Vgd/xyulsAmVCNU4fIOVnHlykZQeRnCI=
X-Gm-Gg: ASbGncuH1LyHoxAr0Vv6rUnL//Wb1E9ZTY1fynzLXFqNeQbFE6mdjVzf0nyXYfjBuUE
	ZDNxpYRa3izRlZT9Mrfg7v6S7KCKlZPoUG2QkKC7mmvKbqOtMkloXbcwGNVTp1vqnFBSGx7MBiu
	SYNrKfxFxBm0fD1pc1T2QmGYCL3WgW8mZjTOWXpfRVgmydkHmJN1HErz9Ni2daOIu7V7Aegetx6
	F5gQt6s8PKPyRZst6hPwAepNW+PZYwqCy/bA+b9Il2MkqM8H8Y+sHUnEVC9LhX+VVBVtMQQd7Dk
	/152PhkiwxPm83CxyURLAg==
X-Google-Smtp-Source: AGHT+IFTYNVf4PANRTY/pECtc8/bJhsdH1GsC3hZP7+Sn/hJKwsBL1qJz0Y+j7y+5zffKEeOjC6D9w==
X-Received: by 2002:a17:907:2cc5:b0:aa6:8676:3b33 with SMTP id a640c23a62f3a-aac3464f929mr3338245566b.47.1735657307900;
        Tue, 31 Dec 2024 07:01:47 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89598csm1575905766b.56.2024.12.31.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:01:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] dt-bindings: clock: st,stm32mp1-rcc: fix reference paths
Date: Tue, 31 Dec 2024 16:01:40 +0100
Message-ID: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_070150_493444_79B8CBE9 
X-CRM114-Status: GOOD (  11.86  )
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

The path of the two files was wrong even at the time they were added.
Let's fix them so they can be correctly referenced.

Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC")
Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to json-schema")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 9b3aaae546cb..ca75b1972470 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -40,8 +40,8 @@ description: |
           = 0x180 / 4 * 32 + 0 = 3072
 
   The list of valid indices for STM32MP1 is available in:
-  include/dt-bindings/reset-controller/stm32mp1-resets.h
-  include/dt-bindings/reset-controller/stm32mp13-resets.h
+  include/dt-bindings/reset/stm32mp1-resets.h
+  include/dt-bindings/reset/stm32mp13-resets.h
 
   This file implements defines like:
   #define LTDC_R	3072
-- 
2.43.0


