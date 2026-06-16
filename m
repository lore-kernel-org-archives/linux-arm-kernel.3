Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2676ACD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7vROs9UN075gs/8U/5ZvrOcUcap23dqy0WHrqzNyCg=; b=BgtQC1tFzuenPC7UlYB2Q2iWWN
	tmB7huePxZ47Y4dZswITCNyFdlQyFVlSOFuyHbhMU2rXacUUkketHhdtM0E49EHsbHV3ylaPgleLf
	MzwciOfgMJrAwQ3m2+XBk4xb9n26LhI8LZH8cMUhec9hFDXEaXTRC81OZcpBgb5hMIXDQYoEhI/yA
	QP9rB5Yt7GLXbEeVx9wHibcTCIATqZuzE9Ms979ASCC2huRcevnYdjmjYsfj8nzpnMBx0uzNv4cur
	MM52VlrKCsF7eZrWA8g/lHDljaSwGNB8EoiBCHDWqPToiExlTPICZVAYpoauJv6X7aHU/qW89wWFd
	VdJRee6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVgD-0000000G0p4-3FuE;
	Tue, 16 Jun 2026 15:26:21 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVgB-0000000G0o6-3BJr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:26:21 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-304f590dd91so5378106eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623579; x=1782228379; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7vROs9UN075gs/8U/5ZvrOcUcap23dqy0WHrqzNyCg=;
        b=G/FvVFI4FoDB+up8dIg8PkKqoimsQbO2Rhf+5obYgviAZemS8S1FqeYNDuEpicAE2/
         w+YWgGLUxN65N+oS80OZmeOtNV3xyI4ujpOnOTNGqR04puVqCe98XkHZkb0Dr0fRKq9B
         k352ORcH7ppK99Bao8WnZaOr9rLPhGAisXO4m4c7EBw5AjJghcJtVhqY5XaYih2Xcy04
         TVA0DiNEimnzLXdBIY2Wz4BcYK+WHXRoAo/UZgI7gXbJ7HYdMxvCeJKVOL2e/Kc/7qid
         68UQO7Rm7lGFbLbyTMqgYDJ3nUSJQSFz2O8esSz8mUlU9/67KLs1ymQBLmOzeTTT90SZ
         PZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623579; x=1782228379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7vROs9UN075gs/8U/5ZvrOcUcap23dqy0WHrqzNyCg=;
        b=PkDSCIBAe43buxET4+3/Nr1dAPZzanvXX1C15bB+rYzH7LLIUgtLOE40AhK/8azJBt
         ENuCILQ7i6+mWVENDxQYNdl7sRC47PRWINVtD/5+FyrOIr4SF9ZK2jZlmsZSWVX0MMa8
         lVZWrho4TuQ2qS1QQozhk9u6keXr+Syozl8E6g0/3TjfZRSpahT+9IYqiIKsdlxIZtKJ
         gSJEMwhcgJgIUyPQlT/Lkn2pm3srEIgzeQXnQqtX5NJVW/WFM37ou7YljUPM7kPN27aw
         mjgLhHRQaYUOeRFmIqfzjubNus6pmsPIDrVhRw6KwQYkFKBSc7rYQkZbwBR/V9KVp0eU
         XxPw==
X-Forwarded-Encrypted: i=1; AFNElJ+wYanII3+D3gcqZP3lytLf8WS5fenM2p8M9i6eNzdr4HRxUJJ/p7+6QaDGcFh5G73R83Ag+0p4IoW8+MRZ+kbo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnjk8tivLEqorrhQa9Li8jGmMXgJyA31a+s0CX6ku0KsOzP57Z
	2yg5V88/1mwdD7lPR561x3DGWOTcLaDC9WC/zNRIswkqhg5TBjcWXXzt
X-Gm-Gg: Acq92OEcHdi7SGRBigLvi4Wpx8J7BN6Tn/G9VqphIK7XTTSpD+4n6Sxln/Eu/lFdAoR
	CoLS9XsjxMfHFamDjy8OwVg6zaE8RuSJG+kT9i5LWehKxJ+2uZI/aDbDzYekiZGI6uUgbhS+MV9
	katHDdgNc4JtPmWEkXIZImuhsv2kc8dv3jtvXEs7rCQMVOpaUZAFmMdNLCjqNqN20t0OvG449bW
	1zglhrvJjqBKBWcTeqxiwgqEE/uiVW30zI29NmVPQBK3oOR0KTEzbeWPs6jDbZduMotqfVePAD4
	hT8hkFjaFPAuSp5QY7GQbtFCdRHdjRJuhb4B9CxykHgasEkGAufUUjSH4PJEcnIExUiHPoOM7LQ
	UaJG5EEFIUUhJf7yIXKZTKUrJWhrY929V68uMLHkFSnZSFf6VjLeeb4ioGHnUydFreNf7PIovgg
	srSZig3/FxFuvdIOuY302HeAAf0v+xiVo=
X-Received: by 2002:a05:7300:7b95:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-30ba5f7020emr2626182eec.26.1781623576725;
        Tue, 16 Jun 2026 08:26:16 -0700 (PDT)
Received: from geday ([189.115.92.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0357sm18116553eec.11.2026.06.16.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:26:16 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:26:10 -0300
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
Subject: [PATCH v7 3/3] PCI: rockchip: drive at 2.5 GT/s, error other speeds
Message-ID: <7421df7a7b7778ee99363cccfdfabbfa8aa6ab5e.1781622998.git.geraldogabriel@gmail.com>
References: <cover.1781622998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781622998.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_082619_801120_257EB3AA 
X-CRM114-Status: GOOD (  15.33  )
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

Configure the core to be driven at 2.5 GT/s Link Speed and ignore
any other speed with a warning. Also drop the 5.0 GT/s Link Speed
defines from Rockchip PCIe header.

The reason is that Shawn Lin from Rockchip has reiterated that there
may be danger of "catastrophic failure" in using their PCIe with
5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper errata,
and the particulars are thus unknown, this may cause data loss or
worse.

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
 drivers/pci/controller/pcie-rockchip.c | 14 ++++++--------
 drivers/pci/controller/pcie-rockchip.h |  3 ---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index 0f88da3788054..456dcfd676ed7 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -66,8 +66,10 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 	}
 
 	rockchip->link_gen = of_pci_get_max_link_speed(node);
-	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
-		rockchip->link_gen = 2;
+	if (rockchip->link_gen < 0 || rockchip->link_gen >= 2) {
+		rockchip->link_gen = 1;
+		dev_warn(dev, "invalid max-link-speed, limited to 2.5 GT/s\n");
+	}
 
 	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
 		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
@@ -147,12 +149,8 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
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
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 3e82a69b9c006..b5da15601b585 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -42,7 +42,6 @@
 #define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
 #define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
 #define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
-#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)
 #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
 #define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
 #define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
@@ -197,8 +196,6 @@
 	(((x) & PCIE_CORE_PL_CONF_LS_MASK) == PCIE_CORE_PL_CONF_LS_READY)
 #define PCIE_LINK_UP(x) \
 	(((x) & PCIE_CLIENT_LINK_STATUS_MASK) == PCIE_CLIENT_LINK_STATUS_UP)
-#define PCIE_LINK_IS_GEN2(x) \
-	(((x) & PCIE_CORE_PL_CONF_SPEED_MASK) == PCIE_CORE_PL_CONF_SPEED_5G)
 
 #define RC_REGION_0_ADDR_TRANS_H		0x00000000
 #define RC_REGION_0_ADDR_TRANS_L		0x00000000
-- 
2.54.0


