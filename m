Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CB8CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=; b=1yepTbahqRsOgPQkHcKyh7oX+G
	aneT07criWizfDxnoN9xmBMASzW4r3fEG/7RUhgsp8PJ2F3uDVLW3fb2U5kFAC3VU0pO0PFYxrW++
	uY/QJPAgree6Dqrru0x59nCAJt6BbphPtWWnYxnVqj01Lj8PAMoiciN+9KdGDmpxvLd9Veujqge96
	hpv7UrkYs7+OE+FXtz80yvCndCkqn1wCl079fZ6XTbUFQ5sBo92vej2YIFUNSRc8huysg7a+HE41X
	aNY6Q9JuxeN2/T0Ao3D4X6LUWiLMdJc4Kn20KpPftNwpa1J+L29q0BxfPmOWYq3sp+TTnqb+7mjD4
	KsxuRqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIPk-00000001dK3-3Ft2;
	Mon, 28 Sep 2026 20:57:32 +0000
Received: from mail-qk2-x01.google.com ([2607:f8b0:4864:34::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIPi-00000001dJW-24lX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:57:31 +0000
Received: by mail-qk2-x01.google.com with SMTP id d75a77b69052e-53338682233so5723121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629048; x=1791233848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=UsOa+bOuQ432yEmf1qXpEuljj6WxMjTX/hp9UZdVVGWm1IvcXg4Z8jWeRjQw3LBndZ
         jd15nO6/OtMDY/ZkuBfvx6Ic1QVaEQDIUENRMMk45CBuO7mn9mjg5/hJE3FA1/+k9HfA
         lTfiFpxc2HMAoWjIARikJRoAGOxp/iMqMZY4QUi6u8ixqO7rN8nNlzBLCkrw38KiQbh8
         VXWl8wjP0xXaZ2MP5c5aAYz06AhpvGc+RZkNJ04I9trLSORc/nn6BwiaZJT6zujmqyg+
         irHiodb6tYTlC66pMCp919KGiLiMuPEB6iVSrX0hMrCRCFturOzD3VckPuAlOGC6wuz8
         oLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629048; x=1791233848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=gMLorGVtF2gBY8vSS/W3juLJYxRWAmncpEO67gFT+Nd9QACBx5+tXYkXs89shOpwsw
         7sZexi0mSv6fhszORqC7JrFXqm+HiSy/R99vfbS31vr3tywXGCy5jgOIi8bhN7LSoXsv
         XprrrUa+cDILjg8ghresuSXz1WqTUx2xBYetw3mQyZVi7GLKVuR51lpfjR8HUn4GMV6B
         l+Dlw0DGJHDU6MeqDlXLsj5zTUhZr22DKD9euXh049uYzxk0ny+c9Vggw5jXVtNGDB92
         HUkTzAvxCc6Exs+wuGMa0aE3OjfjlVtn6EgP3ltKM+/PAh6HY/KSkARAb5InE05/CV2l
         y/vg==
X-Forwarded-Encrypted: i=1; AKwUvBzM+61rARzGbnrSPtCDatZg+iiiMq3oTTQbUc3S3+Vhz6v296T/BVNi9OtIMMKIMnDLbBkZRDHAEXpfVpStXcfK@lists.infradead.org
X-Gm-Message-State: AFuF++kvNzVmVv+Ts4Q+RI9rRtqB2R/UPw5suy1jNlm+z6qjvBXdsrRB
	AL8Vc/xTqgaPXOft8Al/Fegl2xYRHEGGjL8wUiyjdhoIP8KdByEbW/dM
X-Gm-Gg: AYBFou1l+o/nFiAD8MeFwvsXTNoVuKe1PZe+e6aHMwGtYq99Tf+cpoV4vK7JuDFC7jI
	Fs4lZeBsW3vKhY+Okerq2CzvnbupAMTzJ4FihZjAOrrWYBo9A31hayf8/lQlrNnJbPGQo3evzd2
	rxfDB+xox/Q9VCVZ28Ds2GvPPP8WeSsglbe975Kd1H4A3DnyQJlP5L0e4fNCfsqELnP/arIfNKo
	YxxtQsWTvSO723T61BgXM82V6fExw+CHd1Bl1/sJ/FaEws3DaOSUMnX6LyvcVyXOSp+A85kyjEH
	OOPXqo5d1fr7zme4PMrx+FHnSFoKKgfUk0H4ygbAocBD5Tmao9Bbj2cD0Q0MymgqG2Zjr1jsMrC
	J2JvmNmVzd0lY7X6wiw6ztCulrZrdb0p9LDjv+FMWNnH53Q7HPGL+9PcuBVCqiMWiMF5xJa2Bur
	JxO0UHELJTe3B9pHXA0w31PrqC5x8tQnjDA4G5WE/sW1ODY8W42BFn1TNXkhfkWyxgML/PG/MYt
	+uImEXK9gBaiYJNYh5mkv+eiC1vOXi7C95AaqnOk2Rnj32wMQU/KBMgJ8sC+iDgnsuqAC7KqmI=
X-Received: by 2002:a05:622a:258d:b0:533:2daf:c0bc with SMTP id d75a77b69052e-53357e0f58bmr10788381cf.0.1790629048636;
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:19 -0500
Subject: [PATCH v4 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-1-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=2834;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3JnyJKWel3/w3iLfxdhp8EfzhB6f91NxerOyNOuEJFg=;
 b=mway+9YBw+26uBdu0PB7mYGQXaUGyQC3x7jQ8ufOCuQmaNxG0dcH0uwuFpe/vq3Gqb4sxO1sb
 8lrBzk4tK1SA9ZB6wmkNkdeNoWX2sQSqFh2yshcMGc2zdcb1kWiQ+rA
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135730_582719_DC2D3254 
X-CRM114-Status: GOOD (  16.16  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index 72294ddfa5b7..c8cef3bcb7de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16715,6 +16715,12 @@ S:	Maintained
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


