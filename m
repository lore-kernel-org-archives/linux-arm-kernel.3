Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C285E64AB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M2SoJtsRrMtj2OOwan2y/ckBEWuniVttrnRvdk59R10=; b=O0ECoOq57S4l7p/ixDYB/QqwJg
	zIvd4YcPfhwQodNY/kMQ++XtDDt+Dt9VbiXQvOdA4kMJTSlFF5ITbnq56KV9U+zTcAHAxVLrF6fYO
	wXe4gfmfUTplj6+KXBmhoxceS7YqYxgIMLZYPAPs0YR5q4/Km76GGO+cnXODP2r/I+F56xr1sJ2Na
	saX1xjT+aIaYn72a21OqFxxWT0M8wGP/PZdRbuSWekwdh86aBbK1meSYoCzQ+BtfigH8U3xH7YB8t
	iE2KzT0Hm0Cy5nyvR4zhN12BhYZZV51ta9rYydGOpN7XW35R8nRqTT1MnoryOfDoc1jmcMUKp58JP
	UGqO5Khw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITwm-00000009moe-4A0J;
	Tue, 03 Dec 2024 14:32:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITvm-00000009meO-0upH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:31:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43FA3FEC;
	Tue,  3 Dec 2024 06:31:40 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F5A73F71E;
	Tue,  3 Dec 2024 06:31:11 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/2] small fixes for arm_ffa driver
Date: Tue,  3 Dec 2024 14:31:07 +0000
Message-Id: <20241203143109.1030514-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_063114_298826_B7057004 
X-CRM114-Status: UNSURE (   6.05  )
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

This patchset small fixes for arm_ffa driver:
    - change ffa_device_register()'s declaration and its return value.
    - fix direct message request version 2 uuid setup.


v1 -> v2:
    - Restore error return in ffa_device_register().
    - change type __be64 to unsigned long to suppress warning.

Levi Yun (2):
  firmware/arm_ffa: change ffa_device_register()'s parameters and return
  firmware/arm_ffa: remove __le64_to_cpu() when set uuid for direct msg
    v2

 drivers/firmware/arm_ffa/bus.c    | 15 +++++++++++----
 drivers/firmware/arm_ffa/driver.c | 13 ++++---------
 include/linux/arm_ffa.h           | 12 ++++++++----
 3 files changed, 23 insertions(+), 17 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


