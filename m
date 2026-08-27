Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5D4C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3toHgNm1X+G4rSZPEb0QgIDLq/CBLmilUIyHXoikIUk=; b=nofjadjn+o/Mn//a8g7C78kdNx
	BDXMEcryek2Jb9JimzNMI8IseJeuokPijvG/1Kjj2UEulywX6GKmxwm8/0Uh3UpRmvMPD5c6kXx0g
	xUg9i/HTPjXaplCrx//CcmgSZjSPl/edsZ6DUUADLdOVUA74CO45Cew+CtdpDO8EuIg4aas6FzdCY
	Otvxz1mdkJOlKY5MlaZoqQUYMRBUWKJPltFxjOu0H+BtGQ0pr2C60I+jhe6rZGYv9InaWn3S0gjdL
	YkJY9fb5ViJ9I4UdYcvd2xW8kdUFR9zeiFU9xpvxtBqaOwcZsspL0U6Vv5nGuPM1a+25IWHkOXSwj
	3LD8S/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdlb-00000004RqQ-4B3B;
	Thu, 27 Aug 2026 17:19:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdlY-00000004Rpv-3xIa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:19:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-499840a2575so15507045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851191; x=1788455991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3toHgNm1X+G4rSZPEb0QgIDLq/CBLmilUIyHXoikIUk=;
        b=pITDCMODFRPxcy/QQ7X7JCFOl//tmmxFr4A4w8bp7F77z/eFS2H91w8wcusND4D33D
         xfsRI25L6T4KCYncSfn4TzJrod62hbTUDIjpF2efGbiTWH0PrMnC+EQAakvQHoxWFHhv
         IKDjjSfFSz611SZ2FyOGctOQe/ycqzTcTSAwOnpTv88FbblV7xcCqeL9BYeE63yhovi2
         65Qjn7Ps91M9JkkC+OynMPf2ymHLPSUX2gJuvsC/ZT0KL7fC+WEbjkx+/xdODhTfUuYM
         wFvrWjPf/zjvtjBfyg9uQGAFqFfBTQk0XZzf0TTVOE4Ts4XI49RCIZ8i67X8FskvEC+w
         AWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851191; x=1788455991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3toHgNm1X+G4rSZPEb0QgIDLq/CBLmilUIyHXoikIUk=;
        b=bTmWWzjb7CEC7Nc8tO1oLI4xnUG5ate7+kVCS98PW+vEolI/F3d4wqIJLaoYnWnW2U
         vv6QxdscyEM4Z6wOmyo1mD+fhC/T5zMQWSBAqSZkWbGS9Ft7hPeMZrYfjabMxIhq4SAe
         GRzzV6q6FI2DLSDLjD58/8YEh0znqtVYDtlYy2SmevSeov0DsvfGAymCMh5MYsUy79lK
         6mEYXsVP0QZYMjfMwRJ3vyqGq8f/BQTE246eLCPerD1phvoKVt5hZb57g4HdePXUFZgx
         9fQbpDXS4VZ0L+Br8n51QKtwCSjH7d8QSAD2utr8MRnlkixvr45sDF1lhBzze38Gi0dl
         DoJA==
X-Forwarded-Encrypted: i=1; AHgh+RrXZXKIV6Q4xBDjqqTVsf+qTj/UOX3LIlS6HHdKkuyy1kdVphObCiOxTTvWS7g8wOKtdQxi/bJHtfTRM+U/eGf1@lists.infradead.org
X-Gm-Message-State: AFuF++lnpQvjgqTO0TcavD/CpUHy09cD63C4QhNeTOnrqY9F1VMWxR9J
	9FiaXmI+aB9fv+H1AVp3Shl6OFbO7XznqTlJGMl1rsh4SXnxIyOqp4g6
X-Gm-Gg: AR+sD13o2uqg/EW7/zC0sXIYZifY5BYnyBh/U9wMgfSaXpLdAa3BHk09LNFpfDdAyXP
	gyLm4lMa7dbkUdSm13NVFZNrEUll2PBeIQ3XULfPKLeOpxmX+Bocy1H+/a0knb18SrUUZ6QZxgQ
	Fzc+rsnhretTJ4RgVCvBaqJLuf+AB7KwSmWN2gPDyxleB1DbCAcACy+TC9PDseb7j2DQdg9flt0
	H9BEm5dOvNZJnw2+8kRO6gTx8A/+42v8AotRCl64MddmkRbzAwkrTUE13QvnvRMD3zduelzp2OE
	iV1zGf7yo0OM9M3HGEmNtY0ArJBwbDZ3hNvDCiw9LEflFHfSi0iGjnRgi+nStZ5azJp6KxcM1hL
	S2t05FL1JH4teJMo+Niei4wFz+IpilJSJGH4gcNbaOEePO/hNSsmGzM1eFmqVoYYIT+h3FpyOIG
	/wj7bTcSG1KZ06fAtdBCwHhMlViNx9hx+XMHlqnuEobPYyeQb/9LwDVMfrqYIHDfrVcjDIG9MdU
	8EmhwgGtlCtOhqUrrZsKVhLRN3vLQPtoPrC/UfDAUB5gtUVCZLHCPBnV1nKEzM8
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr5523315e9.10.1787851190868;
        Thu, 27 Aug 2026 10:19:50 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ad16262sm54259995e9.11.2026.08.27.10.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:19:50 -0700 (PDT)
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
Subject: [PATCH v8 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 20:19:35 +0300
Message-ID: <20260827171937.28878-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_101953_007752_A3633182 
X-CRM114-Status: GOOD (  18.05  )
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


