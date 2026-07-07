Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324FCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 20:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R1gWPaiItuEMxFOZsKEpycG2kSertLK7DcDGmeuD5A=; b=R+z3LI6VV3+TPPwULux4l026Eb
	fHEv1Rzi7cGr4uwLzYUBcuM+JGKUnB3wKPYWe/CdVUQkBPk7qQEo4OOkwDhGs7JlXgS63FJvEMets
	SvrscX+p5UPARPnXcpNRPnzBDDUejESKcz4abq3/G+uRk4GEQamHiEImttlEa3BVTVHA/tTEI4QrU
	LpGnKLVzU5s6LhTTqP4VAxXI+lgfC40vWoZD++zOZgo6POnyLzzPYZdHqqzGUQ6rs7C2EV8Kno6jS
	aT01V3H55hjIROmHXhFnmFvM5d7vZuTEb7JyKROPnFM7HMldhMa8uX/5Sgi9e8eKkAzTGmSATiLh2
	yWDRBDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYc-0000000FsPA-42UP;
	Tue, 07 Jul 2026 20:38:18 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYa-0000000FsNo-3Zb8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 20:38:18 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gvtN663xGzKvw3;
	Tue, 07 Jul 2026 22:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3R1gWPaiItuEMxFOZsKEpycG2kSertLK7DcDGmeuD5A=;
	b=ZLqOG5/IQeGDrVoiiymiJ+NsuCGQwO2MN4e3sHtolP2HL4nICynFYZ7PHyKwUwZZLnX43Y
	RwYzUFSgp7E4TT9Lo58254lznb1FcFF6L6UINr0wbMpl1hPYailyZ92/B5ezLF6BiMUw8b
	LhWvfDJ2yN73kj9HcfGEkihKNG7u9cyIhtm5Mpv2spGw3vbMWBIkMFwiESZTYmEU7NIlsq
	18ATUZrahLGQCtsAAnsVzr9WhB+eo5QDw3KxmvNqIRbXWcH+gdABjuWxjzhnRZygbH9Ua5
	ZQ0f3pkQvtdb0EwXo5VsgPlLzkUR9auf5aYwdHZaXpM0nxMHgOPTJnv32JZ3GQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qT40Wz79;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3R1gWPaiItuEMxFOZsKEpycG2kSertLK7DcDGmeuD5A=;
	b=qT40Wz79XWmjYujjZpDcgS+jAn7PuAwqNep7KJUM6mnsdKFLnZ2kGI2mfi5LcKEVUwqtbn
	f3eiFAfoEf+iK+Aw+NxJ1SApQkrA5+kz7wRf3nxUIZuZZ0ScUWbLpcbo2JKNiOkrj0FFs9
	dGfHZGMIECoLcBklceTFhn9GoQWzSBrqvk0qc40b14yX4dDvgsrUpDaXY4bW7oVUXEMUXF
	lTI6JKQsBjEy+OcJgOw0dV6SB7QZPBTHQ1vTMIRfUorKVsrF85p7hNJBvHXSeifqzUD8y8
	d0j43JUgTOlUs3s5NZLJ++I7rR5OvC3w0v2OFIBhfhbcdrKeHuj7UNxHeFJNpA==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
Date: Tue,  7 Jul 2026 22:35:42 +0200
Message-ID: <20260707203743.88299-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0e703ae12616d092e1a
X-MBO-RS-META: 3bir1kfmfwuenjkeyh1wx4ii48fskhwm
X-Rspamd-Queue-Id: 4gvtN663xGzKvw3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_133817_049468_42E96660 
X-CRM114-Status: GOOD (  15.05  )
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

Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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
V3: - Add Co-developed-by to credit Shimoda-san
    - Add AB from Marc
V4: - Add AB from Thomas
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
index e136e5abdb33f..b1e0d4f1cd712 100644
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
index d7b46c10ef940..bf507f42ffb87 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4889,6 +4889,11 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
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


