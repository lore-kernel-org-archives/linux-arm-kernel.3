Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F63CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkLWxlipTbno6JmfDZI2+Pv9Jj+k0EY4YY+b4Wubtu4=; b=4ReTidcoEo+2LYe+jh+fOsjbZR
	Lr6IpN74C6IN/EqMbUqcPDERtiIrJ6JgXt484HSQfBTMHXJK69czUK+A57x3g0SAUtzhpccgNuPgr
	2+ar84ruX25vunVD3e5evGQpWa1ameaVTFXkWOnEAEEA8M9iHMjQtK3ZPjJVWX18opq0o3MUZHrP0
	MYLlmBAjbpfwgRycKrosnVzTWSb8OTn7xB9yQZjTTva4M48kvIcbn0xdXrF2PKC2HK1UJXtR44qQU
	Ma5XQc5YKH9sjQ7LRTu4oUjUgMHGn6T5uQxC96Kc1JEqY1szusikqgcha0iIJAqh1KheUMPvpjcJV
	pRXON7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtxs-00000000N4R-3k1X;
	Tue, 12 May 2026 20:44:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtxq-00000000N3t-2xGe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 20:44:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ba1e9d3687so39525045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778618665; x=1779223465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkLWxlipTbno6JmfDZI2+Pv9Jj+k0EY4YY+b4Wubtu4=;
        b=qEneRKjRq59JaJRxPsKj3xHKhmD1ifm/5jgoYpCvudX/RX/fsVfUolfU5lm/G7mWvt
         XeUXvf69ZFP79K/uQs1blbeOVRvDHZ8yCI2ZIg0FT8cOWYx2JmRPNj8MfeJ8wJVkc1aO
         4tFZ9/wiPoshumlZzWl6Zaj2jwz1udv3LO7Okrqg2ziqx0SLHvqq08mFLvqC5R4U3UGF
         7wh1hL4EqsLEhKNDPEcukdM8vIeAS2aMTFmn2Qz0bujWcxylPz9nKUmvEOa3V7zq6dE4
         TRvWXWMWYvYSTcDgiWqzdr03sikZSREUcO1bqG3GhE/f24HKcHtzPhyCm+n7n8J1FrnH
         DthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778618665; x=1779223465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkLWxlipTbno6JmfDZI2+Pv9Jj+k0EY4YY+b4Wubtu4=;
        b=ksvfl7VWXQwbO0dWtb0h3cPBRUAJ3/uk5zIMDZhjgNvUlPZyKVccV5zGF2M2QGYa/6
         U7/EVmJ7MULIj2vmymhL88IDT/M3zup30eAslv9hpMcaXP5Bbvz8ZGwfdR5ay6ugdbAj
         4mxKfBpovBg+HNR4Zvdv1s+zg31GaeZia5uj9NFvcYk1gkZ9R9OHNME1M4M6Z9TX5K2E
         P/KKpHxjK7V77hBMzr3VXXjMwd7ccY1U5/knKM/RyxAofGvtJjbscU5uMam5xrAZkj73
         pcgD7Ailo76pLV06mMp/VubjMBUaA0uHVUALlthYIn103GaBm9IF/KDCYU06rY1IRY+i
         qCVg==
X-Forwarded-Encrypted: i=1; AFNElJ8t9cV5PDjMoxJEvLu0tvsP/qElutM+eSudqHJoRNbMpxILMhUdJ9UXoPCjTTHMrm0wBkCDkwCbua2QZL015cvd@lists.infradead.org
X-Gm-Message-State: AOJu0YxGQ+CD6oz2LiKJeRqbXg9t/XnSK+rZrSYEEqe2wfbUDHbETifm
	b29uoOksmwyO162PbbvVRg3Nt6hfdgSFijWwecXkqfCryR21pXncrpvF
X-Gm-Gg: Acq92OGSQKuEgfqAk/6xHmIwaTFVPytDIOgZkbvX3Eo/bzauxxyl7OMt9Rdn6eAeZrV
	7szY9OrN7pSO64kwOJnDyb4tjv2Yy5wfpV1rTDFks/IpNZkn3VWWEUam6zPDJbFbZhn4OaO+01e
	BVJ1arCl241R4SWX/Ve2g2Txok6zPdXGCCKLvQA9ES3cPt+C3tyMRRa5JUpM0FeMPkaROoh1t0E
	m7eJUC0VmteYWs5tsXB2AnrScXC20CX2u7AxeNiH0psEkua3QgqfY6t8rnghR2jVZynb8m2PtwI
	9kELkmdr4bGhwwAH4QaFmJXAMaE3a0NzVVqtOWTaEE7bgDut0Tzld9Md4V+VbnBeoEow+cuTp4G
	7BmTxzTFCqw5q2JLdKgPRVDvlYMhM7n+322pcKHU/XlJ9S37v8K2nAw3G1HCQSBImPcjTO/JHFU
	naO14vMzAebkteWnuNh6nK++16Z1p4l3Qsod1gqMSSRzzGGzLXWCGS663KuoXe8MeiPvWwUwJR5
	SaMCBg8e0pXI3FPO7fbVvtMw5Qd0VuSd1bnBOinR+M64Q==
X-Received: by 2002:a17:902:f647:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2bd274ab163mr5480965ad.24.1778618665328;
        Tue, 12 May 2026 13:44:25 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27049sm145221315ad.7.2026.05.12.13.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:44:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR MVEBU (Marvell Armada 370 and Ar...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] PCI: mvebu: Use fixed-width interrupt masks
Date: Tue, 12 May 2026 13:44:07 -0700
Message-ID: <20260512204407.39753-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_134426_747543_4554F558 
X-CRM114-Status: GOOD (  10.32  )
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

Use u32-typed BIT and GENMASK helpers for PCIe interrupt register
masks.  This keeps inverted masks in the same width as the registers
and avoids truncation warnings on 64-bit compile-test builds.

Drop the unused sys_to_pcie() helper while touching the same area; it
references stale ARM pci_sys_data glue and has no callers.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pci/controller/pci-mvebu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index e568528bad85..da43661792e8 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -57,9 +57,9 @@
 #define PCIE_CONF_DATA_OFF	0x18fc
 #define PCIE_INT_CAUSE_OFF	0x1900
 #define PCIE_INT_UNMASK_OFF	0x1910
-#define  PCIE_INT_INTX(i)		BIT(24+i)
-#define  PCIE_INT_PM_PME		BIT(28)
-#define  PCIE_INT_ALL_MASK		GENMASK(31, 0)
+#define  PCIE_INT_INTX(i)		BIT_U32(24 + (i))
+#define  PCIE_INT_PM_PME		BIT_U32(28)
+#define  PCIE_INT_ALL_MASK		GENMASK_U32(31, 0)
 #define PCIE_CTRL_OFF		0x1a00
 #define  PCIE_CTRL_X1_MODE		0x0001
 #define  PCIE_CTRL_RC_MODE		BIT(1)
@@ -950,11 +950,6 @@ static int mvebu_pci_bridge_emul_init(struct mvebu_pcie_port *port)
 	return pci_bridge_emul_init(bridge, bridge_flags);
 }
 
-static inline struct mvebu_pcie *sys_to_pcie(struct pci_sys_data *sys)
-{
-	return sys->private_data;
-}
-
 static struct mvebu_pcie_port *mvebu_pcie_find_port(struct mvebu_pcie *pcie,
 						    struct pci_bus *bus,
 						    int devfn)
-- 
2.54.0


