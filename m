Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35C7C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCsLZLb4ZcSr8FEJO8+AfdGVZ1ahJzuhDgSJONGyROQ=; b=rskj/uwM/YhqaefhY7HIGvkFfg
	hI3Jw+1YASBwSAaoHoOtJsE6pA+hrQOP2g60L54MAORRzzYjCTi+ZxRA4JJc4Wb4JFGPStrcwV83T
	7ZjqnPgOPJqzY4BI4eNAougnUdKb009ulkLWYbq67FLtbHt0B1lJTQsP8P1dn71n5UxAzXu1rsykz
	Tb0LnVx0KwysOz1ui25diqtdyycrx5mwSdxX0K0ku3ffFYJukW280sCmRWR09Mr/culB4EGYoGX7w
	3DOS3u6dvdEDAF0F+ZNVihgwQwk3xkVaDJLPoaLaJKMQcUQBhQ0a3Q20E6ciZLKYC8VKN6/7uWwJs
	iq9HvQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8uF-00000009yL4-2sn1;
	Tue, 06 May 2025 03:23:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4sn-00000008x9Y-2QlK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 162C4629C3;
	Mon,  5 May 2025 23:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69A4C4CEED;
	Mon,  5 May 2025 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486356;
	bh=o3fek8CovNQudAwcjM9tbEogmSdp5XotgQ0/JnUDR4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lgOXEa+c4TNh/fcZw1DM0dmgRYqCHfwahA1DSZ78WqKMdq7GQgeyaD7xfpUgvpzwU
	 aAgObJJ+Uel3iokgXE2vR7hDzmL2a9eJPyDGedszhJFmo9VAxXmjWTyabaN+bmw45+
	 uTUztDRpy0iKNkTHdri45RaaPpMPQ+kQ+c3M/brfwdo2FLdEja12VG+yogJrYgoWq0
	 0DjSv7czb1lHoxYXUTMC1qxAGRQqMTbLAv8HkfUUS9i+N8cbD4VZ83kQxMR+TXKRSi
	 V/Kc+GipyY5eJGytIkWMURZ0a7nAXEgKS6vMgcgbi4BVmE3yPiosB4yU0Y+x73r4uv
	 RwrrTOSVos9Qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Dhruva Gole <d-gole@ti.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sasha Levin <sashal@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 278/294] firmware: arm_scmi: Relax duplicate name constraint across protocol ids
Date: Mon,  5 May 2025 18:56:18 -0400
Message-Id: <20250505225634.2688578-278-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
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
index dcf774d3edfe4..0d61f84691d85 100644
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


