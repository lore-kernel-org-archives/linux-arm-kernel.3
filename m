Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B00C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kVfSRKqT8SsnmSHCUnkWqFaLFIZgjfXs94LOx78i7c=; b=VvjbfuHBh9Dlkw39RIbtoOMgYn
	+i+gTUrg7AK1xrSO3+XW3pVoNWOE55J8UIkcY0xlTVV1p8qP9BFd22SN1Gb+bk49wryFArwJpgIOZ
	Og4+bVZUIbpgMlEDAF9rSPIO0eET8SNrsbDNn4n5AV2S+B38mpE1rl1Z0sFJ6Um5mmzf2Ib3byfXt
	Rtu49ozTdrOWGoLA6gVhSRRPeG2YfSNgDlwrBqCn4wFTG88FkNdmXAlSFnn2fJfRkDo5mRiGGMngw
	5c4BmST9DlCBUc/cEbrwUMJNQGHb6aIB5qJtsiZUy+rXigAvS9ZFKTkKh4DW5tpYN5RyYBva1ML8N
	7Eg5ACyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7fJ-00000009ewg-41TM;
	Tue, 06 May 2025 02:04:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4eL-00000008sgo-2tYd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A41F629C2;
	Mon,  5 May 2025 22:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20982C4CEEF;
	Mon,  5 May 2025 22:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485460;
	bh=Z9LX6s23ZuIXyzShDrnweBPy3s35tSG0fmfwXhPvyag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKySiQYZxcB3offOww41/agfyooS+ED8J3qnkljU4ffY+u2WpZ5QZud+VuUr9QmwT
	 ssal1PrBIG1EYx/WbswjJYDNeedm3iNUcZuPWinxBKxyEl22kDKLKyw5U1X/JSi3IO
	 O5mIlvbZHMKCYSgRsJh0zI/xGRnqLGkc31cNif5Q4I/DPx9DbUBiBbCPlxynonzmxC
	 UHmd/XDcqRnDg0Q09NUQ/L23tQQTYOUw+ohUdC1euHdvlBjFS3ujbClT2UGtsgJqf6
	 RFpPDytPJ9bsK4qKAv8yhsDQXGmK3QFvg9x1f01jfDm0qJ9MetI0hmS9VJuqLU8ds2
	 Jv6jkqxyMLP0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 324/486] firmware: arm_ffa: Handle the presence of host partition in the partition info
Date: Mon,  5 May 2025 18:36:40 -0400
Message-Id: <20250505223922.2682012-324-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

[ Upstream commit 2f622a8b0722d332a2a149794a3add47bc9bdcf3 ]

Currently it is assumed that the firmware doesn't present the host
partition in the list of partitions presented as part of the response
to PARTITION_INFO_GET from the firmware. However, there are few
platforms that prefer to present the same in the list of partitions.
It is not manadatory but not restricted as well.

So handle the same by making sure to check the presence of the host
VM ID in the XArray partition information maintained/managed in the
driver before attempting to add it.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <20250217-ffa_updates-v3-7-bd1d9de615e7@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index e8efa6cfd58cd..52e1cbaab856d 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1448,6 +1448,10 @@ static int ffa_setup_partitions(void)
 
 	kfree(pbuf);
 
+	/* Check if the host is already added as part of partition info */
+	if (xa_load(&drv_info->partition_info, drv_info->vm_id))
+		return 0;
+
 	/* Allocate for the host */
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info) {
-- 
2.39.5


