Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D59C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 17:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6xQ1Y7hBvJR57XJgMbIXAzfr8lk18+IiDuMHlwLxZQ=; b=4yoXO/358nlg8VidqJRSukCtvM
	DkzAmY4Lp+vX8VEQw/nVsDIkSVU4cM9ldk8QfyqFfNTzMc9hNQYAc8J2KO45VhWPqLs2ti1askapE
	kcjRbQwFB0yWkvDYI7YL44c3aGDpEayWttsonjhkbdVJCHSFv1CFK6AabQMwp9HQWyaulFYkaT+AY
	hVk6WvA5rLXb03aTzuJNX4Ya1PlSIUDaUBsVRlWZozNqU7yfYmqfr14TWGL7nfamApifZCOg+vNtG
	g0xkfy6VXlhY3bizBmRDYnAfJvYrPXPL691SlXlB0CRGIIy1qyPvlZr5fMQHUYoXTgstTzm6cILMb
	aEWVJqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVw1u-00000000X8E-3SD7;
	Sun, 29 Jun 2025 17:41:26 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvtA-00000000WPX-3llf;
	Sun, 29 Jun 2025 17:32:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so3001064a12.1;
        Sun, 29 Jun 2025 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751218343; x=1751823143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6xQ1Y7hBvJR57XJgMbIXAzfr8lk18+IiDuMHlwLxZQ=;
        b=TV4+Oxjd7h3o+Gv4Xc4SGRPRQRgR9aTSh9PqEFT7qS0uBpoxo0eU46Nbks3NZVSazo
         HOw4HHCGU3vFITEY3ZzH6RMF54UCXqKS2ZjpniTFHizlF2516dzPYvx6s6Bts8CpsnfN
         eapQjT4M1oVouIkP7wuRB6DHUAoTLUAUQChJ9clKE2XXgLmpJr4gIsdRDho+gHwiHyT+
         dV3JGrosGS2iARFcqm7davDZkWKSK82yRJlco0EFVN5sOfiu453Neyk7oeZBcSvzPRYp
         LsGJbNzm74yL/YDXnFDs3b8abzk4g/FCV+CegC5ZG3bD5LRL0bbTxQIsFEvtOKaqjDrY
         qxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751218343; x=1751823143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6xQ1Y7hBvJR57XJgMbIXAzfr8lk18+IiDuMHlwLxZQ=;
        b=iue0I9Or8y+8JMzK8E4DBuCo0fFi7Aw/lX8pnpo0pJvQfFuROkdfrjEQ1BY1YGmYPa
         9OxLoWkVdGk1HQTjs/m4Mmm/KFH8H9UekhQ6uBXl83RrgOKHIlV1hK+XK9r/y3QfJX3v
         OmJF2smodcuIRDlsZ+bA5+27tdGh8eyUxE9zR9t/5dyCfkIVX5KsEQR+JxAqjQD+FVCg
         /ckPQKXuzgpyc7iXONYVLUYAhiwsqOv7GKEfmeWPGWpJSyOlZ1zwLctZHbPjFuiMuAb6
         OqTfRMhfgAHn4b/SdnLHE6I3yTCCzrEYA5xx9pWmrduQqqmii1W5QJN7xM5JDNAt6r9J
         E9yg==
X-Forwarded-Encrypted: i=1; AJvYcCUEY2c8DrtsPBtb8x8JJvgGg2ne/tr3a9yAPYOw6F9kyD3CkpkOC8phersGATlXzQsNDMiPUQ1heoUHlXuU9NA=@lists.infradead.org, AJvYcCVO5vLtJqzfrrzqT3AIwjmhWbce8t+RSvC6ny271+UxooWNl+EQCEmr4bKy0tzezo4aPZSbt+Z6oSDwHk8dxieh@lists.infradead.org
X-Gm-Message-State: AOJu0YxRrhqkLfdITgk+w3YLKm1Ym069fOPlAMpp9Oqyd5rhw+aFF69h
	C8dtnVdZ7On9fvjmGPYuZMh0vW3BARNRCQ8rDBMTJkjzpYtJ08s7QZu6
X-Gm-Gg: ASbGnctxYChr54j5GlA04YUWSGpU8EDSK+egnxPNlSCseHPhJq27sP6fpAGz58o8L6S
	S/Kro5e2fvP96yscJPJ4pR9RNKHp2hL1H4WNXeP0dKLyMowWZczscIJiRmx9stznGoHIjhvED7F
	R7csQbzwpC5F90twWeTQeovh+VkCVVdbJ/WBvEYYZh0BKQKkr+JDd8UcTmhpKkUOJ58yF5xmtCF
	+YJZ7xJAPntEbMZRDsLeM0Az5vSkyZyDb864REBmrH95Mt5XOc/datytEkDjFqfkSw8EYcXLD2R
	01UG4DNkwtWKpqajiiKlBGE5/SIGfnvy5CXmCPoL8fHhvrL0D1HDqwIZd3oCqqPFyMn20OlPXjf
	KG4RVfl8lS12bFg==
X-Google-Smtp-Source: AGHT+IEkQU4DhfJJjyRDWns6fYatVrqoTFcRiDvvpFr1CvT5I3mlltWZlVGmaskJ6UNFDI5bDQF/Pg==
X-Received: by 2002:a05:6402:2787:b0:60c:4782:e4e1 with SMTP id 4fb4d7f45d1cf-60c88e2fe32mr9889331a12.27.1751218342378;
        Sun, 29 Jun 2025 10:32:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ff8b3sm4607789a12.67.2025.06.29.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:32:21 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: sean.wang@mediatek.com,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH] hwrng: mtk - handle devm_pm_runtime_enable errors
Date: Sun, 29 Jun 2025 20:31:41 +0300
Message-ID: <20250629173141.2423728-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_103224_935663_83A21490 
X-CRM114-Status: GOOD (  10.49  )
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

Although unlikely, devm_pm_runtime_enable() call might fail, so handle
the return value.

Fixes: 78cb66caa6ab ("hwrng: mtk - Use devm_pm_runtime_enable")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/char/hw_random/mtk-rng.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index b7fa1bc1122b..d09a4d813766 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -143,7 +143,9 @@ static int mtk_rng_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, priv);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, RNG_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
 	dev_info(&pdev->dev, "registered RNG driver\n");
 
-- 
2.49.0


