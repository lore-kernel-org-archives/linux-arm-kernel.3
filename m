Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA41D3B7FD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TW4pHnMBO1/c4qul7ODZrlSjCQpyqWrddGeHrjHgcmc=; b=huKgAb8S1dBsx2aYvjUsJZD1lD
	qgjGcz9gQEOapTJLHxStyfu26Ht6pS0AreD/Kogl0HqPICaO7W1DN9Hl+lx0tQPwPUlzchw3ubkM2
	Q0l/78fZEpo72MorF/gNXMCFYcBLzU2ore3NXn2brxB/8lgp1W9mTlNN7b9Nj8M4zC9IX6ILX8dwh
	i55Pq8Tr44vCLajP6MgLWomXDYrMkdQn4J3dh+bqs+oOuWAajZP8w/I4k14XEAxJWjA7JnFfMmi/7
	FnAn9ZxkTsSm+fm/wLxXsHSZeb1VDs2XQ95EC/KRgktSMx66BF6aq1mdO+vUiQMEMOwhV0QcaadEN
	qtPhBCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWAB-00000007iBR-30mx;
	Mon, 25 Nov 2024 10:17:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVm6-00000007eiR-1vmY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:52:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A93C01692;
	Mon, 25 Nov 2024 01:53:27 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95C7F3F5A1;
	Mon, 25 Nov 2024 01:52:56 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/3] arm_ffa.h: add properties bit related direct msg version 2
Date: Mon, 25 Nov 2024 09:52:50 +0000
Message-Id: <20241125095251.366866-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125095251.366866-1-yeoreum.yun@arm.com>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_015258_541710_029F5D23 
X-CRM114-Status: UNSURE (   8.94  )
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

According to FF-A specificaiton [0], There are flags to be used to
check whether partition supports send/receive direct msg version 2.

Add related flags.

Link: https://developer.arm.com/documentation/den0077/latest [0]
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/linux/arm_ffa.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 3fb9c7a3453b..b697675c76ba 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -238,6 +238,10 @@ struct ffa_partition_info {
 #define FFA_PARTITION_NOTIFICATION_RECV	BIT(3)
 /* partition runs in the AArch64 execution state. */
 #define FFA_PARTITION_AARCH64_EXEC	BIT(8)
+/* partition supports receipt of direct requests version 2 */
+#define FFA_PARTITION_DIRECT_RECV_V2	BIT(9)
+/* partition can send direct requests. */
+#define FFA_PARTITION_DIRECT_SEND_V2	BIT(10)
 	u32 properties;
 	u32 uuid[4];
 };
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


