Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357E5CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 20:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=; b=SA0i3LwRVBLVj/
	iPXMzepwxG45ysLkKim6SH287QpE3WwpJ1zd+6rGS0KeVgwpVfB4j1Xt+atm97AvB7b5IT8M88osI
	T66JM3rMT9mfyZJJ9Ooi36SSxljmJc7WAR+0QHN2toQCopcJ5jMo882PpczRPdE1X7Bbr5nAk+54Z
	Qebd8R0zvehaEQkD6+H5JheRRBbUtA+a9nZs5BP7KJpd3NntJ8MsHh0xuq1t33KzrgAA+vSldyZet
	1vBStBG6MTWfUhpJiimzXBysyat5xeYF0uv2Ir4kHv8iLbVPkgGp8+NnbNu0PGD0D6EJPa4kc8E7C
	R0XwT1T2RyrPkGL52x/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjO-00000001MM8-2s0E;
	Tue, 06 Oct 2026 20:25:46 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjL-00000001MKc-1rmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:46 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6df93f00f4dso1494277eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318341; x=1791923141; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=VjMVbxq/3KAYHJ4ogiwzK7TXH8hXvJsUUmc4BNLKBrCZhNxujgL8XZ0DRxjjn6vfVB
         Auu63FNoTjDrGleoRsWnH4hxFqdbc4vjPewZwZAwoDS/7khJ11d+amdkdVufibGtgo4Z
         5TycF9/mwinGIKvAzrj7JvN2MMWfLpUTih6Mk870Eoeq3RoVItM3JhCKe022Dn4eUtYk
         C6lWditVyU7MTSw7ZujaGAxKi2AzOTXr4LpXiOfKJw+RrgWtuBugvH5169Tyi7K4YCcS
         7bQzqbZmwo5JZA3yyY/dpA/Ncp3u45aWQNKzkWxffHoktuHCki6VPuMCaeFd4p0up8Nl
         rCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318341; x=1791923141;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=SSYYX5tbDa6zYK9T4TTsPrvmG9frVPXFuYliS4KSc6D1QOJCyE9wQ2Gsm5Ym3oU7wO
         Ukx/ZFLt0H2ZDV5MLrNOtgtMn+R7dzNnN8FYT7On2lcwDv1H6lzx67f3//FyAkg7cE05
         VO2ulSBWa42IY3lSTRvQb/+2rNcbuZrWP7sK5jOq0YSmIFqB8m+ixfo25TcPcW4TURYA
         dgF8MRFE5tN+baAOcfHLZpX7FiMtIwlPLnpFxT4AYWW/IrU3wAfYL9q90ILgc7yTxOdf
         NGFfKejraHpIi2WSiIbeuxvTRaNOZVSV2m3PNwrsfv20VJw7/0+OuKmEqNtWcp2DtfRX
         pC7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFxIRojMlu16CIGAKSkZm6N7BcbxsZi5qaojBeSQBlWLezxvo2MyXAJimAP+sgA2IbjauxPlWwuFr9UDTzIpga@lists.infradead.org
X-Gm-Message-State: AFuF++nmcfgTPE97zD7Q95ukDTiPb3LI5rtk2spkZ9/xjNoXHFTS98+R
	sElZ0HWqO5adv/bcDtHhbPN9eLB5+ADdjif+OpQ6fUBAAv9FyL2aaq6+jxik/o8ao1M=
X-Gm-Gg: AYBFou0UmQjxIEjp2CqB+Eq3+toUH2OzTx9eBALpZOAb+zVWtVjfcyhLtDXXxmF8BI7
	Gq2efdDIujmuCW6gYKkAVPLq+6mLonO2sDWbx0anJOtYJgty/FtxtWisCigotkIIrgTY8kr50PU
	2+IhykevcsuvzPowbd1v+ghExb0f4iM6PWsl33Vt//F/Bx13ZU3micv1zAv7926pRGS7CCYHAD/
	yKIcodzl1P5yk0UxFG6raqpDwMSjklZEDe1r4hGBQOjs3VRY4UoTmakoBLYusPwTYHVO4NN23bH
	0lxvtYiGw39EsbeYDxgxyr0kDQ2QqUqm2EUsbgM8GSt5gAJpC82mxq9cZccbRyCOIWCcUCNgI8x
	XxlgUi7F9qr7Irgv0Yua5LsLzY1kt3ba0K6XypGPweoKHMoTPnMKAzCWj6whA30FX6Yq2LdBDJ7
	hopyXAYFc3Y2dbAliN1KFXUnJY2VOgQRUOUPhY35HCaJoePDBSTyKJ27gSebdM3wxo6lI+MfFBV
	A==
X-Received: by 2002:a05:6820:80c8:b0:6dd:696d:b245 with SMTP id 006d021491bc7-6e7a7185793mr353926eaf.53.1791318341561;
        Tue, 06 Oct 2026 13:25:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply for Startek
 KD070FHFID078
Date: Tue, 06 Oct 2026 15:25:00 -0500
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQrDIBBA4auEWXfACE1qrlK68GeMU1oj2gYh5
 O41zfJbvLdBocxUYOo2yLRy4SU29JcObNBxJmTXDFLIoRdiwKQjvTDwW1cM9SZHhatzCa9OGzL
 eS6sUtDpl8lz/5/vjdPmaJ9nPsYN9/wF2kTCEewAAAA==
X-Change-ID: 20261006-panel-himax-hx8279-vddp-5dabebff2c99
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=pzE7TBtHaXQdTUaCA18apuhFLo+Jj6/WeoKJzFQFzDo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVkes7QQS6aQ71ndy4RUpYujm7OFMzt2sBzSY
 kEu4bXRqfeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZHgAKCRDCzCAB/wGP
 wGuSB/44mamJHa1OYsjk/6qCu9iX+nj2K3lZ+OPUrj2F/Tu1EPxYNTztwaI0acbMEtPAOin2fWA
 A8UERPrClUfDtJtQXleqD4fA4k4PCtaUDej9JuJpGH0hwuJm7y/s8SLzyqYDDgx8vj+fMDE9xFQ
 C8DBJBTejRaGWQn6OSrJ+aTu4QkEVuoMCMsKtLs3rsvMgLVaPz0bfKummw3fPVfhnIuG1Wqf9CY
 BQAhcSUE7ntQRjbKr1VUnFFZ853aN+Zvq9RG4Yd/9n8KBIejxnfEwMHGgMxKOb/oI4bLK8v/o7E
 n5On7Txi/XfsGkgGSlQtP53KKDh5xDd6iYFUeK6QSIK21wJa
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132543_827637_550D52D9 
X-CRM114-Status: GOOD (  12.25  )
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

The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
1200 EVK it comes from its own PMIC LDO, so it needs to be described and
enabled. The existing Genio 1200 EVK device tree also turned out to
describe the panel supplies incorrectly, so this series fixes that too.

Patch 1 adds vddp-supply to the binding, required for the Startek panel
only, since it is not known whether the Aoly panel has a VDDP input.
Patch 2 enables the new supply in the driver. Boards without a
vddp-supply in their device tree get a dummy regulator and keep working
so nothing breaks.

Patch 3 adds the property to the Genio 510 and 700 EVK device trees,
where VDDP and VDD share the same VSYS_LCM1 rail. Patch 4 fixes the
panel supplies on the Genio 1200 EVK: its device tree pointed vdd-supply
at the VDDP rail and used the backlight (VDD) switch as the IOVCC
regulator.

The Genio 520 and 720 EVK device trees are not upstream yet; U-Boot
support for them is being submitted separately and uses this property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (4):
      dt-bindings: display: panel: himax,hx8279: add vddp-supply
      drm/panel: himax-hx8279: add the VDDP supply
      arm64: dts: mediatek: mt8390-genio-common: add the panel vddp-supply
      arm64: dts: mediatek: mt8395-genio-common: fix the panel supplies

 .../bindings/display/panel/himax,hx8279.yaml        | 13 +++++++++++++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi      |  1 +
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 drivers/gpu/drm/panel/panel-himax-hx8279.c          |  3 ++-
 4 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 5d7b464a4f517d1db533b1b231f42ddcf4e1dff4
change-id: 20261006-panel-himax-hx8279-vddp-5dabebff2c99

Best regards,
--  
David Lechner <dlechner@baylibre.com>


