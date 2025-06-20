Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA27FC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6KhJbmkVl7HuIV2HXHuYKvcE/VNTXSLGZUIxgNMypM=; b=csHMqcsWTstinmdpkUqhXuWazO
	Fx891wRLHU2tREnbLVI72F0sgO1GTv7DgKKQZFhxcaOWquLMlqe2IDmLqMf/KL3OdisTHcLnTvFH4
	19MyLwUdkFeuOzT4C0dWCdtATSxO0S67aEeTS3hGUwSfR0xiaz/htrslWCXRZqZBXYm/Qdp6yhjC3
	ZZm198TPII9KQ9JLqWBbCURD7UVyT3UlPIyhFgUWUJg9Wnlvqh9pa/6Hgwj17TpgtOg/vZT6AWfQy
	DfhOapZknDCFWZquRG9AE4tG3y0wFPNhXTLMCSk7BrkeFFxuzxTzJJooHsptx0oAUavD81ZLST5Wa
	sxTC0hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyT-0000000FkEA-0CAq;
	Fri, 20 Jun 2025 13:40:09 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbZt-0000000Fh7k-3jd8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:14:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750425208; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MNHPccnBs+XXqy/H38CYDXt+t1su8buoNkN2GLnJ8NF2v6G5p0nuG1vsO8RTsKLekpEN7rZNa5trxFxAQtJT3OjRBJm6GlSLsqctO+WIVxIBvzKqQ+QsjFOPnL0YY4LyBj/eGU8hPQdnYdw17FKpX/UiJky6R06GOtijle5FtE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750425208; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=P6KhJbmkVl7HuIV2HXHuYKvcE/VNTXSLGZUIxgNMypM=; 
	b=dcciD0HGu+lRgum+Jz0u5+lLYqFY7J9aZuIz2meefUVjEpWYo15ETJY3tyFKW19Fjtw60EUiGh607t7r/gMw6djQvez0GicvceRzprUCOXh+JbqPKPvXwJ2qCnsS+5VHYf01RMC6doPNEIJIa0bFKSRy0doEl9bSQiZpT/ZtLJk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750425208;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=P6KhJbmkVl7HuIV2HXHuYKvcE/VNTXSLGZUIxgNMypM=;
	b=UHG+C+w5Z4XSdDUJVC9HC7AjqBnOLQM2EiYpIDGXBLWk4SobNmSn+oBinQroOL53
	/A7e0coeFgopow0/dHxl1Akf1dKGiyQOJcrkw8Jfb63haR/o6tLZceApq/W7RJKHIz4
	vPEzqPZflBieXhzKF8RZAoVoa91hOKZhZZETC5vU=
Received: by mx.zohomail.com with SMTPS id 17504252076891004.916800415434;
	Fri, 20 Jun 2025 06:13:27 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Liu Wei <liuwei09@cestc.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Li Chen <chenl311@chinatelecom.cn>
Subject: [PATCH v2 2/2] ACPI: Suppress misleading SPCR console message when SPCR table is absent
Date: Fri, 20 Jun 2025 21:13:08 +0800
Message-ID: <20250620131309.126555-3-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620131309.126555-1-me@linux.beauty>
References: <20250620131309.126555-1-me@linux.beauty>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_061445_988033_7B48F4DF 
X-CRM114-Status: GOOD (  12.35  )
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

The kernel currently alway prints:
"Use ACPI SPCR as default console: No/Yes "

even on systems that lack an SPCR table. This can
mislead users into thinking the SPCR table exists
on the machines without SPCR.

With this change, the "Yes" is only printed if
the SPCR table is present, parsed and !param_acpi_nospcr.
This avoids user confusion on SPCR-less systems.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
changelog:
v2: refine the printk message logic as suggested by Hanjun Guo.

 arch/arm64/kernel/acpi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index b9a66fc146c9f..4d529ff7ba513 100644
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
@@ -250,10 +252,12 @@ void __init acpi_boot_table_init(void)
 		 * behaviour, use acpi=nospcr to disable console in ACPI SPCR
 		 * table as default serial console.
 		 */
-		acpi_parse_spcr(earlycon_acpi_spcr_enable,
+		ret = acpi_parse_spcr(earlycon_acpi_spcr_enable,
 			!param_acpi_nospcr);
-		pr_info("Use ACPI SPCR as default console: %s\n",
-				param_acpi_nospcr ? "No" : "Yes");
+		if (!ret || param_acpi_nospcr || !IS_ENABLED(CONFIG_ACPI_SPCR_TABLE))
+			pr_info("Use ACPI SPCR as default console: No\n");
+		else
+			pr_info("Use ACPI SPCR as default console: Yes\n");
 
 		if (IS_ENABLED(CONFIG_ACPI_BGRT))
 			acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
-- 
2.49.0


