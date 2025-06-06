Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19278C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tRy24lqfKv3gXyTkphs/dHJ5gyZkpcLuoO/gcsCQCXg=; b=LRDHK0W2oKvsXdtuJ5FrqLD8ue
	wHy4ZB0UJDXMoAknEP34XWyTyAMxw0wGBNNd+LgS4qvph9WCRqHnRiNI/xSXlJoiys326eRkIdwGg
	uQNNgYDgotVVGRKeXBAT1J+nBi1YLXdBpPBNzybG5AyWINfyhkm6U6NzGsz9UqjheKNW3xvd7Bj5j
	RzHiNkfEyooc4o+2MscCcNTvtIne4DdTjGDARRMzQuQCXVkqlvQFDDFUnC2dVozTk9o9GzUfP/NBC
	sbXn7jYOuU0xMtpPLghomePZ9csVq9N0VQ6JncPBFqxhEJMMpW8lb/OWg1w4j8itP/b0Ys8eii7Z6
	I6DfkNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRXM-0000000HJGe-2oeK;
	Fri, 06 Jun 2025 07:30:48 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRVB-0000000HJ1f-3oQk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 07:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749194895; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nM12F+oVjbDuWMsFKHZ4wuPfqaGvmq7/U8QBvi5BKhJA/Nb1u8fKbgOWZ1FrqwHs0M3Uin4HWBXpokSf1DSz7hsUmgtW7+EB5DbAifepx8odD0dbBGizuXBKy9DOTYVeqFEh9gZeGjSYKpZ1Fcl+4Op1XY3RsdUKSQt/1ubXcqY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749194895; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=tRy24lqfKv3gXyTkphs/dHJ5gyZkpcLuoO/gcsCQCXg=; 
	b=EpdUcsSPGETB/rsmVUkCK9JUfJmu3V2vvjQvx92FRZYRP2UlP1yDKqdf9sSujOiwp068IG/nSY7WrIj8k7pKN0J/8HwDLRplDpY3r/yo2bTS7cE0Y/gkZAav5+PBYxFJxdwWMziMqvLOpoCYXfo9JzF5K0BBPEkmp45JrXaP8VI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749194895;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=tRy24lqfKv3gXyTkphs/dHJ5gyZkpcLuoO/gcsCQCXg=;
	b=cvmCZpHk17i/hxDj0tUQgMU4P11hTY2SUJjRFsgCCLKjHL6PNKbeLBP+pUlG1Wkn
	TRLvc+xRErmccoC3jCA09lrIpATkKwqNR0f8Oyq9275XqM3Nndz0nz/wgf7JdRByQst
	nv1sENfqMHN6n9sihdcyb5sfwdgwgP9iSc7vzLf4=
Received: by mx.zohomail.com with SMTPS id 1749194893001866.070129665492;
	Fri, 6 Jun 2025 00:28:13 -0700 (PDT)
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
Subject: [PATCH 0/2] ACPI: Improve SPCR handling and messaging on SPCR-less systems
Date: Fri,  6 Jun 2025 15:27:43 +0800
Message-ID: <20250606072802.191580-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_002834_008924_F16420F5 
X-CRM114-Status: GOOD (  10.36  )
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

This small series improves the kernel behavior and output when the ACPI SPCR
table is not present or not supported.

Currently, even on systems that completely lack an SPCR table, the kernel prints:
"Use ACPI SPCR as default console: Yes"

Or if with acpi=nospcr:
"Use ACPI SPCR as default console: No"

This may mislead users into thinking an SPCR table exists
when in fact there is no such table at all. This series addresses this in two steps:

Patch 1 ensures that acpi_parse_spcr() returns -ENODEV if CONFIG_ACPI_SPCR_TABLE is disabled.

Patch 2 updates arm64 acpi_boot_table_init() to only print the SPCR console message
if acpi_parse_spcr() succeeds.

This results in cleaner and more accurate boot logs on ARM64.

Tested on both SPCR-enabled and SPCR-less qemu-system arm64 virt platform. [1]

[1]: https://patchew.org/QEMU/20250528105404.457729-1-me@linux.beauty/

Li Chen (2):
  ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is
    disabled
  ACPI: Suppress misleading SPCR console message when SPCR table is
    absent

 arch/arm64/kernel/acpi.c | 9 ++++++---
 include/linux/acpi.h     | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.49.0


