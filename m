Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E99CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ec1PASGse1c+caWp4ium+eJ62vTRL+jpVdDXW6vSJlU=; b=31XOhPz1euXSVJfNwAR1uhOkqS
	G2tiZQ97+YtxGGdZsaa3ZIzhjczUsLWfMzkgcR9tFqpCcQdNi+i67xWwUnKv1JgeappbJ/ir4M3EI
	ArsHl9vtWOO7Sv+2MgBNkYSPbBhKkBjCMBngcua0o7ZHqKmkMgLRnyXVlp9d0HNMgaallYdMDWpWL
	QqXiMW3bjfvLAKn+uIfwImoKrShTYqQdpqr7bxCJnIU7Roq5waLUwqcflstQu4akt0x3sgAzeIWAB
	zOk2AAebnU6RwOBhMzHzCIa96pp7Da9L5NolTNjY4DR6GlXTC/OaV+Y2n5x8MpNBbtufNOf4OGFT6
	xuuSGTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gn-0000000GayM-3u1b;
	Mon, 17 Nov 2025 18:10:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gk-0000000Gavc-3WUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:10:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297dd95ffe4so41677035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403054; x=1764007854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec1PASGse1c+caWp4ium+eJ62vTRL+jpVdDXW6vSJlU=;
        b=Lx/KLRxWJVMPqKlMb8ZakbAXH1hv5fJhIFn7oMBxiWSy7hiDDM6RkLyYmkUhrV1eAn
         LcTF0kXvl896UzCGZy8J+ylF+ovgSCxdPEMYBTYWr6+CornonP0Dvu6ZHEb4HIFerDq+
         LGklvP5s/SienMOhPEZdqxd5+ixcjNgdKQiRWFGI14fcIM9R8BtZCjDTzRHK9sHl7C2j
         2i7apTyrYRiS3wmOSlvxOgJoJVYci34TH0iB3tiHc1rtvQop+mkW7/TFhhHVdeDWlxMb
         i/hkq5SZXhHjW2kRoDKhKbJvFDvd34Pjpj2rS/sjW8hjUmqh2IUDjaIfvKAnWgqvR/Ir
         /2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403054; x=1764007854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ec1PASGse1c+caWp4ium+eJ62vTRL+jpVdDXW6vSJlU=;
        b=Gc735ND21eOiKInwe+10kX2k233KX/9jQpVaxj7AP3ZGUs2dX4csXjoxMG9ZXrxxaa
         DUh/8sDF/HyuOj1c6h/5S/MRPfcqBqDt1hBISlxK0v2ytRUbUeSITDLEHMmzo1kvGfCz
         3yPJhlPySpv2k2j79Pu9lB6qf1p3j+XaZk3eWjlckKqRwKKCkg71LmP46DAQ4PK7k2LU
         cXyjwcy+ChwMHDiA9nmWvYZFt7/Gwb/gfdrr4RGrwJGJMUad8a8aBexHu/SDEeTRT38r
         d01HHEGfqXQ7M9vtdT+sQIsax+QXejqeLb/GSNQpUNmENw/G4k6vt3KAI1rdNAhDFHoy
         utFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTsbMqdX1cNsxGMJQOgxj5mwiWBzCg308dPODeETQxxb65XsoKK+/Udcom4mTd2BtNA7srElYUp/11ZhWTW+Hd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy83HqF89dy5dHoVO9x+aZCgiCM9zuhro5gPOUR0XLN+Rg1yNe8
	I6zhDChKdSqNBfRiPOhD6cj6A8tSqnylijVAl4KUnP7ihGLCDT/lDoB0
X-Gm-Gg: ASbGncvg/WUsO7oQhO7B/zmCRYxLBPHa2GKkzimoSNA8AV4mctlM0h22vUgICWhl7hd
	nSZwpSxGgRzfwtw8/oFGuj5JVGVTNZDWV+wPFE1idnOFeuuDaFGFPvvnwRmuwgdS6GC51xy+lqM
	Y9stc5qI7tYXH1/InbP5rZqnWrchowBtzRMEvQwdGFD8h+s4FXFlurJjE583LoeSAPYtgJIohKS
	uY05W7aXVeTzJ/mjyK2lv0x18SQkeucapKQcTAmGbhQRvybw2d5HqHtYrae5VJHgGsy/w8fZrv7
	GAx8ZAaPjA2iXHh1CYJvHwAPcqeRS4MeKs5aPKwjufiFe1CamVnxL94EAW5w134ocTxsZPenYxh
	+wpQG98vdxWUctFtl1w1nhAhZjyBVjgBHx94Dmvn6CXGUUFWmow+zIv85igrj6hicMZS9xMI6fO
	VrKHA6jyvT2bR4EOmiOsc=
X-Google-Smtp-Source: AGHT+IEUX7gdiNGyBxK7nkjr4GlpB56cu5CyrGhTV6Ssy/ycoKGnwri45m/PO64RRMTu5afoMBqkIg==
X-Received: by 2002:a17:902:f792:b0:299:e041:ecf6 with SMTP id d9443c01a7336-299e041f532mr74992515ad.40.1763403054096;
        Mon, 17 Nov 2025 10:10:54 -0800 (PST)
Received: from rockpi-5b ([45.112.0.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm147237955ad.32.2025.11.17.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:10:53 -0800 (PST)
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
Subject: [RFC v1 4/5] PCI: rockchip: Fix Link Control and Status Register 2 for target link speed
Date: Mon, 17 Nov 2025 23:40:12 +0530
Message-ID: <20251117181023.482138-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117181023.482138-1-linux.amoon@gmail.com>
References: <20251117181023.482138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_101054_900569_93EA5EB6 
X-CRM114-Status: GOOD (  15.05  )
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

As per 17.6.4.5.11 Link Control and Status Register 2 (PCIE_RC_CONFIG_LC2)
reside at offset 0xf0 within the Root Complex (RC) configuration space, not
at the offset of the PCI Express Capability List (0xc0). Following changes
corrects the register offset to use PCIE_RC_CONFIG_LC2 (0xf0) to configure
target like speed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++--
 drivers/pci/controller/pcie-rockchip.h      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index d77403bbb81d..b3c9b9cbeb8d 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -334,10 +334,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC2 + PCI_EXP_LNKCTL2);
 		status &= ~PCI_EXP_LNKCTL2_TLS;
 		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LC2 + PCI_EXP_LNKCTL2);
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 4ba07ff3a3cf..a83ce7787466 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -160,6 +160,7 @@
 #define PCIE_RC_CONFIG_DC		(PCIE_RC_CONFIG_BASE + 0xc8)
 #define PCIE_RC_CONFIG_LC		(PCIE_RC_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_SR		(PCIE_RC_CONFIG_BASE + 0xd4)
+#define PCIE_RC_CONFIG_LC2		(PCIE_RC_CONFIG_BASE + 0xf0)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
 #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
-- 
2.50.1


