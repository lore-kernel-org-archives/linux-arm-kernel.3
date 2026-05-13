Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5195CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4gZFEOmN4BitsxINTjrbRsNtg0gv58NYoTuWrSbwJg=; b=xSHkahj+uSnHFC//VI2uvtiWVa
	s7486+myuwtyK8ZMMR4bZ9sqTzs57DP0dqAsivyfAMmJ4EViDwVQobxlQsbrAndOzSQYigTHYJbXN
	2iKgrEncLC/X1xEN1JtQrJlpGC1eogKYlqp2vye+f0pZWHoONO4XuJIS37SS9unJDJFj2wz2HwOu4
	h7Z4WylKH/LN0yFSyoScptVAKDLVt90AntpUpKkcKZ/zrceC+aVeYZ350HYtQZXDGeJetzUpDnNvg
	AYBLi5Ei9RZ/c16ODP7DbGRK6ze9RTCyTMt/ez3AIF/Cs4COoYyAIpBg6VYK2ywqJLIiunAxHKKqN
	o819aVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVj-00000003rsE-2eYG;
	Wed, 13 May 2026 21:52:59 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVh-00000003rqL-1QCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:52:58 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45d7293c595so401786f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778709175; x=1779313975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4gZFEOmN4BitsxINTjrbRsNtg0gv58NYoTuWrSbwJg=;
        b=XDP+vgYlhiDjD6Lp3SoDVkpc2P8q7o39mtJh7M/TcaxxEQbf2u4JGcAGWsx0Xixnvq
         ObASGH/uYIY9wGZ+Sqc+oEGN0GgF3IKXOvmLxL+noplgWnsze8prcu7Bm4H3rKuorUN1
         t0a7g12e8JME5TTjtACgCTaedFlGxP0UpxVlTxy5rBPCvuq18AyVDEXDe9mcq1aaLHuZ
         UB+5gZTT7DO+YFpQPJp9I800i+zZsT36Z1ln3qHeMZiQ1ejB4GWkKvu0212nTwRuecuN
         usIZAXd0RCejWm3xZ3wQ72iJRkViakD/fXDBTnpITOr88ZoHllVLp+jQ3zaEgKK27BQv
         iTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778709175; x=1779313975;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B4gZFEOmN4BitsxINTjrbRsNtg0gv58NYoTuWrSbwJg=;
        b=YLMMm0se4TPInuqyfvP9t1+PRGqSOK1hgNCh1gjbqyJNdFQ4K9LNShwlrVHDH8a1yV
         2Tbodo/kZelYjl/oSvvOrjxqmccwgMhD6lXImlowFZnRGvUS14anu34Vtp+bLrrwndrL
         MH2VjZoNid7x1SQEbtdCU4FQL+JZqidceKUKJA3SVotMpLDH6eZVRa6cLcA1u0FUpPn6
         w9kf8OCEMa6ZO0jz7n8enb2sVE3CR10oTSjetXzZBlVZ7YjL0SJIZW5iR1WyneFo4rpo
         QcO4aCqQP1yJ7zXJxGkuqhHpFehkCIskjAdw1Y2lWQCgliGYwIk3zlgMQZa5wdQiiraw
         3h9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+4zdDdU0dAOCKYxLlaFPqKaljWrk7AWTtOiHbecBuSKEHngHPw/TQTjdhnB1CJhI+Vxz0eoxwK64w6Xsy7UZHV@lists.infradead.org
X-Gm-Message-State: AOJu0YwHULmELC0w9ICM4xvb2u/p9gPnC/IXNVNBltVx+AItGGc0aEt8
	j5fq2YJ+mMjjjtOvRq0Z9FBs4LShrgJhtgFnyLzGe6gAOe2RAmAXlbXQZXwA7bTJw+YTxVt5pPR
	Yna8eA8iGRdZKCQ==
X-Received: from wroe2.prod.google.com ([2002:adf:ef02:0:b0:43d:6fc6:5521])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2486:b0:44b:e349:e6bc with SMTP id ffacd0b85a97d-45c77b7bacdmr7661958f8f.3.1778709174704;
 Wed, 13 May 2026 14:52:54 -0700 (PDT)
Date: Wed, 13 May 2026 21:52:03 +0000
In-Reply-To: <20260513215203.3852661-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260513215203.3852661-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513215203.3852661-4-smostafa@google.com>
Subject: [PATCH 3/3] iommu/io-pgtable-arm: Use address conversion consistently
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_145257_392785_8DDDEF72 
X-CRM114-Status: GOOD (  11.99  )
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

Use consistent address conversions in the driver:
- virt_to_phys(): For all virtual to physical address conversion,
  convert __pa users as we don=E2=80=99t need to rely on it type casting.
- phys_to_virt(): For all physical to virtual address conversion,
  similarly, convert __va users.

That changes nothing at all. However, it will be useful when
compiling this file for the KVM hypervisor as it can cleanly
replace virt_to_phys/phys_to_virt

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.=
c
index 86b23aa04324..476c0e25631a 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -143,7 +143,7 @@
 #define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
=20
 /* IOPTE accessors */
-#define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
+#define iopte_deref(pte, d) phys_to_virt(iopte_to_paddr(pte, d))
=20
 #define iopte_type(pte)					\
 	(((pte) >> ARM_LPAE_PTE_TYPE_SHIFT) & ARM_LPAE_PTE_TYPE_MASK)
@@ -429,7 +429,7 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_i=
opte *table,
 	arm_lpae_iopte old, new;
 	struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
=20
-	new =3D paddr_to_iopte(__pa(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
+	new =3D paddr_to_iopte(virt_to_phys(table), data) | ARM_LPAE_PTE_TYPE_TAB=
LE;
 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
 		new |=3D ARM_LPAE_PTE_NSTABLE;
=20
--=20
2.54.0.563.g4f69b47b94-goog


