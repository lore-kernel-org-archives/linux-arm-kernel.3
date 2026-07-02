Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D05C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctptTH3qeDu0zBwzmYmGmqkjzVMSnhropx28vhWEkMo=; b=uah6nfqimLOt7DHKvVW9CLTIez
	SLhcyVvNSCxQJ/KOP01oyIO1+9l//aAf0OFfYZqr5sYnk43mu0IVrWG3CY9cE/eRmjJYGfvNmvANG
	bE1B8uw8JQnCYIc6TUuGvT0wthCdpruFdefgoc7JNXJrSULGkeBrrYLIVsZ/ZaTo9kuhg5XmBsKpv
	Sst2J7JyaQNjrUGKA5/QeisNAOV+rjBhXCkueR43LHTm32oFrH9JaHLjxfkfcLIscRUO2cvhmtzrB
	QolJ9Z8DshB7/DZsBpIlFArAM1L3O1Jz7VCtjILVFe/w0vWBzvsBlxINS1wYcoge4fwRdGP6wASq3
	c6kbXbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKC3-00000004zaV-27Ab;
	Thu, 02 Jul 2026 16:23:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKC1-00000004zYq-2YIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D10D35C7;
	Thu,  2 Jul 2026 09:23:08 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC6333F673;
	Thu,  2 Jul 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783009392; bh=StaJVar/MFIJDg7zd2ZfnqLePqmUuN9KdghK7iL1+YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PzmHFrPk9uPqB7UUnfiAMxTkKxcZU1XlJQ2T+ZOjAu103bzBgImlcmqayqMwt2QFO
	 ZKsRB1i148kNXsuRziWqCjRElsQVWomXmsNolTxieurST2xDlH8Se+Hj/8Tq1wy29T
	 HiBeRQbKy9efF/n4vwQv9B63wQaKcrJR68p4wPZk=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/15] arm_mpam: let low level MSC write accessors return an error
Date: Thu,  2 Jul 2026 18:22:22 +0200
Message-ID: <20260702162229.4008659-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702162229.4008659-1-andre.przywara@arm.com>
References: <20260702162229.4008659-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_092313_728142_09DF1E94 
X-CRM114-Status: GOOD (  11.54  )
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

The upcoming MPAM-Fb support does not use MMIO primitives to access an
MSC, but employs a shared-memory/doorbell based firmware protocol.
Its complexity means that is must be able to handle errors, whereas we
always assume an MSC access succeeds today.

Change the __mpam_write_reg() low level accessor function to return an
error code. At the moment this is always 0, but this will change with
alternative MSC access methods.

Also change some low level wrappers to propagate the error.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c50ca0e4f426..a7adc75a079c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -195,18 +195,20 @@ static inline int _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg,
 
 #define mpam_read_partsel_reg(msc, reg, res) _mpam_read_partsel_reg(msc, MPAMF_##reg, res)
 
-static void __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
+static int __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
 {
 	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
 	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
 
 	writel_relaxed(val, msc->mapped_hwpage + reg);
+
+	return 0;
 }
 
-static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
+static inline int _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
 {
 	lockdep_assert_held_once(&msc->part_sel_lock);
-	__mpam_write_reg(msc, reg, val);
+	return __mpam_write_reg(msc, reg, val);
 }
 
 #define mpam_write_partsel_reg(msc, reg, val)  _mpam_write_partsel_reg(msc, MPAMCFG_##reg, val)
@@ -220,10 +222,10 @@ static inline int _mpam_read_monsel_reg(struct mpam_msc *msc, u16 reg,
 
 #define mpam_read_monsel_reg(msc, reg, res) _mpam_read_monsel_reg(msc, MSMON_##reg, res)
 
-static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
+static inline int _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
 {
 	mpam_mon_sel_lock_held(msc);
-	__mpam_write_reg(msc, reg, val);
+	return __mpam_write_reg(msc, reg, val);
 }
 
 #define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
-- 
2.43.0


