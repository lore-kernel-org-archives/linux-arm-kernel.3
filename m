Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68D0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=; b=fX1renTC+ajzonqlbS3J/4zpN7
	vse8UHxQ4R1obqw7cErSNvIneVdWn+xCJHfydWwTq9/uXAK0H349CVeXKCiOpROdeR8EscZXBkgTm
	yIMB7Z7+97d9ePNZ834uB2V6iheAgwJxfiN5gRoX5j/BzQlBCtg/ksH1XmTGdAtshswmEHCKrI6PS
	etuM9pp3zL2HPJpw91xFbBBawoI9F5GWwZpv9iXfuldrwPBlws13585tGdhbyXH8ZZ/LPMHLptKDU
	lrSOgFoT/iWpXvykPDLusZDxH+olGpyRD90o4OhFVYgIVLi4JIZ0DDn7AF5bH3QOToVT8MMEVUwBd
	EUXwdD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7RJ-0000000H4UC-2AJJ;
	Fri, 13 Jun 2025 16:39:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5zH-0000000Goyw-1N8r;
	Fri, 13 Jun 2025 15:06:36 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-31329098ae8so2023457a91.1;
        Fri, 13 Jun 2025 08:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827195; x=1750431995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=SNfRlzjkr7TIj77XwErXY56wQWczBjjvHCRlYqHNdK0+IoTVE/o8T+X8uwWuZ8LBCa
         7QHXXl2GrQHcv86WkFoIFGh1UK6b2kXsBrLEpJQTMBooL5LAZIKrQT+cH2ZrnU5F/VVA
         1et+UF/cBZN5b58KdMa4qTbvjiIm0pte18vNcW4TsdSTThuN+JxNo0er9u3SlyzEx4LI
         hRivDF9NTKA+Vj/wkv4abH9amVoIszmBPOGqQMO2WyqLuWMzjHly/Q8esx9dHt38rsjt
         8qwrWVpnvZbl6rh5qZdLNp4EG30TxmhZVySFyPWEXPOG4c8WZeqhHI1Js8d00ANjxwJn
         f1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827195; x=1750431995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=RL3epu3igBVigtEYgOw0/PYWAyw22n9L3XjWplwkYgAZuJE0QdoEYcki8HIkDG1kzJ
         8b8t/XHopN/tYfBvi9bl/a4+yHuOTBUjeBz3IHlMqKEyI/prvRqCDXqU6yn8pk8i+Kyl
         PtuNn+1LZ/X//S2fAUOjOYZN2CWhvVaFL+HH0ZQlV60Z8m+VprKLMF92qQX3mwKCyAxI
         PR4OLd+0D6aM2SZ9ZSZNbUFZe6+XbuNE0lHHFVRgftmYh6j4qVGgC/PGHHXnMJtwG1eW
         m9BfacV1GPh0b/ZH6nPOliWe1pUTlCkgZJVnwweu7iJ010mUlAeVWKRzdPsNcxwvyysq
         b3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYzP25BgLxeCx3ykSNTAoKRM+koKnL1HmCMoSHwb5VwkdKYO6H8WBUMl5Y9cJgEvyBbOizlT3dpMoZ1B7TiETt@lists.infradead.org, AJvYcCWoZqFUgPT/JbMP/Rr4S6QLeA4CuLUQQy+lo2W/DNWoCE1xiSRsMVvwJfy5RxI60x5JA5+7BNqZaGXA@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVam6baJ91lbecQgzPYNLTm0VFX1Qcw5E/acOuRRpw+keKehQ
	9Ih/p9azThYbz+B4kPfkJo3inbktU88LcCy5732/Ef6Zqnp0ktkjDvHnU+rF3tg8
X-Gm-Gg: ASbGncsLOXNsTXdDqk+lyB3EezLjJHg4sd0CoutBN1NmbvBC6SxZRn+wPYRHWsnBfwL
	hlZ5cYxSO0PGiXGS0+Ni0vghasy9KpJC2dRhO9BRN/77gumIM6rSv0xT6eeKJLLWOBhLioQMnzT
	SghKkOQTwZujE1mYvH2JV9q0M2V7R6phKCmZ8nIf0E6mItLJxuxGVuneDqzjzUeFMRvUPTHK7EV
	sADW/fpf3ulN6rc7YcD9+cbZ4B5cTJq8DGMviUbkGm9kiaKkBgl/OR6TnC5ru16cFFGogBGCMUH
	Fw4YzBffRTnlbW30QfSor5Tm14oitKl9gRiHZ57tjaHx1DGrb8g88F+I237O
X-Google-Smtp-Source: AGHT+IHrDxh6U4VAfIfK65vuTtcjHspUUqpNcD7PvyW2ItZ3xJVTxhDo3I8Q61np12P96HXNsZ4NXw==
X-Received: by 2002:a17:90a:e184:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-313e9036d04mr1456076a91.3.1749827194621;
        Fri, 13 Jun 2025 08:06:34 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b499cbsm3885857a91.26.2025.06.13.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:06:34 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:06:28 -0300
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
Subject: [RESEND RFC PATCH v4 5/5] phy: rockchip-pcie: Adjust read mask and
 write
Message-ID: <b32c8e4e0e36c03ae72bff13926d8bdd9131c838.1749827015.git.geraldogabriel@gmail.com>
References: <cover.1749827015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749827015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080635_365207_845D5887 
X-CRM114-Status: GOOD (  10.96  )
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


