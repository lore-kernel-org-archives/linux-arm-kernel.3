Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4128CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLMumJf1RKl2eLxtJE2mfNPELwqfdC4TqjLEXDZKRSI=; b=CEU2sVXiPnkeZ2WaRilw4KeX2h
	vVo4wVGv+2RL0GVrG+F/jNQV7hrPvDmyK2WzD6cQNQ/R1BQ7Y0E3/XwjNRo+fwQ/qOQpLjUftgQ8Y
	OBIq53xCHdszTt2jbVK+3LYgEQLi7gfOpSTOXksqE+Ffsw+Zlesje/0u5dOhDpXxezv/LGel0fAB+
	8XBr6/JVGPyNCRIc4cEaszsqKcezjPu8TMzGDHG8Q0vIATGjjSnJSR0RsynOuYjOepYdvsjGhM0PW
	2SOHAA6xorqbyhkYCVursBYfv2FF6hyVCLAYqdB9AiN7Z9S0zSMRAy1mPMucGVF8IEkw4CFbsUXk9
	iry3KkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlcZ-00000009zOo-32r1;
	Thu, 11 Jun 2026 20:03:23 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlcV-00000009zNa-2xyV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:03:22 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-517dc520840so1445991cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208198; x=1781812998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLMumJf1RKl2eLxtJE2mfNPELwqfdC4TqjLEXDZKRSI=;
        b=mOyZDGgYYdMtyo+g+rrePSGvNPK7nUhPWlwqEb9Onk6MG6XDNR0iy2+JZ2ivVTxhWL
         W7T1rNtxkTr2kkO1y04oftzgRRude3eGUTLNegrnZi+whikVERGD81uVo+KHIksgOON8
         a6nFB8+635R2iFMKgS5AJ4gXPen7WikwFljigkKpm8WX7fq2KmsddQ7R5uqlN4JkZtUu
         9OqdqXjKSkWDD1rgTIXfTjRkN+gpZqATYUpTYSmJWtKtXOUuMuXeneD124ZOO34dN+W5
         fBq2mOB0GdCilpOs1kcojJfVUaitnpfuSLmjA0/y2oM0ApuixncjZQH6qHp6liOwMMYY
         tzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208198; x=1781812998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLMumJf1RKl2eLxtJE2mfNPELwqfdC4TqjLEXDZKRSI=;
        b=RYmfuiJs7GezIvEOh66q9TKVZ4kxDSP+A4SCuGpWFszKmMrPlH/hE6Se/KrPXQkGqD
         ibDi0bWKp6HvUWkcecpyVwkv50AbVH5GlRe5V2N4bO9ccU68Ik5ZLH/C/2z6aXVUdxha
         TNvfmPKT2KJSJQ+E0Rs90O0AsjT41wv7D8qZQtALZhKcEDO6LxPF5UaDrVJxmVYfkT4K
         NLmuWbLMtQGCaEmEVWheECViYqaEpiL+WjDc7DYupypr14kJ+r5rVzLvpXM3B+lgJye6
         P7dT7fM2ucDo6lE1EbIwBaV5QpTcLLC6LmTnA3I58DDkJIAtEFULWaGfxcVkOLAXvmYh
         oXtA==
X-Forwarded-Encrypted: i=1; AFNElJ+t5vzmb/KkYBVsMHQjl7PZAEEkCGm5Xg12zdMg+rntyVUQy5hvHkY1yPq7BM4b8yG00jdqXbwGMLYSymt/ftVG@lists.infradead.org
X-Gm-Message-State: AOJu0YxlPUH4fDRDBzOVoTd+6gFgKxvbAQM3uYL15J+JdPm4EaNl62VS
	CRilg3kWkKMvxW4/KJCvxkCtl9Y4Us/hRUZQf7EAP8PgWfgi98dvtW4F
X-Gm-Gg: Acq92OGdx/VMezMy6dENxLVpfC6scLlkZes/0Ne3oG9LZrbIkNQiK4Eb8agwMHzRJdT
	ZqzIvAXY6GNkrRjbLsDVsHbOpIIsGzOZkl8VOATip4Nr30+KLKyrjdmeYWFTYM0SVAXYZAwSqwC
	udYY6NSlzbH9/Uq1DDxlJ/LChDVP7fWm/r6dIk6gENoY4y+sDg+Gz1imzeF9MUigsqrSV6Wu0yu
	/F3wYkN4NVBgc4lPkpKEMNb1T3F+3vfxDHJzUAhm0UlpbN8sL6s9ltHdQVsumdPHALX1ZWVGSxn
	vZrUwrsEMxOLGYufHBrQJRfikyEfiK5KLCZBUFAB/JhJug65KoaPP9Fw7EgXB1gk2oE0d8CA8rW
	+KjKFD/INsTWg7nn2fdQahaSpui1lFTjH8VL/Ip6p1J6S61ytacnEt29/yLCgG0l0nByYP8Cgu/
	FqdL6IsSIO
X-Received: by 2002:ad4:4ee6:0:b0:8cc:f135:529e with SMTP id 6a1803df08f44-8d1dc1a0cebmr77291506d6.34.1781208198118;
        Thu, 11 Jun 2026 13:03:18 -0700 (PDT)
Received: from geday ([2804:7f2:800b:f09::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d301b2a79asm3229516d6.13.2026.06.11.13.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:03:17 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:03:11 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [PATCH v6 1/3] PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
Message-ID: <76c828d29b0f05df0970b3a862ee1af8c96faf17.1781207474.git.geraldogabriel@gmail.com>
References: <cover.1781207474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781207474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_130319_756874_D38F0C01 
X-CRM114-Status: GOOD (  14.43  )
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

Drop the 5.0 GT/s Link Speed retraining code block from Rockchip PCIe
EP driver. The reason is that Shawn Lin from Rockchip has reiterated
that there may be danger of "catastrophic failure" in using their PCIe
with 5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper errata,
and the particulars are thus unknown, this may cause data loss or
worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-ep.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 799461335762e..9ebc227a1ef84 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -553,19 +553,6 @@ static void rockchip_pcie_ep_link_training(struct work_struct *work)
 	if (ret)
 		goto again;
 
-	/*
-	 * Check the current speed: if gen2 speed was requested and we are not
-	 * at gen2 speed yet, retrain again for gen2.
-	 */
-	val = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL);
-	if (!PCIE_LINK_IS_GEN2(val) && rockchip->link_gen == 2) {
-		/* Enable retrain for gen2 */
-		rockchip_pcie_ep_retrain_link(rockchip);
-		readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
-				   val, PCIE_LINK_IS_GEN2(val), 50,
-				   LINK_TRAIN_TIMEOUT);
-	}
-
 	/* Check again that the link is up */
 	if (!rockchip_pcie_ep_link_up(rockchip))
 		goto again;
-- 
2.54.0


