Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98495C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQhsG9cL8t6XLRwybgTrsHxaRynMsLOxVdLp6vkX61M=; b=AJ9wuyDGl9eeFPyNOOvbI5vf3d
	kVb80kGOHhqSMqlkJsMEoBNlx/AihQsjzF2SVzBG5SR5KttDp1mCIGevff/nmR/0LcwyYUgENLv84
	iNuvuPLG+6tQFDOuWjKN6hzjCb+kLfSu2/qR+iFrsuUrcpcA1lKDtQeseM+hdpXTBySF/pw6ulVCB
	N9YrC3pJV0hIOwcPd220HiQIeGzHhWZHnCWRtQQ5sMkK05BsjcBHhkNceVC6M/Y8btUDA8RplHxmZ
	HtJWVt2Xa4Th7IHHZpXu1hUO/oDD2GwzRca8rHPDVAihVf+Oml/7ZmJOCrTtDeEs3EcgsCySsVDCo
	5gxu35Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCJk-00000002ByL-2OXM;
	Mon, 03 Mar 2025 20:23:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCDY-00000002Avj-3S3d;
	Mon, 03 Mar 2025 20:16:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so31254595e9.3;
        Mon, 03 Mar 2025 12:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741033007; x=1741637807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQhsG9cL8t6XLRwybgTrsHxaRynMsLOxVdLp6vkX61M=;
        b=gvbGG6Ci3UdD+kV8DHscnlcHazsensIVK/+hLbTsbSzAhd0ZsjoBZQg3abvd+aDBP+
         RitlqRdooVOuCK4/eCtutYmFUdXAAb1LHn725N6t8GBf44Cg+98p150ahWNCvlCPWVMj
         f8w3Uw9+ZViHb533L8yUVtwAei744ZRdQ2mGRIfScjVapYk6hn6u0LwhvBaaMRXBwHDE
         D618jQwgYhB5m0Yi9My0Br50GEf3DaYdxbxZCHP0gC8vyhpM+xU4tQpD7KFI9cCyR4Ba
         fzGEXWwM+UXjEvak7TNG8XuPAGRuLB7RifknVOSBFLgj0lCs3O85VkNN9kmK7suIvrOc
         u7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741033007; x=1741637807;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQhsG9cL8t6XLRwybgTrsHxaRynMsLOxVdLp6vkX61M=;
        b=Al1m3EUmk3KKrptphKHM7bqNp29lofBsgTBDpTCDCz07RCVrJsOyWDWNsTkOfDLC9L
         ej+t8/aZP4tE4KEBHC0zRGhi0VdLu4ezjA1SDAD/jHeWFDZ0KXGxonakQwBjt9tdwqX0
         O1Goq5yNaCRmZSZrm2MOPv0/j17vJQEVX2C7xSnr4loe54NY6yGcgzIuUwLfcipl4xjB
         4BnggViQ6szCH3cwa46TgZMK2hJUSzEcpQuLw3YBQrMgCVxB2XRTqBMitbWsqj50Djaq
         z6w1MbWoICOmSrY4a3HC0Gn81jpc21U5JNZNASFhC0SogCQS+B/QeEPSizXhzoxPIIwt
         REzw==
X-Forwarded-Encrypted: i=1; AJvYcCXJiFNzgC15McRABp6DLRZyC8vg3fb8JXqRiepY8mfBgtjL69eBGJB8Y/0HZsB55wAflQ38wnj8f/op8k7k8t4=@lists.infradead.org, AJvYcCXPsVHtm+TmHi5oOcNhCkQoZLx5GYDDj/7YC5GMhXOuqzIK75hQRiggWbnRMrjfhnwJyqVbO03s6fel9IPvhpxK@lists.infradead.org
X-Gm-Message-State: AOJu0YxfiNK30vrVKJLKVmsKwkUm1h/NJW6uCLTd/wjRRrfjEXYO3B0o
	Dv08c/P+gKMbiuLM9Qvarh3Xvg0TtFMexHrVQySJU5j2F25NGm0P
X-Gm-Gg: ASbGnctia1O0kE9xr5FUTyKzRZLus1M8326r0Dqh/+rfUqvg/yIgbkMP1ugjpL3lCLy
	B3deM+sMMAD0+u/b1eSUuUic9CewP6HPKxOhQJhJ986dg+tz4WvM5aJSaRGBWMiD4wFsXCLMCL4
	LYrry1VvDTBkyNl4rEL4IjvVWk/oR3weOV5EbwRM8EiYZBL55Wtt5kuKmVmFpVP/98VJeR6KXaB
	+H+P7nF7SNFOs5QeSzkSc5JePkf2iFScqN7jadn+dEKhKkOQ6XauRSX+3o+utp0BCv9oghUS0Se
	2k7VzUJKJXYC2UsiWp7mTGaQLz4+/E9KgZpq1nHv7PJXb1QXSbnyveF83wePIzq9M8NF4xAoYPG
	mu9j46xqLjQO6de2hf0wCfozLv01pJkO4VO+VuLmsaH18skwZffkhoOlGTW3ySr+wFF+tvBMhKd
	HI18hctsTPsBHL9c0Gopn+EOTV0udmac8Pd4Or
X-Google-Smtp-Source: AGHT+IE6K5QuPL0CYDavUECDApY4RUDAY7s25l+mTuSsN7chkj2mJAKPLCyG8n2b4/sGMgLXiSRYSQ==
X-Received: by 2002:a05:600c:1caa:b0:43b:c390:b77f with SMTP id 5b1f17b1804b1-43bc390b9ebmr29766695e9.26.1741033006923;
        Mon, 03 Mar 2025 12:16:46 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43bbed8b26asm61412155e9.22.2025.03.03.12.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:16:46 -0800 (PST)
Message-ID: <61ee43ec-be20-4be1-bfad-d18d2a4fae2b@gmail.com>
Date: Mon, 3 Mar 2025 21:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 6/8] net: phy: mscc: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_121648_861503_F884C130 
X-CRM114-Status: GOOD (  12.20  )
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

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mscc/mscc_ptp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_ptp.c b/drivers/net/phy/mscc/mscc_ptp.c
index 738a8822f..ed8fb14a7 100644
--- a/drivers/net/phy/mscc/mscc_ptp.c
+++ b/drivers/net/phy/mscc/mscc_ptp.c
@@ -17,6 +17,7 @@
 #include <linux/udp.h>
 #include <linux/unaligned.h>
 
+#include "../phylib.h"
 #include "mscc.h"
 #include "mscc_ptp.h"
 
@@ -645,11 +646,12 @@ static int __vsc85xx_gettime(struct ptp_clock_info *info, struct timespec64 *ts)
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_get_priv(phydev);
+
 	val = vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL);
 	val |= PTP_LTC_CTRL_SAVE_ENA;
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL, val);
@@ -696,11 +698,12 @@ static int __vsc85xx_settime(struct ptp_clock_info *info,
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_get_priv(phydev);
+
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_MSB,
 			     PTP_LTC_LOAD_SEC_MSB(ts->tv_sec));
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_LSB,
@@ -1580,8 +1583,7 @@ int vsc8584_ptp_probe(struct phy_device *phydev)
 
 int vsc8584_ptp_probe_once(struct phy_device *phydev)
 {
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
+	struct vsc85xx_shared_private *shared = phy_package_get_priv(phydev);
 
 	/* Initialize shared GPIO lock */
 	mutex_init(&shared->gpio_lock);
-- 
2.48.1



