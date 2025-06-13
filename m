Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDE2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=; b=IWP10eT3ZidNF7AKFAOicrEYvG
	8FFPT8n3CsJ+NYtA32IZEiS/F4otNdYp2JOzEG3RdL0Y3I6UO6LDEAZaPCCQOIeR5bVU3BMa7tojS
	AOciXOWl5jDnlbkAj02MiEMET6p6RUMRPSsTACi5k+oxqf89VtIfJBKornFdeCFUjgWkaeHDbKTPf
	szNjtkz2ifZN7ghsnZiJGMYhGoRrMAzh5dY2S03Hs534LVwrp9kDhDxA7qlbV6Veh0zI1sEPkQHUQ
	xC/7rUVR5+EhEieEPqdiYy+kPw7M9dBfdch0GD4WdzpIAGAEKMlHoUL/d/v3mVUTRhhE0R60xXT0K
	TnepKoYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7P3-0000000H4HN-36HD;
	Fri, 13 Jun 2025 16:37:17 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5z4-0000000GovB-13Eo;
	Fri, 13 Jun 2025 15:06:23 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso2523428a91.3;
        Fri, 13 Jun 2025 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827181; x=1750431981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=;
        b=HCDWxVYDx4WP4klFJn5412BowvWdeB/2X1KD2hetY0n5Ymi8hxnUliQijIqt5VuQ6z
         J3XB4BarDqXWBsnZj6IthwXPiRC9LXVmT6EblbxY5yNWS7KPMhbbG9vO7OIfFKcU6VX2
         LPdhIItCCrCldtxoMWZuQBeiOu67a1uZ9Czrdng09vcnH/JXn73v06TZcJtg8J+46got
         fm6MGQwPQkdRinI/yi9cSO5Rl5fKRwLCcsBwNuUWIYWNmDJmx45dcLRz4LbGlx6LtvJI
         6tiUcKz9tXc5bsncnn3KaOh7FjgC9PDl016IbRW5yFScONActI1nGvQdhlvkf4AHzhz6
         H5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827181; x=1750431981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=;
        b=lkOYhe7CKwO5nffGAcusaknMLI42wJaKLnEK/XS9kISl4D5if+wWau4oOHTrKFe8ZU
         C1rS2kxTdMxNboaEH4kQGyxYvho6Egi8WNVg22AGm8f/Zw6xdXu8gJ87BsUAOMckOT9k
         kzFRmxcR5Vku72gu6JlIeueEeKk2hx2kxh852VkMu0Cso3bphe/FW9ge+U1AvLAqsDdy
         aV0nQSu/ssgjplJbqfTNddaADZZj8GcP1SIkICRM03Xhps4wdHig63wxPSfsIX6ljfME
         OEn+PeV88yXlCsctvzKFkVPFsn9tc1+LxTUZV9HJhqp/a2CiXCVYtbdPAvWFOx+qKR0P
         dHVw==
X-Forwarded-Encrypted: i=1; AJvYcCVdrDWbnE2Uu3J4m/ZD0yV72Y+AlFQhgEkKaqkac3fCzSQb77b1obcRPTV9WTWvrt+P94isSZ7l1TeTUae8NrpK@lists.infradead.org, AJvYcCVsX4WcKBUPoj531YbvKRzC1hjOrhL3rrUOM0l/BfmGpzRcd5XXctGsqtXMPpphIq/0iYD1+s3K+x4N@lists.infradead.org
X-Gm-Message-State: AOJu0YxofCf+330B6B3C/3g0ZB2kWKqosIcvV08pZa7P7rh1Mx4EN3QF
	v83toONauyTV7P6C1lCZo3GbjrHAT/cJVuEo6qw8k+g4AdgkxXzcUaUAH1SesezY
X-Gm-Gg: ASbGncuYQ6wJnC+cH+O0BMFJQm85wQikK13EkfqH/6ICNsEOSxzmFWetmFLRwUnEgH5
	kpWsIEQTA8ZmB+tcqJn9NebRzs8Z4JaUSn9GiPqtoDkEimom1n6ZaPLkZ33MBY3doDzjLipvJ2k
	+hZjrGtAsuzoU5YZxod2MZHVvcgG4W612P9FRY68ZlTYBIrnWMuAaprwZQ5/Yruk0oOYNPjFkAY
	2FekIAZGt1yS8FKsVIpVL0ShYY26dfAJpfjkFRJzxdVFbZpKBnWd0IGi3Ccn0LYPAgEslNrnuxc
	jecd7bvzhe++ftiSVcaXwcG16UKYRW8AHXM65D/7mQAWLIf6Pw==
X-Google-Smtp-Source: AGHT+IECaGBjuizwlffuDig1L0laDWaQFszoeJrsrY+zyJrlRqn3sGWZs1z2EMQ8zZxgMRnvK+ky9Q==
X-Received: by 2002:a17:90a:ec88:b0:311:cc4e:516b with SMTP id 98e67ed59e1d1-313f1e4a36bmr31111a91.32.1749827181384;
        Fri, 13 Jun 2025 08:06:21 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deaaa15sm15322535ad.173.2025.06.13.08.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:06:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:06:14 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v4 4/5] phy: rockchip-pcie: Enable all four lanes
Message-ID: <389fc093572f3124244c5f3e87dd084b89be88ba.1749827015.git.geraldogabriel@gmail.com>
References: <cover.1749827015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749827015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080622_282733_E109E186 
X-CRM114-Status: GOOD (  10.73  )
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

Current code enables only Lane 0 because pwr_cnt will be incremented
on first call to the function. Use for-loop to enable all 4 lanes
through GRF.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index bd44af36c67a..48bcc7d2b33b 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -176,11 +176,13 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 				   PHY_CFG_ADDR_MASK,
 				   PHY_CFG_ADDR_SHIFT));
 
-	regmap_write(rk_phy->reg_base,
-		     rk_phy->phy_data->pcie_laneoff,
-		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
-				   PHY_LANE_IDLE_MASK,
-				   PHY_LANE_IDLE_A_SHIFT + inst->index));
+	for (int i=0; i < PHY_MAX_LANE_NUM; i++) {
+		regmap_write(rk_phy->reg_base,
+			     rk_phy->phy_data->pcie_laneoff,
+			     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
+					   PHY_LANE_IDLE_MASK,
+					   PHY_LANE_IDLE_A_SHIFT + i));
+	}
 
 	/*
 	 * No documented timeout value for phy operation below,
-- 
2.49.0


