Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363361099B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQFYVJlRe1oBH7q6MuxKAf35Jb0tQ494FakvV5sn5wE=; b=hJaQcv7Pn94Eg3ncOQVlLctawM
	h7faJLYjqIWEY9eGs4X0fodgDlmwXOZ0/2oXL4RFTkv32b5ykh2N2MzMVQgGqiScTCKFIWPfFXIN2
	/toZEsPfmVqwfNkVL7XeO4wgyN22TjKVdHWKKMTlwTLAdjpMTt4B6EefaoEO2SYCJMFx5isp5lnoG
	gMYqN1JQWI+CBDc621sgGYrs1v+gnfgmzJ8yeTQjkCC91YiPzXn42B/LXzLY/rrSQds9JYo1A5X6G
	YxuXQ5u7ewzl0qh3sNDFL6/aoC9c5XkaaEX/l4NTORfJPf7cgeNcKb3Wdwakgnw3UKnK99q7BJyNN
	ydJBC4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBn-0000000Db1H-1b6S;
	Fri, 20 Mar 2026 21:15:27 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBg-0000000Db0G-3hp8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:15:22 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so1799503f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041318; x=1774646118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQFYVJlRe1oBH7q6MuxKAf35Jb0tQ494FakvV5sn5wE=;
        b=GElmGJ982zxwPydBeg1wh5phwlkRPqvSdv0eD5WzFKpUUFWIlqnnsW0p7PkeFnzJ0a
         UzyvivEY4ZeHojFiWVZjaq092gufcQW8eiePwB9XgzPF1qVX4S/MvYqcWjZevAfORx5N
         sBSF4zhcJoQkbZNeKVRj6pq3/PkDYNHFy5tuOAvQzBjNdXG3lsOYoXF45YO8MkGsU2VI
         IRdtf8i4ntaWUylco4UydrHEACRaWgj++kx5ZLf+tsjCLJ2uQRYezx3sOk+9RDHikOSu
         A9fDkxyQP+wGpMjVZ5Kr7rpVsyDhBqWlcGdyU8Y/p8x8MMCY8s9Ckxt603Ni/0pYZe9t
         gWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041318; x=1774646118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQFYVJlRe1oBH7q6MuxKAf35Jb0tQ494FakvV5sn5wE=;
        b=mv2Iut9E8+vdGDLdmYL/B2k7bfM+6MINnEGfFnQqmUe7dFSN6WEXQlrRjhnEGJKJ3L
         EapQun2iU4FOofA7UrJRhfV5fdC6K4iSbTwPkMzeF2vlk0PFjMu05M6nzil7dFrfNaes
         y2JEdWoQ9AEzQXMuczt1hZ7C0jKgM9VR+S8LEYNAee2FE9AvPFM1J4gb6Njk8nPOyhHj
         t/nIfUgF4y6zn0FOH0d+fSk1B3YxoUo7Ge+JLrPaGe6lrzQJ0m+2syfqLvFHp1ToXlFp
         EkeIUnycwf8aEK3L75aEJlSv8C1+1dWTvqczH4DNvpuUhT1nLdC+H2XXnPgZRodX9BhU
         icuA==
X-Forwarded-Encrypted: i=1; AJvYcCVo5cjr1ntML3YVBb7EpY+LEzDwFCtP7PyjsIW/ZhUT0qBrGHXB3OEkO5g2DOlT5DLY6D6DdvuZeGxJ18nlTPp5@lists.infradead.org
X-Gm-Message-State: AOJu0YzJcVtCgDGp0dpkZbeFxEfit5JgqHiK/iHtr28DpcQ5i1DrKuRL
	rY19f3fG6O+VfEAV5av8RBhgcXU+EU/GUVy9YJudlt11tCnlxLxnKie5R69bBnpTaUg=
X-Gm-Gg: ATEYQzx2wXidomf8y+Ph5bhTBVu9UMFIrNvAzrRZC2TviHcBV9AA8iRsb0o5TnshHa4
	Y4uqQXR5LvUCPUy7CQM5yHtzwvdPvHivgoGO0ZN7PqduMAV0Yh5eSu7Jn+hrhdTPut6utrUywLO
	hfB5P72t7v0VHScgcmj3ioCoNt5OUD/V8McHpwxHmNinGfPJSAHH5giyFB/LzGKCuRl4qmgcEtG
	+kooYLTPWQKatf660rAcOPEfQjJxAoV9wNIWw9DBYdoCBDf7k1zJCT0VlC8RlogROFz+A6NHxrv
	0krI9d34HwkUvKGMGKYYXFSaO4pw3E67SKfyafb/zhyF6SmFyWr773WY3o6A441hEd9Y6vF1SWs
	jOlLEwXloJBEttTYfT0/EYZn881yHnF793ynrNUFg+J4Yxcy08T4Y1PaYTzB+EOXAcCROVcGs0L
	EDaVN0duUb9jsHm1YuJ4I5D5tkpSwXFxeb93y5ypv4ePmVqFpHcSI+v4hFWlWxhPktHqu6PfHBR
	NSmo+DSi6SetPbpN6gQDAiG6Q==
X-Received: by 2002:a05:6000:18a6:b0:439:bdba:56be with SMTP id ffacd0b85a97d-43b6424067dmr8157374f8f.10.1774041318039;
        Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:13 +0000
Subject: [PATCH 1/5] dt-bindings: clock: exynos850: Add APM_AP MAILBOX
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-1-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_141520_945747_7E3E5834 
X-CRM114-Status: UNSURE (   9.96  )
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

Add a constant for APM-to-AP mailbox clock. This clock is needed
to access this mailbox registers.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/dt-bindings/clock/exynos850.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 80dacda57229..95285589615a 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -126,6 +126,7 @@
 #define CLK_GOUT_GPIO_ALIVE_PCLK	22
 #define CLK_GOUT_PMU_ALIVE_PCLK		23
 #define CLK_GOUT_SYSREG_APM_PCLK	24
+#define CLK_GOUT_MAILBOX_APM_AP_PCLK	25
 
 /* CMU_AUD */
 #define CLK_DOUT_AUD_AUDIF		1

-- 
2.51.0


