Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF78C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTBZpbSvsidLVDHHiShy9f+wnGid6sRS2qRO19KqwKw=; b=nZKGOqETmgFQFOqXqWkfDz0EMu
	PjOjhTEUQuRtcyoU32B2uMvWK0D/NJtlVIjc4bbg95P60arpQN1/PyH43IF5QXuN2mnYrqKZawgni
	8uizzseNIHiuln8F6o5bR6HcvXN6QVuvovH0n8BL+InDwdcNn3l/FgqyYPSdm/GqWzZvvgmMGck2u
	SjtguqMAJZYm8tqdTTKLCNTYaJgSfThphqfE8ejAJxsRsnvuaFqVM8yOQhmIStJTqjF1hpz5SUVUC
	+RYgbyqeY9GI4iKOyJkIEORf3cXjN4XA4/36yss3aD0yxJT0EJODBj3J6TSxeW2by10OxSMAsw1U+
	j9cKjNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fTO-0000000DwwW-3p4G;
	Wed, 02 Sep 2026 07:33:30 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fTB-0000000Dwmt-1LA6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:33:23 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so361505a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334397; x=1788939197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTBZpbSvsidLVDHHiShy9f+wnGid6sRS2qRO19KqwKw=;
        b=NpdRcoLMRBJCdmLHNtRfXs3J9NarQ48ptrCBwogV0wbGKOqLjHDn/lgox7WkWQeGgV
         v6/qFCptlOyr3NgRX9kDbGXYVOwLNBQ0bjo5kPSliEqJy89SvQuMP2Fi4vf3P2E3cU6V
         cwIjhX3syemevrQQyB5ByE6n/k2nmRV2KwpNmqe5a11TJpoFNaMSrYIcc1rt8tii2N7A
         jOB2ezDilmJv/nUucG098+0cUw9axV39GTHahjxWOUDWnEgpiGt+USNWVWwbZDdIN8Sp
         jl6QnSJRiSIw9T+zUqfwklbSbfPgiKYfrR6Cl3gh73lhf3V2KJTolRfNRZJSBRWo7bRD
         4ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334397; x=1788939197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTBZpbSvsidLVDHHiShy9f+wnGid6sRS2qRO19KqwKw=;
        b=BMTvP8sqqF01VEg5HETyb37sYHfLj4ooeLRv6w1h+1oo8N77uD2xUHzNHC/t3F1ylP
         Hje0ZmQXUio6vLxZvcRbljWq9KHTtoILSECH1vhLNFgo8Yua/5yPbejKEVxaBs9Mebmp
         BDjlNUcXXZWOozCXAL5fj7Xsrw9/mIv4cigiBeq/L4WIP81YndYm0TPaKEouy2Tlx+yn
         S0FBx+xevM61uoQzuIrQVS1tZbTUSavrqRfZ8quAz06/aWVydXEiOAcoCPIgavoD0dTy
         +jmLBIZvnSKyXC7ExHQ2SsSiAMWJx2yH8SIM1zgctAyAb9usnQFv60E+LgzZX4PKM7z0
         iC4A==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4dQ4S53msN8KPnQgcMcxoL/Oe9TTlCLvEewrsBgaLZjZ2FWx8rYiPHGxqqG2lr4vP4M0xNAan9MCW89KQ3Qb@lists.infradead.org
X-Gm-Message-State: AFuF++kZ1u6PVNMgdi3btGN7xby4LOz8scYWMV5rKUS+p/6soyNpLpfc
	6X0r5q0OOuExAk1qBZCrKWi/cy2CkqiG3AzeJ+HrA+baxv9yacEonq3P
X-Gm-Gg: AYBFou1Iv4nVLyY8Atglkbo9w8tCEubHgFsE5Pf0lGMf6R3RxelNd9G3Ycv5UpGU7y0
	PI4MGDYDypg6L52aVvUwWjUOUP02ZQtQfEgc3kaJC4msy8+XQ93ZUdwklNq2Fjk9uNWqqfkZDqF
	M2bip21P1SehZ5yxQxYnDkoB5kmBPVu7MTBs+/R5GceGeJDtzWASLD1Kr58yHNJXX/1EuZkeodz
	A2Fj8+s8yFDPHb4imtHQxb6gl869OUgUGLcuLpAPHIo8vyw6J1miK8wnBQxJg3nfh6fSyvTdBvh
	+PTTy5QFEaLRfclm+iLlM7Wry/aaywHhID5Qw9tuaSJ1MD/O3KK8V8CyKlfJKN8l9yq2ROzeusA
	fp2JWZ67cQleSJMJGi2KP4aD90ZfdL5Gfi3G1nzKDC8TzgpYfQs9r0Uw8yOikZb528HfUtyC1UE
	ue4Kd0JQ0qmXT5pPtVmkZbIpLMP1y8eZRSRTjv1hRXp20gCXItwf7wB7S5us9aFJesjOnNBHbnS
	YWG6W28wlg=
X-Received: by 2002:a05:6a00:4f83:b0:857:72f8:dc99 with SMTP id d2e1a72fcca58-85ed8fd714cmr4354975b3a.26.1788334396619;
        Wed, 02 Sep 2026 00:33:16 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:14 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 08/10] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Wed,  2 Sep 2026 15:31:14 +0800
Message-ID: <20260902073116.802752-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003321_025584_DF099240 
X-CRM114-Status: GOOD (  14.93  )
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

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..286fd4db6312 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0


