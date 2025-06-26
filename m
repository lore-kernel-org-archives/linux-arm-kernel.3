Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D520C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+r8kqMG9xKuRBCFyizw4d+MeqKPWu2iAAx/+euz7j40=; b=oB+aFHt0kqb+uizSoXc2ksHnDN
	CT6yg8jBkWNC7mcfZsZKzEowQelSrhB62vBwprIbOl2cg56e/iLQ6xQBt8dkhCrEelDBK7v6Gs2mh
	lKKPpczA64Y/9wa0Vu7rdeqRi9zk3HR3CN5z1WRwRnkBNWeqOLn3Z8biPPNeFZ7uWUOeSex78cVVJ
	mEZK0LW2+ejjXrCKDiTFSI5IUzf/f/Je76/BX0vd8wZhIiPfFr4xoWt91W79+rv5IiFYvZuXd7kju
	7hdGmXpXOpyTxjVRZ3ufMJ763I8YWP5RqEuEQesIpMUf/sjJPE2MXikCwJKXvzsmPWpJ6CqeDKnm1
	HWnou8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwAh-0000000D4m6-2Fvm;
	Thu, 26 Jun 2025 23:38:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4o-0000000CpBm-2IZA;
	Thu, 26 Jun 2025 21:24:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1024917f8f.0;
        Thu, 26 Jun 2025 14:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973049; x=1751577849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+r8kqMG9xKuRBCFyizw4d+MeqKPWu2iAAx/+euz7j40=;
        b=nMcL1bW+hRuhR1CDAZBYppWjpIQISBUs9Eq6+IlGFGIi+X9fP1yHPUWNWdGXWAPv5N
         3ZAqe8+CbXs8uihDt8MXg2waxpcUsRUnPp/9Tq6PRZavGYg+xVjIANK2meKFv2i3vYMQ
         Hby62f3DnPSHgxZYXq2hmtNUrcAl5CeBoDJ5D1aUPm5mLu3cD5veTbCgdX4JDg9A5leZ
         NvP2JqaAiorouZmyJtJ5Rbhz6ggpVdf18ia9dYY0xnCAf9WOtnQJBMEfGi+8g838L+L4
         R/RXudbjJqgdoFLsxFRfDs15ZJqTqvy6fe0hpG9eVqTuXTRQdBzDUqRQPp80GPI/gJFs
         K33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973049; x=1751577849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+r8kqMG9xKuRBCFyizw4d+MeqKPWu2iAAx/+euz7j40=;
        b=iZZ5H4g8AXWORlY2GonG8NG4+dNtW7qTTPyHh+09TB0MZlOTXIj54g1FCNvUkSw5Y9
         ob8qlc/VLfwS+Tk9wUws98K7x5hpwHi7pYH+9RUmQAFtDpUPbMXsSQlzenhTec+Q5dFT
         eU5c3KAc1SxuYmdkufKcQuLev0Vp57Ov4NNYu7JSSGYyxfM1OzAuOCuZawmS2it2JO2O
         iwcI+cLUX+sTwSC1I6UAJ6M2ZnUviT/V5sRYxZ2I9XQRl9kaXUQubltLqMQNLnYOaH7g
         eQdh5zopJSdn4wuQqoDb/N5Z3z+BFp37HyhamWsBbByU8QSmcwKr7f0oAQtCqkvyM02n
         x9JA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ETyKRZbB21TcCR5vanXGr4Q8nxqKE2f7aqFgohp9Zy6UXda2oq9JzhSi9iyHF8iZV68kFTXSNoH5UVuvFw4=@lists.infradead.org, AJvYcCXyu+GaXSdLmw8fdmXLg3KO/pomEuPMYAQDUg40xSfNgY7+moZ8gnAKiUWN6/bNYMKybRj+DiPUal/jkG7e5Blp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt/Eq2JijJ+c+amBr32z+a0/YsmvcyadO7iQQzvHyVv7b4b2yX
	lcJQyjgegg5Jy4HWaEdk3Z3HjNPJhaLTD+Zwvg34NI3uU4MmtSrWpiLG
X-Gm-Gg: ASbGnctY+YRDoKIL9aYfXEjLF6uBTniTXZGVhSBB9m9zlngnS4Aj0Cjb0liVXOylKoc
	2ptCb4HTfrhEOyKgVvqDofKeh4N6cn37XW2vAa6yxfD07QMdsF2jUmyOD3NIm88JW3x/jhxW/Gr
	QMBRqTCFzV4HL5mO0cJIVIty9SgoALJNGINO3V7mRUCkSdIDakyZzdaY8JxCjgLJji5vNpr4bXm
	3xSxuzT65DoKG1uQm8Yz2vO0UzwVbI+ZK8f2C9qdc6U1BaF40jPaEjkwRMTsgxu4TTe6aMre0W3
	h9MWVRS0hV1D23Cn6oEz75pQ6jRuMJUJrjSzTB6VVdrny3whpXY/yY7e1gEaPq54OAL1X1cdT8Q
	Wgsltq00vVd1+vMjsCna/0mJ0YxkrPzHegxp9gRg8fw==
X-Google-Smtp-Source: AGHT+IHNeuv5wIb9hNfS6byOpPI858KsRilQzx+Fb8SYuLtRukZLflt0CX6JZU6vbK0Inx9n+asLtw==
X-Received: by 2002:a05:6000:418a:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a6f312df2bmr3074849f8f.14.1750973048916;
        Thu, 26 Jun 2025 14:24:08 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:24:08 -0700 (PDT)
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
Subject: [net-next PATCH v15 11/12] MAINTAINERS: add myself as maintainer for AN8855
Date: Thu, 26 Jun 2025 23:23:10 +0200
Message-ID: <20250626212321.28114-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142410_584241_F39BD961 
X-CRM114-Status: GOOD (  10.46  )
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
 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bb9df569a3ff..2d1785478855 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -737,6 +737,25 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/mdio/mdio-an8855.c
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+F:	include/linux/dsa/an8855.h
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.48.1


