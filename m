Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5776DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 21:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIU73QOdUXqw8XH54gnOsyWC2NrvdvHxRkWX7Bf2XKY=; b=0g7YKQzTb8MLJywBYbQelNRtfO
	gJsm0AqBQdO8E321UyQQH2T/Jq6G/tVnlenulLyiTs2F7lvi7TWuSEZQgEpbtpxXl9AXJHcBzH2xl
	NZAym3D2Wn4E73LsNLmB7HWpLZnDc7ibRyNLDYwvA6ahUSFCmwkjVippv7I3V9F/+cnswxwrrOD0x
	TEWEilUobDBZ83p9v0OiEDusP59XWj32cmBQCTf9sovVk0SMU1swG+t5gQ3vLx8YzBbJb+TbB/Dk0
	R20qSAjww6vM7P0xesCYf4HGkbfgPlpRGYxfekS9/qtHK6Zs6UDxRnpfqO3BT12y5swUYhhR/WbzE
	s7H00jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QTv-0000000BHEz-1No4;
	Thu, 02 Oct 2025 21:04:55 +0000
Received: from mail-il1-x164.google.com ([2607:f8b0:4864:20::164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QTt-0000000BHDZ-2kfe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 21:04:54 +0000
Received: by mail-il1-x164.google.com with SMTP id e9e14a558f8ab-42480cb42e9so7741595ab.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759439092; x=1760043892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIU73QOdUXqw8XH54gnOsyWC2NrvdvHxRkWX7Bf2XKY=;
        b=tE9ursGSkL0nF+nOlN2sQItlirQp/Z6QVOkvZuXAHp01aqi+wnjUN2/Wt/M3+mqWic
         gxy9uK1Ngh2GTtA0KP3U4VCkCjeBJWm9ybgYTCcjuPQfJIou0puCWCUzGF5C2/RSBN8B
         HdoFvbD7gfe+8cV6VSdKaNpx0abkndwgtY0MoaTrBZtfWMLci26dcRAX83TTqkTdZUoe
         zDhVZWvToxkOzSpYvPk9VlZKx7mFEbqANaOpKeAm4BT68aA/MtZaBwW+qWtd1qwUQlXz
         a+mBNYU2XLIYWSwEh4hv35IHRQ6ZK0c2J8FTSl18rRz3EgKg6Hroo8rn59McHbBbTZiX
         J5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqBXFLUb8vGqVIO/f21e87fck/ubDsifDGkO1irMmbm2zEq61Hq92d+WqgzarqfajvsZ1x0uX037R2rlWIwjct@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5b8ilzWcn+IYNOwLNVQAURAzU9spPMrKq7yCLriGfSIH/Y9h0
	xergXUv009uiOcJtPPaH0GvGchDI6MOFRL65dXUbz306R3vZw5RMKI9dnJefAqJYU5iC0lM7zJR
	unu7RdAfgbl/239oTUt4m5lwdgOHY35ln10atpJbHyLyVXO/rZ7nRmiXKXgRhj1iQc5WD6O7K/Q
	JETr4btPfppdYI6shFe1iq9i+MgCsOlygny287U43ChNfP452ygSJ3fyZTSubwCYY8nKeyZDyYo
	pVvept5qBKNYgmIgOeMHA7lGEY=
X-Gm-Gg: ASbGncsoNAItut3H8TN45MqZQM5RvjQTggKrLXG/BUwH0PSoNQFFmtlkHcbSZCWSH9t
	2/1U8BE5FEXUB0+B12MAjSVWF+q2qG2NsCwJn+FLlRyViv8gZu0kKiUsrcuqhDILbxzXZ19Es4m
	bXWzRLy11lcQKvurf/RmKsh9pne8zk79lr31fwu9ULf26up/l+fM98ObIJRgt3UjQA6QIHrUCQj
	Pd2J+Mjz7hoj8m0yU/9EwVmx+rAGMGs9s3HqmaeI+7NPnA4hTh2kXk1ryH0xUtdy4FS0y9wRzwt
	DSUDbEtslq1QpfOeig8UXixTW8ViUL0xin1dCPpI+NPpEruhjsTODROxol22Qp5gO9nhAWn8pVS
	tl0fhwzy0k06lbgqRtnYPd6ACiDjv4ig9fRPDtQFTqqxiy5wBp0JnOKxhVxyTqIMblReRJIrgMF
	I=
X-Google-Smtp-Source: AGHT+IEcJLPZB/mXZcIFKUDs0Vo8EbsdbhbytRcGYoNFrRwiaKAWNhRgMm7OCUs6J9Z/EABU2Q9CaZWMiFfH
X-Received: by 2002:a05:6e02:168f:b0:42d:86fb:d871 with SMTP id e9e14a558f8ab-42e7ad961f1mr9745305ab.21.1759439092222;
        Thu, 02 Oct 2025 14:04:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-57b5eaadf21sm214795173.3.2025.10.02.14.04.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 14:04:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ee888281c3so1165192f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759439090; x=1760043890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIU73QOdUXqw8XH54gnOsyWC2NrvdvHxRkWX7Bf2XKY=;
        b=DPGrzgKx2LhW0Jbur1C9pc4qTGVgdSwIERdVuvz95YHTpXuuJGyKLJzTiuoHvtsT5B
         sggfbb7F+EfWaDqRSpmdTneMZBoj5OVPjRafaVFSocx0nDwpj1PmS8rr3w2SqgavTsUV
         RbTrpSgRdoui/PHVW72Npx8tMPjSGeKYEfECc=
X-Forwarded-Encrypted: i=1; AJvYcCXGfTdF8bh1SAIV+V3xgFtgyDvNGb3Zpo42GYC+2YIB7hRdXNJgDi/R9Z1ODcTz+pZpsb1SW9CSgx4YI/2vcBAc@lists.infradead.org
X-Received: by 2002:a05:600c:348a:b0:46e:1f92:49aa with SMTP id 5b1f17b1804b1-46e7110ef47mr4505045e9.15.1759439090551;
        Thu, 02 Oct 2025 14:04:50 -0700 (PDT)
X-Received: by 2002:a05:600c:348a:b0:46e:1f92:49aa with SMTP id 5b1f17b1804b1-46e7110ef47mr4504845e9.15.1759439090152;
        Thu, 02 Oct 2025 14:04:50 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c4c0321sm61711295e9.8.2025.10.02.14.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:04:49 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 2/3] mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200
Date: Thu,  2 Oct 2025 17:04:25 -0400
Message-Id: <20251002210426.2490368-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
References: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_140453_715554_1B658538 
X-CRM114-Status: GOOD (  15.42  )
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

Clear SDIO_1_CFG_OP_DLY register when using HS200 mode to be
compliant with timing spec.  We only need this for on BCM72116
SoCs.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 37 ++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index efc2f3bdc631..0905b316a24b 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -31,13 +31,13 @@
 
 #define SDHCI_ARASAN_CQE_BASE_ADDR		0x200
 
-#define SDIO_CFG_CQ_CAPABILITY			0x4c
-#define SDIO_CFG_CQ_CAPABILITY_FMUL		GENMASK(13, 12)
-
 #define SDIO_CFG_CTRL				0x0
 #define SDIO_CFG_CTRL_SDCD_N_TEST_EN		BIT(31)
 #define SDIO_CFG_CTRL_SDCD_N_TEST_LEV		BIT(30)
-
+#define SDIO_CFG_OP_DLY				0x34
+#define SDIO_CFG_OP_DLY_DEFAULT			0x80000003
+#define SDIO_CFG_CQ_CAPABILITY			0x4c
+#define SDIO_CFG_CQ_CAPABILITY_FMUL		GENMASK(13, 12)
 #define SDIO_CFG_MAX_50MHZ_MODE			0x1ac
 #define SDIO_CFG_MAX_50MHZ_MODE_STRAP_OVERRIDE	BIT(31)
 #define SDIO_CFG_MAX_50MHZ_MODE_ENABLE		BIT(0)
@@ -212,6 +212,22 @@ static void sdhci_brcmstb_cfginit_2712(struct sdhci_host *host)
 	}
 }
 
+static void sdhci_brcmstb_set_72116_uhs_signaling(struct sdhci_host *host,
+						unsigned int timing)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	u32 reg;
+
+	/* no change to SDIO_CFG_OP_DLY_DEFAULT when using preset clk rate */
+	if (!(host->quirks2 & SDHCI_QUIRK2_PRESET_VALUE_BROKEN))
+		return;
+
+	reg = (timing == MMC_TIMING_MMC_HS200) ? 0 : SDIO_CFG_OP_DLY_DEFAULT;
+	writel(reg, priv->cfg_regs + SDIO_CFG_OP_DLY);
+	sdhci_set_uhs_signaling(host, timing);
+}
+
 static void sdhci_brcmstb_dumpregs(struct mmc_host *mmc)
 {
 	sdhci_dumpregs(mmc_priv(mmc));
@@ -252,6 +268,13 @@ static struct sdhci_ops sdhci_brcmstb_ops_2712 = {
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
 };
 
+static struct sdhci_ops sdhci_brcmstb_ops_72116 = {
+	.set_clock = sdhci_set_clock,
+	.set_bus_width = sdhci_set_bus_width,
+	.reset = sdhci_reset,
+	.set_uhs_signaling = sdhci_brcmstb_set_72116_uhs_signaling,
+};
+
 static struct sdhci_ops sdhci_brcmstb_ops_7216 = {
 	.set_clock = sdhci_brcmstb_set_clock,
 	.set_bus_width = sdhci_set_bus_width,
@@ -282,6 +305,11 @@ static struct brcmstb_match_priv match_priv_7445 = {
 	.ops = &sdhci_brcmstb_ops,
 };
 
+static struct brcmstb_match_priv match_priv_72116 = {
+	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT,
+	.ops = &sdhci_brcmstb_ops_72116,
+};
+
 static const struct brcmstb_match_priv match_priv_7216 = {
 	.flags = BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE,
 	.hs400es = sdhci_brcmstb_hs400es,
@@ -298,6 +326,7 @@ static const struct of_device_id __maybe_unused sdhci_brcm_of_match[] = {
 	{ .compatible = "brcm,bcm2712-sdhci", .data = &match_priv_2712 },
 	{ .compatible = "brcm,bcm7425-sdhci", .data = &match_priv_7425 },
 	{ .compatible = "brcm,bcm7445-sdhci", .data = &match_priv_7445 },
+	{ .compatible = "brcm,bcm72116-sdhci", .data = &match_priv_72116 },
 	{ .compatible = "brcm,bcm7216-sdhci", .data = &match_priv_7216 },
 	{ .compatible = "brcm,bcm74165b0-sdhci", .data = &match_priv_74165b0 },
 	{},
-- 
2.34.1


