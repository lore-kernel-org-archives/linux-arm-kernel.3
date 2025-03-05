Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76636C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytd3uDAUr77k/QvwA0I1JyX55i1pJLknFBSR7pg6DWU=; b=bbSFOtXhULa6+4MH6QMGpmfb0O
	iCTlzptBrCISP66bLxPo2Jj7fr30OxMsqSLid+SPRN71eTJMtLe+/qVYYJnHETPPZCbu3bvEAj6uj
	TMkT7MiJhJx1294OKoPiNxrkMIA7nP3oYLrcyJVN2FqRZY2FfL4kWB47t5r6UuMy1KPtTkFvHTGCU
	WlWwIjLqgzvIBfzOblAVWppw4LWgmyD1unKgj9FywVuIVA7q3G+AKx5IBXi06ugmQ9uv+vGcO/JD1
	riDqCbYqdEZb7/tM0AWpbVSwWafREIVgC8URjJ1TxIpNHdjSqXOWZ4sTXfnH7CxEphaxIkVsrm6td
	yUpJU0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjRu-00000007HET-0kKg;
	Wed, 05 Mar 2025 07:45:50 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjLd-00000007G9I-0NO4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:39:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54955222959so5215544e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160359; x=1741765159; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytd3uDAUr77k/QvwA0I1JyX55i1pJLknFBSR7pg6DWU=;
        b=hVgCr0ZI9QWYZ+x6u0ZaXTyqt4CaIXB9v1QeyWID+EOo4LZQ4YwGvp6W+doCx7vNWB
         BEPRDgOplCtxgMkIbJfiZQTq2d/S0XbWuNRz9qXFrU2dHnOEKf7jT/nBH3Jb903HAcUG
         0N07IlpRNglmDMn1gbpJS2Qefq2ECE1EVtVbL9PIdEKtLhE4i0r4fSnSe1LXpn7/2X7v
         O+r9NwRNOUrR8+JjyMiCb1WdefgXvPRXxeRvnT4QHwSwKRAvTLiY9mI45JwCefFIC2Ww
         AZZ4tbAX4TdILwmvB+RubvKuL3+0/aq1TBrpElg97Y2Qs4wks7uv0FCOiJTpukneMeIr
         Bj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160359; x=1741765159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytd3uDAUr77k/QvwA0I1JyX55i1pJLknFBSR7pg6DWU=;
        b=TeNlwbe43YeZw8xK+NWsCmd1kVZDT9J8vvbe5AJFrQ49si9Vnn/01KYf1Hw7iJI3SE
         3vT8qYkOZUvUcdYwX59yVfaXgXQMYPQ77hQ4owIHv81iYRjR2YKXxM+z3dnuqyiIuYJD
         KLdmG7l8ZJwsQsY8I8rQ53OGGNS7tmeqXeHmT2x6DquCjT/F9sOw8Sr3fTEA8vQSiAW6
         4Hiu7dgtYVujm26i+VHh923ad9Pusl0vH6W081xMkT3gWAxMhO7Ki1UAslYBuq7p788Y
         zAFGj/MyKs5Cx3VNhUPp9jnEL51J49WfI4zpkclqyBXvBRFv8m8Lp4RIq4l20iAnPen7
         Maag==
X-Forwarded-Encrypted: i=1; AJvYcCVFkAIj2PX0mIHRwJNtFXRXZ2SfIv0gY5Mi1vH+ALOX4gQGpq+GKCjNWbV24hbxptbZHmMmJoWhc7mvbzC4ihfh@lists.infradead.org
X-Gm-Message-State: AOJu0YzXIAcW+UT0V5Ndjq6PtjSmnsxangA0RnDgvgh1Cjc91Abw9Iic
	U5KYKX5+yDzI2t/CEuIemPb7hWhCLN4IsleW25oKxxe/aruHwJyBlfjXsUs1HOU=
X-Gm-Gg: ASbGncvmdXdG0z79HCjTAsDpHAjptm1EfrnHLR3YzS682DE63ouTFLfFG225PPVNftv
	NbYvtofzmaiaIGYcCb3zHmLFcGXdkLC95uz+wpIR31znobhL/6PCxwsUDZpHH9stelAFf5VVTir
	kHhE8zzCklSNqXcfhEbQ/1UZwXpa/i2eBdGltMAllwuaMfWOqDQX0WHrG4hXPStlF/CUY37buef
	My/sQ1EJhvaVVCmXEg+2LgSdVTxUqkoLG2+AF5aoYoYB7O5AzlyuPCdNc/XUvxvf75TmqJMaj6K
	3dDXHuuKy1u02/u+9ophuO1dGAPZJZ/yj7Bt2avHfmuQToKSfb4moV8=
X-Google-Smtp-Source: AGHT+IHja8Xqz27pMBgC+ctDlcXS+7JRihmA5ZDREPfugVRdHY/NUOad9X+cPrSfCkKGb0fC7sHjrQ==
X-Received: by 2002:a05:651c:220e:b0:30b:b7c3:ea71 with SMTP id 38308e7fff4ca-30bd7a65e82mr6645381fa.15.1741160359096;
        Tue, 04 Mar 2025 23:39:19 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:15 +0100
Subject: [PATCH v2 3/6] ASoC: samsung: lowland: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-3-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_233921_133727_B260E24E 
X-CRM114-Status: GOOD (  11.74  )
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

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/lowland.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 702cb4cc1ce9f07e55ddf9435b19c4691e0236e5..d4088b72d43c2295102d850197f8b9eac50d7120 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5100.h"

-- 
2.48.1


