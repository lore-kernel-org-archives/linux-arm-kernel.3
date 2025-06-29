Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0563BC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 21:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yie4J6/XsAs1Q8lv5qOjqiXHg7FYWZHizYmDgi4UuNs=; b=1Kury/0KHIaAlaWEOzEMOtMLUd
	Jpr7ZZywc7eJbHXdhla5DyBB1E5GHm7M8U5TApvMEylSiICc1OytiTi4WlEHNoyJL72HRkBNxWW5b
	eYcVT36vJDGmr5kDWn8YiKNXXruBpg6KMgoTzMlXzRjI3n6VKOe1LBphaPygYPBmrqa+Pn8LnUa0k
	FA/7Mr+ZDxYYdF0+LUR03i9we11NFhjgxr5Rp+fWYlHyIP/u5FXFzmzS5GaOhJhJZKNbsx6HKwMsu
	wng+3os9QPVMg3j4KMV/nMCZ97RdwYKEYvLIrfpo935sl+iZHv0SOTPq8WidWrGhJslUp/FqSMT1u
	kTaA1n8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVzAP-00000000kDO-1Y79;
	Sun, 29 Jun 2025 21:02:25 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVz6r-00000000jur-2I90;
	Sun, 29 Jun 2025 20:58:46 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7d44c6774e7so68542985a.3;
        Sun, 29 Jun 2025 13:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751230724; x=1751835524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yie4J6/XsAs1Q8lv5qOjqiXHg7FYWZHizYmDgi4UuNs=;
        b=HTjm2khaJmFm+0Bx33tc32uDs/EO3fzX/FA7TzanW2/L59cq4Nso73Glhe6UvQVXAA
         QiNDUD074F5HFjOBerudAb1ZECOBT6fgN1Kahph4CeWDf+njgElfa8XJsOFNLXuwvM+E
         oVBMvr/sYKroQ66eKbvtWAKQqDPH5s5bOStl/3cij2+EwfTMQsZuzNFYL+CbfhDvJVi+
         wkBEqzQmziCvIx2bezcRk9INF3bWqFxqeIh3nusUlmhkKlVcLYK/V+d57ZUJeJhLUk9k
         jdBZHeqregyuip4eN5bXYEvFDRq/GvNejUzinf6cbL3aSmradKtlUw9WpEGdN7dTfUs+
         ds7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751230724; x=1751835524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yie4J6/XsAs1Q8lv5qOjqiXHg7FYWZHizYmDgi4UuNs=;
        b=k+Uec/NLISsmgxoW7qPe3sRdO5uZs25NP2d83BLKZ1jqhTp7dW64OVtboB8q0vTeLJ
         zHJOLgfWQZu2NFerRy6247UA6C4EJtvAq1g+Bv1TAgszI3W1GQFNz3YXUHro8Ri5Dfx7
         wCfpUnBKonnUfbTLJIsDWqZyQAALhdM63cJouA0nhFW/zFJo4f3yd8P+BCgBL8eaRW/y
         P+ZbUMfRgmIhUYK/o5SWFK1wPrVYcyhCKkSDDYmsXtXXeilk2PVhvRJw2E8Ez9tu4cp/
         hP0mpFl+Gyn0GzLupcrLtYseEhd9UHyRSWH3y0wpnlKTrFeAUc+QEqIsDapDBGKTr5/2
         3pQA==
X-Forwarded-Encrypted: i=1; AJvYcCV98DjYIfM9Q/QklDPUgRigS2PTlsh9EiQ5HKzPOWkhrQ5gyJexEOvAIQ7+VNlH9Nq/yq5aUfXjpGQO@lists.infradead.org, AJvYcCXvI38f3JCU0x3t6uCNBbS136gYl2ldNLkvtHkNS9eyWfJxL923ZnOJWg5iaXtIb9aTLFe41KSV5kBVk03Nh3c7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn7PnZO5cuDabQuK5RTzm1J9OKDpoy1DX9j2n8ZhD6dM/qAxYA
	LSG6+6xv7qqLaejvzAQfpjmQNZbEQFd09mtWhVZz8SOKXtOfnBP6TUDI1pTaJG+5gy3YZQ==
X-Gm-Gg: ASbGncu8TR2EZwLp6OP+Ur0IeIqIHpFxfRkmt2rrtGowkWBhYqlTXIm4MEbx8Gk0m72
	OJz+GV0QJVd4BRaqSMWVcdFWbUyeb5xqkWZVBRN9NkgEPnzsfgWdxKi9dzChYqxxELaioJIdSwC
	ErsmjxVFbaKyW9TTKsWOmAYXUCwX2IdJgnnHChx6okiRCZEXUehnwDiCuA3woCRUigPHG2uBOee
	g/D2kTffY4xoqsw1CxgLmZPJBDfRtWe1HOa1J0ej0iBo1xOATJyeZkXE3apbvFMdC1dd2g0qawE
	Ns/zPG2zp95z5OHedKER9naBmMfa9bGA9wti1O+dY+zg8yr1Pw==
X-Google-Smtp-Source: AGHT+IHV9zmUEfgqMrmNKPmx2kRTuxTdY/cY3aGuTYatCyaiuxMqaEx69QeCSt7OKPnppAGC83yv0w==
X-Received: by 2002:a05:6214:6201:b0:700:c7ef:ad26 with SMTP id 6a1803df08f44-700c7efaf90mr50674366d6.29.1751230724134;
        Sun, 29 Jun 2025 13:58:44 -0700 (PDT)
Received: from geday ([2804:7f2:800b:24f4::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443231da6sm484599585a.101.2025.06.29.13.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:58:43 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:58:30 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] phy: rockchip-pcie: Enable all four lanes if required
Message-ID: <b203b067e369411b029039f96cfeae300874b4c7.1751200382.git.geraldogabriel@gmail.com>
References: <cover.1751200382.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751200382.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_135845_584653_4ECA4264 
X-CRM114-Status: GOOD (  10.40  )
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

Current code enables only Lane 0 because pwr_cnt will be incremented on
first call to the function. Let's reorder the enablement code to enable
all 4 lanes through GRF.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index bd44af36c67a..f22ffb41cdc2 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -160,6 +160,12 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 
 	guard(mutex)(&rk_phy->pcie_mutex);
 
+	regmap_write(rk_phy->reg_base,
+		     rk_phy->phy_data->pcie_laneoff,
+		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
+				   PHY_LANE_IDLE_MASK,
+				   PHY_LANE_IDLE_A_SHIFT + inst->index));
+
 	if (rk_phy->pwr_cnt++) {
 		return 0;
 	}
@@ -176,12 +182,6 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 				   PHY_CFG_ADDR_MASK,
 				   PHY_CFG_ADDR_SHIFT));
 
-	regmap_write(rk_phy->reg_base,
-		     rk_phy->phy_data->pcie_laneoff,
-		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
-				   PHY_LANE_IDLE_MASK,
-				   PHY_LANE_IDLE_A_SHIFT + inst->index));
-
 	/*
 	 * No documented timeout value for phy operation below,
 	 * so we make it large enough here. And we use loop-break
-- 
2.49.0


