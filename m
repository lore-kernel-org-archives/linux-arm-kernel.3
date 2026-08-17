Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25667C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyG2XouO94IC0oaowF4bLz5IBlinDO6829l+v8pLt/w=; b=oKw00L55Jdi3xNaTCUonstMvYD
	pJKZukeyAZ9JEXdSW+HA5ZwnX/E57R48jXxQozeVfUpUM8L/km+hTvwW076GkBc9nr5IUxkIKSwOI
	iwItcuQLvVu9C4MUFFqnUWSs55+iXF3l4JTd0f8WIj7p74+G+5j9ORelPXDtWy2LjZ0+0pSeDTdxO
	TjQBRDsxWFjLueQcVE+5cnOvzyEwpKtBPdGDsmPv3w6pZuc9ZE47ZftXptkC1dDg98vfyBHQxSiYc
	ggoScQk/OofS5zwiAEZkDUMNg/N3OY+nEdVJ9grLuYCV5lJjSA3foHNOhZYUJVrr3Upq6WiSNGAVh
	+9CVTVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Ib-00000006sos-0Fgh;
	Mon, 17 Aug 2026 21:55:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5IY-00000006soN-1tQx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:55:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so35639395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 14:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003712; x=1787608512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyG2XouO94IC0oaowF4bLz5IBlinDO6829l+v8pLt/w=;
        b=mCdbJqobsvEEuXnRKFugMp3Zm5vc6VteAyxcGe99X2AnObrTjwEe3ME0bmGHZn7jUY
         dwjTlmhxIQi2n9i2pJPWEfc2niEuH2l/WM+Idl4ClbSsOoDwBZ259bVCGHG/uHjOzS6d
         MM1b5rafgF1VGz7XMJpyzXr6cK40SD76gUSMCPKVgdpGyB/6Zoh5+iKZnchnI0OZAnnk
         VQGzP47iX97xG98QV+PjlQq1D17AA21EOY8H3lSnggJihDgLA6SK4GvQqqvD4WxE58Cz
         Ak511rVgYZ5Q5iwp2mDMXe0T1xoAVtNSD/Tl+tsuA/uT1lQydZnULaQMxDYWzJuObURy
         jbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003712; x=1787608512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyG2XouO94IC0oaowF4bLz5IBlinDO6829l+v8pLt/w=;
        b=LPHndxFxuGeQ6+nxRhaKNMfbfQaiR+Io4vlqDBwlATMigA2vHdYunk6McpWvFFV0g9
         xl+logTDCKttQ5KtIbjYm7Qpo3AyxHQPUhWOwsl4+La9+/Jvo+9M3MdACB5rsVFLeobN
         zRJZCnvL3udmgyG6erEvutpiBzVYu35j0HVxaxvSmZP0YKeSodWpVUuUcpG8zgjjxJ2O
         Z3pEPUrKzRnIqCrJ4upgLMeDhIsDcvBdmLJvoQjAQ2es0rFR06aIEu99WusBVELqeP2D
         bWmDwMVx1a6BKvrFyvF/Oy6MbjDhJVuJruviiCVHlsPUVz06M7QU9WsDg0+1VjdKNRZr
         03Sg==
X-Forwarded-Encrypted: i=1; AHgh+RqoHvqLZHuAIQeYdBEoK7vLO+wPB2oS323N0y45ZWwi9Fnt9zq69jgLcg5N2ElDMm2qntYRG4s70vmg4nIjaMo5@lists.infradead.org
X-Gm-Message-State: AOJu0YwGY4fyFXExw8E8Ztye0x7XJgKmFVze5zoz/GWb+wVDtP1D2C0F
	D6In1D38SMA/vx9KJn/BFno8S4mhmp3ygDsNXR/zSBpQV9sgIroJrKaI
X-Gm-Gg: AR+sD13bpDygGS84DIM5lxmdohq9XpH8kjfQwp3Xn9NbfkZ/U5dZ6Ua1tQR08lleJYj
	3rtBo2F5VKjPrFJah5VnNeCRkBBICbOF2w92fmHgjhvvpps0GAcMAQJYM4sGghsEKMyIjjU0akm
	dVjWMXF7cfsDDD+584tCGED8539l5dYj2V2cF68DjCIqgX4NQ7iqDo4C9f2Mvei5uqX3X3oR1k3
	8EDt1KebjWvdOUaJOp04lPzaUfxqV8QH5GSHVKkP95HxfJDJlvNw2DH1tKrcC893DGdILdNYg98
	wgQYgneukbvOme22J6Ppir/iPJZJFegD8TpatcDe/z/diJid9RDJu67plDfByloIBjDyekkGuPt
	YGX2fNGH+Tv2hnXmGiOjpJCixzvaraVUcnbbBBObDIe987YpgcNNjQC8OAFprx4RVI4tpXH8mCr
	xyfCTG9XyehRVqVgZfjeH6tgvv3A2TRzTRYQ9CBISKWFcPEc3O5rP5y8NvkatfQNt/bsD0JSc4q
	GjZB64VJL9L/JQBlFFAjCXKMe2mTx2Hr5qRY8iDg0kc5x+DhpxX+oiRwbeYTLDjCzAFFUeiYsCL
	8T3kVj2Qdw==
X-Received: by 2002:a05:600c:b99:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-49987929903mr398757195e9.2.1787003712299;
        Mon, 17 Aug 2026 14:55:12 -0700 (PDT)
Received: from localhost.localdomain (85-118-76-205.mtel.net. [85.118.76.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309622525e9.4.2026.08.17.14.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:55:11 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
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
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
Date: Tue, 18 Aug 2026 00:54:26 +0300
Message-ID: <20260817215428.84740-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_145514_533732_A01DC52A 
X-CRM114-Status: GOOD (  14.38  )
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
preventing use of 5 GHz and DFS channels. This also affects phy0.

Add a device-tree flag, which allows affected platforms to ignore
an incorrect regulatory hint from ROM, so userspace can set the
correct platform regulatory domain.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
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
index 930b700b73d0..5f235cb9f3e5 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
@@ -59,6 +59,12 @@ properties:
     description: Calibration data for sub-band 3 in the 5GHz band.
     maxItems: 502
 
+  marvell,ignore-regulatory-hint:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Ignore an incorrect regulatory hint from ROM,
+      so userspace can set the correct regulatory domain.
+
   marvell,wakeup-pin:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.55.0


