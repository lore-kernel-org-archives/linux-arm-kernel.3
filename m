Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JYQXm7Yg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wkZbXmi1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3QqHYClt7ToralFnT/GQfVCsnVNDggSlumB9ya7MPzY=; b=JYQXm7YgJlhYy9Ft+4lJfI/fMI
	0F/8Cz5eG2TcOQz5wckC7j6QY5K5pfgeP/1OVMcYJJ/EA2xYVi9gtrweCvrEpxXh1u1zb5sr+lGxV
	fpUDVt4ZGdL6zWbbL0ZCgYbU4dWPMgVQ85cuvGsO22WXEJF5Tjm+SmQP4V48g6IXt3tCcvDtwHlbs
	sEX1QDzNMd7n4a9lYN510tlILWwqsDuzZO87fRxk0XYk4MuF7buILOfu0xhqW49FBZY/nIpemWuCe
	JE0VSjnX1S73UqsBKTgGgk1QiflsuyCAooItjRDBWvcx8Z6HLcyXJo3iLCZS9aHlYRAblIixqJNkZ
	YBcVfGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDT-0000000Bh54-1nwK;
	Fri, 06 Nov 2026 09:26:35 +0000
Received: from out-221.mta1.migadu.com ([95.215.58.221] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDQ-0000000Bh4L-3G80
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:26:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=L6Xo26kNAkN33OgBpsLRrRNe1hfi0x4MeG+4t8rMLYg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957190; v=1; x=1794561990;
 b=wkZbXmi1E2uBSu4e4JdIFC0bvXiDSc5nYJXCDuhq4SRIaAVz0XLq2MyVhndTu9mWGeiekzuH
 jMieG6aTvYditTlGsW0wAlu7ZO/SW8L0khEyMdrTivYI2ggmhRpa9VhZfiSO5dZTVOFWKsYajEx
 AtEzwPAS0QLuFHjnhjf/abuM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fc8efab57c5f75a4;
	Fri, 06 Nov 2026 09:26:30 +0000
X-Mizu-Trace-ID: fc8efab57c5f75a4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] irqchip/gic-v3-its: Fix the ITT pool's alignment, zeroing and growth
Date: Fri,  6 Nov 2026 09:26:22 +0000
Message-ID: <20261106092625.3977163-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_012633_026071_5044C19C 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Three fixes to the ITT pool that took over sub-page ITTs from
kzalloc_node(). It doesn't align them to 256 bytes, though MAPD now
relies on it to. It doesn't zero the ITTs it reuses either, and it
leaks pages when it fails to grow.

The first gives the pool a 256-byte granule. With its 1-byte granule,
ITTs stay aligned only while every size is a multiple of 256, which
holds for power-of-two ITE sizes but not for QEMU's 12-byte ones. On
QEMU, two devices with 32 MSI-X vectors each are enough to put the
second device's ITT at an address MAPD truncates into the first's.

The second zeroes an ITT reused from the pool, as MAPD requires. The
third frees the page when gen_pool_add() fails.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

Fuad Tabba (3):
  irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
  irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
  irqchip/gic-v3-its: Free the page when gen_pool_add() fails

 drivers/irqchip/irq-gic-v3-its.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


