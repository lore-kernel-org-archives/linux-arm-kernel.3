Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6F0C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 01:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cBAaDb2n4Yj0YfebzefO8jXzgNYsaQik+7MKadIvuE=; b=zvV60oxJIV37F5To4KWY2D7ZE8
	ZoJC2Eym8AG5+hMJOzy4/mYaOIviy3nHh95/uoUDPtQstzInQyrJnQUSA6Gzgl7Z7pBkgkEqHsjvT
	45IfWHhUf7pH8FwNrcxCUiDhYj9Deof5KEMn2Lu8/WnoHh7bgYKPh21Xarcl9ef77mzBgSKV4U/Th
	uQ45u+H0DSL+frCchNCO8bqWb03Jr1e/jqFUOhdc1ik7BIGzOZBnPi8LJihhqnPU73kVo+DzY+97c
	8WlQzXBweRLw1Y2YWvl+68kr9auG4i/TRzyB4lTKezr1e6ISS6T7isb1cVKKMVLBrqF4+98OGAw2f
	PmTpXt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDkJ-0000000COvL-0tTL;
	Fri, 21 Aug 2026 01:08:35 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDkF-0000000COuU-1tEC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 01:08:32 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so949609a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 18:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787274509; x=1787879309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cBAaDb2n4Yj0YfebzefO8jXzgNYsaQik+7MKadIvuE=;
        b=e6aS4K0ubEdo6VvRElYk2hcR5BleRIEXGJFwQTkPZvbUKTN+MOZWaAdDM685F2DuCZ
         aQ4D/wKtsOOqRBF87IFTLDFtJ4yr5eXqtlvtrkTbnNifZU8AU6xOnmQPlY3wnPKePexS
         udkM+l59FG6uXx7kG8usIXnIy5uR2Bry25qxKVnPGuQa24tu4NM1fl+1E4eiGl7jYh5v
         frYf69Xg4Tr0ZrVvQobiqqs5Q3rRxbEgW5foFrEp2q33wfF2hL4B/U7BsuNCfZb2JWJ+
         D2JBHgMO2hTrTkp9unDD+utgWzu6t+LtFhJAWjV33VP3XuUjAisT1LX+ZJRhp5t9BJni
         Resw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787274509; x=1787879309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cBAaDb2n4Yj0YfebzefO8jXzgNYsaQik+7MKadIvuE=;
        b=C+fKgt2WLN47hTbtYVn5BUW51BlBi31tfbXv4fi3gKmrg6Yvptv4CrxwAoaNksFxds
         e3LnbuwnH8ixJYkfEY+o4yXirR6Uk3GsBL5tR8qLDJPzB4loiaOl4/wL/BtIUnCoFFhm
         UniJdkyd9djBSL/tdJCS1gbfBXoN9Ntj/UL2pC9nZMNa6Y1dfrQSUicOjayBpq3jFg6h
         sxj2RfSKOWdvQkKF/TmRbbxV/0dzY17KyLFNMEZ6+Ub+1NbLODVHXUsDftFLrcx5CoSh
         ChTWkZnwYevwEL4oMT6yMcVL8b4M++1GEekNEWFF6solmZbsdJlfTSuWFkZZ3Hk0eIQL
         axRA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4P+sb1rkDQsfb/mGyR2NrnHLpYOinSH7hyyqTBRq8VlaUxayMcnxsRrXq/K0IWAgkyKfrIYRSrtFav4BJZ2N4@lists.infradead.org
X-Gm-Message-State: AFuF++nup2HPehqI7VzxaY1MPc1uiYD4SIVD13TF88NrM2wN28jNIn89
	VwRniob7Nw7qH0IL7L060ueomITAEjQ8P60YDjHtDSYg66nET08SLIUn
X-Gm-Gg: AR+sD11pAhiasD91Vm56T2WfcZMZgNgLYQe1LkocRb+GcjxhFIp9QE89+AAEcfCZ5d3
	iUdG7uttFrVqD84RJL5fPGa+EILMMFUHIz5zXZenfY+io0omg6+S6MXVVtcNaFLY6lMLKAxONTK
	7AIihdzdnO/WA4GrpjFuswRFt13eh1XK3TGTDEwYpi/SHh7hepBWwBVPndkSEUilTipN+yXbhHs
	sK/mbv9wgKmPCBQAMDFH+Pl91szj3y4uxEdpc5CN6HvYWUaEtWyGocOasxxejS7nRAxlNgaXar5
	6AigISKB8XRj7PJ94kry5INxaCLL/wkEdREKvidO6OZ3hswB7lRW0D3LpO1NaMkiQZaF/KhbCXD
	oTfIdV9uG/49XoIfuOW+4+E3GALs4Uwq2sxBxpBsi1fNw71xNPIQhPbObpx09tz0e6RoCHC9pZs
	WXUVge1OI9oRGL6U5Az8m1szeVgo0Qk2zE6/+XQ+7++YasDfOFFBvQIZi2XU2ofpG1bkJPrlMHD
	OHrWGMphhJ2sGbeTmUJhwiadMIPfU4lblddOOMhE0QdUF1iKknWSAaCky3kto5rGw==
X-Received: by 2002:a05:6402:4348:b0:6a4:21c6:1d14 with SMTP id 4fb4d7f45d1cf-6a42eeb21b4mr3325630a12.0.1787274509430;
        Thu, 20 Aug 2026 18:08:29 -0700 (PDT)
Received: from localhost.localdomain ([151.251.247.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm3913104a12.14.2026.08.20.18.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 18:08:28 -0700 (PDT)
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
Subject: [PATCH v6 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Fri, 21 Aug 2026 04:07:27 +0300
Message-ID: <20260821010728.45065-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821010728.45065-1-gvalkov@gmail.com>
References: <20260821010728.45065-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_180831_508467_147F7E21 
X-CRM114-Status: GOOD (  13.99  )
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

Tested-on WRT3200ACM, OpenWrt
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


