Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A28CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=; b=CHER4iyRwuVwQwF8ffOVoi3P4h
	dh/QgtRvb7+DhSsCz6egaAUxZ6kV7nxXIA4NaqJGrRPrr+seSZCpcjG76UEMMWgAeHicTnNDeaTXg
	oWxvtyy1hsif8m4Q5wumplxcoAnOjFwkZzGDByzLpdAxHhYXMTtVtOAhogtuX9+M+TF3eGyDnkmQv
	wmkR4+3UFSZqKhyJffa5dH4V42U6WvTsQlItMUbzT8RpqGfFsjXsM/islKuFiS3+4mxwlDKbX7MRM
	CZoddrhOvnFKrRRD2bBJH5gNBS+Qju0joXbNGs4feGTiE3LdPJYK/CT77xx3iDj96gyhn4ngVYuzP
	gkeqwTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zh-00000003GDW-0jbj;
	Wed, 27 May 2026 03:31:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zd-00000003GA5-0Clw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 03:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=; b=D/cFipoL+i8syv7pdls6sanpjz
	PS7IYw7P5gmsUv1IrKaMkVFWDPSco9VCSelGpXAGtDvX2egFXMrjoiiPRlczH36VFc9UibdArATAm
	e807iUxlLhpNMsywq7l0PXDvv6XvUh8lSrQIE5wQ0LT5tdxDnU0/46vQ7nXlZbNFfBGLZiXVInfcr
	JGZAsLIbmazC9gTwP7OXjmZHt/u2imowKcLg+6f/hzPjlW7Yh97zPkfRw696spjX044OI2XgUz0LV
	amvjqU8Utp1yZnEneQhCg2j0uPhSDvLqzfN1ZoGiDFogWfmYJjit05omvOpT+VUFDgUfcycgELKPD
	Fgnc+l2Q==;
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zZ-0000000CqyY-2ntT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:31:39 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-837dfccd950so5231871b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852696; x=1780457496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=;
        b=blf/MMtZ4GsUxGzz2WFUPCJ/Y+JiH80/1wfva7NQ9KlfDRI22vmrFMVYHu+I2HCybB
         Y7tbubCdC9bJnNH3NSY1RzXEIZUysu+g5aOQV/uer95zx+3gzAWjO5pLs8esjHyVdz4H
         FGoLEcBFymAN0jaFDa7RKMf8GfBJA9dYihsTlPGL4pAO10mXZTy7TW3nMmHeXBRSVZK7
         RRnt1wPbW32iSpxZbFTvUDyVcy2+O0WNrwxjSlt8gN2vvVpbqsdQCLGgnagjmNcFvb2E
         N7PtozNe1LDxyhq6kXNwASa+ua/rWmEO5BNdFRenl3RLIqvwlmCz6XWKY2Z7j7lbaAOW
         RuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852696; x=1780457496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=;
        b=jBbiAqni3lqBtfhBHp/kZVvMwj/k1oDiMRvy8JXaUfoDtRISf4mABIRmop6dp0tYh1
         LVxE9XkVMrpwoyqrlkQ135Tyg9xHQRfvUV35fhDcJHmdiWSp2noINhMxpEKcAuTbYM3i
         heNLcb5jbBGSee5WnCJXP2GqIqwBs9AuI1r8O67D1LVK+Sew0p0xAScDnqXPkDtyNl8m
         yRRw+5m12ZBf3QzO8G8tzv/lyGjUeLsYTLfEQGrOoHxHE+ZK55Us+n9qse0k7B8tnJdK
         UUHhKsnKHsQY9cw2LxNNHecIAxrC+K/8ExCcqMAw53uH9YUX+YnPXN/tW8/M5TedJeCd
         kBLA==
X-Gm-Message-State: AOJu0YzR0SnwQBSyvhMkZMsEoK622EDLFxtubnOLwk9eBI/4K6bvYYQE
	mIjgRqbHRxHD6X/uARLHgDGRHZAjzTMv6wPiDSflSLSaSIZ07zgtS2ZLzELxe1EE0mJVWA==
X-Gm-Gg: Acq92OFRfyXGM7PZL2TVgvPxFETzGbos3jOgQNy01IPg3v1VOUddNNWEPRdRaWBXPCv
	DdAaZOiAuTyeHwwxgJlkl1TtzGD5AzXl+llsuqT85+imHMpZo5KKPOp0BvxxLpc7Uc6g0Zd8ohw
	YN6aGTnpb4wk3bUNuGRY3bu65Ms60Ix6nCOnKfak4cKUFE7Ekd0HI8n4jUiIvo0ppKKi+LytLsm
	zaBH6pWmTmQT6OcWYgWph3azkgpJXYruEJmLen7fDntFyfWNnpRc81nYrva6HH3e3CJFLpxJ+ta
	w5APe5M0+4/fVVY5WpLyv+zVr38meNEpLIh4o6xsUnwtwoaoWQhptctIdlaF4HNpe64/2GO7sPE
	MUyQObMNdXpNj/umos28W19tZSQlxoNQYF/T9nTFSwfh4UmyuZLERTu0AvF9cCtN5dFbayJage5
	dD03hiPd34FWXDwvpSpXxixvVivZL73pVJmIQePPqqNakEkNdivRu/yu1Lrw==
X-Received: by 2002:a05:6a00:3a0d:b0:837:8c8f:8f51 with SMTP id d2e1a72fcca58-8415f3bdb92mr20798104b3a.47.1779852696430;
        Tue, 26 May 2026 20:31:36 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:35 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 11/11] loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:17 +0800
Message-ID: <20260527032917.3385849-12-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_043138_117756_80FBD858 
X-CRM114-Status: GOOD (  11.57  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to LoongArch
kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..4b918c3d4a28 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


