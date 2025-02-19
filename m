Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52803C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZAHh2OdHKZwEsiP5fYwkXQcQmA3xPDUfpI9pIJgRJA=; b=HDFtdUlEb5BKX2RXPP+8jfi0Qq
	41mEJAAEUS3rTFrwwvdBTcdfW6e6lWtNFAmhubMTPTGRzOvi+G6RarM6KAcD9K/ywBVX5KCucFHQs
	ON4oDwBERrG7v9PWRxhcnbP4IHs1d1T2ctk5CHCXHFJYBtTHOObHKqT7gvnuFX5VCwiSMKYLH5ctT
	rlKFNxW7TKFshjCb/PGsIs/FkWOYp85pRIvzXdeANsQOB9IfFlBAW7V2ps010SQR0M5WUuAgP+7OE
	dvFOl8qYvu55Lcx2kHjpMpKF5JStSHL36NjURV+y58pR0cZJbnaIHi++27Ow622uVT7nApPRSqQ7h
	6wwiIGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrMR-0000000F6yi-45Qf;
	Wed, 19 Feb 2025 21:12:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrGD-0000000F4fa-1itH;
	Wed, 19 Feb 2025 21:05:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso266287a12.2;
        Wed, 19 Feb 2025 13:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999136; x=1740603936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZAHh2OdHKZwEsiP5fYwkXQcQmA3xPDUfpI9pIJgRJA=;
        b=jOqG/kDwcZm3oYtqjreVhsPoI788Jc46a3j+VngJ0F3yHAVzGY7a0gQRexvziXagKS
         LV6hUjg9IvITIDuFCE38aGTW+++qeUil1byVCxUCpzxhbYI3sX384cArAERZsaszOMvj
         1KhdDrwcelsdZpxxqyz7Fu1qsx2dqfzzQDwwWmq2lyD3V8h3Cmls/4P1LyMfSd/11cOk
         PJGwOskg19w/KoLj2PfEm4fkY+e/DiRxOezw58oGSk0+m7DeRyA2KncsmM2e5zD59twG
         Oz6cskEls012NIh4eJiocR7ujDab3K/aY+0jquRI0earJqyrbR8U9Q2YDqRBGBKnnNp+
         XQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999136; x=1740603936;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZAHh2OdHKZwEsiP5fYwkXQcQmA3xPDUfpI9pIJgRJA=;
        b=GsjM7LLZToPgAcgRlOW3R+Lq+iAdQEeuRnI1dMTm2rXNdw7GK2tE1XvnqiUotdkUYG
         o5xP0yoQ4OJnIt8DyYfyu8VK6ZocrHBlfQjl+BuQQ7Gc5B0a3/op7+36KsInfEIaHiZ/
         dQt85PGMZhzUCB/3wdzNgisKYvHsETdaaz4QAaTFboEkm2dGjEL6N4w0IpPWGfWDcR8b
         F1fbkouRXdL3rbsvyg8truINm2OXeTAnJjA4L54m1hrprIwsEf4lgw6ouYVmnzmH+fea
         T5ZvD1EXAxVaDWiI7DEJ8x7sakfM/dM/Tmv30SfSw1zowYQnACyUXOZ3pQsyZl7f7W52
         nztA==
X-Forwarded-Encrypted: i=1; AJvYcCW6LbadZ2fCygrq1KTCRnwoNjpc7RluKEIQ635PIq7l0PMJEtU0OMr/KoSlBhjnJjBHXJ+dWzADX1AGma1yKJsi@lists.infradead.org, AJvYcCXd9i9f9wAyEeYoN45OWQZcWD6TEHAkxR4vM7A4iwr1ZrHC2PXgqbA+8IeVMjhlAcMC9Qv8Psm0soJyQJDnX5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeY2Bun0HxPrBhDWZiChw2JLoGD500Bx1yxfyCXqiQgSxuPlfI
	cwJdevsJN4H5Z6oZNh1q8nYCgd1Mfp+KnahVLP2Rr7PD8eaMiAd6
X-Gm-Gg: ASbGnctCAua6COVrmMV5OpvyJ5khl3qc6BvMOH7gWY37STODA8SHtc9/mAWO7yoGHQI
	fhHV1fW/zm9oBwVhQvGwr2L9VUamSuZR25BAp26g9Jt66H9w3L6s5bdaBmU/iq18DG4tJ0+rlAL
	LhnE7rzpUDEsCvxxxVQ0cENF6yfj+2oHftPgk/5a9AfGTSUsJZcLmgWM/NfIYwFXVobU3/a76V/
	nhqGG9yKNkW4hAxFqTlfch/xMUpdYQJezSLn3O6jeqih2AJmE+c1F5q2KIU0FYHueVuJErto9o0
	UYBPyt1JVNB7591ekD7GPnjg89iqxTyeG3tq5dNmilKV4kptPsRwyPz+wK8axHB1M+gK00QcQbO
	Rv9liZxIN6hOLGb+XhTSqAZYqLPlwdPsrB3xdlEstsR+ldKbzKXZxxGJ6hNfmuj0YjqdS4TX5Rg
	Ljf56KCwI=
X-Google-Smtp-Source: AGHT+IEkszdtXGV/7ENUIkC1sOAfPOqqYxfZQ50jT1yx8oDmlND5s+THgaj7J1gzfFaTGdOMe8eRCA==
X-Received: by 2002:a05:6402:3220:b0:5de:db0e:311f with SMTP id 4fb4d7f45d1cf-5e0894f7b72mr4594859a12.4.1739999135520;
        Wed, 19 Feb 2025 13:05:35 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece287d13sm10959759a12.68.2025.02.19.13.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:05:34 -0800 (PST)
Message-ID: <0f8a5569-0221-4b41-8f39-3ca764701471@gmail.com>
Date: Wed, 19 Feb 2025 22:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 5/8] net: phy: micrel: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130537_459285_4785D4CC 
X-CRM114-Status: GOOD (  12.74  )
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
 drivers/net/phy/micrel.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 9c0b1c229..1705e043a 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2632,7 +2632,9 @@ static int lan8814_ts_info(struct mii_timestamper *mii_ts, struct kernel_ethtool
 {
 	struct kszphy_ptp_priv *ptp_priv = container_of(mii_ts, struct kszphy_ptp_priv, mii_ts);
 	struct phy_device *phydev = ptp_priv->phydev;
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared;
+
+	shared = phy_package_shared_get_priv(phydev);
 
 	info->so_timestamping = SOF_TIMESTAMPING_TX_HARDWARE |
 				SOF_TIMESTAMPING_RX_HARDWARE |
@@ -3653,9 +3655,11 @@ static int lan8814_gpio_process_cap(struct lan8814_shared_priv *shared)
 
 static int lan8814_handle_gpio_interrupt(struct phy_device *phydev, u16 status)
 {
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared;
 	int ret;
 
+	shared = phy_package_shared_get_priv(phydev);
+
 	mutex_lock(&shared->shared_lock);
 	ret = lan8814_gpio_process_cap(shared);
 	mutex_unlock(&shared->shared_lock);
@@ -3864,7 +3868,9 @@ static void lan8814_ptp_init(struct phy_device *phydev)
 
 static int lan8814_ptp_probe_once(struct phy_device *phydev)
 {
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared;
+
+	shared = phy_package_shared_get_priv(phydev);
 
 	/* Initialise shared lock for clock*/
 	mutex_init(&shared->shared_lock);
-- 
2.48.1



