Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F27CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uewrEsj0ZjEAk2x/Pk2ITnSJY3Gqt9vqmVdLwg6RP/I=; b=u2bQ7HK+BP3NYahUD3v9JM0JFk
	EUFXGb8+PxfesVCxy3s8+2yoQaoCrzT2Uprth8IpbXBIA8T2fq/pijXcg6GcNUAtErdshPwCVT2NF
	unvrviEHDkpQp/QX0cf6nJyY/f/WfdP8J7+UfGZ7YJn+MTYNVkTa7LHRjTkjIW/U9ESBEtaGp8IJQ
	m06UziflOxcrYwpBJBDUbbon4jYKHOZ/rgSl5XP3wY7aeKyR8Ud7rTBtnYOkxVGWMpv4/IYeM9FPu
	QVJCLibjFjYfmZ9EYmHfr4h9P0t6/unHJ7+staMjsTU1ugJPfEGPubJfC0EjHPjsqhbQbt4bUcmB+
	R7BdQA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd65-0000000473E-1Yhm;
	Wed, 20 May 2026 09:20:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd63-0000000470n-3S9t
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uewrEsj0ZjEAk2x/Pk2ITnSJY3Gqt9vqmVdLwg6RP/I=; b=MdJoLlU5kgukdaMEPeB2SwmJ0g
	vMa7bgAp0ZMh8ShCJ79vBkvnmNjss/l575Yy4BDn96vhH2onE50ePL5/MFMB+pyoqLIVxzlHt8Zuw
	JFZzNqhyrTFFSsBeaPjzhNMPgj2NXUBJudXgQDB7GR0jET3bbLvWdB+xul9lHBCyLq+c0743EmS/Q
	x10l+sT/lRZ57ywLxIEUD++Waq4ilyxTsRnmGHVkE2y7WZbNU9maeAvmn6feqDWOvAKiCYBII3OjP
	0s13fjBy8wU+LLSqHJaVtjgvSkN1NjulcY1JvUUPR9okjprLbUTdOoDENf3ySqNbZXMN7/pXWRUbJ
	wYKJ+X9Q==;
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5w-0000000GKRV-1jZd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:08 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so2046577b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 02:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268802; x=1779873602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uewrEsj0ZjEAk2x/Pk2ITnSJY3Gqt9vqmVdLwg6RP/I=;
        b=qqQep14R8ot0SxRFzxEURMD6fXKma83dOZJEDjxEJ9oDwmhfRLbujJBaCjWzSF0swu
         vfv2vQNbK2zk2UXBa7ihXxSEH86CaBayUsZYqYdW5G/hKGHUi3xdAyfXmqMy+zE3BHJH
         FaMd03++s34WhHk/WtWFOOUvErcdZNLJS+tyawnHDzVgglBZJRuwEzyDPUctwmvCuCKu
         PcQcrb2lKp8efuqUqgIYA7i7Zwv14s+wknq0sFkcV53b0pDAW5SIRON/nWUKwEEFoeYs
         /D57ml8t6NWsCXIrWSsUPPh/FMME7LAdRlBmMTFJOJsN+PmEhBddRxvZ9pZZWpe4XINR
         6Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268802; x=1779873602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uewrEsj0ZjEAk2x/Pk2ITnSJY3Gqt9vqmVdLwg6RP/I=;
        b=C3scFRHyxaPM2MatJ9f4e0btI2dlHfRDMyBAHGJL8qwi4rS76GnwFcOBAp7+BVsWCO
         gAeDGfMT7HsKLegXerPTM1n8wZgfleqq/6p/qIf7xis0KZliSxhOmvjQPaowAUiIv9nQ
         Rk4keGilo8ExifrupI0Tvk6wNcyIV7I4LU3GcuI/X9V7oBuzaisiu96vzCxRsnob3JuO
         sTS/KV4XlTvQq4rhx3uRVfVeCzu8+sgWitbdTJS3vaxTB2G/vnFYbipGGuSHKA9kDb4l
         Ufwv2Ux6MFuJz/m6XmaBnv2hdb91m0KooWuU1euKDc2n7JzZujMLhS+TUMFfQgeUsJE9
         8j4A==
X-Gm-Message-State: AOJu0YzQkKB/esvheNWkVSm5IY1b9XmG/SOf1ZbiDJY0PeFyq3sl3FOz
	kj0V7w9N1TFyeswuwXMMZSUy/UXbdcjHKrjn8CxyRRSoKVk4Au/NtyYv1n0l0qCFIPzjNpMR
X-Gm-Gg: Acq92OG/s5isDNq2ULvpZS69ayRnsQ6lR+IJ4F+kOrzuKH1IRfgOZrM56HSZ4O01yzn
	BQAMeVKJL9q/PHHBQOjhzG4pz5rLJFULXDKGJZrs2c8sslwThLISS8bPEc3aIMz1sl1e8gQ/qP1
	9+NUqs9QVTp/1RfIHx/nxonJGDitj91Y7ViB/sNqesh25Y1gXgxMfERkX/ePm6X67Lx5F+1ZvX3
	emRCe45OWw6+cKgVSMSS4tRhjCc9aobLZ4JBLMFp9cwfrIu5C97RvAOC432ifSlic53yT4xT/wP
	Joqq1Jq9GRmRUXLF/NDzHLsJ7ry6KRPs/CSeCfmdkAWjti7GGYEOWU6JDQXIchSW6b4qGqqZTlt
	hLOD+RxlfTddUiynneANRl2coai4gqQTZYj1YaSRTGfBkuZtsRQ9U8rMq2yvMSJtrgFh73w7ScK
	Y4Dsii0jdpeRClQb3MxLjM5u0SmcFhTC3IDT5xTQ==
X-Received: by 2002:a05:6a00:1954:b0:835:366f:5da2 with SMTP id d2e1a72fcca58-83f33d80937mr23397364b3a.37.1779268802457;
        Wed, 20 May 2026 02:20:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:02 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
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
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 6/8] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:42 +0800
Message-ID: <20260520091844.592753-7-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102007_391307_F10A7B13 
X-CRM114-Status: GOOD (  12.16  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Reserved memory regions are excluded from vmcore by default unless
marked dumpable. Honor the dumpable flag to filter out device firmware
regions (e.g., GPU, DSP, modem) reserved via device tree, since they
typically contain data not useful for kernel crash analysis and can
significantly increase vmcore size.

Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..1d65320c6ba4 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
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


