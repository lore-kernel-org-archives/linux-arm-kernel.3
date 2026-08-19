Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE21C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFRNQn9+IiCFEpwSAiKoW4qdoRMCAiZZVu4dsGCqCeM=; b=UQvr6Jda/HWNjwO4OItZQVwSQD
	7UXTMZhxLt+u1fgDvnKIv+BiLTOi51FQaLHyF4L3Mqg4jY3M9Ap8+ymdT//M3qUEV1O2Okt8sDuva
	QgtFaeNvbbxNz2BAyAKn4eiDn8y7Mnus9NsHKt2zLY6DxBEbm2o553+FifZmib7kP111un5nh5SG8
	qF957lrZhxvZEPS8pZ+iagg4C+RBIkUKv5H76xfwqnn/1p6vajocaOkXUB7M2s/0/ZKStDen2W8ea
	zxZ8sg9aIrOxD4XCatWgzSf4FpAHFs4qAKH+mJJ1ZoG5XbpRWZzVrPRWGoN2yOC4WKbK/SfAbDs2+
	qoDnSgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjvG-0000000AGQ5-1AFn;
	Wed, 19 Aug 2026 17:17:54 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjvD-0000000AGOv-3HJg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:17:53 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1954893a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787159871; x=1787764671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VFRNQn9+IiCFEpwSAiKoW4qdoRMCAiZZVu4dsGCqCeM=;
        b=CBpCiv1Dd5rQvOYVyAC1fGMqFAZu00NaRfZq+9VuIn/h/H7DHM2MSGWCQTljUVn9a0
         a6hKsWduDvHdt+9MKnHddRY30gIQJvn1T7JeCKfJ+VEVJpc2jkdOyz4nJ+qfnl+2/R8R
         Yuk1O4LyHFrUaLBJK3Bakda+5fAlHJgE2TAo8AUVk9/m3qElPTZdFec+5H1HZqZ838Wv
         ftKktD6pC8tXGaeH/PWK9hKZMKdoQomChj48ZGaJcKGX8KvbVenavwWcrpiFGBVzLBaH
         0AgNZMJpq4BBS8oL8XAuk23v6zrc/CBENBct4T3LecczzjQoUkgax4LmF/ypcD7hcpn+
         XcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159871; x=1787764671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFRNQn9+IiCFEpwSAiKoW4qdoRMCAiZZVu4dsGCqCeM=;
        b=rT1MdnYgrcYztK/gJ21SsYbafPVKBuTpeJMXioIriGsxJXtcUfBDZi0TYd/teAdLOM
         HmUEncqrkar6MvAgUwwaqFefarlUlRwwvTpw47NyiMN84MxWzg6Tw1LDw8ud8Y43KyXf
         xTgDE75Sv9X/NHu67gxzbPJxJOJw3Y71P/aBFmLy+BJwWffrt1yZVEnv8Fom6b7KkT0K
         SPkfff30A+ja/S57sHsZiQcMytu57lEDDJbuWdFI4LgIRdJbl8n/i97Bw5jtGln3s0My
         8XkRxaOIi2QLYJaNsz8j8Gum7WzvAi/2OqtobRObuGjQYB3VVblT87VRHQpRBOBKzATO
         hq7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrhwxEbm0u3r93MRpcA1UZbg/TKzGrlQqYO9QWQWFemk9ozhWJOCjI0nwzc0228m5ICA0x0yjHnZw6BwQ7z+Prb@lists.infradead.org
X-Gm-Message-State: AFuF++lR9HaFAHaDsrroJ7Fm+h/zZJ2tdKywSaCbhUq/eo66eYYil6mv
	69JxemWIv4/0owQ1iTY2OynVBxW9eF/kvM792CFEVL88kKc+jmg0Lzi+
X-Gm-Gg: AR+sD12Y4VQl9Oq0urMFWQOjxvoMa1GnTxZ8S5SPnY8q8cJcWrDYEDvAAUnykF+1tmA
	VkDtdevc3TA79hyk4eqGlVwHvJRUgJmj7iiwSfCh09Hqb28ArNnRU/TagcOqfmu2Jtw5TAbFeu0
	9eNqulr2Y3fbPdToW7hW+OOyuJcfRuotzY6rAZuH8yIMQHvZyByXneRp+/yZRO8ZDgtOc0QvGeO
	JqxPuCohJr/XLTRZYmxa8oSvN63dMhazT90i08/hi2t25PdDnE5Dq5/xA0D14RzEhVD3W1Qgs6V
	gJCl83iUh6ocY5LSCaSVnafs2gGHp5oPPdEmfrOPklVV2TGWRvhIe8Kt2fvMO+fkgusGLAzKXdI
	2pMSvRV72H1CaFLOCaoC+kB1FSIHFgbtfO87zl98rjivuowFNisDQP2TOi4SunJTf1XDnmzigw0
	Fi0IuseW78ceFs0zojc8t0vEvs6VDyBOAMPbWrtb5+GQkKNRnpJkUWMd5AEJd8BPy6PsgVeEfNQ
	5yXoUS1x1zVmKqCVv24
X-Received: by 2002:a17:90a:e188:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-39580a50d5cmr11805598a91.3.1787159870492;
        Wed, 19 Aug 2026 10:17:50 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4cedeesm1482992a91.0.2026.08.19.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:17:50 -0700 (PDT)
Date: Thu, 20 Aug 2026 02:17:46 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/7] Properly describe mt6589 and mt8167 toprgu resets
Message-ID: <xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_101751_825376_83F17476 
X-CRM114-Status: GOOD (  33.10  )
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

Hi Luca,

On Wed, Aug 19, 2026 at 12:16:21PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt, which does not support toprgu
> resets yet. This series adds support for mt6589 toprgu resets with bit
> definitions obtained from Android stock sources.
> 
> However, according to its data sheet, mt8167 has 14 sw resets instead of
> 12, and the reset bits are non-contiguous. This is currently unsupported
> by the mtk-wtd driver, and it caused confusion between reset IDs and reset
> bits in device tree includes.
> 
> Therefore in the first three patches we improve the description of the,
> resets for mt6589 using the definitions obtained from Android sources.
> 
> Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
> watchdog driver that describes correctly this SoC's resets. Also while
> we're touching the bindings reset includes, we add IDs for the MMSYS
> resets.

This is somewhat outside the scope of this series, but adding TOPRGU
reset support for MT6589 exposes a pre-existing problem with the
mtk-wdt binding that I think should not go unnoticed.

Until now, using `mediatek,mt6589-wdt` as a fallback compatible for
other SoCs was mostly harmless, since the driver did not expose the
TOPRGU reset controller.
This series changes that by adding reset controller support for MT6589.

According to the MT6589 datasheet, its TOPRGU reset bits are:

  0 infra
  1 disp (same as mmsys in upstream)
  2 mfg
  3 venc
  4 vdec
  5 img
  6 ddrphy
  7 md
  8 infra_ao
  9 md_lite
 10 apmixed
 11 pwrap_spictl

These are the reset bits that `mediatek,mt6589-wdt` will provide once
this series is merged.
Therefore, for another SoC to use this compatible as a fallback,
its TOPRGU reset layout needs to be compatible with the above.

At commit bd5f485f3f02, mediatek,mtk-wdt.yaml contains:

      - items:
          - enum:
              - mediatek,mt2701-wdt
              - mediatek,mt6572-wdt
              - mediatek,mt6582-wdt
              - mediatek,mt6797-wdt
              - mediatek,mt7622-wdt
              - mediatek,mt7623-wdt
              - mediatek,mt7629-wdt
              - mediatek,mt8173-wdt
              - mediatek,mt8188-wdt
              - mediatek,mt8189-wdt
              - mediatek,mt8365-wdt
              - mediatek,mt8516-wdt
          - const: mediatek,mt6589-wdt

Let's examine the evidence for each of these SoCs.

## MT2701

I could not find enough public information to determine the reset
layout.


## MT6572

A downstream kernel suggests it has the same reset layout as MT6589:
https://github.com/orangepi-xunlong/OrangePi3G-iot_external/blob/b8a66e9bde91d75a8535dc6342d668efb6ab14ee/mediatek/platform/mt6572/kernel/core/include/mach/mt_wdt.h

However, a report based on actual hardware suggests
it may have fewer resets than MT6589:
https://lore.kernel.org/linux-mediatek/W7fWZU3pu6akI_HMTAWPGnnErv60QtTz-LaPb6OtGvU5Bx0Iekl4SxWB6mxBPx8cBo9q9Lg7t8dDzcyfti-5fTirEACcwCLhNAh8e5xoHus=@protonmail.com/

The datasheet is missing the bitfield for WDT_SWRST. 


## MT6582

According to the datasheet, the reset bits are:

  0 infra
  1 mm
  2 mfg
  4 vdec
  5 venc
  6 ddrphy
  7 md
  8 infra_ao
  9 conn
 10 apmixed
 12 conn_mcu

This is clearly not the same reset layout as MT6589.


## MT6797

According to the downstream kernel,
it has additional resets compared to MT6589:

  #define MTK_WDT_SWSYS_RST_C2KSYS_RST    (0x10000)
  #define MTK_WDT_SWSYS_RST_C2KWDT_RST    (0x20000)
  #define MTK_WDT_SWSYS_RST_CONMCU_RST    (0x1000)

https://github.com/SHIFTPHONES/android_kernel_shift_mt6797/blob/4c594e5fa5648dd9a8b8ccc5d609bb523f4799b7/drivers/watchdog/mediatek/wdt/mt6797/mt_wdt.h


## MT7622

According to the datasheet, the reset bits are:

  0 infra
  1 ethdma
  6 ddrphy
  8 infra_ao
  9 conn
 10 apmixed
 12 conn_mcu

This is not the MT6589 reset layout.


## MT7623

According to the datasheet, the reset bits are:

  0 infra
  1 mm
  2 mfg
  3 ethdma
  4 vdec
  5 venc_img
  6 ddrphy
  7 md
  8 infra_ao
  9 conn
 10 apmixed
 11 hifsys
 12 conn_mcu
 13 bdp_disp

Again, this is not the MT6589 reset layout.


## MT7629

I have no evidence either way. 


## MT8173

A the downstream kernel claims that MT8173 is compatible
with MT2701, MT8127 and MT8163:
https://github.com/bq/aquaris-M10/blob/ab0f5a519edaf314e9b537e448838ec9a4a9a3c8/drivers/watchdog/mediatek/wdt/common/mtk_wdt.c

I don't find this particularly convincing.

MT8163 has 15 reset bits:
https://github.com/amazon-oss/android_kernel_amazon_mt8163/blob/479f405abf2ee6c0f13688b8cf567cce135924af/include/dt-bindings/reset-controller/mt8163-resets.h

MT8127 appears to have the same reset layout as MT6589:
https://github.com/amazon-oss/android_kernel_amazon_mt8127/blob/8428ef2958b83fa51edd6de734c069455f00cd8b/arch/arm/mach-mt8127/include/mach/mt_wdt.h

However, I am not sure whether this actually reflects the hardware.


## MT8188

This is presumably a typo for MT8189, because there is no explanation
for using MT8188 in the patch:


[PATCH v7 6/9] dt-bindings: watchdog: Support MediaTek MT8189 wdt

modify dt-binding for support mt8189 dts node of wdt

Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>

---
Changs in v7:
 - update dt-bindings commit msg
   (use "mt8189" instead of "mt8189 evb board")

---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index ba0bfd73ab62..a05f8155b738 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -41,6 +41,7 @@ properties:
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
               - mediatek,mt8173-wdt
+              - mediatek,mt8188-wdt
               - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
-- 
2.45.2


https://lore.kernel.org/linux-arm-kernel/20251111070031.305281-7-jh.hsu@mediatek.com/
https://github.com/torvalds/linux/commit/a742d1713c34dff992d1273f614548d214ba1550
I honestly cannot understand how this passed review.

MT8188 already had a standalone compatible entry before this patch,
and it is clearly not compatible with MT6589:
https://github.com/torvalds/linux/blob/bd5f485f3f026225b86573e559af0b7254ef4184/include/dt-bindings/reset/mt8188-resets.h


## MT8189

There is no publicly available information about its reset layout:
https://github.com/external-mirrors/chromiumos-third_party-kernel/blob/a5153266e4c8777fac687e9009a12d32d946514b/drivers/watchdog/mtk_wdt.c#L462


## MT8365

I have no evidence to establish compatibility.


## MT8516

According to the downstream kernel, its reset layout appears to be
compatible with MT6589:
https://android.googlesource.com/platform/hardware/bsp/kernel/mediatek/mt8516-v4.4/+/refs/heads/nougat-iot-release/drivers/watchdog/mediatek/wdt/common/mtk_wdt.h


Note that a downstream kernel claiming compatibility does not necessarily
mean that the SoCs are actually compatible. In my experience, MediaTek's
downstream kernels contain substantial amounts of copied code between
different SoCs, so I would not consider such compatibility claims
sufficient evidence on their own.

Overall, I don't think `mediatek,mt6589-wdt` is an appropriate fallback
compatible for most of the SoCs currently listed in the binding.
I realize that fixing all of these bindings is outside the scope of
this series, but I think this should be addressed rather than leaving
`mediatek,mt6589-wdt` as a generic fallback.


I also noticed that the v3 link is missing from the cover letter:
[3] https://lore.kernel.org/linux-arm-kernel/20260809160643.33991-1-l.scorcia@gmail.com/

Best regards,
Akari

