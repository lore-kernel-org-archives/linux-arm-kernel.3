Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D686E64AB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx3jveoVMNXvuWGnRjziRcHIFEYg9azwRG+pcSoZjIc=; b=uRa7n8UcLtl+mLyTNCFr5vMIqp
	gbjAYC54VuF7u5qrOHRHx7HHk4xzVur5zwXUQmrXICmricTA/I/XMxRB18+9j5OqTcEQdqnizEw1F
	mq4KY3gLUhg2pnspKgydLKkAxFmxn9iYiq7e4yv4GFVB9clbuIOrm8nHwxYMji0SXAr5+p3D7DTAz
	75C5QdSZXhfW56p0arBIFhcz88lyliRM7kNW2eBvHHZdTU0nVKouF3PK90JPRXofnWKwP7XpGVx7y
	Lj061v3C09G6pFQNkLz1hBUCHbx6vUnEizTmalfB4LDgA64tWMFKiuxCYd9PH3rprvt2faMMfGGZU
	UwYXZTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITyj-00000009n8x-3DIi;
	Tue, 03 Dec 2024 14:34:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITvm-00000009mfG-3fYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:31:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8908A1C0A;
	Tue,  3 Dec 2024 06:31:42 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE9C43F71E;
	Tue,  3 Dec 2024 06:31:13 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set uuid for direct msg v2
Date: Tue,  3 Dec 2024 14:31:09 +0000
Message-Id: <20241203143109.1030514-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203143109.1030514-1-yeoreum.yun@arm.com>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_063114_954896_7A491D95 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
and change uuid_regs' type to unsigned long.

Link: https://developer.arm.com/documentation/den0077/latest [0]
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15..8bfeca9d0d2a 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -483,13 +483,13 @@ static int ffa_msg_send_direct_req2(u16 src_id, u16 dst_id, const uuid_t *uuid,
 	u32 src_dst_ids = PACK_TARGET_INFO(src_id, dst_id);
 	union {
 		uuid_t uuid;
-		__le64 regs[2];
+		unsigned long regs[2];
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


