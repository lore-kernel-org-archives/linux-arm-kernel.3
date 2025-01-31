Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1F7C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66sB2dOA/mj8YLTysd0+acjeEnRU/o0CfX5HEN6hopw=; b=SdTh/vazC53MXgbefwswPuBCyi
	/qiMpgZ8zRfgnuaF412SAUAle8OtlDG4BOSjs1fZyilJ5tuT0P97A/LOo9KiilbOJnbsov9+DFU+5
	JZSpFzUdehetDNj7WsjLr0siApmww3zCCsFUhWcVSGrv223prfTPF8nxDwmy3PpoILUQvDi4ERsjG
	8GnHy1TqogLFcmlYrsGoObCZTRpIHxnZczoqmNHCu7dU0InxrXua43yZKcK+agHbed9txC6R8X+MN
	F6e6gAPrkIWBag3iZ6VKbl4lHqfbB2o/3Z5q2iOOEO+UqEOQn5RrZJ6pKVAYFPPWA9GVZGAWoA4sn
	iy/jIUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpLs-0000000AWTD-2PNc;
	Fri, 31 Jan 2025 11:38:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp99-0000000ATpp-35IR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05750497;
	Fri, 31 Jan 2025 03:25:41 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52813F63F;
	Fri, 31 Jan 2025 03:25:14 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:09 +0000
Subject: [PATCH v2 09/18] firmware: arm_ffa: Helper to check if a partition
 can receive REQUEST2 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-9-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=G64rfImpbF1FYzyYP/gR8hcx9nPoEHeOmwT4HxZwJJs=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQBBTTtnffuet9l2+whZjxfNSeTSb6KoWvk
 SGzsRKCtBmJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mNdTEACWqF8ZwLi5yHJXwb/LhPoAIwDMgMqpsuz7af0FGXblGxFVhmRdTUjmSmrlfDQ3W93QAaT
 qveCYsxwY3uAkbIgnY058DM+rvVB9AJlGN0Dgvtzv/DaP4dUtqWaAsinTXf5iL2TdkbrwKR2byt
 05gsqi3AzLjII1yiJz7jGIrbxyXrth6vPZicD3jQOxTdhCPMXcQ9EoYzKFbfd4nZOZrUmzq18d5
 SDtcS2eiD4di8Kj2GS74U7vH0rlhYsgzWfS/yKM6szVYR4iuFIHc/w2I9+Kx2YTU5S3Uc8jgX2v
 H8ejmruD60cUqCcHPfhheFR+UqA09XaPu6cbqKa3bIP5DSug5v43C28uHJNJtVnzB09WL4XHw9D
 RCh+Rr7fNLrZaTEYjathiL7D6mY8PphFgV2qL2p0e9jVJoRZBIiRTauud3qVCGf18zsfaJCqtvd
 ttqaoUivbbsFFAmZ5CaZ6smW4aIKYqU3lDFzzu62Yk9LKUcZBgXTjpU1Q4/Xm2x81KeOYTvWeHf
 CGeKR8HWqdyWfnc6Bgh/hIwutjOtm8/rRzblmMfDLb4LAUlFU2r9MXJBBXHtLCYRKW7RfE4aN0l
 aPsdSIRqoptUu2RNHmkMAk81pQkoMk9kSdIf3P41edlECtKb0VEubvd3lL5I7YXYnpb1sid4MrA
 QC06iw8whIcVtwg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032515_814049_F0804BAE 
X-CRM114-Status: UNSURE (   8.99  )
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


