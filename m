Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC065E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77M7OzMT8CcBilT9EriBScvbhYmJy/Zk47gwOsgZtSQ=; b=MeZjduL4mE8FPkpTniVbs7I6y8
	x9uXU+OMx4nt7Kwec07y4cI2W6Mx1nGziueP/7VDSx+Sqecoo9xTSmL1WvyBYxGMCe6NrIQi7jFHZ
	txgDvun7P9qZofxzpDzPJk7UkRdW8QnjQ1b0OMDvGdNK0WhsrCX1BgadG9U5yhtWPGxmDBuopYpcv
	vOHBHL4m27vtmc/Nb6AASfPvKWWDvDxHEcJuVK6/96S6CYuI+d/xFQotjymkR5G9fHExlUS6tFhHk
	DaTczz8kpkQoLyG5qMd8zVNW/CbGzBMvPm7q3Y45qz9QUl6DPAjcWlvE/PZwWJpg65NuZLdOJPVfW
	YOvOmJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5aO-0000000C6rE-0g2C;
	Tue, 24 Dec 2024 14:08:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5TH-0000000C5xj-2HQn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 14:01:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62B841FCD;
	Tue, 24 Dec 2024 06:01:41 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9A983F59E;
	Tue, 24 Dec 2024 06:01:12 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 24 Dec 2024 13:57:51 +0000
Subject: [PATCH 4/5] firmware: arm_ffa: Fix big-endian support in
 __ffa_partition_info_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ffa_updates-v1-4-01233aba3e1e@arm.com>
References: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
In-Reply-To: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=2q64Jp03o3t6jzZXlU/yVP9FQTQM5OdzbtR25jurl9s=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnar6l8cTinKnhnzQ/5CPB/Mfbn/B3tGfYPWhCg
 hUnEpQIuMKJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ2q+pQAKCRAAQbq8MX7i
 mMm1D/46Tcd53xMZi42H9IY2wkrm8ejgt1x15l8mlXrf/+DcYzhZGBOrNyBUMB4GNuTMHn55WBD
 H53VzM8Rxvz3Nsifbm0CFVSg87kWy16MOWIIr2dZrGVbmqwQKogbEIrOb6TjO9PI0PNnIUBv9Ij
 UsHiKX7QvRx6HHK+FsBm4WTFhnpB2wg0CceNzB/bKZ1UhOQNPHRqSeooqi1EGFFgBxmqY2HTeuo
 mKkhdgWqz8XqNBPmkD5kAt7ziKOr08CtkDtUPUAWeVZFmmRjrzKOqgZ5Zkk1k5YBNA+0rmzrB+6
 jwwx+cU5MSoYXKbXwMGU7A9eE3HmOyA8L5VwAxWJOH9jAI9zIyxAke29+UOokVB1J/b6aE1fJQI
 YYXJdiFNeajlwNRdSKEBU4QPt7kTUVSUSjNbiSRKH2jQCB4jVzUTK+2ORw6Cz6dfmLkTPCp2S3n
 1ZtXqLanhhslx5ojZxEdXxgsNmEO68OI4STnn4tGC9ci1gIjf/d3WnHHzJm4qzjOHHOB4bPBnCO
 5rstaGBUJmklTYvt7pTsxHhHl5wvMVJuH9+me9W795aJjThg2GfeOScodAE+uYVo0WunDLixuCW
 EWYWCVLCqiLJ6S9CPUsMJ7TOCb2prE7LFSczLoaagIoJZf5/8bXXjK7ORPEH6NMhQ3ejlf4Lgm6
 D1YlIB4zG2/eK0w==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_060115_654614_6DD900F5 
X-CRM114-Status: GOOD (  13.02  )
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

Currently the FF-A driver doesn't support big-endian correctly. It is
hard to regularly test the setup due to lack of test infrastructure and
tools.

In order to support full stack, we need to take small steps in getting
the support for big-endian kernel added slowly. This change fixes the
support in __ffa_partition_info_get() so that the response from the
firmware are converted correctly as required. With this change, we can
enumerate all the FF-A devices correctly in the big-endian kernel.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 037e0d684994fd30971f40bf139367d1e45c1bf0..bc6ffd25ad2e2fea0fe3610cf896718dbed8f0ad 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -276,9 +276,21 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 	}
 
 	if (buffer && count <= num_partitions)
-		for (idx = 0; idx < count; idx++)
-			memcpy(buffer + idx, drv_info->rx_buffer + idx * sz,
-			       buf_sz);
+		for (idx = 0; idx < count; idx++) {
+			struct ffa_partition_info_le {
+				__le16 id;
+				__le16 exec_ctxt;
+				__le32 properties;
+				uuid_t uuid;
+			} *rx_buf = drv_info->rx_buffer + idx * sz;
+			struct ffa_partition_info *buf = buffer + idx;
+
+			buf->id = le16_to_cpu(rx_buf->id);
+			buf->exec_ctxt = le16_to_cpu(rx_buf->exec_ctxt);
+			buf->properties = le32_to_cpu(rx_buf->properties);
+			if (buf_sz > 8)
+				import_uuid(&buf->uuid, (u8 *)&rx_buf->uuid);
+		}
 
 	ffa_rx_release();
 

-- 
2.34.1


