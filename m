Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19493CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gazcyDKCqVDM4NaE88dT10YpQkqHH5/XsZTj015pVas=; b=tOFvUfxB5L764tp5yezdQJjlcI
	VhG5PVTLXuZii6dP/8InvfMOiiE5VSYTbHjxtIrYcGKEplEL2GY/7QT3mV3lO3QKffHkw+QQFQw0e
	RdWGeGQ54llWqZ6WzWQsdBxtfwTpOh4p/KUBSZnvylNdUQ/vyR1eOhY5sLpFnpyWue6Yfo+WnVRuU
	GiP1htDzOLdMywXuLMHWOwSdlnGlk62LV4tYVEjjnHZoT1INrlh6wbPzP5WD0Ywjwu5D+z1bZBVlY
	J/PPPdl3r4tvGrvmBB8HjzY1FtIQDn15gv2qogBFAYxaC9isU3ypPizvDjyn+92c/4awqVu0Itz6j
	yvJNDJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gt-0000000Gb3b-2BLP;
	Mon, 17 Nov 2025 18:11:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gq-0000000Gb0U-37IL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:11:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2958db8ae4fso42678565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403060; x=1764007860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gazcyDKCqVDM4NaE88dT10YpQkqHH5/XsZTj015pVas=;
        b=CRcYmBOdgZsQxpuG0C2L38zuuDvivbdLuX4Q4MUmjlFB6DpN1Bmx4TtPcc1Xdksg8P
         M16nTcx18TARGCqJgnVmHQ82i1D5dGZo/FeOq0bAYiHcI8V2GMT58OMy4idse0M/rQoZ
         XzA8xD5eHFnaCvIsBLQ8987u5fTywvb9YEFxbaIN5kJqU4oIYAivIn1oBzBsxIyMArrQ
         TKS8/y9gsWqfq33Rsdi/8VDtcws5GqFIT+laKnSl0Mm1JjBQ/RAvVqsTj1dUbsrvo+8T
         BRcPGrrsnhJ8PpUFlwEFpVEuRjOvvDi5dYYAfYU5VcsU74xyvgPZ0vdaIJeQtLpt/W/O
         t8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403060; x=1764007860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gazcyDKCqVDM4NaE88dT10YpQkqHH5/XsZTj015pVas=;
        b=q+JQ6YlagcuIYueVlWbYXit/yowt2w2yjV1jIQN43jPX4AbAdS0MSrvCoJFRnQvK+c
         z9YvWWn15EhbCiLuaLjQK+XER5jNYEVpJTG5EJ5msWcpweyt0pS8t59vgsqxLCw/xFcd
         wmO/RTae2yNiUelbUZfsKMy5yGsWqs3pHdX2GX/STNDBTllsdU/KAA7NTDAYRI73+CHz
         TR9ftr8EUvy+37unEN2ud8lMAqNHgCVJAyfOKrA6Q5dl6N4NnXnqTFr4rpASV6Wpuy7E
         YrCdhMfcE0xLVrt54Oj2H2z8yYZh74bRZX+R9IQ6S6WIt9Zw+XS6OOVQRynernTHjIQf
         CUWw==
X-Forwarded-Encrypted: i=1; AJvYcCUZoyC/NCYpKqHf+2iNbenJHkyxnrfBgt/BjHAv3m0ITpaVOk3TNjQjcut8G4X3oGLIa2RWgND8AI+jbxZbYuAX@lists.infradead.org
X-Gm-Message-State: AOJu0YxnqjLz6TIuqPgvJacYTSE8oqMt03zIPfz6Ux9pztm+5pSl6DNE
	GdpZ2s+e6ktadpzbR8piDniRuJYT/PV3Vfh2YV+ukO6eqcoan9T8WCFe
X-Gm-Gg: ASbGnctnyHGyciaiyxKCHxncMha9sJfYOmFbewWkMCPloVwR97jhCK0oLmPk6Dficih
	1k14dSgCMBvbwQbAC4yoKMKZQuY3F4AUc98ZcXGtyQF5UN1pyCdGCla7BdozDjWoN6GGNENgLG/
	lI74gVFypcL7vAhkud5zl/atqgpp9E/YZbkHGT8t4iYM+rR5Rf0TIuEna4oJ2oVVzr5gnFw41I0
	1p9xFb4hl8DAPyrDxzZKRW/vwcRMXx1f23Mt1z56EidHW5H6/IJzHL0C6NlqS/2kcI3OyGD+GBL
	r3n4qWmP9n5uHCciqJtKtADrDZ0h7YM5gCh+1oyRGuhBD3ZdBxEmbe/J8/Z3HTVgH59EwQIU7Lq
	0MJDt0yOSOGpAZTopKZIAjVLKKBjAWlo//vAdXztlf7djX5aPhcOplXmG4fF0srkvqa8FG44gLA
	gt4pHR7Hp+s0ycD4y055c=
X-Google-Smtp-Source: AGHT+IEH430mBOahI/CtVHCqRSIqCGq9hYMzLu8e8nwRDN0slBe2X4NbiY309RgQgf9w07IlP9p0SA==
X-Received: by 2002:a17:903:ac7:b0:295:557e:746a with SMTP id d9443c01a7336-2986a6d04femr131798225ad.13.1763403059763;
        Mon, 17 Nov 2025 10:10:59 -0800 (PST)
Received: from rockpi-5b ([45.112.0.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm147237955ad.32.2025.11.17.10.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:10:59 -0800 (PST)
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
Subject: [RFC v1 5/5] PCI: rockchip: Fix Linkwidth Control Register offset for Retrain Link
Date: Mon, 17 Nov 2025 23:40:13 +0530
Message-ID: <20251117181023.482138-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117181023.482138-1-linux.amoon@gmail.com>
References: <20251117181023.482138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_101100_782033_4F266DC5 
X-CRM114-Status: GOOD (  15.14  )
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

As per 17.6.7.1.21 Linkwidth Control Register (PCIE_RC_CONFIG_LWC) reside
at offset 0x50 within the Root Complex (RC) configuration space, not at
the offset of the PCI Express Capability List (0xc0). Following changes
corrects the register offset to use PCIE_RC_CONFIG_LWC (0x50) to configure
Retrain link.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++--
 drivers/pci/controller/pcie-rockchip.h      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index b3c9b9cbeb8d..aae3def64bf0 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -338,9 +338,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		status &= ~PCI_EXP_LNKCTL2_TLS;
 		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LC2 + PCI_EXP_LNKCTL2);
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LWC + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LWC + PCI_EXP_LNKCTL);
 
 		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
 					 status, PCIE_LINK_IS_GEN2(status), 20,
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index a83ce7787466..5bcaef7bba4c 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -160,6 +160,7 @@
 #define PCIE_RC_CONFIG_DC		(PCIE_RC_CONFIG_BASE + 0xc8)
 #define PCIE_RC_CONFIG_LC		(PCIE_RC_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_SR		(PCIE_RC_CONFIG_BASE + 0xd4)
+#define PCIE_RC_CONFIG_LWC		(PCIE_RC_CONFIG_BASE + 0x50)
 #define PCIE_RC_CONFIG_LC2		(PCIE_RC_CONFIG_BASE + 0xf0)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
-- 
2.50.1


