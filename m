Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558C4D7496D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5JB/cGgUoF+EaDvRZAGIK3OwHiKrJHGT5IlWD3Oxlrk=; b=kHAWXsP6f6jthgfeEO1hosDN2T
	CF851bOloeq+K7kE3tOnROcBLSuVcFF3aZvgEvVDCLMAhEJ0Zs5HbacPqdG0e3f9UcfXFRQzFZnQt
	YI9o6qFytwWcqSzI0m6gD4xSYHSezn1IwlLU7iLhSQiRpsLLE/FDV7GrKudPupflWgkN371bIFDav
	61ujox+4WDQcfSB30DfdDLPRVOBE+CBepwtEiJyVy5UFCeRtNNgtn6D2lwTbC+1mIoofHvQZFK+Pc
	E0A3oLKgI4FVjwiWmibVHIz1Gf+aKaSFK36D1oiAIJZE3AxhQH73K5CdEFHEeaataSQzizS+dMJXn
	+4/LcoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t61Pg-0000000Gn8y-08T6;
	Wed, 30 Oct 2024 05:38:36 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t61Nm-0000000GmaZ-0AjE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 05:36:40 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3e602a73ba1so3547224b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 22:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730266597; x=1730871397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5JB/cGgUoF+EaDvRZAGIK3OwHiKrJHGT5IlWD3Oxlrk=;
        b=VCa+hFlmn+Mo7uWgN6+tNVKcyFOJKPVvvTP/ANARrOKXo7Mt2fEVGb+ffxGvm1EJxX
         +M2zCsVSC5Bl+hoQ9iB/KP4GhJjR6OwOUzBUI38+cp5BM9MnaB+WfTvN2CYqz4PF2DHB
         7GPYZ0hdVDfFHyEPfdk1WOkyOInvKp3eveWQUZlWhxm9qKG3qxB9SHx+B5yUK8D1Tykk
         7KnV3SqJ45LS2U9RkZNuZkO6dX+RSfOm2UUlJ9pc3svZU1GuXHhKFhZtzs3I9WDDfjzV
         ZmuFb6dsIhB2eTAh7qRm+LMREolFKWu2iLuslECJAtfQhFKFyhaRQcONtauRivSDzr0a
         uvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730266597; x=1730871397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JB/cGgUoF+EaDvRZAGIK3OwHiKrJHGT5IlWD3Oxlrk=;
        b=sBylo0FufgeAsCH+FmZe33EVm/DMt7Od2hmMEpV1hJHPsmoanN/z1YhoT9unvKu2oU
         cMq1rH+EKX76Vo1Suo3PN1Fc6RC/D0w1m90DdbPbPz8Qh0Ly2DmMuuXSJetXxwka/tcx
         XeVayARW9Xp9qsbxMsfUl5uSD0swhh/WHWotHPdZfnkxUaMjkfFfOjfiMXUSTUBPyPCm
         KxdUewOKAoxjXrBfXu+mohvZ7eli3+AMakLlQkq4kfTwRs0AoItqZ3aTfaQa9kcwngDp
         olO7scdy7Ak5qV+jiVXX99ofC0fnlHOkVBENR92LbdiDVARDKT6H0MVIOgJfJz7+I+Y/
         VA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyAuxu+l7k8M526Zr3Eq7qASU4WzFLKUjyAAkCFjkqkz2ZA6CNZWtPvERle+pWQZ9M82X512htzZv3YRHyR8Id@lists.infradead.org
X-Gm-Message-State: AOJu0YwiViN/PIr3TrPFPMVdviAOlwVq27FVsT26EAq/jTCXEgGvEtVM
	0BYUwmMVxcK3nxNbzDGSQ5tRZgsedPuABPp5UmpXc7Eeji09tbm0
X-Google-Smtp-Source: AGHT+IH4FirAelcYwz6Otzk0LxXXB4G8PXfXbrPJ8o3q22jWDCJ8ZAFjpdGAFz8nJtPeZGloDI4FmA==
X-Received: by 2002:a05:6808:1918:b0:3e6:ad7:9a38 with SMTP id 5614622812f47-3e63844158emr12362178b6e.24.1730266596775;
        Tue, 29 Oct 2024 22:36:36 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 22:36:36 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v6 0/6] net: stmmac: Refactor FPE as a separate module
Date: Wed, 30 Oct 2024 13:36:09 +0800
Message-Id: <cover.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_223638_119651_0AFC1071 
X-CRM114-Status: GOOD (  15.67  )
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

Refactor FPE implementation by moving common code for DWMAC4 and
DWXGMAC into a separate FPE module.

FPE implementation for DWMAC4 and DWXGMAC differs only for:
1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
3) Bit offset of Frame Preemption Interrupt Enable

Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a

Changes in v6:
  1. Introduce stmmac_fpe_supported() to improve compatibility
  2. Remove redundant fpesel check
  3. Remove redundant parameters of stmmac_fpe_configure()

  V5:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=903628&state=%2A&archive=both

Changes in v5:
  1. Fix build errors reported by kernel test robot:
  https://lore.kernel.org/oe-kbuild-all/202410260025.sME33DwY-lkp@intel.com/

Changes in v4:
  1. Update FPE IRQ handling
  2. Check fpesel bit and stmmac_fpe_reg pointer to guarantee that driver
  does not crash on a certain platform that FPE is to be implemented

Changes in v3:
  1. Drop stmmac_fpe_ops and refactor FPE functions to generic version to
  avoid function pointers
  2. Drop the _SHIFT macro definitions

Changes in v2:
  1. Split patches to easily review
  2. Use struct as function param to keep param list short
  3. Typo fixes in commit message and title

Furong Xu (6):
  net: stmmac: Introduce separate files for FPE implementation
  net: stmmac: Rework macro definitions for gmac4 and xgmac
  net: stmmac: Refactor FPE functions to generic version
  net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
  net: stmmac: xgmac: Complete FPE support
  net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |   1 -
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 150 -------
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  26 --
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   6 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  31 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  11 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   8 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 405 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  45 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 165 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 480 insertions(+), 412 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1


