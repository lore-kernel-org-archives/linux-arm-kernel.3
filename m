Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0A8C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAIY2PGMFfnt3WY5m1saKTe9r2TNIGK2InPmdbG9HB4=; b=q7CVjAztxPlyCiBOA7rb1W4C45
	nrY+0GTivEFTUHAHytvDjEZNSWxXMXktSpPlNHXupIrdhTpWdmdx2PzQscOzfAPV8SyxpiMRdkVrz
	PtMLBSA6kXEVNM7LJQ0aXZO4bIK4yMUDxBWtPBGgOjK+PtVi9jlVUxJh208Qur1C/IDwCXvE4EMsD
	d0aWdnuGUJ5kBA/P+tj7Rvf3//ebMECwyCgfCsS9U3fvCmJnSyEAc2lNESlmPGSrVk2EzeYHKawH8
	fOGaHkS5dNhlNizRTsvcpXpgHUbOTFBAiRMmawbFNxEOSbXFDwSGRDaek8d0uT71CZMGUlQE+WDwq
	ONZ95Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdlh-00000004Rsb-0pQb;
	Thu, 27 Aug 2026 17:20:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdlc-00000004RqO-3Y2W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:19:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso48155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851195; x=1788455995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAIY2PGMFfnt3WY5m1saKTe9r2TNIGK2InPmdbG9HB4=;
        b=McR5V0yGq/IPuKkcp3zv0aI2T/bz/hmlBYwFnN6xus/XUCyr4JP8hzfCU4b1uVMGd9
         kDgmIH1/Ok/f7kva05smtE7nYEQUOCK0wBtntCKYPx0qz7NcdMvres1I8r50JHrpEw0G
         1dIr+lzYc8VCkT5oeHmVZn+1mTrvxCZWmkv7Ufi75KJUPPSsPCVfnTmZT4CR1P/CnFCQ
         +xqqtN9kFsioKiGaJGXycYgXK3EaxVP4hCoCdQfdrNqJ9vFtDJZRY9nZq/lHkEvQQW+J
         ONwiX5W8s0kaocxvj1b3qbOKSwE72ggDLKUAHV+YyacOLajKITUkW8BvIckOiQfoYNmd
         UUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851195; x=1788455995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAIY2PGMFfnt3WY5m1saKTe9r2TNIGK2InPmdbG9HB4=;
        b=BH+b7mYBkQlHZWp9zgLu3L9H+7T8i+4BH8lXPGwLJ+37v8JcpG61cqjlbJkxInmom/
         TfCfZG//n6apriZ8CAo1PCw1kkQhMM31xHSYiu1+XKvWeU61BxSKGKaLAAx45xlWKqN+
         PhKvIdhPY72KtgPe6SpPNt/XOSe+dZyXST/HOUs40rTG0q+EaBvyqBulJPb9f+sIeEPn
         cI3NEvYMWvwHzCpxVnx3iTYw3PtkAH6VvKLQpnenakMI2fUXggx8+xDdFH649u2XnRVa
         BZyd1ELlMeitV597pi0pCsJw6qVhVp+ki7fY3TsiU5Av4jgqBYe+xGbudrHDEc/Djcd2
         fRpA==
X-Forwarded-Encrypted: i=1; AHgh+RoU1a/G6wLZoaqg/cseJ8fhoy6hAKrWW8XQnBSARwrtvxZHihf6hL0x+g6vX7NwjLczwx2eOHU5TA3GvUz6utoK@lists.infradead.org
X-Gm-Message-State: AFuF++nZF9zO34G17Doet9qjfs8+6nzqzixj5IGvmXj5Sls5BOQGnUrr
	IcI2OplEEVJGsPlEb3mgtInZRUYsXaE2xAgURv7VugbEk36mCrNanmeK9n5SCvDx
X-Gm-Gg: AR+sD13vg2BoUwOCR/jTpnKWjDjZW7y5O1GA7I+pVqRvEBXV1+m6qiRoVIpP9ly+iDv
	dHaCZFEgWdEl4JOmXizG/LoWlAqf7A/K++IW4WcaOxhrrpev6ZKpq1/Am90webNZdpatM9xwgoL
	Wd8fh1ZLwVseAaOktMnmjbhi8Kz+Reo/zcSTblBYi8WHBCApmQhO7YHDMu4StjZgGP7suu3VdY1
	7NAz9zF7QwY5myEC0NHrhtBHsRZ2VlgjsxGAevZfdVoxGWEx8t1vVEpTg6GGbBKxnLCif//d7UC
	pNWaK0Ht44nJWGiQXEHWYBX1BHqcRm3WUQGjWfcwInADXQTX2VfyKhtguF6jIhGgPZ5MJVTxsr2
	kjmegHzWGxCukM3Ud0XkfqLabepLl/lM5z64HdtcQjG8e3PU6ebO3ZFXTiaufJsQPelbZtoVI/N
	p2ndYZn2IhJblMp6/0X8pIDCroH145juL0EHT5dVPyD2dDa/cvAvnTIrBaJNXeT5ZKCduw4aiZV
	IZBElzanLP7xIDPCkymPl6S7AG4lGxlu+IjLWyMLOXW/GoeXkgMp42Cdrzex+zp
X-Received: by 2002:a05:600c:8b86:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49b91c5446emr7604325e9.15.1787851194667;
        Thu, 27 Aug 2026 10:19:54 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ad16262sm54259995e9.11.2026.08.27.10.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:19:54 -0700 (PDT)
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
Subject: [PATCH v8 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 20:19:36 +0300
Message-ID: <20260827171937.28878-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827171937.28878-1-gvalkov@gmail.com>
References: <20260827171937.28878-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_101956_906979_C0FFCCF0 
X-CRM114-Status: GOOD (  15.05  )
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

The change has been tested on OpenWrt and fixes the issue where
phy0 does not start on WRT3200ACM-EU when a DFS channel is used

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

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


