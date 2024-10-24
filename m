Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF5CE8E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guhxqgoLzafkK+NdizG3et2iwgEsPQIVl8nGkP9yeqs=; b=sHOEdkLuArFYAtvndmx53mnyBu
	UycwP2oWXu4gYymqCn09peO7zufm2dpBh5jaQOXOFYXPxVq6+t2k2oOf9PTZfR1Ym0JiTMlYbFd7F
	w8GhpwoBfhOBNYm+Y9sMHk+uVfRcC7PEl3cefH8Zsm7iELnT13uL/tcpusf0qo3ZuYQjzisAmx/09
	3r4F9FiWqJodVxH6JMIPdLe1+8Fwmnnhmpzm5qakGgD06hU636gpWbq+fAudsvUmWBbdlzR5hq4AP
	z9UaT88uvXcR0ZU4YZpEGYYQo99ngZKkVEPpTYiPn5RGa79ZqXA2OmkU7TydNii2LdTT3uTMmd7FN
	p2l9QESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40ju-000000016Ep-1L30;
	Thu, 24 Oct 2024 16:31:10 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40eZ-000000015AP-0XUI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:25:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4315d98a873so8077625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729787137; x=1730391937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guhxqgoLzafkK+NdizG3et2iwgEsPQIVl8nGkP9yeqs=;
        b=0hjf1ihjUFhDh7vtCS6+x7qBPWyZ1YArq+JFvK9plWwSeUxxn0PLuYfToWRvPKlOtS
         4Uk0zrzFS3H5hJt6zT0kMV8uCK50UXfcwthv3OTRHQyjKajhS/SAJVKLJzgJuD2AJf7Z
         cvItF2p0bejEFWRtbYGLMPyp9vbMeI9qLA5/gumWXe9Bip+0pitEUAEfHPjPm75bOlC6
         Gh3CmHm4K+/Cm8EakPCdSsL3A2YK6+y1dSkzGkfn/qiiE96R3O9kMwV/yEldnRWWaqTH
         uAvJR7N57CFHBmMNzWjf+m3uU3cHL6Qgdp1NQqUgRPM49uplfGel0QclKK5t/t9Xxuof
         fUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787137; x=1730391937;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=guhxqgoLzafkK+NdizG3et2iwgEsPQIVl8nGkP9yeqs=;
        b=he5JBXtXNBsSOTyHn8sX4UOg0IGmwkQtxDY31imApUa53h40SOpvozkeTxiyhJ47gq
         dGlwWDbPajXam2ubFzRtENx1qeWHjxgWEH0TitP4JiBTJ9s01PyHqqPYBWvVbA8eyELe
         nmsQ//Ry1Ipvl4XESKrnj034Dmu98o5TsWIib82E+xOeuTIKfvnNS63+bpUGfl20dcb1
         MJxqxs+p4NaLDgpba0mL/gVu8c4kZccITz3+JM3kBE9Vu5sTlFGQE+MZAmQCJzE6WKYU
         0IaVUJMHxOwHORFx0ycu97FZ59k6nzxDNOQfuNKCZWtEFnzwnz2zPIsO71eFkIyNYSgo
         yCpg==
X-Forwarded-Encrypted: i=1; AJvYcCWRcozIuD8c46iyr0z1DadFjh9WSkVbWNDDLPkdlDJ6/8ycgeQCFySswxRPFBLezC7klZTsTHAgTqIRQP15lVYt@lists.infradead.org
X-Gm-Message-State: AOJu0YykJHfuWtptiltzhoFu0M1DzmwyhVCFR9e4Imzxew6l3UO0l+mU
	j218Tb8uOPtXJlt09ETrBF4om3D12MgpneRyPL0WCOrgudTbpNvjs1eZtKq2RCxneMj9dAUhEed
	YP78yBQhmgg==
X-Google-Smtp-Source: AGHT+IErwzIVqMN+PjdLzUqLsxxxqsZOGGGMsnJi1kecA66UnaTLfYW8QeE2ETnjOUdJ0m1UCN25TK06TL0pAg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:cb52:0:b0:430:5759:867e with SMTP id
 5b1f17b1804b1-4318c76eba5mr266065e9.7.1729787137481; Thu, 24 Oct 2024
 09:25:37 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:25:15 +0000
In-Reply-To: <20241024162516.2005652-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241024162516.2005652-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241024162516.2005652-2-smostafa@google.com>
Subject: [PATCH 1/2] iommu/io-pgtable-arm: Fix stage-2 map/umap for
 concatenated tables
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_092539_191095_31C8BE8D 
X-CRM114-Status: GOOD (  15.42  )
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

When calculating the max number of entries in a table, Where
RM_LPAE_LVL_IDX() understands the concatenated pgds and can return
an index spanning more than one concatenated table (for ex for 4K
page size > 512).
But then, max_entries is calculated as follows:
max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;

This leads to a negative index in the page table, where for:
- map: do nothing (no OOB) as fortunately all comparisons are signed,
  but it would return a negative mapped value.

- unmap: it would leak any child tables as it skips the loop over
  =E2=80=9C__arm_lpae_free_pgtable=E2=80=9D

This bug only happens when map/unmap is requested with a page size
equals to the first level of the concatenated table (for 40 bits input
and 4K granule would be 1GB) and can be triggered from userspace with
VFIO, by choosing a VM IPA in a concatenated table > 0 and using
huge pages to mmap with the first level size.

For example, I was able to reproduce it with the following command
with mainline linux and mainline kvmtool:

./lkvm run --irqchip gicv3 -k {$KERNEL} -p "earlycon" -d {$ROOTFS}  --force=
-pci -c \
`nproc` --debug -m 4096@525312 --vfio-pci 0000:00:03.0  --hugetlbfs  /hugep=
ages

Where huge pages with 1GB would be used and using IPA in the second table
(512GB for 40 bits SMMU and 4K granule).

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.=
c
index 0e67f1721a3d..3ecbc024e440 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -199,6 +199,17 @@ static phys_addr_t iopte_to_paddr(arm_lpae_iopte pte,
 	return (paddr | (paddr << (48 - 12))) & (ARM_LPAE_PTE_ADDR_MASK << 4);
 }
=20
+/*
+ * Using an index returned from ARM_LPAE_PGD_IDX(), which can point to
+ * concatenated PGD concatenated, get the max entries of a that table.
+ */
+static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable *=
data)
+{
+	int ptes_per_table =3D ARM_LPAE_PTES_PER_TABLE(data);
+
+	return ptes_per_table - (i & (ptes_per_table - 1));
+}
+
 static bool selftest_running =3D false;
=20
 static dma_addr_t __arm_lpae_dma_addr(void *pages)
@@ -390,7 +401,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *d=
ata, unsigned long iova,
=20
 	/* If we can install a leaf entry at this level, then do so */
 	if (size =3D=3D block_size) {
-		max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
+		max_entries =3D arm_lpae_max_entries(map_idx_start, data);
 		num_entries =3D min_t(int, pgcount, max_entries);
 		ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, pte=
p);
 		if (!ret)
@@ -592,7 +603,7 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_=
io_pgtable *data,
=20
 	if (size =3D=3D split_sz) {
 		unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
-		max_entries =3D ptes_per_table - unmap_idx_start;
+		max_entries =3D arm_lpae_max_entries(unmap_idx_start, data);
 		num_entries =3D min_t(int, pgcount, max_entries);
 	}
=20
@@ -650,7 +661,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtab=
le *data,
=20
 	/* If the size matches this level, we're in the right place */
 	if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
-		max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
+		max_entries =3D arm_lpae_max_entries(unmap_idx_start, data);
 		num_entries =3D min_t(int, pgcount, max_entries);
=20
 		/* Find and handle non-leaf entries */
--=20
2.47.0.105.g07ac214952-goog


