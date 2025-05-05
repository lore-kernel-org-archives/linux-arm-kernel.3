Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA007C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcyEsouDxvFSWW5DlcyaRcihHf6kV3aYK3sMSwBeZqY=; b=fJyTkRUS+JAZW1zAAikUP65pZ5
	hx+OnDkSayId9ttrsKHTpyVGDu/oIOzSSK1LQ+1F8iSYLIGxXTsxdT1vtJIibrcZEsCB286B8pQ++
	O5kY10Vpka6KY3ECi+gJcxC/sDtzUFAvUTnoxj+/ndXr77SB4B+heTR3YNzRdqno+HsBYrwY8Ad8f
	HhPFZFIY1cXnGtsYxSdl5YMYX7YwQ1JIUtnOH9je3G4wjJoXxMPLfdgkxEA47jAijT4eHIe8X3Txg
	0UpUwh83coPLFZMdzaoBJTp1f6ONCi/HYiIxQp+bZqFKD8R+vxXx7HHQ8dMnbq7GiqXnKCt3BFE+9
	CjLqlU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6JX-00000009KC9-18aN;
	Tue, 06 May 2025 00:37:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4RD-00000008oL6-3sXI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFCD34A28F;
	Mon,  5 May 2025 22:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDF4C4CEEE;
	Mon,  5 May 2025 22:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484647;
	bh=2dEEw2rM+lZSIeY6U5v9jEvazwwbe3gR4Dn/pnCQHaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S5D7zbqFhRaaPlDvtyZSritjJ0VBiVgVVV/pznIM+KDEKOkA0ObkYwAYLGX9S3DDM
	 ALh/6usbRvlOe/ICX2RTjtSjSpJBPr8Kn5OgoqUCXzIFsDpQxDQTBwVf5+ssvpfj1g
	 T+X6i/DkgQTXuZLWsQguPjBXWXJBvq78WH27CtLZGFtEvgbvnC1PO/jKrgRsXjCtk0
	 qA5Iv1fAoNEQ7a3RZ9+AXuVlQWVMrS0+cRxLQBqkjekSh5ToLCqw4ruSMZinyr1hFO
	 zOPCxbllIA6ljpnnuh4lPwhDN1vT4K8HvRH/1zzzDo9c2T+HqoGDXzfm0OBlrrGlSY
	 gkKO7fFoqmPZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Dhruva Gole <d-gole@ti.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sasha Levin <sashal@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 582/642] firmware: arm_scmi: Relax duplicate name constraint across protocol ids
Date: Mon,  5 May 2025 18:13:18 -0400
Message-Id: <20250505221419.2672473-582-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153728_006310_EFC48DC9 
X-CRM114-Status: GOOD (  13.85  )
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

From: Sudeep Holla <sudeep.holla@arm.com>

[ Upstream commit 21ee965267bcbdd733be0f35344fa0f0226d7861 ]

Currently in scmi_protocol_device_request(), no duplicate scmi device
name is allowed across any protocol. However scmi_dev_match_id() first
matches the protocol id and then the name. So, there is no strict
requirement to keep this scmi device name unique across all the protocols.

Relax the constraint on the duplicate name across the protocols and
inhibit only within the same protocol id.

Message-Id: <20250131141822.514342-1-sudeep.holla@arm.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a3386bf36de50..8acf33ccfd217 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -42,7 +42,7 @@ static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
  * This helper let an SCMI driver request specific devices identified by the
  * @id_table to be created for each active SCMI instance.
  *
- * The requested device name MUST NOT be already existent for any protocol;
+ * The requested device name MUST NOT be already existent for this protocol;
  * at first the freshly requested @id_table is annotated in the IDR table
  * @scmi_requested_devices and then the requested device is advertised to any
  * registered party via the @scmi_requested_devices_nh notification chain.
@@ -52,7 +52,6 @@ static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
 static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 {
 	int ret = 0;
-	unsigned int id = 0;
 	struct list_head *head, *phead = NULL;
 	struct scmi_requested_dev *rdev;
 
@@ -67,19 +66,13 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	}
 
 	/*
-	 * Search for the matching protocol rdev list and then search
-	 * of any existent equally named device...fails if any duplicate found.
+	 * Find the matching protocol rdev list and then search of any
+	 * existent equally named device...fails if any duplicate found.
 	 */
 	mutex_lock(&scmi_requested_devices_mtx);
-	idr_for_each_entry(&scmi_requested_devices, head, id) {
-		if (!phead) {
-			/* A list found registered in the IDR is never empty */
-			rdev = list_first_entry(head, struct scmi_requested_dev,
-						node);
-			if (rdev->id_table->protocol_id ==
-			    id_table->protocol_id)
-				phead = head;
-		}
+	phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
+	if (phead) {
+		head = phead;
 		list_for_each_entry(rdev, head, node) {
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
 				pr_err("Ignoring duplicate request [%d] %s\n",
-- 
2.39.5


