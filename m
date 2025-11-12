Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C2CD13D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLVC1yr/nkYxv5RM5OgIDp9oj0yRWmQJunkOHBdVjz8=; b=nAhersrCpqrcMYmOb9aCBBoW84
	AscQHtGSpiQgKuEG0nC2yf9rZLdk1O1ehp0sQ2tGDkCQcTUQ9Lum7QsVXKY3fJYYMcyp1w1nzbNDW
	jBt5Gx9pYN1TqDe1KkpEay5Hq5O7G+EMOfgfReV7mEjkdjo+p94ut+FWintLrnK+AujjERahcEE+b
	6w9CT3Uz4Nr7Pm4OxyAKxwjsMJrgMPYsLH0N4YltKg9Vi8YAhut6l2ho7zymKg8eHA6XZ8W+kJZaW
	cGGPxBNnTMW+BnA5TwHgqjfs9KJtULqfKiy6LA2LzmHaG1vEzUPPquDngaYfwPiLU+ztUf7+w/hCj
	VzR3DUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EG-00000008LKr-1ZNq;
	Wed, 12 Nov 2025 08:29:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EB-00000008LH2-1t29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:29:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-429c82bf86bso269708f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936157; x=1763540957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLVC1yr/nkYxv5RM5OgIDp9oj0yRWmQJunkOHBdVjz8=;
        b=gx4ZYuEolqXHoBe2ISh5LSrHuVbDZA1dGLgsu2WSafOZNlZYOYk1Dp6Ams6kXOiOA8
         mv7Dgcpd/olTJfdG1k5wzBbGO68UMCpId98ZV0qajDaztatZ/DGjC1cLenOCB537fJ6N
         RpHu+by1/DN3RiRlaTyeH4yLfNWGaTuuLxE7TTsEmkmtyZ70TyF5YK5aA7hfijCXZDdY
         FRk3lm1dOrERQv+PAS1ebU8Fm+BylzwUikigDv/HV6p8y6SCLKc8JPkCgQjoSLT9IopR
         KnJSCVG8ns+jHaYX6zjFLTEI+aplw+9Jf2swf+2aCyAHCD+f/2joXHmhSYMxT7crpSKd
         R0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936157; x=1763540957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nLVC1yr/nkYxv5RM5OgIDp9oj0yRWmQJunkOHBdVjz8=;
        b=gBRTcKlvfxUTXCf7AvhEyEprghlqmrdB08KNKwHRGOpou8QdPZFV7/iFO7aVzjiSJj
         IZVbLzrDas398jK4gmbKpwgPDrKC0Fkee1lCkKj6DdvaE1PZlGy5IU+dvXqfzZa+qeMr
         FFMeiaF4qyz1VDHFl+nKVvaZwpzJQDrMxMg7H1c2V5jaIZ90L/4QKhCBR3Z+3AOcay3V
         cAxKa+gOZcbfwRPET5CmHcGLtS2MCsXBoccTVfH8Rg9glsGSBENtrQuwfBoX7UulK3f9
         DfT38U74b5UFT5fEZjg+P+ouGsqEJTSfav4gmZjk/Mk8M7uHjq08L1BCQkiNyppYrnB2
         2S/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk02XhWfqt2iA0fmk4kHkWte+mnfswKgCupd6WVHkHjjSGfex76nbGUVGs61W3wp5uv2UAjj0Z47k5R27bYqZA@lists.infradead.org
X-Gm-Message-State: AOJu0YxQEwO0uWqTGwZzpQ9k6EgF3fxFfGnvRc02WcaBaeYMqumhuHmn
	b2+T6QALQM2IviQyHhWHl6lXzIBA9okX+TU6vyh8RuLC1XiajsLHp7g5N5KFclDjxD0=
X-Gm-Gg: ASbGnctDoVxuxLpblMb02fWaque6bXLO2HfiaO7/hYLevVCfIxqnINtuZehAgfLAj8K
	V4zTV5Mkgr0ztAnhTs8urq6+tD6H/JOa1DSqfFNwKvOrB4xd5Hg+2y9qCXTWn9iMfWQtU8Er1mQ
	bftozIWfYXvz0zicms9ZNzcoo64mZejMXVnebYil2yMeUYdpg+Ysdi2hk4kIomZms5CNqagw0sR
	VWRH1oF7mWIhw3D3S0P6lo9waUS6gHO7f3D6RLxct6O7IlCdDDnAInOgryjBpv0xDC3bpWqDo3G
	sW3Pae40tMr/pM4YI0wtBhs/VrXLkLndxpZ4MjMuKdmr1Ug2Q5OXbw+5pLP7161LhNCqX80+8p5
	nhbG49B1cI8r8oHn8Z9TJM0uEgdu5beuW5ZTgD9aIoLkPbBfm9ohbbs3yPIQbjrcFoJS751ZCmY
	TyrxxA8Dwdq4NVOwh6n3t67v4YUvgeXwYv3w1ipzP0AGJkEXxr9NzzlzXFDU95CAHmNRE=
X-Google-Smtp-Source: AGHT+IHFW/GKxKCw0ILsA/SJT72Uei+QJ38/wrMr3u+rGJwwJXDKwY/90elYIzeiZ134HBFWWuCaMw==
X-Received: by 2002:a05:6000:40db:b0:42b:3c8d:1932 with SMTP id ffacd0b85a97d-42b4bba5627mr1678878f8f.23.1762936157486;
        Wed, 12 Nov 2025 00:29:17 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:09 +0000
Subject: [PATCH v2 5/5] MAINTAINERS: add entry for the Samsung Exynos OTP
 controller driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-5-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=980;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7rM6ipANT27ulRQJdHPgB/KMFu8QO3gc2s7q+k9b64Y=;
 b=Lurn43cxRReGlo/BJV58dAB7nj1wlW2HtMqDlBqeLRMi1dZmQeHSO44u6JwfT0f2fBaR1GlW3
 aM4MGm3X4kVDqVIjmlIkpfG2dt6YhPsVYTKuB/TqOfTIpnjc+5/W5gh
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002919_509579_2B9FCCE5 
X-CRM114-Status: UNSURE (   9.71  )
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

Add an entry for the Samsung Exynos OTP controller driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab00eca640e02d40dd80949986d6cd6216ee6194..813a098475ab7d5371c811020ea022f63d1acb35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22775,6 +22775,14 @@ F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
 F:	drivers/mailbox/exynos-mailbox.c
 F:	include/linux/mailbox/exynos-message.h
 
+SAMSUNG EXYNOS OTP DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
+F:	drivers/nvmem/exynos-otp.c
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.51.2.1041.gc1ab5b90ca-goog


