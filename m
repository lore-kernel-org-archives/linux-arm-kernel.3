Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEF3CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKla0beewDRf+y6czDuhAfCVHpAbSKZ3cp1Ezxdtm80=; b=bWKY4y1kxid1pemx9+cycNGN8k
	odecFdtsS9uRO5TZ8w4qCJzdJ6f0MSC4DHtv4BlABHVChLLf7Ri+8M3pLI4k6nARJywsE618dUe0R
	mZTkOTJ5YEZxNTfO0LWFqAD6VV94jXQAqEKr2382ona/xz3LJV3D4/nT+yQq9ymcZHyOlZJPZQ5UM
	t4utX6XT38dc/+98fhaT0RHdIMyq7KV1T0RqoShllF01jZjScL21cncihyS8ma88xwD7DtI7W6q8b
	FMZoUFK0X+Kr0fAhcIVuits40lkdabmTlSnG/DSrGC7nAqrQYqKFePrpuJeVUSb+mrxC0qBgXEOmd
	Yg7zufyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7m-00000003Ajt-3Ru1;
	Fri, 16 Oct 2026 14:41:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7d-00000003Aem-47YN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1523675f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161684; x=1792766484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKla0beewDRf+y6czDuhAfCVHpAbSKZ3cp1Ezxdtm80=;
        b=Yonx/kYVDftb/tRSZs8EYtY+NVm6Pxx8p14jzBUixBwVdwb2Q+iaEsT6thznch/JaY
         10jhleQ/KKkCbmQTK6897tB1rKXwNnKLqYXQ27RHM5khb1G0JUVL7vVwpgzevYEDRVlq
         psO5t3sikzxFANXO8zozAVDJfDb8FO7GxBfjGoamO0a85PqmXRwoinZFnHzhvJH7Uo/s
         kyqClE+dFb9ahuQxJnCzrur9KqvsJdGvOAXUlU8lYYZbAoJmVIql/fLXQeVtRybp4vVR
         VFM1/IIWmgK+Ck4vpA3i0fNWH5VsLGh39PpfMiJyA+CovBTw+DDJLmfQqO0IKnmaXgPz
         WDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161684; x=1792766484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKla0beewDRf+y6czDuhAfCVHpAbSKZ3cp1Ezxdtm80=;
        b=LnqE1ZFgMUFillyhrAOu9lc7jrmscYXQCbT5dj9oWYJ5girA1i1RmbxXUOE/MRbgyK
         40+kWcF3Fm7sq1sIIiug8fxyMzEBxtACVaou8KeSC/5mh4ZLIoaCtV8AW1sU77a7mcD2
         WNPHtZ0TUGKqxWYxEzGq6OPwWpcq/YPBKJVC0gH/SgmBGKQX40p+65BwAu/SYZehKxiA
         3uK7a6/6yOnLGwYp3PbKkZ/Qfe2Dsq9XRr1yTnpw+bI2QzdglOmIuC6m+K12lqB29VBy
         OslhG8gz/yPpDBAqLdbigVr2pUqHGBpzfVSGGuu1yOR3y/4Tv21A6f1SlUpu5fvK67eb
         GCVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6nXEEb//i68QGAlgGP8prvSPndDOqjUpyqEt0jfpD8Y05SXGWiRRtEX/fU6jPXOCxv1du7+Kb/lsoGJ6V/fzW@lists.infradead.org
X-Gm-Message-State: AFq9FYJeBhfxAPF7C2Q+c7pCyRgXaVyetMmIf3B3+qOXF2iGmcghaztk
	0h4alKg7MMle2yMkndKETJx+N6swb6prBkc/PNDtyIqlrDc2h+9dpNCr/96Ia7xhXnI=
X-Gm-Gg: AYBFou1aPDj21pyaPdTXJm5ZpLL9XRLymZKJgkMFID1w++QXh4pHFJA7TXPeCJSWeDX
	vIyQkzAcBp6DDVFqB3AiT9eq04Cf5Qn38f1KKqyb8ARCc75y/+c/DEhKNqHL1Kf7LSVTLggde6X
	8JqldMKTQykPDyOg9kWs2aCXgPt47ULcJsQ7WPMwXPfKtBNc2WSrE6iHflAsrn4Ql0dYptiOCVU
	zRnEcCuNR9CeSOYQPC7XRo4NjpniDb0ermxmea/UM8yykrE0s7FLvdvg12XltaO/FQpeUGBORz3
	+VTIg4qliAZnoGwW8qQISTkAu5ZuvfiTlFxXz0XXpkJYsI1CsR7yoUqjnzcolscRfOojg0TSnbI
	QCMm/xCl8d3M7KUC02opnyhWA4D2P0g3wx7dPVB1aOShgFUNxJTMxAzqTgXnpbc6C3B8Z2usFd6
	/0ofnmbwocDV0Gz1BA0IU+r1Ky8KlyvynJ9VXghyzIHlM39tEuh+T3Cyw/ubT/eThn7vlGd4i94
	Vv2oRanftOzEWtgQCykHEBb4M68mVfqdXa9jSy1sasBczruZY4zFkmSTpF1KL++5i0wWw==
X-Received: by 2002:a5d:59c9:0:b0:48d:f58f:c91 with SMTP id ffacd0b85a97d-48df58f0dadmr11842710f8f.19.1792161684079;
        Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:23 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:17 +0200
Subject: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1087;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Ldmay9QwO3gg+IGIDPYY4zVrqDjxeT9i+JqWgm/7kgE=;
 b=66GZw7iCsiX/A3jlcZvBstNeIKCIcwPkl/zB0PXA811CviVeXsTSD5ExJbsaK9vOJ/ACie66C
 jOHvBGugEGNBh6gznhogp46BBqamrLpOy/a6hSFeItYsAo2Cv4BVwW0
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074126_045856_9426B086 
X-CRM114-Status: GOOD (  11.89  )
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

Add devicetree bindings for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted in this SoC.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindings/pinctrl/dm816x.h
new file mode 100644
index 000000000000..15aa15bca9bd
--- /dev/null
+++ b/include/dt-bindings/pinctrl/dm816x.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants specific to DM816X pinctrl bindings.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
+#define _DT_BINDINGS_PINCTRL_DM816X_H
+
+#include <dt-bindings/pinctrl/omap.h>
+
+#undef PULL_UP
+#undef PULL_ENA
+
+/* DM81xx mux bit defines */
+#define PULL_ENA		(0 << 3)  /* Pullup enabled  => 0 */
+#define PULL_DIS		(1 << 3)  /* Pullup disabled => 1 */
+#define PULL_DN			(0 << 4)
+#define PULL_UP			(1 << 4)
+
+#endif

-- 
2.56.0


