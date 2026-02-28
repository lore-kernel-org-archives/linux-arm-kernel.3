Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBB91048922
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR8qs9++9EnY6kiO3ZkloT5P8dh9BxfptB2pOEQ7BLA=; b=vQgHU+Zl8X9SrYtULUSpSEltn9
	6Nt+oNKI4uIvaKpkSNimVtisSOlRNU5HznT87mihH2v8mZXnbzgnDM+8uwnsT3gxl+17ARt/Ms099
	NfK72TSbZOMNci5b15mHNZyQ6tsINbBgyKbEHqRf5JnqZx7fA9qAKyPaf20cGAiBmxq2sUS+RXbfL
	/6u7E5VaiHB1pGjd5stzcRL5j+gV7e9ij49nfpW83L1XSTPH6gR323YgnRHLGc8+rnJTJRfFTyYVQ
	CtcJecPN5uyyPkzGivWtsrVCR/VeVzaP7HVpJeXlhjoi/Ui8Dp6KrU9d1GeXwb2c6a8OCAWw6OgTC
	D1iyRyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8by-00000009Lh5-3eeB;
	Sat, 28 Feb 2026 00:55:14 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8bv-00000009Ldu-3BJu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:55:14 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-56a8a20e6e6so1194225e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 16:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772240110; x=1772844910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tR8qs9++9EnY6kiO3ZkloT5P8dh9BxfptB2pOEQ7BLA=;
        b=DL//HyC27ixMDPniw0WNwdwxqXcjhMTbGyTeNwlLzcBK1MUC4qZw/O2Y6eQhaWuzkg
         RJj/0HVeUyPrZlyBYb5yUUN/lxOvbZXGPeAA2RW+9gBICV4pKNvX14Sjl5IIBISUQQHo
         rNVuH7kMlFfK1nTwOaBzsXUDHJ7SkkLukqOtaBHHlcLwt1ZNz0bTMUglSsFKtnqoEfRm
         lffuwBxz9UZaHZjR/nO0Z6Ok7ivWXvcPH4QGNR4IfZg0rU5YmWIR4M8paBUS+CIp5v/m
         VTOouXh8zDmfxzmUyghHrmDCRFHhMQ2R33slTsGKruEhB4NLJZ1lPqeld107HjNQiYpG
         ka5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772240110; x=1772844910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR8qs9++9EnY6kiO3ZkloT5P8dh9BxfptB2pOEQ7BLA=;
        b=Gn2kPFOby4LQeqSwlRamxb4SeVPGQE+5LR5bNN6Ln7XNsEwf2/SX48CV3CvKZODWHj
         sYj1+b9LFhTbXQMyoxyGXV7hBera0u5vNnY9EqXQLSZsHnEMrWXZBUX8KeOCmLr+OKhM
         ltB+VL4XoR+axRAsEFvrvyiBMRW+ZG/briLI+7ouPWglJ20TGRiAkYfLT6n3Jl59L/mx
         jyLvRH+o5cmvFlV1MHVzGP7jXqBN8eNvbti0TgXQTCSBOqOTrw1wPvzR7xckbUjiJnF1
         NX7GUO5FDuIygWGEOKiF+ugplHBUQXyD5zYtQSjZ4rWajqoNaGUul7mPeBIoct2FsDP/
         wQVw==
X-Forwarded-Encrypted: i=1; AJvYcCVioUjA8tqbrzZ9/jayeNE45ECSYWaAAC1yuNOfYH7CxLYm3d4rDsCaxVrKUuQT6x7b1B8C8+eXeclQfWoqM+cA@lists.infradead.org
X-Gm-Message-State: AOJu0YyKHZuHBq4LBLbKvnPK4W7wpddyRyLhqw2NoI+0nb33UpmLOItx
	XzTSuVIYmrgZ1u65azWpsEFJ0bTsJOwFUgmInqzP0rDgzUVtohpAbsxa
X-Gm-Gg: ATEYQzxNxxSLJliA3FSMqM33QOX5puExnG6NLzrXuTAHi/qs0QOkMl0psplcmYpl5BG
	U9MJ0kWoI1LTm65V5X9vIlpvlAftpSv8ivFHtKM3GyuK5d22rkNYfnelMsVVUMuP7imYHUBr9PZ
	NWpOgXO1IVgCM81L/c00vzd1NkxiSC7GgDlUAMKtwUgvI7GpNBXSHgzPdGUFEEHBmiy5IhmZ1dQ
	N3hf66WQQbse2Oe3C+d29Unv2vFJ5CR3G2mIlJvKlsmxKQqNPKOWaP4Ky0Q7WdiOZCYuMF6mGmk
	nzLHlTQxqhiHvtveUXEkAET+To9jmPbTUTaDUyeC/WQS9jYAlSmhtMkDvCvNOAZ5zJ1aS22ZMDI
	Onv4t9+hynLK2zy1QKxB3mxOqGp8S/bKf3kjrAFgYaH/JurO4pMJHGD5wTjlaUfP6smI+x4LymE
	a0jjZJaL2tkQ==
X-Received: by 2002:a05:6122:319c:b0:56a:995d:8a55 with SMTP id 71dfb90a1353d-56aa0aafaa0mr2391700e0c.12.1772240110383;
        Fri, 27 Feb 2026 16:55:10 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb4fbesm8366399e0c.5.2026.02.27.16.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:55:09 -0800 (PST)
Date: Fri, 27 Feb 2026 21:55:03 -0300
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
Subject: [PATCH v5 1/4] PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
Message-ID: <3391ff1386aafbee1754ca114d77961f23e2c09c.1772239598.git.geraldogabriel@gmail.com>
References: <cover.1772239598.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772239598.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_165511_854604_9EE21186 
X-CRM114-Status: GOOD (  15.25  )
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
index 799461335762..9ebc227a1ef8 100644
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
2.52.0


