Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAD5C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDO6GjJPOwWJ3cCExfgafVeJUpNRoE4Oa0/Ds8leCk8=; b=DkAIV12GH52RxqnoaTmEmrpDgi
	q24q3FYMSUHDPfgFdo5zjjSwy7k7R0A1M2yZ+vVkvqUwm2enPBW4HWOLan1rHRUlyjhhdLdOj95E9
	InjBl+sVoE/GsH778LZrNiojIySwHkLwCzJg1yevci4ZjSXfUmcHf/oUt/2UC7IgbGs0bI/icI3vW
	UkbaKF9mbqDqKAy08+u0vh1FDdQ5I/T4J/9p73QHKQjUUT6KIYX97amP78JeM4GkojcrdEUjW/SYn
	xanFQnbMKaoLmLnyn8qgbzVAT1WWI0Q1sWG7aWOnCa3xgI9G6HnnOzMgrst791tz3Ic3qBUU9Zq72
	XZmzO6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Ir-00000006srz-16vc;
	Mon, 17 Aug 2026 21:55:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Ij-00000006sqA-2Ujh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:55:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954df200ddso27638585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 14:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003724; x=1787608524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDO6GjJPOwWJ3cCExfgafVeJUpNRoE4Oa0/Ds8leCk8=;
        b=QgnEGjkN3li7WN0MktUEiwcJ+Qxj5kOm9z63BmeWvlTVEYzVSNNlxkrVtgFsCTB+PW
         6awMgZaTcZx2Na+TQYcfkguI3Uh3rn2xC72WmUVYlmGh3omuypLSofzUsWrmCXGhw6tK
         CcS+jxv8Qthzs1dZGK328QglJ2uaVC5Ws7XcQssnG6T9tratQLIr+9xvE/EKDKl2VhsT
         O6qmuWJIcS2roYgc8wNkv6KKNXyWclEMIruLY3geoVtbH9XflhRh+xLAR3UMSw7F7jKM
         1MX/ho7UR3o8nEZlNFKL3Q2pgxDq40jUMDv9c0QsVIY4bbVEW27+ECXN8U1Y+479y+0w
         vh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003724; x=1787608524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDO6GjJPOwWJ3cCExfgafVeJUpNRoE4Oa0/Ds8leCk8=;
        b=IjwpQj7Z+WWwWSbTDIWSPjxmljXclpB+n7XVeX4l98mOwUG4vXGVVuvq/ezV9Kqy3O
         eCOY9XLglMPbbBmBQLYbhbp46TbK16wGsrwjDVVE0UV9Yy+y5w6CTgH1YreXEpIoEMSk
         GbV2BTN6iH3FmGotUM9LGg7rsioo+r6mmiPCnqYg1pRO3qdQv0Cj9Zg7I3ZetNXxxNH0
         R36Vs9JFDAEsgkotGy7qlfc2UP8Cqol5rpZY66HbKyB9ZEb387pznz+P2cHABZIB0UIn
         2whXIkJ+bHc7IqX3FWpxQxellUD62ktLqyiBguBRJZZZSTaMAcO+TeJ+kkxLms4qYKAt
         5fDA==
X-Forwarded-Encrypted: i=1; AHgh+RrqBgTAkQ+f+aX/UARGZDL5hOmaWFkazyVZbUSrbZTMZhE0kCNuU5AcNstw+stIitG9gLrkbCbBehLgDyBoSEyy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0DIWa3stKzkFc1bORKace2HQXNkHrd27UYwEagIw7zPuYykit
	rdH9jT871XOdpwyc1g8aCTlKceuZnSeAEGZXo7rzpmBxh0qCV6LIif9Pa+Uxl37i
X-Gm-Gg: AR+sD12TdnBzrQkc/SWrvkhD1OkNhc7DrxGs4KXwTH5+4e9tWKKL8kz3yjWRnNB5eQQ
	DLjBuCsbSzOU+i4ELdIoHDIkMcIMRQzdhXpON3ZiCvKRkggYbViCzTUnNdAQIH9jc4noUUrJYyM
	gZqCaplygyeDapRA5n1LRNeA1oJkgZchFrid6MJFurbRjLjZfdOMbAOw1ciK8zO9WX538MC6xsY
	9s2oPq/rfERU82F239TIWA5/Gfx1xAIT8XsGiHD4/ZHoe5g0gKYnKnlWyIbpo4JAXXitn+OiNNS
	cSdOx6pWvxDqyCQJEcfNUyDWg7glK39p3MbUOjEJKav+CPCsE6gL40tiltgMlXTkMd9SDIlIcuP
	FE3oijivvcyS0q25hulHtiDXyC3c7R1N55mwmXrnnT3kppynHqUu2v4fCt+ISMCla36uza5e4B+
	MwBm1pmjQGd5il/T5tWsREmQKlYincka40bE+0tYSuCS4KOBREOj7tv/CxoQRdZGbVlrZp5ChDA
	gPeRqrCbaIDcmm83iO7lXUz2jNc5bT2Dmg86+uLVuODb2fIR4E+tq5A5is58UnBHYqF/EcG4Yyy
	un9QB0X5mw==
X-Received: by 2002:a05:600c:3485:b0:499:8758:8cb4 with SMTP id 5b1f17b1804b1-49987935eecmr451205815e9.5.1787003723726;
        Mon, 17 Aug 2026 14:55:23 -0700 (PDT)
Received: from localhost.localdomain (85-118-76-205.mtel.net. [85.118.76.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309622525e9.4.2026.08.17.14.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:55:23 -0700 (PDT)
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
Subject: [PATCH v5 3/3] wifi: mwifiex: add dt flag to ignore incorrect ROM regulatory hint
Date: Tue, 18 Aug 2026 00:54:28 +0300
Message-ID: <20260817215428.84740-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817215428.84740-1-gvalkov@gmail.com>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_145525_657514_82F23D8D 
X-CRM114-Status: GOOD (  12.06  )
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

Implement a device-tree flag, which allows affected platforms to ignore
an incorrect regulatory hint from ROM, so userspace can set the correct
platform regulatory domain. This avoids the region conflict and allows
the 5 GHz radios to be used.

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
index abc703441c5d..26978158a0ad 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -4899,7 +4899,14 @@ int mwifiex_register_cfg80211(struct mwifiex_adapter *adapter)
 				country_code =
 					mwifiex_11d_code_2_region(
 						adapter->region_code);
+
+				/* Allow platforms to ignore an incorrect
+				 * regulatory hint from ROM, so userspace
+				 * can set the correct regulatory domain.
+				 */
 				if (country_code &&
+				    !device_property_read_bool(adapter->dev,
+							       "marvell,ignore-regulatory-hint") &&
 				    regulatory_hint(wiphy, country_code))
 					mwifiex_dbg(priv->adapter, ERROR,
 						    "regulatory_hint() failed\n");
-- 
2.55.0


