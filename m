Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E974FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h6pKpWNyOGCaw3yTYwiqZcJCt91K/pLDCAKswGUtgU=; b=Em/F4jQA/sdyu6Vk4mQOXKdAYv
	Xlgf9VFTsOl/Ax3626vwaoumXApZBtkJgsMKVyiTtniUyKN2G8aYzORAjmJcbznhHatfrSHnX4kVl
	tCx4vj1bye4yMJ0rnmu1jFlV204SmUZ9gbVl6uN9J0TtMAnt5vau2nFm1jVThz0CSa6P+GQ0soDya
	Q/+lysECqedAH8NQNEcBXEZGdp6fTjgIyTxmmvcuWI8cB6/uVRYgmr4ZPoF34641ZG1W0+hI+BhyY
	7F8WcMpbZrgq691l50Zwi2CCCle2JPFIJJSrvDuFs7ohi7t7zcrDgAdVfEnNs11x2Rf6FFqWmJEWQ
	slFovwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdfF-000000055xZ-1y24;
	Fri, 20 Dec 2024 14:07:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdOI-0000000536h-30iq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:50:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1145429f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702605; x=1735307405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h6pKpWNyOGCaw3yTYwiqZcJCt91K/pLDCAKswGUtgU=;
        b=LMtIcx3DiNcc+tiZ1or3z3bsVHxk9USjplOZW6fPipxPljn/NQisldmrHOddP/aHdD
         QnBJ4VLGCjA1Sp8MXC3+mK5FIIja+vaeeBXjhdSDZYGHev4q0MuzzXV7XGJ9CmCJ5sUN
         VeOJMedH60v85BTQYJyRAZO/GWUHS1vF0xpxPrrz2VL8Xkun6EqWz9l5UqIAfLAXhn4m
         yMNCH39hZ2xdNfgPKytVyW2ZeWypoDpQ6jkBS8JK5BmnMP2c01UK4duQEu9RBrO0S5Ml
         wIeYs9Zv9REZwATtb/pLYC0ePjKlxU70PePbzlS7QZwRyE6Xkq20czAzFsRFYnCjWYEg
         MhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702605; x=1735307405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2h6pKpWNyOGCaw3yTYwiqZcJCt91K/pLDCAKswGUtgU=;
        b=l4MnHGee6vlpRya63d/ZGU/fP0KwtYSGQHmBU8auyq8kwpCj93lWiNkrJ25JgdFYf7
         hXEmxfbHq/W07aMSNyYqoSAHC40xIiDcFr+tjBwh/lv68xnS4B9WqMpnwTlIxq4s/FsW
         TMWVlYCK/N8hBcu4BYndQr7FqzqznerDpIBSXhxAEzFjRRGm5gqs6Zi8seSbwkcmgutC
         1oUqLUPCQvt7Ny0UKgishiTadjs7EbNskTyYsdqctecpeFIMtgj3Ur7Tn4WMKvEMBvNs
         t2cEfoNvSd6xyMKZhoIPPmZVzzhTqwdiwDqv3pflADXDU640MIAY7be0tGzUtlmwZpTq
         SElw==
X-Forwarded-Encrypted: i=1; AJvYcCUp5EmdKMc2NqMWW238+sjHbzlrFwbKWEFM8HyJBV22oFdbeOt6XWzAy8B6iSQhZrmY8XmK+vzGY8xHseauVwxb@lists.infradead.org
X-Gm-Message-State: AOJu0YxnGLhPwLDq5TwzSdi59bPU7Mu7W3JdGttgw6inY9LlBxF6Yk7p
	QCBwagUUvzd6TDx9cSa5Zxm71J5GxItTwxuTw8dQQXiMRK+hXzMKbHktFeoS/yU=
X-Gm-Gg: ASbGnctzocHU1gBa/2EVsTKZ5QXTBpdKyACMyxVx+4sTUCZX+tbqHKLO8w49Xb6OgJU
	JvwVjzZv14BzBEKTzoF79eFIz/EwHn2OjVJh0ErAzawvuIySbG+NDcHWav/6+NomLInnOYkvFvS
	ar7SBWvjU/jqPPnpeGp+3hz0/AmI5/BllUUIgD4c88gJ7/wX/J1nTXUP7gnEpatW4MgmJxE7pKU
	//Z2L8LoQxB3ZIfgwV5M2Jo5n/fkMpsBncI9HExN9zDg1uMTW+qyz3ZuI9c6+kHRjXI86aSPfC7
	wavSW9a7vsqev62j2B9wK/BJtk/bpvwh8KW+
X-Google-Smtp-Source: AGHT+IEzk3FDr4mxRi9pcg64L4EH36p/AQ921KSU720SqVRUCT5e6SMqARYYJAMs7JhmbOKgemYFdQ==
X-Received: by 2002:a5d:648a:0:b0:386:36e7:f44f with SMTP id ffacd0b85a97d-38a221fb038mr2515751f8f.18.1734702604753;
        Fri, 20 Dec 2024 05:50:04 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:50:03 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:50:00 +0000
Subject: [PATCH v6 5/5] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-5-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=1338;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FADFf9WfzjcMmisKrO8yY+HCWLXOPKs8H/SA2SqLMyQ=;
 b=R/NhwDpi95hfet9uVWKydOIL9KS/J5QAVtPKjGibId5k5o46YPFi74GbUfbFSSKG+goXQpBoD
 DO8znrl5OuxCXJUd1qUWRkIqdil5rImUGzsy1AcnYVz0s/L8+wAW5B7
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055006_756525_237B017E 
X-CRM114-Status: UNSURE (   8.80  )
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

Add entry for the Samsung Exynos mailbox driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baf0eeb9a355..6bef5fc5e4ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20717,6 +20718,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS MAILBOX DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+F:	drivers/mailbox/exynos-mailbox.c
+F:	include/dt-bindings/mailbox/google,gs101.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.47.1.613.gc27f4b7a9f-goog


