Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A56C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=; b=qTo5XhYy7rG5X9H3oWWI6xCiT6
	VBqKVsKinfFFlZ5PIOSaaYHMK5mJVgeIcOWY4NIHrh+G3UU5pipIy2pdNiclpmYMR9GZKbVyPGjNK
	cU2M6CHaOIAZNlB35IJCnecQxTInx5/dE4QstaN8HgA+hTiGrae5laIOiZWxMSpfDTukEh8T/k2F7
	xEeCkleLirzJjz7fc5vxhCAnqQ+K36UkFKSxg3eTwMixky7fhWh8IrK47Q+mPd5VoLaeHROD9Nanr
	x1exd/dPgWddkXqXV/bwDfRqyz9BWPaDInmJ+mElaVsG3wP7jrh2s3fhiT4CcRLxweOGiGn19imm5
	xHT9gtmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8IG-0000000CmVN-1piF;
	Fri, 28 Feb 2025 21:53:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Cz-0000000Cleu-1kAM;
	Fri, 28 Feb 2025 21:47:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abf4b376f2fso50078466b.3;
        Fri, 28 Feb 2025 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779268; x=1741384068; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=dlcl+UPFLLEobJhsuWYBLN0OrVYJBxomnvxEiZ/09tg02m3tzjFKKTXscvzS3RGxbO
         Hv/FWepI7F1XIBkB7QM30YXCxygRG4Hk58oKRuWKs7tWd6RwvoqjL/Sq45zdEB8NLqe8
         8MFNAbRdPqu0nKEtoQGEDmjl42MOweVl9msAQ+tr01XzchZx19W453nMOfO/EeNFxtbx
         1HIqdMxm6s9B+2tfOhvoAdguCA6hCNyaZpkBXjDxWe7RmbqSN3crbyQVkqvCqR6mDNHf
         Iv3S4RLXf0LGpf+ZIvwK+kuD09VlWeVmU5mwbqq9BqYTYH4n8meknzAB5B7o82hFXMCZ
         0oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779268; x=1741384068;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=l4AbNQKLg93H7woJKgOh36BqQ5sNtYLAa7iL8dpKqTE5DNKHkwuTf+5YjVEpSucaMS
         UDfPCn26FyqJuptx1xd12s6qRdU9K1Y1FqO31NPuKbbFpH90iuMmtxt+B7wpBRFsztBU
         oDYQhCyUhAz8DauTkKYRVaMbillL/uYV0XQ4OnfNZ1y+qVHS0hRZlA5ow5IOR4uVaUKH
         GvN+jaDP7POT6PXip9LWkpMDA4yKUDFj8RU1UDZ9A4qe8LmNemRfhvB8A+CcCftgTCq7
         S9P/3+cVK7zpBFvBCsw89plwG8LvTCJ5ZUKBsU/owAzYfkq6EyABQYXO50LNvOjPjqwg
         5dmg==
X-Forwarded-Encrypted: i=1; AJvYcCVtY7dN+9kOZxq/BNQcyfqB6ALhI8h+41ngWkNKCDjRxVjreeWUfGvua920ww/Y+go+DmV4GNJWKj35zCvpKiv7@lists.infradead.org, AJvYcCVw+gISXH8kBt9aywCd9xR/XlnUzYi+IuR70s4WK6gBpjW2NJvfao+ZvBlYyWSEIHiFEoTPid44Jql3yNyOR+I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJYC+U1CKRHG+WIag0K4N5GRjLjG8yjrFIllIlG3AGSpmKcHMC
	dXPLo7yGSFvfPA3IyfyHlJAKegQ5hxhA3W14huHidfgSzfJbcv1e
X-Gm-Gg: ASbGnctCJo5KETFvcYvShfFBdWi57qI+f37ixxeM+/hxWl2a+ia1nFwTZiQE6duEVxf
	Fc6hZs6hA954bpnb3pp8ATjD7p2ZHhW/d4zZYL1leCQuW9phgbvgLlAwDmXeJbxH+wFt/XSgaGg
	VEIb74i6Bl82LZm33H2NQ/zDRuPaXp6jlG9VtX/B6SfsAa4tS4TJiX3iU72dE9796NqjjESyN4P
	c8XEJ5KmC2yngaoFJ+bQ1pRPMchBVySckAVrJnsQTMGFtRFZmloeu2LW4tPdMpRKluj/L5iEUPM
	eGgBGs+GQ+vrtJOxHOur2FGMYPxzF7tOnAzD5CkkfWcl3YSYW68YSwIIGBkRhBrCAYU5PZCch4U
	nJvM0UP9QsSMfpKn4WxVD+emlesU9yDN1realHeDuMldAvViD7+ZnUv/ba/0asEflFJjDcDZg09
	hPrLjULTWcDLxvHc4j3Q==
X-Google-Smtp-Source: AGHT+IF+h/Li1VyE9OxDse2QjEcQlAaMcRq8CKJSdNUVXrvqPL44/VoyPNWybJjCTgD/lHb/PQPcVw==
X-Received: by 2002:a17:907:d8a:b0:ab7:b072:8481 with SMTP id a640c23a62f3a-abf265ce47bmr488214866b.45.1740779267725;
        Fri, 28 Feb 2025 13:47:47 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c0b91dcsm351095766b.21.2025.02.28.13.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:47:47 -0800 (PST)
Message-ID: <2a197fb0-322d-45bb-8fb5-0ec8d93a47f7@gmail.com>
Date: Fri, 28 Feb 2025 22:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 4/8] net: phy: micrel: use new phy_package_shared
 getters
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
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134749_457104_FCC2E4C0 
X-CRM114-Status: GOOD (  12.54  )
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



