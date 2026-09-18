Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C37C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=; b=3kMJh/yTYyP6fqDLd2yEOdasw9
	i4nqxRP738+nEs0VpUP16CNtrbUatibqrjJ6SwUpF97i5cP5UvlVD8TrjIkgp0bUghDG+sJygx0Va
	6xS9UIMqrHFo681pKNxy1U4XT+lBJDZTpEp1curzJKTk8ldX7OJ4OtO0QTAsVd4+N9CutcywsSWCk
	V54P/8O7dFu0u3MceUuqFLeX9DNh425Tj0tY5n+y0/qzeTk6xLVFGw0ycvhszwEvwCJL7gg721rWL
	iND2ltloD1cJBkr/2yKPrCU5Z7ao5PXR87wYYi4j7gOhlMGA3sPjbnMTW1jUHpztRyYIYVgIGjfbk
	7UXiIicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OD9-0000000DILB-393Y;
	Fri, 18 Sep 2026 02:20:23 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OCy-0000000DIDF-2AvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:20:17 +0000
Received: by mail-oi2-x09.google.com with SMTP id 5614622812f47-4c9a4910efeso75159b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 19:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698011; x=1790302811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=XKr9tg39iIPjIpb0YylC0jpLwNN5LyfuanZY9Ub1ay20VaO/f5ooM294WroTns4gMd
         5HWGDaQvhYVhQT3s+nzwYWJvzT7UHHXqLI0nPqtluTOhNPE1Nx05oUHBGUyu0opBgdV8
         sVuecGikRHYzdPvqEwW7SgtzDUPLmg2jCIBGSC1ufunTkaUEH1fn/NwTdzX1JweZU2eg
         gkhhf8JtPix+Wgs2Oich3zpBQUsWSfoqKD4LbDxmlhTtktKPXTdteKn/BM4xc98Bqfye
         ObG5CmbXQPrAo0bCr2Q1+AnzksGdTpp1LhTYcOmHGOn+9dGDSfez07N5N/T+IDqUf2tZ
         VRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698011; x=1790302811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=VIX4OCmx5PYfN3cPTbqbQZ7j2a8Cz3f010pqPUCJsHsNerfQGUXkuTeee6uo37N2s9
         ngVyfQhVr6vrjdZIWUzTJgAektqsVFRtOsA2OmRuIWATBwTj+W/CimIiHldji4gbT2Nl
         63oT6FvQ8W93TzExwRDcOgzYJOJY9KHx8Spnd2Jp9KeRZLDLB9/nmxhdtf4WiRSPrxjX
         8wfDdqljSaVpEl45imTjtBR/XY97636xqJxLmLX4x7vt9dsgl5Nbb0prOblh/MNN21yb
         suLIjtRb2bfikUmz/Vo9vWzgnlSHttR2ElNZ9ammenm+6eK8BlRLmlz9HbUmesptaPvQ
         WDbg==
X-Forwarded-Encrypted: i=1; AKwUvBzI8QB/EKXC5tVqSE0Jf5c6Ac3CNoj4OUAA9VK8hKa7YCxMBhkH6J1h9kdGdp7YqqJ5M/mKJgeoX1gGXp6lLqeA@lists.infradead.org
X-Gm-Message-State: AFuF++mACgEehL7f/Ude1pxmmzr3zqr4HsIUGKkHijrlqZxo2rLXTE4v
	dtid/2l5+g0IRTwaQg+ALQfWXWZ3NHd6COubbpF4DU3kftCDsTP6uW2G
X-Gm-Gg: AYBFou3CeaD31oBJH34KEb9vZ7LLqJUQRLF0MjVkI2QAj1DIx5yNUf2tPlCT/JvG6iM
	0KxlGh8Nc/cyhDm36iEVuATsl19ysLBVkN9VwXdn7xcOaEDNf1+SnW0IPbsfttjUFpEYGcUtzpC
	IfSzp6EdHUGedxwASKPjP+yL85Jqncm+1+iOmj9mckop7lmZxEINQwp860OI1ho373+5Y5zByoW
	V7J0SQMUPJAGhHeQ2Thw6b0nDitEJ7+idJ2rAvwO88PQsKLs/lKq5wBx22Bs9646jKjeASNXQvy
	aiEc9SI1MiCif3Fk4HuPZaW+oVEbgjQ7+KDJ+pLgmTpWmEIzIlKCIdkajcKC2MWN79z7PHSQqfI
	Wtn1zWyzV2raIWSQvHO6E0NgEX3RUNfB7q+wkrsYAP/rtJ1BX1oTGVg8o+RkFWyI4tpFLAhZWUo
	jzwNYOUfresDV8qurdPk/KzpPKlRmBTiczXrp6+mecLtzBJae/A6GKjUz+ayp+6333SA==
X-Received: by 2002:a05:6808:3094:b0:4c3:2e7:55bb with SMTP id 5614622812f47-4ccf977b99fmr1600319b6e.38.1789698011513;
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:50 -0500
Subject: [PATCH v2 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-1-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=miNvqU66NVjsZoTcnVnB/kgVEaxWAqjFh9azbHOFtnGSnkRq1eftd6rcrmBB+2/4rlXYfBEUw
 Zyvg/aMLPnkBOPbEyLLlzDeEXx4kS9ytIIdtF8pPiaejam11tPa+fMv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_192015_199989_74C50489 
X-CRM114-Status: GOOD (  15.73  )
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

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..41d7b3a67415 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16713,6 +16713,12 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0


