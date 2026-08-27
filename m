Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEC2C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fnPxGtE/YvJh9NvWxjMwiLTzPApsKlz9gccpke1iOiI=; b=s0zN5AFxmNVLYZAd89YOrRoY4j
	cLWTFWPsYh/HdJq4D6ahZfmvMvPaqeVDsyR6lXuNcrtw0++xNI0kXgpNHf2bBNRgyFJmuzpweWR6M
	Pacr1ja9NVzjq0cl/AsWb21P9Rx7n7qoruvNQa47EFjNlOo5DX2YQNNcMbBpb8lEZRbyX3Bs+YmiG
	8GEGyTCYNvuiD7JLPNK1FA2Y+BvRAyuEBxsQwKpIXH91R9fXguHrAurzFdE4ptr8Pb8AZhlnDYtqG
	qzEz1R4/Kedhs+QoehN+r/mL82/tZ0Ha837aG5i328QZiZiyC0qdDWuoyGrEaAgEl8/OH3SX80Ef+
	QSl0octg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZls-0000000414v-1P81;
	Thu, 27 Aug 2026 13:03:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZlp-0000000414T-17hS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:03:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-482f413a232so429699f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835831; x=1788440631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnPxGtE/YvJh9NvWxjMwiLTzPApsKlz9gccpke1iOiI=;
        b=oC1g06zkfVH8/pJKXQRNsxPLJdQTEGvPjf7c+o5vpGiE8lBQh/w9IhYLqfamVOntB0
         stlUvQ1cjJghQ07RWF/7/rE2xjGwVMRQRKcN2XGrgIEgaZlHXX2bAqAlqzPdCij/OpOk
         4FL4pcXfp+S9sXWxKCm0L2IqIVi79AGYFsI3ybNyQWHKCpQXtX02uWgzUDGYIx5tghcO
         Mqeq5emsK8WDTV779oFaqG1b/RDvYzn0exsfPCbMncdugrrkwKp0SuA8KRewb+V3TCO6
         rDS4Ze7g1722SbBj/T8q1ujhw1IltTB1glqN/k/konwC520zJ5YhqqY6examUrZFRGkK
         KPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835831; x=1788440631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnPxGtE/YvJh9NvWxjMwiLTzPApsKlz9gccpke1iOiI=;
        b=eyM/kufH+82YlP8ntUk1mHXIBS9fwzuDx1eMKCj4wN4Orcqw1yNVvtO9+3CuDNfLOk
         v7ZFvebKC9ZP8R3p6UsnFI3VDZ0Y9rXQapMRUj2YZFepAz37eOrecGRurESREk5Y+/kx
         b757LhsBnn+E/xZNbgYVHQUFRumO9fIh0zVuh/WCI5+zsd+cvd2nuDEm8kyMcZd0slqV
         fZKGMO1WzWp374lTry2rHeR31LRKZePzDccidRpR5mlt+NoIoZomzjhOwJZR2YMkQc/E
         FY+wCOOhBnvJxU/6gqGNj5dmhJsO3EuDjSPovqId60wPeTNLv4kH2B8Mto7untlxDuSZ
         lHYA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+mQCDEpGZukMEy10tdlPdRE8UcLzYn2SHsXIQDSvl1yEgmSBi+aOKu6ckeH+p6A3qA7kftmNGhvDogIAl9JdY@lists.infradead.org
X-Gm-Message-State: AFuF++lvpIGoE8HooIRm9y3sFtPN3E6E1fUtC6tHhm6aJv/I8EP/gF2m
	IfOk4Ytsrbb30T4YdrquXLj25YQrT4+X4cRW7VuEpuByJQ09f5VyiesC
X-Gm-Gg: AR+sD11miVgpwphFlSavWa3eydHi4Yc1fAAIFQn4OBV2PZduNPA25mDPNAQCpllPDet
	7MDFUZtFMMcR8ZLj6x5eLIj1VD0vo2j4UrzwygheCBicwfHZLXGTCObqxLgU/KPCnJxpV6JriCN
	OgpTeg2QM4CgJMjgMrVmRsFasP+1O2N78mYpU1LGcb3ypnccTQyUaQcPqnyrDBlUT149X6lviqt
	72/gVusfB+WxjTDLII6VoCCFS+BtyWBxuGVJqvhKEqYaARIiJkt/Kg1VH5IndlSbwzvKIhC+buT
	JZR/eK6gKCLKzLmXrWanQB91ZdKHX8qKofIFfzqtDt7XcalnqiWaN6ck3AA47pMVXEgyNNH8q3K
	DP5f2BgA+blLPJlRVNbdpGgIGcF1n+iHWTON2o3Xk3SQ2urgWGz+AzTAZ1kiGl6Hj+GzxKQabZk
	loSGZjB1mDfUAaGelpM9j9Bid9f5qtL7eZLOoZ3AbTsEJGGy/TIMwLOWS1sVGcflq3LmsS3MN1l
	IaEHcPCcCp7iYX1dXrwmXwHuwlr/AV6/Y+qK/fEWezlUSe/M1ohIKPEMvUpXMRNqoLKd4AZElw=
X-Received: by 2002:a05:600c:4592:b0:499:b402:6c0 with SMTP id 5b1f17b1804b1-499dc6eac3bmr172187105e9.3.1787835830323;
        Thu, 27 Aug 2026 06:03:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:5a8:737:d4a7:e53b:30a6:3c0f:1dad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49610170sm116081285e9.6.2026.08.27.06.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:03:49 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 16:03:33 +0300
Message-ID: <20260827130335.6606-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_060353_358019_6B838D16 
X-CRM114-Status: GOOD (  17.78  )
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

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add a device-tree flag, which allows affected devices, where the radio
conflicts with the platform to ignore the incorrect regulatory hint in
the ROM of the radio, so the platform regulatory domain can be used.
This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v7:
1. drop Cc: stable, the first patch only documents a binding
2. restore colon after Tested-on as requested by openwrt-ai
3. mention the added wifi@1 node

v6:
Rename flag:
marvell,ignore-regulatory-hint -> marvell,invalid-reg-hint-in-rom

Clarify commit description:
The patch series allows affected devices, where the radio conflicts with
the platform to ignore the incorrect regulatory hint in the ROM of the
radio, so the platform regulatory domain can be used.

This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

Rearrange patches so that the flag is implemented in the driver, before
being added to the board for WRT3200ACM.

Link:
https://lore.kernel.org/linux-wireless/20260728103536.25012-1-gvalkov@gmail.com/T/#u

v5:
1. description: remove tag Tested-on
2. add #address-cells = <1>, #size-cells = <0> to fix a warning:
arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts:183.3-13:
Warning (reg_format): /soc/internal-regs/sdhci@d8000/wifi@1:reg:
property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)

3. description: add info about testing

v4:
1. Add binding documentation for flag marvell,ignore-regulatory-hint
2. Add dt for sd8897 and move the flag there, I used sample from docs
3. Use device_property_read_bool in the driver

v3:
I implemented and tested a better approach with no board specific code:
1. check for a device-tree flag in mwifiex_register_cfg80211in()
  !of_property_read_bool(of_root, "marvell,ignore-regulatory-hint")
2. add this flag to the root device tree of each affected board
Currently this affects only armada-385-linksys-rango.dts,
because Linux has no dts for venom. OpenWrt will take care of that.
This approach is more flexible and scalable, because the flag can
also be used in other drivers, e.g. mwlwifi (not part of Linux).

v2:
Replace the compatible device names, which are currently only available on
OpenWrt with board names which are available on both Linux and OpenWrt.

 .../devicetree/bindings/net/wireless/marvell,sd8787.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
index 930b700b73d0..9f905ef5c2c0 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
@@ -59,6 +59,12 @@ properties:
     description: Calibration data for sub-band 3 in the 5GHz band.
     maxItems: 502
 
+  marvell,invalid-reg-hint-in-rom:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The regulatory hint in ROM conflicts with platform configuration.
+      It should be ignored, so the platform regulatory domain can be used.
+
   marvell,wakeup-pin:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.55.0


