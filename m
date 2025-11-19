Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD5ECF31B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qcAsPklHWUk5RQtKYOsfEQA1WxpMyrgcXcj9yoY4jU=; b=qZbbTncz72qMfsvTN8GLexFYs2
	3NNmh8Ouq5Su6QfoH9xvUzKOUG9dvhB6h2i7VUqsQi7hS42J93UXxzPiFYEx9C3w58aj80UrofKS1
	HCm4THY+opncNuHpWi6zvYQyV9sclvOJv3NgT22GzRiJ1Pqaiie9nvfOh/iZobC72KAxNMpvxoe3y
	eVzBYq99cgSIdelgOXk9iVVTyQ8ZbabTNcMfi/W5WKBf3M/B5jLUr33Dwe4rAoPVLRcF5aU/yc3iU
	ToRPbShmGuSWoGGbWnkOIU3EecJAgP3aOqv/LXipODXHPE8tfQp3os8RrLxX+cce7/VBmvqJVV7H1
	3OinHDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhEN-0000000373z-0CNZ;
	Wed, 19 Nov 2025 12:24:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhEK-0000000371z-3GRW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:24:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C735F14BF;
	Wed, 19 Nov 2025 04:24:04 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D7333F740;
	Wed, 19 Nov 2025 04:24:07 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	reinette.chatre@intel.com,
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH v6 08/34] ACPI: Define acpi_put_table cleanup handler and acpi_get_table_pointer() helper
Date: Wed, 19 Nov 2025 12:22:38 +0000
Message-ID: <20251119122305.302149-9-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119122305.302149-1-ben.horgan@arm.com>
References: <20251119122305.302149-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_042412_863761_4174885C 
X-CRM114-Status: GOOD (  10.02  )
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

Define a cleanup helper for use with __free to release the acpi table when
the pointer goes out of scope. Also, introduce the helper
acpi_get_table_pointer() to simplify a commonly used pattern involving
acpi_get_table().

These are first used in a subsequent commit.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v5:
Rename helper to acpi_get_table_pointer
---
 include/linux/acpi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index a9dbacabdf89..ac8797f95236 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -8,6 +8,7 @@
 #ifndef _LINUX_ACPI_H
 #define _LINUX_ACPI_H
 
+#include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/ioport.h>	/* for struct resource */
 #include <linux/resource_ext.h>
@@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
 void acpi_table_init_complete (void);
 int acpi_table_init (void);
 
+static inline struct acpi_table_header *acpi_get_table_pointer(char *signature, u32 instance)
+{
+	struct acpi_table_header *table;
+	int status = acpi_get_table(signature, instance, &table);
+
+	if (ACPI_FAILURE(status))
+		return ERR_PTR(-ENOENT);
+	return table;
+}
+DEFINE_FREE(acpi_put_table, struct acpi_table_header *, if (!IS_ERR_OR_NULL(_T)) acpi_put_table(_T))
+
 int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
 int __init_or_acpilib acpi_table_parse_entries(char *id,
 		unsigned long table_size, int entry_id,
-- 
2.43.0


