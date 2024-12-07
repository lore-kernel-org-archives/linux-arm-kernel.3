Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2966BE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 07:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VBksAF/T3d2c5+s8Bg+ubv6vEd7NOr/os/9LSHT35Y=; b=nF4br4hofO1XW7ZmK2QWC0BnLi
	gw+8zQOR1V7DQCLgU+oQkbquhUCYFvkBT7Hlc6APCPh2kOShLuiA2NDQGfYO9vraWJ/iBXlhgkd/W
	sqnpKYwQTail1uLRIlkMr9JOhgKzeldBleDqGlFEmXJPL8yJOTyCfg2ZaFDWkmOJnfEiNbRlsIhQe
	nvQrc4EyL+P0Jxp9FZocWApab9Ab46NzzkMs9RCN6rBr0GxpRnn0Yc4DSDweuCQ62kFsg8Xz0Wxnt
	YiqQVM2UCuQOh8ik0Tis7BsNgA2wPuSsC8Q+FHuTHj8yCP1Q4jJXsRCVoUTllOyD2U6QDZWLv3hJc
	MXPglCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJorV-00000003X06-0FXY;
	Sat, 07 Dec 2024 07:04:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJoqT-00000003Wu1-0RiL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 07:03:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-215348d1977so23318145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 23:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733554996; x=1734159796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VBksAF/T3d2c5+s8Bg+ubv6vEd7NOr/os/9LSHT35Y=;
        b=JErlSDn6+3sMJBKK9m3VYoO//jwkhKYOG8kkzKJvhIeig36Loi0vEtKm3tAO3loefE
         +l7aQS9hW/AuLksi0fzw41A7WfPpR7ISqdMJU9jc6deLrDfn4G7/bFuhBFLX9BCoQle7
         7L3ZMYyX71MT70UfowWl1EEqHG/HrEb/FOZtjYOx2j9jPw5Z8QwUhjxYN9Jo/9Hwk1n+
         iW5WjNezWasNS1yokluFtvf/foKnwYW5xofRKECJB7Fu0YwsDMDenh+RO6TtTIXmTk/o
         PQKklc0DNenf6OEDUP8TbTnnP4thvluYDCARkPenmlwDPCiKGiezI681hVKpTXnM8KdJ
         fAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733554996; x=1734159796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VBksAF/T3d2c5+s8Bg+ubv6vEd7NOr/os/9LSHT35Y=;
        b=OC94qmDcVDrOIg9nbST2Almr8bv29PTtAPkZGKGkjUMbtBEBfJ5jiyWe1Umwewqj1t
         WvWtXc2plr0RYkDiLRmwq02tb/SEA2r7FBIYT9Zq8eTx/CGCJGeDQtbaW8MkhXys3CBv
         fS2JsXHvXT+m5lJNbmPoChd35cK07mWElvL20ylA6Iv8XapqXZIAndj9INBRPcN0EO4P
         PKhPQ56qcFmCzhFFmojxK+zh+NLKOfCJsqZCElYfl7HWXPTMoiDzmVSJC5vjQzEAs5ma
         /A+qPKZ7KSUZycGhhVvBKgV4eMgA4Ok51rsKQse9rPUfrJwCR7kZeXkN9Ss+7XEea8rQ
         6s5w==
X-Forwarded-Encrypted: i=1; AJvYcCUIUk+tFPQUI0+NP38YlXRv6EBFcAvPU/RkOaDXykKyhPwHbt15bRFED3pbUcobhwfP1f6rNFwAS4CChugdqiKM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy59XfQAjxkZQLjNhzPeS+yKz+o8g7GZ3ksdL3W0zzAXZaWveRY
	Ay7ld2mzatop6WkdBfxuYJnCjkHhfOzzJIQHCHx/v3epI8nD086r
X-Gm-Gg: ASbGnctvO81JILpGdA7zo2CwHtArb3Un6A6UApfwivs/vV69UZ+oLsKHejTltSeVTam
	U6nFfEhjbrKxgRnaC+3mGpHTPqaKHaAIdkMalJ8TGKtnGXTYog9TRLd1/pCUr4Ku/rJRfUOXJGy
	Xsy4KrO8plWphl6jfGJ4Gdiy4W9Fgz+idoZHZggOerbiGJNxd/tO16F0NvXB52QBch1EbPAces8
	RsdO8ulsG7AJu7KM3OnXOTvtJ2Nm/ZyVkWgHe1w9zPY2aPtuN2uYXF8C1TyrZE=
X-Google-Smtp-Source: AGHT+IGRLV9tlr/2SHhgZD19JnwDMG0W/wwF7xuVg/N9Skwvi9GkZLfzfL0GTpIhC8/5P3oAOgPTeg==
X-Received: by 2002:a17:902:f542:b0:215:a60d:bcc9 with SMTP id d9443c01a7336-21614d1ef83mr97323535ad.2.1733554996066;
        Fri, 06 Dec 2024 23:03:16 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-215f8efa2aesm38395105ad.142.2024.12.06.23.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 23:03:15 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1] net: stmmac: Move extern declarations from common.h to hwif.h
Date: Sat,  7 Dec 2024 15:02:48 +0800
Message-Id: <20241207070248.4049877-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_230317_340285_038E5046 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

These extern declarations are referenced in hwif.c only.
Move them to hwif.h just like the other extern declarations.

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 14 --------------
 drivers/net/ethernet/stmicro/stmmac/hwif.h   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1367fa5c9b8e..fbcf07d201cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -543,18 +543,8 @@ struct dma_features {
 #define STMMAC_VLAN_INSERT	0x2
 #define STMMAC_VLAN_REPLACE	0x3
 
-extern const struct stmmac_desc_ops enh_desc_ops;
-extern const struct stmmac_desc_ops ndesc_ops;
-
 struct mac_device_info;
 
-extern const struct stmmac_hwtimestamp stmmac_ptp;
-extern const struct stmmac_hwtimestamp dwmac1000_ptp;
-extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
-
-extern const struct ptp_clock_info stmmac_ptp_clock_ops;
-extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
-
 struct mac_link {
 	u32 caps;
 	u32 speed_mask;
@@ -641,8 +631,4 @@ void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable);
 
 void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr);
 
-extern const struct stmmac_mode_ops ring_mode_ops;
-extern const struct stmmac_mode_ops chain_mode_ops;
-extern const struct stmmac_desc_ops dwmac4_desc_ops;
-
 #endif /* __COMMON_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 64f8ed67dcc4..58a962e0b768 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -665,6 +665,20 @@ struct stmmac_regs_off {
 	u32 est_off;
 };
 
+extern const struct stmmac_desc_ops ndesc_ops;
+extern const struct stmmac_desc_ops enh_desc_ops;
+extern const struct stmmac_desc_ops dwmac4_desc_ops;
+
+extern const struct stmmac_hwtimestamp stmmac_ptp;
+extern const struct stmmac_hwtimestamp dwmac1000_ptp;
+
+extern const struct ptp_clock_info stmmac_ptp_clock_ops;
+extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
+
+extern const struct stmmac_mode_ops ring_mode_ops;
+extern const struct stmmac_mode_ops chain_mode_ops;
+extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
+
 extern const struct stmmac_ops dwmac100_ops;
 extern const struct stmmac_dma_ops dwmac100_dma_ops;
 extern const struct stmmac_ops dwmac1000_ops;
-- 
2.34.1


