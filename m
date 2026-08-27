Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCBDC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxPA/ygF05pMbAMW0vsuxfL/xhlpJsyjpYIxaZ1WIpc=; b=wBi0GD0R3m/RdJuxo3+zq84Fa/
	xMnOuh8xlN6Cr5x7ZOjkrlb6P3etv4rrFFF/zd40Zyo88RRj4mFM1EiXrNjvCgnBo3FmHEBi36evS
	1x8+WxUdDDODRQa2viXraTNZihv8kRG0v1JELFfZjy692LAfI3PniN/GuJtFL39rvdncydBSXMo8a
	MH1RK+FygkqddXuFTUR7oub8d69NkYtSM/EKAOxrFKDyvh4fZ3fRmEvPr8oY4k/UgZ0sNinplI/go
	mFVoYW8DuSI4wQIeJ0ZK+4+5wHhYC/Jtrn3GedMRWmusq3iH6Dng6csdN2q8wLAytIwq80b/tliLQ
	AJ65xyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZly-0000000416e-1uCK;
	Thu, 27 Aug 2026 13:04:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZlt-0000000415F-3JXR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:03:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso20992555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835835; x=1788440635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxPA/ygF05pMbAMW0vsuxfL/xhlpJsyjpYIxaZ1WIpc=;
        b=UDaRfbur2LYX5fzTN9efgAHNJEZshWVKAHIgWAGaJ15g/rumH1OoJ0/fHLxAqEDmjQ
         lC0TzDg0gscJ+P9VdAWSk2yH8bCj5otnWPnKUPYRqgfXLcx1EvXSr7dqfjSCFVj1Tn5S
         7dvUi7Au1zSqATBWMbYsjOkcEEND9nl7lS8iDGrzMh5XD0BkPJaku4kPstkV85HDeDyI
         +KheKLAfZJAhIeKwowF35Twmr+6c2iUjIJa0YMKUqHHfMJo+tq81zn8EVlfYf/WuruK4
         A6nXEKlevRU71Z4AhLbHAn2E9pw1TaBA9Cf5FyMq6ynRnwfdfSmwCM+RSuR0HgEqaia2
         GsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835835; x=1788440635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxPA/ygF05pMbAMW0vsuxfL/xhlpJsyjpYIxaZ1WIpc=;
        b=cIhKAbyzXGBnjPVns9nqezUY0/dhfpR2re9TzVxw+WrCB1ETbn/TesVHPMwRlUAg6L
         +VZnmlb0oThefP6VWpoh34qZkaiEFyNJ7rJWCWTD27u4iklQaZhunAcRgqzriHmnPDQT
         uWZPvCZp9gHPb+dtMbN/ak2HPrvYA4D6W6Zp+uZuVfZZps/aR3Vr4ynfKW6w6IoSWc9D
         lQyg0ch0enEfSkMaQf9wOtrXRo8GsTdA8hti8A2Xyza9Ynx3MmWQRwPavk2ecnhieo+o
         sEWFi/6aIjOuFj9sl+Wg7YVBjNYqxuG/qUHTX5rYoKHl4cD+vqutkYbjSPHviqv5STCg
         PcoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqM5vY3+VcM/xF5wtqIRGQMxj9VlsqZcEaAKWXbIpiMmACMv+wDAdn6uYeiZmmmk03qb8hU2JbSXFmqaUJzkr2P@lists.infradead.org
X-Gm-Message-State: AFuF++n2BMZNqJCtlbfZ9b1qxdC4FNAsgJkKyWJ4ERYmhZrp1aHAeJps
	xnim4QOEMb/n9Bh/QA4Px3qJDXYjeEqcWk7c2YUN9nWss5DlOv7XW+eX
X-Gm-Gg: AR+sD12RAWaknjGtGIU2Eq/samS1wvPZnSCJpl38sUVpFIq4Cik/k8U+VRugWRbuEno
	iAfMsTQ4TD4T8mTyuxjSwLcuGFwL3NMndE1QKDKGdPcev7tCe4V29/upctGzpiEA/eByy5uolnS
	YqlnXE5aZlj7O9rdn1qz+bB1qnq7YLpEi1c08yYVHlxYnFJQZhPpcJABJufVVQp1Q70vs9gpQAd
	JPlnTola7dR9VrICXnuAfSUMDgYS6ZSTfWdi2dmMllSHkQYVivxWvKvZ1tN17HcR2rNPqwL6kby
	1u/mgLBo0WwB/5zxrptCrRqeWozbsrSzxGvxtKz+ko7aPq2et5gmWOHfIMGYy0JqYMpOe2QXBF6
	K1EUQdRys7GK8ppLH8EXTinov4KJyoPDRs0Z58Mz/9p5phnARbfVFVmGWU13EJ9VyKFY0H3R/9O
	uVtxGFfZ3vUIMI7zDiDk/K+ag/SHLP4wTdKgzL83TV68MBhVVB4scWbdNG+Jh1sBmvmqn2BR2tR
	YjLPOfmfrGEYnTYdrjbhdpef2URItcvMUDcFxHpHb1I7iVHLQ7+dcYH5vKknphVM5SEpOmoXPI=
X-Received: by 2002:a05:600c:a418:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49a2c4b41dfmr127644185e9.13.1787835834813;
        Thu, 27 Aug 2026 06:03:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:5a8:737:d4a7:e53b:30a6:3c0f:1dad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49610170sm116081285e9.6.2026.08.27.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:03:54 -0700 (PDT)
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
	gvalkov@gmail.com
Subject: [PATCH v7 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 16:03:34 +0300
Message-ID: <20260827130335.6606-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827130335.6606-1-gvalkov@gmail.com>
References: <20260827130335.6606-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_060357_847540_3676FA47 
X-CRM114-Status: GOOD (  13.67  )
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

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
iw reg get: no longer reports region for phy2

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 7a1ba32f1fb3..293876397b67 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -4897,7 +4897,14 @@ int mwifiex_register_cfg80211(struct mwifiex_adapter *adapter)
 				country_code =
 					mwifiex_11d_code_2_region(
 						adapter->region_code);
+
+				/* If the reg hint in ROM conflicts with platform
+				 * configuration, it should be ignored, so the
+				 * platform regulatory domain can be used.
+				 */
 				if (country_code &&
+				    !device_property_read_bool(adapter->dev,
+							       "marvell,invalid-reg-hint-in-rom") &&
 				    regulatory_hint(wiphy, country_code))
 					mwifiex_dbg(priv->adapter, ERROR,
 						    "regulatory_hint() failed\n");
-- 
2.55.0


