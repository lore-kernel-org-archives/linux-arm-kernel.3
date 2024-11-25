Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5D0D3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjnW5UuHvwJrZWzYlNYzCc+fzhmSJDSuROqi9vCztT0=; b=kHXDBFB0xBeLF2DbL6+zK/YCxr
	gR0eicTGTD8lYz/qZCcJ06zaMUWhIBAGOffuvyABTPw0p+tR4Yg5rWpOhJhcfU9AXYmawGXEfjtgQ
	yWa3k6E5pAMcm97TvXY7iRWA/TI6WYhGOWqIr6slTsMT9K+iiUdH2ScVs5PvDfm/dxzZO70NmXfON
	rNypaLCFRjHemyRJ/yNs0k8Rlfx30DLGBrdceM4FIJfHok55eQKX0e2kw7v2dqaWcKIPpyEk3m6nQ
	leoI3xANDaqzoAR5kG6O5ioO9hk6rDBuXDw9Z5yDAz/QY5DqnpHeqX4TUgJ1iGAYqF1OObxI9IMLg
	99g+HxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWAC-00000007iCt-2ju1;
	Mon, 25 Nov 2024 10:17:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVm7-00000007ejF-1DUX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:53:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04ABF1756;
	Mon, 25 Nov 2024 01:53:29 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEC823F5A1;
	Mon, 25 Nov 2024 01:52:57 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH 3/3] firmware/arm_ffa: remove __le64_to_cpu() when set uuid for direct msg v2
Date: Mon, 25 Nov 2024 09:52:51 +0000
Message-Id: <20241125095251.366866-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125095251.366866-1-yeoreum.yun@arm.com>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_015259_372871_24F52F41 
X-CRM114-Status: GOOD (  10.17  )
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

From: Levi Yun <yeoreum.yun@arm.com>

UUID is saved in big endian format.
i.e) For uuid "378daedc-f06b-4446-8314-40ab933c87a3",

It should be saved in memory like:
    37 8d ae dc
    f0 6b 44 46
    83 14 40 ab
    93 3c 87 a3

Accoding to FF-A specification[0] 15.4 FFA_MSG_SEND_DRIECT_REQ2,
then UUID is saved in register:
    UUID Lo  x2  Bytes[0...7] of UUID with byte 0 in the low-order bits.
    UUID Hi  x3  Bytes[8...15] of UUID with byte 8 in the low-order bits.

That means, we don't need to swap the uuid when it send via direct
message request version 2, just send it as saved in memory.

Remove le64_to_cpu() for uuid in direct message request version 2,
and change uuid_regs' type to __be64 because UUID is saved in network
byte order.

Link: https://developer.arm.com/documentation/den0077/latest [0]
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index a3a9cdec7389..4a6bc6520d25 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -483,13 +483,13 @@ static int ffa_msg_send_direct_req2(u16 src_id, u16 dst_id, const uuid_t *uuid,
 	u32 src_dst_ids = PACK_TARGET_INFO(src_id, dst_id);
 	union {
 		uuid_t uuid;
-		__le64 regs[2];
+		__be64 regs[2];
 	} uuid_regs = { .uuid = *uuid };
 	ffa_value_t ret, args = {
 		.a0 = FFA_MSG_SEND_DIRECT_REQ2,
 		.a1 = src_dst_ids,
-		.a2 = le64_to_cpu(uuid_regs.regs[0]),
-		.a3 = le64_to_cpu(uuid_regs.regs[1]),
+		.a2 = uuid_regs.regs[0],
+		.a3 = uuid_regs.regs[1],
 	};
 	memcpy((void *)&args + offsetof(ffa_value_t, a4), data, sizeof(*data));
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


