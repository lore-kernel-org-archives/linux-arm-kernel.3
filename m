Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76946C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=; b=gXicsfOmhOlv51hvLWni+0sgGp
	XMrzWe0kfh2MbsZ73vwZmn1sZebEnlhQsryxmubu5DBK118tes0Ts66uZA88YpdVj45qMR4hmi8Mx
	lyHyEkdn2f1HVYZWH/ltsp5ARPby2i9QOrnzxUEZBWCUMw9IDsI9xRynRBJ5v6M/sGsagUVBnFOPf
	KmX6/L3cs6l/ZveNndxR5E0FHjqVwf3o0CrXS2bczs8YMzycdqwoJQ/JnqUD9Xp7IQsoKFBltUuDZ
	+Mfx6KyOUEyBo+RUD3zP5gD8UMM0mk6m3hU67YyHSWt6iVdPudgdzPH3FyAAjkEfvDi4zU+zmzbil
	7C/9eSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCJ-0000000G9SR-0C8d;
	Tue, 30 Jun 2026 07:47:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCG-0000000G9Q5-2iLk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=; b=GmX/+I6asoC9Mq6kVsZZp8edSD
	HCY6Nxtt1PnM0sXa7nOuPfAdFQaWONbfeDG0agnUpnUKuJ2Ypk8RJDyisZTDWkDl6iFf4wZg6Ld29
	I/2i8qe1Hes9ogo0pn/GAs2qE+n0Z4r6XNGNW8ndsUSHBYDjMPN1ymIq5hctgsN7CpE/B64MCm8De
	5gG8F2brffD1T6CmFvke50ZKuyCL6LKtfnNxVJyYyFArf2TO0aqDtZkUHXeJU27ATOiMqcB5RQliY
	u1ovTdeXkL1MNaVmTrTDyLCmcv5ToNYUlfbLqodZ9D8I8QeR87fAgooYPIOztNNt0q9GnxjEDr3+V
	d/69Dg3A==;
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weTCB-00000001ciH-2S84
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:47:55 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2c9e8a1d256so19539155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805670; x=1783410470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=exiXf7Vl+YDVzh2Opvq+TtCkeEWiwIFiFMN4ZwrUAmt95ssa1NSHcGYn405e86Y72D
         eLYABWiNZblsb6oBpncKjD2VJRVrrzLleXe9jdJaJYqZu77YO2gQBLRIUUeOw0SepnfC
         1zUgDF+SPXVun2siL7hWlSFEdhyeJrf7URRXcVCUxudIIMV1KBrKgTvopB9eMneQgc7A
         cKe50DaBA3m8q87nT8wHvxiYjQMOkKjZk4vc0W98GnU8MXjW2iotwARPQfpn9deIMUyI
         SMFu+RD14kD0cKIpf3F7yZ7JgKv7T1lmiG9DFtM9ZCeDCzzMFxeC3fx/m2ZI2R5kWqi4
         kMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805670; x=1783410470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=kbdwqHXW3W5tsIld5sHAGHv3NuB/YI+6XnUxuvQnNvFAxFE5XbQ3wpmGWUxqBaQbef
         ff6/NFP5+3FdsGromxHHFfX32VfmkuOkoPxKbqa2DYTtBQRI93OwtpR7S1r6LoLCXKF5
         Gs+WO8XBW6di4nKwCIhqrXnx40xbe8nWiHGUeGWMm1fdYjlTTGQi23DAcUMYMrrGFGVc
         kUB8CAJTHxvq6nivL20TatYosK8uPoGxKEh86DKkJPYdUms33dbwW9zWjke7UnXCFD0J
         siAjunBYbi+3Ix0cd+QVqTJiDUTzpLO/hzY2zErZkJO1sGlzBcV0EBvKNbgvx7jT1HDd
         F96g==
X-Forwarded-Encrypted: i=1; AHgh+RpH1W6j9SDLQBDNvvr7EdIoQJj9QfSh39xQiyH2W7Q5PDxi1/SqZUUqzRP7jNhEMFfHdHEwF0f5FbQJnyKIfDkB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx62vb2rBvvjzAdnEUwSldNpuTNExqpyYeHIPdHSHEBC8X/cCjb
	wxO7ttIVRm8vtC1QXwkb+fSAOL2mcGfyGBDpxK5byNLeDLsdfrlgscrITXh6uFgnU4w=
X-Gm-Gg: AfdE7cnxf54SHsJ0IJt+JdF1EEmHcqlFJlhDItpkFlPWUrbl3wkm+Vlsbtpj+k8fli7
	6Xj+tTL24JoDDsrQ85FwQMlS2gM/pPKle/pg3LnFxu1RmWHNFeuy+STY5xCdzgo0V/bYk/OCbnD
	w1IfeNv6E8r8czWlfDzY0YwZWQK4K1hxqrw0MclZXUCPfgmxGwtlszt4cCiAcl8JqYiQax2Yj4h
	rVAv58DGJCMnZmeLqBYK6LfZ5+N+WmtilbXy3BaDpClbvwSRFAvmNKVSMvgiG0DqJ4uDmJ8NJiJ
	zIFxLahlo8K20bS3KpsIhGgVtfrZWyBczjlsHh/mJnLcKjfvq/3mHImjHQP2bKJ9L90J4t+Yvmh
	VgEgw0vsUnW+/xE4Gp/wrmnHQtFupTuBx+t7WHm/zqmplmYrGF+B7NXEQzAPYLunDI4agN+m245
	KA/6Wnm5Us6rSRaAqoZI4zP7AShw==
X-Received: by 2002:a17:903:41d1:b0:2c9:97a9:209b with SMTP id d9443c01a7336-2ca2ed32417mr20077795ad.47.1782805669781;
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 02/10] of: reserved_mem: dedup and relocate reserved-memory messages
Date: Tue, 30 Jun 2026 15:47:06 +0800
Message-ID: <20260630074715.4126796-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084752_062160_74B3B2F8 
X-CRM114-Status: GOOD (  12.56  )
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

In both fdt_scan_reserved_mem and fdt_scan_reserved_mem_late, there
are identical check-related print messages. Consolidate these messages
by moving them all into the fdt_scan_reserved_mem function.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 82222bd45ac6..42649dc3613f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -270,19 +270,15 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		pr_info("Reserved memory: No reserved-memory node in the DT\n");
+	if (node < 0)
 		return;
-	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
 	if (alloc_reserved_mem_array())
 		return;
 
-	if (__reserved_mem_check_root(node)) {
-		pr_err("Reserved memory: unsupported node format, ignoring\n");
+	if (__reserved_mem_check_root(node))
 		return;
-	}
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const __be32 *prop;
@@ -337,6 +333,7 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
+		pr_info("Reserved memory: No reserved-memory node in the DT\n");
 		total_reserved_mem_cnt = 0;
 		return -ENODEV;
 	}
-- 
2.43.0


