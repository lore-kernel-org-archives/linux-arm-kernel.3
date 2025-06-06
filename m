Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3DBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGYCSzqgyscwX5RWcWecTBpY7TJ/S+OUK1ejoxldwXU=; b=4HcoPIsavOo01aM3DCXT95Xo0s
	Gj6LxFbVTWmQBXZ3TPqHIkRF7AGJvUvdF0gbb38e1/Ad6zed1XHMpUsB2YPiuBYhTFHhzdY/wJRC3
	b17raLImz6BsiMzgcMxWa1sfzF7hd+dSWScDAWt9JH+fgGl/zoWtEo+qgI/OjytQMbt8UlVKaiwt9
	ak/dMoueQ3Exi20IvZIekXijCZueu/EuCmlwtTQ+yY1Fq/mEC1/Wz4pvCrXc/ehUvBxDiI59IL70w
	CIbQgNNjhzYMVXHJ82xQutUJjfquFHyTxsAmZMOweiLv5Lz9AYJuH0/a4N+vChZJs6smEPPLsULrN
	zmab4A/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRbk-0000000HJcb-22x7;
	Fri, 06 Jun 2025 07:35:20 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRWG-0000000HJBD-0w5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 07:29:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749194910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O4fbyuuLCZ/UNw4Bf88gAVG9Y3YRG4bWdKbmU5i+G+zEgvkGQQKh+8kMMEWxA3m6yb+caboaEa43RsHiIkVzl+KVqtzqfcTah5264Jv65tS/7Wft9dkxs/PAYyesKVPRxvD/nG8E+TML9ZV+poJ1UUl+PvNS3bCyCPbOuBmrL7c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749194910; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=wGYCSzqgyscwX5RWcWecTBpY7TJ/S+OUK1ejoxldwXU=; 
	b=Hs73Y7n2dALRul3MN3HwO09tjg8LoOjG3OTc19Ng3eix+uB1hn12afCjNmS/oQE0Qt9ZdsYZLk+5BKiYCDAN47VELlBXptsP/vPAf9nsz/NLJ32ri8kQfdLgPK4H/8Dx6fdRCCmBm9JnXmUW1Oke0yYs0w+mWsWKGc5ZbzMK9Fs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749194909;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=wGYCSzqgyscwX5RWcWecTBpY7TJ/S+OUK1ejoxldwXU=;
	b=OP47TFlEAXWTY1X4cNQ/pA4d2f/CH0AOSaRTAq8GBT4woSe57CoswFvcr8KisNVt
	3DTkNbroEYYq1x2SkM9hJhB87Nm9rS6o7pD0uHF253ZnD3+07D0ixoN1PRpFVNEgjgm
	OapyMhcJFNx1QyOSIaQmLM9cKXcepJ/F7rGqrBdQ=
Received: by mx.zohomail.com with SMTPS id 1749194907959941.1326295181373;
	Fri, 6 Jun 2025 00:28:27 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Liu Wei <liuwei09@cestc.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Li Chen <chenl311@chinatelecom.cn>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 2/2] ACPI: Suppress misleading SPCR console message when SPCR table is absent
Date: Fri,  6 Jun 2025 15:27:45 +0800
Message-ID: <20250606072802.191580-3-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606072802.191580-1-me@linux.beauty>
References: <20250606072802.191580-1-me@linux.beauty>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_002940_320573_E8D936BB 
X-CRM114-Status: GOOD (  12.77  )
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

From: Li Chen <chenl311@chinatelecom.cn>

The kernel currently prints:
"Use ACPI SPCR as default console: No/Yes "

even on systems that lack an SPCR table. This can
mislead users into thinking the SPCR table exists
on the machines without SPCR.

With this change, the message is only printed if
acpi_parse_spcr() succeeds (i.e., if the SPCR table
is present and parsed). This avoids user confusion
on SPCR-less systems.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 arch/arm64/kernel/acpi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index b9a66fc146c9f..bf29e7b668f1d 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -197,6 +197,8 @@ static int __init acpi_fadt_sanity_check(void)
  */
 void __init acpi_boot_table_init(void)
 {
+	int ret;
+
 	/*
 	 * Enable ACPI instead of device tree unless
 	 * - ACPI has been disabled explicitly (acpi=off), or
@@ -250,10 +252,11 @@ void __init acpi_boot_table_init(void)
 		 * behaviour, use acpi=nospcr to disable console in ACPI SPCR
 		 * table as default serial console.
 		 */
-		acpi_parse_spcr(earlycon_acpi_spcr_enable,
+		ret = acpi_parse_spcr(earlycon_acpi_spcr_enable,
 			!param_acpi_nospcr);
-		pr_info("Use ACPI SPCR as default console: %s\n",
-				param_acpi_nospcr ? "No" : "Yes");
+		if (!ret)
+			pr_info("Use ACPI SPCR as default console: %s\n",
+					param_acpi_nospcr ? "No" : "Yes");
 
 		if (IS_ENABLED(CONFIG_ACPI_BGRT))
 			acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
-- 
2.49.0


