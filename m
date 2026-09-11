Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAC9C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM523NqIuF/Y63PMtMsDp4hyEbdjJ2oMDXXqGkH0PeY=; b=aWCHK7JDZ775E0prQB1KGcxqvk
	n4mQr3o25hE1PZ109UT4bjPmTIC3/sYvMCwSKf6F0V0wsb0RUyyDlnqcNwGYV/qTHfDouCpRvNUYC
	9QhO/EggSE+QlrMAiO1k0LynhCmzW8tNJjdlAuxnlXgLktl+pNYY4F5eTRGUtbX8+svG3SxzJxLt8
	GsuYoOV3zcdOXbVS2o6K1oUJrED3YRQZgzwZ5tBP+FdY6EqmyX4kqghoKMtvt4KzkBU2gYRHiuxXO
	nayVq8b/JftO6Uz/C0vz5597Owx1ZP6WTLmtJb/OOHguXEMLCwgk9UkRW2/BI00f6R33UNt30/2H7
	7MGnwHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zSC-0000000GW79-2Qun;
	Fri, 11 Sep 2026 11:30:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zS2-0000000GVvv-1k7T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:29:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED1E928AC;
	Fri, 11 Sep 2026 04:29:45 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.6.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 590A63F59E;
	Fri, 11 Sep 2026 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126189; bh=fkL8LlJoJEuOsNOgQpjEIgSES2ACtwI8J5F9ENE5/mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QPQLI48Tv7aVl/KMQIa5nGZKb/28bsV2o1bsBlil+2taoJkUgnD5hK2zVTJhgDj0l
	 tJYTRlah3TzzHS57vL87g+mEPAQ+TgxPYON0yvQfaFf78OQoJ+H+LknwfIS+cNsnHd
	 LItyNAANxoOq3xsjDQZkcO4k01clPwlx47gW5wsw=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v10 14/14] acpi: arm64: use MPAM-Fb offset field from ACPI table
Date: Fri, 11 Sep 2026 13:28:35 +0200
Message-ID: <20260911112835.714162-15-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911112835.714162-1-andre.przywara@arm.com>
References: <20260911112835.714162-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_042950_512501_98739EAE 
X-CRM114-Status: GOOD (  13.18  )
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

The newly introduced mpam_fb_offset field in the MSC node ACPI table holds
the difference between the system-wide MSC ID, as held in the
"Identifier" field, and the ID to be used on the MPAM-Fb protocol level.

Subtract that value from the MSC ID and store that in the mpam_fb_msc_id
property, so that the MPAM-Fb code can correctly address the MSCs.
Previously this field was marked as "must-be-zero", so there would be no
change when using older tables.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/acpi/arm64/mpam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
index 8c87b4a663439..ee9be310c2184 100644
--- a/drivers/acpi/arm64/mpam.c
+++ b/drivers/acpi/arm64/mpam.c
@@ -257,7 +257,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
 		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
 							tbl_msc->base_address);
 		props[next_prop++] = PROPERTY_ENTRY_U32("mpam-fb-msc-id",
-							tbl_msc->identifier);
+							tbl_msc->identifier -
+							tbl_msc->mpam_fb_offset);
 	}
 
 	acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
-- 
2.43.0


