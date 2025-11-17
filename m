Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3BECEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+EKY9tXpDqbosng82pC4u0rmGAubkf6qXRrqvdwmlY=; b=zewRvLC6NxGeqCNsKieEwxyjAV
	OJy08CsUbUdGGycxx+V/aera1UcZxJxPAD3gOzj6Q8JZ53tKxTvaQRyGsFEghpL2fPdtACBADNaxJ
	hyyVQVOv1ZyQVk/v2qaBusr+MsZfzdrxEtZInmuZ0mG5CUJ0wmy7x41FpGPHsul7uCKwSYXi85OT2
	+anWYuKoAUsGNUhSdmK5LHbhF9tPOqEqikAHGAg2k4LHB7lBf6cpA2mz1YLnmIcLmY7VmMxeCfUUB
	8AoIiSlyli9SeWv19JVjC2K3rMHvH0vZwYqW3E9vGrUh4qXBuMiy6s1Es5Uc84kCHUWO8sPODdveS
	4aRdg23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gV-0000000Gajq-17p7;
	Mon, 17 Nov 2025 18:10:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gT-0000000GaiW-0IKU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:10:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29844c68068so45500275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403036; x=1764007836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+EKY9tXpDqbosng82pC4u0rmGAubkf6qXRrqvdwmlY=;
        b=Z/vildnQMZSskoskDrvZIzT+NZEWfKzESmPAE045sG4nH1Mq4ZvGHDDWSmMtRJySwS
         EgSRNj3Nvw9bM8+iwOaBwZJ74AQsfgc9KnvNW6tjByJvKbJI1+xaPAYeNXSV0YVKvK9i
         9kcCu49T+Z/elgr6ST+gDsQE+iEQLq3y7PBmDjZsBmCS+kEL38E15g9QXwcLyja5n3X8
         3WREvstivhjTnhuWP4/y7MKTUCzOlWXtF/k0lb43CCX8OBiVEClDJX7Ivx6yRrqCQD09
         EazTO27cPpUWQqKYhhB8N3nfnew60C8wua3YOl44hQWW5M+tFQnEKwbPCFbvyfhpULdn
         U3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403036; x=1764007836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9+EKY9tXpDqbosng82pC4u0rmGAubkf6qXRrqvdwmlY=;
        b=B+dz5VHbY/4AGaOXRKhoL2NKwa6emuEU9wAyya+uVdyeRNoBn+jZzP5EWw2mpmCsz6
         nbydVTjuCw83An/W9B4YFSC82I93a5iNnQIZp/o9Fq4DEIuFP8zAG7f17mMG6J4sAL+4
         9e9FeY3rLnmsYZg5oxcLUETnpPIWxjFzGO3LNYLajZB4g79TjMrBtVvJUahSy23x6lDy
         hnLl31D9BxmF8OiL4gQnmGRK93DSAX3DY7V0AqXCWXyTQBZj0S7U0RVqnt3Ci40Qpfkv
         DRyCINlS/7JR/UjcBF5GVv8/gYDURBvQvNEMsdf5lyd58Sw8AcxkzS8Q7PLv9gcNNutI
         UJtA==
X-Forwarded-Encrypted: i=1; AJvYcCW+NBkFiX5N3Ipqw+hdk0Y1yAPaO7DUXnKCZQWDtPbkne+CvCZ5gecsFCIzejq3F9EdAShLypMjrtgYb/dS/MF7@lists.infradead.org
X-Gm-Message-State: AOJu0YwrAbR2KZrebHY0sxsaRYRNpVK5PW2mBneTy66mxhwsXZMDH4tg
	YtuQe5yaD3cWvVjCxyJLk2qZIgyMgHbi2pUU+jiHZ4Y6/AlG1dAP6Q9q
X-Gm-Gg: ASbGnculFXzSRvxvwlWlng3RGEN6Ip6ij14LGY13XV0KJ0/GKBH65rhHQn/C4VydmQ9
	94NRmcgMgMg5eJRGJUTidYY8IFY4ySFbK4tJFFSpOE7aOt149NDfEVke5WSA24A8BCVuUlEDErh
	LtuwPGTQBQAkozGLoYID22ovCoQRD6KIEe9LWlG6P4MRuBuM7IRWEkT24aMgpFKDXJMLPhg4wwF
	JHx8vYwf7YPznKKSR74yPmyKC61YnRcLj5qqKu8F6sFCKIdEIzWQy53YaNY8d/2gtrR4/nFoSqh
	/dNPrYlB1y9qAG1H45m15ktmXx/UkcX7B69FxFcTSVczHSXLRXihedH8mm9tZQXdiv/79f+HNRM
	LWrHPEwvUgQAqysSV8U5oNQUx0g4FaPRE0vtobxd5jzaTqFG1jqRyKIDMniBDkEQRVQMxVdYpoR
	tGBhpKUcoL
X-Google-Smtp-Source: AGHT+IGeyCwjL8jXeUnUvtXTHW7ITleNa0lMicopabeVmB9BMPeOlb78pEgF+ubGgNHai/Yz0yRVgQ==
X-Received: by 2002:a17:902:cf0e:b0:27e:ef96:c153 with SMTP id d9443c01a7336-2986a6d5195mr152554635ad.19.1763403036292;
        Mon, 17 Nov 2025 10:10:36 -0800 (PST)
Received: from rockpi-5b ([45.112.0.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm147237955ad.32.2025.11.17.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:10:35 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci@vger.kernel.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-rockchip@lists.infradead.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 1/5] PCI: rockchip: Fix Link Control register offset and enable ASPM/CLKREQ
Date: Mon, 17 Nov 2025 23:40:09 +0530
Message-ID: <20251117181023.482138-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117181023.482138-1-linux.amoon@gmail.com>
References: <20251117181023.482138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_101037_118096_7652C76C 
X-CRM114-Status: GOOD (  14.31  )
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

As per the RK3399 TRM (Part 2, 17.6.6.1.31), the Link Control register
(RC_CONFIG_LC) resides at an offset of 0xd0 within the Root Complex (RC)
configuration space, not at the offset of the PCI Express Capability List
(0xc0). Following changes correct the register offset to use
PCIE_RC_CONFIG_LC (0xd0) to configure link control.

Additionally, this commit explicitly enables ASPM (Active State Power
Management) control and the CLKREQ# (Clock Request) mechanism as part of
the Link Control register programming when enabling bandwidth
notifications.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 15 ++++++++-------
 drivers/pci/controller/pcie-rockchip.h      |  1 +
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..f0de5b2590c4 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -32,18 +32,19 @@ static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-	status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL);
+	status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE |
+		   PCI_EXP_LNKCTL_ASPMC | PCI_EXP_LNKCTL_CLKREQ_EN);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_clr_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL);
 	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_update_txcredit_mui(struct rockchip_pcie *rockchip)
@@ -306,9 +307,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 	/* Set RC's RCB to 128 */
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKCTL_RCB;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL);
 
 	/* Enable Gen1 training */
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 3e82a69b9c00..5d8a3ae38599 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -157,6 +157,7 @@
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
 #define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
+#define PCIE_RC_CONFIG_LC		(PCIE_RC_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
 #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
-- 
2.50.1


