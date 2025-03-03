Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C93EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=; b=akiMB6sMNZpytUma5hbQiszMhG
	dAXfzjoHZLdMbMVPNJpwkYqH95TGvqFhKDAOjUAzIxz3+5IGqM0vzdTcirFcqUSVGb93eM6A15GXd
	wZVAU9dCvredo7qednvJ4K0laERC/l1uW2XK5ZCkBnsdvI63WXFef2GK9ipJThxuq6xkBphlButcW
	JXC+BVmS2h7pt5ULr1qpB6pKXzE7uBUDCokKhkChVXBukpBLGoyDM0ODohzGHHMmYXMNBwaP20Apc
	LBbDVwcSoW2y4wBXtK3/tU8mNbQRdt71Z9MYfsrWZrjfxDezY4PFCgzBjGQtE7tNKOvt8R14sqT8A
	EQ54peJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCGf-00000002BTL-0nkl;
	Mon, 03 Mar 2025 20:20:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCCP-00000002Ant-3Xue;
	Mon, 03 Mar 2025 20:15:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-390f5f48eafso1374776f8f.0;
        Mon, 03 Mar 2025 12:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032936; x=1741637736; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=ava7dnhYtDwkncgaMwxtqVdWE4SIjQqC38L0APO6gtt4iP9Kp40He5b7jGjTD8YCoW
         Q+7xy48AjdvtULwK5L5ShuzWPhbxp3dMEPTfFG3fIdzM5k+iFhbsZxWKx5xccr21bkFG
         ylz4bWSZEb8dmTbRwSyVOVAcZef8KTXdkSP3WhbhHzobq0UOxLP3N8V7HZI8D8pwDXfb
         dsgPvSrG9+nQi8GumDHIyptbjG/S5t6PVmQblZSue4tu9Ppj3Lju5hA39YOPvRltRhUr
         IfD19qYoag88EjQrBD3d0RkojdhOaai++XXALpKBEXD3nLhyyVYeiAe+b/Pghh5vtW78
         1hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032936; x=1741637736;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=nuQWtO3TD/+Vs9kd9WPwYqFsA9Yt+ViTe2qq9aldSpBIE2pbuXWUwl5ujoehtmOi6Y
         QxSMD2mODifU6rloIFnWiwtsW8SmQncJzEU3qRZlMnSUf2wgP0jEc7BdiyOkHr4VAFP3
         ce0BZW8ESxBDlrOYk2NFeSJiyPI/23BLRaWstuSo2LzoF8i/6nVavNx6hP8Z2coLrYv/
         7io3Qer4eowQGoZGPEx+hqaRGttAAO39apoNOwPfcnz4/Iqp0MGc5SmnSJk3AlMeVSBU
         cmIKRH2GPVYivsPsyn2xEN8kz0FyzlHsd/WfvLGteddWg1dEXznCOmU4aOQte/dgMwrz
         eIIw==
X-Forwarded-Encrypted: i=1; AJvYcCULHiv/rWmr34ZkxzZGHTboW4GA1f66w90L8uecJj/g6N2OfsBvxfFMo9iZuOPTMOkfAxBGqFk+NAP4pxrd0jEO@lists.infradead.org, AJvYcCWPreuS6jcfnmwIdux/xTWOKYSuXdo4PtNstee+yv1CQkC8ktKoPeQglW2j3Yv2CIZrcpSzO3GQMZe+zSzjG1o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwARHZbJl6B+L4SWC/lO+ZFPy7sczIBkOkSGOUGPdTN1qnoeIyV
	0m4KBH5+lfzRk8OW0/gEbOEgCXZJSzqTW/hmxitWv28B6lF4VJ+n
X-Gm-Gg: ASbGncvfg0XveXkw+be/Fht97iCMJWoEXXdvGWl8yEQYw3EHPFubhLrYwu9+tGyP3Tv
	ED41SVIotryl5W6WhRy78QxWYAkV24udhTcqUY/uAu04fGbvrERVqEIuxY0iggb0WKuvhw6Jrqm
	V0d955RaxEDQSeCxnU1YNeYm1+B1yXKVuv4dJL/3S8V/WkbBVRNsWHm4pPqHk3Kpv9gLHbVGpIs
	2LgOK9QE+VJvPG1Hekzftl9odX8udaXfc/cRNdofq5vBFlpkrZUMBAHQvBm27q6aO0yHs6mYWDx
	++Ku79bpi8ynqLGW77vvp2o8kZ50nmx8jtcq2NRNYXbLHnEJt1uwJlIqgalONCK1cjaJVc1XT1B
	n51HDqjOwSMEfkVhBsyfn/f0n1VnA1Q+hB9PmCi9yMcjM/KFRhTsQzEsZhD1gZiU7/88vVHQ7cE
	NcbeMxOJajiAnLDVZTrKRes6fMZQdw5tE4fO1E
X-Google-Smtp-Source: AGHT+IH/IMfNtCuqQ2FJviAs1RgK/Rd4Cju6cry5jC/Lm8SLZoUPe2Kvod2T7FUr3N/bfh6mPLBhTQ==
X-Received: by 2002:a05:6000:1788:b0:391:10f9:f3a6 with SMTP id ffacd0b85a97d-39110f9f4c1mr3262340f8f.34.1741032935649;
        Mon, 03 Mar 2025 12:15:35 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e47a6a87sm15659695f8f.32.2025.03.03.12.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:15:35 -0800 (PST)
Message-ID: <18e5d29e-fb96-4771-92e4-689e0c992177@gmail.com>
Date: Mon, 3 Mar 2025 21:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 4/8] net: phy: micrel: use new phy_package_shared
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
X-CRM114-CacheID: sfid-20250303_121537_887290_131539EE 
X-CRM114-Status: GOOD (  12.42  )
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
 drivers/net/phy/micrel.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 9c0b1c229..289e1d56a 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -34,6 +34,8 @@
 #include <linux/net_tstamp.h>
 #include <linux/gpio/consumer.h>
 
+#include "phylib.h"
+
 /* Operation Mode Strap Override */
 #define MII_KSZPHY_OMSO				0x16
 #define KSZPHY_OMSO_FACTORY_TEST		BIT(15)
@@ -2631,8 +2633,7 @@ static void lan8814_ptp_tx_ts_get(struct phy_device *phydev,
 static int lan8814_ts_info(struct mii_timestamper *mii_ts, struct kernel_ethtool_ts_info *info)
 {
 	struct kszphy_ptp_priv *ptp_priv = container_of(mii_ts, struct kszphy_ptp_priv, mii_ts);
-	struct phy_device *phydev = ptp_priv->phydev;
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared = phy_package_get_priv(ptp_priv->phydev);
 
 	info->so_timestamping = SOF_TIMESTAMPING_TX_HARDWARE |
 				SOF_TIMESTAMPING_RX_HARDWARE |
@@ -3653,7 +3654,7 @@ static int lan8814_gpio_process_cap(struct lan8814_shared_priv *shared)
 
 static int lan8814_handle_gpio_interrupt(struct phy_device *phydev, u16 status)
 {
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared = phy_package_get_priv(phydev);
 	int ret;
 
 	mutex_lock(&shared->shared_lock);
@@ -3864,7 +3865,7 @@ static void lan8814_ptp_init(struct phy_device *phydev)
 
 static int lan8814_ptp_probe_once(struct phy_device *phydev)
 {
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared = phy_package_get_priv(phydev);
 
 	/* Initialise shared lock for clock*/
 	mutex_init(&shared->shared_lock);
-- 
2.48.1



