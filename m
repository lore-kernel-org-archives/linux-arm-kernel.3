Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148E5CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1V4NPuyeQa7H6wkwBSfixLDgZEqBYs08A2L49MD/po=; b=Y3c+TJROjm9kVBRKQUyHM6GJvl
	/ZKErNfNgDCw07iRyhyKIeDZVaFqvN4ni/bS7RAryf6JfHmuBR9Ln6FdASLtdOKUrRM6tsI9DT92z
	QRxzok7jOilKLr89ajxtpnsllEOkQob4xyMMROJI+SNlSFu3VrisXtjsHQJN13vmXBoDyGujr/kh5
	icZ7zDEgWiwLF12dpfpuGkeE+4uTByVVemQnArBgnxrwFNH0fe9717pQGSSkrZ6odFl4RdOQLpHUd
	PiVsXKeVj2n7pIctC8l+o+7IuX/fm+S0fxbSIaV6Jo1Gai3WeBS9JjFXZ2qh/5kpqblwKhQ64q4Q5
	9GoLfijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhP-00000005q9n-1JNO;
	Thu, 14 May 2026 15:10:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhH-00000005q3J-0X3n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D6F744708;
	Thu, 14 May 2026 15:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF8CC2BD05;
	Thu, 14 May 2026 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771397;
	bh=+Y/GGoTKNCM3giuKbq04aPtsbFnmhL9znjR/JyKh7Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LDMDAMzGaA9jC172A8eLW/Cb0mO2TltTn8gVbgo/Zu4q/jYWo3Znc+RhmuMsC2Rdk
	 DrE+eWcdwRjhRlKy+13DyVwe+uR8xaRCv5XUpspSMep1T5jwIatMHujwLSLo7576cC
	 L3Um7uOf+i/wLipca02Vku6OO8ANsm+A3eJxH3UaQnYAQPchqQcgD31ZiOAhpkkEHz
	 EPHtwH0GL63NCZpCykOs/slBb6U1UmYrMDI+19mYOAvy1dxm3QwXEcpHMRYq1EIX/y
	 ssmif1ajBeDmtTW9NAqTcP3eT7QDd2biSGD0+EQKLI8uXI2FEodphCyZ2k6k3hR6JG
	 wAdkXRHD52M8g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wNXhD-00000002Oqg-3KQ6;
	Thu, 14 May 2026 15:09:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2 02/17] ACPI: GTDT: Parse information related to the EL2 virtual timer
Date: Thu, 14 May 2026 16:09:30 +0100
Message-ID: <20260514150945.3917510-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514150945.3917510-1-maz@kernel.org>
References: <20260514150945.3917510-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, afaerber@suse.de, 
 heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_080959_198593_63D6769E 
X-CRM114-Status: GOOD (  15.60  )
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

Now that we have a way to identify GTDTv3, allow the information
related to the EL2 virtual timer to be retrieved by the interface
used by the architected timer driver.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/acpi/arm64/gtdt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
index b9d9b8edf2df7..d9b43592c22cd 100644
--- a/drivers/acpi/arm64/gtdt.c
+++ b/drivers/acpi/arm64/gtdt.c
@@ -42,6 +42,14 @@ struct gtdt_v3 {
 
 static struct acpi_gtdt_descriptor acpi_gtdt_desc __initdata;
 
+static __init struct acpi_gtdt_el2 *gtdt_to_el2_vtimer(struct acpi_table_gtdt *gtdt)
+{
+	if (!acpi_gtdt_desc.v3)
+		return NULL;
+
+	return &container_of(gtdt, struct gtdt_v3, gtdt_v2)->el2_vtimer;
+}
+
 static __init bool platform_timer_valid(void *platform_timer)
 {
 	struct acpi_gtdt_header *gh = platform_timer;
@@ -113,6 +121,7 @@ static int __init map_gt_gsi(u32 interrupt, u32 flags)
 int __init acpi_gtdt_map_ppi(int type)
 {
 	struct acpi_table_gtdt *gtdt = acpi_gtdt_desc.gtdt;
+	struct acpi_gtdt_el2 *el2_vtimer = gtdt_to_el2_vtimer(gtdt);
 
 	switch (type) {
 	case ARCH_TIMER_PHYS_NONSECURE_PPI:
@@ -125,6 +134,12 @@ int __init acpi_gtdt_map_ppi(int type)
 	case ARCH_TIMER_HYP_PPI:
 		return map_gt_gsi(gtdt->non_secure_el2_interrupt,
 				  gtdt->non_secure_el2_flags);
+	case ARCH_TIMER_HYP_VIRT_PPI:
+		if (el2_vtimer && el2_vtimer->virtual_el2_timer_gsiv)
+			return map_gt_gsi(el2_vtimer->virtual_el2_timer_gsiv,
+					  el2_vtimer->virtual_el2_timer_flags);
+
+		return 0;
 	default:
 		pr_err("Failed to map timer interrupt: invalid type.\n");
 	}
@@ -142,6 +157,7 @@ int __init acpi_gtdt_map_ppi(int type)
 bool __init acpi_gtdt_c3stop(int type)
 {
 	struct acpi_table_gtdt *gtdt = acpi_gtdt_desc.gtdt;
+	struct acpi_gtdt_el2 *el2_vtimer = gtdt_to_el2_vtimer(gtdt);
 
 	switch (type) {
 	case ARCH_TIMER_PHYS_NONSECURE_PPI:
@@ -153,6 +169,10 @@ bool __init acpi_gtdt_c3stop(int type)
 	case ARCH_TIMER_HYP_PPI:
 		return !(gtdt->non_secure_el2_flags & ACPI_GTDT_ALWAYS_ON);
 
+	case ARCH_TIMER_HYP_VIRT_PPI:
+		return el2_vtimer && el2_vtimer->virtual_el2_timer_gsiv &&
+		       !(el2_vtimer->virtual_el2_timer_flags & ACPI_GTDT_ALWAYS_ON);
+
 	default:
 		pr_err("Failed to get c3stop info: invalid type.\n");
 	}
-- 
2.47.3


