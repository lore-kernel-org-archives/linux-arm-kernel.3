Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D45C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Np3TxTdvKcS8g72nvKid+BqIJi+sR4NF+QJPQi54MKI=; b=EzijZ7wZg+sXNFIfbeigyUlV+J
	T6fE/EZuxIGTrKvcklsYwtiMdDT6Z4yM3EhIWOssJuJf752xqFW2CZg/O9VWfzPGAkz9ThipyBm1O
	D6vM0IWIMsZXg17ylqTJRis2uzkgiQwQiKUYpc59s8EN809cYY8MUD4lDvt+GfGVEyoIG5UL5FrtH
	sqiwW7hkY7xL2chomVZlhoYHkrUXmPPzQQUxqoH5mXON9d/I+HN1H+3UK3ynGiL3p/wrOdK47nCVK
	WrSajZMZzhaV7hmaW8ZhqzdMIbCDJwOA9XFD7u+/L/cDGwgWZRoWpvt6iDtjg47VKV6LxCe/UANXs
	HV3WEJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woywF-000000079JV-1KFQ;
	Wed, 29 Jul 2026 07:42:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woywD-000000079JA-2Ia1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:42:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cab973140bso9677355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785310968; x=1785915768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Np3TxTdvKcS8g72nvKid+BqIJi+sR4NF+QJPQi54MKI=;
        b=fCDqc/VObIy/0ngCa7BVgXJeXt/n+EZnJ5npPabHhJWUEM2pO2q3WAg1rol/NFg2Od
         Acc3O6hQMWSu+/WaIBPtMrX2DEAPDWr1O8hNLDzpbVcveMXRFC518h2Ye4MUMueNA7/h
         ZEQ0z049OnmWqwd/EXj0SJ2Kgs3E/wYSTSc5JNFND2vMXXkLBPKTYj1PtlOAJ4gT7GWj
         Dx3+b1xIBNqNOnpwSY/l6u5Kc9IrvmvQKXYUPt7uRqrB40D1DAKGlsDGb0ji8JZJiuPp
         wkp47kp6dI6RngygwnvTcNqci/0e/HdONcl7C0As+gckis8S6beWpXT2O0LepTv2Ushh
         Agyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785310968; x=1785915768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Np3TxTdvKcS8g72nvKid+BqIJi+sR4NF+QJPQi54MKI=;
        b=otgDIi8ygm3ckRZkh3r/p4vziNf0ldgWa5hGz9SFBSxkiAwcndHPX1pzIcbgQHzayL
         fPGjk8jYQwNwIr8pWh+vm/4pMclFDoc0Y1rKowWXShhYbaqOtLyvDRmTt0xsTnalle4n
         34R9W8GLdWM9H/zuVpQecJn79bg+u2A3EcDeA80Hm9ARpn6xhpqufW0nWfAK3oJA+I/m
         JwxPptD7X2q6xk6/XuCHXp2vM/Tpw4AcEuEZNG6OPwtb5RLk/0LxyBV8Nfw6ePCMbmZs
         ucQ2MC9x2ahcthihc+8th5mcSPrPSPYyLw2QWMyMWYgI6w7eTLKf+7ScgX4sHDMT+7kh
         S34w==
X-Forwarded-Encrypted: i=1; AHgh+RqVE/dhefd6fbCB4A2t07ucSqVQIXn6ph7+lUU7SCgvyeRH/Zeraoq42wCr9Fhc6Bao9+N6N7yPxc9Qi8IE3XV5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlr75o8vPY+sgiGCuYjhqS8Rf6VMCgQ1dv3hGpGpI8hsDz8Atq
	OnNOYac7EKT6STeT8xIMt2meKsY1j7Nu8Mg3mhqUtddHQxtE9QKzCF42
X-Gm-Gg: AR+sD11RuBIWQvIeWiueoOH5lnEz+kk0SwsPt+xlA0oWVX0ZSaiFOlVgYR6i5gIqSAd
	DT7Or7gqlvOsTweEnwA7m1L8FEQcNczekpY4rkDQb6Bv6F+mGXvonhDl1afxi23cwtq+s1EVUEo
	604yLc/8JCfhpVGRLIjsf4VSSZECMr9O9FKu/+8chGVQh1LSK4M8FMKNc8Wih36KV207as0fQip
	yk6/qVmjHwE++6vzMg3vpFnKvgshju8CHVB3xACz8Y/kam0YZE1Zu6Q/OMITFrEUcJIJmOWfuNq
	geLbPw5SaIDHJUWhIn/GR38UAgORFHw552dN0do46GAUhKEvM+cc83MKiNdtpR3v49dpyGhVzol
	9+GO2fKTW8k8aIXBy5E3w6TA7lvWPjJMtwJLgKkYQmv7oLIQHbqiNOT5uEFx+OepbmVj2HzPUC3
	rKHCGoLvQCvz9KOS0QqMS2UEkxTNqF2swpPS4sPeTvGdYPp+DElLxWMpL1jnfqq+KxPdRQjg==
X-Received: by 2002:a17:902:ebc2:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2d015f31b41mr63997355ad.38.1785310968545;
        Wed, 29 Jul 2026 00:42:48 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf888csm7154505ad.64.2026.07.29.00.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:42:48 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v3 0/2] net: stmmac: Fix PHY attach when custom PCS is in use
Date: Wed, 29 Jul 2026 15:42:35 +0800
Message-Id: <20260729074237.2624940-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_004249_588466_F0E884C3 
X-CRM114-Status: GOOD (  11.33  )
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

This series fixes the issue where stmmac platforms using a custom PCS
via the pcs_init callback fail to probe when no phy-handle is specified
in the device tree.

Patch 1 skips the PHY attach in stmmac when a custom PCS is already
configured via priv->hw->phylink_pcs and phy_addr is invalid, avoiding
the "no phy found" error for platforms that manage link state entirely
through the PCS.

Patch 2 is Russell King's phylink patch that relaxes phylink_expects_phy()
to allow PHYs to be attached in 802.3z inband mode.

v3:
- Move the priv->hw->phylink_pcs check inside the "addr < 0" branch
  to avoid skipping the phy_addr fallback for boards with both a PCS
  and a PHY
- Reverse patch order: stmmac fix first, phylink change second

v2:
- Include Russell's phylink patch as prerequisite
- This is now a 2-patch series targeting net-next

Zxyan Zhu (1):
  net: stmmac: Skip PHY attach if custom PCS is in use

Russell King (Oracle) (1):
  net: phylink: allow PHYs to be attached in 802.3z inband mode

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 drivers/net/phy/phylink.c                         | 8 ++------
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1


