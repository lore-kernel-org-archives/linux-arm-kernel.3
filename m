Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47F4CA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=; b=FIAn+aVn6Vh5iq1T98olLHhVM/
	zsAtj3JBwz/v0LhnmB/kHrD9Q3YoRUBvWSn+h5Th836AHuEBxqrxSRrkac5dbjJxNCg2dTaHNlrQl
	LMTviRgEQp0vWwwPiuH9BMJzKiDCDq9W3Afk7EwmniocSrtpt/hfHvYMf7rwSE9xHAnRPCJwLbaug
	E+6JQsAfNh1HRNQIAxW1DVFFHKQpPP4QlsSOri1/Ept8UZOWhse6XkjFGL4PQeLGNSonP+k4hUbzm
	PllOfWUm0bkp9x1Tq5mW8g3WQ0CtKh0eYFk7k3SRg9zaMHVibqvCWj0p/vCY3aE6vrFj6wKvTF5Tg
	1k/HAT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDC0-00000006cc6-11vd;
	Fri, 09 Oct 2026 16:11:32 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBv-00000006cU7-2nzs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:28 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so236095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562285; x=1792167085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=dWQBIBN2bpfj0FeMvvBjhWRFfMoidTDQ9i10IsZNOsEFIADf7CfD8txkKRPIIm+O63
         O8BxN+i4G2kzpVbW/+qWFGBzrtq+VqsPGBaS7kKlkbuQ0sjr0k7nlEC7EVzuv8dN9OhJ
         gBgDbNe1f4S5+4X5/IDNkmNXosgCDhlhhEzx9qrvBo4+lTWsCTeHjMeDLecGhO71MpMu
         MZN4bkCL6XgcaxLB4wGouX6eSXJs6Zv7v336TgekUVDBZdPTeFYN1IPcREd8Z2O/cHi/
         m7nRUpv5E994+AjaE2MlpO7OHdml337IUL9PHPiBFgd2lICe17PkfwO96sB0hCz1Ws6n
         MYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562285; x=1792167085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=FQ8zNeQyaErOCjCjR/irOJwuUhoC5YRM8tM5mANS8g6Kzp8sZwFeXLZGWZ79429XzI
         mL6WRA+ooYv5fYYwPiEHNtLUGjr6pXtVbw0UE8v4yENo3WkRNyu27xaOQCz7w3T8xKdc
         AuV45G89lJ6yyCGDqOQVYA5xuHZJvsdHrw22IkZp7NEjm41cBP0L8SHvLOdp63jbLwgi
         Bz1TBtc0MLiR+z7I1SOaGF6YroYOeM90tXQR9yYQHBC0m5PLrmJSD8DKPH7KBjgonIvU
         VDPhE0ScUUdtHj/ktMbtoHHzqFX5BPHbcCbSyMLHcTEm0EgaOqIT8vsCm9CZtFuU/X/j
         +MAw==
X-Forwarded-Encrypted: i=1; AKwUvBzcrI9n2myQHqE53asYK6ak2Ub41PUOBGGAmr1R1XZ03ti7nVH/bPp261tCDKTvLaVXXKB6A87PDX0tO5evX9dp@lists.infradead.org
X-Gm-Message-State: AFuF++l8VJlrJZauJKe0cfscV/OAaOS19LOBguWR8TuYuGCYezKyfBzU
	YPN4dXvERH2FArJxiXFmrS7WpXKTVwLaO4crWCBENF9POGC/hP6xssgF
X-Gm-Gg: AYBFou2VqM3JPFBou717ec1Xk4ecSreWbwPieg3EZVSSbRpFEy8swfw6Rkl0IjZZZ+h
	th6wouCB36jDNZlHqLUCHiBjGKmIr6az4CcEtaBcsdNaPQhdA0EVbw5DWD4rvf8nVvSnTLpClwh
	GTjHAhrfmJEUKpx0yt/sNN0iRVDtY0SaQ4u3RZdCJX67mDeqUiZsCi71dkJ7KXaThMHlzcTYIik
	GfL9qp+GeosVEnkS05TZ9ebAhZ9XLRjwW5RiaCaZY0412mCtAlk919LUxJDat+eAti9yFz61JML
	/qV2UE4Z8mPHot/TVLiks3vFhvdW9lYQabB8RgY+BQ3LWuDYVxpv/wQkmR/Mx9jUzBoiSairLwY
	RM7EpjSPe+/BWz1102OgJfIe1zPQmIKn4YqfOgkV2bBc7rEnNpVNp3CKIh/7ekPPbwzJDBWBIic
	ipNnBk2QJhg+rpSWnXJvbKLxdR1iBVUzqzekSH8rE4geyeoR5nnXYfPgFEupjRJ/xitiQaUaDg7
	bwp8oygm7QeQI/y6fF6GsZy3l6Wi7MocPRoxkHi5U7872WSKD3JeYQIUQnIe/lubyNGa7LvrIKn
	VcC80z+UEvFROJGAPg==
X-Received: by 2002:a05:600c:6388:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a18e3ee8f9mr48332405e9.0.1791562285176;
        Fri, 09 Oct 2026 09:11:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v25 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri,  9 Oct 2026 18:10:52 +0200
Message-ID: <20261009161102.38961-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091127_737082_DD210701 
X-CRM114-Status: GOOD (  11.14  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b5a0e7..53dcff93f896 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/mediatek/an8855.c
+F:	drivers/net/dsa/mediatek/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0


