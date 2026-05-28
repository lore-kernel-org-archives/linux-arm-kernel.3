Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF734CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 11:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpUOS+9fsWY0UqlgRlGBSremc/v/5gxyA5J8k3968CI=; b=Wk06EUEhLWFxrBsP+spetp+nwz
	xdy2juv67uD9s+XMkIChQNv5qULYznNPHSKDnd57kCFeqjyahO2l9u1w45sZACqliPhYatJASgS8f
	s/w2QbBxpUxD3py/lfoZl8bVTiqJ9DPaBeDwitM2jUepbqnPLwlO3IRUhMHqfQg2lKsuz5ZQFBdiA
	CoKPoFzQD2VkAhdXuK63SNvaDA9ZZnDryMta4EYS4vxv62YR7tD7Rb2pXovidPQm2Y09L4tF2j4wY
	fr1SWOooORYOmKnFetXdnOgi0gAWZdEav//5AvaDA5KBuRdtnVSGY4Ex15QBqHpzPXafDVcLzm6MT
	ZfKIb+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2S-00000005fOZ-0E78;
	Thu, 28 May 2026 11:36:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2H-00000005fLJ-27Of
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 11:36:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso60332235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 04:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968183; x=1780572983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpUOS+9fsWY0UqlgRlGBSremc/v/5gxyA5J8k3968CI=;
        b=bHnVYOu7Fv1ZyZd6sk6QLSvNFcqShOdzRoC0M1KbSdm97w0FTHacwFKlS7DZoZ9NfX
         8SZNTyJOVzks1KU5xvuDUo1pZ4pdD0yWK/HV+nwDSM+UxhE5O32xDPkz20nBSu+rxE/b
         3ygkF0zEgG2xLca4cYLEk1XKlZGZa1Lz4GhlHZlgGn6I+LR4Hu9+aplQAZm+AvKxs3N9
         X4X5+1X5rA64KVGLGgNEa3PVNSYjEGyeyfZ3i/dhsxk1rL9y8JCoW/RbuyNM5bOfXscB
         YrvUU02RBp54tC9PpB5l/DF+hzr06oZfBXKkg3xzDmmqNOk4b4VdQzUizApG9k/glnvl
         x8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968183; x=1780572983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wpUOS+9fsWY0UqlgRlGBSremc/v/5gxyA5J8k3968CI=;
        b=OrlPPECEEm8aS7p1LQBcR4wTukokEx3ugLcfO4j6lmeVuQWLRtF7KUgan7KGlYwOLa
         dxxLWrNCSUiP8PX2WhOCp5+sg4oI1Pfo5WSdpwLHPWKGjROYwLsVsW0qWPxLA7lKMg4g
         OTixKdmtApK6+TkQqCODmq27k5LmN38NccanGQ9E4tzhB6Cht0XmFC6biLZzGeZypwuo
         2vQloWLWVqyFniLY7j8okpxvOiSCVhBBGGXigv2VP/v0mCQ5IS1wdJCzqcEfXk0kUj7a
         OOB6sGW1fqY+AtHhkW100oZz1x6NHONYCDbWIE0p/kZbRuuQBgK9QUdfvMK2ggT8oXFH
         9ofA==
X-Forwarded-Encrypted: i=1; AFNElJ99CLqiNm+cwzKh+mXm9t+u7fv4QyHKx+i7jzEPvi5rSYqMS2wS5BwSNEkRihhKNxEZ6uhdo4pIAiG4DedsHjwu@lists.infradead.org
X-Gm-Message-State: AOJu0YwMn7JlC/XotO2/lBWaFD1uXpR36kg5pSKeRxFLiKLF4CV0wSnD
	+5C4ZpX5iGQvjBKMJwoWQ4DNpX2Yo927exbzzHevun2S2U0oUz67Ae26n5tItcM3bIw=
X-Gm-Gg: Acq92OGpqzQmbe3p3cW+ajo6MIgs0EVyaLb7Y6OYq+wf4gOV2wezWCg5fPldMB7nL96
	p9HN10eifL3KbGLC5T8w1+RDLLBJEodqRytmA/rV1F58kFakE5EopzEM36cSW/SFOsDW0ieBlE/
	5M+acu39PqffqRoYfJHg4e7+qnsprmvK3WzZLej/rKys+NWsDMuRmjJt505PAlq2rHifO7eCBOj
	toGT5uzH882w9c3zt8T7+PzYqShqxHKDzFzi3EQuvMAUrPnmNPYXnI1zrVOdXsqnZKxZbnaG5XZ
	eGXDC0kWZ4kvhhFOkylWv+i+tR25S5xNMKXdMQAVNGFPRt0b7FOHXrUbHoKmraD3DRloWGGM2Qy
	Ud5fZ+U1M4AEnNJMPeMNJLaL102OAytNddvtqD3YpTFakZ5KKvxGsGu+ltwoa+k97Rf+1Uq/7fl
	1H4aKHiEhsmMnwcZZ9CZ04awApq86FjdfXzonnKmYMestW1iLabKfMAlLGzLkAriYiuwo4d/rQ2
	MIYH0RB2zbilRWttEwuSiJxxT3T
X-Received: by 2002:a05:600c:8484:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-490426cd8c4mr466725355e9.20.1779968183364;
        Thu, 28 May 2026 04:36:23 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:18 +0000
Subject: [PATCH v6 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-5-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
In-Reply-To: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=794;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Aobvj69DN8F6w0+Jb0r9TFQ6oCGfBu7fy/EjQhPy1lI=;
 b=IrVw2lxVCkAd6zW/JJPCyuIUKwWUWmwU9qRVAfB/8ZYIYZEo8nd4c6wq7R9RZmeF123hMczZw
 7EaqfiU+KYjBsr+EB35bTx2qZFhGyzz8N0BhvF5UIvxX1zl1H7Zm7/j
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_043625_565863_2E34E3FB 
X-CRM114-Status: UNSURE (   9.26  )
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

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs (like Google GS101), used on pixel phones.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.794.g4f17f83d09-goog


