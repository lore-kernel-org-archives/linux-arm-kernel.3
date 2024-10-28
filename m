Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BBFD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oyZ5oeJxWBOMpUrNuWphCAJQozS0spzFlvL2/Btoo5A=; b=NQaN9CpLiTFRi1OxuXReHFkCjJ
	3TuvJlP+mVY6sYjakeLC9FkplbOWkcFRP2l3Wy8McmXvj67M2ml8sSX8+ZIEmDI6AzgH7CQi//Ss7
	+HB7T3JqkBBGSZwNo9zn0OEM3GEpQrDnLE1KcSWxzG2RN5wdh+XZJO1FZ4YjSlVpA2F+wr4oLCIEt
	DQmLuNkharRBlzNraWIPk4cOAsE62qbfHuohKdO9rTF2JQhPrgXI4KYafbnYr1HnxDJmPLorUinYO
	kejOdfFMvLkFWi/0dWrcc8aCY9dtye77tdkxeRDjrIaeAIK7mYYomANfWTYc0sqHxJjudlxgKzWq5
	Yy1RG57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GOT-00000009R7i-1YRY;
	Mon, 28 Oct 2024 03:26:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5G6e-00000009PB4-2VoD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:07:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cceb8d8b4so20941845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 20:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730084867; x=1730689667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyZ5oeJxWBOMpUrNuWphCAJQozS0spzFlvL2/Btoo5A=;
        b=faM89VDJp2/ylK3NklTjfBKylCwYTYeYoVJM5N5XuZ4XbvoQtFHku5nHxMnL2qWdLR
         aO00TcL2gkAnzCcmYNc4lsNILjwZBgAe/c+fqhxRMxmc9TTrm2HngXx8w8NK9MuiC6e+
         CQHdqmWvJh981FL129eD36Vgvtqpx0xxzicfkYGZ1PIIAGzxvOLeeUvjiU7FYk1kFajB
         1leI6QP5Fv4XPdJTFk9Q1uidLVOLGU5DxNISKVps1YkRtRvdO/IIsxtUM0JEAindklQc
         r7yK+KdA5QLYXLGdkI+LoknDHPdJ97xf5q6fJOfZUcSU1uiOn7GYLrtJRncRVnQMfheL
         Sr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730084867; x=1730689667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyZ5oeJxWBOMpUrNuWphCAJQozS0spzFlvL2/Btoo5A=;
        b=TSveylKKsFYwZ+EVpQ9wIrK/yf+cVMds4HKITL6EGoVowuWbexrfz9Qm31xIZNU7qu
         Rs9n+EheFKsR2bY2FnbpDb+HAsJqAzobzfAqQ8yhLgQNIe37fEAGfYuk6TgXQ8NOKrcG
         aHLv2mg4N+uFsk8nBaDuWC/A4VKggYDFySeTlBZthTQWxO+AlVvlNAGaPZ27QpkdYzSa
         dT515eNe44dk7/Bee520KR6wqw0QcASYqSmsV+IzDwDr9M3nE72s7cu3Ny0Bsr3gHi8I
         HmjW4gHPxOgZfGcZCjYU3RVLeeI7HiQ6qbpYFzADbBV1b7wdGGy+TQPCChcLXW7J5N21
         K9xw==
X-Forwarded-Encrypted: i=1; AJvYcCVyOA43jVrhDiwRIG5JFgbpB0qiCSiP6PgPzJ0q7rqFVxfKpAzWuyNmBM7NF8Xq9S3Pose+QITGTWBiHvYfcd9d@lists.infradead.org
X-Gm-Message-State: AOJu0YxaWWMRTUKAM2rREs6Avd0i6v30g312YORCemGvPl9NUapZz4zz
	MxYhKuYGjjl7TNsBNId5roEubOmLzPLgFvWU3mhZS0sm+RQd+UGi
X-Google-Smtp-Source: AGHT+IGjTJH6FP5Q/Rq9jlV590Kh1CRuN6iXAYc28hlY0HjvVjt90JpayXD0vSxAoJRyO87DxJokiA==
X-Received: by 2002:a17:902:f64a:b0:20b:a73b:3f5 with SMTP id d9443c01a7336-210c59c6d8cmr111903495ad.14.1730084866834;
        Sun, 27 Oct 2024 20:07:46 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:07:46 -0700 (PDT)
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
Subject: [PATCH net-next v5 0/6] net: stmmac: Refactor FPE as a separate module
Date: Mon, 28 Oct 2024 11:07:23 +0800
Message-Id: <cover.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_200748_666567_53CF5CB0 
X-CRM114-Status: GOOD (  14.84  )
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


