Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB01CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf1VFeGYNXOPBaLfEuxjbm459oNNepz8excKm4C0UZE=; b=jQ4RG0qm0bOTEmWC0pDeRt2Nqi
	Wpu4AtmzLfB4Sb/3gmW/Av+UHxn/Alz2xRddWbj/DR1tmdGBbkUaLMDzoHi0vv9A8eK2rDFTpWtth
	yOY2FQ0JhpBpLI2uy2tniZq6dcs2LyJ5XYM0nEhrl/SR0TLiGmsEy5DwSUAyDudSM/nRJbpRysNiZ
	fndTZ1+2QnzzqhDTqojUOQGsrWCKx8ChjGHgsRyupKmcz+5L/bCLW6fm/dKr1QBbFz1zguPtmtsss
	ltzHZHGQAhfiK+XvVuB8wZ8VjqITAhaqErUuaQO/j/NXLU+TK7KixRr3k4dpkM82t9fqHQD3CMehT
	W5truKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEdm-00000008bFa-21fR;
	Thu, 01 Oct 2026 11:07:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEdj-00000008bDs-15da
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:07:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59D2C143D;
	Thu,  1 Oct 2026 04:07:47 -0700 (PDT)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 308D43F86F;
	Thu,  1 Oct 2026 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790852870; bh=Qk5IJujYZUc2jm8+jqWTC4B1XTGYa/7JaWdPp0hSORw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQAFoqrFHrQKbKwbu4m8oGmKnvVXF5bswGciLizz0R8EANR9XPsp1s9GIYXliTDWd
	 7qTzjX2r4c6tsGKXU6P8/8EYUM3VETddBEJmBnrpm+2p3reVLMQ+UV3GsIgiXdGqc5
	 Y3W0g93lxeZxU5YgGMT2hKN6aZlFyebMch1VkVok=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [RFC 05/12] ACPICA: Add TLBI table definition
Date: Thu,  1 Oct 2026 12:06:48 +0100
Message-ID: <20261001110655.461473-6-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_040751_606850_FFCB42A4 
X-CRM114-Status: GOOD (  11.58  )
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

Add the definition of the new Arm TLBI ACPI table.

NOTE: This patch is not yet part of ACPICA and should not be merged as
is. The TLBI table description is not yet public and may change. This
definition is just an initial proposal of how it will look.

Assisted-by: LLM
Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 include/acpi/actbl2.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index baef525367b5..68849c9f7cf6 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -61,6 +61,7 @@
 #define ACPI_SIG_SVKL           "SVKL"	/* Storage Volume Key Location Table */
 #define ACPI_SIG_SWFT           "SWFT"	/* SoundWire File Table */
 #define ACPI_SIG_TDEL           "TDEL"	/* TD Event Log Table */
+#define ACPI_SIG_TLBI           "TLBI"	/* TLB Invalidate Domain Table */
 
 /*
  * All tables must be byte-packed to match the ACPI specification, since
@@ -3701,6 +3702,37 @@ struct acpi_table_tdel {
 	u64 log_area_start_address;
 };
 
+/*******************************************************************************
+ *
+ * TLBI - TLBI Domain Table
+ *
+ ******************************************************************************/
+
+struct acpi_table_tlbi {
+	struct acpi_table_header header;
+	u32 domain_count;
+	u32 domains_offset;
+};
+
+struct acpi_tlbi_domain {
+	u32 length;
+	u32 id;
+	u32 descendant_count;
+	u32 descendants_offset;
+};
+
+struct acpi_tlbi_descendant {
+	u32 type;
+	u32 identifier;
+	u32 length;
+};
+
+enum acpi_tlbi_descendant_type {
+	ACPI_TLBI_DESCENDANT_DOMAIN = 0,
+	ACPI_TLBI_DESCENDANT_CPU = 1,
+	ACPI_TLBI_DESCENDANT_SMMU = 2,
+};
+
 /* Reset to default packing */
 
 #pragma pack()
-- 
2.43.0


