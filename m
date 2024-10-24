Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402E1D0BB70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C1oNnTivFwASMm3bbLUePa/ONTbP9bazkJEQG70mDoE=; b=d3IgK/tuz32uLL/flcaVwK6KoY
	sC8fAZctBiOqIe6RREwCd/8DiiSo/nyRjUf82vCEcUytH3jUS0srcG/szAE4nndSvORX9AgLMkMnw
	4/u73kYE0hJIEIy9J0ZNT2wJlm6rQk1Ex90+zR3xuDXkqcg41+OTjNMuPGTahEkrfFFEmRvluFUSj
	AFmsJUEODy7U2tWmQWkMKmUQtUjEobqbvjNybJemxfBszmx/whYy3D+H9mokkzEEAZrSdicnr4co9
	WQhRnRC47qYrFdI0o4aJLW5/3ij0yQPFgCeC8IC3gBK/Fb+auRqapJ3LCBookXKZlbBNsrvVZsfPJ
	C6b3WB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tLN-0000000HJy8-2SXT;
	Thu, 24 Oct 2024 08:37:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tFt-0000000HIOJ-3uxF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:31:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20e6981ca77so6207485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729758700; x=1730363500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1oNnTivFwASMm3bbLUePa/ONTbP9bazkJEQG70mDoE=;
        b=KywvP6ozFJbAUdV3f9/l7PNQYOopDRKC9iFRbnACNfxzuXR9/JHQ6l0/CH2moPy/f8
         VMzo+1lDUu4jS6Ue9CwQb1TtdsW3CTV5xt71HeBm0//QDNwuVuqBIorVYJjjwKCt9OtN
         V8846W6qxK8ZAND/hn9N9d3vTLy8E7/yutJEON4GUsiDJ4Bwi7iq+F7rIDDqOcY7rMum
         3ojMMnnGicaXtbfl3AnTx19yef4sbjzbLw5NW9guJPH8cm5WT7iQiQ8zFwc2ziYcPYWV
         SGOzNNAy/vxclhIt23gBipjPOp43E2QjMIKHWSfYX8Fc0Q2Wk/jFY4tNjDsl7hpPVLt6
         arnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729758700; x=1730363500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1oNnTivFwASMm3bbLUePa/ONTbP9bazkJEQG70mDoE=;
        b=I0s/6iW6z2dhDWW7eWs9pnakv45Tx6ZHtHEzp5G4Mfgn4whsAtj92oVKGAmn+Qrlt3
         t6P6XWiMjaKXtvD7cqu3PF2RqXpOKdC0x6pbMqMYWuTnOk4IjK2BE6U4BmtW/GYc7xMO
         OBtayLkl4VponHUcvIhXon5wtq2lrjeKfOPL00jpZPGh5geFPpKEsoABZEi37Su891C9
         aycZiV15MnEQpLsn6QK3lyT3xh6NBjzQcdInh11euWnStE0zRglbV/+m6j5DPxNvYS5t
         r9Hd678Nv0gGDsH5T0n2D/AN8FqXEwvod8COo2vn9CLIkepv3VcL3v1wRhBkmH09i+Lw
         zBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLYbd3VKYtdT8A1/RmTdTPyO72hundPNojxbpR6Mu6QHpf/Wbp93Q/SVtgWwlUN4gH+WSyvHCKcRYO6mBSD2/o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+FKirdOtQPpRoIGq0plnEsveJpa3wh8F0F9rtmBz+JbfM7xaz
	AqC899gMeqTjwkt0de5sTCTNQNSTNBq9SIM3WiTPfWbO1kofNRVs
X-Google-Smtp-Source: AGHT+IE8sGDrZzabWRqjNx6ZIY3uaHY+X1npznrkLs6Jcu4tChUNH1+QbobLtPQARhooG89cxI/kWg==
X-Received: by 2002:a17:902:ccc9:b0:205:68a4:b2d8 with SMTP id d9443c01a7336-20fa9deb634mr66670025ad.11.1729758699949;
        Thu, 24 Oct 2024 01:31:39 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e77e5a4ec4sm868773a91.54.2024.10.24.01.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:31:39 -0700 (PDT)
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
Subject: [PATCH net-next v4 0/6] net: stmmac: Refactor FPE as a separate module
Date: Thu, 24 Oct 2024 16:31:15 +0800
Message-Id: <cover.1729757625.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013142_089916_8AD68545 
X-CRM114-Status: GOOD (  14.23  )
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
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 412 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  44 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 157 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 481 insertions(+), 407 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1


