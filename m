Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GfYDP5mZ6be/9mvtq4LT6CkZKcJ17jzSgJeRmoEZsbw=; b=QKO3IYi9rtAlH5T7ktlZUGWXq0
	Yr1gpAd4EtO6Q66jzpFdp9y4yWNt8KfbnuFfvL+cuJeKuKlKwJ37rRu548Y/9nEvX1w+Sg2p+k4lA
	0fbyD+Pi4kKyWckVPXeQXadZEJ2oJe8stprihjBqjdEg47foJC6+JyKoZSr04WD0Y9slap/CrA6nh
	rXHzrqBa2oz8tU2DdtlQOHFYC26Ubeb/wMLfwjTdEdMxNP7AC7njRbiIn0Bm9cTMBp1reJosTiJXF
	+5bwfYuKRann9iiGqHH2XRfUPGGq6flfbwwU2eiZMdXdkAzKTM1CsuYunipNSt0UoYjd6Oq4hQ9PP
	575mRG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfmQ-0000000C568-0KOZ;
	Mon, 06 Jul 2026 09:38:22 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfmN-0000000C558-00kr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:38:20 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowACnQMmFd0tq06jxBA--.1377S2;
	Mon, 06 Jul 2026 17:38:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ACPI: APMT: validate node bounds before device registration
Date: Mon,  6 Jul 2026 17:38:11 +0800
Message-ID: <20260706093811.81850-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnQMmFd0tq06jxBA--.1377S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr43Cw4rGF4UCF4xAryxXwb_yoW8Cr1DpF
	W2gay5trWDKr4xWwsavw4rZ3y3Aa1IyrW7KrWDG3yqg3Z8Kry7GFyFyFyjv3W8JFZ7Jw4a
	qF45tFyUGFWUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfU5byZUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023819_418613_EF636199 
X-CRM114-Status: GOOD (  11.99  )
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

The APMT parser walks variable-length nodes from the ACPI table and
passes each node pointer to the platform device that is later consumed by
the Arm Coresight PMU driver. The loop only checked that the node start
was before the table end before reading the full struct acpi_apmt_node and
advancing by node->length.

Validate the fixed node body and the declared node length before using the
node. This keeps malformed short nodes from being consumed locally or
propagated to the runtime PMU driver as platform data.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/acpi/arm64/apmt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
index bb010f6164e5..5f341fa86fab 100644
--- a/drivers/acpi/arm64/apmt.c
+++ b/drivers/acpi/arm64/apmt.c
@@ -23,6 +23,21 @@
 /* Root pointer to the mapped APMT table */
 static struct acpi_table_header *apmt_table;
 
+static bool __init apmt_node_valid(struct acpi_table_apmt *apmt, u64 offset,
+				   u64 end)
+{
+	struct acpi_apmt_node *node;
+
+	if (offset > end || end - offset < sizeof(*node))
+		return false;
+
+	node = ACPI_ADD_PTR(struct acpi_apmt_node, apmt, offset);
+	if (node->length < sizeof(*node))
+		return false;
+
+	return node->length <= end - offset;
+}
+
 static int __init apmt_init_resources(struct resource *res,
 				      struct acpi_apmt_node *node)
 {
@@ -129,8 +144,13 @@ static int __init apmt_init_platform_devices(void)
 	apmt = (struct acpi_table_apmt *)apmt_table;
 	offset = sizeof(*apmt);
 	end = apmt->header.length;
+	if (end < sizeof(*apmt))
+		return -EINVAL;
 
 	while (offset < end) {
+		if (!apmt_node_valid(apmt, offset, end))
+			return -EINVAL;
+
 		apmt_node = ACPI_ADD_PTR(struct acpi_apmt_node, apmt,
 				 offset);
 
-- 
2.43.0


