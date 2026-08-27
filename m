Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60C2C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQA+MbWA84U8xUhabSSJVM6HHDc0tjYMMoyc9Az9yO0=; b=QodKUFX+WM3hQ546BRlAr3ov+u
	kfee4noM9m3NhuWNlD3tCfC5F3d8v7L03fkBaHL81htqAZ+4jxD+UWrMeZBXduBX7vnhm3wp09/Mv
	0MA1AbUPGo/UHYCWKhwvwb3Cjf1QvX+7ITJ8AHLOGYh6OP5aUnoeQec8zR/5e0r29GpNv8j9WjG6Q
	LNGcgdNgxXBP2/Kikd98le2JyOPiobgSYonXicQ0bhJOXKLIlQymoKYdcFUO0VeqL5x9ctPi/lk1v
	5voccpwQnDMkG6ohX9pOCsZEbDFWIcvHZ8WMwHp2lV2RpmfGwYgUzJ+H7dxmdQiy5I4L4tQR6jd+/
	qy68hWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeNw-00000004XND-2MuQ;
	Thu, 27 Aug 2026 17:59:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeNt-00000004XML-0Ei1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:59:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-482e4998d28so76419f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853567; x=1788458367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FQA+MbWA84U8xUhabSSJVM6HHDc0tjYMMoyc9Az9yO0=;
        b=JSbomkfVyE7619ltVRdC1P8tMuOigyMPBDkfDM4JrCLmf5UW/YWdqvU6g9IhZHjXUV
         e5QHSMFLZDJfk2gW88OHMJdMu37IGzpImbtF5GxrJVIaXRSptMEBkmNTMIuA/PGRyHHw
         +AiLsx1zVi2DMV87qLmJIgtgAk7uTzopx94hvl3SRfXtsmAkx0H7cWRG3gHY1tvjHdsu
         bA48OBO4w2CLxzkeWTgTWqmYKJ7koW2dzoAeMaUNDeQ3i6aF2qZTDR39avjDWKmb1z6l
         JNpN5wkXuFnNu37AviW0fpylAMF31S2hG7mM7dYPADwX4d9hDrls7tOOpMkkVhf8fahk
         d/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853567; x=1788458367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQA+MbWA84U8xUhabSSJVM6HHDc0tjYMMoyc9Az9yO0=;
        b=F7dNzqSdEGDR7tkJk9kWwSRU/RezBfPBjUcSKziwd3zrzSnMRnH65IjmLriHuJKt1U
         z+NniPINVpKtkyvRGk7J01HriikWl84pzH0ACTRJj5hJbt8pyE163p9Pzmjx2p7ofmoM
         6hP/c2PVCrJDhushawLGTu8SFxRHsVnV7LE6JJmzMJm5Eh5x08/bpJdukmKXwWNxbKiQ
         yLeyYb4C4UwyigcrENrfuMgIl9p8y0/qXb/9P6TXrGhYJWEOq8DTvCp7qEPbvbBpn1D2
         EzF2/mnSOz1tZNi5EpzFeo2lsJ6SFmSrzqZVe57X+gahtMOg7MRbyQFfxZsE76KM/4IR
         Wt2w==
X-Forwarded-Encrypted: i=1; AHgh+RrTcUss8fzUdbtYguJZ5kqMjqaaYxWOnV0HnDGXJlatBQaMDGts+sSQEqLXaKLHYzGd592wsk90hS5EqNtU/MJT@lists.infradead.org
X-Gm-Message-State: AFuF++lUwl0O+HgBJ4AlTCy6xFxT3zBnhMXiYDEUil3lBllUmn748P+W
	FB/jdtM86jkId0M9B5boTApWxO3Hf66sVvmykp67wIOqUnE5sZ/rmGpV
X-Gm-Gg: AR+sD11OIpar44bRATFJCueKbhqvzYbaZNh9hwaOHTVQlGMrN5A4K4wKmyLPqLP6hbA
	gTCfwupbTKFAFuSWMlRHWYnjduVOqt6xvKcQrYsQNVoyrKylW8o5NLZIDaZqRgUCWqvJaJ3FjyJ
	jpXERClvQHnLJiAl4KcxXydJPr1kDJbkydBtnuBZ4d1+aLFv4BLECDNeEEmz2XmwMwpK20OPv86
	GZ8uMYCIKrod/RZLPFSML5ea6hslcFcqT5Qn+IYzJVkaL3uQPFLWdImEiqw8Dsqte7u2OOytjvl
	8vzsjOo1ifQRCNqGWmQm6ZVpUYxbadhZ6H2PnW2KluZkU56SPwXiXm8kV42zeOKXsdXXvOPw6v8
	FovyI5m50QUxWFDbleIMJg2r9WQbqtQTWaWbGyXrZQm1m+MdgH4dRB86OKNSJxCjqm4jOAURyMV
	SqNsf1MfLba9u3Hd8dhMLNlBVZMWT83OLEP6KOC/QIYhiMZtusvh/j22bfu7y5oC7Ip8Kuhxtaq
	HzoWtPh4cqk/EaB0x7XDCfAdxkfeBPgnGXTXWtSkSz7/TJGANf8ovtdaqom4kOd
X-Received: by 2002:a05:6000:4810:b0:482:e451:681f with SMTP id ffacd0b85a97d-482f79c9430mr708273f8f.10.1787853566950;
        Thu, 27 Aug 2026 10:59:26 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9945sm10272342f8f.9.2026.08.27.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:26 -0700 (PDT)
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
	gvalkov@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 20:58:48 +0300
Message-ID: <20260827175850.89395-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105929_123434_B418FD93 
X-CRM114-Status: GOOD (  17.92  )
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
v9:
1. no change
2. drop Cc: stable
3. drop Cc: stable

v8:
1. no change
2. drop invalid tag Tested-on, replace it with description of the fix
3. no change

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


