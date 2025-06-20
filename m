Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5AFC7EE24
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ydvxy1sRh0XdyUY78UINI/d5MUqA5T2bAotDmBZAf6w=; b=Kt+YXIaCXKMeRF6ojPayxmzxYH
	ZldwNTlGFCrU+rHwNxivwranEuSbYEnNdapp0v5ELR1H9ABTWyeznx138lxNAlReY7QMeNSm4lVbG
	dHiwVDZEmOUYwpCrPD8sTzM/pHAArIZ08OuYeO7PSqyTYneat8w9LOlhpPph/WluX1GGlzixGaWot
	xnJ63pzW1ulDoPDLuvzmHklHZ31bT0ccUxeZPB6sxsq6rcyZc5j59Ee5JWuNrT6OkJuxLcuM1Hkmw
	aR4W/84VdAWB2SSu5umyg7rz/n9B9QUo4VtTSE6t4ghMJJgpMtmJ8dCBmW5tSYemN4xjSAZMLW2NQ
	4h3pCHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyR-0000000FkDQ-49Bo;
	Fri, 20 Jun 2025 13:40:07 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbYk-0000000FgyC-0Ube
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750425200; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ag6sm19tCZyRI1BO2CAVBqUY3xmXRXJa92+mdmoKr64FDpX00OTD2KOnRqm91jz7XjJ+rmjaL+312oJM0bPTvEpue8+nIPxQEMelWaVu40gxosO422ZaXGDei0X9ocNE3svu+X4vyLT0Y14mK/Bbiz/fmH44sXyP/I0EYqdp5Xs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750425200; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Ydvxy1sRh0XdyUY78UINI/d5MUqA5T2bAotDmBZAf6w=; 
	b=ljK02p0OoIZuydQAGJsoVnGKSlUXXg0QKS3ddUTcdkWCokCBMfCVFlA8AmvhSxtWRpqTy5u3kUM2kdyV5j7ShRCSJqyop3xwf4xrWHRXIbzD+JHPnGpdIOwDBgw8jLAdf89++/DAnV4sAPjPSSMljYph4ZwZlDPSTaJCL2c9LfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750425200;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Ydvxy1sRh0XdyUY78UINI/d5MUqA5T2bAotDmBZAf6w=;
	b=QGlDSicnOv6qys1rQpkrOFbO9r5rCtI2Rg8ZI7nc19PanS3DdqWsz8p4fZOUwbeN
	EuQ/YhXGI5NXYINn7s+oEqtYJfFEyOcA+OCJ531usFR9aiVgMIc11iX987MPm7uWZ7d
	FOLJ/9kSeo7gw9QX3u4nV2Qo53E9Hlje4Ll985jg=
Received: by mx.zohomail.com with SMTPS id 175042519577329.422760089999883;
	Fri, 20 Jun 2025 06:13:15 -0700 (PDT)
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
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 0/2] ACPI: Improve SPCR handling and messaging on SPCR-less systems
Date: Fri, 20 Jun 2025 21:13:06 +0800
Message-ID: <20250620131309.126555-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_061334_218527_6CE2325B 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

From: Li Chen <chenl311@chinatelecom.cn>

This small series improves the kernel behavior and output when the ACPI SPCR
table is not present or not supported.

Currently, even on systems that completely lack an SPCR table, the kernel prints:
"Use ACPI SPCR as default console: Yes"

This may mislead users into thinking an SPCR table exists
when in fact there is no such table at all. This series addresses this in two steps:

Patch 1 ensures that acpi_parse_spcr() returns -ENODEV if CONFIG_ACPI_SPCR_TABLE is disabled.

Patch 2 updates arm64 acpi_boot_table_init() to only print the Yes
if acpi_parse_spcr() succeeds.

This results in cleaner and more accurate boot logs on ARM64.

Tested on both SPCR-enabled and SPCR-less qemu-system arm64 virt platform. [1]

Changelog:
v2: refine the printk message logic as suggested by Hanjun Guo. [2]

[1]: https://patchew.org/QEMU/20250528105404.457729-1-me@linux.beauty/
[2]: https://www.spinics.net/lists/kernel/msg5730585.html

Li Chen (2):
  ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is
    disabled
  ACPI: Suppress misleading SPCR console message when SPCR table is
    absent

 arch/arm64/kernel/acpi.c | 10 +++++++---
 include/linux/acpi.h     |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.49.0


