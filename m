Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10873CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 18:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PENM03p/Mkr4FgZeTCTmwWhZL8Qw72e7c64zdaNuV6c=; b=atFJfRIh3t7mtm32eDyKqxqv4V
	l8/TtoxBz8fW0re/+TT24IlVvsq/1hgTfw/+q14yfzUgoWgRQyWs3JVuhJ1GpbrYdLL1kGRr2hy1u
	a+iRHbm0X8ANfkEUpaiIJqhqbfSTBOugM8du7Jx5kyNuh/mEk5XQs2s6TVd0kfQ4G/6aoad/FBVZS
	CsgdeblQuz5iPIDSh8N9CcJ1uy7uj3BeEy38wrGlfGFEQslVt175Uwu2KdG3dLYdLC60TUESNKD9a
	pP7RoIgFmS8OzR5ym0npX1+j+HGTAapUodND3SfcI2hSq9X6vIVAbQfEeAEuv0EyjfEUNGEG49scj
	110fXabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCj7K-0000000BdWP-1Xdw;
	Sat, 25 Oct 2025 18:35:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCj7H-0000000BdVo-0qxE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 18:35:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4298a028de6so2014931f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761417349; x=1762022149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PENM03p/Mkr4FgZeTCTmwWhZL8Qw72e7c64zdaNuV6c=;
        b=L+jwyHF1x0QaFYCJNbmmp1ivKUeIR3Y1xIUSCPDe1i21P5BAepgxxEXRbSR1ufFJcA
         kGu6c+I8zyg+36fDJXRBUZdmKfXFbPNlI+26p/R9snfxmbNzBFVxbfn+uAiaJtdlj0t4
         Sa+GBU3gNBXfjFSbhs5Arsx4FdP0x2Vi2BXbqQILHdwiubfjmKPCK8cJ/HELDgyfVGHj
         DYC8mY+t7uvHrz40kqIam2Z6fEO+aorMxzfjLIwBop0R+Xu06vhvfaH5MeMSDlWBdGXV
         1r/xw2dR+/VJQmyYP/7cdBgKmpstxdTIKHf4IRkgcl1k5v8i0PMKQUoMfT5XDCn6toxQ
         b8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761417349; x=1762022149;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PENM03p/Mkr4FgZeTCTmwWhZL8Qw72e7c64zdaNuV6c=;
        b=g4PJYhomZj6PzPpt0YzuTIUwPsiOjCAN9c+ZDtFie9t0xDhDxOAtOESzpmUDUcN43A
         CbbB905HggIFR1iqJAPUwEvdUMZnSlcoXTNXXXXrmFz9JDdWGaSWbQx7bU1tT3Vg0rH0
         NC0QA/1vKLGJcoqnXsyAullMnSgyWBcKsp/6HPZWX5nykDrcn487w52fmd6zuz6YXGP+
         dU6H4y814HxLph/W7ndRIcj/ZYiLiZsOMNeXprc8Aqca528D3WRtC7a0ARAxoSr7SaOK
         XiVMemyHFua1GDQx1C2Y17KkZY/jD4mYeP0jAnoNzSVK0Mdonzj0vTlnrzsliqIl+5aM
         Oiww==
X-Forwarded-Encrypted: i=1; AJvYcCUYbq4M1IxvTHBRdc6a71/znSqwnTrSeftjEKkwD1aILPR68t+BdQFj+OqiXvshBtskRW4hUQruo1oBPtupyClA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw81nnUD91PDmqoByfzK5WklCiC+XeVYr8aCdSPjSFmgBhfe7He
	Ftm3428FUCNmRLMFSXNIo28LeoMGUL5XK8U2OkwkyFLR83SRWNlAJawU
X-Gm-Gg: ASbGnctF/SIp/10DLc+HkQOcFzqCFs1smLGvU4oxMOPeKio5zC2RG+IJutn9fUrnczR
	KCcmWrfPdoKe5CvYqlVk1spYU/7g6GiIJCngUMcuWcJBT1NyJqX/T5ZJ/XXuCnJKZTJ5JnUsXSf
	gKbVGQjMK7EhtwivJdrpG0eYemNzkV4+qcExMwWWCtUKZ+7TQN7VqKp9hPVU2aG6ynJWh1sSRqH
	NwMTD+s0qZDpwKFQfghN27+NjHci3Jk3TENlTNw6+1eXR5p/PC3l32tklRdEn61AneEunWplvK7
	hkMT2bnhuxWyBVuPEO1IY7UEaHkxaNlhaatqqB6abT79KxRV/m6nwmgoss2fwIwrkFzJGfRUs03
	1tZhgKPLTTlurLVHulZ15acbunJ+PK3O/ZWIzycV+OE7XjMpcdCaiINo+pQjnoUvwFkO2rnXFBO
	+RDO3RKBApBW/xh9qvaSgaOa4y4mSex1lKiwO7vRS/d30LmXrlmO9bG0OOnnSjJ84fD7aFkMDK6
	OvMSTbzO0J5AB/yOfe3mIC3ZOT2ippqxIPgKyKTLKk=
X-Google-Smtp-Source: AGHT+IFX9OvthXn1TU4BXDSEiEVVG2CTwp0Ga68UYsWJzmZPnpNrDzbEYmuLWSYJGqN+JXrw3hq+bg==
X-Received: by 2002:a5d:5d10:0:b0:425:86da:325f with SMTP id ffacd0b85a97d-4298f58257fmr5895476f8f.27.1761417348977;
        Sat, 25 Oct 2025 11:35:48 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5768sm4949273f8f.24.2025.10.25.11.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:35:48 -0700 (PDT)
Message-ID: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
Date: Sat, 25 Oct 2025 20:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next] net: stmmac: mdio: fix incorrect phy address
 check
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_113551_266164_1CCE999A 
X-CRM114-Status: GOOD (  13.75  )
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

max_addr is the max number of addresses, not the highest possible address,
therefore check phydev->mdio.addr > max_addr isn't correct.
To fix this change the semantics of max_addr, so that it represents
the highest possible address. IMO this is also a little bit more intuitive
wrt name max_addr.

Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: Simon Horman <horms@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve subject
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 3f8cc3293..1e82850f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -583,9 +583,9 @@ int stmmac_mdio_register(struct net_device *ndev)
 	struct device_node *mdio_node = priv->plat->mdio_node;
 	struct device *dev = ndev->dev.parent;
 	struct fwnode_handle *fixed_node;
+	int max_addr = PHY_MAX_ADDR - 1;
 	struct fwnode_handle *fwnode;
 	struct phy_device *phydev;
-	int max_addr;
 
 	if (!mdio_bus_data)
 		return 0;
@@ -609,15 +609,12 @@ int stmmac_mdio_register(struct net_device *ndev)
 
 		if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
 			/* Right now only C22 phys are supported */
-			max_addr = MII_XGMAC_MAX_C22ADDR + 1;
+			max_addr = MII_XGMAC_MAX_C22ADDR;
 
 			/* Check if DT specified an unsupported phy addr */
 			if (priv->plat->phy_addr > MII_XGMAC_MAX_C22ADDR)
 				dev_err(dev, "Unsupported phy_addr (max=%d)\n",
 					MII_XGMAC_MAX_C22ADDR);
-		} else {
-			/* XGMAC version 2.20 onwards support 32 phy addr */
-			max_addr = PHY_MAX_ADDR;
 		}
 	} else {
 		new_bus->read = &stmmac_mdio_read_c22;
@@ -626,8 +623,6 @@ int stmmac_mdio_register(struct net_device *ndev)
 			new_bus->read_c45 = &stmmac_mdio_read_c45;
 			new_bus->write_c45 = &stmmac_mdio_write_c45;
 		}
-
-		max_addr = PHY_MAX_ADDR;
 	}
 
 	if (mdio_bus_data->needs_reset)
-- 
2.51.1


