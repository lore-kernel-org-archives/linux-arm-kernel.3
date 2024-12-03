Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBF4E64A8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KIGcxZ8Psy2FDVunuCyBKosiOVkthQlOppOTs772mFg=; b=lFLNYhIL0VHzfob6MABNyKARZP
	R4itoTZiLPJzhIcVKsJlhOX7bL/bjCXZ/CX6fI0nYS5J+DiamnQmbUhpuElu1F8O6DBxDFl8qfvUe
	OAJoiT+Yt9Eke3OAPWwbCZKTrIWnxtpQIGhtniK/xrnUmGYa3pTV7CoB4H4ySYpRzxzVRkzz+sARO
	8m5PG3UuxAROianxKCer5mdR8GAsU/i2ffSPcqN9Ho6O3aU/lFh4gDBCyaDQ0N4PbBHuouDjak0P5
	aA+rgbG9TVuobGbebhic/YPSKcRau8a/UU1urltG8fFAcRAEe4iVo3aSj/thli2ssiZCn5joQGwzn
	3yFJfKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISpw-00000009ayn-3dPL;
	Tue, 03 Dec 2024 13:21:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISZH-00000009XPI-08Hl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:03:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso267361566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 05:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733231033; x=1733835833; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIGcxZ8Psy2FDVunuCyBKosiOVkthQlOppOTs772mFg=;
        b=TDA9b45b9jxsSMy0d0T1z9fWW24i7WyoNkqbkKkwRurCYb+kDsJ3OcFxCmS5Kmfn7n
         Rpi6fqMb8HoVaxPvHfmKRuRN8eCRj3QWZc0q1GTouNnF12KCGyDr361NZB0U4VuG1quM
         F8Z5KD9muQZVCQz3JJcNnynCYcfinfV7QpyoKUwFbBdrjJvJcHzXB7l4LqDYbzo8/uBD
         M2qfSDWQqZTa4tWkslB7m/Losbe1+QABBfeYPfGkS7AHVPe69SmXkD9RwZgQ7yaO2vF4
         HDG4CVszmYxp+9dAt4lrUujMRBPgSIN9anRe41iZbToSTe1WqD3pOIP20CmeaYjbefJ/
         6rLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231033; x=1733835833;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIGcxZ8Psy2FDVunuCyBKosiOVkthQlOppOTs772mFg=;
        b=aG9wBK8Uh4mmweeeoVNiaWaFhVw8m4ymbdTOw7gyR/S+KV6ku6tEpUU2GE1uqtm/gi
         6iXxSwKg14MElecZmTu7hdcDYsW5rTiHdtBcKw07hQnu6OlHVT4iycMsPM5Kj6/Nrhvk
         l63Soun/SccnQjlP/yQd00Qgx6WQ+M1oRWsEkXZHXLJ7e4oE0u9KRtYPA3casfwXRad3
         6zaXE/PQpmH0WDRFYSJKGfmJ/17VRtp91NTVHwdgSpDRElVf7RRgRL2h8KqK1TojSx/5
         +SRdlRfoh9xXwm0Tgiy1VZgsOaAoci8RwuwF8Bf9bGiauBpaZ7wHtNT9hgWRZ63iXpfr
         0nQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPOcMOrvwHHn82s+DZjttDLojPpO4CUUGfg4twi346nvif19YGMe3NIOqA0CYlnIr/n+SCqdyaMLkujOJMM9uW@lists.infradead.org
X-Gm-Message-State: AOJu0YzoiOhPJDGUUTSJT9vlGpbXz2sCnbX4yn/DIGtjNQsoxdCW6G2i
	vvceS6K4lpNk3zTZzsSVGg3QgApXhKNd1cO02fyaZLehBJyyoE0GAhUEyCVS6F0=
X-Gm-Gg: ASbGncvNgkGvw/g6zsz5DPxgeaq/EDE4uqNdKUhaX9XE/Jk0XsaCbUvyVMInBJx78DX
	til0GZ7GhaJum0Y//8U1DH5RYT2xsxVGskW4CvhDpSONyA/FhJYIZMudv0+LYYKpm2HX0MCwb0J
	0aRpq0tJbfJG6+OgGHrfgbpN4MjEJMZ0Yw/pdKAzqp4qWJL1iGlu6Ex1DBoAcduQzKvPvvJSGEh
	GSVyLSwClU2zKVCuRDyzh8ft+8t6coSyQs3qc3DKCYqnUO+/ZsnDqLfMbBFCzaWqzCHV/jH97x5
	JKaJlwl8lE61k0PFDjvF50ftgs7JVavg8Q==
X-Google-Smtp-Source: AGHT+IEK4L2mxFtzL87PS4BcKmkcVwHyuFe2W4bjoaXvNg7AkfFZpDGSmmvKTSD8eht+D7KFJe38yg==
X-Received: by 2002:a17:906:bfea:b0:aa5:3ce3:7fde with SMTP id a640c23a62f3a-aa6017f0beamr7769166b.24.1733231033374;
        Tue, 03 Dec 2024 05:03:53 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6d7esm611425866b.114.2024.12.03.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:03:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 13:03:52 +0000
Subject: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for Google
 Tensor SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
X-B4-Tracking: v=1; b=H4sIALgBT2cC/x2MMQqAMAwAv1IyW2hTB/Ur4lA1agarNCKC9O8Gh
 xtuuHtBKDMJdOaFTDcLH0nFVwamLaaVLM/qgA5rjy7YVbzzdo+cLoWy2DZiPTUjoqMA2p2ZFn7
 +Zz+U8gF9KQ9WYwAAAA==
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_050355_066278_6AECCD5B 
X-CRM114-Status: UNSURE (   8.84  )
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

Add myself and Tudor as reviewers for the Google Tensor SoC alongside
Peter.

While at it, also add our IRC channel.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf1d81bd04a7..2039cc57d8a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9754,9 +9754,12 @@ F:	drivers/firmware/google/
 
 GOOGLE TENSOR SoC SUPPORT
 M:	Peter Griffin <peter.griffin@linaro.org>
+R:	André Draszik <andre.draszik@linaro.org>
+R:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241203-gs101-maintainers-9a24c8b220e3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


