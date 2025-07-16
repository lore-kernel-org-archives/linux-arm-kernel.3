Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFAEC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=; b=eOJAWuQCVEqXJAOBXyjmsSMJhY
	ST6sL6rpF9cj0EGdVBV+DUe11RK8Ynuo0RHPz0lT/NqBj4NE1VBVI4Y2SfgDjWQRcJaXkF15ftDD5
	VlWEkT0D3hEFRATp6fb8ijpldEOtW+u+Ued/ZwlX9KxKVKAygpDOUdP8vuBNYix9SLVpSq+q/B/cr
	lextaH1SZoj+5zxqrDFEO3G+IQN7ET1Sw73F7fe4QNGejXGzBDMuhSjNvMJIlq5ouE2bSuOZ0g6ol
	tmgX/ZVxvV2T9imekJ/K3g4JkPIXoY16FPXeFybphmlkFo6RidrS9JTBZ91dVnt9vAIpZw5saofzA
	o4LqAlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8i5-00000008bgy-3Y5f;
	Wed, 16 Jul 2025 20:26:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7rP-00000008V2c-2eDX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:32:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ae3a604b43bso38656466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694330; x=1753299130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=EquShhu+Z5VyxBgp8TXqMy3w2b9gIyHNlGTzUqEntwSU/J1m409C8w6VW+MSmgp4pC
         IwTWzpHnHL1cU1+IOm9E9i3JwtfoR9oZQL8AoB0z2fZbg6DfGaTAb5ZZMc27S277LS1Y
         ut40dvkryk3XHmSRkEZotl2xuhRM7P8cIUmBl2mENyu/j9x0jBMjKDyhwrJWzsSWebrF
         9cZdwU5x9WKiruyeltcBNc8A9oSQ5EbD/ai7Wob6oMdW3HUjlAlTbaIzQlKnp8luNQ8K
         Xn5NDOQA+ITemwsKx8nf4KXbvQdBww3iPBbiocOE1YzOOk4GFBSDc7efGKeIBbLbabxP
         iQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694330; x=1753299130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=nY4LEl9+rID5B5Uy8tUKRSZYF4rKR/2EupS3tcm9VSzVcrdWlnfppEpKTGX+TJ8qNB
         DajZQNe3/YJgX8t9ll1NJG6CdxdKwP3ecwRW5VGe+74n+b5WVXXOx1SF1QUfcx0zyLGL
         Jm7khJBeY4x9f5TFk7Ndy/cULDUiNg65pdrKM2WBElRPNna3VWwHVWPa3ML3m3pcqqed
         VUA77iKx0Uj0KwjHDSlvXArzVBAvNR2u5fer4Mpm3jsnEQNtl+p2z99ZtgWzcX8ciQJO
         zlHfije+rtaInoawqA4yqzgpAw/gRRZdufUmYjWqhNHtHPTA3tc4ED+j88sCbAmoj7C6
         jv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyFy1WmWxswdZ/lHqHKeWoKOf719pTs0SH8MYfmKe6zJtaDjUjJaC0cqQIIWXYexIe4hbwjFYMRH9dncvE7pm0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9uhtpHOYTsRqQcd4Jvfc3bkDeG/52n0i0+b2bYNkNFQyEu8l5
	e7Pe/HVUV365QCC5IcD195rSpVoF7YOrp0hs3oEjux6kr8rtDCQAt3QW
X-Gm-Gg: ASbGncsQ6eduBYsaxP85ytZs4BvYdvofq57aDcge4WRvornCwKbFmzU+kVhFcCn6dtU
	Yj1xUsTT7FCZip1YhL678CwGMCj4W7HrbkaV/Ix1pdaqNUR2/Pne8vMw5kxao0p32PF/KwZ69XZ
	f02VBmuQelrI4O79Ki8Kv+Ru+j4WouFnllk9giUtiuv0w6sMLGbxZ5t6W4cynYnJ/m3yLpXm9E1
	TkAgKdF4/FJBhQb+m+w/cLBMz5qlDN8pu7QvIZyhxMp4NPwIkt5rBbwpvSiXE2GqwfNctaAFbKm
	oLI08t6umufeAq6VuRtgGZshs1gF8EFmcLdQMZVMFM+ZM8hrzHD1vK44BURwonzpWzG6RG6DSmo
	p7boXosO92hAhQvKQVbgnbpLHKy0LfUfRCdA=
X-Google-Smtp-Source: AGHT+IGSK/v+86lRq/XGVjTJfe2IFdQ5oaZ+aYy4IqTOkA5UDk3eVHHV7W/M2yeRakZoalV61a0M8w==
X-Received: by 2002:a17:906:255b:b0:ad5:27f5:7183 with SMTP id a640c23a62f3a-ae9ce0c5bc3mr288753866b.39.1752694329860;
        Wed, 16 Jul 2025 12:32:09 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:32:09 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed, 16 Jul 2025 22:31:06 +0300
Message-ID: <20250716193111.942217-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123211_694724_1FD26317 
X-CRM114-Status: GOOD (  11.41  )
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91..6f4254f562da3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.50.1


