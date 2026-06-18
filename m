Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BB6CD98F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmxnn1xGV2jaajdnAkd2F39mWtMrhqNNBNCjdjH9eY0=; b=ZW7FZvEJQkOQSHK8pW3bJGNsXN
	sc+fmLcSqWWdH5YNlZPdsFBkuNBMKD16OI+pDDpy6SyP6cyrGVXvzWz0MTdllxbUK8CaTLgcIFPOG
	mvYmsJ3rBFbtehxNfx6wGFrTu+gOd9cqb5zZuJSBOL+u0CV6j0gAY5sJ69FDzEkFrbxLrLPICGCUn
	euUUcDKLgEygmks34iq8/tuBsEDW3VAGG+l/KN3LpvxqN0ZhbLaC7npu4x91dvG9Taah3cYP+mB1+
	1Zrha04h7XYyVNitFcdgM3FKGypVMw1iL1D0vgiRbcCTp9/m+chEdh9p4qSSRJy+/dwzWDGCFm2kB
	DW5WU46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKr2-00000001pBW-3Cya;
	Thu, 18 Jun 2026 22:04:56 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKqz-00000001pAL-1KlM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 22:04:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ghFBq09hGz9vCL;
	Fri, 19 Jun 2026 00:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmxnn1xGV2jaajdnAkd2F39mWtMrhqNNBNCjdjH9eY0=;
	b=NGdGFk+cyydHEeo2vGX30Gw4A1Qu91RmrnQEqdTipFBlJsyb+isgjMT6eq6/xo2YAytYxR
	CGDgRNZNK3uZ5xoGRky4sN5lUXtCvPqKgtswJ6UFZCCNJAVkx9NyKmWWL5rrFL2rIDGWzV
	NIiJpVXwVIRjCLugjgwk/fk8Xz2O1OBUl7iqH3G8wVre0/7Q1JwSRRAx6RL3JLmmsaJiqb
	tna+HvwEcawXgih6SmAlILz7rwX1i4L3/y+LSL72gbiUD4WYrYaUcxl80eF3XIi2ymp2Az
	FJ6c+8SsjyjpUKygm7PcJV/SklldmobYZGjdDBOrVTKoJj0/nJ1FWUVXc7lLaw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=x+Uen+Nt;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmxnn1xGV2jaajdnAkd2F39mWtMrhqNNBNCjdjH9eY0=;
	b=x+Uen+Nt1+OxcZfqH03ULWKV0ZCy18GV0zzXWj8kubsqFXhoFiEWFQKNqjD1jlVoBSM7+J
	94HnrgKSp5WS/3P8wcV67OyPVeuWeo6Sdsnw5APviHfubLjOMmp590WaTiLnxz6TTHuiEw
	91RtYhKCpN/doc5tUCNtpfOurW9hAR53bRfMySj3S5yynUl65mcDUEUMpI1pCPLY+qNuex
	hIeQ5SUvch9RYS+PW5BIOAWBLTn6thNKT0BXz/mSw74ckyqedc0rjQSfiY/roJFJyjJqol
	MPUBqQVodHLfw1J1G/DPAaBNE+uax3sYuvgMJnh7RcONttooNSgVKK5+PZadWg==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marc Zyngier <maz@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
Date: Fri, 19 Jun 2026 00:02:00 +0200
Message-ID: <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7x7fbqfctmuyj5g17moafybc439uyhxs
X-MBO-RS-ID: 7e6c2e40ea8eb87b0b8
X-Rspamd-Queue-Id: 4ghFBq09hGz9vCL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_150453_562127_EB29000C 
X-CRM114-Status: GOOD (  11.62  )
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

The GIC600 implementation is now known to be used on multiple 64-bit
SoCs, where it has address width for AXI or APB interface configured
to 32 bit, and it can access only the first 4GiB of physical address
space.

Rework the handling of the quirk to work around this limitation such
that new entries can be added purely as new compatible strings, with
no need to add additional functions or new its_quirk array entries.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
V2: New patch
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/irqchip/irq-gic-v3-its.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index b57d81ad33a0a..8ec2175b78288 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4890,10 +4890,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
 	return true;
 }
 
-static bool __maybe_unused its_enable_rk3568002(void *data)
+static const char * const dma_32bit_impaired_platforms[] = {
+#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
+	"rockchip,rk3566",
+	"rockchip,rk3568",
+#endif
+	NULL,
+};
+
+static bool __maybe_unused its_enable_dma32(void *data)
 {
-	if (!of_machine_is_compatible("rockchip,rk3566") &&
-	    !of_machine_is_compatible("rockchip,rk3568"))
+	if (!of_machine_compatible_match(dma_32bit_impaired_platforms))
 		return false;
 
 	gfp_flags_quirk |= GFP_DMA32;
@@ -4968,14 +4975,12 @@ static const struct gic_quirk its_quirks[] = {
 		.property = "dma-noncoherent",
 		.init   = its_set_non_coherent,
 	},
-#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
 	{
-		.desc   = "ITS: Rockchip erratum RK3568002",
+		.desc   = "ITS: Broken GIC600 integration limited to 32bit PA",
 		.iidr   = 0x0201743b,
 		.mask   = 0xffffffff,
-		.init   = its_enable_rk3568002,
+		.init   = its_enable_dma32,
 	},
-#endif
 	{
 	}
 };
-- 
2.53.0


