Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9703C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=; b=thJ7vreKiHisPaxtvAHB+nVgUs
	2RzJqQwIeLeHIsj+rA+Td/kFD1psOJe9DPMa74OS+ii8Ohlb/Rq0tKRi43bK8WKMW/aK0EizmjE9J
	WzDVTfAPAantdlgLN3VpXEMDPQLWilSFyZSv2MXgMkQvQ40Z7eya8U56AL4zmf1EHhvmD9NDQlvda
	jcvfO7IrT9+zfrUToeWKdECq+Bpu84HJ8E/3/yxRsYR/OGw5e4BLM9+yLrcKlYoffxHKq4/mlqych
	Fm80OCQDGYMAgUK7MB/bp7J4obAEAuwz5Dt+MDvBUKEcB0tdIbvuo5jKPFN4w08NaNnlIPnl/vkcZ
	MqeC02TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0CE-0000000BQNU-3Q6U;
	Wed, 18 Jun 2025 21:19:50 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS01r-0000000BP6g-2vif
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:09:09 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748475d2a79so48453b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280946; x=1750885746; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=QbHs7hoTr1MtyRVfUzF+c38+qt9iNXUpfexlwBQLSecDUz6jRRaxTTVbrjV2hnAPxZ
         KwqESBg5g2fHyezoUC90MMlYD0J5R8Iiiw3T2j1mXmPKds4oFvLA2BYSTbTGdIJA3nN4
         pTVEB+/1TFh+no0czgVaWwY6u/DUrTx9dc/WCWIQoyPRdImbLE1L9TkL2MTjlyDT792L
         y9d0pFbcpXoKeDB9hNiYzcAM9qbVHSiGmoshYhGYRH2JyJ32y+Ocz1R8zaaB5mGl2gu+
         3OOtHvyOHruu+1zK8xVsE+2/tsQUbZj0s7HKMGGb8MgtRCcbWOtTSI50azN7TWfNfZOR
         SxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280946; x=1750885746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=tGAAskatMddIyrm52NAtRUg40/xrh092KxLtN3eMVQKsd3wsMLQdyVTjB3M8un3z8c
         7Pwbhg1a26An4S+CIbFlisv6hGeExl07TuJOhsOM13asFUtIAfxO+WgN1zY9kfFTHl4P
         VlEaOee7d6J4i+s9vBIoAx7xXujg2j/qX1O6AHJ4GFNnu/yDg0jxN1UY9cW3HPsGzHY3
         CXydnZ7aWxW2xOZkKLFmf7U+TbDqifySCngx84XxTUDPeJXt6l+op9SnLcVwPC5LdYma
         mepfuNmVVsU7Dw6as47J5bha+7czyAjiT5NVYV+7iMBrINu+vFwu9wD2NLf5vwHVzFst
         nxWA==
X-Forwarded-Encrypted: i=1; AJvYcCV6poE+F7DVLfISCsH+CTfjtxe8PXhTiKQ9bI53Wv6S4AlWMa6UU6guHzeJuw3HSJMPiE10/oOBzk9Kiwx10Zit@lists.infradead.org
X-Gm-Message-State: AOJu0YxdZVheLA9pkRtPt5Tc1YZjuFmjl+LY1UnUr8mhxjwF89oaPjNe
	nRVAf7TVnis57Cgk/DUW4ZJpNNH53LhpwtCR8PhqPsRzAWYAu+3NmJWs8was5FhPQkgasl9DI2v
	PI/iFCq3s5yHbYXDeMWYPHwCWVVOlgw==
X-Google-Smtp-Source: AGHT+IE4wAa1uushSqyIX9OxwMbbvMZIhYwycwsJVo+y3iWpXe65Hsxtzoc09JZEPg3XDw2ypEIRNrbYPoxWDj9ezfs=
X-Received: from pfbih12.prod.google.com ([2002:a05:6a00:8c0c:b0:740:b0f1:1ede])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4f88:b0:747:ee09:1fd2 with SMTP id d2e1a72fcca58-7489cfcb1d3mr26921054b3a.12.1750280946665;
 Wed, 18 Jun 2025 14:09:06 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:40 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-4-willmcvicker@google.com>
Subject: [PATCH 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_140907_748723_5DCD7B03 
X-CRM114-Status: GOOD (  12.49  )
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

From: Hosung Kim <hosung0.kim@samsung.com>

To allow the CPU to handle it's own clock events, we need to set the
IRQF_PERCPU flag. This prevents the local timer interrupts from
migrating to other CPUs.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..a5ef7d64b1c2 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					IRQF_PERCPU,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


