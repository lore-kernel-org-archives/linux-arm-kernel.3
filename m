Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB03CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts24JBBdBdyyJOKN3NR5NASyjA2J0qcuP9PP1smFeMo=; b=1GmfJxBGZdmcfMsSh79+koHmEo
	VzhZfJ87RhhlIzzncJZTCC+k9db+fS/Xa9Ig9aXoSCkz5Q4npSGtx/sJBJl720Gi1MqmKqhGWZwdC
	UTpXKIXC2rWt2/JqUNCipx2SYdfPbO2txWLk+dizf0A45IzrZDYpnVZtkfPKy9Ag88ydq6QVirKpo
	MaPdErFxRe0Flic9TybDgxz+PRRoRfitQpO+v2tJI+0ID6DTUyQV+ODy8nJ5dVwNCrvLlxAtcq8MH
	3kYp0GRGpynB85F0l7G8gP6jeCIlbSB87Obnweks/b/jFmB0+GYzZI0dXG507M7EJ35/Jrv6y78uR
	jjAu6VvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploZ-00000004f7E-3KJc;
	Sat, 23 Aug 2025 10:49:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmv-000000032jM-2LvV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 15:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ts24JBBdBdyyJOKN3NR5NASyjA2J0qcuP9PP1smFeMo=; b=OndPP6kNpKooOY/frCh4Pf8SU3
	3DrMM4hWSpx5PA7S/gLO/NDSmKX9fe8Zldth+Zg/O7tuoi6BkaO6UALtd5rLmjLQJ3h68mYPHDVOQ
	T9nU3hdgodJ6ttlK4yWzj5wb5X0QjUIChCfYBLshT/rOCOKZEtAOWie3VRHMHsw1MzBYO2AnGChRs
	yy5PAr/FXYdHMPhSom1XkWn7Bvx4aou8/XKURDx1GjPuDZt1IVbdS7mpxy+iNDr4zwUPUpQ/UndAD
	xFbYq//d2lB8i8p8DPmrbJHGPpatwT8ZSgnxhTTGF/O9WbI6vTVdfG0yjLwRV6KyHoybrVDZhKxps
	l0VnmpzA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmr-00000000yiF-43LX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:34:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 818A015A1;
	Fri, 22 Aug 2025 08:34:32 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 703143F63F;
	Fri, 22 Aug 2025 08:34:35 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 04/33] ACPI / PPTT: Stop acpi_count_levels() expecting callers to clear levels
Date: Fri, 22 Aug 2025 15:30:19 +0000
Message-Id: <20250822153048.2287-39-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_163442_369976_AEBA1B67 
X-CRM114-Status: GOOD (  14.77  )
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

acpi_count_levels() passes the number of levels back via a pointer argument.
It also passes this to acpi_find_cache_level() as the starting_level, and
preserves this value as it walks up the cpu_node tree counting the levels.

This means the caller must initialise 'levels' due to acpi_count_levels()
internals. The only caller acpi_get_cache_info() happens to have already
initialised levels to zero, which acpi_count_levels() depends on to get the
correct result.

Two results are passed back from acpi_count_levels(), unlike split_levels,
levels is not optional.

Split these two results up. The mandatory 'levels' is always returned,
which hides the internal details from the caller, and avoids having
duplicated initialisation in all callers. split_levels remains an
optional argument passed back.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>

---
Changes since RFC:
 * Made acpi_count_levels() return the levels value.
---
 drivers/acpi/pptt.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 4791ca2bdfac..8f9b9508acba 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -181,10 +181,10 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
  * levels and split cache levels (data/instruction).
  * @table_hdr: Pointer to the head of the PPTT table
  * @cpu_node: processor node we wish to count caches for
- * @levels: Number of levels if success.
  * @split_levels:	Number of split cache levels (data/instruction) if
- *			success. Can by NULL.
+ *			success. Can be NULL.
  *
+ * Returns number of levels.
  * Given a processor node containing a processing unit, walk into it and count
  * how many levels exist solely for it, and then walk up each level until we hit
  * the root node (ignore the package level because it may be possible to have
@@ -192,14 +192,18 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
  * split cache levels (data/instruction) that exist at each level on the way
  * up.
  */
-static void acpi_count_levels(struct acpi_table_header *table_hdr,
-			      struct acpi_pptt_processor *cpu_node,
-			      unsigned int *levels, unsigned int *split_levels)
+static int acpi_count_levels(struct acpi_table_header *table_hdr,
+			     struct acpi_pptt_processor *cpu_node,
+			     unsigned int *split_levels)
 {
+	int starting_level = 0;
+
 	do {
-		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0);
+		acpi_find_cache_level(table_hdr, cpu_node, &starting_level, split_levels, 0, 0);
 		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
 	} while (cpu_node);
+
+	return starting_level;
 }
 
 /**
@@ -731,7 +735,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
 	if (!cpu_node)
 		return -ENOENT;
 
-	acpi_count_levels(table, cpu_node, levels, split_levels);
+	*levels = acpi_count_levels(table, cpu_node, split_levels);
 
 	pr_debug("Cache Setup: last_level=%d split_levels=%d\n",
 		 *levels, split_levels ? *split_levels : -1);
-- 
2.20.1


