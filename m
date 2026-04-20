Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06317F5A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=majqoFYlSL/xq0vEC9MR4HUJoBMpHEo2idjyzWrGGo4=; b=dLEMGFU2zdkDhV/V8vQkGSQSce
	UdB0yoGs71/+fy9355fe3WRtldz+2640iW2rRQUQy2x19c7JbBNvOqw1rMxRJkKyByJXIwaKNW1e9
	1LWF6ELec+HCIL456QLM5yyNr45TfYoyT7NGm8Y6jkkwWc5KBXcf5zdjfq98WJqkVmB5rCt8uLDzN
	teGgStUcZZwxK7ZqH8EMmlOuEKuHgyInJckqxLlNi8r5Z79LenRvnABu1+hXPBTU188z80BW/sBTj
	a0BRS6mIFYX94WpSqyK0uX5j549gvwaBVtC6A6xpBvYhczy06elGpBE0h0nqHdt1VqUxar+KMg7wv
	2k4oy0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbb-00000007V7P-3AVk;
	Mon, 20 Apr 2026 17:40:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbU-00000007V1s-2xgI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:40:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891b0786beso12238875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706811; x=1777311611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=majqoFYlSL/xq0vEC9MR4HUJoBMpHEo2idjyzWrGGo4=;
        b=IMYK7lQZQcL889X82XH6u9UdmHxPnU7ZI8Jt+ipML/NIsAy2QoHXPRZmyRmuq4fF93
         6w4ddfnw6SYGthUiQ0n1n3rUmTue0nkcZamRDPB+0GzjdL9XL10OwUvAehF1mZkbg/cn
         JNCf7lA3C6Kdb1GMxJAQeTfJlU6H0MtW2R2/rsWXPxXwpxvqjSzxDF0hwMY3pLhWzHTf
         f7Ux/qaDo9NnlDk4uUHlcQD649GY9itfrbhW075Osy/kP0Wn/S0x1WGeggbkaKnsKFJc
         aox52FpIK9wUFAFtii8L6uRRNMUd2/HW8j3Zu2CgIooPMf/04g+AoI/lFqWYyR/sFgOx
         k1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706811; x=1777311611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=majqoFYlSL/xq0vEC9MR4HUJoBMpHEo2idjyzWrGGo4=;
        b=IXqSl/L5fM7wAlfzOvUQT+1x+sXzMkCkEjXjJsnZ9egSQJcl7edNkvLYwEi6jUm+HG
         JewIRvXTcY4uib4LFzb5hA80XeAvarSfzP+63tXIxwinaVmkL5vbdzatQwgoDCZLq/kJ
         SthNrPI4aA31OdEw8P9s3YhpwyGKK+V6qV+iziUWFEEsFcWGZTrq03+wjk/74UUQwDX/
         xUYtFUW1EA3eHBXhv/3jMeRSvm+Jz1tynLWuXN54bGAMjhuwCbFPB5ZB4W7zFX9nsRRa
         1JVw5gR189kEs8J94fGde7z9o8Zxka9cglw2t/nICTAUai4FrX2ewoHpzWLgdOv8G+ED
         88cA==
X-Forwarded-Encrypted: i=1; AFNElJ8yb2c0KOsVqoAeIDC2vKBK+ftE4LM8nZ/lqDpwzFnIl60ois1Es2pEFHZ4wZI4vtiTmjKurfB85WrT5C9et40d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+dmZtVHbC7nDrW8N7JvvfGr9ytv3ggpAjO2tsatHYIXli9qbn
	fgaAZlsPEPGGqQfnws2KL0Yu4wEkJo7QRNVWjM5DsgMaVZwnRglmBRkPR0kkdoNdm6A=
X-Gm-Gg: AeBDieulhxnNzoRjcj0gbv8o4pC2Hxm/ww0/M/hbCCraYoW4/Wd37Rthu1bwPA/BghT
	2bame+9lWe5o6OUOBAqdhh3neIHP5LLAgx3C4qgn2oLPCOgCNAd1cxTl7wPKEOI9gppXZByBWwY
	FBw48wgkQS3w1PqcLEv+rawFPCEl2mGfxVj5wUJwbOjM6NvK57Ov5YDp8rHxfkBLZ+q2q66JxF3
	Jxui/k8H/Jd+7dDOy0H3pu9AR0kD9iTTQ80EGG8+NRjugaGcPFew2VnxgL7BMDhnkcBKronjSgg
	Tfe6/2mWzg2OVF2TlckyUMRVL+XYewOgsy8DWwWYwYwtaEpqkT3Fgy1jtxUBhj/DKhjrXF40897
	CPFAFUDFVurNGR086HePOJptBgzNpqlh9YSp+sJzSEbR3h1zaUqCQq9by24Jelt8Q3o59PKznJu
	U1etgLNVud9jqgyYiEJY0l62Kc0wSA7qCvXy4lkRD46DC07gv6Jry0qnBrkmb1RVrzxqwpUacYK
	yfgSWmRHifruNDhaA==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr95027985e9.8.1776706810700;
        Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:54 +0000
Subject: [PATCH v3 08/10] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-8-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=992;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=utGmC6SX1f1tsmdJMtEQdtOxlDLzgsEsYQAYl4X2W/0=;
 b=ksF38PEKxEj8F8BXFtqnkVgT2aWgmm/cCh2qiLZZuahhGr02+y1RNkzFa4rchgDi3llZx0f89
 UBd/cw0V2JDB3Hr3mS1DuYCTqeAFm4+ZK/GDr40q1GekCyBRI6bSKdj
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_104012_831499_9346686E 
X-CRM114-Status: GOOD (  10.58  )
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

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 76d8291237be..fa67f6f449a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23676,6 +23676,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.rc1.555.g9c883467ad-goog


