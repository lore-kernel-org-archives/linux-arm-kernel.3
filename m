Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCFACD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 03:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhpWwDbR97+SMakSUBFzAFyFcaD10CZtseG3hue6UkU=; b=kDzgugQEzdKX+RVswepQ7ZgU4A
	HMO8Abmo4EcIMQKYb7HUWS511iByjMlJKgu7GTPGR14lZJ0ZweWU6+CxYkelOvWT0i+GuceqcfWU7
	DymgQuq11g9LPJrlK4PDBFOlfm4ItlDbcRY051sGoheA5tI0clhZWeFMhKPgk1kNDB2VclsgQmgW6
	pq0bGYRNHwxGOb4QSQEmDSSUKJ14g3LIc77LJaDYwbdvA6BGIb80Rpy0CfclHVkhhE5hL2hrH+qG/
	PL0As6JuaMGyYl/uXI60EcxmAUdUIp0xs5HxFhlAhK3cBbDQuUiWp7+weYGwcjfUS4k6dUePlLiFT
	U39xSD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgWA-0000000GXSr-1BcU;
	Wed, 17 Jun 2026 03:00:42 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgW7-0000000GXRV-1Akn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 03:00:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gg7s001Ysz9typ;
	Wed, 17 Jun 2026 05:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781665236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhpWwDbR97+SMakSUBFzAFyFcaD10CZtseG3hue6UkU=;
	b=IgYKC9MKkOjzFuEOHocXVMcjJsKxfmC0jEWKonhlW+6jd5YVKr0gtBY/yM4sulJJmJ3yA6
	pP7dihyyGhinpNTpeh0AzuaJU80WTZDIcW6gUi+xBVVsQC1LKPCKkRwnb37dfTrJMLC0+o
	xoo+6Ega9+k9H0Mx9Jv8VnHoFhD/K83Sa8p2/d/5hEIeUN4S1S8Itox1uVN/BJpTfZeGHV
	KYsQFYoKcuL0Vey0oD9Afr9TOPP8rByBLD9EuEgrOlAP14yNnoT6Yxu7xDQ8FY+IaapYPN
	SX4yv+ILVicWvIApMxbEexAPAgInXJfZBL7W5+8ItZRLiHCOd2b410zslqaE7g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781665233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhpWwDbR97+SMakSUBFzAFyFcaD10CZtseG3hue6UkU=;
	b=M3SobhVa5MVvm9eT0maeDaI7uzHZscdgqY/sT0G5fhtm4u+ovLK20OZXzJIDpIdPPnRakM
	e0BxlSQu9CtkY9IE/N2DsIJHnXPaeqowDvPsbGw3jKMwXf1gOV5iyLyYGPcvLjFSfYkW9s
	oqvbv0df0+cjygUFp/Ku9UIbRIsExvGqohu+b+B61wdvGi719+Kq8TLfz+u7DH+aGX0c7/
	XeZDMV4FKFoidl0eyGV/RJ3Pj/KL5YZAZtmP6qUIxkNwViJMODXb3lSNq7nf5UJpdXysyp
	Bpb5P3wHjReB0VP1os3Yo39fNT/j+Ezd6LXa0qS48+ZXn5tEK+p4z7hD+fPE4Q==
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
Subject: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
Date: Wed, 17 Jun 2026 04:59:45 +0200
Message-ID: <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d77bf842bd1126aadbc
X-MBO-RS-META: dbrtmujhigiw1qkb17nd4db4j6jy1g15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_200039_527839_9E300E5B 
X-CRM114-Status: GOOD (  12.96  )
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

Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
common for many ARM GICv3 implementations. Therefore, add an extra
of_machine_is_compatible() check.

The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.

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
 Documentation/arch/arm64/silicon-errata.rst |  1 +
 arch/arm64/Kconfig                          |  9 +++++++++
 drivers/irqchip/irq-gic-v3-its.c            | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+)

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
index b57d81ad33a0a..ec3756f29cf1a 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_renesas_gen4(void *data)
+{
+	if (!of_machine_is_compatible("renesas,r8a779f0") &&
+	    !of_machine_is_compatible("renesas,r8a779g0") &&
+	    !of_machine_is_compatible("renesas,r8a779h0"))
+		return false;
+
+	gfp_flags_quirk |= GFP_DMA32;
+
+	return true;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -4975,6 +4987,14 @@ static const struct gic_quirk its_quirks[] = {
 		.mask   = 0xffffffff,
 		.init   = its_enable_rk3568002,
 	},
+#endif
+#ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
+	{
+		.desc   = "ITS: Renesas R-Car Gen4 GIC600 32-bit limit",
+		.iidr   = 0x0201743b,
+		.mask   = 0xffffffff,
+		.init   = its_enable_renesas_gen4,
+	},
 #endif
 	{
 	}
-- 
2.53.0


