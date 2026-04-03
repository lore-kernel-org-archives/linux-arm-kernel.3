Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E5AE7E349
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTmls8kiB0OVuD5GDgL4iObRPQUcTI6qYOGBYIRqpMs=; b=0UH9pDktmWxDV/gXT7OBeyWdDv
	YT0jsyrbkuB8M8/A/XBQZ+jhejmITdPJQKsSHw0QuKSkMFsWAma9bKaJPvoKYXDC++Fu2fo3UXv0K
	ThVHamDTJ+AXpttWmsuEwrPEplv5cnLhZOe1mBtc2ovt6Y0EWOm7Cn2Ljsgwspp5IuQ4TAbSH7Bck
	NIjxU6xDDo8/itnvKCDATH3ZUR0KxLBzyOjLUG9vs03kaDUXEdU+vBwcuQ5Oy+uV+aaj1hIyub96R
	3CM9FQJFV/N3V9vQ5Qw7LeiHCNir1RMyF5Cc4hzAORjRMLIqR9LZXwzaLSAgMeTVVwebj9Cz2zmj/
	V0La8LuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a65-00000001jKW-1Gf7;
	Fri, 03 Apr 2026 08:41:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a64-00000001jJ2-0LaG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6407A60008;
	Fri,  3 Apr 2026 08:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1CEC4CEF7;
	Fri,  3 Apr 2026 08:41:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] firmware: arm_scmi: Convert to list_for_each_entry()
Date: Fri,  3 Apr 2026 10:41:31 +0200
Message-ID: <bccbd4a64ef4619afd5454e9e533073b00aeaba6.1775205358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
References: <cover.1775205358.git.geert+renesas@glider.be>
MIME-Version: 1.0
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

Simplify the loop in scmi_handle_get() by using list_for_each_entry().

Suggested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 57785c0c04241e46..b1bba2c61b728b56 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2584,13 +2584,11 @@ static bool scmi_is_transport_atomic(const struct scmi_handle *handle,
  */
 static struct scmi_handle *scmi_handle_get(struct device *dev)
 {
-	struct list_head *p;
 	struct scmi_info *info;
 	struct scmi_handle *handle = NULL;
 
 	mutex_lock(&scmi_list_mutex);
-	list_for_each(p, &scmi_list) {
-		info = list_entry(p, struct scmi_info, node);
+	list_for_each_entry(info, &scmi_list, node) {
 		if (dev->parent == info->dev) {
 			info->users++;
 			handle = &info->handle;
-- 
2.43.0


