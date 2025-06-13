Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87673C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=; b=YTo0LkA4w/IL6ZZI9bPcVm+hsS
	cDnoEs8OIvN0fOkSzs5Q3l8RxXpPUD30K23DFCstDrQeNKl14FzyWNydqhCxIjaUGBu4resyNNZbl
	D3PzcgzzOh7EgJ0eaLOuArQSTQRUelMz+dKhjy0Mz7R9Ufbk5yq22hzuZlUHnPhx1k47sguFgCRPu
	1iJGxt+frrUJzXe1ulw4oHXdfESrWnfAAJ4o+oJSJhSsrm1Va9AcvPneYVLPLgjTc1e0mJEY2x+lL
	/Qs++nepNYXcuLjdBW3chifu7AA3CT7kI+/RxkJkWuqXTw4hZQGPnsd1vFNly87/73uUEoC8ZEDkz
	bEZ1PbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ94p-0000000HJEp-0BAj;
	Fri, 13 Jun 2025 18:24:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7pE-0000000H8Ot-3s9m;
	Fri, 13 Jun 2025 17:04:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2350b1b9129so17740555ad.0;
        Fri, 13 Jun 2025 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749834260; x=1750439060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=WdgkWWhIhlAFQw+xZ7AARH34t0giRZYMQhNRmC8Ab1ulAr2jJjIkSGUzPA2mchcNiE
         j8YOAFTcz+PVsH93kZTne07SIN2bRx++oinHsUPSseApUhw1u92Dzl5IGI1ooVqHwEe2
         x04cyzIyfGZpJypXvJSmAJlavAo6SqkyUz43ZckGslo7Q4d+VHmvNMjRKwZ26V+RvGt0
         lsKGgAJU3unFjEjTbpQtp060FjSJW1rNZf6XzUqgbzmiW47CvCNQZuDTYxCyL1LzcqNU
         shN0bHHeMSAJYRDXNy0sCZi/Ax187QDLy8HqORU4n/DG6A9julfCK0YXPmF+28A/X5a8
         I2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834260; x=1750439060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=JYM7sLv3LvB2CkSvsKJfnNKr5K5+eg+bIyKFxDrgg9DUGgUk1ZU+/glJ8Dmh2icCqU
         s3XfC+Bj0N4mM695xkla85bTgPJk9ind9kgKL3LxdoeqrWLKJhPdbmbe0xqQxtHhKQKZ
         EF4C4sqYF2V7JSed9tpW/4KjQ10qg2QKchotA4hHc0ntd07wiWoCaizGpMHJ3Nv/5WEJ
         eW4Qb+Qiaihme8fZYa4r+dP58ec1YS+ueJzsDlr8+UCba02u/iDjKrhof0Uu3b1JQ1hj
         r5Fz6lSqjK1LSIIG8gFOlweLmfUxnA+oKOEGNxWZ+ZZXkvykAO/hs+lCficKdQVsBlXi
         AE8A==
X-Forwarded-Encrypted: i=1; AJvYcCU4RlUNPEztuZKMRqavtVGf7XEz8N/va6bFFWlqu7pC1Pp7/vADW6hp424bS2ijsmTBiFl6XFvDa2Zo@lists.infradead.org, AJvYcCXniKQ3YBUjarqeBufC+GcOFz71J7OvKxNNu+pHARKJujSxmleSN9vyYPEC489Q8YzbVGTpimyL2aNDi8FHNZE1@lists.infradead.org
X-Gm-Message-State: AOJu0YyZjW5N6npOdic4w484oh1VjXF/B4RK0ypDiLZVxwBda0lCi8BT
	p5UqzCTgkzJnuH2fH/CAzd7kVOKQz+OUIVUAIUN0O42pfJ67W4T3wbIX8rfRi2he
X-Gm-Gg: ASbGncvshMqLKHteD9JJziLDOW4jfmiR5TyWXzu1sp+8Bg0qBP6rs/iktVi4X5ohDRR
	9M8xU+hoGjGs0TTRUo7D49LcVPm7aw83G9Jt8qn29Xm/WH7l1q/ZGYiFi8UAmTGHkrEUJhogF7/
	XfLBxqT/k8UFjqijBIz8oFUDl7q7QtvXUCjchFFnnegOIQ39uU/VNQZ+yByQ8CYi5/dld0UGcRW
	oLiSQevZc5/50E8pBABZ/YEda6d4djLrEuMpRW2kNgbL55J/9CZs/PlvvwTKdS2idvdNPktUXWz
	XDQ2UPI2F+N2mr04fWSNa4Kfxfzfd8pLPNU11mZldxni9AaXuw==
X-Google-Smtp-Source: AGHT+IGZlaoYzpRe5dnXAmpmilA+8wbE0qcSiy78BVL+eKxMI8k9z867nxqg1IoThq9SVp8FoIbSaw==
X-Received: by 2002:a17:902:cccd:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-2366b344261mr3162205ad.17.1749834259682;
        Fri, 13 Jun 2025 10:04:19 -0700 (PDT)
Received: from geday ([2804:7f2:800b:8497::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88be1fsm16961065ad.8.2025.06.13.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:04:19 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:04:13 -0300
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
Subject: [RFC PATCH v5 4/4] phy: rockchip-pcie: Adjust read mask and write
Message-ID: <7068a941037eca8ef37cc65e8e08a136c7aac924.1749833987.git.geraldogabriel@gmail.com>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749833986.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100420_957759_264AD657 
X-CRM114-Status: GOOD (  11.57  )
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

Section 17.6.10 of the RK3399 TRM "PCIe PIPE PHY registers Description"
defines asynchronous strobe TEST_WRITE which should be enabled then
disabled and seems to have been copy-pasted as of current. Adjust it.
While at it, adjust read mask which should be the same as write mask.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 48bcc7d2b33b..35d2523ee776 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -30,9 +30,9 @@
 #define PHY_CFG_ADDR_SHIFT    1
 #define PHY_CFG_DATA_MASK     0xf
 #define PHY_CFG_ADDR_MASK     0x3f
-#define PHY_CFG_RD_MASK       0x3ff
+#define PHY_CFG_RD_MASK       0x3f
 #define PHY_CFG_WR_ENABLE     1
-#define PHY_CFG_WR_DISABLE    1
+#define PHY_CFG_WR_DISABLE    0
 #define PHY_CFG_WR_SHIFT      0
 #define PHY_CFG_WR_MASK       1
 #define PHY_CFG_PLL_LOCK      0x10
-- 
2.49.0


