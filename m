Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB5EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yDAFIIvoVKf4kVeSrPAjhgGoxZ9yQ0YMJMc17NgMdM=; b=qd+dB7EM5rFgYNA1A2o02PRZEA
	Htb/QfEzmJZ1s2sjMV1tq5Ac67LgIZZ8f1nh48DSuxtjgoQAhKdR60E99OKFQ0IjU/qDqp0iU4QNw
	Gq7O5z4qEerPAbobcQ1hWWT+gr8TnwRtW4/+u5mZQIpgR/IB0BTv/5u0e7dx0VGg47IcXEX/U/7Cz
	8VjBL+MQULksLarmAexUtlg1ZjQKpNnvUsvjXFQf4HOkK5KtIN09Kx9IShsgOs/StzRZSJqc2ysf3
	ok1dQvH8Gh73K9Is/53VjlRkKSgAbz+FhD0uOd8322yQ2rQRLm7DxmQeKjJjsMVFVCPsZuWzYgm+B
	WvIoHfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeO3-00000004XPS-3b28;
	Thu, 27 Aug 2026 17:59:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeNy-00000004XNI-1vBK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:59:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso785865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853572; x=1788458372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yDAFIIvoVKf4kVeSrPAjhgGoxZ9yQ0YMJMc17NgMdM=;
        b=dbkt+9Xa90jwuXnEjCkufY3RBNTAuPicKE3OJJsoeOp4DJl60NHfoz4JXIJEl0zMsg
         pVIOFRBmhtxZfhUbflLmlQ3zVPY+BnPw7e/DQ/pzntiIEXR5K1on7TXjp8UhLrL3eNys
         hub4YIgrc5t9edwe2ydshqh4rZTJQqMTFcXSi1Gu5I5LHD67MXfkymPVhU/Mio3eL+jf
         Zc9hLuQvtSBqKl8QM2b4C5gbnEVkuEiTi8pUsP0lLj9HV/PwJ1BzNYLTb0P0ku4Wa4SI
         48ZObkvue/1e6Y/yJSzbTsQkeG+212dX2UGvH1G0Wmd9p3UAH2MVGh8exQp8T6ZepoDH
         hXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853572; x=1788458372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yDAFIIvoVKf4kVeSrPAjhgGoxZ9yQ0YMJMc17NgMdM=;
        b=g5Q5nLp4KsZtgXCPqy0VTR2cTiQZxUvKRcq1kB3nw5fHrdHhPtGt2LNEUpnOY+Vsjc
         YaStGKOnabhMIghML50YjpkxXWiTb521jTmFEpaF4GOrMo4rX1v5cUhkh2hRMoXCB/ml
         F1YaualYYldMUH84gLc1Gxj/hmzZxdVDLmBbSHZRJ2Owv3BoEkp3HcQY7yXeLnBZgjcw
         wuEJlw2KG0+/P3XsTT86JJzHeuexx7064vG2WCSVl5iPnMlGmu+z3lHmEnMCYycwKAaZ
         86Hyymp4Ir8H0LkDCnkn7L/G9drowY0dYSyYlO9ByLTmG/dJLUP+c/D9x4aUX4NNLExo
         vAqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5U7sEc+MItmcbhFQVdv4O8zSC4iKQk5ar+TEjyT8gt5GvNnusv9eHzD5+1BdynP4hWnkG+sLDmNjCmJ3rLWUA@lists.infradead.org
X-Gm-Message-State: AFuF++ll2+1/dqQlxvU4T7XCCAF3YVe6I6uB0WH5AQP8CJrChplDq9yH
	Jb/N2P0Daa+HeMFo89yaGfq6lTW3w2ph2xg93MP2xEy9Wg+4SdG+Th9d
X-Gm-Gg: AR+sD12Xk5IETrWBLgy0zlCekMNgaBUE1volC25DeQEIm/BXgDk/kEY8zpmdWhilpSP
	ygaq9KHY0cYFacmOVR1VmavlzJRp8vdRFlGzorqCkEGtRqpHo/VqTsoTz8yZOL+kiQE37HeZGmr
	vbaIsjUn5j9Ua6FenT29s3uvIl+ucmzP50FwFVoWc2Xuktsrms8nd5GJsklh09MVnm9ff9jeW1x
	9Q//wEsb03yj9Nz5pnG/q92DVYOOTDaY8V5PO1F3NXsZvGTW0XKi4qXaNNeCwjLjWNieH3Skles
	yr38k0H8H52g25FZEolTkFD9AVFP9yOMyH7UDDShhU2Js0nYqaYzJWYUF7fXKFYbHMLSRLwNQzf
	5wnMk751p/8bQUvI5kCyjQdy3ADTmKVMfdU2saH6JcAaU9+XWUplgSqA7rYy7oNwATMnyLxeYYO
	8k6v4t2ZsopZL1oaa3mtflu39B3R/ufpYbo4auNucBxzDMNQLsnI9PtOWce3MQ8YZIVJ2bdfn5C
	Y0bjhvS54R+LjHSEuuqZOTo9itsXAjLfqXqNCLNn1YjMzJVD8TC4m/MulJ5Ozs8+gSThhZezIA=
X-Received: by 2002:a05:600c:198c:b0:49b:8eb6:5700 with SMTP id 5b1f17b1804b1-49b8eb65823mr75948305e9.6.1787853572313;
        Thu, 27 Aug 2026 10:59:32 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9945sm10272342f8f.9.2026.08.27.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:31 -0700 (PDT)
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
	gvalkov@gmail.com
Subject: [PATCH v9 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 20:58:49 +0300
Message-ID: <20260827175850.89395-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827175850.89395-1-gvalkov@gmail.com>
References: <20260827175850.89395-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105934_521509_701E490C 
X-CRM114-Status: GOOD (  14.76  )
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


