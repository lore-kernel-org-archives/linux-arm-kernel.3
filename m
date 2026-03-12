Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE85FED2E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6kQJWjqFVbSDTHbLBiyDL4/cdyiqYcwPStWMJPZ/Fk=; b=UCwM1aO29TdODcIt9Mh0JDeacO
	zp+K7mQU18ko29Za9lt8BMbCbEBJuYdw4K4s0WXnbAZJapCLwBOUCxW4MdLaSfmnMn/rxJq8CnSEf
	eA857qGbAJO8hJMwrju9xnyeDZQOl73IYGu/FL56M/i655tK7Eme1wA2gGb+FyVwyjk+lc63UN40q
	B1NeSZDQDKhQyAyyjfou/7j/xcYgyKAqOJJvcGu45WQzc16Pnwf/DzNMNiAuo9eHkvDD1lHbGCEAJ
	wv069JPt53BupO7hGRg0evE+GLG71DKOjQ+FzXdKoCbkZJGUjSa6uS0soaG27Urwq0SsPU3rxPw/H
	wzqy5xTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5m-0000000DbjY-27X3;
	Thu, 12 Mar 2026 08:08:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5j-0000000Dbhq-2ErZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B33943709;
	Thu, 12 Mar 2026 08:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A04BC2BCB1;
	Thu, 12 Mar 2026 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302903;
	bh=6oxYUlhIPNcGLPWh6+ePdyyXxOdiu08NF6PV/UFRNTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gh5dIoLfVBblTJJauVhG+hFltAlcK7CckK3o6zMjiQuvg0k1xTtJdurG0wSDPK8AZ
	 cXRNkkzwUwQAyzYYjhJM4wVd019RNZ61aTRT0FHx01RHeHp+O+4QGcw00lZrzqwYNP
	 3Dtk38koTTnYQ/2L/9W1GjGNTFS8MJIUOGxnvWII9XeokaRwSJ95voBoa/BLkL5z4w
	 +DNcJc+BVNxMkQTaDC3ydYEhYXcOrZWtzGz6eD21dTtZSwGH2sUn8lCjyKTP/tywmq
	 3b9wPXBZpcfEkThpvYzymZ3BaWVs9f/OsqImGkrn/FIZR4gAWsrb2YtKtx/hNCili8
	 k16v7IPlL3PSg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH v3 05/12] coco: host: arm64: Add helper for cached object fetches
Date: Thu, 12 Mar 2026 13:37:36 +0530
Message-ID: <20260312080743.3487326-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
References: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010823_634911_422FB32D 
X-CRM114-Status: GOOD (  13.78  )
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

Introduce vdev_fetch_object_work() so we have a single workqueue handler
that refreshes any cached Realm object (interface report, measurements,
certificates). The helper receives the cache buffer/offset/size via
dev_comm_work, clears the existing contents under dsm_dev.object_lock,
performs the VDEV_COMMUNICATE call, and uses the updated size to signal
failures back to the caller once the work completes.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-host/rmi-da.c | 28 +++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index fb623e5e5b62..123cda44535c 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -839,6 +839,34 @@ void cca_vdev_unlock_and_destroy(struct realm *realm,
 	host_tdi->realm = NULL;
 }
 
+static void __maybe_unused vdev_fetch_object_workfn(struct work_struct *work)
+{
+	int state;
+	struct pci_tsm *tsm;
+	struct cca_host_pf0_dsc *pf0_dsc;
+	struct dev_comm_work *setup_work;
+
+	setup_work = container_of(work, struct dev_comm_work, work);
+	tsm = setup_work->tsm;
+	pf0_dsc = to_cca_pf0_dsc(tsm->dsm_dev);
+
+	guard(mutex)(&pf0_dsc->object_lock);
+
+	if (setup_work->cache_size) {
+		memset(setup_work->cache_buf, 0, setup_work->cache_size);
+		*setup_work->cache_offset = 0;
+	}
+	state = do_dev_communicate(VDEV_COMMUNICATE, tsm, RMI_VDEV_ERROR);
+	/* return status through dev_comm_work.cache_cache */
+	if (state == RMI_VDEV_ERROR)
+		setup_work->cache_size = 0;
+	else
+		/* indicate success. This value is not used. */
+		setup_work->cache_size = CACHE_CHUNK_SIZE;
+
+	complete(&setup_work->complete);
+}
+
 int cca_vdev_get_object_size(struct pci_dev *pdev, int type)
 {
 	long len;
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 9cc587393d02..c4f31986389c 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -24,6 +24,9 @@ struct cache_object {
 struct dev_comm_work {
 	struct pci_tsm *tsm;
 	int target_state;
+	u8 *cache_buf;
+	int *cache_offset;
+	int cache_size;
 	struct work_struct work;
 	struct completion complete;
 };
-- 
2.43.0


