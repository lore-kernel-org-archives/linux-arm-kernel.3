Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8115AC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=; b=x7rMkvsjhB0TZufkSebbjwABLr
	TF35yw4HRRY7K8ZoEhUqGvMA/VfKMUmy6Mo3zqM8YbHVrwCi4GAeasma/WVvxu6UxOjmroY7/fLJD
	aFjFgDphQ0UAfnspusDWCIQqDqR9f8D6MpkK04iATycs3Pj7mXh72m4bvNkFXVZwtNRUyCxLkorjR
	UJe80KqzbBp4UXR5Oo4mlJmfkY1EgAaoPx1TNeqD2OEdwZehbhr/rYPphYhp/06iKYiAFqwcHCQ9S
	Nj1gOdIRu1+xCy2toUZ6CkfoZyDLyJHPXWNzBGghU2LxaEY4BBzgg9ZMtsf/QgOFmkIU0bSLskBDn
	HbaVZMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCF8-00000002BD0-06Eg;
	Mon, 03 Mar 2025 20:18:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCBi-00000002AeY-2kQY;
	Mon, 03 Mar 2025 20:14:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390cf7458f5so4586742f8f.2;
        Mon, 03 Mar 2025 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032893; x=1741637693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=XnDfqAgfgdiR6Uk1B5l7HPmwd5a2wDu7m8skP/+F3ZLEJhsefN3xPweCmQVQLxNuEW
         ClsgDAUwvuwLDPnzeOtJDR+XNTAEmgTpEgBIGw6F3SwzKTM7yrwd9+LeecnoETVHVuQD
         h2FrbVlA7XQXeITHg9MIKixG18lUi3aMu010PmokEF9TkXlThwogqbd9lFXQDG8L5FWi
         OKx7vZaOX84/8Q/pKx9kVLgVvs5xf99Fti9VcjYxlu+d6T4nLSbgagj8IDQCd1qHdfmG
         qc7hxUOTGSTYFTkhhdFdzKjxQhAcLpDUvy7qmVP+nmHsGHvA4bhIgCXkoUULY8DsoITu
         +89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032893; x=1741637693;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=Ff8GXnjErgR0RO2L+JcXb5g1KcnoJc3Fmt4F5ZiAAIg4P/6RN0i2sRqlB4y9D4JE6b
         QC47lOu7X2e94teydHjpZcYGYShZ5STXrMzwWepVNUNIfNBECY1XI801k+WxodCflN2l
         1Bv17EyjXFMGO3ik/+2fKZQtU38Blx1FYSwu7jp13O2GUeKJFEuWzPjWaCMyIm1Np4Un
         0TAN8bMzznsrp6Kw2vX11ajjzepj2g7D0Idnw0inhrGKfb2mrBRZMo+90tZvMswEboNO
         XxsyrA05TZ3PeR/Gf7h2jV5DmSMLcTg6UZwRo8awLo0ZP+vSVFFNS5RC4JJTwN10aJrc
         w44A==
X-Forwarded-Encrypted: i=1; AJvYcCWh9eXuTIJRN8GucjbFC5HdvPHP4hRSBBt40t8fSX+d4nm4qD7AWAWXfxEqiJ0AOMTl1RKst854tXOsfbkwBxM=@lists.infradead.org, AJvYcCWq4d034IznPv9LmixjpOscTuuGgF4cOQ37bDDY+8Lvt0Du6LqVtTO2razjMztmWCFHccXSnPLezbawIGKnnM0J@lists.infradead.org
X-Gm-Message-State: AOJu0YwptApTg9ztqpJC/VnzBSiyym3wzl4JXEOEk2gBLWJp7Ktic9n8
	splSONreq+B5tLI/MpHOyV9WrKcgU5TMtytd6XGntNuqVtROsJ/h
X-Gm-Gg: ASbGnctoq9i8G4+xilxpV9ZAd01yQh4+JHM4eL87ACLpAGEHWYX8l3W4H9MdlM8vjCw
	jtsQimrixC8gBdre4s+SkbMCFiAq1QmBkbqau+TfgPD+O0jkBnf5LuhD8dVZPWbxjI0xKHS2Lki
	2W58WiGOX/NL+GkeBmP8Vco3guwyxz1Db5DJe3jN1Fji5UypD/TVnayuhH2qOhOEAifjXhkyhqw
	JIzuMGwUp8oWNgYEXd3bmFEf1EBQa+3parRJylsla4h2GIL5PVzazt/3/YVgM5mxYwQnnSgK3UQ
	ob/NnQq8zV4Vfs9OFnyjVYEddlypeHa5uars4fgByHMjrlnSDmBlolbqktqxVf5lZMjTUyo8UPR
	9y/Vpv2ZN0+570RF7GLvK9xBI7k2DUUOOIihtiHUUsBQbZWerqNs+Z9dQpFs6zKyHS3KPMgruA7
	Y6Om4w8+s6MMqFRxgUsb9x0WfkaJF+v1Dhn4Gu
X-Google-Smtp-Source: AGHT+IGARpDSg5XhxYbQGckwRKwrsrKe87MnLl+HRy5bpEImeWmi57FgLD2j7bX/sPPwidKvu1eIfA==
X-Received: by 2002:adf:fc11:0:b0:38c:5fbf:10ca with SMTP id ffacd0b85a97d-390eca06cf4mr13275775f8f.39.1741032892907;
        Mon, 03 Mar 2025 12:14:52 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e485dba4sm15702921f8f.92.2025.03.03.12.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:14:52 -0800 (PST)
Message-ID: <b6402789-45d2-49d6-835f-ed584bce5b2f@gmail.com>
Date: Mon, 3 Mar 2025 21:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 3/8] net: phy: qca807x: use new phy_package_shared
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
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_121454_698484_0842160B 
X-CRM114-Status: GOOD (  13.31  )
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
 drivers/net/phy/qcom/qca807x.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 2ad8c2586..1af6b5ead 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -15,6 +15,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/sfp.h>
 
+#include "../phylib.h"
 #include "qcom.h"
 
 #define QCA807X_CHIP_CONFIGURATION				0x1f
@@ -486,13 +487,13 @@ static int qca807x_read_status(struct phy_device *phydev)
 
 static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
+	struct device_node *np = phy_package_get_node(phydev);
 	unsigned int tx_drive_strength;
 	const char *package_mode_name;
 
 	/* Default to 600mw if not defined */
-	if (of_property_read_u32(shared->np, "qcom,tx-drive-strength-milliwatt",
+	if (of_property_read_u32(np, "qcom,tx-drive-strength-milliwatt",
 				 &tx_drive_strength))
 		tx_drive_strength = 600;
 
@@ -541,7 +542,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 	}
 
 	priv->package_mode = PHY_INTERFACE_MODE_NA;
-	if (!of_property_read_string(shared->np, "qcom,package-mode",
+	if (!of_property_read_string(np, "qcom,package-mode",
 				     &package_mode_name)) {
 		if (!strcasecmp(package_mode_name,
 				phy_modes(PHY_INTERFACE_MODE_PSGMII)))
@@ -558,8 +559,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 
 static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
 	int val, ret;
 
 	/* Make sure PHY follow PHY package mode if enforced */
@@ -708,7 +708,6 @@ static int qca807x_probe(struct phy_device *phydev)
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct qca807x_shared_priv *shared_priv;
 	struct device *dev = &phydev->mdio.dev;
-	struct phy_package_shared *shared;
 	struct qca807x_priv *priv;
 	int ret;
 
@@ -722,8 +721,7 @@ static int qca807x_probe(struct phy_device *phydev)
 			return ret;
 	}
 
-	shared = phydev->shared;
-	shared_priv = shared->priv;
+	shared_priv = phy_package_get_priv(phydev);
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-- 
2.48.1



