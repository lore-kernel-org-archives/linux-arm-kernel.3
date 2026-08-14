Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D083C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxmv/7o/NfVI89rAdTVtRInPWnXbZJb6x6oPXtKGqx4=; b=bzltbfUZBpQEnEhTjIaAKZ/0aP
	mKHD6I59ZQ1Xa1DCf3HEWV+0lYy9FhXcOCY0ydEXHrGkX84RCxBj8sN2p4x+F7c7rukRDekOzBQ9r
	KWwvxyI8yBSMU8Y2q/XRLeReQuvDji7ZSrQJGXKoOzb73DpbbEVFRHBotOOnEMjwVLtPDj4VFzgz/
	SQ97Z5RmBC6OJ3Vf1wIpG9DABihq1PU1XoVSOYRcRXHGv7B5yr0929I5fVYaTCMhWANtppG9DdIGc
	QFFlkzkDoElFWBwNAmQ6Gee2sRQCff9a2D1HiVxSy1bJJM1JA3rTEtH1WxH5+J0d/G2nL/qr11sVa
	qD8VPokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurNr-00000002fzY-0le6;
	Fri, 14 Aug 2026 12:51:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurNo-00000002fyh-0wyf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 12:51:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so12861395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711894; x=1787316694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxmv/7o/NfVI89rAdTVtRInPWnXbZJb6x6oPXtKGqx4=;
        b=H/U/2av5laSscGa7jzv/5M9aaK5j9m3rB3QrgPmn3rchEccI43v3PqabqyMB1rfc4u
         07yN6tocKjJ8hkkqHiESpxizs/UyL1/K8CYs+E6WjijtJzHfe+rSwWGs78iEAFYlRHGQ
         20Ls9WAesnSO1xqCzxauLSHcDVscHSd1PyERExR8ighCVBqDbs7fxIydS/CnaVl7D5Hj
         +2KJ/9AZUH1JtvQYLekkkM85tfK0KTsIFpeGPsajiQZL+gtYgXKLvP1Hb9cszzLvzI+D
         Afk2VO8p0hwcrpLZgK1ejGxltbiemto66ko0IxgMuAT3zNPW0lIH3OXJRSe/mRgEuZmC
         t/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711894; x=1787316694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jxmv/7o/NfVI89rAdTVtRInPWnXbZJb6x6oPXtKGqx4=;
        b=IHNQgR6vhAyu9OKEIt2ZtK0Dqf2S9Ts5RRRY5d3nTHl5w1nJrFclsoh7E0PPVOlYBw
         AvPmasN+7URAdyK4uy9s+2pdtAxv/WMH+P0Z9IzJx5GqluhkZE7zWuH/6xQu2aEfz6/k
         f9WpodLw39Wt9o3R/+5s5PKtJmTslS1UG7gH19HwsDklFuJmocRKrmOwmTaoMeF+YfHH
         4oLON3ywwojygjAMAJTwBskum4ZWJpjWB3urv3Rk/+ErYv/mm+J7ktxys/Dnikt8U8mi
         ZyfxkvYp6q9cIXEql/yKm4UEUa561/gfZYSqk7nCz2uhKw+274kunXWn0JltzUNtboNc
         sUqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCcb6JuCA+E6hYoDnUO92d/CexQDsw7VtCZcfbLbvD/TMOx43oXish+DUUzNBQCzqKCiIhoUSkE8Q5CHq/6Cof@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk/s8fInTmsCIntPBddkHsChMi21/IdCu4fOgAjHbiybVWbIfV
	3eYP4WmG9b3yTzfXK7m3WWARtLdNq+nyVaLhsEjYjh4lW33M6wIGgM0e
X-Gm-Gg: AR+sD12ftD4HF/JOJvs2qZ1yyePQxRcragS6UCziIw9xn3pKfjeIIg5ksjqU19RdmHE
	3aN/48mepZUsjtPmZmMfAi4Tnzg846T8Hl0ip+s7J8QbCaJRbqbN2Kbt9bdHiaQvg+YPnHRfT6P
	NftMoXdQaRVMDbv3z8IDkunAA4jeLBJMzf5SksssLm9g07aRH06IJTCFe4SJnqairQGGordn7j1
	1HuRUnfqp/PWgsE3Iiw1W6jTXIJO3HH6EH3zP5DpnZAEfIc4V1sNYud1aonqkhfUrcLS907YaH9
	wI8dgMXUZRt/I7LJrOEz/e/rG5Qsg9EWuFhcPIL4cEzK2ER0mch8XlatP0BbKtFPOkfbXiaTNda
	qlXj5Zg/ncDchOtEKUzMdXn4tw7u4O6uht8mcSUMaJVMaUKabIsYzmCcoq0aYNK1/JfofchnV2q
	f8/MrPSaYz/Cf8gl0I4qMRAUMjVrHXOo0XuAYR0PZ299AZDYzkXh2n5Ezn65hZtY84EWAYo+cST
	kbnEP1YO6Qz+aTaOfH8ivwne9WmOm/VtBWs7fRzK2ejBxjxiUJAwYRNDC+k1QW4xA==
X-Received: by 2002:a05:600d:117:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49987ab4e1bmr49051825e9.7.1786711894092;
        Fri, 14 Aug 2026 05:51:34 -0700 (PDT)
Received: from localhost.localdomain ([151.251.241.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988ae8b62sm49727315e9.5.2026.08.14.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:51:33 -0700 (PDT)
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
Subject: [PATCH 3/3] wifi: mwifiex: add dt flag to ignore incorrect ROM regulatory hint
Date: Fri, 14 Aug 2026 15:50:25 +0300
Message-ID: <20260814125025.90522-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814125025.90522-1-gvalkov@gmail.com>
References: <anoYr9H4KojJv-aZ@google.com>
 <20260814125025.90522-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_055136_285136_8C763534 
X-CRM114-Status: GOOD (  12.33  )
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

Tested-on: WRT3200ACM, OpenWrt
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


