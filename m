Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FDEE6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6BgmcTk7XmHujA/4u0if1oSw4JEAcJOllZBBdLUDRLQ=; b=sgYXSdbzpG6zhTflbWXsmohIFR
	M2aOd2htyeLmrWxqmxAzZK4ZS0CTKcEvbCPjO7edKgvZF6qlYDWL3r2q7rNG2rznFdOJqlIH7M31C
	r0jkV8OWHWpkzlJRhp5ErjB5LFCi0QhvWRbO7UtcugEQ04pOV+gmf7Zu539NwJlyKDPc2SYTQi0aA
	Tmu8eSi27eYxA0v8mZ/1VF9W8UfUyCI8GVHZ+czZXL4PV78ki4IyzXyy7WBmNE/wOAg5oKonRDKXN
	NOi/nkNeCag1JShhZR2tKOZgtH8Pz2qTcIU4H9NeVYUge9v0bmVRg956Hc1NWFSX0rTLAfmgv36oN
	JIHErmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rnk-00000007C34-0cHV;
	Fri, 01 Nov 2024 13:34:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rko-00000007BKD-1Cpt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:31:56 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso1458329a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467912; x=1731072712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BgmcTk7XmHujA/4u0if1oSw4JEAcJOllZBBdLUDRLQ=;
        b=kiz0WqB5Rlr0YCBIq7FoMZ6HOMlEebi9udgvCmqkHaZRJOBNsPNUOvBLRgqAv8Ps40
         EVuCi2v6c4uOvqJOtWKKemIWdPIH/3lqhwC0XpDPpVZHBmQlBBAYyWkZO+uzOmr/5d+4
         jTmAMnfawazjnvYyzui6K2Jz3B0zUOE9piSE9t6Q1A6AdCRTAKTJk0L2r/frYuwRY+Xh
         X5Iqyy7H12c/g4No9kRz/rq9tvumuVN1YbXjo88GvrmRLFzATLD8QcZlpArhejgWxolp
         qYxum2KDyd0nAkVJCYPHrJFRVg7XBYUBdPzkoZ6YVKkgPNPT7YlLZxvCQkikTI7tzZvm
         JH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467912; x=1731072712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BgmcTk7XmHujA/4u0if1oSw4JEAcJOllZBBdLUDRLQ=;
        b=g5WKdJc8dD4MsP3byIg8Fj3Ntys1sH9JAHtUMSJeDKoM0X1Hbaq9vc4nyor7KE1rWA
         5MBP1EYa9ATbyImDVuk7JnOz47zEHfuhMVMb2II3IIf7mny+ZOiBTM/CLnJpyyw9hL14
         7qk3XbL0UcMNAVyy7wUinku+1pKx2OymdxPPmEgG3BewOstBBjm518S8hpeuTv7VebLc
         0a7iNQEZCDSEtZ8h+BoeD25U6aRaZC8/O3QHNLE8UK2A+cVttWDHrXFA8lk+FaNGiiZ9
         acXkOUcaqeSudGDVoPmFxVGnxe8Aa5qmJg45oyb4y/mjw38u4L4lHVgyGRMxOO9EFUWF
         neOw==
X-Forwarded-Encrypted: i=1; AJvYcCUbaMBLtcdPUfGUVa/Pzsu64fmHtojKpHY9phvTN5woIh/4jP9oGxIMX6TEeIeqiVCSo1SHUAPc4P+KpUFJDUpJ@lists.infradead.org
X-Gm-Message-State: AOJu0YydazJlCWE7G9JWctzG1UTsWYTZeESe5MwIj1v9G/5lYSrjq/Za
	V5AQMqim7mvo5HbWmrAGp0nFVd+tryUdeLavtGW0SAjlpemTjA57
X-Google-Smtp-Source: AGHT+IHAE55EK0dfqKcLPAtM/F6+ejlhfkIjKBOG/4/JPVFxXfsjxql6Db9+CeYkz1C9x1U4n7tJZQ==
X-Received: by 2002:a17:90b:3844:b0:2e2:a8e0:85e9 with SMTP id 98e67ed59e1d1-2e94c2e43bamr4641436a91.18.1730467912286;
        Fri, 01 Nov 2024 06:31:52 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:31:51 -0700 (PDT)
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
Subject: [PATCH net-next v8 0/8] net: stmmac: Refactor FPE as a separate module
Date: Fri,  1 Nov 2024 21:31:27 +0800
Message-Id: <cover.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_063154_349855_18424A7F 
X-CRM114-Status: GOOD (  16.93  )
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

Changes in v8:
  1. Reorder functions in their natural calling order
  2. Unexport stmmac_fpe_configure() and make it static
  3. Swap 3rd patch and 4th patch in V7

  V7:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=905021&state=%2A&archive=both

Changes in v7:
  1. Split stmmac_fpe_supported() changes into a separate patch
  2. Unexport stmmac_fpe_send_mpacket() and make it static
  3. Convert to netdev_get_num_tc()
  4. Commit message update for the 3rd patch

  V6:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=904502&state=%2A&archive=both

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

Furong Xu (8):
  net: stmmac: Introduce separate files for FPE implementation
  net: stmmac: Rework macro definitions for gmac4 and xgmac
  net: stmmac: Introduce stmmac_fpe_supported()
  net: stmmac: Refactor FPE functions to generic version
  net: stmmac: Get the TC number of net_device by netdev_get_num_tc()
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
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 413 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  33 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 165 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 476 insertions(+), 412 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1


