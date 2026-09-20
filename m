Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313ECC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 05:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=; b=3+N+sXxWVeCRcsNKDJKIQczyoP
	uoHhCe6PaCiT2FY7Z0I62dFc3WMWSENGjRv/KLJ6/xfDW6KU5YlXotSK2agxTm64NF+9qDOtvbcoT
	eqQNgcqKae7OYxjqoxdWMk9BWI9hPodrHwOtOaa5lj4K52vd5FHNFs7oJyCB3AkNbrMVkGvk9HHI1
	4skz9DVUA9jpN6p2vMbXyj5lNWO2XOucNvEThIKEpMlAM4dS+BwLnkxd0XKTxa3+g1XhggR1Wp/MK
	Qi608nJExg0E2i6a8LseaodbgT3L9fbAHyVaPPfTo9dNl5kbog8AF4tbjQsvKYBmjayv+ewoP8PQ8
	3QPmAYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9q-0000000GwTJ-04LB;
	Sun, 20 Sep 2026 05:32:10 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9i-0000000GwOC-2Xiw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 05:32:03 +0000
Received: by mail-oo2-x06.google.com with SMTP id 006d021491bc7-6aafac56856so892866eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882321; x=1790487121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=VrEMooy88twKz+IrSlJJSuCEgOfb2SrGtNiUaBP4OezOTyIu97bGqOVD3J9tnWGK+o
         dl8OF40W5cFPc6VqDjo+BAmiO7V3FPv5HsU5dxElGPP430rikjH3cPbG/pruQNjWtJ1k
         xMT7vutXgjIa5u8DD84WDRL5TZfMukNqmaRDcWg4urMILlWStYyeptwDBVeEaQqvhGAF
         HOVKTulATdfSTnBGzzOomU58Tv8jzpVprugEeKk4rmo6SQMXtnvJBqeI54JKjox3RzJr
         2x9ZFiwRuXNS5U41kcQaqy3qL84v2149Qld0VsI56Fek9AtW+w4xUTcNYcUAjmbAxXVd
         vMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882321; x=1790487121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=UVLHUyZDIkhvtM8zdRw+PdRXcUY4uum3UU1m14vyg0sBzL+8gjtCv2d+Vvt5u8XuLa
         2rYF6w7NRwrQ3dKUpRCcZzNt2aamu30LLVl8MSSI+CBvt6e643t1xNfCjio15rHWzjOj
         bZ4nAnh3fgWqi6BLIy3as+PlrfC/VkP/dz37vzO1zfYHxgzBMldf8mPIPA1nYpnsvWEN
         dLmMEZU0h2BHHC9SDTqltL7cwWWzXtEKyi6ZYVZHHjVgpQ5mA44f9fwDPHduLJsXja5v
         +gHFOip4KZPSG8BSBjHgGXDLuS5XeqX1QzaT8mNm0nVOmXPrCoqRcPsUPILz9RNBIS1s
         IgHg==
X-Forwarded-Encrypted: i=1; AKwUvBxl6mQk7smaQH8Ns5BWJZc7bHbni8qg1FxZZBYSVGXdikuxol3RNsNFEdErXbd0gQkacQWvrkYTwbDM1uVJtFaV@lists.infradead.org
X-Gm-Message-State: AFuF++kWaVc1/iDUU03SLnFyA+9tOuISl3vLbyQ2Au9GUI06tuT8rxPh
	W2bdPD+ca4dwjF6geCq5GlWY3xavdGNw1e7uotfkV9HrqxTmQDEZ+kXA
X-Gm-Gg: AYBFou3B9x4GKFHVJoOyx8CkVHb1835SbvHFeZsAJgW4RdzW9YrEtRpDABUWBSV9cjX
	XL8IVZwfjgtXc7KmXuODNEXXp67dHHjTdcagKbc3tj291Sp7sfmDOl8PoS6TyMyis3PccWyZ1/d
	mjlDCQC5VpQ/CHE49kZlcLAKb2SyshKImh9i2gQtpCJT8Q8R9bZR4ivcPA/hAC5OFqjaKhaNSj7
	v6oAy8CqFGTDx/HbTRZXbSld29D10MwnqEq+Gs+oqCV+u9zAmwdQEwo4DnuPwap4wUbGZp5u1Am
	OoWGY69vNlFo5fAeCHme8OfVTYHnwwXrXljaSz4/YCW9I4bRbxSHh+gXbjOZx/8ZlVnvTATPvBM
	5pXkEi+BmUOrBUGTWFSL/mSZprs544B2fYzaaF9DYS196Kdp5T48WO0RVyzFVFRS6lDAAgm5wXQ
	E2umC2LDR6pWwVpfy5tPRsATk8YR8+cHYr0TJTPrggFctnhWniZiY3dEtpdBM80MgTckE=
X-Received: by 2002:a05:6820:c0cf:10b0:6cd:3fdc:6009 with SMTP id 006d021491bc7-6cd3fdc6073mr2569288eaf.90.1789882321459;
        Sat, 19 Sep 2026 22:32:01 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:00 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:51 -0500
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=Opl97KH8MrqT3zIoiO069ry22IpQqYaPkHHieyAt0MVeeRXmAV1cUFOzXcG3h4gqUISqz8ECP
 zcigdUcPK5ID5aT4XknZj1qigND/X/OZwurcQvc1nDaYdP5H9wRI4Y3
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_223202_656473_71974A83 
X-CRM114-Status: GOOD (  16.02  )
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


