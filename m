Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB04C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7kfFCn+GNg9NumksCvYfbd5lgR/VvSMlydTU1rt7oM=; b=w6PaSgr1+jXyDJ7O7bTWymmJC6
	xvfvVSmV7yoz072VYGqDV5PvwvbUzcr5oo+yTEXOlVa5wTHpba8bkWiZWcdNcdTDVnuFNe4XAbcIW
	r1deJ0CwJnfBC00/WTjlh3hP+Ojr6TtNkZL19936TUK4Seyd53YXLttYVYgtny9NFxhlHpHgnkZ0Q
	REtQOe7GThqxOtM3NYwFzuO8bYYalmGNkFCxaZI5Xmg4g0zgtDJrzbKxdkclpbvfemNlWwj+88ApT
	16rZU+Y04+evukKxXb7qnCposHGneF3u16ubeWmSwoswMbI11j0kXCYM8w89SJLp/AWAUT+E9HEg1
	bHgzejHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurNY-00000002fup-3hhI;
	Fri, 14 Aug 2026 12:51:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurNW-00000002ftg-11D6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 12:51:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8425025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711875; x=1787316675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7kfFCn+GNg9NumksCvYfbd5lgR/VvSMlydTU1rt7oM=;
        b=Jz1XRdbCgWr+9z8VK3/4xi9zPI8KICEKBiSGos978sQY8wAvQg4w9toyG8fljUaP0T
         DE6R6mb96qhKR0o4ZVXDs7HKh1g/mEnywbH6KwBmxX3wWxYPNxZjL8cTapdwGDNnrZgI
         vFm25EfWuKpdxBBO6Xf5BP96QprwulM0exs+2tzBETIy7CpRdQhiEJ2ZwemYmpnrYenT
         VmZXEaQZQsRGMJwVgM/zx+CMFTzkCNPxKxuUdLCONWHRPUNleUtJOa/v0vNsPhmgPbpY
         JQCt9G4pCPyRLS3g196fpqAY4mx1hy5TiCD6aMEMaar1l1k/1dEpFXpfnFpyqofl0hzV
         YdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711875; x=1787316675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7kfFCn+GNg9NumksCvYfbd5lgR/VvSMlydTU1rt7oM=;
        b=VqnO2abTRnLcfaFVVNd3so9HQ1B/gQtKZPn93ehjVDXKIWnlBkANhdxud7H41Cd+nn
         6IFciF5gLkC+mnE3rSkzWYXsJpyD/gnP2uWpI2psq+3iR9X7+kmzKnCG8q1aoPbbqsv1
         ncbsOPJtvOHggS551UEpG8dPa1BLQzfBZ2Z7Plv4K0Si3pJOUAHJx1l4Axr9zAGpJ7Bb
         l8gS6ikdJ/D/0U6bR7MWKRwNrYAbLTwlcOkMf/bDRfafb7xkFdXjJZiXlifGsDj8hFFa
         XpuWzHFI2c9dM/lXaLbLVVudtqmRvmM4iwBubD9RLNSwgmbHetg3eH3WMRt+KSfom13P
         Q3hA==
X-Forwarded-Encrypted: i=1; AHgh+RrBeFkFJjZY4x1qMG5y87xfTBMaFRI9K30uAMPs1ThXqcrXJpkFGhZTkkVQtx6GBTjgOjE44RAJRFed6Iw+bCD3@lists.infradead.org
X-Gm-Message-State: AOJu0YyPwt/mjyx8iD7Qv7PnEXhWZqizfJG7UflVmAp5KKhtDqqcFsuU
	6YNmCVNwdxfTWsVSpsc9hpodjksQqhglKeI6aucFJGsOtC2fXX8zrkMD
X-Gm-Gg: AR+sD101ST2d2/WiAkJsElCwn65RVzCyUXbtAB1GHt2MFvtRBh6muJ0D3dyv9XT/UaS
	xNJ4sKjkwi0CPxV7x7xeVbHKX9torgGeXrE6IufOEEJiKBQ+v63H3fmmwRxxD0f0MVLpubT1YIh
	y90/0oKFWXOuiilKPCVkDSlpzyKWn1bQZNxiAa80W8zFi2Gs1Wt5suNu7y9YK2+TNbRFdUupwlT
	ubEH3neB+NrJn0WDzHBe2EoaU14+8a8O+yWSJ8tgydPKgcFB0LNKrM3H6svO64lmLac8fu5poU/
	G18MpvM5g1Jbr/uyK+S9YACBuXI1RYEX5UPf9LUHWIlJrRvs9CoiopLi0lUe12sUnWn3kgKA/Q1
	ZH3eh/yZiVP9AaEmFOF/6jwK0srxj6aXALDUBYCU4bgmT26Pjt/cLMCd4RbunLwmYY8fOXlCdEs
	Ykl8cjkzmiWfOg1JaFLTSfxFuJ1eicoaGiM/pTcwRloolxLHUyPac594G6wGav7iKNYlvW6psn7
	lgFf9HWJIBLKls9HwD//IxRh8/7S9/XVrHlU+5PuBokDh3Z8U979z/d5uqZfrckBA==
X-Received: by 2002:a05:600c:6986:b0:499:79ba:ed92 with SMTP id 5b1f17b1804b1-49988c5efe7mr59441285e9.13.1786711875179;
        Fri, 14 Aug 2026 05:51:15 -0700 (PDT)
Received: from localhost.localdomain ([151.251.241.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988ae8b62sm49727315e9.5.2026.08.14.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:51:14 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch
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
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
Date: Fri, 14 Aug 2026 15:50:23 +0300
Message-ID: <20260814125025.90522-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <anoYr9H4KojJv-aZ@google.com>
References: <anoYr9H4KojJv-aZ@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_055118_311242_C6864379 
X-CRM114-Status: GOOD (  25.80  )
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

Tested-on: WRT3200ACM, OpenWrt
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
Thank you Brian and Johannes!

> Just because you found it difficult doesn't mean we should accept the
> wrong approach.

I agree. Guidance and careful inspection helps reach a good solution.

> IIUC, you're using a PCIe-based WiFi card, and that's enabled in
> arch/arm/boot/dts/marvell/armada-385-linksys.dtsi:
>
> &pcie1 {
>         /* Marvell 88W8864, 5GHz-only */
>         status = "okay";
> };
>
> &pcie2 {
>         /* Marvell 88W8864, 2GHz-only */
>         status = "okay";
> };

No, you are referring to the main radios, which are not part of these
patch series. Would you allow me to also add the flag to them? Their
driver is not part of Linux so only dt bindings need to be added.

The changes here target the third radio:
- phy2: Marvell 88W8887 802.11ac/b/g/n 2.4 / 5 GHz, region US
- compatible = marvell,sd8897 works

I cannot confirm if any other devices from the family need the fix
or not, so I intentionally target the board dts, and not the include:
armada-385-linksys.dtsi

> Side question: did you consider Jeff's suggestion from v2, to try the
> 'reg_alpha2' module param? It might already do what you need, and it
> only requires you configure your OpenWrt builds properly, I think.

A universal solution is better than targeting OpenWrt only.
And unfortunately I have no idea how to implement this.

> I'm not sure what you're saying here

In v3 I wanted to reuse a flag for both drivers. Using a root flag was
objected, so in v4 I added a flag for mwifiex, and I would like to add
the same flag to mwlwifi later.

- driver
dev_name(adapter->dev) = mmc0:0001:1
dev_fwnode(adapter->dev) = wifi@1
marvell,ignore-regulatory-hint = 1

- procfs
/proc/device-tree/soc/internal-regs/sdhci@d8000/wifi@1
compatible = marvell,sd8897
marvell,ignore-regulatory-hint
name = wifi
reg

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


