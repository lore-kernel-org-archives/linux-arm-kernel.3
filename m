Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99953C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWQhuuEyoK+JNH/BgqW9wn8WNRcWE8A0uz1Xnd+CF2o=; b=SqpTylMNACKQouATZoerQQjDtb
	fUNQ5gdtuBVl3dhWQQXdYZS1U+Te7QtRHfBbUSdVkUajC51ErSOj9K0BLMZqZ46rnUp4b9z8eekIG
	QV4mK5xI3h3G68qGvT54oebmfhtihOcOliS+ePSWbNPUZt8mZ3c2MF9hKStgYXEnWPMTWI6/l3vx+
	mds/kREhV6EwUKkqGTKRTAS2KBFz3BTkWjDxdtB8ATAZkDTCfVF1cc1GnflWf6ilb6+eaOoU+m+pH
	3NPvJxdzjIf+j5YXE1bfo9tIoItYXEDlFX2uinvLw5weXWc/5bfHUBnt11a1o/eojiDijxajzzxGW
	pg72MJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9j7-00000008Va6-1lw7;
	Wed, 11 Jun 2025 00:54:01 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6OR-000000086GI-1Zmo;
	Tue, 10 Jun 2025 21:20:29 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-87eca1c19e2so602356241.1;
        Tue, 10 Jun 2025 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749590426; x=1750195226; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wWQhuuEyoK+JNH/BgqW9wn8WNRcWE8A0uz1Xnd+CF2o=;
        b=Z3dI1zQo/lTQuFcGljTlzh+YrRsq+wySQV5fq4UIb+zqqwSw94+eNcfb1gSRnLBgzr
         s2PN7i9KdNxpAL6ea0zZNwoBQnTBhVdVyZYcym1fjcUnMN6sd8pHZakqQVYdPZxWYizl
         0zWEvZYPgy6zZeE3SWVlZdgum0ofE59GknOGdRGBc7r6NjrTXK/kkxDZ4/GGRw14fN4V
         Cl36gNRto+oyNWL0w0JVcqlIhnAJOYAIG3eT0ZP0HQNqRGTsAm5J1WJNX8mMQdb8SfYh
         OBWu+zIvkxdH5LssX7FMIDt5hwWyQd/cXGxFUY1wnniHa5svpiH03aRxlhIp2fGN/nBv
         hfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590426; x=1750195226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWQhuuEyoK+JNH/BgqW9wn8WNRcWE8A0uz1Xnd+CF2o=;
        b=JQvsVZgw+ynH/otmRZmExPtHhfVVEFXZqhjZ5gXL1/Iv3h8+oL7nQD3zmSnwjbWVy1
         nBzoUZxXqwPGLLfK9nyZssESlPaK/S2BOLnvCldLOpZB/tPw8TrXymaOAKdeHle0F3/1
         qPOz6DiGKYyoZR0Vl8bYdgrF1gTUwAWDlHJHaExVow6xXzZ0nzwo2RKaiPcmWvVtJ/9L
         kYmk1la5wOW9VahKQC3QPaJBS7knDv+pATZhUzsTCGZlW68RrY4yAarclH5jZoRsi3Wm
         /o0XEJ8AmTijoM9eteZcH9k9y6Ky9/NR6V4GUtao4TqjiyxEmex75W+qyxVF4McKDQvV
         NUew==
X-Forwarded-Encrypted: i=1; AJvYcCUajfn/BZfj6/0Oo+8hNdATND0llrXsrvwdRquo95NBzcW7r9tbMXVVyjJPRvUZ2u5hI5P5F7DPuBYd@lists.infradead.org, AJvYcCWRuo0nxeKQDEgq5d95I4Kl5qu+lSxgTO2N9nTWIvQ5InDKaaUQ2PPg4bcooOLD1aHFAFSZU5q9CGUPSfGKs0/l@lists.infradead.org
X-Gm-Message-State: AOJu0YxyM+WaDlkJDr8mk3P29OmUmGjgrg+iT3wyL4SA3box9BTJWr8t
	Jsn1LuMWZdru5PZDmWJPahAdjsVko5gu2MxOhf6zozxqBJt+zq3SGEBBRpypQTuKh3bATjbr
X-Gm-Gg: ASbGncu1av7RSbWzj70ej3zKLPMXQpmBMpp4fDZoOpQplh4DGo1XuiUEnoBN2HRD3KD
	wRLk6mm7j7vS104efqZ3yLh5bkhvE4THs4V3cXfBo/7TfnMebWsGmMPxCpU69cYUQKhPUv6t1le
	6McSILtQvFVDenSSK7J2Eb2j6GuVNEE3DfdWQMVzo/ttBPKk4hsu85Tg+7GFuGdFdPDvV/CnHKG
	WBRnQb4/HShwtU0x+h3TDG4M6qAXxKxv0OD3TaaeYx2oLqAadQBjtYsaMIz3bIcusIC1HiRl9At
	eMjQ8jurZ+mqBTAAecyTuWkVxrkBrclW2/e121BGiTyD/8Z/y5QDyvjuQc51
X-Google-Smtp-Source: AGHT+IGDXgBG6y7zW2MpyVdaqKpbTNDnRjbJRi3u91tn+U7IB/Trv1jeMCyTLcrjlDOUe09bWYO7Dw==
X-Received: by 2002:a05:6102:4a95:b0:4e7:596e:ec10 with SMTP id ada2fe7eead31-4e7bba330c4mr800465137.1.1749590426276;
        Tue, 10 Jun 2025 14:20:26 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5ce9::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeae777a0sm1882453241.11.2025.06.10.14.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:20:25 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:20:20 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/4] phy: rockchip-pcie: enable all four lanes
Message-ID: <1dd7e551a9f6c7f6e9c3764e61261388d2bedaeb.1749588810.git.geraldogabriel@gmail.com>
References: <cover.1749588810.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749588810.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_142027_421693_DF3139B3 
X-CRM114-Status: GOOD (  11.34  )
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
through GRF register.

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


