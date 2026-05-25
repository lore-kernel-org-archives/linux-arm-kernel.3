Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A4CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeWjSlPEDikRvLF1aU9lZbkxd+9N7RugqZlM/tjJ0Bs=; b=SO+L8Wpw39Ww51wHbp5UNt6VpE
	si7wSA/U/XpSPS0UzdhDyKnoQHAvsSljM/MJLafeFyADHsHyXywihl3bJK3+LA9N+rYoTTR5zFAMw
	+iM9Nc5N8FLkRNd0lxTrP9JqPou8ZsZ281w/kD9OM9nA5atSzViGnjNSxPN1fbNLYo34/ifOqWe+0
	TKRvbk1veZ9NyBjaKgMcntfO3NuZFrbAQJwChqOq8ZXtetlJKnmykbhEmF+SKR3A1eLCeH98ABfOI
	59vVg6nLHO9XrHZB/qS1NYPgitUtcYBq2jhkxwnhqllb9W0Xch8U4ytjFz3ocBN6+OshWpCamyQ3a
	kcCDBh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlZ-0000000HDwa-2xq4;
	Mon, 25 May 2026 12:50:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlN-0000000HDsw-2yH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:50:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so38541215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713432; x=1780318232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeWjSlPEDikRvLF1aU9lZbkxd+9N7RugqZlM/tjJ0Bs=;
        b=x9X4Y4FLsa24CB4kZhtMG1mFXlwPwJx2YOPAywl09+gpBrKW8BRZGIFuShAbP1ke3G
         yEcwCm1CK/caxp6emoYtmFfRcHGyFcqoY2FsuVp+e3e21i6tR2hi48qcYnyu7NdA0bqS
         TJ3VkpzXrse1j0L2e++/jQNgPNO1EqaSSVR7J2M2qZKJHUuTki8VG8ZwwtuOpxmdYbs9
         4nevqmhRXrWzzokck4yqmcC5IHthoLUO4cQPYI9JbmRauPdw3ZgXfnrFbcoB1F1BE1k3
         ilGlid6d4IZ/jI9YUnM/GDedU9qn0f3O95b3zjAKLs/wL7S+VlrJ8y/xs0VZeU+WpFaK
         vO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713432; x=1780318232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeWjSlPEDikRvLF1aU9lZbkxd+9N7RugqZlM/tjJ0Bs=;
        b=Nb6cNhyX4qLsxVHv9X8hihyQfQ++UPxZtgrnfzh6OXyScT4a1Q8zk4gGvAjPPH3kHA
         Ler62c0KdNUIm7C6s/+e99lTxY+9HeXoIllmlVtWG1b3HW9UYdllKvInFqdloGJIzMgF
         wRMwlucB/jwryBIcISv+mKcNhoPzpOA4KreIPuKWDr7BOqqrn0MEXBi6F084EGDVJVaa
         8Vcj2fsna3WMQHFN7sUpXE/x6iE7ps5/udPCgDjVBl+wAgI7XVvUkpUpyO7aHRIlahxJ
         iryaHqIJzyPUBvyNuwR4dBv+mEKIr7Dp3plT7FZcg2BbRb0eW+gwcItzGlpHnJU745oo
         FHAA==
X-Forwarded-Encrypted: i=1; AFNElJ/S4Nm+faszZZUjhqIaTBGgU4SeZ+oEOjWlNCc6RXthhKsKaEgpZGeNvc5L8Y84uDp3Gj0ldy1dwJ/3Oljcow6U@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8UXDKz0SvvnUPVcPCxqiVC31NIMzzPJzEdo+L+hIueEPBkUv1
	cCgZcZ7xGIX0XB4mwTbMHmcv6EaOrqa7kbe/Ft3UqrckJo0+NRnsMnLgDSvvX30llzw=
X-Gm-Gg: Acq92OERjFVyGbIhy2MVZ7ztpZW5mruadoH8bcmdfXp/PLwa4nn4jXNJlPmDS/dPRNn
	JW6DsZySUu4jG/6oyddTliE/HwJHHDE5bjsQvd1X5O7p2LuDcXaTaIPCDt/6jIafTCZYwVKTYhS
	ZYh6J0uZlWugMM44v3vPs5kkC1dqpPn3c9tvaYV2NSmkJ0CwjmMjYyUVAGprugqnuC/IOK0J5YO
	d/WLcIsWlk0jtpyD6CH+7nEJzAIEaTnQm0iF7s9L9bSfribFzmDsmh6rTdmwmZxtMyDsyWw1idG
	oG1dGUwJs0lwPDTSX4lCAlniU6EyfuZBbGAvBMDCEGBdOMAzOLJovDgZR0559u69CCwhayjaxbj
	+17KFvD9TayOfMqHpJnEL3iyoF1WX92LEmLIKTp0gB4FoCQdN2hmd8vaN0xesX9KBYLGf18cMt6
	XHysqZP+n3kJJySKZCiJKcCvjV+xFQqkqoVYL4Szozd9j7tEkDhWe/Put1vXBlewWCbusjvsI9s
	UCcrPw=
X-Received: by 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr151219345e9.9.1779713431711;
        Mon, 25 May 2026 05:50:31 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:23 +0000
Subject: [PATCH v5 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-3-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
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
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=j2bS/h+sguKS9/qgJjI48x6qOqG+tkwy92XDxvAI8yY=;
 b=wGj/ffuuA+IGQ5pRdRuMChnrz10mIrbyGhYYPnunxYqt6E370YQjJM3fCVLiK7mzpJhj+Uf/C
 82tUXkViWFXCDZJnfAcgY+c8oE7hfjIUHprgnbQm2BqPxOtrLUp7s5v
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_055034_882065_9845FD10 
X-CRM114-Status: UNSURE (   9.93  )
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

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..7ea3b9d95ccd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23660,6 +23660,14 @@ F:	drivers/clk/samsung/clk-acpm.c
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
2.54.0.746.g67dd491aae-goog


