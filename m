Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C10CCD98F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 22:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUrRBtBh2pciR67Vv8Z+hWG0Mvemi70rYpWXOZ2LaHo=; b=H8arESQaEuT9m5EVMznmZn5Mzv
	Q/4jsu4KcZx3EYcjDZG+I8K3jJpsVhJymN49to+mIFdCJ0/yIE2hNQHDzVNtWllZEDqmToaQ1jOTF
	HgEA1HHrPG4u1qroRErXhzVALG7wgeINN/aGlpks9qIJDhVQpgIkwnqOHRzBAMGWjGb52ZaRU19As
	2ojp2zSRwME/3HkqJfarIjWj4wZ0Y5f9YRS1E2FrQoyZLTzqY/RxrgPAvrzMPKrvazqGrjuEwZjcN
	UUqDvdBaWpECWY6qKfMcrB2B17CAckfjQljBVetdwb2Ythe92A2iot9IDQAfLhHLqoHpfm17j3H9I
	uZNnV26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKr6-00000001pDi-3mTw;
	Thu, 18 Jun 2026 22:05:00 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKr3-00000001pBT-3pGV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 22:04:59 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ghFBv2fdNz9tfD;
	Fri, 19 Jun 2026 00:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUrRBtBh2pciR67Vv8Z+hWG0Mvemi70rYpWXOZ2LaHo=;
	b=sYx7QEo2lS49J9wsBe3wxu94/S03aY+9LhCX79eqzZFYBKDxlVC3CVBaN0MJ3coCQtkMwi
	AnUBOTwMKLTIKAKKXU+yXUu2CRsDdzd+6eBJ+p4s6jrF7+kj1WWe8+TSsmV7lV6LXu+2yj
	dn8ACxNLV+UZQ+epl/ZEMbS2dgr2SCxVI8QBXKDwwWqbeLGqmQv/lH2/Sl0Ojdsml1tJYQ
	8oVVAE6VMfXn9y79nMNHnd6hVy1ZjNjnZcDs3v2RUaWsJYF1Ol1iPKedhrFDTO5VfNWnLE
	vzwT00X2b9Lxyp3uUhcygEV+GUeh8U+8g+UCG8tT1aqNCYyBM/+REd7LNINTKg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUrRBtBh2pciR67Vv8Z+hWG0Mvemi70rYpWXOZ2LaHo=;
	b=pCpTIqC93E7yTW+KEHr6lqzw+w8pG95Av1u2X7bMCHYuMRw2yLyKN/3AkcnU941Klg8S6c
	ldLa/8brrscM8gliUKzzQ37hYTzG/libwcDxCpRh1unLLhvgVoUST8CDW5yngx6vrDM44c
	fwYDbhwdLWY+8JOuNzaBNpUyMwcJGrmMaHA2K5iOlWpzzimfIFvSsKpyZAV1k6K3+Rm5DQ
	AX4+N0SJlJSpMjZFSklyVjJpEqPO359MErTkvl3/qlsy/rbrfhU8vYUYghBuip7DU7wVzl
	gqQicHntco4TiVwIQ6AhWncl6fzv6vLIap0X7A/hWoGHvctQhO9IEl0bVLNPBA==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
Date: Fri, 19 Jun 2026 00:02:01 +0200
Message-ID: <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g9h8oxz9do3ayuxxqgr9kys7c4dq38ad
X-MBO-RS-ID: 54a33f58b8b92b3ba40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_150458_118096_CB17E024 
X-CRM114-Status: GOOD (  14.03  )
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

Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
or APB interface configured to 32 bit, it can therefore access only
the first 4 GiB of physical address space. This information comes from
R-Car V4H Interface Specification sheet, there is currently no technical
update number assigned to this limitation. Further input from hardware
engineer indicates that this limitation also applies to R-Car S4 and V4M.
Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
limitation.

The quirk is keyed on the combination of the GIC implementation
and the platform identification in the device tree.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
NOTE: This would not be possible without prior work from Shimoda-san
      https://lore.kernel.org/all/20240214052050.1966439-1-yoshihiro.shimoda.uh@renesas.com/
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
V2: Minimize the patch based on newly added patch in the series and
    only add entries into dma_32bit_impaired_platforms array. Update
    second paragraph of commit message slightly.
---
 Documentation/arch/arm64/silicon-errata.rst | 1 +
 arch/arm64/Kconfig                          | 9 +++++++++
 drivers/irqchip/irq-gic-v3-its.c            | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 014aa1c215a16..b0c68b64f5ac2 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -352,6 +352,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1286807       |
 +----------------+-----------------+-----------------+-----------------------------+
+| Renesas        | S4/V4H/V4M      | N/A             | RENESAS_ERRATUM_GEN4GICITS1 |
 +----------------+-----------------+-----------------+-----------------------------+
 | Rockchip       | RK3588          | #3588001        | ROCKCHIP_ERRATUM_3588001    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919b..b9e17ce475e61 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1382,6 +1382,15 @@ config NVIDIA_CARMEL_CNP_ERRATUM
 
 	  If unsure, say Y.
 
+config RENESAS_ERRATUM_GEN4GICITS1
+	bool "Renesas R-Car Gen4: GIC600 can not access physical addresses above 4 GiB"
+	default y
+	help
+	  The Renesas R-Car Gen4 S4/V4H/V4M GIC600 SoC integrations have AXI
+	  addressing limited to the first 32-bit of physical address space.
+
+	  If unsure, say Y.
+
 config ROCKCHIP_ERRATUM_3568002
 	bool "Rockchip 3568002: GIC600 can not access physical addresses higher than 4GB"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 8ec2175b78288..96b26822e5bd2 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4891,6 +4891,11 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
 }
 
 static const char * const dma_32bit_impaired_platforms[] = {
+#ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
+	"renesas,r8a779f0",
+	"renesas,r8a779g0",
+	"renesas,r8a779h0",
+#endif
 #ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
 	"rockchip,rk3566",
 	"rockchip,rk3568",
-- 
2.53.0


