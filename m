Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAEDFD9E3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ahdwK5YE/BVFVzjUz+/VzjFDN6Ot/+6hz0uB3cz4GE=; b=VK8OtSvNRzOP6l09N3jSBdulKA
	sYFgRArOgPs/ff7xpyY5wqoF7UI6KTBr4K6dTF9dpMOQvH7jjPor5ZDMnl7LVgWaqBcCbeKKpWxDW
	9W8zf0lCnBLVs78f+ceziZ9xiC5mHjc75h8LgZEPSbEyloZmeYfE+r2EFY69P3cYRjivq6MuKecBm
	NRt70Ysrb81uUsBFY6DzB0uV52xFe4j76ZzkbLa4QHaDxy2ZowPfRDpwWQKdsPO8d2uLH1ERS2/8+
	XQpiJIavQpgmYURLicrbfXk2qteL1dUMDN6s6jPLyfiT1En0jSqKeh82iRVEHxjmK9HR10L+pbT8v
	U3jm9Sog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqWl-00000007jI6-1QCw;
	Fri, 27 Feb 2026 05:36:39 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqWj-00000007jGg-0oFM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:36:38 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-5ff1703cb94so953669137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170596; x=1772775396; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ahdwK5YE/BVFVzjUz+/VzjFDN6Ot/+6hz0uB3cz4GE=;
        b=LVerPPn40RHgj3WALcpLfqDSEvslz5M+3HZf2uk0+w2Qe62wWnsCT8eLpOuH8Oyhoa
         R0Hj95rJ2RN7laA1RlbJ8LMO/DCB//E8/UW+P5yGyt/OaAxLVcV5AME0gRU1mVXzZaD3
         IMvA9B1IOkl/yjf41Hm3XEsq/0ovUdlvRM+lc/K3hDj496x40JfbhvLeG2vQohYtP2/i
         iciSqjPfGz6yZ6jc5uYPs4sgoRDJv7v8rfIA4dkDY+tFREBclW9XJqWAhE4VwxFoWoSJ
         popReuR8IpOj8xjHR/yxUwBZEhJwTKy4+YFLgb9ic7rTOclGPkaKeUjM2DY7cWz2Allc
         5mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170596; x=1772775396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ahdwK5YE/BVFVzjUz+/VzjFDN6Ot/+6hz0uB3cz4GE=;
        b=CnM/Iz9HrAuiOiRMuMDJVjlJt5qyD32v1ggU5Tq7XMZ8ajBEl3Ht3vgw+vddNh1pni
         8bia2Hkw9jbJUShEEpZh+bCuiUNPZMi+8sMxTS5ecBz90rfKSKdaIC47O0Y2de3zh9DP
         XZfbxHJ2zwzdmKFHz0VwI2ib4uLvtAEuiM28eyR7k/r0vOFNYLZQ/T9AMOxFdm6MPylx
         V8BR/prGGJLrrL4p+ikKq+5WfN/4Ng7oOj/sSmHeXfZaVz5bEc+nARUiP0lsdgJ1D+Db
         6vZFjMi8KWL2OqItw7mSxxZzdiizkG+9i203H+/YoBNZ2q05HbpcA29PBIa/ooeZAqxb
         U8qw==
X-Forwarded-Encrypted: i=1; AJvYcCU9abywo+uqJ31N8zy5Y8FEx9kEL/5b2tEgslgR0cS9ezxDUbuojFUBOJ0pPKpOfiSESHFRSfLI1Z/aiIDEvyv3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0J0NVLIk36St+OsATWy8Ba9d3J/IZLkSAfz+s96SzlgLC/0x6
	YpYqktjqiPXBwOIB1mBm56A+of9ArN53ZeHWkSLq5IO9Boy3U4Gd8jyh
X-Gm-Gg: ATEYQzzHvqZT0Py3zMh0kQc0tUaXPddKVME58CBVhu0qKYimoptIUUA/eiZz+hTkQT3
	WYlsr3atx/SE/g6z0iusrYi6AxpGOYieiwzDFbR00LEL3g1CaK82dyGxhppSEwZTGChZY2bZYlu
	SD9ahBcZRTbu0D9QLZxyB3oiu18+/Ho3YblSE/f2mFdGQWQTb+HvUb02URVl7ptfkiHIhqtMEVk
	5N5WyjaHtC+VtJ/nV1ZHbY7ml5uPn0hhy/+WeN/lLNLTH7GfnWZlB1Sl3oyIij/cWpwe02o6M9Q
	VsBX1PUSZ3rssY267C8TkvNcYX4LqMpAGM5+J1Apw0dKsmZtMXWPSlLxnvFqKPcsn9GS3+ryi0e
	XO4CAc2hzEVU56crGxm0I4gThOPkiPq6hRKSVz3eblnHhfgEhAfNKEMlzofQi+NKHC6+ldC4vUD
	BCtlkR6ywhaw==
X-Received: by 2002:a05:6102:a4c:b0:5f7:2430:5340 with SMTP id ada2fe7eead31-5ff324986b1mr1096585137.21.1772170595887;
        Thu, 26 Feb 2026 21:36:35 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e8240d2sm4431027137.6.2026.02.26.21.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:36:34 -0800 (PST)
Date: Fri, 27 Feb 2026 02:36:27 -0300
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
Subject: [PATCH v4 3/4] PCI: rockchip-host: do not attempt 5.0 GT/s retraining
Message-ID: <92662fce5ebb28d21d0c68631a23ab8afb815a90.1772169998.git.geraldogabriel@gmail.com>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772169998.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213637_231334_3C10F479 
X-CRM114-Status: GOOD (  13.17  )
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

Drop the 5.0 GT/s Link Speed retraining from Rockchip PCIe Root
Complex Mode Operation, so called host driver.

The reason is that Shawn Lin from Rockchip has reiterated that there
may be danger of "catastrophic failure" in using their PCIe with
5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper
errata, and the particulars are thus unknown, this may cause data
loss or worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..1374a2c92b56 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -328,26 +328,6 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		goto err_power_off_phy;
 	}
 
-	if (rockchip->link_gen == 2) {
-		/*
-		 * Enable retrain for gen2. This should be configured only after
-		 * gen1 finished.
-		 */
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
-		status &= ~PCI_EXP_LNKCTL2_TLS;
-		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-		status |= PCI_EXP_LNKCTL_RL;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-
-		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
-					 status, PCIE_LINK_IS_GEN2(status), 20,
-					 500 * USEC_PER_MSEC);
-		if (err)
-			dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
-	}
-
 	/* Check the final link width from negotiated lane counter from MGMT */
 	status = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL);
 	status = 0x1 << ((status & PCIE_CORE_PL_CONF_LANE_MASK) >>
-- 
2.52.0


