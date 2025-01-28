Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75154C02188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aj8XDJDRrLpKv2EqPYDzMbVxZZ1cx8RY7GFt/SLk8Vw=; b=gV8H1sDxFcu/Ro0gc2AlBbNZk1
	UrofG5cmUcwJGW7HaODpPQ2TqtIneEE1q2DZcm1h9r1esXJIRbGcwbJHuWhGZnNGuAdt4TkTpIv/D
	meCmoxG+8r3ngRC050eGx4xp9PcldxXkRpHfTeZ5rklNssvSdgNuJJVw17xK3Dcgupi9GYKbCpXGL
	MFxSvGxCKYJrf0qwM7e0ekIHAFgvwVSs75HoHXKjYVffLTp1dk97gJhHtGjacrHF4ghRWQ1S5qX+g
	hxPu8kvOiVB5EZXSFBqa7rVEotSjXcZKjrCh+pCeEx6IhwQoGh7+IftSUjIKgiI019vAlxKpJOeEb
	cWghC0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZKG-00000003lPd-2iXF;
	Tue, 28 Jan 2025 00:19:32 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZIu-00000003l9S-0NYK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 00:18:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738023478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aj8XDJDRrLpKv2EqPYDzMbVxZZ1cx8RY7GFt/SLk8Vw=;
	b=beU6vS3cNEuyQL3B+xtsVcRI0hzOTXuhi3dYC0RRXyNVmkC9RQlcZzg0+BOZhDhdNOha7o
	9qRNW3+XQ10BUuUsw6zkDZ7qdzIP1Vwg+PpFVuEfA+HBNJ7gtRSQ5Dm/PeCPDc5zN83git
	obwH0WdNZSvCObCoTpSrzSRYLiQRkLo=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-acpi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH] ACPI: GTDT: Relax sanity checking on Platform Timers array count
Date: Tue, 28 Jan 2025 00:17:49 +0000
Message-ID: <20250128001749.3132656-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_161808_803561_8FE0C615 
X-CRM114-Status: GOOD (  13.06  )
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

Perhaps unsurprisingly there are some platforms where the GTDT isn't
quite right and the Platforms Timer array overflows the length of the
overall table.

While the recently-added sanity checking isn't wrong, it makes it
impossible to boot the kernel on offending platforms. Try to hobble
along and limit the Platform Timer count to the bounds of the table.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Zheng Zengkai <zhengzengkai@huawei.com>
Cc: stable@vger.kernel.org
Fixes: 263e22d6bd1f ("ACPI: GTDT: Tighten the check for the array of platform timer structures")
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 drivers/acpi/arm64/gtdt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
index 3561553eff8b..70f8290b659d 100644
--- a/drivers/acpi/arm64/gtdt.c
+++ b/drivers/acpi/arm64/gtdt.c
@@ -163,7 +163,7 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
 {
 	void *platform_timer;
 	struct acpi_table_gtdt *gtdt;
-	int cnt = 0;
+	u32 cnt = 0;
 
 	gtdt = container_of(table, struct acpi_table_gtdt, header);
 	acpi_gtdt_desc.gtdt = gtdt;
@@ -188,13 +188,17 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
 		cnt++;
 
 	if (cnt != gtdt->platform_timer_count) {
+		cnt = min(cnt, gtdt->platform_timer_count);
+		pr_err(FW_BUG "limiting Platform Timer count to %d\n", cnt);
+	}
+
+	if (!cnt) {
 		acpi_gtdt_desc.platform_timer = NULL;
-		pr_err(FW_BUG "invalid timer data.\n");
-		return -EINVAL;
+		return 0;
 	}
 
 	if (platform_timer_count)
-		*platform_timer_count = gtdt->platform_timer_count;
+		*platform_timer_count = cnt;
 
 	return 0;
 }

base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.48.1.262.g85cc9f2d1e-goog


