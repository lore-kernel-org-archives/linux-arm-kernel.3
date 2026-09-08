Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEA7C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1EUKrMISMTfqcQ/oagzdiz4Xj38k1YqAAgqN9V5jxc=; b=MP96jR1wxGPtC7IMGEmU9cgdmA
	8e+MzN624ko1pJiaXaWPreD9RQTlvL/2i6jhjkT/2RQFwYsDMg2rb6Fni23vKt1fUZFp7+UAfpNae
	GipYrayiQ9do9EPjdpTdIF+Ga36MVrxe3sanS3+TxiXa7Nd8BfN8s858+cI6GvhKH4QtKKl0z9hjq
	IGewBA2QBe5tw++bAu9T5488fyQwdxz0jhaIa7vyqiqXfwR5Aj1A7CDFLg9PpvqKIZA/2tyhfLkJk
	mBkWkCvOjs727R3ekr0nNgPPY8WvFI1jeHC3tvhmJqBIlyvrD24Kzpq0eWg1OnGcQ8s9ZpvDp6HWs
	VSrYuplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wmV-00000009Gmq-10Tn;
	Tue, 08 Sep 2026 14:26:39 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wmS-00000009Glt-02Zt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:26:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+zAEpg0bzrJlzowQfLEjzSYuRg3JQjAXqFWQW+aQjcA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788877593; v=1; x=1789482393;
 b=QcQk897CIjxDalMXDHecXXj+jH8HtF0rW+5cYWyGn2vJLJfhH6s3d+VjvR7bALD0mNJpKB4H
 s8D4O+6S+PEamLJSWAAqpOHFPyU6eIB8EXSMtIltcWYN4HYxSgI7ZYQmvY1Cm0tvxmY7maWRuFY
 4K6OYe7jGVZMbdy2Hnf6qltI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6713a1d5765c73ea;
	Tue, 08 Sep 2026 14:26:33 +0000
X-Mizu-Trace-ID: 6713a1d5765c73ea
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] irqchip/gic-v3: Lifetime and range fixes in the GICv3 and ITS drivers
Date: Tue,  8 Sep 2026 15:26:29 +0100
Message-Id: <20260908142632.2795308-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_072636_329263_3B40C7FE 
X-CRM114-Status: GOOD (  11.11  )
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

Hi folks,

Three fixes to the GICv3 and ITS drivers, from reviewing the GIC series
floating around and chasing down Sashiko's reports.

The first releases the partition node that gic_irq_get_fwspec_info()
takes from of_find_node_by_phandle() and never puts. Sashiko raised it
on an of/irq patch of mine, and I said a fix was forthcoming [1].

The second widens the per-device MSI clamp, which truncates to zero when
GITS_TYPER.ID_bits is at its maximum and then denies every MSI on that
ITS. I couldn't find an implementation that reports that maximum, so
this is one value at the edge rather than something anyone is hitting.
It carries Cc: stable because the commit it fixes was itself
backported, so drop the tag if you'd rather.

The third clears vpt_page once its_vpe_teardown() has freed it, so the
NULL guard holds if teardown runs again on the same vPE.

Based on Linux 7.3-rc2 (df2908090cda3).

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTx7eP_30vP47=UFk_wMAut-2uf+2DF-MZqn2SLE_k-8qg@mail.gmail.com/

Fuad Tabba (3):
  irqchip/gic-v3: Release the partition node in
    gic_irq_get_fwspec_info()
  irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
  irqchip/gic-v3-its: Clear vpt_page after freeing the pending table

 drivers/irqchip/irq-gic-v3-its.c | 3 ++-
 drivers/irqchip/irq-gic-v3.c     | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.39.5


