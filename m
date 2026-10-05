Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C21CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD6pTqRDMSfKXNqb4UUFNdsEKglv/1NbFFOX0KLFSbY=; b=nup7+n05qytFFg4OAPl5exTjx3
	up1ubEy4vOZlDXSRjzGi5nSUGrUL4b+Somld3bJaGfmgjTKK7OpfQbQNSr7UvSlrOdu2QtjiJivGr
	uIDsj1YKn4ErpkreQhhYkZBFdl/jMZ9fDgxjh7gGk2LZc7ottO1gp/598fy78oH44VR+MGKrXqPQs
	FYPcjkzIvnUNF5liPwJLNF1ecKmk7t63A2O0DCMr+/9e0oCSHStNzxly+e2dKs3p6krrGyQiG9YYs
	RdfD6dmBTnrQ8glr6gjeSMLK8qjf3XP/xwqWw9p9Y3T8EwbO2wcKdCcmez1RfYAWxUWnALvJBBZNS
	iycWy7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfQS-0000000G604-3Ol4;
	Mon, 05 Oct 2026 09:56:04 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfQO-0000000G5wk-1Xus
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:56:02 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb470so266546966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791194158; x=1791798958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD6pTqRDMSfKXNqb4UUFNdsEKglv/1NbFFOX0KLFSbY=;
        b=GkAas0yLX5topkkg21JlPop6o3SnmbkQyhoMXlWfJppUKtgXENM+nH3djFsmkUU/Rl
         OG+wjJ0bXrm8VsQlWKIAIk4wiX4DpDBacXp9LXts+1glh5cwEQjKRRTkve1GFusnm0WN
         KDcTSzbEPJoIPHXAqV7D2/XpJ8hkcqzDjC/o9eS9E1D6ZzOy7r3/jK4fvjpnwajMWdng
         2lzniA7YSbm2YycOxt9XV5ogxOH192Pwxnyjrxts4vx5MAeOky2L/w0409D3ffRvdk5K
         vmMad2MNswOUX36gL47qc1f3x0xAUmqgyXw2TAV170UYUXlyHnAwwhuFSbp1J2K6L5r3
         jN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194158; x=1791798958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lD6pTqRDMSfKXNqb4UUFNdsEKglv/1NbFFOX0KLFSbY=;
        b=NdnXnSFM7/oy8PtQKnjO5lVFx2ZgUSW3SQVN22npxmGSIG74Kqq83IyiT1KPmgjBXT
         HZxVYWjQYlMIYSP/8+kN7ZE/87vMt3bH5+9c/RpwYZBbMQNB6butgyvxoKRylyBUBUTh
         n7XPNXu2a16la5YuF6LJWaiM4t27nQ+Gl/U00uZCeOFlBSSq31o8Vdi7C9lBh4Qa7+87
         GhyrFu27TgLCfuMsT2WAtjbIBAYjrXNXXySqFcVRQXoCe7H0mOFWGVoB0ph92D06MpHw
         ZT4m7/Kf3E854m9SgE/70HpUi6dOlpkWPkDD/N8qUDQoamxBWpImdnJ7tg9866Hk2bYX
         g8bA==
X-Forwarded-Encrypted: i=1; AKwUvBzl9ZYVdqobthmYU92stFmtEtHMuiiI3SXNRAMRtipOfGwGv1Hcn2M45d4u0ObPMLUmBlXfamoC77wVMBLmjQau@lists.infradead.org
X-Gm-Message-State: AFq9FYLNlsrHEvmciOBu2Ezprbk89hVyRDWinmaNc6OfVj3Qc+yTY25F
	PpD0bIu5EKXJGrZumfmfB/9H7WzFyZoe3Lpm9g7OXGXxNrB3e38K9C+V
X-Gm-Gg: AYBFou20IupdsVu96nAoYrn9hROOpnNaBepwdCaV25hnOx3ELhKM/NVpVpQgQyiUY8j
	a0vjpu5p/voCkouYSArA+TTsBXeTN0MZkKpwDvSKlaBcGF0bbo/X1fhWxg1Xagmu4oQLgL/b8pG
	mBWcQ9wVrYVgDk0Ll4WN4iUVUhdTdaSiikewrj5U0syPBeUawxGPZLDhoKei0Bnmh0q+djIgL46
	1pfIGlExOtKHI9U102T5gcQYdKZIoO0FqHErTGP20Ut+OxEqCkEw4OviKFr5pnGqweXDwheK/aI
	TLaNhqSZGRz5YZ8dMwzwvWQoWVK/qNGijaGoDULF8mvzDL76NzWl5RIyP5bgxBc4BKPETq6yLic
	sA3bx0neji+H+sS4Zg3Lt3OJ7eUBy7ssdSwCz4vTO0HirG1QzQXj3R1DiEX9r5qcZVUhsdlcUiT
	OBK/bPtRzbWcNgYaAedYdFcELR4jPuvUneC0KjSyD/fsyUWdFnrlkHNKppR/0MiX4yUqRytffV3
	n+VOka/qnMTB87BmfGGiJlDMQOJgsJcZu/2KJVBj8xo5ImLOQfk6tUUSxFE5VH8we6rtHhQSFd3
	+5BdOo1z/rtNDebV9BUAhhiu+qeShCR/7Vo=
X-Received: by 2002:a17:907:3da3:b0:c2e:7fe7:288e with SMTP id a640c23a62f3a-c2e7fe736eamr411177566b.32.1791194158114;
        Mon, 05 Oct 2026 02:55:58 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562aba16sm50753266b.23.2026.10.05.02.55.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:55:57 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 3/6] dma-buf: Add ranged mapping invalidation
Date: Mon,  5 Oct 2026 09:55:49 +0000
Message-ID: <20261005095552.52748-4-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005095552.52748-1-griffoul@gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org>
 <20261005095552.52748-1-griffoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_025600_456790_6A69BCA7 
X-CRM114-Status: GOOD (  16.81  )
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

dma_buf_invalidate_mappings() tells every importer that the whole
buffer changed. An exporter that changes one part of its memory cannot
say which bytes changed, so importers throw away mappings that are
still valid.

Add an exporter helper that invalidates a byte range, and an importer
callback that receives it. The callback means that the address, the
attributes or the backing of the range changed. If part of the range is
no longer backed, get_phys() returns -ENOENT for it. Importers must stop
using their old answer before the callback returns. Importers that do
not implement the callback still receive a whole-buffer invalidation.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 drivers/dma-buf/dma-buf.c | 30 ++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   | 16 ++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 66b85d53ed22..e7010163eb2f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1389,6 +1389,36 @@ void dma_buf_invalidate_mappings(struct dma_buf *dmabuf)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_invalidate_mappings, "DMA_BUF");
 
+/**
+ * dma_buf_invalidate_mappings_range - notify attachments that a range changed
+ * @dmabuf: buffer whose layout changed
+ * @offset: first changed byte
+ * @length: number of changed bytes
+ *
+ * Importers with a ranged callback stop using their old mappings of the range
+ * before returning. Other importers receive the existing whole-buffer
+ * callback, which is correct but coarser. The reservation lock must be held.
+ */
+void dma_buf_invalidate_mappings_range(struct dma_buf *dmabuf,
+				       unsigned long offset,
+				       unsigned long length)
+{
+	struct dma_buf_attachment *attach;
+
+	dma_resv_assert_held(dmabuf->resv);
+	list_for_each_entry(attach, &dmabuf->attachments, node) {
+		const struct dma_buf_attach_ops *ops = attach->importer_ops;
+
+		if (!ops)
+			continue;
+		if (ops->invalidate_mappings_range)
+			ops->invalidate_mappings_range(attach, offset, length);
+		else if (ops->invalidate_mappings)
+			ops->invalidate_mappings(attach);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_invalidate_mappings_range, "DMA_BUF");
+
 /**
  * dma_buf_get_phys - describe the run that starts at an offset
  * @attach: attachment to query
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index b223962e20c2..55c3fe60a0ba 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -485,6 +485,19 @@ struct dma_buf_attach_ops {
 	 * required behavior.
 	 */
 	void (*invalidate_mappings)(struct dma_buf_attachment *attach);
+
+	/**
+	 * @invalidate_mappings_range: [optional] a byte range changed
+	 *
+	 * The exporter changed the address, attributes or backing of
+	 * [@offset, @offset + @length). The importer must stop using its old
+	 * answer for that range before returning.
+	 * Importers without this callback receive @invalidate_mappings for
+	 * the whole buffer instead.
+	 */
+	void (*invalidate_mappings_range)(struct dma_buf_attachment *attach,
+					  unsigned long offset,
+					  unsigned long length);
 };
 
 /**
@@ -600,6 +613,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
 void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 				enum dma_data_direction);
 void dma_buf_invalidate_mappings(struct dma_buf *dma_buf);
+void dma_buf_invalidate_mappings_range(struct dma_buf *dma_buf,
+				       unsigned long offset,
+				       unsigned long length);
 bool dma_buf_attach_revocable(struct dma_buf_attachment *attach);
 /* bits 0-7: memory type (a value, not flags) */
 #define DMA_BUF_PHYS_ATTR_TYPE_MASK	GENMASK(7, 0)
-- 
2.47.3


