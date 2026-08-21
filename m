Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738FFC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 01:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAuxUNTNCwVmj4WdPIptKNiVBZM+Hp/Ts4jpkKyFySI=; b=dlHY8mFAhNLFB/SP49WRu1K6fA
	gRMaH3qjkfAgMwZnkh8C19Fhqe+m2ZTbxYO2EdDNVkJFEEzqceowze7Z6m9FyMeLSDd0A131i7J4a
	itQKAPJ4EVKA2RjirU9AfHWPwlgjVYOwJSeLluqDLAG3eIqCl1OHryNJAQ5w5usM6i/0tVMXoc7+2
	GFWWpTOSs92NvL/1FE3vEdoXoT94+4bZzTSoCLCcZKCbgKcjTZ54l3RBosxTpoLor0nE495U5U5O7
	4Qch4FCVtGOT8+fRl4059UBtjmtvR6QRclJrd3mO66VefQZTAXFO5z4VRmrTABI4dhfsd0BYe3sRy
	0C7r8Z+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDkE-0000000COuV-3VV6;
	Fri, 21 Aug 2026 01:08:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDkB-0000000COtn-3Rk2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 01:08:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so976067a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787274505; x=1787879305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAuxUNTNCwVmj4WdPIptKNiVBZM+Hp/Ts4jpkKyFySI=;
        b=I3y3XQ+T7TWoTIZ+iAFnvrdGtr1VqFls415TEmBUAgtPcTfv/KJfxvsWfAGB5VfNLn
         Gly7IlgaGQhfCGuSvZuekGRinKisncpcDOeYC9GPSk9odDYf6nBBMeGKR4sQoqO5+HNW
         Lw52zEiJgkzWMkC5R2yrzE1+NHuQN9Wd6L8ODaYbDMFYNukzovB4oyKyXWnhSqyzLf9X
         I2Pb1XotT27NURmjrgvl0BkwsxKXHo6bbcAysKHMLJ5Lnr/+eqRGsL4q8B1sh8YQffOu
         cWTW+QY++hgI7zj7g9xd2jVQc4H8+f4j11Zkk7JJHsG291bl7IW+M+zoM7SZp5UxONXV
         pndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787274505; x=1787879305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAuxUNTNCwVmj4WdPIptKNiVBZM+Hp/Ts4jpkKyFySI=;
        b=Ctkeh39/QN7xD0FVtjGNlvMa/ZbcBJVaG4tlBvFC8wNDwrAan8F1UGIYVwHDLrMvci
         LbWXfp83dwCczX+DF2uz80d+14nUyjnRqvGv8lY1D1/oP+pz4Yu4X483R9NKI/2posHt
         QB5qXsBhWyj0ktyJfsrFvFzQRC6k+3TPMMHj7wGqW6TNseOX/sV3a/aMUopUCRSXgXke
         CRAeSzKqN1Mj574TTHBCnM6sORWmz90BV3d5olRqy+jX6YJQKnbXhNqhBzeoKtQ9stKH
         5kHyO1vofR3Js9uwRLjrHYtkqw+cpvJ1Ns8b7ndiQvCrjBJKmZ7QfsEoW63spuIwZgCv
         +iJA==
X-Forwarded-Encrypted: i=1; AHgh+RpgyAx7WTLyADd8RrIWO+/k5M4aWjcp06yb15Eb8IuB03rGOA4uvNQy09rzoeEjXjkvW7jy3N6uUGO5grmJeFV4@lists.infradead.org
X-Gm-Message-State: AFuF++lEXU7UKJfMPryaTTZofj4UPIu60pJzwKoivTTdJJtmWnKIjIV0
	kMwhYiHTdbM9VJme9OYnWIBcIdjKWbUVthC5Cq6aRifKEO7vR9/XBYUK
X-Gm-Gg: AR+sD13n6vpAkRx0cb/lMO5Bs96/ZuKJuKxV2k1dnLVjuOKtfJHejF4GUBcnTOQLvy5
	E2EQWSVDCPOoo797jdQ3HKptsrocHnIYHAX0k7q+KJNmok2nxD4gi9yhBjNWS61Gjgy5+UTkPi/
	fVB4ZqA5TpuwYEj+0ZBuPJ7U7iAhzvq+xQZr32Z5vE/tFNO6G8ZgBBnbbe8wYqFZkiAgbvJO6Zl
	ei0R7AtZ5ZQxY+dhdqgjMlMa0YSmGA1W0H8y5b/WBEmJn8I7o/toeJGbiGybUEizx5Xm51YkHCd
	F1ZgG+pqOOVv8fuYDYaPjyJat5BascaPBFPNK43LKl6ax73zqTJYM03hz0ORGCQZwB1Jlbu5g38
	a57AeSjdqvurgX+8C/JU8AID1sdmuedld01fI1eRIdzxZs+u0ZnyWLWSC+vNIT8rNHROuf7eb0B
	N91FeBbJi3Pw5SVd6IOdMjFc9FLNG/3X/O8cPdOt01xjmpVWZjuffk3UWg9471sRqt2Ng2dIm3Q
	lHU2D/G/XpoRQmhhZHuEvfpmIVWXCcXnuGgVmS+Bohzoy78xFvw3jqoaZnqrLed2A==
X-Received: by 2002:a05:6402:3242:b0:698:3469:fa99 with SMTP id 4fb4d7f45d1cf-6a42eeaf740mr2519534a12.0.1787274505008;
        Thu, 20 Aug 2026 18:08:25 -0700 (PDT)
Received: from localhost.localdomain ([151.251.247.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm3913104a12.14.2026.08.20.18.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 18:08:24 -0700 (PDT)
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
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v6 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
Date: Fri, 21 Aug 2026 04:07:26 +0300
Message-ID: <20260821010728.45065-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_180827_934731_D8A7759A 
X-CRM114-Status: GOOD (  17.58  )
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

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
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


