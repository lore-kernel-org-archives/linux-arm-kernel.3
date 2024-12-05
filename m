Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F5FE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=; b=lWSCErh6gm1w89PA2SkYodsT+r
	kZiLpTwkUQLV0JJafY6KhT5F0jvMeVwPIkB7IvzXtpYxE3hRqDr+WjoE/j6JlT6IOUfxlnOtU2Nu8
	H0WjUSrUyu71JoGI2CHU+4RW9XaueD3bRWZNpDNOnzF7gH7s9dL6IkHSFlcXYpPFTbvB+kSiJn8IA
	D1MC6bU2fTKztGM9ezOv5R38noH8qrCyENSDVOoUaCopMkUrNMXplPcRR8VS8doGSL2GuSWF/hnFK
	ynuBdxdDhAc18kKRZ4D0iVfF9CCObzn3LbwY1oI3ESX+5fEAeSDx+aogZ5H+cVGbVgXT2A6bw8Dzv
	WgPPZNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Sn-0000000F3Se-3I3e;
	Thu, 05 Dec 2024 07:39:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MT-0000000F1lI-1XVV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 07:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=; b=AUNWM33DXmD7hKyS4NMuWwuHyd
	RIviSdK468O++ubO40h2KuVpQw4PLTU5MpiGfztpxldmRlU+2YGQFDdhPigW0aWvGhs+Sp0igc3uq
	ewTmjDbkyTs6i7afNJ/OSz20Ib/tVmtX9QfUQ4zMeCvAXk5nGpT5ApPTG3G7/AHo5ng5pvnna2l0p
	q+JhX5vjwf1RznImtHr1Bd79kiiG7kK1P/fiwIdfCfMfZwxwjZqhG5hoooNSaBHs9JDYnEmvlQXGU
	tIryjcUwOdCg08OJa0cXf0oXyBi9ZpbOfuu2MbtJVfmDjSHZVrry0I7Za/cvcuDA0USz5pZoOCuQ/
	M9GoP3EQ==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MQ-00000002muC-1Fmt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:20 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9e8522445dso103680366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383996; x=1733988796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=ajIW1AiD6tVcPENQ1AT5WUE3pagP8XdL4eR1NtiJJxwGcmGAk6TYjIob9lriIVjkre
         f8vuuUEFrMpywmLg46CkP+DlWEoyBPJK7julz+HsE9097ZzTYsP9e2NbvCT7NX8FfmHY
         2+TDN6F3HA7jxuyQZUngJZdxQO6Rvmb0sVoD0sDZkORD/Gey1B4E4sledyhq2rmPuhZB
         /BrakoG5yVm7TqXyYyPW+9xDi1L1dPOsViTYCfFr6ODelO7/swJEXIm9j5CxjpVM6pI7
         PZU0Y4HgwvB5er01K6xedX4c50jL9HIU4zX7Bc2iDnSJGoBuD5ugp7wCUb1vHqwn+AJk
         9bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383996; x=1733988796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=MDZJPNSK7fcDWFf6IB5BSszvbq6RmtOOXz3ugp1JcEjYSQn3EOCLfwhUaLlY+T1j84
         iK9qEOFRjaXtQeEl5YXmJHRwqt5XwDouSrukckHP08LyxvjDayCbVv5xWyZroJ4bXIMu
         u8gaVBWL/WC8yo+pwgKf39S80brSTa+LKPzwZ3XXN3/N2h7wb7/qt3XOK7Fzn77ATalR
         LBQFYKSLHjH3mUvzH80GILILcB96TRRo5KzzMeSLT9dRxDutu5/I472uvS9xMx1DhHvd
         CBx+UnlWndzSt4LAQuxKs0dQ4XFo0R0GWG0tpmze9nECYWNQkGYz15M1YYtmHxZ2YQSg
         s7gA==
X-Forwarded-Encrypted: i=1; AJvYcCXPXHR3OsU08sFU/c/CyCpioA0ghB/XMqu0nDXhfzpQEotBwFdQfiTPyieVTqH27Mx9iQIAFYwtbR3XFd12JuEL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ONEFFs4Js9ryPUowhNVaQQv3FXmKd+z8oMXmYrKp/IwVAU6Q
	CYvgWkkx8r9UjgYQW/Hi6nalK25RR4dR2EhI735j3OSZegBZDfVbCR+AjA7O7Rc=
X-Gm-Gg: ASbGncvVd2TIDfP0xJ4WWejT3yGKhJd5+3Xh/b/ZQu+IEAO4LWpaq9wuONecoBG1iRR
	Q7NefNpXvSD0OQ8SPczdhR6tw0G4y2KH/eI3UvHdxB709xSp80816Moy92//USfoyBadMSvHUWY
	wClE6DDBc7IY8xEzBI9lm/kccci2tXgpwMSA/gKMCDJ7GKqTDr1VHSlzK4k9H4d0M+4Jyp/JNc4
	wPigscIHNd6GRx/nVIf7m9SIF98ARWzNQwSIyNbPkK64cgfRQC1zFpQ7NCHpnnx5d85tLPFxCIz
	oip56q4YTVAXR9NBsli2HXYW2SpnVGTIVw==
X-Google-Smtp-Source: AGHT+IHuNjq0k6FYk7xK6t2GUtZ0TeRU7XN1ZF4Q/PTjjLe6Nsx4lZ862dPWiqXiDX4zZtdZApQooQ==
X-Received: by 2002:a17:906:2921:b0:aa5:aa3:8c45 with SMTP id a640c23a62f3a-aa5f7ecd65emr765500366b.48.1733383995984;
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:16 +0000
Subject: [PATCH v3 5/8] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073318_493287_9A030930 
X-CRM114-Status: GOOD (  12.19  )
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

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
CC: stable@vger.kernel.org # 6.11+
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* add cc-stable and fixes tags (Krzysztof)
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2a724d362c2d..c1ce6fdeef31 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

-- 
2.47.0.338.g60cca15819-goog


