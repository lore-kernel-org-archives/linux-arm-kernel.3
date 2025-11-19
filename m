Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A2CCF31B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8CZtcZtfK9YxmHo2+k/ytt0Ypsfw0BLqGZmorBNhqg=; b=J3DUBOhSWdQRwjYk4WXr53dNKu
	2Nin69h4QNpl89e1qO3lfDunriy7NGoRBToZjZTI2tuYIWbs/X1e5OfNM9FLj2vjOFL4ltdlhCz4G
	V4mBFDnPrrGxJaeq3yAznNxli0aSUInj66cD4sn3HZ0XRaIib8X1qWc7aHS238MmJ54tPKZFcTuSI
	+ejJipzoDnDj13RpCrSG4H7abERfLrCzuNzRTZSoDRQLH8gHTX2QVf5ZX/xsQJQ8BorpPaxrMecoz
	vniqwih0tAYHg9EJ1Eo5tr5Q5qaGQSC8aQJQjcGY55h3CzQHnrJChUbIJkbmke1VSWRLsxpUPMz3D
	VMUTvmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhEI-0000000370N-36xe;
	Wed, 19 Nov 2025 12:24:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhEF-000000036yB-2kqE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:24:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 530C6176C;
	Wed, 19 Nov 2025 04:23:59 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AEBAD3F740;
	Wed, 19 Nov 2025 04:24:01 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	reinette.chatre@intel.com,
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH v6 07/34] platform: Define platform_device_put cleanup handler
Date: Wed, 19 Nov 2025 12:22:37 +0000
Message-ID: <20251119122305.302149-8-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119122305.302149-1-ben.horgan@arm.com>
References: <20251119122305.302149-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_042407_757309_235B738C 
X-CRM114-Status: UNSURE (   9.64  )
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

Define a cleanup helper for use with __free to destroy platform devices
automatically when the pointer goes out of scope. This is only intended to
be used in error cases and so should be used with return_ptr() or
no_free_ptr() directly to avoid the automatic destruction on success.

A first use of this is introduced in a subsequent commit.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 include/linux/platform_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 074754c23d33..23a30ada2d4c 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -232,6 +232,7 @@ extern int platform_device_add_data(struct platform_device *pdev,
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);
+DEFINE_FREE(platform_device_put, struct platform_device *, if (_T) platform_device_put(_T))
 
 struct platform_driver {
 	int (*probe)(struct platform_device *);
-- 
2.43.0


