Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E79C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5arVEzRstmj4jIE2jTDewt7EmeMAVo6XPFqyQD0zqYM=; b=T0AIYElVveVIuSPiMqx/wf/5mx
	KIG5B5OCnApryaqnLcaQV842qRvfE3nx6MZ3pVLh3WdoSxB69oB53zmfi3RiwWQlzgRqarOjd3jCc
	ReP9zqbJffiavoLSmnw+dZP2m+K4EtiqkATvgLQi361s0NNMZlSWB6gv0EsADitlPTwRhcXzuOmGZ
	wg6TC1d3ipY2mf9zgEK+XpZFLGnv/tXAcINhWkYDouQBFznh3R3EHJEDZAPEeDQ9Fk5Ee6Kab+tQZ
	2bOCNu3Lq2bNMwB1mIH3+esdM5wZazGRnNLiLhMaNnar2tG+aJYW/+NqQyxH/cN0EEFsCp5WnGlIh
	7JqkGPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0MJ-0000000BNhl-2qAM;
	Thu, 20 Aug 2026 10:50:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0MG-0000000BNhB-3fQw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:50:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62090153B;
	Thu, 20 Aug 2026 03:50:45 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A10D3F66F;
	Thu, 20 Aug 2026 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787223049; bh=s+cclRtih9v6Hs6kBVo28nQebq5TpBMtlvcObiYbvrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mlwwcH/aloHp948hET2x3PglkjTmwV/C1vkj4LhUjCsvHCVxnIRjXXyQwKoBYSh4b
	 W+TlkspsuCda4N8/HpdlCseT+Wzo469vRfIBo0hw8qEsFKeS3KGD/R2gvOJo0XQPrb
	 myWmYHFHFnn8mQ0++38cbrZszC/fDjicPCDrukH8=
From: Steven Price <steven.price@arm.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH 0/2] Clear shared pages after private-to-shared conversion
Date: Thu, 20 Aug 2026 11:50:23 +0100
Message-ID: <20260820105026.53208-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035052_984287_B7B2BA89 
X-CRM114-Status: UNSURE (   8.22  )
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

Arm CCA includes "Memory Encryption Contexts" (MEC) which allows the
private and shared data accessible to a guest to have different memory
encryption keys. Consequently when converting memory to shared, the
memory encryption key used to access the physical page will change.

Both the GICv3 ITS driver and the system_cc_shared dma-buf heap
currently allocate memory with __GFP_ZERO and then decrypt it. With MEC
the zeroing is done with the wrong encryption key and the data visible
after decryption may be ciphertext. The RMM is required to scrub the
data, but may perform this scrub with a different encryption key to the
eventual key that will be used for shared access.

Fix these two sites by avoiding the __GFP_ZERO during the allocation and
performing a clear_pages() call after the decryption.

Steven Price (2):
  irqchip/gic-v3-its: Zero shared pages after conversion
  dma-buf: heaps: Zero system shared heap pages after conversion

 drivers/dma-buf/heaps/system_heap.c | 14 +++++++++++---
 drivers/irqchip/irq-gic-v3-its.c    |  7 ++++++-
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.43.0


