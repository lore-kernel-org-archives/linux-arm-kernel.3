Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E09CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEmNG5dHeCrJHUC2bFy2N+BBQV+BhaaczeWYkzApDTU=; b=ECz58NDV04+PPK1sZuSo4rxjXZ
	nLFII4S03N+fHLBRBN0n6HJAhErbO5uwDQLsXdtawrPAQVyJR8BXnVNj/Px3wKzQ9exrtqXKufaeS
	mFy4t+myyphIEwfBEWBadaYQpy0Xnl37T2lilUPHKqL6T4nAvgYiHKRe0iVhUVPueSDra91BaHyUG
	RKJdJsANqFBeL/zSIH0wtJzOyTGWhEK2eWxyc/aeEgMGyS1bVtGVQG9A9wOuC6jF+MOn0A5qVAhxC
	IFxVTzRc49k3IwE3jKtIl7bn7td+a46lJiwrcBrAMM0s52UrAtou0F9MM49+E+xUpSLb5kTJVsr2G
	M4ZuHAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JP-0000000288m-31nl;
	Tue, 07 Oct 2025 14:05:07 +0000
Received: from mail-oi1-x261.google.com ([2607:f8b0:4864:20::261])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JN-0000000287d-0JmR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:05:06 +0000
Received: by mail-oi1-x261.google.com with SMTP id 5614622812f47-43feeae5e8eso860627b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845904; x=1760450704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEmNG5dHeCrJHUC2bFy2N+BBQV+BhaaczeWYkzApDTU=;
        b=llUQ8cOAmqfY2Nvod+w81lsMDUMG+UYa46mWGgYhBFlXz0p9CmDgc4nnzYs+P6cQra
         lj8DWu5Wz8Rp5ugzo4A7pMUgtgXFKPk8IlUkZIpaVAzwrz4JoEAOhV376EdC67cBJmQW
         BE6vh/BWI3SRbiExmzE2NPwLy8MOkFLQ7yIyVK9ekhi/O9XMJv7Qrjrcv3j+KXC4LGg7
         hUjCK92yq5cSYoBCBiaVV1kkBMJ9tgT+Eg2o+SkpLp8bPNUP8vRtQ3wrbMll3D+uqcu3
         cxhK3aJfhGFD0MPTC93SaLMEK6pK5iCjHd5rl35mzH+1BvDpcN0F7FlFZ5+0oGT5daAr
         X7eg==
X-Forwarded-Encrypted: i=1; AJvYcCUmN7b+gtJbHa2BUR6yqC/PO7tnhvbdRev9+kE444yHDG9dZeUM6RYYczMtwBdJB5SBfQuRLKHRVwxG6YfLZL6X@lists.infradead.org
X-Gm-Message-State: AOJu0YxIjyPCwUMfij/TBguIYE3CxSA5MbzcgioCylD1sw+450v+BB+n
	FN1gbdC12ESSkGgHq1+XBiGvpgGF/n8doIbDXw9PdEN5fcLypT7vexN5S8tt56iaOEWJTvxjinx
	PShBl0YWpCTjjlGqim+y/3hL1gcd5eooSx2xoJjhIoBSNHHRBEDgXKarE/hxOcW4knN0YzfeWfq
	PetuTIfQzXizQaeBZGIWp8/7TVGf/dtF0WrmWZA67ULV30CmS9/QftY92JAxYdDvWeMa9kVXiSx
	mXMuX21mc/c5rI5XbE5WceYPOY=
X-Gm-Gg: ASbGnctcueI9IjCA5AZeiEOrNlsSeF0kHJxEQR3huriFZ9NMAgq0vN33Xh0upJ5+5nk
	vrHJpkAcBO/N7Ur770KIMf2bFU0yPdKER+H0jQ9oeZNA0ng6+OzoTeYYoTtH4UDiuRwIaBGOorb
	EqrzN1spYymhXh+8FdTgmII5BvU5wuLFBiZT57lJ1Olud9EuaFuBU/Q0YvvnKqBjhyGTr8Wp1W2
	0Q/wzqjagiRu35n+LiUuddAbd9RXGkENmwtsDR5B+0a9/NQVgHxOgb6pyDDnQ/JDE3oU9PbsSFj
	Jwo7ZCIqGvD0gmL4lDKGAxYlK8pX8liMVnsHQB/iGqbfW/7UAk6gAceGadWINgmEVQ1T9I/mTy2
	hkI9yixjgyHatxXKYY7UE13ilPU4o4eZ/nBZY3CUqYU4JFExFE5v4XubattMD/ZUZZNUc1d3TCA
	DEzvU2
X-Google-Smtp-Source: AGHT+IG2XTv09PHbdrpwhziiEO1CVd/XFeBjYsLdLB3Fn1+7lk6z/7hxhbpe72BbiRsno6Jl9pe4e6k5viyN
X-Received: by 2002:a05:6808:1591:b0:43f:23df:e02f with SMTP id 5614622812f47-43fc17ac540mr8161051b6e.11.1759845903829;
        Tue, 07 Oct 2025 07:05:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-92eb4ea52b0sm164581241.7.2025.10.07.07.05.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:05:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87a0e9be970so12606916d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759845903; x=1760450703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEmNG5dHeCrJHUC2bFy2N+BBQV+BhaaczeWYkzApDTU=;
        b=YJuHtshRFnhow3P296nvK62mo41hvGTIH4XchODADifjNYfjHqeMms+afZ3qFtvjbn
         yL5JmOVuWukx2iXFZ6krHXN+Pebhpq9IZgaKyep88HwM0C9ugwcuyIb37lP/k/fdlBHD
         PlVkheLM2kbAwN7njSrtrmCfPIY/GTEL2I5MA=
X-Forwarded-Encrypted: i=1; AJvYcCUPslwdCg+iOav6VzptCJuhHQvyDtVQwYgAadMRrPxNOUdLeAUy1/BsLnqSAk3YpBF2zNEmHLPkvQSylXwHW+k0@lists.infradead.org
X-Received: by 2002:a05:6214:4113:b0:818:f4ef:daab with SMTP id 6a1803df08f44-879dc7c243bmr192631966d6.26.1759845902120;
        Tue, 07 Oct 2025 07:05:02 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:818:f4ef:daab with SMTP id 6a1803df08f44-879dc7c243bmr192630956d6.26.1759845901002;
        Tue, 07 Oct 2025 07:05:01 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bae60b67sm142718956d6.9.2025.10.07.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:05:00 -0700 (PDT)
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
Subject: [PATCH v2 3/5] mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200
Date: Tue,  7 Oct 2025 10:04:31 -0400
Message-Id: <20251007140434.606051-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007140434.606051-1-kamal.dasu@broadcom.com>
References: <20251007140434.606051-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_070505_134234_BF8BF812 
X-CRM114-Status: GOOD (  15.49  )
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index f81cc1889ac9..d25bf71d79f4 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -34,6 +34,8 @@
 #define SDIO_CFG_CTRL				0x0
 #define SDIO_CFG_CTRL_SDCD_N_TEST_EN		BIT(31)
 #define SDIO_CFG_CTRL_SDCD_N_TEST_LEV		BIT(30)
+#define SDIO_CFG_OP_DLY				0x34
+#define SDIO_CFG_OP_DLY_DEFAULT			0x80000003
 #define SDIO_CFG_CQ_CAPABILITY			0x4c
 #define SDIO_CFG_CQ_CAPABILITY_FMUL		GENMASK(13, 12)
 #define SDIO_CFG_MAX_50MHZ_MODE			0x1ac
@@ -210,6 +212,21 @@ static void sdhci_brcmstb_cfginit_2712(struct sdhci_host *host)
 	}
 }
 
+static void sdhci_brcmstb_set_72116_uhs_signaling(struct sdhci_host *host, unsigned int timing)
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
@@ -250,6 +267,13 @@ static struct sdhci_ops sdhci_brcmstb_ops_2712 = {
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
@@ -280,6 +304,11 @@ static struct brcmstb_match_priv match_priv_7445 = {
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
@@ -296,6 +325,7 @@ static const struct of_device_id __maybe_unused sdhci_brcm_of_match[] = {
 	{ .compatible = "brcm,bcm2712-sdhci", .data = &match_priv_2712 },
 	{ .compatible = "brcm,bcm7425-sdhci", .data = &match_priv_7425 },
 	{ .compatible = "brcm,bcm7445-sdhci", .data = &match_priv_7445 },
+	{ .compatible = "brcm,bcm72116-sdhci", .data = &match_priv_72116 },
 	{ .compatible = "brcm,bcm7216-sdhci", .data = &match_priv_7216 },
 	{ .compatible = "brcm,bcm74165b0-sdhci", .data = &match_priv_74165b0 },
 	{},
-- 
2.34.1


