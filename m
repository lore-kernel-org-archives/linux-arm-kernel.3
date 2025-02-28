Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A2EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z44PpIsh3vLE/afH5iH0W6ltnQA2fSJsEIEQTKn0hFY=; b=yYKku5A6SC8ns//wl8kP0Z43e9
	hdVPipJLWuBBztZ+8iu2f0YF1/fibdfdWWyKW25SbWpeDcuDXYS5ifUaPBPn3zPtQbW9JLojOluHq
	ChBwhlWYLi2jyXO10QFCDYLXkWBhjbiTF/CakW9dLBSd4wyw7t36CBgPrgh0ePBLO79dt2mPsyyWZ
	w/rqpVkDkHW1SxTs0JJdYLMC1oI61UGbONWlQ3JUgESOeRfzQMRQhv6/JLWTpluHUjDtTLFcyJfgh
	Ga4XcNTG+JTxcdhRN7mmk7PjHGBpkGicqPCZLZBdun5AfLf85cmZmkEmQMxcWM3No593kDxfE2nuR
	9FioLWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Dj-0000000Clkr-1ks5;
	Fri, 28 Feb 2025 21:48:35 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8BV-0000000ClHE-1AlT;
	Fri, 28 Feb 2025 21:46:18 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so4787895a12.3;
        Fri, 28 Feb 2025 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779175; x=1741383975; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z44PpIsh3vLE/afH5iH0W6ltnQA2fSJsEIEQTKn0hFY=;
        b=Sed6pslmUTgAknp/mAPxHj7SOTk+eBSwckHk2uMSzZyEvpq4wnHZflTbOvP58TjKQH
         CLdjhroQVKFteifd6vU7Io52Hu9CNqDn5RcU2j/KtMKBX2tUNkU7ylzAYIDwjG6Fr//0
         m/UFlxg4VUCChulFIzDRyONgUUL2/AVFAHAh8Rfs9d7oJYEVOTSfrN/IW6mHgr3Bldwv
         yIt3Nt7q5utgEGJoA68sZX55QARregk+iAhBAou7MvyQyFhg1JXOkpAIYF7rzHwfHv/9
         zifHR2nh15PCLYQce5WwAdUlQSRpo8k9jOGqV+5EuKrL7WnuOz1R3WgHvbOYnkG4PzrX
         B0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779175; x=1741383975;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z44PpIsh3vLE/afH5iH0W6ltnQA2fSJsEIEQTKn0hFY=;
        b=HxqpN7W9GJhENIW2JinDL9A8WiN9IgPzEuniorRiCDKVZMA9IoNbU2QRdcJ+vzztiG
         qD2SqyPXhLhMxVa+a7iVnrKBYuk4PQpxDHul9xLsgQGcyLbbBvII7OatG7EfTSzL3Zua
         Q4gxWatDrVttDj/fOub6TazBjAHmbnvbVJPeLO9cQtoikBsTpn7nPFS5iw+c+fkzj9cq
         l2XKgIzXP5epsazEX+chFXJhNh5vrZi36ZG2fBgpP1N47HJ9TX73ZkDy0yyfCAxI6r4y
         CS2Teu3USPHfxy6dCPduCK967xIpFPFq4VkO+goPyEpJe2nk+JQfl4Oo8YT9vHsZBr1w
         sOyg==
X-Forwarded-Encrypted: i=1; AJvYcCXTmUJDbITL+H8nZyyIMaQ72MV5ghTy0Ih/YfzObO4nBNYKh0UNXVoIOOrKytkgjJ0fnf70dl0yRHUSjvhwyNY=@lists.infradead.org, AJvYcCXwC/kNTmp8SBH9JwEg75/UL31QOzV/xq/3LLXfcpLssW835cQ/9lf9LWbMMcieum0GpSx0UKZfSBRv/jz90ct4@lists.infradead.org
X-Gm-Message-State: AOJu0YxGP4Itc63QIx4DugvwYbXYAST0GJosmGwDYhU3enegpIaPN8p9
	TVrHZAH2gd4pmvCvJdbglks7DKWUFLU4eI+WhkedVO9jMKU7Kzjo
X-Gm-Gg: ASbGncvGqv3fuT+favsIgKQeofga6jDCtJdq/XItPr6U/w8mwuYpCTwMflJsy8eMXeB
	9dtZjphdSwDvcL9p0+m4GgS7bPx39Cy39ILVHCiOwTE4FJA8sunQgAjP45K957LVeaLi79s+xBP
	fnmIAL4/ghwec2xluWS/kexGtQhdq/jdTWgDMClG0TjcQu4vPisjgha7MIq0v2xja0+Zg7OMeKg
	H7A4HrmsC2rmeS36lSH2s0yUD2Bf3DcfD8Rdb0OiA7Yj/HsWgCsHouDrlrRiL6OMOl/WdZT2dGZ
	QHpx+l5Q8JeNxjFLiGnnknyNfpxDHMQKHsR/wCBE1cJu6IxUgfxqK279l387gJTvYO5Ii/Pkt1Y
	6C83FoyyvohuiGjydTuRUO1MojLCrKLoZRjAdWQ5oyf2itu36S5TH1XvtUGw0RZ95xSjx0EvRnz
	XPrUT41rmO793PzqISftQZ+GTyw43jnkZB21Mv
X-Google-Smtp-Source: AGHT+IGP6bNbwBJ8aUPoIYK2hJiDLEV9kuGWZVRk/kHjuVqrdg1Izm14Ba5s4Qo8hJ8K70gbtKj/Qg==
X-Received: by 2002:a17:907:1c9e:b0:abb:b330:5bd6 with SMTP id a640c23a62f3a-abf25fdc426mr546567766b.21.1740779175390;
        Fri, 28 Feb 2025 13:46:15 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c75c333sm356473166b.145.2025.02.28.13.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:46:14 -0800 (PST)
Message-ID: <496cf940-b57d-4c2e-92b9-80a90d239523@gmail.com>
Date: Fri, 28 Feb 2025 22:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 2/8] net: phy: add getters for public members in
 struct phy_package_shared
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134617_322346_0747E8D6 
X-CRM114-Status: GOOD (  14.26  )
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

Add getters for public members, this prepares for making struct
phy_package_shared private to phylib. Declare the getters in a new header
file phylib.h, which will be used by PHY drivers only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rename the getters, making the names shorter
- add header phylib.h
---
 drivers/net/phy/phy_package.c | 14 ++++++++++++++
 drivers/net/phy/phylib.h      | 15 +++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 drivers/net/phy/phylib.h

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 260469f02..873420e58 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,20 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+#include "phylib.h"
+
+struct device_node *phy_package_get_node(struct phy_device *phydev)
+{
+	return phydev->shared->np;
+}
+EXPORT_SYMBOL_GPL(phy_package_get_node);
+
+void *phy_package_get_priv(struct phy_device *phydev)
+{
+	return phydev->shared->priv;
+}
+EXPORT_SYMBOL_GPL(phy_package_get_priv);
+
 /**
  * phy_package_join - join a common PHY group
  * @phydev: target phy_device struct
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
new file mode 100644
index 000000000..a42e1fc07
--- /dev/null
+++ b/drivers/net/phy/phylib.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * phylib header
+ */
+
+#ifndef __PHYLIB_H
+#define __PHYLIB_H
+
+struct device_node;
+struct phy_device;
+
+struct device_node *phy_package_get_node(struct phy_device *phydev);
+void *phy_package_get_priv(struct phy_device *phydev);
+
+#endif /* __PHYLIB_H */
-- 
2.48.1



