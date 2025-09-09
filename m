Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=; b=IsL7OMsRufqW27ABmX8WTRAjz1
	TfIojHN6RKW7EUoZJE3sLYkliI4khDuEODrm7gvwBrIFCVR/rJUq+rblAWpFZySjwgpCbhjLDvFsR
	LZ9VDd9fxN8o7iLbvXW022UvczCytKAYMD6Kt64oKdZyaKHWz/YUjDYLozv7JzKxw0G47ffeE64Rm
	EH2EmTLE+yKp/f5ttCDCXQ188bxp1AdEiMDipzgoxYrAPeRzUcbpZBj1oJ4T6NdkhTUyS5O8aYW+z
	AyhyeWWkn8YSNl81eUijfElu08ipjChVZizklgXki/3iO/kSOrjBZKT9V1Bfdh0xe8F5y8ggcMt1V
	hsnBT+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFk-00000004uRW-0BB9;
	Tue, 09 Sep 2025 06:54:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmSz-00000003I5Z-2URW;
	Tue, 09 Sep 2025 00:44:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45ddddbe31fso15974645e9.1;
        Mon, 08 Sep 2025 17:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757378652; x=1757983452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=RQq59I3waGbuuPDtlEhPvuQVau66thDxlOESnPpryMUy81K9fAoVb8F89o4V+NSE+C
         RRtvxxZ3JtN3Xtz1K/v7BMfyCYp1Zvbd2AP78zF9mCPzmCKHqA131zwIvqqPvjFW0vBE
         ABvKDTVhogI27Adz6T/u3V3LKiJq5elvwtJEzMVYXiOTfbGdVbyKIeCfZT2+zlAOfQDH
         ueXJHpkrSz9INa1FeHxZu8S1nEOeqGnZ4pvxvwIFpXasFq4pANDLWD2KjNwzYW68fRlf
         jWDeZZP61x+QX0ebIJfh/cUoNCOS5csiBFKnLuSXqZAXd2ilBUhPK1YdnBzXxZbs1Rj4
         +7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757378652; x=1757983452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=VBtLqoaLqGeS1Ouo/gP+Jg8zu/GUIQePFlRbYbk3Ik2VVyWq29qupxjmLwTCbUswPI
         wLgQlwIik2Y21VQqNqMPq39Ei1k9lfUF6TBewRXgGOk9AECbWvUh4+FiHSDeD0S0OLv6
         kj7LIsA6aoIVnlyY4+aMH1qJYotNUp3rHNxXTws40Z4NzBuod3rjTEB2PBay3D6uMDGf
         2uD10PjG3Ep2QsHCPRjkyaXUkk6dtZocPTn9EA1DWQEToY8ypfijQs/eMIQ2TytjwkrK
         XX5HEEzKdrTq0lDFbO5xBGWWyxGI+gbeKmoPcMuhPzMxkYBH+5gRg3w5nIZ3VPDOvQzy
         iHCg==
X-Forwarded-Encrypted: i=1; AJvYcCVSDLU9VKPVjZ2vF4L7/6/zCTNoeQOHkxTu3EfStU3+x2ZrEmsUyNHpsdqq3TtstfcIC83/jv8jbMce8WAa3JJM@lists.infradead.org, AJvYcCXgJscT8qXLSu6ilgEICJs9Nj3BLPupnv+Z5UmbQDq++eJO3ieuP5BfFctOaMnC7X4tMq07/ppBCnCGtZQCk/c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZmqVeX3RPVEjjU6nm0NEJyEyAsJkmgmUCa9IpW5kCRa4SFhde
	OnNVkSFSU17U2B2ZODQrJskBIAcYQ3SWIHkeHpwQcpWQhfqwCNIfmOzp
X-Gm-Gg: ASbGncveeFGbTH4iEwDjeYa3yBLJ3v/lL1vHd58XZxIuDKOVs6a+HMl8W5ZOQcGIZM6
	q+GX5wybntwvHZEu6DjJcoJYBDKZ5tDGPVGi1fPEusIUuvIwmpbN2568L5PxJ5DFB84OMaWkb5C
	1AasveA5KUg0abctrunYtT6gTw1tSzBRgK2jjMIIJeZbEyAOlp185ZQFfETlgGfRCFrNL4WJVGh
	K5f//+MfiAeu6c+ThS5kRLgZtRwhE/vseyH4ZysB3S7Md0klOcDIGlLs7nPoGWHvhQ60RJzRJfO
	X5X1U5mYJQ0KQCWIoov/d2cKa3ocVC5iMCNSZGL38LUGxffeZ+cxX3qgxCA+Vp24xRujRDM5C3k
	yZWvFhedlu1dVs+7GLpbs69l6Gmdkhg4eJJtSi3103ANuJDtj8e+ux9+3DM6FgdkfC3L3YqiCfX
	+3zwF21Q==
X-Google-Smtp-Source: AGHT+IE2PbebWviQZhrJVIzRPMIFwfn7sDOAOGBDcrXAjk85O6+L3RpYW9/enKFosoJvEOtR+9h4ng==
X-Received: by 2002:a05:600c:34c5:b0:45b:72a9:28b0 with SMTP id 5b1f17b1804b1-45ddded6d3amr91744265e9.28.1757378651959;
        Mon, 08 Sep 2025 17:44:11 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45decf8759esm13526385e9.23.2025.09.08.17.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:44:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v16 09/10] MAINTAINERS: add myself as maintainer for AN8855
Date: Tue,  9 Sep 2025 02:43:40 +0200
Message-ID: <20250909004343.18790-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174413_633155_D63E6BDB 
X-CRM114-Status: GOOD (  10.65  )
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
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b81595e9ea95..818fe884fb0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -740,6 +740,22 @@ S:	Maintained
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
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.51.0


