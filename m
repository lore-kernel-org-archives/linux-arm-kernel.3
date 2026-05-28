Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3E3CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BekxfQF8PLQVYHupI67TdA6JhqhQbbku1rpfflIBCq0=; b=iTNrIUdJksz1EcNKzaRHLFZq9q
	6z3gLDxWUrOItVz4pryLp6Mgd1287JckOoTO4RvmAvx5pGVuBhQogKiGfvvzQ3O5HmBvmSikyvR34
	bUgKWyhSvEdoKmMqdZ64K6WLklU18lD/g9m5zB8B3gH22Q2VkeUNcfwWWeYRRUYiVssifFU2+cGNZ
	iiId0QsOh9eJnRvyGLJulYmcJs123V9EY6coDFqVDtFWdCmIvHX1u1v3eLRTr1g3pySU0KTR876RX
	MqH2BbGLOYLNwsCPcnlVp1fv10Ta3NWxAcWj/kocbVqQEsnKSoldRR/1Q9qmOOpD6paKwOMMNUSE5
	3g18w8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2R-00000005fOK-402m;
	Thu, 28 May 2026 11:36:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2G-00000005fKp-1z41
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 11:36:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so66964035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968182; x=1780572982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BekxfQF8PLQVYHupI67TdA6JhqhQbbku1rpfflIBCq0=;
        b=PspT6V5OrGIeq0VSl32+FCRfORroe5/qqMg3zIoOOTdsfHbFJ1jVhec0+ocRp6P5+p
         +4K7QgL5LVcuuJuRSJ2uMH56+e/hycEY/AHxRp/XRu7dDcbMiQ9bTRSaMemXS0C2cAWN
         sIiI2mbBRWQoaRZ69qtZf5w03CseTI7nNBb0giI8nDo936zdPE3HAsK+/nuPDk+gANPJ
         0pNFe5MapOklNU9Fk10eOJHgwhr6SYJ1BR5QLzTNaZ9peP0inYFx3oFAIhvmlrWmAvqv
         OtHhZPeVNyQZhPb8EbGbMo5I9MafQ5MtE0XwQ+0eGLb0+2KVwghZczYwHf9PQjCFmHeJ
         hF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968182; x=1780572982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BekxfQF8PLQVYHupI67TdA6JhqhQbbku1rpfflIBCq0=;
        b=dMMEQwRjqLF2ODV8ux15K+Vy9eSbIo4ORRYEgHK2WS0Vp+LdOQGVjctDs3xA3+8BCC
         6FqUx+OjsGDknm6f8xRqv0jSrBT/7NlC92FSrLnKOkgjJe8bs0K3ZZs2KWGye5Q49PV3
         HG6NDRyfPBDX74UPUUHYaiBHrSakfSP6zocWQux/dhzh81+cy+K2C4/YNeSxrwLbuLdx
         TNLCaf4NZK6s8shvUM34QDS3BjP13uvtMoxKr27gon0exkJ3hHG/h5n4g13Avz+HgNiF
         qOI1SBcLzUW3qvUm2ojz0lxer2ZXYC7cgs6JBI+T9DvQeAHrL+EOVZ9hOuIhuU25DAVN
         Ji/w==
X-Forwarded-Encrypted: i=1; AFNElJ9Qr0oUEs04K1f43XXutQxGeccoVv694MpoO/GysTVZyDaPaBGkYyk6+Jerdv9LykLDs3lsHt/Tr2foPX0QXV34@lists.infradead.org
X-Gm-Message-State: AOJu0YzWhin7mwMeGpxDL4SEc1dg6CMs8ZS1xD1wkecrkdTb3oyvmazP
	5v1fuM0Ha3Ezbx5jEWnOQ2PTmVmvpfEKnjht8PaZoaGlGyDb6jGD93LN68kL1zZSI5s=
X-Gm-Gg: Acq92OG7s9RHckgfI2wuLUM3Bxue/pwVa+ZSSjt8rkfEyS8fo7kyou/cZJ7p7LLZFk+
	FQ+DgXHBzkKtMoPOVlCS5YxekgjfmGVv1KZXbFNeRGfkyWGM3sGufXkwNtVHbu1cnikB22qhJRx
	o2hR5KScQQNgtmrOJ8IcYh40yF8m4TF6m5QnBEEaVY1pzu9+V+qdJ/dwlnsSH8TzG5fXuZSrGza
	7PyECuVBEAJyO3NFVLlT00tmoBJ/IR7/ut8MdtSVPOGcDnpBj7NJS4frSHQ0k+4kFUX+gdj3T2N
	Stdx/wkWL6d3Hkdd61u1lYE08eQALbduxTRv3Jbfp7PBXZEiWVWHtNCGgjpRe6EydRO9zUvdKCA
	TTWvXlu2odcE/inaf0WnIu3jNqTDZg1qozAVifexs7jScTxQfUzJW0Y2Fs0FKiYaWoK0kPdmv5H
	bU8piuwtFWCZXv42puLX063ITZ7Vb2nnkDZiXe7DMl1YImx+MKJbfwUhAtbWRkaMREqxLIpm0Lp
	3aIWvgtGWJHm5/s0Q==
X-Received: by 2002:a05:600c:3ba5:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490947b0929mr17354425e9.12.1779968182422;
        Thu, 28 May 2026 04:36:22 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:16 +0000
Subject: [PATCH v6 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-3-b4d7ce57594b@linaro.org>
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
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xJKlJC7dGl0wGAvaj+do2NaPXo539auehvyu06PLQZg=;
 b=/RrV08zJwcGs+ddtnbcR46GfaRC7OfWZyTRmTT0RYZwhRTifb8P4BFHNCQhv5h1Ki92YZBkoZ
 NPR7YdMiLPgBcKDzpqdf42dJ2N6zsZtFSV6gfm3ESwzL0rOq/+LKlIW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_043624_529229_B19C54E3 
X-CRM114-Status: UNSURE (   9.87  )
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
2.54.0.794.g4f17f83d09-goog


