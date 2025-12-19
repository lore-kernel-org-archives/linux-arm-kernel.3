Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43152D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4EQuW27BsfArfJXbeNcoqWE8IkH3XTkHffs0mvyG00=; b=J/d23ldhbryRvb08TJcSdhOmwV
	SLYPBUXuW9UDgJDY5NQS+dekRHeVgBM+GrVgIJ7YY9F4ZVKQVzebPPIjvyEgaGtPzcI+rOGUWjffo
	+8amMPnXA043hFdw31+NxFf+QVOn1QWZnWQzm4jVCkxGRBKZ7ooUnsjBWrvPD8S5cTIAG8GdlGFW2
	STLrdpbk2hs9S5jbRf4CpeSbFotFZ5dlJIft1q4TSv3J7AcJsyzDXu/2+aSJDWXcslWQIWWU5huF+
	oPxE/fpfG6fgGJCA24vHmJ4DhdbangUepdzM9ZNlaJJybXj1HhVyEOedekep/qRSaXDmbMVeRKAVW
	DKBwviVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWexb-0000000Aksf-1RuS;
	Fri, 19 Dec 2025 18:12:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWexY-0000000Akrr-3dh7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:12:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E413FEC;
	Fri, 19 Dec 2025 10:12:04 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A80D93F5CA;
	Fri, 19 Dec 2025 10:12:06 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH v2 02/45] arm_mpam: Remove duplicate linux/srcu.h header
Date: Fri, 19 Dec 2025 18:11:04 +0000
Message-ID: <20251219181147.3404071-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101212_952855_8AB7523E 
X-CRM114-Status: UNSURE (   7.93  )
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

From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

./drivers/resctrl/mpam_internal.h: linux/srcu.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=27328
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Acked-by: James Morse <james.morse@arm.com>
[BH: Keep alphabetical order]
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e79c3c47259c..17cdc3080d58 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -12,7 +12,6 @@
 #include <linux/jump_label.h>
 #include <linux/llist.h>
 #include <linux/mutex.h>
-#include <linux/srcu.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
 #include <linux/types.h>
-- 
2.43.0


