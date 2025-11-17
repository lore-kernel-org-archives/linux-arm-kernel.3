Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8136DCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6R3X2OzpZkGp4Ajzeh/ixBQq4STUQZLgvyQlKgsTBS0=; b=a0Y4HJTRzd9SIObT8ndvjlxojs
	LUrtnh47m3urn5jd7afpaGUDdNrocDcbpNJjSpBbY1pjgFjlSKrN0FUprwr420Qcqw2CJIk2E6tWB
	al8oNBsRHOr6dpf5pwPMcrgj13aICp2yVT9aMrBupPbObTe2v0tzL3TFQtXO3moGHHvyu9aphyahW
	4VV1SxWHoWAbBQjl9JfgUbtjIn1yFxo0mjtiHk/Cl9gkL+nPGXBiZnCGDKMO2h5JkV6p0WEyw6uoH
	Hxhqc+xQ0A96gkLHM6hb0QF4Et5lIQyXuLwsa61H4nxgFPnxmz1ZOEcFsY+U18uz3vf7XVy3jRqgR
	f4M0CjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2bI-0000000GSM9-26Bu;
	Mon, 17 Nov 2025 17:01:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2bH-0000000GSKK-1yQl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 17:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6R3X2OzpZkGp4Ajzeh/ixBQq4STUQZLgvyQlKgsTBS0=; b=qe9fCcE1MgKKm90Ajvwgxpnm/X
	3/v8m8MRKQawtt0GQ8WmI/pDeq8SRaKkrwvlvi322oB3/8jl82W8nVD+8NjmjKr0wOpzF23Sc79zc
	I4nSfJesg7X5SnHaNxc3fTtqoDc0MEcrkoNPXxnx9EZtdanfZ0lTHm+bj3kBiCcsO0o/JR5ZgjXK2
	ZY6qrfjVB5AsZQwRSz3xOVJAqsVoYFWWPREJ4af9C1+ig85KEx5pBfC7tbye0jkuO9Kwji+z8WCpL
	WasKjlAP972jInPdHOXRhCoUNhzkRTIDQhHAPjH6gcpSgP9ZHClEgbNDI3MlLc22A0QSasnW3mz6n
	McGDrxVw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1ja-00000007ifG-2d20
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:05:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24EA81007;
	Mon, 17 Nov 2025 09:00:59 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF7113F66E;
	Mon, 17 Nov 2025 09:01:01 -0800 (PST)
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
	Ben Horgan <ben.horgan@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v5 07/34] platform: Define platform_device_put cleanup handler
Date: Mon, 17 Nov 2025 16:59:46 +0000
Message-ID: <20251117170014.4113754-8-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117170014.4113754-1-ben.horgan@arm.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_160542_913033_2811F601 
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

Define a cleanup helper for use with __free to destroy platform devices
automatically when the pointer goes out of scope. This is only intended to
be used in error cases and so should be used with return_ptr() or
no_free_ptr() directly to avoid the automatic destruction on success.

A first use of this is introduced in a subsequent commit.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
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


