Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8B7CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=; b=qmL2sKaOZjISPM68Ob7h7XRkHw
	cAjysdB17Y/+nLtxeQwZ66G+T6k/MXuwxibdIkQ6i5pvt7mtlkQRq5eGjXEHvgljhx72nnTXjLgg9
	kgUvnqNd7ufh0ceBEKHexlZEN0/GP04cZnv/daRkxplpt30pe9GKZdC1EdVHE1RDngbFNSvsrMF45
	VrB9k0G4903gaRGfCGnLrwo3kq+zPcY9GYADqgrRXoliNkdAJNfdhy3fv1GK8XMAhrrFfNwm/5aNx
	Fb0voibJpUqWgK+awL+QavUylUDv1J4+zvga6F8EPH+YNyR2C3HBQffPGolsyIpIVHm2qiriz8YwS
	ejUkUXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb5-0000000GIGM-3po8;
	Tue, 05 May 2026 13:13:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb1-0000000GIBs-0Fn2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:13:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso46567005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986833; x=1778591633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=s1JG61QVtAL5Xr1NIIZCXxE3U3G/aac3dboFyc7QduyPEHfxO+bGF+krV5Z4x7m60L
         nRv6HMKanfURLstKJFd+jhjlTl1sNvZ20Z2gJMsxIVjgKKx56m40qpRut30fdq9B3epj
         veVRyIhjfG6hgH4vxQPlTq/ovO/0ho32KW648Suly7+fKSaNhC4gjUVD6Q0WEioX3zL1
         gOvwjIurpKqrsy76pDuu2yjlevocHGKaatdVOX2ZXacWsrWXGDQWcdYVBm7475DDgGLn
         oEH0uzmiRRjme8CkGbAZ2l9Oc2snQyUDA9zSXWUU4JyoWMGr1FkJwxGsRJ0k7NAU3puE
         52bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986833; x=1778591633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=WcpCdUZY3uCI2RbIsMdBnJeBb4jylPJ2fwbKOAol9uzdFDCxEC1ASFbUqXZWc02jn7
         btQz8gd/iMfBbMDq0HDRC7VhTHrOyrxm36RLGvEDVTPJLAYAGznlL2beFXn8jLDZHz82
         u3ZsPSNsYREGZkjB+tlriTC44/vKccDNsY2svyASclnwc4JqMFqsCx1e4b6IRJZrC7Du
         IHJu5BWB+Q0/4pU4gHJXz7mHswU2lccz266N4cPBMV6NrtGdZTUgrorCnRec5FPrukMo
         K0TvRrrNgfAj458QCjpjwNZ0Ar38Q4mu6y/QatWO8V2geVQ4Zx0YSc/SW9lnkA9B0R55
         vuRw==
X-Forwarded-Encrypted: i=1; AFNElJ/+qp0Q7Je0lN4UMzEpJT1583G6aiopnRV3KtzWbMbjLyqy5bS9e/s7b7FWA3l0CQUEltqsFM3EYXDeb0V5fzLo@lists.infradead.org
X-Gm-Message-State: AOJu0YxY9+Ck9md2tGbkx9gE4qCbK6HSDGnQu5fRNoYC0iGfuETznWUf
	w1dNGe1sjXM0viiWfi6tsoXEbFnb/vt/6imosemjik27jaM2/0HEMto+gfgkbvkSEPo=
X-Gm-Gg: AeBDieti4r+dexqRp3BIM1HrY2BL6RUixwW/4EqTSiYAN5gq0LZ8l2PyHo8puyk1GFM
	Q2vyQ7T9LV7d8fA/8RTldodPdfOtKb3t+wvrdIte/yUZDlDosflFXqKm6jyKdLtWh3R6+I6qwf1
	jRRgSoc27aPJv50+BngL2tAwrwb/QQihR3FJ83xI4FKKS8suPZrjGXjwjzN24a5txWDJI6u1y40
	2o7WMc2ip1TJne3ajWCDOeuABmrFqtlBwoB2ukCGhL11xNwDLWhROOfhwehL6PopebyxQ0WKAks
	e6Dgc3/74L1BKB8haudU0LsFgbVEEr83pZFf1a2nJutOdGQGgsVnqyZizUaEa8YlDL7y356dywc
	C0/xfzFnzdpLSE4aVSV03ySSQMzOEAsKzSJ3DYgo4nnP9Qfai3+7SZWHjzjFjvZkUYQd9x2RFNv
	s1HThfcPI2Lz9Y/qCafUphZKI/UUX2mWbNKl2qP/qcyl/bv2nG/wMwqexDhRbVZEu0Us/7QHcYA
	wTGe3hLTfivwAOFr3UbuL2c7ZKR
X-Received: by 2002:a05:600c:c0c2:b0:48a:76a3:2b9b with SMTP id 5b1f17b1804b1-48a9865ea56mr172953595e9.17.1777986832975;
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:00 +0000
Subject: [PATCH v5 3/7] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-3-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=okAA+Mks+tiZ1s4Jc4QBMMHkSt6NGOv/LwbI22GhCddZCxVtABSB/BDAqOsUu9MonRPBBkxDN
 jHgz8DkXtR2AxY0TqFa7j6ljCUuvR6o7fs+Un23tC7Mas+3rVYEJtuK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061355_112623_925B6FD3 
X-CRM114-Status: GOOD (  14.16  )
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

Sashiko identified a potential NULL pointer dereference [1].

The dummy stub implementation for devm_acpm_get_by_node() returns NULL
when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

However, the active implementation of this function returns an ERR_PTR
on failure, and the consumer driver checks the return value using
IS_ERR(). Because IS_ERR(NULL) evaluates to false, returning NULL from
the stub tricks consumer drivers into treating the NULL return as a
valid handle. Subsequent attempts to access handle->ops result in a
fatal NULL pointer dereference.

Fix this by returning ERR_PTR(-ENODEV) in the disabled configuration
to correctly propagate the disabled state and match the API contract.

Cc: stable@vger.kernel.org
Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..d4db2796a6fb 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -8,6 +8,7 @@
 #ifndef __EXYNOS_ACPM_PROTOCOL_H
 #define __EXYNOS_ACPM_PROTOCOL_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpm_handle;
@@ -57,7 +58,7 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 							struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 

-- 
2.54.0.545.g6539524ca2-goog


