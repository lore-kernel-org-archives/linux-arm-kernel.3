Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054D7D26D7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qMbxn84Jl9TQP5MwrwezHAHZlMSRbojtKzpjXnqIQo=; b=rKr5+eeIvHWNVL+x2PZ5TLsNG/
	Y+OhmvvAK5vd0lbef2XunIHm5p8OYdbqcO1bum3oOF7DjEM7uuz4w7P/BJnmRiC67bkjxtHZUwsMq
	+QkGSYkrKYacyE3Coi9VcWrmYDOLzJMFJJkfcN0iPRPmipEYNmKhu0cz+/jvLxs59+UQJDfWipG6I
	lRQzM9MJYLR8StLdwD0IerMy73yDhK/XoJPoB6l9G8+bvbCJ+CZVG+hsiXz6jRtuOgcUD8IJFoE9y
	DttlG9Xbk7p4TdFuiiLp9CDDXRpYYI3jgPse962fM46x1PIiaKLHbpfk/TYPsQqnGcEOb9gkQJFBt
	+XUII7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGr-00000002otu-0Exb;
	Fri, 09 Jan 2026 17:27:33 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGn-00000002ora-0tSH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:27:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-650854c473fso3061858a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 09:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979647; x=1768584447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qMbxn84Jl9TQP5MwrwezHAHZlMSRbojtKzpjXnqIQo=;
        b=nbYdl1Q/zXQoHOxpykx5Kauj/TJmYHuAazwRnWUk+9jzca2QyBXsfCIdMOevCU48ow
         neLTfLubvfmuK/CzYTLCLxqq4I6D93kLSvorgA/k+oNlyWKZmXpBC7//Yq/tT9gcyHMB
         fBcnnFQgyBjYlYKsnRn9JJxcnu6EqvjJw/9bKIUSMYVn+OQ47cO7QmTDS7+kCL7ixBqN
         NM+K0u/Pw1yNae6NOeYyC76kYqHyt9Fxtv8/A8xQ3XIPTkFj5MNtQ8x0O/wMwS5Bl20h
         sh09Gu8XF1yiZ5Melk6BTTeuBCfSrfB/8dNPvU36N9u7OCc+e4h+4Tnxbpl6SP/nV0tI
         pYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979647; x=1768584447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qMbxn84Jl9TQP5MwrwezHAHZlMSRbojtKzpjXnqIQo=;
        b=I6BrOtenRPv/KeIV2lfh/AFZ/ZKCZ6hWC9BWerMXx7qdViLoAwo7/1VkyG+8ojlHcg
         hJdsb9fS1nIccSS224sNmNQ/ABdNNQMjOI5ptroVuSS/PNzgjMzqbol8xz7hlHV6D5uq
         i2RssJB/ffSCVFVosU7dA7I89SebGryFvl52QpQYRLF7ZLgluD/G6ujOkrU/Khk11/B5
         zpxyaS65qrXrCKQu1JqtcaiKadFtNsRnZBjOmzB0Jay+Cidr6nFeDxQZlGdY0foljLwj
         vScPWqDY3Q0H5he4fowm36Mn5S+pKvMm1LXixOyubbqaPEKnpIolquFhaUs47cPPqBJV
         +ydA==
X-Forwarded-Encrypted: i=1; AJvYcCVoH9oDNMrH1HhZNf+cWsK5FuIqKUoS0f8CLiJYMQWG+OpaFNvpkiuRMOJ4bZqaW8+Ak4S9PcWcQ6ssybTFgSq1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/KUpCzJDeREEb+YOe9+O/e0R1aFZe/DZ34PhE9IZ751DCZZm
	ywJ4AgY1u1yhmtiLJ/GIq4YdEpDRPSsSfk9ml7XwdoNHC8lsf1sT5bz6ONT4EkKxRxw=
X-Gm-Gg: AY/fxX4F0uZR6eVRq4E/Cz9BiZMVX8sj7prcEbaCiNCaBdhuSVxGAWZ+Lzllk4d7Qpo
	BL+uCUnWfs6Xv4wuZ6pBhitr5Hs/UxY/XzOdq065WZkTGhf9U7dJdsEG9lIYPGPAV+Ygf1kL4PK
	If6bQU+VDmyHiKPufCVnk9JyveRoDL8KPi7yusUjVsq02lZJO3sM8gvCZZGdGgpqsBe1iQbbv+Y
	oA10KnWxkemkgMUz9KO5hOvNXJHUbs2ongeJ2llQogfgfksQFR8abherPC8sikVnD0OtZKHFI5u
	8lpNl5xKqp0y0Ti8Jw/COVXNG6JJLNDdbza/VKh5UDC33hSjtC5rsuvGVXesnu3arVRTTnolnCd
	lO4fsNZ0fSD7UrAbBwJnYfunx0BkypQOi3DWx7dzwpnrB2UiIHCsfoMsUDlFg03fZ9aqmwEGvu8
	K8hljreD+k1lHDjd7Zln4ONsVjfDHBrXiXcnAKaUOQ6+Y4XFuU8FGujCRjP6YgDnxZpC7Zcw2uT
	k4lhg==
X-Google-Smtp-Source: AGHT+IEQFDUoZhgENEiVUAoo2+KHd3ui6TPKSJqlq7mleu8Y7U5CJuhztcig0ROQZrAkDu29qDQM0g==
X-Received: by 2002:a05:6402:294:b0:644:fc07:2d08 with SMTP id 4fb4d7f45d1cf-6507bc3d3c6mr10607406a12.2.1767979647276;
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 Jan 2026 17:27:23 +0000
Subject: [PATCH 1/3] clk: samsung: avoid warning message on legacy Exynos
 (auto clock gating)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092729_268667_15C6AAB5 
X-CRM114-Status: GOOD (  12.16  )
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

We currently print a warning message that the IO memory size is not
compatible with automatic clock gating for many Exynos-based boards,
including legacy ones, even if not requested to enable automatic clock
gating in the first place.

Change the test in question to avoid that warning.

Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com/
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 06ea5deef4ee2ffb87dcd14102561886ea80b7bc..417ec1786b5e77e17dda4022b417c1c6b79c59ab 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -462,7 +462,7 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 					const struct samsung_cmu_info *cmu,
 					struct device_node *np)
 {
-	if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
+	if (cmu->auto_clock_gate && samsung_is_auto_capable(np))
 		ctx->auto_clock_gate = cmu->auto_clock_gate;
 
 	ctx->gate_dbg_offset = cmu->gate_dbg_offset;

-- 
2.52.0.457.g6b5491de43-goog


