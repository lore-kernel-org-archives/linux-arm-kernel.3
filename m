Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE63CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eh0k76F1VcFejnbUFNxz+uVibEQce92HxFpCY6rugsA=; b=4tCGNnq8S1gIX57Ut6EL9yVd5t
	Ii37Pg2SJ/G2XOjs5zcndJL0eJ4OGi4lgIMCz0RPjW1ce8llQSrKzQHvt3aliKZbnJ/I/GCMzlbZT
	43t5nENAORAy9qRaKGVZr5YYNqVIOhimD5aPak6csfhtwFrCgOn5CLMmgWkI7LUUaus09GSMWrv4B
	So7nKKIT7otol7SVymqCLkFFJncNZRJgcUSrOydrSdA8BuLmBG8UvVtmoPED7lrMXgpq2JuU2msmY
	XmXHO8fSxLjx5wVqpeXUlkttnDk/FkxF2MEfFHWKQlK/7Q9KzAXMrLEzqhjTqeH0zrYs2jPwG4jae
	7TU4KTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQHJ-000000070QL-0xFw;
	Mon, 25 Aug 2025 06:02:01 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQ6z-00000006zOj-1bAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 05:51:22 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-70d9a65c356so23913136d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101080; x=1756705880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh0k76F1VcFejnbUFNxz+uVibEQce92HxFpCY6rugsA=;
        b=nibeDXkDtzQhgLt4rtS87yNfw4cVk+aRO2ar1utYfsndk/m6MD6lipIOrp4+FjKW8b
         zA68VuRzdPqOiEQDuF+C36BFu2JCJYVuM1zSq8xKh/kW14U/SqIBQeXK5TylNpPx1BuR
         r48bmqdUEKLNNzTG+TVW83M5iqbrUhyhrdwV/BvZTf/0eDz/uRo5vnQNTRSMpLw5+5RC
         tOsywT85xll1Lku+lu8QV0cVKFQ/E1F23/p3PSN+ciclMSjGP7yHofOhuzvQZgIMx5A3
         5bkvQpdyJK+9Nule0slmH3peooRMW8II5G7UIL1tbiEh4zDTzMh+69E5C+JWhSFa4q67
         wOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101080; x=1756705880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh0k76F1VcFejnbUFNxz+uVibEQce92HxFpCY6rugsA=;
        b=kznH6UoSPMtnw3mYQrBenQFcjOmuuahd93M5A5jmh8ChgFod3Wh5V8m7dx+xvDGny4
         LzBRd8OhFIskMkyJpbUGMGb3dM4B9pBBhBt7cxqSJ7rDoQMByhhBA3gVfQCy42OobChh
         UpNQoxyrqbTSCG9WrtIFQtOZYhVBqJADHw92hDZ/4bfInqayAOTEHynEGbnZoHXyn2NI
         hnOYpO5AtkWhF1o1hnoYrHR9HNY7bHtayvyRAOgE9Sr4GIuhDhOqtO0z7gFhBYqLKAcV
         mFCMseW2kod4O8Ph5dRmFzG7QGjKUQM+AoipR2wDZx6wuzt2iC0VcnpQSgUndLSJMWFK
         9L+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDC/IDFuhPGZgvyhxtHd/tG+ef5wjDtLBgLqgEKEV0Jf3XTsvvTHt1vPi2uhQ8UF/3A0YA6oBhR7THk5ASmu6X@lists.infradead.org
X-Gm-Message-State: AOJu0YxnsUmN2/Zf7tB1BRr0GVSIbfhjw70MvtYWwq1esA64GzZtzsIg
	baSSUuGHuJR9HSf7/NQeTYG1NT65ybqMqVjLfzYRy/ukGjBhEcu+Ct770HYnIznx
X-Gm-Gg: ASbGncs0QB3umZGJiKrqTG6uZpIrJsut6YhTKr5GUR3Ghf8AEntdcc4MK+BhFM0zceu
	gm9tuML+X9XUQyGKVYc+faw3vC+9+JeTK28IGoI/jC0OoYsMq1EfexpkJnKaRaUSA7WQs+8PcuD
	v/67TZGmzlzaQ8rBlqJjfAoJ1EQQJDLIFnjvplgyDjJX8ctSiGC0omDOGQme8psSlzwnnUXdPGS
	eHUuuFIUUW5F2XyOR2c69sSUq3WpOxIcwMEQPP3jQXkmfmrxvg6kX5lZ8tCBRwpZE+1nCebuSN/
	kWQ5/80Q8G6bFlgh0YssPcrdqLhkUpolNcDWLFQLhcUwf3EXGQZCkRwn21sJ6NaO+DZHJTeTZrd
	o2G/BgVkLafFGQPBlAJ87nq5Ib9XsGQ==
X-Google-Smtp-Source: AGHT+IEaP0Zwl7X3dGOq/mwFIJc8Rr6yBUUT3o+fFX+xFVajSdc1UPZj/jJ2cXOQpaTuQ7HP4xbkIw==
X-Received: by 2002:a05:6214:21cd:b0:70d:6df4:1b1a with SMTP id 6a1803df08f44-70d9720f384mr126231936d6.55.1756101079984;
        Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 05:51:17 +0000
Subject: [PATCH v4 3/4] clk: samsung: exynos990: update CLK_NR_TOP for new
 IDs clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v4-3-71d783680529@gmail.com>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
In-Reply-To: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=799;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=KshG0umwTRkOxCv1V2lWLWj7+xMZ/xwWZ8K/klaG7Hc=;
 b=sHj7Cnj2MhG7M0vHjH1Q6Ak9rHV+FWEzfch2nuIl9sDn5a02RL15KFfLARo+Ym+YKHQog7IzG
 WK7oRg+7rhQDMY3lrhIfJrZRlQupSke11v0Pv4aVbFtoVtcLWijn/Ic
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_225121_422882_E26307CF 
X-CRM114-Status: GOOD (  12.90  )
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

The new clock IDs have been added and put last,
it is necessary to change.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 105ba0363..9fcdad7cc 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -17,7 +17,7 @@
 #include "clk-pll.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
+#define CLKS_NR_TOP (CLK_DOUT_CMU_CLK_CMUREF + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 

-- 
2.50.1


