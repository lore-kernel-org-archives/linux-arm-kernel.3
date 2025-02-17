Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83D1C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5Gz+eTflbpmy1n1NWxy8gWni1C+C4lEteb9Jr1lcBQ=; b=NKcVvgMLcEXxiXoyM/c2otw7Xx
	+iPECMNImCCq9pirnC7FiL4IT9PssMlDnzkh/FkaxSrchW0HB3b0Z7WJmQcefrmL8IFy5ImXgttrt
	2Y1yIwJO/x7roKQ4N4LtW3GfaLnMTB+bm1bNYfQbiqfRuEuTCQSUaGqEyQGKFb0SmvmRn/+e70aMl
	YKwf4mDtkuDUaNJQyT//uccCDj9KAysGft59SWYaDHaeFr54W6Xar+/8DPVXwpIwWoGI6xQBB+Ct1
	XbsEO+LAZOdSUPZpTBs2A9yXuBcJ38DZ9nN5BqaGxA9Eu4zYuFaR47LJk97VsvbDnwGSdlBQYCi2S
	QZTHOGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3YR-00000005BUA-06WE;
	Mon, 17 Feb 2025 16:01:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3De-000000055XP-15GO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41AE7152B;
	Mon, 17 Feb 2025 07:39:57 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D1893F6A8;
	Mon, 17 Feb 2025 07:39:37 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:50 +0000
Subject: [PATCH v3 09/19] firmware: arm_ffa: Helper to check if a partition
 can receive REQUEST2 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-9-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=zb/wqtoceP7rQokuw62BwnrJfaGX30KLx6uKJCNJ5iw=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1guSUwasvblxx/05UyIRKxy/I2B9unSMhxyG
 raJkTYz1OSJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLgAKCRAAQbq8MX7i
 mMp8D/4/tj2RDchJ64EabNb246U+JEB/pRicqivUqcuoWmC3Tsy4/aSFlfVEXIZmuhg/ilgVQ4e
 2kTvf/7GSfe6YiSvES3quVM0Wf/LUD0KrRdlFBroWG0iHKc7e/VE3lwjaZEYanb8iKy5mqzJn6i
 8HpvWx1N3ginxjHPAJHmmJ8hrPsU7C68YUOF7yl4byyqBn7csqg/W3dt3cjuIuhC2IRG309CiQI
 kf3N50b2GxkNe0z/Pire1vXcgzpVGsdmuVBJAAQdRMo+RNi9URFSje7Ka69uGoiv1UBGWE71cYr
 0wPKPVLZv7C1yiYmPzrOL7lrvn7adANkfT7cp3mmgdkyb4s6jEuCGdLPZzctEzqzyDj0KbMXYWh
 /8OaoRlbcQfaPVYO3ldgrQ7GlcIgcfiI+O0VwYQD7BkaSbbbfrUmr4Ml5OY2S+BAHoaMFDxzZB8
 42c9ro5qWFg4X/zoztQN7561Bj+ndVzjcKuKq+FT0OJs13AUTv5pBgZ9y4qiYyCTl7OjvBvkjFY
 xLPB2Go2S5os3L2NcIIbW63S2BrMTKIdinK2VwfR7DkU4TABTJyU942nB19dzE50sjHKhEhSn9M
 S5GXOLQDumOIsx++hDCMhUyOUxyeWZlysx4AcGZ0kjc1VeqkDL0MEFBpom57pvkKScjJ5JJvRcy
 QTijAplkgLHANMA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073938_341826_34D09122 
X-CRM114-Status: UNSURE (   9.08  )
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

Add a helper that allows FF-A drivers to check if the partition can
receive the direct requests via the FFA_MSG_SEND_DIRECT_REQ2 ABI.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 include/linux/arm_ffa.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index ca2ad5b0ac4309052d55dcf546d29423bbd40a67..761ea8fe3bb6080c893a5eb365358b62d6a4f3ff 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -240,6 +240,10 @@ struct ffa_partition_info {
 #define FFA_PARTITION_NOTIFICATION_RECV	BIT(3)
 /* partition runs in the AArch64 execution state. */
 #define FFA_PARTITION_AARCH64_EXEC	BIT(8)
+/* partition supports receipt of direct request2 */
+#define FFA_PARTITION_DIRECT_REQ2_RECV	BIT(9)
+/* partition can send direct request2. */
+#define FFA_PARTITION_DIRECT_REQ2_SEND	BIT(10)
 	u32 properties;
 	uuid_t uuid;
 };
@@ -259,6 +263,10 @@ bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
 #define ffa_partition_supports_direct_recv(dev)	\
 	ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_RECV)
 
+#define ffa_partition_supports_direct_req2_recv(dev)	\
+	(ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
+	 !dev->mode_32bit)
+
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
 struct ffa_send_direct_data {
 	unsigned long data0; /* w3/x3 */

-- 
2.34.1


