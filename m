Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D06FD9E3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnj0Ip5rhMpZWME92U2V18suyVnTB8PfAkHzESqzgSg=; b=4SrjWm3/cnta1xHYB+R1fqOAv8
	2cG7iSH0iEeE/FC+QtJoZTlKJlW3OG6X4j6iiimEskQjIC+sUGsR6fB022AOk0HgVXCthEdvg3LpK
	DFxOQmaiYi3tqOMtJbdDKLAQNYKuf9mhZeUJ8funTxr4L5oj037+31D+oSW6dABSMO1PHUwflJ0wV
	pJTuowFyXtfoSCUQYw8JOeXVxPHLQx5KLE92z8+bRnJRHzeXHTaEWE0I2p0KeXsraDcKy84ZtEgkS
	deLiaMr8bH0TvMcDOn1mVwntTVs2I+PLy0qqTjG/90fD8dAXfy4ygKpQvBNwZdhhvrjDDmcaso86j
	nJJtaiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqWT-00000007jAg-2Ejm;
	Fri, 27 Feb 2026 05:36:21 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqWQ-00000007j8e-2ZNd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:36:20 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-5fdf3735e14so952213137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170577; x=1772775377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mnj0Ip5rhMpZWME92U2V18suyVnTB8PfAkHzESqzgSg=;
        b=a18GRYd3AgIgdiTF59L+GaNwQ3DvryvDYu4M9KFyUBP4xfTkBk3oVQlw/wH677Df4s
         tmnu3LIjNBYVjaRWr43Zn10WbCnK29OyrodOSPvdWyeeVpDG0dwHBLnsNjwCe7nBCSD/
         r/rK1y4O2COMKCFDv/1mLNrgEm+0fuSsXMHJ8hNowEjrZL1ziHBGYwng3TKk7Kg1uqL+
         sSVIUzy3VPw7UsRXTQ0BR8FcOmnq51TwTLVPRVkVyZpAzhDhNLSKPpqnWk+3atsOYiX5
         3xlHGD01wsnrn66oKSYLTXM2D/gOiXZZs4VmfVbmA5JM/zrnu8XkCg7xhpmkSssDpKik
         Y2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170577; x=1772775377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnj0Ip5rhMpZWME92U2V18suyVnTB8PfAkHzESqzgSg=;
        b=gNSP134EuLNF4YoxvBNEwWBitgLG853AGe5dxzvzFB07pInjhYtQgATvQgzk793F6N
         JgIGv86BGucsB/PIziNVC6zG4dRbzr6JVXnbF6Qxg50lg/8qxzYZA8Qm0SQD/X+YsBg8
         TVJiAMAFYhUOL0hrJgseuyWKgp/NCSVhKa0cDZKH7CAUOgJdTEqPtQgi9Vxx1ZDZi+2x
         fDC+3MsC87s2Cqh+r7oUL2MacQrT1CRBd5PGcUrbMCGLG1gjWDL3+IX9sNX4Qz0GvIAf
         48/K1kNKNf557Y+3G04sKeL1bjlqpfF0tLsrOzTLrC2TenL/eDG4sivNFr4PuT3DHDqe
         1gIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHtRUcNaPZ49P181kIm9TcoAI05EZzngZqUSN9GYnz2zsooIN2jZSC/f/GyW87jgvZCD1I3BoirWZ3UQ5lzPO7@lists.infradead.org
X-Gm-Message-State: AOJu0YxpIK2ncqxV7I+HEd7XXl1JH9rczqGtzddbqYV0RLJX7S215tr/
	PvYzcF3nZpw1QCrifg/S/Tjs8l8dg3VepuowjkxmwLX+YBmRxwuJeodz
X-Gm-Gg: ATEYQzyx5n8yW3B7L0nvT7piD5HljTA0ZVoucaD6ffEh3JnsclLvuEXZldwXQLhRJRc
	14oqWpkTUdq6uxUbIOPz5zqjm5UspKF+UXkRdG3LfeSVfpp1u+ENXEOQAEL2k55K92HAAfOAam7
	43FlCWXD8KD+oDstw/8y7dMhwLxlXcp69V7Kip/qJcCbR0tYIc5kiVIzslz5W2DBsgX9NOSjjPQ
	t/M+oTJ2c8+nOgQyy37x7nT+Ps18H8Ie2BL7U01ovYtC5TgZhURgnGVE1mmkIZ/4GqZGfzCm1FZ
	3l0VXi2TnxJm6Ff5l1awtAr3JV+aK5VOJD2RvmmgZNAbiaF29g55QoyaChhh7Un5AdxU6lGt9sc
	7wgO8tMK+/CsEx4SRbLPlRRabZUOmTPlFvBxjrTxpqlABkgCcJWAU+tM847U0YEYPKfxOU9ywOV
	Jl0nK8S46H1Q==
X-Received: by 2002:a05:6102:c09:b0:5f7:2655:f2c1 with SMTP id ada2fe7eead31-5ff3235cdd6mr1120359137.13.1772170577277;
        Thu, 26 Feb 2026 21:36:17 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea15925sm4631041137.8.2026.02.26.21.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:36:16 -0800 (PST)
Date: Fri, 27 Feb 2026 02:36:10 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] PCI: rockchip: drive at 2.5 GT/s only and error out
 other speeds
Message-ID: <9e3754ee0d1f5bc8051e28e1a5b8c046440456f5.1772169998.git.geraldogabriel@gmail.com>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772169998.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213618_922258_0F0A9A27 
X-CRM114-Status: GOOD (  15.39  )
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

Configure the core to be driven at 2.5 GT/s Link Speed and error
out on any other speed. The reason is that Shawn Lin from Rockchip
has reiterated that there may be danger of "catastrophic failure"
in using their PCIe with 5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper
errata, and the particulars are thus unknown, this may cause
data loss or worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index 0f88da378805..26fc350a66c1 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -66,8 +66,9 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 	}
 
 	rockchip->link_gen = of_pci_get_max_link_speed(node);
-	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
-		rockchip->link_gen = 2;
+	if (rockchip->link_gen < 0 || rockchip->link_gen >= 2)
+		return dev_err_probe(dev, rockchip->link_gen,
+				     "Invalid Link Speed\n");
 
 	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
 		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
@@ -147,12 +148,8 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 		goto err_exit_phy;
 	}
 
-	if (rockchip->link_gen == 2)
-		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
-				    PCIE_CLIENT_CONFIG);
-	else
-		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
-				    PCIE_CLIENT_CONFIG);
+	rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
+			    PCIE_CLIENT_CONFIG);
 
 	regs = PCIE_CLIENT_ARI_ENABLE |
 	       PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes);
-- 
2.52.0


