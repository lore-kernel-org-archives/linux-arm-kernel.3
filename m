Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081D6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryerByfEh105kvoAV/sXXJ3X+VHXahisSIcsXlyqqXM=; b=L1y0rUQ4VJ9ilCECqjcSOqhdhy
	0JW9dFnALEYRU0wV45FipnRTjRNzB+64GVzKaIU7rAowDdhioc2JiK8DcHpUFPAh2V9AD8WL1bEPB
	nsYc/V4ie9Ll2eKU+wLGqvOhfHlsj0XIU+LhT2J+WZ6aTc++OHap7a0eNokbo79aGvo3g/HPMdIhV
	ieEDkLmD6FbxTNNqKh381aYR9vS4zJV0zNP2qnJZagtDHvvGbwOeGwFShgTGRd3JLKD9aVq3MoqJD
	41OmT24ppJaTmGTYVg+YOJ/sQhSHh3L8cRzkLGx9XQlTXGH/RKGctlKoT8doRPiK9NUAkiWRQEsWp
	RGhMYNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIxy-0000000FayM-31xH;
	Fri, 11 Jul 2025 18:59:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIcd-0000000FX7B-3Gj6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9BE516F8;
	Fri, 11 Jul 2025 11:37:12 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 693E43F694;
	Fri, 11 Jul 2025 11:37:20 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
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
	James Morse <james.morse@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [RFC PATCH 06/36] ACPI / PPTT: Stop acpi_count_levels() expecting callers to clear levels
Date: Fri, 11 Jul 2025 18:36:18 +0000
Message-Id: <20250711183648.30766-7-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113723_857990_5AC90DA5 
X-CRM114-Status: GOOD (  12.47  )
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

The only caller acpi_get_cache_info() happens to have already initialised
levels to zero, which acpi_count_levels() depends on to get the correct
result.

Explicitly zero the levels variable, so the count always starts at zero.
This saves any additional callers having to work out they need to do this.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/acpi/pptt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 13619b1b821b..13ca2eee3b98 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -183,7 +183,7 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
  * @cpu_node: processor node we wish to count caches for
  * @levels: Number of levels if success.
  * @split_levels:	Number of split cache levels (data/instruction) if
- *			success. Can by NULL.
+ *			success. Can be NULL.
  *
  * Given a processor node containing a processing unit, walk into it and count
  * how many levels exist solely for it, and then walk up each level until we hit
@@ -196,6 +196,8 @@ static void acpi_count_levels(struct acpi_table_header *table_hdr,
 			      struct acpi_pptt_processor *cpu_node,
 			      unsigned int *levels, unsigned int *split_levels)
 {
+	*levels = 0;
+
 	do {
 		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0);
 		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
-- 
2.39.5


