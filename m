Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3470606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DVRSW6Ak;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DBp/vH71
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rCXRkEf55C9RShy6W+6ZCQH6TLZ7TSKY1JRnIF0fU1E=; b=DVRSW6Ak9BM8PlXrHq/kPHqBQ7
	Q1eS2T5VSO6Rby3wDtMGkFrRVXACIzBeP8O+FhoB3HIUY4lYL0ba/LlokjD4+DTWX7nCZ35sXTmQ2
	a9byZBtNSbDNgaqtDD+Oju7EO1THkPNVDrWoHSTXF0HlKtf3mi1XGxdUZRbXpwCjv5dA38c8OQcao
	LnO81lnvW6NDMMCfOVSgrP+mh7I75AJWIOHL7AvJfAznl/M3M/jEKSoliDx64EmFdRsxj6Y8IilKz
	QrJIoYl4BxxBQhTicjk2hi66xAqHE8QZcBnJTwKav0k5o6YxP98ZdC2mBexyM3Z3nqtIz/vNkotcm
	Ti1fOtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqCq-0000000GLUc-2HQL;
	Mon, 02 Nov 2026 11:28:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqCn-0000000GLTQ-1MFs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:28:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEA3C1691;
	Mon,  2 Nov 2026 03:27:54 -0800 (PST)
Received: from e142021.arm.com (unknown [10.57.16.239])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A36E3F632;
	Mon,  2 Nov 2026 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618877; bh=RKMzkXkTS77GadAp9J+goiHtSapT7Ynda5IA90c+4TY=;
	h=From:To:Cc:Subject:Date:From;
	b=DBp/vH71jf7I6tLRCXVvn/2ffdavIE0y4AWsUGEm6HXo6z6G73nguMt9Tp7TxjBSb
	 WvrcZkTtPuzPw5945yZRUulCv9ClShP9O7pQDptSyBxH5IDpDIjb0k23SjbZuAozAy
	 OI85MZfiTZAJfLscewOejq9UfhIny6hP6soA94ik=
From: Andre Przywara <andre.przywara@arm.com>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm_mpam: avoid hour-long timeout on invalid ACPI table entry
Date: Mon,  2 Nov 2026 12:27:48 +0100
Message-ID: <20261102112748.3458012-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032801_399846_2A083840 
X-CRM114-Status: GOOD (  12.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ACPI PCCT table contains a "nominal latency" field for the expected
maximum time it takes to handle a command in the PCC mailbox.
The generic ACPI code reads this value, but leaves the handling to the
protocol users.

For MPAM-Fb based MSC signalling, we use a value derived from that number
as the mailbox timeout. However if the ACPI table leaves this entry at 0,
the mailbox timeout code interprets this as "forever", and waits for one
hour.

Avoid that lengthy timeout and just add one microsecond to the read value,
to come up with a non-zero result in any case.

Found by Sashiko.

Fixes: cb351e3f304b ("arm_mpam: detect and enable MPAM-Fb PCC support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71e..fb596ed19a648 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -102,9 +102,9 @@ static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
 	/*
 	 * Timeout based on the "nominal latency" in us, from the
 	 * PCC ACPI table. tx_tout is in ms.
-	 * Add some margin here to be on the safe side.
+	 * Add some margin here to be on the safe side, and avoid using 0.
 	 */
-	cur->pcc_cl.tx_tout = DIV_ROUND_UP(cur->pcc_chan->latency * 5, 1000);
+	cur->pcc_cl.tx_tout = DIV_ROUND_UP((cur->pcc_chan->latency + 1) * 5, 1000);
 
 	mutex_init(&cur->pcc_chan_lock);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


