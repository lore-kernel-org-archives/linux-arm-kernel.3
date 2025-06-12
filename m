Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1DCC71148
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo9wzmPugQy46hcPSYpcUoW3QHliUX1AUw5rA3sdlD0=; b=nYR4ZknPOxUHZmsFShv64cFhnI
	Prsk+id+/KyK/iFViZyEm/igU87VG2ckfhCf6v+2FopAtkVwiZ7TKABWktRwDJNkiiwefJC1iP1Rr
	WmII5+utHP0a96T4SIWwfyJk8Bh/YZyXXvXfdiLpmo4z4ep47eqccJdh2Oag+t1Aq9w9pIx3iwZwM
	2gIkvGkctNRZsjKBxmAttyEaNmMj9tFZl7EfTIdtHezA2BbaGvMAWFoo8b8jC1RPucBACDIs7NU3t
	6IFyY3U1QpQVHbCiD8m9/dzaMyyvnoii87JjywsB0UGfAobx3t3h+bKNL9zN6vrB1LI2OR8qO3lUw
	BcDd12gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqoW-0000000Eobo-1HSY;
	Thu, 12 Jun 2025 22:54:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpRg-0000000EeSj-1zeU;
	Thu, 12 Jun 2025 21:26:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a51481a598so894197f8f.3;
        Thu, 12 Jun 2025 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749763607; x=1750368407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo9wzmPugQy46hcPSYpcUoW3QHliUX1AUw5rA3sdlD0=;
        b=f/ec2JXR7DX2bM83fI1eQsxlBdlURSotb1wpQDBys0UHHQgarHEpOxzGADGA8lp+d1
         L0a/Cyay0eDC5LSTIzOFQndKNllEqFvAN9eh7VyMVlrF7+rXGLCkyHKjgkXTO3sXjXWS
         B70B/OKDsDo0KFwfSBSl76ZH8mz6ceQ6d1CDDQKHeWtbSoG1ZOxerVpon8oWlXpTjDRW
         pZ8mX7+dKtRZGCgTkou08Wst7t2dTm2bFRmdA6PH0aUK3SCweN/IJsT3AP4Cd4XuyHka
         HfkDhOximUQUeT2mc8LPIosekgV0VOF+C6ZeLKC2WdBg5U7BqI8Z1+j2G+pzPoWX2lXg
         GrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763607; x=1750368407;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fo9wzmPugQy46hcPSYpcUoW3QHliUX1AUw5rA3sdlD0=;
        b=LlR3bqLH0oOIDcZDIiwQNZUQoruRjcAFvhX09c+Oxfta8md3/SdHHpFiuRBC/WgRe3
         wOdvPiphYEONjgn1HVpXXq8CantLbP/qeEJq/uMbVhglpN92MWv2h3gdHT+DizqNnine
         BVYcwMGaBPZik2P6oJgUysvq0iVsOLsXZ3BPrxWZfV1d+bx7S67iAHrYh/RtTdoSYvmo
         BOuba+qahOZMmeV34/3zahhwmhXthKI3xFy7KrwkmXbUxevWu68BgEsDkMg2bQJGJZda
         O/fa7TsUXlBQrd8XeeilN0Bv5jkAqebtnT1639X/84aRMZlzpZJtdVV4hnRZCxWFbvYW
         k2IA==
X-Forwarded-Encrypted: i=1; AJvYcCXOsF3BIG/klXvkOJFcWn1/bk6l418xfVn4ucmt2301Qai0Ab5NeAlGjeSlVlMsbUWJO9O/YvuHI9GcejOVyG9C@lists.infradead.org, AJvYcCXy4sq35E09YQbJZYwLwgLUHnwQfeQdmQ5nn442q8EFv7DaHNhjHkrdakzjxzIiXJ3F+O363XrEdJYGRGITANY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2HB5h1HCpJnjZhMFpPsz3msGdOcukuU54S6f7TpQgcYHu20hs
	EA1DfRE5F988nqTncog8UPN4v84ytW4BDEgqRyo6zMV1dQ8TfBjHXR/i
X-Gm-Gg: ASbGncunOeEdT5mdxLrmqGww18j1w/wjHQxjROD0rf2A/gaJhZmpVeKhLMMISdsdhBt
	lLi2UcBnwE/4lUvgJ1CxlWJmYDEF10JuoPzJApTaCl9wpCrbPsQZAHRX6hhqC8c7mjoQZ9N8ORm
	sMt3QojVQGEr7NX4wH8cc8hXR/aQ3mIeBzUXriNgNHr2398J4MEvjgMJE3TO5K1te6H9Fz4ficW
	Y8uEvxwiLMrOYMHBSwbMNtci/eIlnuM8X62aWQHnL3+c2/IBpw8C3ESOWI03fl/xymM4DEAyPrp
	K6ti7BhosbHsBK1MHR50rwhJmmjOqwhpgaZVD0z+omzUIYlWaZJuqoUpvVZWpjdMBvc2S+XFC4m
	NSFDwJgQA4VOHbhYqVcP7uFGE1SE/oUh+qWndbNsOCqanAEx7MeK8Hp6dTbv5v1RV5aSAaTnXyd
	PUhCfB4fqFRByngzwJeCd2czGQxw==
X-Google-Smtp-Source: AGHT+IGjhaPDdiFgN2xGS7Y5o5eCrajDG/RKgkSt5hb2yP8w38zJXvf9AZOqP79PpvYJ+nGTlwFQqA==
X-Received: by 2002:a05:6000:4313:b0:3a4:f7db:6ff7 with SMTP id ffacd0b85a97d-3a56878834emr701000f8f.52.1749763606594;
        Thu, 12 Jun 2025 14:26:46 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5? (p200300ea8f223f007533d8b1ff146fe5.dip0.t-ipconnect.de. [2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568b5bfefsm388520f8f.88.2025.06.12.14.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:26:46 -0700 (PDT)
Message-ID: <66bb4cce-b6a3-421e-9a7b-5d4a0c75290e@gmail.com>
Date: Thu, 12 Jun 2025 23:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/3] net: phy: make phy_package a separate module
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
References: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
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
In-Reply-To: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_142651_148761_8E7BF594 
X-CRM114-Status: GOOD (  10.35  )
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

Make phy_package a separate module, so that this code is only loaded
if needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/Makefile      | 3 ++-
 drivers/net/phy/phy_package.c | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 7827609e9..4e69597f2 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -3,7 +3,7 @@
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 				   linkmode.o phy_link_topology.o \
-				   phy_package.o phy_caps.o mdio_bus_provider.o
+				   phy_caps.o mdio_bus_provider.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_PHYLIB
@@ -19,6 +19,7 @@ obj-$(CONFIG_MDIO_BUS)		+= mdio-bus.o
 obj-$(CONFIG_PHYLINK)		+= phylink.o
 obj-$(CONFIG_PHYLIB)		+= libphy.o
 obj-$(CONFIG_PHYLIB)		+= mdio_devres.o
+obj-$(CONFIG_PHYLIB)		+= phy_package.o
 
 obj-$(CONFIG_NETWORK_PHY_TIMESTAMPING) += mii_timestamper.o
 
diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 5dd5db7e8..3024da0bb 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -414,3 +414,6 @@ int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_package_join);
+
+MODULE_DESCRIPTION("PHY package support");
+MODULE_LICENSE("GPL");
-- 
2.49.0



